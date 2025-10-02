USE [master]
GO

IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = N'RobloxRoles')
BEGIN
CREATE DATABASE [RobloxRoles] ON  PRIMARY
( NAME = N'RobloxRoles', FILENAME = N'/data/RobloxRoles/RobloxRoles.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxRoles2', FILENAME = N'/data/RobloxRoles/RobloxRoles2.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxRoles3', FILENAME = N'/data/RobloxRoles/RobloxRoles3.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxRoles4', FILENAME = N'/data/RobloxRoles/RobloxRoles4.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxRoles5', FILENAME = N'/data/RobloxRoles/RobloxRoles5.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxRoles6', FILENAME = N'/data/RobloxRoles/RobloxRoles6.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxRoles7', FILENAME = N'/data/RobloxRoles/RobloxRoles7.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxRoles8', FILENAME = N'/data/RobloxRoles/RobloxRoles8.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB )
 LOG ON
( NAME = N'RobloxRoles_log', FILENAME = N'/logs/RobloxRoles/RobloxRoles_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxRoles2_log', FILENAME = N'/logs/RobloxRoles/RobloxRoles2_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxRoles3_log', FILENAME = N'/logs/RobloxRoles/RobloxRoles3_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxRoles4_log', FILENAME = N'/logs/RobloxRoles/RobloxRoles4_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxRoles5_log', FILENAME = N'/logs/RobloxRoles/RobloxRoles5_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxRoles6_log', FILENAME = N'/logs/RobloxRoles/RobloxRoles6_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxRoles7_log', FILENAME = N'/logs/RobloxRoles/RobloxRoles7_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxRoles8_log', FILENAME = N'/logs/RobloxRoles/RobloxRoles8_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB )
END
GO

ALTER DATABASE [RobloxRoles] SET COMPATIBILITY_LEVEL = 100
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RobloxRoles].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [RobloxRoles] SET ANSI_NULL_DEFAULT OFF
GO

ALTER DATABASE [RobloxRoles] SET ANSI_NULLS OFF
GO

ALTER DATABASE [RobloxRoles] SET ANSI_PADDING OFF
GO

ALTER DATABASE [RobloxRoles] SET ANSI_WARNINGS OFF
GO

ALTER DATABASE [RobloxRoles] SET ARITHABORT OFF
GO

ALTER DATABASE [RobloxRoles] SET AUTO_CLOSE OFF
GO

ALTER DATABASE [RobloxRoles] SET AUTO_CREATE_STATISTICS ON
GO

ALTER DATABASE [RobloxRoles] SET AUTO_SHRINK OFF
GO

ALTER DATABASE [RobloxRoles] SET AUTO_UPDATE_STATISTICS ON
GO

ALTER DATABASE [RobloxRoles] SET CURSOR_CLOSE_ON_COMMIT OFF
GO

ALTER DATABASE [RobloxRoles] SET CURSOR_DEFAULT  GLOBAL
GO

ALTER DATABASE [RobloxRoles] SET CONCAT_NULL_YIELDS_NULL OFF
GO

ALTER DATABASE [RobloxRoles] SET NUMERIC_ROUNDABORT OFF
GO

ALTER DATABASE [RobloxRoles] SET QUOTED_IDENTIFIER OFF
GO

ALTER DATABASE [RobloxRoles] SET RECURSIVE_TRIGGERS OFF
GO

ALTER DATABASE [RobloxRoles] SET  DISABLE_BROKER
GO

ALTER DATABASE [RobloxRoles] SET AUTO_UPDATE_STATISTICS_ASYNC ON
GO

ALTER DATABASE [RobloxRoles] SET DATE_CORRELATION_OPTIMIZATION OFF
GO

ALTER DATABASE [RobloxRoles] SET TRUSTWORTHY OFF
GO

ALTER DATABASE [RobloxRoles] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO

ALTER DATABASE [RobloxRoles] SET PARAMETERIZATION SIMPLE
GO

ALTER DATABASE [RobloxRoles] SET READ_COMMITTED_SNAPSHOT OFF
GO

ALTER DATABASE [RobloxRoles] SET HONOR_BROKER_PRIORITY OFF
GO

ALTER DATABASE [RobloxRoles] SET  READ_WRITE
GO

ALTER DATABASE [RobloxRoles] SET RECOVERY FULL
GO

ALTER DATABASE [RobloxRoles] SET  MULTI_USER
GO

ALTER DATABASE [RobloxRoles] SET PAGE_VERIFY CHECKSUM
GO

ALTER DATABASE [RobloxRoles] SET DB_CHAINING OFF
GO

USE [RobloxRoles]
GO


/****** Begin ElevatedAction ******/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ElevatedActions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ElevatedActions](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [Name] [varchar](256) NOT NULL,
    [Description] [varchar](256) NOT NULL,
    [Created] [datetime] NOT NULL,
    [Updated] [datetime] NOT NULL,
 CONSTRAINT [PK_ElevatedActions] PRIMARY KEY CLUSTERED
(
    [ID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END


/****** End ElevatedAction ******/

/****** Begin RoleSet ******/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RoleSets]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RoleSets](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [Name] [varchar](256) NOT NULL,
    [Rank] [int] NOT NULL,
    [Created] [datetime] NOT NULL,
    [Updated] [datetime] NOT NULL,
 CONSTRAINT [PK_RoleSets] PRIMARY KEY CLUSTERED
(
    [ID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END


/****** End RoleSet ******/

/****** Begin ElevatedActionLog ******/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ElevatedActionLogs]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ElevatedActionLogs](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [ElevatedActionID] [int] NOT NULL,
    [UserID] [bigint] NOT NULL,
    [RoleSetID] [int] NOT NULL,
    [LogData] [nvarchar](MAX) NOT NULL,
    [Success] [bit] NOT NULL,
    [IpAddress] [varchar](40) NOT NULL,
    [BrowserTrackerID] [bigint] NOT NULL,
    [Created] [datetime] NOT NULL,
    [Updated] [datetime] NOT NULL,
 CONSTRAINT [PK_ElevatedActionLogs] PRIMARY KEY CLUSTERED
(
    [ID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ElevatedActionLogs_ElevatedActions_ElevatedActionID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ElevatedActionLogs]'))
ALTER TABLE [dbo].[ElevatedActionLogs] 
WITH CHECK ADD CONSTRAINT [FK_ElevatedActionLogs_ElevatedActions_ElevatedActionID] FOREIGN KEY ([ElevatedActionID])
REFERENCES [dbo].[ElevatedActions] ([ID])
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ElevatedActionLogs_ElevatedActions_ElevatedActionID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ElevatedActionLogs]'))
ALTER TABLE [dbo].[ElevatedActionLogs] CHECK CONSTRAINT [FK_ElevatedActionLogs_ElevatedActions_ElevatedActionID]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ElevatedActionLogs_RoleSets_RoleSetID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ElevatedActionLogs]'))
ALTER TABLE [dbo].[ElevatedActionLogs] 
WITH CHECK ADD CONSTRAINT [FK_ElevatedActionLogs_RoleSets_RoleSetID] FOREIGN KEY ([RoleSetID])
REFERENCES [dbo].[RoleSets] ([ID])
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ElevatedActionLogs_RoleSets_RoleSetID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ElevatedActionLogs]'))
ALTER TABLE [dbo].[ElevatedActionLogs] CHECK CONSTRAINT [FK_ElevatedActionLogs_RoleSets_RoleSetID]


/****** End ElevatedActionLog ******/

/****** Begin RoleSetElevatedAction ******/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RoleSetElevatedActions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RoleSetElevatedActions](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [RoleSetID] [int] NOT NULL,
    [ElevatedActionID] [int] NOT NULL,
    [Created] [datetime] NOT NULL,
    [Updated] [datetime] NOT NULL,
 CONSTRAINT [PK_RoleSetElevatedActions] PRIMARY KEY CLUSTERED
(
    [ID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RoleSetElevatedActions_RoleSets_RoleSetID]') AND parent_object_id = OBJECT_ID(N'[dbo].[RoleSetElevatedActions]'))
ALTER TABLE [dbo].[RoleSetElevatedActions] 
WITH CHECK ADD CONSTRAINT [FK_RoleSetElevatedActions_RoleSets_RoleSetID] FOREIGN KEY ([RoleSetID])
REFERENCES [dbo].[RoleSets] ([ID])
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RoleSetElevatedActions_RoleSets_RoleSetID]') AND parent_object_id = OBJECT_ID(N'[dbo].[RoleSetElevatedActions]'))
ALTER TABLE [dbo].[RoleSetElevatedActions] CHECK CONSTRAINT [FK_RoleSetElevatedActions_RoleSets_RoleSetID]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RoleSetElevatedActions_ElevatedActions_ElevatedActionID]') AND parent_object_id = OBJECT_ID(N'[dbo].[RoleSetElevatedActions]'))
ALTER TABLE [dbo].[RoleSetElevatedActions] 
WITH CHECK ADD CONSTRAINT [FK_RoleSetElevatedActions_ElevatedActions_ElevatedActionID] FOREIGN KEY ([ElevatedActionID])
REFERENCES [dbo].[ElevatedActions] ([ID])
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RoleSetElevatedActions_ElevatedActions_ElevatedActionID]') AND parent_object_id = OBJECT_ID(N'[dbo].[RoleSetElevatedActions]'))
ALTER TABLE [dbo].[RoleSetElevatedActions] CHECK CONSTRAINT [FK_RoleSetElevatedActions_ElevatedActions_ElevatedActionID]


/****** End RoleSetElevatedAction ******/

/****** Begin UserRoleSet ******/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserRoleSets]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserRoleSets](
	[ID] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [UserID] [bigint] NOT NULL,
    [RoleSetID] [int] NOT NULL,
    [Created] [datetime] NOT NULL,
    [Updated] [datetime] NOT NULL,
 CONSTRAINT [PK_UserRoleSets] PRIMARY KEY CLUSTERED
(
    [ID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRoleSets_RoleSets_RoleSetID]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRoleSets]'))
ALTER TABLE [dbo].[UserRoleSets] 
WITH CHECK ADD CONSTRAINT [FK_UserRoleSets_RoleSets_RoleSetID] FOREIGN KEY ([RoleSetID])
REFERENCES [dbo].[RoleSets] ([ID])
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRoleSets_RoleSets_RoleSetID]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRoleSets]'))
ALTER TABLE [dbo].[UserRoleSets] CHECK CONSTRAINT [FK_UserRoleSets_RoleSets_RoleSetID]


/****** End UserRoleSet ******/


/****** Begin ElevatedAction ******/

/* Standard Insertion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ElevatedActions_InsertElevatedAction]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[ElevatedActions_InsertElevatedAction] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[ElevatedActions_InsertElevatedAction]
(
	@ID [int] OUTPUT,
    @Name [varchar](256),
    @Description [varchar](256),
    @Created [datetime],
    @Updated [datetime]
)
AS

SET NOCOUNT ON

INSERT INTO
	[ElevatedActions]
(
[Name],
[Description],
[Created],
[Updated]
)
VALUES
(
@Name,
@Description,
@Created,
@Updated
)

SET @ID = SCOPE_IDENTITY();

SET NOCOUNT OFF

RETURN

GO

/* Standard Update */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ElevatedActions_UpdateElevatedActionByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[ElevatedActions_UpdateElevatedActionByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[ElevatedActions_UpdateElevatedActionByID]
(
    @ID [int],
    @Name [varchar](256),
    @Description [varchar](256),
    @Created [datetime],
    @Updated [datetime]
)
AS

SET NOCOUNT ON

UPDATE
    [ElevatedActions]
SET
[Name] = @Name,
[Description] = @Description,
[Created] = @Created,
[Updated] = @Updated
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Deletion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ElevatedActions_DeleteElevatedActionByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[ElevatedActions_DeleteElevatedActionByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[ElevatedActions_DeleteElevatedActionByID]
(
    @ID [int]
)
AS

SET NOCOUNT ON

DELETE FROM
    [ElevatedActions]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Get-By-ID */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ElevatedActions_GetElevatedActionByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[ElevatedActions_GetElevatedActionByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[ElevatedActions_GetElevatedActionByID]
(
    @ID [int]
)
AS

SET NOCOUNT ON

SELECT
    [ID],
    [Name]
    ,[Description]
    ,[Created]
    ,[Updated]
FROM
    [ElevatedActions]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ElevatedActions_GetElevatedActionByName]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[ElevatedActions_GetElevatedActionByName] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[ElevatedActions_GetElevatedActionByName]
(
    @Name [varchar](256)
)
AS

SET NOCOUNT ON

SELECT
    [ID]
    ,[Name]
    ,[Description]
    ,[Created]
    ,[Updated]
FROM
	[ElevatedActions]
WHERE
	([Name] = @Name)

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ElevatedActions_GetAllElevatedActionIDs]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[ElevatedActions_GetAllElevatedActionIDs] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[ElevatedActions_GetAllElevatedActionIDs]
AS

SET NOCOUNT ON

SELECT
    [ID]
FROM
	[ElevatedActions]

SET NOCOUNT OFF

RETURN

GO
/********** End ElevatedAction **********/
/****** Begin RoleSet ******/

/* Standard Insertion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RoleSets_InsertRoleSet]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[RoleSets_InsertRoleSet] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[RoleSets_InsertRoleSet]
(
	@ID [int] OUTPUT,
    @Name [varchar](256),
    @Rank [int],
    @Created [datetime],
    @Updated [datetime]
)
AS

SET NOCOUNT ON

INSERT INTO
	[RoleSets]
(
[Name],
[Rank],
[Created],
[Updated]
)
VALUES
(
@Name,
@Rank,
@Created,
@Updated
)

SET @ID = SCOPE_IDENTITY();

SET NOCOUNT OFF

RETURN

GO

/* Standard Update */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RoleSets_UpdateRoleSetByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[RoleSets_UpdateRoleSetByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[RoleSets_UpdateRoleSetByID]
(
    @ID [int],
    @Name [varchar](256),
    @Rank [int],
    @Created [datetime],
    @Updated [datetime]
)
AS

SET NOCOUNT ON

UPDATE
    [RoleSets]
SET
[Name] = @Name,
[Rank] = @Rank,
[Created] = @Created,
[Updated] = @Updated
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Deletion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RoleSets_DeleteRoleSetByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[RoleSets_DeleteRoleSetByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[RoleSets_DeleteRoleSetByID]
(
    @ID [int]
)
AS

SET NOCOUNT ON

DELETE FROM
    [RoleSets]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Get-By-ID */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RoleSets_GetRoleSetByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[RoleSets_GetRoleSetByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[RoleSets_GetRoleSetByID]
(
    @ID [int]
)
AS

SET NOCOUNT ON

SELECT
    [ID],
    [Name]
    ,[Rank]
    ,[Created]
    ,[Updated]
FROM
    [RoleSets]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RoleSets_GetRoleSetByName]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[RoleSets_GetRoleSetByName] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[RoleSets_GetRoleSetByName]
(
    @Name [varchar](256)
)
AS

SET NOCOUNT ON

SELECT
    [ID]
    ,[Name]
    ,[Rank]
    ,[Created]
    ,[Updated]
FROM
	[RoleSets]
WHERE
	([Name] = @Name)

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RoleSets_GetAllRoleSetIDs]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[RoleSets_GetAllRoleSetIDs] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[RoleSets_GetAllRoleSetIDs]
AS

SET NOCOUNT ON

SELECT
    [ID]
FROM
	[RoleSets]

SET NOCOUNT OFF

RETURN

GO
/********** End RoleSet **********/
/****** Begin ElevatedActionLog ******/

/* Standard Insertion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ElevatedActionLogs_InsertElevatedActionLog]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[ElevatedActionLogs_InsertElevatedActionLog] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[ElevatedActionLogs_InsertElevatedActionLog]
(
	@ID [int] OUTPUT,
    @ElevatedActionID [int],
    @UserID [bigint],
    @RoleSetID [int],
    @LogData [nvarchar](MAX),
    @Success [bit],
    @IpAddress [varchar](40),
    @BrowserTrackerID [bigint],
    @Created [datetime],
    @Updated [datetime]
)
AS

SET NOCOUNT ON

INSERT INTO
	[ElevatedActionLogs]
(
[ElevatedActionID],
[UserID],
[RoleSetID],
[LogData],
[Success],
[IpAddress],
[BrowserTrackerID],
[Created],
[Updated]
)
VALUES
(
@ElevatedActionID,
@UserID,
@RoleSetID,
@LogData,
@Success,
@IpAddress,
@BrowserTrackerID,
@Created,
@Updated
)

SET @ID = SCOPE_IDENTITY();

SET NOCOUNT OFF

RETURN

GO

/* Standard Update */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ElevatedActionLogs_UpdateElevatedActionLogByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[ElevatedActionLogs_UpdateElevatedActionLogByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[ElevatedActionLogs_UpdateElevatedActionLogByID]
(
    @ID [int],
    @ElevatedActionID [int],
    @UserID [bigint],
    @RoleSetID [int],
    @LogData [nvarchar](MAX),
    @Success [bit],
    @IpAddress [varchar](40),
    @BrowserTrackerID [bigint],
    @Created [datetime],
    @Updated [datetime]
)
AS

SET NOCOUNT ON

UPDATE
    [ElevatedActionLogs]
SET
[ElevatedActionID] = @ElevatedActionID,
[UserID] = @UserID,
[RoleSetID] = @RoleSetID,
[LogData] = @LogData,
[Success] = @Success,
[IpAddress] = @IpAddress,
[BrowserTrackerID] = @BrowserTrackerID,
[Created] = @Created,
[Updated] = @Updated
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Deletion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ElevatedActionLogs_DeleteElevatedActionLogByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[ElevatedActionLogs_DeleteElevatedActionLogByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[ElevatedActionLogs_DeleteElevatedActionLogByID]
(
    @ID [int]
)
AS

SET NOCOUNT ON

DELETE FROM
    [ElevatedActionLogs]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Get-By-ID */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ElevatedActionLogs_GetElevatedActionLogByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[ElevatedActionLogs_GetElevatedActionLogByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[ElevatedActionLogs_GetElevatedActionLogByID]
(
    @ID [int]
)
AS

SET NOCOUNT ON

SELECT
    [ID],
    [ElevatedActionID]
    ,[UserID]
    ,[RoleSetID]
    ,[LogData]
    ,[Success]
    ,[IpAddress]
    ,[BrowserTrackerID]
    ,[Created]
    ,[Updated]
FROM
    [ElevatedActionLogs]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/********** End ElevatedActionLog **********/
/****** Begin RoleSetElevatedAction ******/

/* Standard Insertion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RoleSetElevatedActions_InsertRoleSetElevatedAction]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[RoleSetElevatedActions_InsertRoleSetElevatedAction] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[RoleSetElevatedActions_InsertRoleSetElevatedAction]
(
	@ID [int] OUTPUT,
    @RoleSetID [int],
    @ElevatedActionID [int],
    @Created [datetime],
    @Updated [datetime]
)
AS

SET NOCOUNT ON

INSERT INTO
	[RoleSetElevatedActions]
(
[RoleSetID],
[ElevatedActionID],
[Created],
[Updated]
)
VALUES
(
@RoleSetID,
@ElevatedActionID,
@Created,
@Updated
)

SET @ID = SCOPE_IDENTITY();

SET NOCOUNT OFF

RETURN

GO

/* Standard Update */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RoleSetElevatedActions_UpdateRoleSetElevatedActionByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[RoleSetElevatedActions_UpdateRoleSetElevatedActionByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[RoleSetElevatedActions_UpdateRoleSetElevatedActionByID]
(
    @ID [int],
    @RoleSetID [int],
    @ElevatedActionID [int],
    @Created [datetime],
    @Updated [datetime]
)
AS

SET NOCOUNT ON

UPDATE
    [RoleSetElevatedActions]
SET
[RoleSetID] = @RoleSetID,
[ElevatedActionID] = @ElevatedActionID,
[Created] = @Created,
[Updated] = @Updated
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Deletion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RoleSetElevatedActions_DeleteRoleSetElevatedActionByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[RoleSetElevatedActions_DeleteRoleSetElevatedActionByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[RoleSetElevatedActions_DeleteRoleSetElevatedActionByID]
(
    @ID [int]
)
AS

SET NOCOUNT ON

DELETE FROM
    [RoleSetElevatedActions]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Get-By-ID */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RoleSetElevatedActions_GetRoleSetElevatedActionByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[RoleSetElevatedActions_GetRoleSetElevatedActionByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[RoleSetElevatedActions_GetRoleSetElevatedActionByID]
(
    @ID [int]
)
AS

SET NOCOUNT ON

SELECT
    [ID],
    [RoleSetID]
    ,[ElevatedActionID]
    ,[Created]
    ,[Updated]
FROM
    [RoleSetElevatedActions]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RoleSetElevatedActions_GetRoleSetElevatedActionByRoleSetIDAndElevatedActionID]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[RoleSetElevatedActions_GetRoleSetElevatedActionByRoleSetIDAndElevatedActionID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[RoleSetElevatedActions_GetRoleSetElevatedActionByRoleSetIDAndElevatedActionID]
(
    @RoleSetID [int],
    @ElevatedActionID [int]
)
AS

SET NOCOUNT ON

SELECT
    [ID]
    ,[RoleSetID]
    ,[ElevatedActionID]
    ,[Created]
    ,[Updated]
FROM
	[RoleSetElevatedActions]
WHERE
	([RoleSetID] = @RoleSetID) AND ([ElevatedActionID] = @ElevatedActionID)

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RoleSetElevatedActions_GetRoleSetElevatedActionIDsByRoleSetID]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[RoleSetElevatedActions_GetRoleSetElevatedActionIDsByRoleSetID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[RoleSetElevatedActions_GetRoleSetElevatedActionIDsByRoleSetID]
(
    @RoleSetID [int]
)
AS

SET NOCOUNT ON

SELECT
    [ID]
FROM
	[RoleSetElevatedActions]
WHERE
	([RoleSetID] = @RoleSetID)

SET NOCOUNT OFF

RETURN

GO
/********** End RoleSetElevatedAction **********/
/****** Begin UserRoleSet ******/

/* Standard Insertion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserRoleSets_InsertUserRoleSet]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[UserRoleSets_InsertUserRoleSet] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[UserRoleSets_InsertUserRoleSet]
(
	@ID [bigint] OUTPUT,
    @UserID [bigint],
    @RoleSetID [int],
    @Created [datetime],
    @Updated [datetime]
)
AS

SET NOCOUNT ON

INSERT INTO
	[UserRoleSets]
(
[UserID],
[RoleSetID],
[Created],
[Updated]
)
VALUES
(
@UserID,
@RoleSetID,
@Created,
@Updated
)

SET @ID = SCOPE_IDENTITY();

SET NOCOUNT OFF

RETURN

GO

/* Standard Update */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserRoleSets_UpdateUserRoleSetByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[UserRoleSets_UpdateUserRoleSetByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[UserRoleSets_UpdateUserRoleSetByID]
(
    @ID [bigint],
    @UserID [bigint],
    @RoleSetID [int],
    @Created [datetime],
    @Updated [datetime]
)
AS

SET NOCOUNT ON

UPDATE
    [UserRoleSets]
SET
[UserID] = @UserID,
[RoleSetID] = @RoleSetID,
[Created] = @Created,
[Updated] = @Updated
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Deletion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserRoleSets_DeleteUserRoleSetByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[UserRoleSets_DeleteUserRoleSetByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[UserRoleSets_DeleteUserRoleSetByID]
(
    @ID [bigint]
)
AS

SET NOCOUNT ON

DELETE FROM
    [UserRoleSets]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Get-By-ID */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserRoleSets_GetUserRoleSetByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[UserRoleSets_GetUserRoleSetByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[UserRoleSets_GetUserRoleSetByID]
(
    @ID [bigint]
)
AS

SET NOCOUNT ON

SELECT
    [ID],
    [UserID]
    ,[RoleSetID]
    ,[Created]
    ,[Updated]
FROM
    [UserRoleSets]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserRoleSets_GetUserRoleSetByUserIDAndRoleSetID]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[UserRoleSets_GetUserRoleSetByUserIDAndRoleSetID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[UserRoleSets_GetUserRoleSetByUserIDAndRoleSetID]
(
    @UserID [bigint],
    @RoleSetID [int]
)
AS

SET NOCOUNT ON

SELECT
    [ID]
    ,[UserID]
    ,[RoleSetID]
    ,[Created]
    ,[Updated]
FROM
	[UserRoleSets]
WHERE
	([UserID] = @UserID) AND ([RoleSetID] = @RoleSetID)

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserRoleSets_GetAllUserRoleSetIDs_Paged]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[UserRoleSets_GetAllUserRoleSetIDs_Paged] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[UserRoleSets_GetAllUserRoleSetIDs_Paged]
(
    @StartRowIndex [bigint],
    @MaximumRows [bigint]
)
AS

SET NOCOUNT ON

SELECT
    [ID]
FROM
	[UserRoleSets]
ORDER BY
    [ID] ASC
OFFSET @StartRowIndex ROWS FETCH NEXT @MaximumRows ROWS ONLY

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserRoleSets_GetTotalNumberOfUserRoleSets]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[UserRoleSets_GetTotalNumberOfUserRoleSets] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[UserRoleSets_GetTotalNumberOfUserRoleSets]
AS

SET NOCOUNT ON

SELECT
    COUNT(*)
FROM
	[UserRoleSets]

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserRoleSets_GetUserRoleSetIDsByUserID_Paged]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[UserRoleSets_GetUserRoleSetIDsByUserID_Paged] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[UserRoleSets_GetUserRoleSetIDsByUserID_Paged]
(
    @UserID [bigint],
    @StartRowIndex [bigint],
    @MaximumRows [bigint]
)
AS

SET NOCOUNT ON

SELECT
    [ID]
FROM
	[UserRoleSets]
WHERE
	([UserID] = @UserID)
ORDER BY
    [ID] ASC
OFFSET @StartRowIndex ROWS FETCH NEXT @MaximumRows ROWS ONLY

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserRoleSets_GetUserRoleSetIDsByRoleSetID_Paged]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[UserRoleSets_GetUserRoleSetIDsByRoleSetID_Paged] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[UserRoleSets_GetUserRoleSetIDsByRoleSetID_Paged]
(
    @RoleSetID [int],
    @StartRowIndex [bigint],
    @MaximumRows [bigint]
)
AS

SET NOCOUNT ON

SELECT
    [ID]
FROM
	[UserRoleSets]
WHERE
	([RoleSetID] = @RoleSetID)
ORDER BY
    [ID] ASC
OFFSET @StartRowIndex ROWS FETCH NEXT @MaximumRows ROWS ONLY

SET NOCOUNT OFF

RETURN

GO
/********** End UserRoleSet **********/