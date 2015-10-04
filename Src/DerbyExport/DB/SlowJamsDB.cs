using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Dapper;
using System.Data;

namespace DerbyExport.DB
{
    public class SlowJamsDB
    {
        string _connection;

        public SlowJamsDB(string connectionString)
        {
            _connection = connectionString;
        }

        public IEnumerable<PlayerAffiliation> GetCurrentPlayerAffiliation(DateTime effectiveDate)
        {
            using (var db = GetOpenConnection())
            {
                return db.Query<PlayerAffiliation>("etl.GetActivePlayerAffiliations", new { EffectiveDate = effectiveDate }, commandType: CommandType.StoredProcedure);
            }
        }


        public bool UpdatePlayerAffiliation(int playerId, string league, string number, string oldDerbyName, string newDerbyName, DateTime effectiveDate)
        {
            bool playerIdValid = false;
            using (var db = GetOpenConnection())
            {
                DynamicParameters parameters = new DynamicParameters(new
                {
                    PlayerId = playerId,
                    League = league,
                    Number = number,
                    OldDerbyName = oldDerbyName,
                    NewDerbyName = newDerbyName,
                    EffectiveDate = effectiveDate
                });
                parameters.Add("PlayerIdValid", dbType: DbType.Boolean, direction: ParameterDirection.Output);

                db.Execute("etl.UpdatePlayerAffiliation", parameters, commandType: CommandType.StoredProcedure);

                playerIdValid = parameters.Get<bool>("PlayerIdValid");
            }
            return playerIdValid;
        }

        public int? CreatePlayer(string derbyName, string firstName, string lastName, string email, string phone)
        {
            int? playerId = null;
            using (var db = GetOpenConnection())
            {
                DynamicParameters parameters = new DynamicParameters(new {
                    DerbyName = derbyName,
                    FirstName = firstName,
                    LastName = lastName,
                    Email = email,
                    Phone = phone
                });
                parameters.Add("PlayerId", dbType: DbType.Int32, direction: ParameterDirection.Output);

                db.Execute("etl.CreatePlayer", parameters, commandType: CommandType.StoredProcedure);

                playerId = (int)parameters.Get<int>("PlayerId");
            }
            return playerId;
        }

        public void LoadIGRF(IEnumerable<PlayerImport> playerData)
        {
            var igrfTable = IGRFTableDefinition();

            foreach (var player in playerData)
            {
                igrfTable.Rows.Add(player.League, player.Team, player.Number, player.DerbyName, player.GameDateTime, player.PlayerId);
            }

            if (igrfTable.Rows.Count > 0)
            {
                using (var db = GetOpenConnection())
                using (var bulkCopy = new SqlBulkCopy(db))
                {
                    db.Execute("truncate table etl.IGRF;", commandType: CommandType.Text);

                    bulkCopy.DestinationTableName = "etl.IGRF";
                    bulkCopy.WriteToServer(igrfTable);
                }
            }
        }

        public void LoadLineups(IEnumerable<LineupImport> lineups)
        {
            var lineupTable = LineupsTableDefinition();

            foreach (var lineup in lineups)
            {
                lineupTable.Rows.Add(lineup.GameDateTime, lineup.Period, lineup.Jam, lineup.Team, lineup.JammerNumber, lineup.JammerBox, lineup.JammerPenalties,
                    lineup.PivotNumber, lineup.PivotBox, lineup.PivotPenalties, lineup.Blocker1Number, lineup.Blocker1Box, lineup.Blocker1Penalties, lineup.Blocker2Number,
                    lineup.Blocker2Box, lineup.Blocker2Penalties, lineup.Blocker3Number, lineup.Blocker3Box, lineup.Blocker3Penalties, lineup.PassOccurred, lineup.IsHomeTeam);
            }

            if (lineupTable.Rows.Count > 0)
            {
                using (var db = GetOpenConnection())
                using (var bulkCopy = new SqlBulkCopy(db))
                {
                    db.Execute("truncate table etl.Lineups;", commandType: CommandType.Text);

                    bulkCopy.DestinationTableName = "etl.Lineups";
                    bulkCopy.WriteToServer(lineupTable);
                }
            }
        }

        public void LoadPenalties(IEnumerable<PenaltyImport> penalties)
        {
            var penaltiesTable = PenaltiesTableDefinition();

            foreach (var penalty in penalties)
            {
                penaltiesTable.Rows.Add(penalty.GameDateTime, penalty.Period, penalty.Jam, penalty.Team, penalty.PlayerNumber, penalty.PenaltyId, penalty.PenaltyType, penalty.PenaltyName);
            }

            if (penaltiesTable.Rows.Count > 0)
            {
                using (var db = GetOpenConnection())
                using (var bulkCopy = new SqlBulkCopy(db))
                {
                    db.Execute("truncate table etl.Penalties;", commandType: CommandType.Text);

                    bulkCopy.DestinationTableName = "etl.Penalties";
                    bulkCopy.WriteToServer(penaltiesTable);
                }
            }
        }

        public void LoadScore(IEnumerable<ScoreImport> scores)
        {
            var scoreTable = ScoreTableDefinition();

            foreach (var score in scores)
            {
                scoreTable.Rows.Add(score.GameDateTime, score.Period, score.Jam, score.Team, score.JammerNumber, score.LeadJammer, score.CalledJam,
                    score.Passes, score.Points, score.PassOccurred, score.IsHomeTeam);
            }

            if (scoreTable.Rows.Count > 0)
            {
                using (var db = GetOpenConnection())
                using (var bulkCopy = new SqlBulkCopy(db))
                {
                    db.Execute("truncate table etl.Score;", commandType: CommandType.Text);

                    bulkCopy.DestinationTableName = "etl.Score";
                    bulkCopy.WriteToServer(scoreTable);
                }
            }
        }

        public string CompleteETL(string homeLeague, string homeTeam, string awayLeague, string awayTeam, double homeTeamAveragePoints, double awayTeamAveragePoints, double medianPoints, bool isScrimmage = false)
        {
            string result = string.Empty;
            using (var db = GetOpenConnection())
            {
                DynamicParameters parameters = new DynamicParameters(new
                {
                    HomeLeague = homeLeague,
                    HomeTeam = homeTeam,
                    AwayLeague = awayTeam,
                    AwayTeam = awayTeam,
                    HomeTeamAveragePoints = homeTeamAveragePoints,
                    AwayTeamAveragePoints = awayTeamAveragePoints,
                    MedianPoints = medianPoints,
                    IsScrimmage = isScrimmage
                });
                parameters.Add("Result", dbType: DbType.String, direction: ParameterDirection.Output, size: 255);

                db.Execute("etl.CompleteETL", parameters, commandType: CommandType.StoredProcedure);

                result = parameters.Get<string>("Result");
            }
            return result;
        }

        private DataTable IGRFTableDefinition()
        {
            var t = new DataTable();

            t.Columns.Add("League", typeof(string));
            t.Columns.Add("Team", typeof(string));
            t.Columns.Add("Number", typeof(string));
            t.Columns.Add("Name", typeof(string));
            t.Columns.Add("GameDateTime", typeof(DateTime));
            t.Columns.Add("PlayerId", typeof(int));

            return t;
        }

        private DataTable LineupsTableDefinition()
        {
            var t = new DataTable();

            t.Columns.Add("GameDateTime", typeof(DateTime));
            t.Columns.Add("Period", typeof(short));
            t.Columns.Add("Jam", typeof(short));
            t.Columns.Add("Team", typeof(string));
            t.Columns.Add("JammerNumber", typeof(string));
            t.Columns.Add("JammerBox", typeof(string));
            t.Columns.Add("JammerPenalties", typeof(short));
            t.Columns.Add("PivotNumber", typeof(string));
            t.Columns.Add("PivotBox", typeof(string));
            t.Columns.Add("PivotPenalties", typeof(short));
            t.Columns.Add("Blocker1Number", typeof(string));
            t.Columns.Add("Blocker1Box", typeof(string));
            t.Columns.Add("Blocker1Penalties", typeof(short));
            t.Columns.Add("Blocker2Number", typeof(string));
            t.Columns.Add("Blocker2Box", typeof(string));
            t.Columns.Add("Blocker2Penalties", typeof(short));
            t.Columns.Add("Blocker3Number", typeof(string));
            t.Columns.Add("Blocker3Box", typeof(string));
            t.Columns.Add("Blocker3Penalties", typeof(short));
            t.Columns.Add("PassOccurred", typeof(bool));
            t.Columns.Add("IsHomeTeam", typeof(bool));

            return t;
        }

        private DataTable PenaltiesTableDefinition()
        {
            var t = new DataTable();

            t.Columns.Add("GameDateTime", typeof(DateTime));
            t.Columns.Add("Period", typeof(short));
            t.Columns.Add("Jam", typeof(short));
            t.Columns.Add("Team", typeof(string));
            t.Columns.Add("PlayerNumber", typeof(string));
            t.Columns.Add("PenaltyId", typeof(short));
            t.Columns.Add("PenaltyType", typeof(string));
            t.Columns.Add("PenaltyName", typeof(string));

            return t;
        }

        private DataTable ScoreTableDefinition()
        {
            var t = new DataTable();

            t.Columns.Add("GameDateTime", typeof(DateTime));
            t.Columns.Add("Period", typeof(short));
            t.Columns.Add("Jam", typeof(short));
            t.Columns.Add("Team", typeof(string));
            t.Columns.Add("JammerNumber", typeof(string));
            t.Columns.Add("LeadJammer", typeof(bool));
            t.Columns.Add("CalledJam", typeof(bool));
            t.Columns.Add("Passes", typeof(short));
            t.Columns.Add("Points", typeof(short));
            t.Columns.Add("PassOccurred", typeof(bool));
            t.Columns.Add("IsHomeTeam", typeof(bool));

            return t;
        }

        private SqlConnection GetOpenConnection()
        {
            var db = new SqlConnection(_connection);
            db.Open();
            return db;
        }
    }
}
