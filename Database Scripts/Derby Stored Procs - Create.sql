USE SlowJams;
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[etl].[GetActivePlayerAffiliations]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [etl].[GetActivePlayerAffiliations] AS' 
END
GO

ALTER PROCEDURE etl.GetActivePlayerAffiliations
    @EffectiveDate datetime = NULL
AS
BEGIN

    IF (@EffectiveDate IS NULL)
        SET @EffectiveDate = GETDATE();

    SELECT  PlayerId, League, DerbyName, Number, EffectiveDate, ExpiryDate
      FROM  dbo.PlayerAffiliation
     WHERE  EffectiveDate <= @EffectiveDate AND ExpiryDate > @EffectiveDate;
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[etl].[UpdatePlayerAffiliation]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [etl].[UpdatePlayerAffiliation] AS' 
END
GO

ALTER PROCEDURE etl.UpdatePlayerAffiliation
    @PlayerId int,
    @League varchar(25),
    @Number varchar(25),
    @NewDerbyName  varchar(255),
    @OldDerbyName varchar(255),
    @EffectiveDate datetime,
    @PlayerIdValid bit OUTPUT
AS
BEGIN
    SET @PlayerIdValid = 0;
    IF (EXISTS (SELECT * FROM dbo.Player WHERE PlayerId = @PlayerId))
    BEGIN
        SET @PlayerIdValid = 1;
        IF (@NewDerbyName <> @OldDerbyName)
        BEGIN
            UPDATE  dbo.PlayerAffiliation
               SET  ExpiryDate = @EffectiveDate
             WHERE  PlayerId = @PlayerId AND League = @League AND Number = @Number AND DerbyName = @OldDerbyName;

            INSERT INTO dbo.PlayerAffiliation (PlayerId, League, DerbyName, Number, EffectiveDate, ExpiryDate)
              VALUES (@PlayerId, @League, @NewDerbyName, @Number, @EffectiveDate, '9999-12-31 23:59:59.997');
        END
    END
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[etl].[CreatePlayer]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [etl].[CreatePlayer] AS' 
END
GO

ALTER PROCEDURE etl.CreatePlayer
    @DerbyName nvarchar(255),
    @FirstName nvarchar(255),
    @LastName nvarchar(255),
    @Email nvarchar(255),
    @Phone nvarchar(255),
    @PlayerId int OUTPUT
AS
BEGIN
    INSERT INTO dbo.Player (DerbyName, FirstName, LastName, Email, Phone)
       VALUES (COALESCE(@DerbyName, ''), @FirstName, @LastName, @Email, @Phone);

    SET @PlayerId = SCOPE_IDENTITY();
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[etl].[CompleteETL]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [etl].[CompleteETL] AS' 
END
GO

ALTER PROCEDURE etl.CompleteETL
    @HomeLeague varchar(128),
    @HomeTeam varchar(128),
    @AwayLeague varchar(128),
    @AwayTeam varchar(128),
    @HomeTeamAveragePoints real,
    @AwayTeamAveragePoints real,
    @MedianPoints real,
    @IsScrimmage bit = 0,
    @Result varchar(255) OUTPUT
AS
BEGIN
    SET @Result = '';
    SET @HomeLeague = LTRIM(RTRIM(@HomeLeague));
    SET @HomeTeam = LTRIM(RTRIM(@HomeTeam));
    SET @AwayLeague = LTRIM(RTRIM(@AwayLeague));
    SET @AwayTeam = LTRIM(RTRIM(@AwayTeam));

    DECLARE @GameCount int;
    
    SELECT @GameCount = COUNT(DISTINCT GameDateTime) FROM etl.IGRF;

    -- Ensure only one game's data has been loaded.
    IF (@GameCount = 0)
    BEGIN
        SET @Result = 'No game data to load (etl.IGRF is empty).';
    END
    ELSE IF (@GameCount > 1)
    BEGIN
        SET @Result = 'More than one game''s data found in etl.IGRF.';
    END
    ELSE IF EXISTS (SELECT * FROM etl.IGRF WHERE PlayerId IS NULL)
    BEGIN
        SET @Result = 'etl.IGRF has rows with no PlayerId. Player/PlayerAffiliation must be mapped.';
    END
    ELSE
    BEGIN
        DECLARE @GameDateTime datetime;
        SELECT TOP 1 @GameDateTime = GameDateTime FROM etl.IGRF;

        IF (@HomeLeague = '')
            SET @Result = '@HomeLeague parameter has no value.';
        ELSE IF (@AwayLeague = '')
            SET @Result = '@AwayLeague parameter has no value.';
        ELSE IF (@HomeTeam = '')
            SET @Result = '@HomeTeam parameter has no value.';
        ELSE IF (@AwayTeam = '')
            SET @Result = '@AwayTeam parameter has no value.';
        ELSE IF (@HomeTeamAveragePoints <= 0)
            SET @Result = '@HomeTeamAveragePoints value invalid.';
        ELSE IF (@AwayTeamAveragePoints <= 0)
            SET @Result = '@AwayTeamAveragePoints value invalid.';
        ELSE IF (@MedianPoints <= 0)
            SET @Result = '@MedianPoints value invalid.';
        ELSE IF EXISTS (SELECT * FROM dbo.Game WHERE GameDateTime = @GameDateTime AND LeagueHome = @HomeLeague AND LeagueAway = @AwayLeague AND TeamHome = @HomeTeam AND TeamAway = @AwayTeam)
            SET @Result = 'Game data already exists in dbo.Game.';

        IF (@Result = '')
        BEGIN
            DECLARE @GameId int;
            INSERT INTO dbo.Game (GameDateTime, LeagueHome, TeamHome, LeagueAway, TeamAway, TeamHomeAvgPoints,
                                  TeamAwayAvgPoints, MedianPoints, IsScrimmage)
              VALUES (@GameDateTime, @HomeLeague, @HomeTeam, @AwayLeague, @AwayTeam, @HomeTeamAveragePoints,
                      @AwayTeamAveragePoints, @MedianPoints, @IsScrimmage);

            SELECT @GameId = SCOPE_IDENTITY();

            INSERT INTO dbo.GamePlayer (GameId, PlayerId, League, Team, DerbyName, Number)
            SELECT @GameId AS GameId, PlayerId, League, Team, Name AS DerbyName, Number
              FROM etl.IGRF;

            -- pivot Lineups to get GameJamPosition records
            WITH LineupNormalized AS
            (
                SELECT  GameDateTime, Period, Jam, Team, uPen.Number, uPen.Position, uPen.Box, uPen.Penalties
                  FROM  (
                            SELECT GameDateTime, Period, Jam, Team, PassOccurred,
                                   JammerNumber AS [Jammer], PivotNumber AS [Pivot], Blocker1Number AS Blocker1, Blocker2Number AS Blocker2, Blocker3Number AS Blocker3,
                                   JammerBox, PivotBox, Blocker1Box, Blocker2Box, Blocker3Box,
                                   JammerPenalties, PivotPenalties, Blocker1Penalties, Blocker2Penalties, Blocker3Penalties
                              FROM etl.Lineups
                        ) lineups UNPIVOT (
                            Number FOR Position IN (Jammer, [Pivot], Blocker1, Blocker2, Blocker3)
                        ) AS uPosition UNPIVOT (
                            Box FOR PositionBox IN (JammerBox, PivotBox, Blocker1Box, Blocker2Box, Blocker3Box)
                        ) AS uBox UNPIVOT (
                            Penalties FOR PositionPenalties IN (JammerPenalties, PivotPenalties, Blocker1Penalties, Blocker2Penalties, Blocker3Penalties)
                        ) AS uPen
                        --CROSS APPLY (
                        --    SELECT  CAST(MAX(CAST(PassOccurred AS smallint)) AS bit) AS PassOccurred
                        --      FROM  etl.Lineups
                        --     WHERE  GameDateTime = uPen.GameDateTime AND Period = uPen.Period AND Jam = uPen.Jam
                        --) xPass
                 WHERE  uPen.PassOccurred = 0 AND uPen.Position = SUBSTRING(uPen.PositionBox, 0, LEN(uPen.PositionBox) - 2)
                        AND uPen.Position = SUBSTRING(uPen.PositionPenalties, 0, LEN(uPen.PositionPenalties) - 8)
            )
            INSERT  INTO dbo.GameJamPosition (GameId, Period, Jam, Team, PlayerId, Position, Box, Penalties, PostPassBox, PostPassPenalties, PassOccurred)
            SELECT  @GameId AS GameId, l.Period, l.Jam, l.Team, i.PlayerId, l.Position, l.Box, l.Penalties, '' AS PostPassBox, 0 AS PostPassPenalties, 0 AS PassOccurred
              FROM  etl.IGRF i
                    INNER JOIN LineupNormalized l ON l.GameDateTime = i.GameDateTime AND l.Team = i.Team AND l.Number = i.Number;

            -- Repeat same query as an update, but for PassOccurred = 1 rows to get post-pass stats
            WITH LineupNormalized AS
            (
                SELECT  GameDateTime, Period, Jam, Team, uPen.Number, uPen.Position, uPen.Box, uPen.Penalties
                  FROM  (
                            SELECT GameDateTime, Period, Jam, Team, PassOccurred,
                                   JammerNumber AS [Jammer], PivotNumber AS [Pivot], Blocker1Number AS Blocker1, Blocker2Number AS Blocker2, Blocker3Number AS Blocker3,
                                   JammerBox, PivotBox, Blocker1Box, Blocker2Box, Blocker3Box,
                                   JammerPenalties, PivotPenalties, Blocker1Penalties, Blocker2Penalties, Blocker3Penalties
                              FROM etl.Lineups
                        ) lineups UNPIVOT (
                            Number FOR Position IN (Jammer, [Pivot], Blocker1, Blocker2, Blocker3)
                        ) AS uPosition UNPIVOT (
                            Box FOR PositionBox IN (JammerBox, PivotBox, Blocker1Box, Blocker2Box, Blocker3Box)
                        ) AS uBox UNPIVOT (
                            Penalties FOR PositionPenalties IN (JammerPenalties, PivotPenalties, Blocker1Penalties, Blocker2Penalties, Blocker3Penalties)
                        ) AS uPen
                        --CROSS APPLY (
                        --    SELECT  CAST(MAX(CAST(PassOccurred AS smallint)) AS bit) AS PassOccurred
                        --      FROM  etl.Lineups
                        --     WHERE  GameDateTime = uPen.GameDateTime AND Period = uPen.Period AND Jam = uPen.Jam
                        --) xPass
                 WHERE  uPen.PassOccurred = 1 AND uPen.Position = SUBSTRING(uPen.PositionBox, 0, LEN(uPen.PositionBox) - 2)
                        AND uPen.Position = SUBSTRING(uPen.PositionPenalties, 0, LEN(uPen.PositionPenalties) - 8)
            )
            UPDATE  g
               SET  PostPassBox = l.Box, PostPassPenalties = l.Penalties
              FROM  dbo.GameJamPosition g
                    INNER JOIN dbo.GamePlayer gp ON gp.GameId = @GameId AND gp.PlayerId = g.PlayerId
                    INNER JOIN LineupNormalized l ON l.Period = g.Period AND l.Jam = g.Jam AND l.Team = g.Team AND l.Number = gp.Number;

            INSERT INTO dbo.GameJamScore (GameId, Period, Jam, Team, JammerPlayerId, LeadJammer, CalledJam, PassOccurred, Passes, Points)
            SELECT  @GameId AS GameId, Period, Jam, s.Team, i.PlayerId AS JammerPlayerId, LeadJammer, CalledJam, PassOccurred, Passes, Points
              FROM  etl.Score s
                    INNER JOIN etl.IGRF i ON i.Team = s.Team AND i.Number = s.JammerNumber;


--- This one's incomplete - validate and add the lookup to GameJamPosition to determine PositionWhenPenalized
--- (If RowCount <= to Penalties, use position; otherwise sub Blocker for Jammer, and Jammer for Pivot
WITH PenaltyData AS
(
    SELECT  ROW_NUMBER() OVER (PARTITION BY p.Jam, i.PlayerId ORDER BY p.PenaltyId) AS PenaltySeq,
            @GameId AS GameId, p.Period, p.Jam, p.Team, i.PlayerId,
            PenaltyId, PenaltyType, PenaltyName
      FROM  etl.Penalties p
            INNER JOIN etl.IGRF i ON i.Team = p.Team AND i.Number = p.PlayerNumber
            INNER JOIN dbo.GameJamPosition gjp ON gjp.GameId = @GameId AND gjp.Period = p.Period
                       AND gjp.Jam = p.Jam AND gjp.Team = p.Team AND gjp.PlayerId = i.PlayerId AND gjp.PassOccurred = 0
            LEFT JOIN dbo.GameJamPosition gjp2 ON gjp2.GameId = @GameId AND gjp2.Period = p.Period
                       AND gjp2.Jam = p.Jam AND gjp2.Team = p.Team AND gjp2.PlayerId = i.PlayerId AND gjp.PassOccurred = 1
)
-- INSERT INTO dbo.GamJamPenalty (...)
SELECT  GameId, Period, Jam, Team, PlayerId, PenaltyId,
        NULL AS RoleWhenPenalized,
        PenaltyType, PenaltyName
  FROM  PenaltyData;

        END
    END
    /*
    IF (EXISTS (SELECT * FROM dbo.Game g INNER JOIN etl.IGRF i ON i.GameDateTime = g.GameDateTime))
    BEGIN
        TRUNCATE TABLE etl.IGRF;
        TRUNCATE TABLE etl.Lineups;
        TRUNCATE TABLE etl.Penalties;
        TRUNCATE TABLE etl.Score;
    END
    */
END
GO