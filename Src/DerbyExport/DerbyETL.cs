using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using DerbyExport.DB;
using Excel = Microsoft.Office.Interop.Excel;

namespace DerbyExport
{
    public class DerbyETL
    {
        const int MaxRows = 1000;

        const string PlayerSheet = "Export_IGRF";
        const string ScoreSheet = "Export_Score";
        const string PenaltySheet = "Export_Penalties";
        const string LineupSheet = "Export_Lineups";

        string _file;
        SlowJamsDB _db;
        bool _verbose;

        DateTime _gameDate = default(DateTime);
        List<PlayerImport> _players = new List<PlayerImport>();
        List<ScoreImport> _scores = new List<ScoreImport>();
        List<LineupImport> _lineups = new List<LineupImport>();
        List<PenaltyImport> _penalties = new List<PenaltyImport>();
        string _homeLeage = string.Empty;
        string _homeTeam = string.Empty;
        string _awayLeague = string.Empty;
        string _awayTeam = string.Empty;
        double _homeTeamAveragePoints;
        double _awayTeamAveragePoints;
        double _medianPoints;

        public DerbyETL(string filePath, string dbConnection, bool verboseErrors = false)
        {
            if (!File.Exists(filePath))
            {
                throw new ArgumentException("That file doesn't exist.");
            }

            _file = filePath;
            _db = new SlowJamsDB(dbConnection);
            _verbose = verboseErrors;
        }

        public void Extract()
        {
            var excel = new Excel.Application();
            excel.Visible = false;
            excel.DisplayAlerts = false;

            var workbook = excel.Workbooks.Open(_file, ReadOnly: true);

            dynamic worksheet = null;

            try
            {            
                // Extract players
                worksheet = workbook.Worksheets[PlayerSheet];
                var range = worksheet.Range["A2:F42"];

                // Get Team Info
                _homeLeage = worksheet.Cells[2, 9].Value2.ToString();
                _homeTeam = worksheet.Cells[2, 10].Value2.ToString();
                _awayLeague = worksheet.Cells[3, 9].Value2.ToString();
                _awayTeam = worksheet.Cells[3, 10].Value2.ToString();

                // Get Player Info
                foreach (var row in range.Rows)
                {
                    var nameRef = row.Cells[6].Value2;
                    var numberRef = row.Cells[5].Value2;
                    if (nameRef == null || numberRef == null)
                        break;

                    if (nameRef.ToString() != "0" && numberRef.ToString() != "")
                    {
                        var name = nameRef.ToString();
                        var number = numberRef.ToString();
                        var league = row.Cells[3].Value2.ToString();
                        var team = row.Cells[4].Value2.ToString();
                        if (_gameDate == default(DateTime))
                        {
                            var oaDate = DateTime.FromOADate((double)row.Cells[1].Value2);
                            var oaTime = DateTime.FromOADate((double)row.Cells[2].Value2);
                            _gameDate = DateTime.ParseExact(oaDate.ToString("yyyy-MM-dd") + " " + oaTime.ToString("hh:mm:ss"), "yyyy-MM-dd hh:mm:ss", CultureInfo.InvariantCulture);

                            //_gameDate = DateTime.ParseExact(DateTime.FromOADate((double)row.Cells[1].Value2).ToString("yyyy-MM-dd ") + DateTime.FromOADate((double)row.Cells[2].Value2).TimeOfDay.ToString("hh:mm:ss"), "yyyy-MM-dd hh:mm:ss", CultureInfo.InvariantCulture);
                        }

                        if (_players.Count(p => string.Equals(p.League, league) && string.Equals(p.Team, team) && string.Equals(p.DerbyName, name) && string.Equals(p.Number, number) && DateTime.Equals(p.GameDateTime, _gameDate)) == 0)
                        {
                            _players.Add(new PlayerImport()
                                {
                                    GameDateTime = _gameDate,
                                    League = league,
                                    Team = team,
                                    DerbyName = name,
                                    Number = number
                                });
                        }
                    }
                }

                ReleaseComObject(worksheet);
                
                // Extract Score
                worksheet = workbook.Worksheets[ScoreSheet];
                // Just guessing that no more than 1000 score rows will be in use
                string rangeSelect = string.Format("A2:S{0}", MaxRows);
                range = worksheet.Range[rangeSelect];

                foreach (var row in range.Rows)
                {
                    var teamRef = row.Cells[5].Value2;
                    if (teamRef == null || teamRef.ToString() == string.Empty)
                        break;
                    var team = teamRef.ToString();                    
                    var period = (short)row.Cells[3].Value2;
                    var jam = (short)row.Cells[4].Value2;
                    var number = row.Cells[6].Value2.ToString();
                    bool isLead = row.Cells[7].Value2.ToString().ToUpper() == "YES";
                    bool calledJam = row.Cells[8].Value2.ToString().ToUpper() == "YES";
                    var passes = (short)row.Cells[9].Value2;
                    short points = 0;
                    short.TryParse(row.Cells[10].Value2.ToString(), out points);
                    bool passOccurred = row.Cells[11].Value2.ToString().ToUpper() == "TRUE";
                    bool isHomeTeam = row.Cells[12].Value2.ToString().ToUpper() == "TRUE";

                    if (jam != 0 && (number ?? string.Empty) != string.Empty)
                    {
                        _scores.Add(new ScoreImport()
                            {
                                GameDateTime = _gameDate,
                                CalledJam = calledJam,
                                IsHomeTeam = isHomeTeam,
                                Jam = jam,
                                JammerNumber = number,
                                LeadJammer = isLead,
                                PassOccurred = passOccurred,
                                Passes = passes,
                                Points = points,
                                Period = period,
                                Team = team
                            });
                    }
                }

                ReleaseComObject(worksheet);

                // Extract Lineups
                worksheet = workbook.Worksheets[LineupSheet];
                rangeSelect = string.Format("A2:V{0}", MaxRows);
                range = worksheet.Range[rangeSelect];

                foreach (var row in range.Rows)
                {
                    var teamRef = row.Cells[5].Value2;
                    if (teamRef == null || teamRef.ToString() == string.Empty)
                        break;
                    var team = teamRef.ToString();                    
                    
                    var period = (short)row.Cells[3].Value2;
                    var jam = (short)row.Cells[4].Value2;
                    var jammer = row.Cells[6].Value2.ToString();
                    var jbox = row.Cells[7].Value2.ToString();
                    short jp = 0;
                    short.TryParse(row.Cells[8].Value2.ToString(), out jp);
                    var pivot = row.Cells[9].Value2.ToString();
                    var pbox = row.Cells[10].Value2.ToString();
                    short pp = 0;
                    short.TryParse(row.Cells[11].Value2.ToString(), out pp);
                    var b1 = row.Cells[12].Value2.ToString();
                    var b1box = row.Cells[13].Value2.ToString();
                    short b1p = 0;
                    short.TryParse(row.Cells[14].Value2.ToString(), out b1p);
                    var b2 = row.Cells[15].Value2.ToString();
                    var b2box = row.Cells[16].Value2.ToString();
                    short b2p = 0;
                    short.TryParse(row.Cells[17].Value2.ToString(), out b2p);
                    var b3 = row.Cells[18].Value2.ToString();
                    var b3box = row.Cells[19].Value2.ToString();
                    short b3p = 0;
                    short.TryParse(row.Cells[20].Value2.ToString(), out b3p);
                    bool passOccurred = row.Cells[21].Value2.ToString().ToUpper() == "TRUE";
                    bool isHomeTeam = row.Cells[22].Value2.ToString().ToUpper() == "TRUE";

                    if (jam != 0 && (jammer ?? string.Empty) != string.Empty)
                    {
                        _lineups.Add(new LineupImport()
                        {
                            Blocker1Box = (b1box == "0") ? string.Empty : b1box,
                            Blocker2Box = (b2box == "0") ? string.Empty : b2box,
                            Blocker3Box = (b3box == "0") ? string.Empty : b3box,
                            JammerBox = (jbox == "0") ? string.Empty : jbox,                            
                            PivotBox = (pbox == "0") ? string.Empty : pbox,                            
                            Blocker1Number = b1,
                            Blocker2Number = b2,
                            Blocker3Number = b3,
                            JammerNumber = jammer,
                            PivotNumber = pivot,
                            JammerPenalties = jp,
                            PivotPenalties = pp,
                            Blocker1Penalties = b1p,
                            Blocker2Penalties = b2p,
                            Blocker3Penalties = b3p,
                            GameDateTime = _gameDate,
                            IsHomeTeam = isHomeTeam,
                            Jam = jam,
                            PassOccurred = passOccurred,
                            Period = period,
                            Team = team
                        });
                    }
                }

                ReleaseComObject(worksheet);

                // Extract Penalties
                worksheet = workbook.Worksheets[PenaltySheet];
                rangeSelect = string.Format("A2:I{0}", MaxRows);
                range = worksheet.Range[rangeSelect];

                foreach (var row in range.Rows)
                {
                    var teamRef = row.Cells[4].Value2;
                    if (teamRef == null || teamRef.ToString() == string.Empty)
                        break;
                    var team = teamRef.ToString();                    
                    
                    var period = (short)row.Cells[3].Value2;
                    var jam = (short)row.Cells[5].Value2;
                    var number = row.Cells[6].Value2.ToString();
                    var penaltyId = (short)row.Cells[7].Value2;
                    var penalty = row.Cells[8].Value2.ToString();
                    var penaltyName = row.Cells[9].Value2.ToString();

                    if (penaltyId != 0 && (penaltyName ?? string.Empty) != string.Empty)
                    {
                        _penalties.Add(new PenaltyImport()
                            {
                                GameDateTime = _gameDate,
                                Jam = jam,
                                PenaltyId = penaltyId,
                                PenaltyName = penaltyName,
                                PenaltyType = penalty,
                                Period = period,
                                PlayerNumber = number,
                                Team = team
                            });
                    }
                }
            }
            finally
            {
                ReleaseComObject(worksheet);
                worksheet = null;
                ReleaseComObject(workbook);
                workbook = null;
                excel.Quit();

                ReleaseComObject(excel);
                excel = null;
            }
        }

        public void Transform()
        {
            var currentPlayers = _db.GetCurrentPlayerAffiliation(_gameDate).ToList();
            HashSet<string> defaultableLeagues = new HashSet<string>(StringComparer.OrdinalIgnoreCase);

            foreach (var player in _players)
            {
                var existing = (from affiliation in currentPlayers
                                where string.Equals(affiliation.League, player.League, StringComparison.OrdinalIgnoreCase) &&
                                      string.Equals(affiliation.Number, player.Number, StringComparison.OrdinalIgnoreCase) &&
                                      string.Equals(affiliation.DerbyName, player.DerbyName, StringComparison.OrdinalIgnoreCase)
                                select affiliation).FirstOrDefault();

                if (existing != null)
                {
                    player.PlayerId = existing.PlayerId;
                }
                else
                {
                    var leaguenumbermatches = from affiliation in currentPlayers
                                              where string.Equals(affiliation.League, player.League, StringComparison.OrdinalIgnoreCase) &&
                                                    string.Equals(affiliation.Number, player.Number, StringComparison.OrdinalIgnoreCase)
                                              select affiliation;
                    bool noMatch = true;
                    foreach (var match in leaguenumbermatches)
                    {
                        Console.Write(string.Format("Is {0} the same person as {1} (both share number {2} in this league)? [Y/N]", player.DerbyName, match.DerbyName, match.Number));
                        while (noMatch)
                        {
                            var key = Console.ReadKey(true);
                            if (key.Key == ConsoleKey.Y)
                            {
                                player.PlayerId = match.PlayerId;
                                noMatch = false;

                                _db.UpdatePlayerAffiliation(player.PlayerId, player.League, player.Number, match.DerbyName, player.DerbyName, _gameDate);
                                Console.WriteLine();
                            }
                            else if (key.Key == ConsoleKey.N)
                            {
                                Console.WriteLine();
                                break;
                            }
                        }
                        if (!noMatch)
                        {
                            break;
                        }
                    }
                    currentPlayers = _db.GetCurrentPlayerAffiliation(_gameDate).ToList();

                    if (noMatch)
                    {
                        var nameMatches = from affiliation in currentPlayers
                                          where string.Equals(affiliation.DerbyName, player.DerbyName)
                                          select affiliation;

                        foreach (var match in nameMatches)
                        {
                            Console.Write(string.Format("Is {0} with number {1} from league {2} the same as {0} with number {3} from league {4}?", match.DerbyName, match.Number, match.League, player.Number, player.League));

                            while (noMatch)
                            {
                                var key = Console.ReadKey(true);
                                if (key.Key == ConsoleKey.Y)
                                {
                                    player.PlayerId = match.PlayerId;
                                    noMatch = false;

                                    // TODO: Check if this is necessary, since this is a new affiliation
                                    _db.UpdatePlayerAffiliation(player.PlayerId, player.League, player.Number, match.DerbyName, player.DerbyName, _gameDate);

                                    // TODO: Confirm if affiliation is permanent, or just for the current game
                                    // If temporary, affiliation row is effective/expired for current GameDateTime, with prior affiliation
                                    // re-activated for future time range.

                                    Console.WriteLine();
                                }
                                else if (key.Key == ConsoleKey.N)
                                {
                                    Console.WriteLine();
                                    break;
                                }
                            }
                            if (!noMatch)
                            {
                                break;
                            }
                        }
                        currentPlayers = _db.GetCurrentPlayerAffiliation(_gameDate).ToList();
                    }

                    if (noMatch)
                    {
                        // New player
                        if (defaultableLeagues.Contains(player.League))
                        {
                            currentPlayers.Add(CreateNewPlayer(player, "Bonnie", "Thunders", string.Empty, string.Empty));
                        }
                        else
                        {
                            Console.WriteLine(string.Format("Player {0}, number {1} not found in database.", player.DerbyName, player.Number));
                            Console.Write(string.Format("Is this a new player? ([Y]es/[N]o/[D]efault all players from league {0}.", player.League));

                            while (noMatch)
                            {
                                var key = Console.ReadKey(true);
                                if (key.Key == ConsoleKey.Y)
                                {
                                    Console.WriteLine();
                                    Console.Write("Enter player's real first name: ");
                                    string firstName = Console.ReadLine();
                                    Console.Write("Enter player's real last name: ");
                                    string lastName = Console.ReadLine();
                                    Console.Write("Enter player's email (hit [Enter] for none): ");
                                    string email = Console.ReadLine();
                                    if (string.IsNullOrWhiteSpace(email))
                                    {
                                        email = string.Empty;
                                    }
                                    Console.Write("Enter player's phone number (hit [Enter] for none): ");
                                    string phone = Console.ReadLine();
                                    if (string.IsNullOrWhiteSpace(phone))
                                    {
                                        phone = string.Empty;
                                    }

                                    currentPlayers.Add(CreateNewPlayer(player, firstName, lastName, email, phone));
                                    noMatch = false;
                                }
                                else if (key.Key == ConsoleKey.N)
                                {
                                    while (true)
                                    {
                                        Console.WriteLine();
                                        Console.Write("Enter the PlayerId for this player: ");
                                        int playerId = 0;
                                        string playerIdStr = Console.ReadLine();
                                        if (int.TryParse(playerIdStr, out playerId))
                                        {
                                            if (_db.UpdatePlayerAffiliation(playerId, player.League, player.Number, string.Empty, player.DerbyName, _gameDate))
                                            {
                                                player.PlayerId = playerId;
                                                currentPlayers.Add(new PlayerAffiliation()
                                                    {
                                                        DerbyName = player.DerbyName,
                                                        EffectiveDate = _gameDate,
                                                        ExpiryDate = DateTime.ParseExact("9999-12-31", "yyyy-MM-dd", CultureInfo.InvariantCulture),
                                                        League = player.League,
                                                        Number = player.Number,
                                                        PlayerId = playerId
                                                    });
                                                break;
                                            }
                                            else
                                            {
                                                Console.WriteLine("That PlayerId doesn't exist in the database.");
                                            }
                                        }
                                    }
                                    noMatch = false;
                                }
                                else if (key.Key == ConsoleKey.D)
                                {
                                    defaultableLeagues.Add(player.League);
                                    currentPlayers.Add(CreateNewPlayer(player, "Bonnie", "Thunders", string.Empty, string.Empty));
                                    noMatch = false;
                                }
                            }
                            Console.WriteLine();
                        }
                    }
                }
            }
            
            // TODO: Capture input values for _homeTeamAveragePoints, _awayTeamAveragePoints, _medianPoints
        }

        public void Load()
        {
            _db.LoadIGRF(_players);
            _db.LoadLineups(_lineups);
            _db.LoadPenalties(_penalties);
            _db.LoadScore(_scores);

            var result = _db.CompleteETL("test", "test", "test", "test", 3.0, 2.0, 4.0, false);
        }

        public static void ReleaseComObject(object obj)
        {
            if (obj != null && Marshal.IsComObject(obj))
            {
                Marshal.ReleaseComObject(obj);
            }
            GC.Collect();
            GC.WaitForPendingFinalizers();
            GC.Collect();
            GC.WaitForPendingFinalizers();
        }

        private PlayerAffiliation CreateNewPlayer(PlayerImport player, string firstName, string lastName, string email, string phone)
        {
            int? newPlayerId = _db.CreatePlayer(player.DerbyName, firstName, lastName, email, phone);
            if (newPlayerId.HasValue)
            {
                player.PlayerId = newPlayerId.Value;
                _db.UpdatePlayerAffiliation(player.PlayerId, player.League, player.Number, string.Empty, player.DerbyName, _gameDate);
                return new PlayerAffiliation()
                {
                    DerbyName = player.DerbyName,
                    EffectiveDate = _gameDate,
                    ExpiryDate = DateTime.ParseExact("9999-12-31", "yyyy-MM-dd", CultureInfo.InvariantCulture),
                    League = player.League,
                    Number = player.Number,
                    PlayerId = player.PlayerId
                };
            }
            else
            {
                return null;
            }
        }
    }
}
