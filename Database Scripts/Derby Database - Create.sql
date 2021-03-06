USE [master]
GO

ALTER DATABASE [SlowJams] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO

DROP DATABASE [SlowJams];
GO

CREATE DATABASE [SlowJams]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SlowJams_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2014\MSSQL\DATA\SlowJams_Data.mdf' , SIZE = 32768KB , MAXSIZE = UNLIMITED, FILEGROWTH = 32768KB )
 LOG ON 
( NAME = N'SlowJams_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2014\MSSQL\DATA\SlowJams_Log.ldf' , SIZE = 16384KB , MAXSIZE = 2048GB , FILEGROWTH = 8192KB )
GO

ALTER DATABASE [SlowJams] SET COMPATIBILITY_LEVEL = 120
GO

ALTER DATABASE [SlowJams] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [SlowJams] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [SlowJams] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [SlowJams] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [SlowJams] SET ARITHABORT OFF 
GO

ALTER DATABASE [SlowJams] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [SlowJams] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [SlowJams] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [SlowJams] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [SlowJams] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [SlowJams] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [SlowJams] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [SlowJams] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [SlowJams] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [SlowJams] SET  ENABLE_BROKER 
GO

ALTER DATABASE [SlowJams] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [SlowJams] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [SlowJams] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [SlowJams] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [SlowJams] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [SlowJams] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [SlowJams] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [SlowJams] SET RECOVERY FULL 
GO

ALTER DATABASE [SlowJams] SET  MULTI_USER 
GO

ALTER DATABASE [SlowJams] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [SlowJams] SET DB_CHAINING OFF 
GO

ALTER DATABASE [SlowJams] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [SlowJams] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO

ALTER DATABASE [SlowJams] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [SlowJams] SET  READ_WRITE 
GO


USE [SlowJams]
GO

CREATE SCHEMA [etl]
GO

CREATE TABLE [dbo].[Player] (
	[PlayerId] [int] IDENTITY (1, 1) NOT NULL,
	[DerbyName] [nvarchar](255) NOT NULL,
	[FirstName] [nvarchar](255) NULL,
	[LastName] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
	CONSTRAINT PK_Player PRIMARY KEY CLUSTERED (
		PlayerId ASC
	)
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[PlayerAffiliation] (
	[PlayerId] int NOT NULL,
	[League] varchar(25) NOT NULL,
    [DerbyName] [nvarchar](255) NOT NULL,
	[Number] varchar(25) NOT NULL,
	[EffectiveDate] datetime NOT NULL,
	[ExpiryDate] datetime NOT NULL,
	CONSTRAINT PK_PlayerAffiliation PRIMARY KEY CLUSTERED (
		PlayerId ASC,
                League ASC,
		EffectiveDate ASC
	)
) ON [PRIMARY]
GO

ALTER TABLE dbo.PlayerAffiliation WITH CHECK ADD CONSTRAINT FK_PlayerAffiliation_Player FOREIGN KEY (PlayerId)
REFERENCES dbo.Player (PlayerId)
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE dbo.PlayerAffiliation CHECK CONSTRAINT FK_PlayerAffiliation_Player
GO

CREATE TABLE [dbo].[Game] (
    [GameId] [int] IDENTITY (1, 1),
	[GameDateTime] [datetime] NOT NULL,
	[LeagueHome] [varchar](128) NOT NULL,
	[TeamHome] [varchar](128) NOT NULL,
	[LeagueAway] [varchar](128) NOT NULL,
	[TeamAway] [varchar](128) NOT NULL,
	[TeamHomeAvgPoints] [float](24) NULL,
	[TeamAwayAvgPoints] [float](24) NULL,
	[MedianPoints] [float](24) NULL,
    [IsScrimmage] [bit] NOT NULL CONSTRAINT DF_Game_IsScrimmage DEFAULT(0),
	CONSTRAINT PK_Game PRIMARY KEY CLUSTERED (
		GameId ASC
	)
) ON [PRIMARY]
GO

CREATE TABLE dbo.GamePlayer (
	GameId int NOT NULL,
	PlayerId int NOT NULL,
	League varchar(128) NOT NULL,
	Team varchar(128) NOT NULL,
    DerbyName nvarchar(255) NOT NULL,
	Number varchar(25),
	CONSTRAINT PK_PlayerGame PRIMARY KEY CLUSTERED (
		GameId ASC,
		PlayerId ASC
	)
) ON [PRIMARY]
GO

ALTER TABLE dbo.GamePlayer WITH CHECK ADD CONSTRAINT FK_GamePlayer_Game FOREIGN KEY (GameId)
REFERENCES dbo.Game (GameId)
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE dbo.GamePlayer CHECK CONSTRAINT FK_GamePlayer_Game
GO

ALTER TABLE dbo.GamePlayer WITH CHECK ADD CONSTRAINT FK_GamePlayer_Player FOREIGN KEY (PlayerId)
REFERENCES dbo.Player (PlayerId)
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE dbo.GamePlayer CHECK CONSTRAINT FK_GamePlayer_Player
GO

CREATE TABLE [dbo].[GameJamPosition] (
	[GameId] [int] NOT NULL,
	[Period] [smallint] NOT NULL,
	[Jam] [smallint] NOT NULL,
	[Team] [varchar](128) NOT NULL,
	[PlayerId] [int] NOT NULL,
	[Position] [varchar](64) NOT NULL,
    [Box] [varchar](16) NOT NULL CONSTRAINT DF_GameJamPosition_Box DEFAULT (''),
    [Penalties] [smallint] NOT NULL,
    [PostPassBox] [varchar](16) NOT NULL CONSTRAINT DF_GameJamPosition_PostPassBox DEFAULT(''),
    [PostPassPenalties] [smallint] NOT NULL,
	[PassOccurred] [bit] NOT NULL,
	CONSTRAINT PK_GameJamPosition PRIMARY KEY CLUSTERED (
		GameId ASC,
		Period ASC,
		Jam ASC,
		Team ASC,
		PlayerId ASC
	)
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[GameJamPosition]  WITH CHECK ADD  CONSTRAINT [FK_GameJamPosition_Game] FOREIGN KEY([GameId])
REFERENCES [dbo].[Game] ([GameId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[GameJamPosition] CHECK CONSTRAINT [FK_GameJamPosition_Game]
GO

CREATE TABLE [dbo].[GameJamScore] (
	[GameId] [int] NOT NULL,
	[Period] [smallint] NOT NULL,
	[Jam] [smallint] NOT NULL,
	[Team] [varchar] (128) NOT NULL,
	[JammerPlayerId] [int] NOT NULL,
	[LeadJammer] [bit] NOT NULL,
	[CalledJam] [bit] NOT NULL,
	[PassOccurred] [bit] NOT NULL,
	[Passes] [int] NOT NULL,
	[Points] [smallint] NOT NULL,
	CONSTRAINT PK_GameJamScore PRIMARY KEY CLUSTERED (
		GameId ASC,
		Period ASC,
		Jam ASC,
		Team ASC,
		JammerPlayerId ASC
	)
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[GameJamScore]  WITH CHECK ADD  CONSTRAINT [FK_GameJamScore_Game] FOREIGN KEY ([GameId])
REFERENCES [dbo].[Game] ([GameId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[GameJamScore] CHECK CONSTRAINT [FK_GameJamScore_Game]
GO

CREATE TABLE [dbo].[GameJamPenalty] (
	[GameId] [int] NOT NULL,
	[Period] [smallint] NOT NULL,
	[Jam] [smallint] NOT NULL,
	[Team] [varchar](128) NOT NULL,
	[PlayerId] [int] NOT NULL,
	[PenaltyId] [smallint] NOT NULL,
	[RoleWhenPenalized] [nvarchar](255) NULL,
	[PenaltyType] [nvarchar](16) NULL,
	[PenaltyName] [nvarchar](64) NULL,
	CONSTRAINT PK_GameJamPenalty PRIMARY KEY CLUSTERED (
		GameId ASC,
		Period ASC,
		Jam ASC,
		Team ASC,
		PlayerId ASC,
		PenaltyId ASC
	)
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[GameJamPenalty]  WITH CHECK ADD  CONSTRAINT [FK_GameJamPenalty_Game] FOREIGN KEY ([GameId])
REFERENCES [dbo].[Game] ([GameId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[GameJamPenalty] CHECK CONSTRAINT [FK_GameJamPenalty_Game]
GO

-- ETL Tables

CREATE TABLE [etl].[IGRF] (
	[League] [varchar](128) NULL,
	[Team] [varchar](128) NULL,
	[Number] [varchar](25) NULL,
	[Name] [nvarchar](255) NULL,
	[GameDateTime] [datetime] NULL,
	[PlayerId] [int] NULL
) ON [PRIMARY]
GO

CREATE TABLE [etl].[Score] (
	[GameDateTime] [datetime] NULL,
	[Period] smallint NULL,
	[Jam] smallint NULL,
	[Team] varchar(128) NULL,
	[JammerNumber] [varchar](25) NULL,
	[LeadJammer] [bit] NULL,
	[CalledJam] [bit] NULL,
    [Passes] smallint NULL,
    [Points] smallint NULL,
	[PassOccurred] [bit] NULL,
	[IsHomeTeam] [bit] NULL
) ON [PRIMARY]
GO

CREATE TABLE [etl].[Penalties] (
	[GameDateTime] [datetime] NULL,
	[Period] smallint NULL,
	[Jam] smallint NULL,
	[Team] varchar(128) NULL,
	[PlayerNumber] varchar(25) NULL,
	[PenaltyId] smallint NULL,
	[PenaltyType] varchar(16) NULL,
	[PenaltyName] varchar(64) NULL
) ON [PRIMARY]
GO

CREATE TABLE [etl].[Lineups] (
	GameDateTime datetime NULL,
	Period smallint NULL,
	Jam smallint NULL,
	Team varchar(128) NULL,
	JammerNumber varchar(25) NULL,
	JammerBox varchar(16) NULL,
    JammerPenalties smallint NULL,
	PivotNumber varchar(25) NULL,
	PivotBox varchar(16) NULL,
    PivotPenalties smallint NULL,
	Blocker1Number varchar(25) NULL,
	Blocker1Box varchar(16) NULL,
    Blocker1Penalties smallint NULL,
	Blocker2Number varchar(25) NULL,
	Blocker2Box varchar(16) NULL,
    Blocker2Penalties smallint NULL,
	Blocker3Number varchar(25) NULL,
	Blocker3Box varchar(16) NULL,
    Blocker3Penalties smallint NULL,
	PassOccurred bit NULL,
	IsHomeTeam bit NULL
) ON [PRIMARY]
GO