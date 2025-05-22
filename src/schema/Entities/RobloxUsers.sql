USE [master]
GO

IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = N'RobloxUsers')
BEGIN
CREATE DATABASE [RobloxUsers] ON  PRIMARY
( NAME = N'RobloxUsers', FILENAME = N'/data/RobloxUsers/RobloxUsers.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxUsers2', FILENAME = N'/data/RobloxUsers/RobloxUsers2.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxUsers3', FILENAME = N'/data/RobloxUsers/RobloxUsers3.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxUsers4', FILENAME = N'/data/RobloxUsers/RobloxUsers4.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxUsers5', FILENAME = N'/data/RobloxUsers/RobloxUsers5.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxUsers6', FILENAME = N'/data/RobloxUsers/RobloxUsers6.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxUsers7', FILENAME = N'/data/RobloxUsers/RobloxUsers7.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxUsers8', FILENAME = N'/data/RobloxUsers/RobloxUsers8.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB )
 LOG ON
( NAME = N'RobloxUsers_log', FILENAME = N'/logs/RobloxUsers/RobloxUsers_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxUsers2_log', FILENAME = N'/logs/RobloxUsers/RobloxUsers2_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxUsers3_log', FILENAME = N'/logs/RobloxUsers/RobloxUsers3_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxUsers4_log', FILENAME = N'/logs/RobloxUsers/RobloxUsers4_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxUsers5_log', FILENAME = N'/logs/RobloxUsers/RobloxUsers5_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxUsers6_log', FILENAME = N'/logs/RobloxUsers/RobloxUsers6_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxUsers7_log', FILENAME = N'/logs/RobloxUsers/RobloxUsers7_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxUsers8_log', FILENAME = N'/logs/RobloxUsers/RobloxUsers8_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB )
END
GO

ALTER DATABASE [RobloxUsers] SET COMPATIBILITY_LEVEL = 100
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RobloxUsers].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [RobloxUsers] SET ANSI_NULL_DEFAULT OFF
GO

ALTER DATABASE [RobloxUsers] SET ANSI_NULLS OFF
GO

ALTER DATABASE [RobloxUsers] SET ANSI_PADDING OFF
GO

ALTER DATABASE [RobloxUsers] SET ANSI_WARNINGS OFF
GO

ALTER DATABASE [RobloxUsers] SET ARITHABORT OFF
GO

ALTER DATABASE [RobloxUsers] SET AUTO_CLOSE OFF
GO

ALTER DATABASE [RobloxUsers] SET AUTO_CREATE_STATISTICS ON
GO

ALTER DATABASE [RobloxUsers] SET AUTO_SHRINK OFF
GO

ALTER DATABASE [RobloxUsers] SET AUTO_UPDATE_STATISTICS ON
GO

ALTER DATABASE [RobloxUsers] SET CURSOR_CLOSE_ON_COMMIT OFF
GO

ALTER DATABASE [RobloxUsers] SET CURSOR_DEFAULT  GLOBAL
GO

ALTER DATABASE [RobloxUsers] SET CONCAT_NULL_YIELDS_NULL OFF
GO

ALTER DATABASE [RobloxUsers] SET NUMERIC_ROUNDABORT OFF
GO

ALTER DATABASE [RobloxUsers] SET QUOTED_IDENTIFIER OFF
GO

ALTER DATABASE [RobloxUsers] SET RECURSIVE_TRIGGERS OFF
GO

ALTER DATABASE [RobloxUsers] SET  DISABLE_BROKER
GO

ALTER DATABASE [RobloxUsers] SET AUTO_UPDATE_STATISTICS_ASYNC ON
GO

ALTER DATABASE [RobloxUsers] SET DATE_CORRELATION_OPTIMIZATION OFF
GO

ALTER DATABASE [RobloxUsers] SET TRUSTWORTHY OFF
GO

ALTER DATABASE [RobloxUsers] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO

ALTER DATABASE [RobloxUsers] SET PARAMETERIZATION SIMPLE
GO

ALTER DATABASE [RobloxUsers] SET READ_COMMITTED_SNAPSHOT OFF
GO

ALTER DATABASE [RobloxUsers] SET HONOR_BROKER_PRIORITY OFF
GO

ALTER DATABASE [RobloxUsers] SET  READ_WRITE
GO

ALTER DATABASE [RobloxUsers] SET RECOVERY FULL
GO

ALTER DATABASE [RobloxUsers] SET  MULTI_USER
GO

ALTER DATABASE [RobloxUsers] SET PAGE_VERIFY CHECKSUM
GO

ALTER DATABASE [RobloxUsers] SET DB_CHAINING OFF
GO

USE [RobloxUsers]
GO


/****** Begin AgentType ******/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AgentTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AgentTypes](
	[ID] [tinyint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [Value] [nvarchar](MAX) NOT NULL,
    [Created] [datetime] NOT NULL,
    [Updated] [datetime] NULL,
 CONSTRAINT [PK_AgentTypes] PRIMARY KEY CLUSTERED
(
    [ID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END

/****** End AgentType ******/

/****** Begin Agent ******/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Agents]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Agents](
	[ID] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [AgentTypeID] [tinyint] NOT NULL,
    [AgentTargetID] [bigint] NOT NULL,
    [Created] [datetime] NOT NULL,
    [Updated] [datetime] NULL,
 CONSTRAINT [PK_Agents] PRIMARY KEY CLUSTERED
(
    [ID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Agents_AgentTypes_AgentTypeID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Agents]'))
ALTER TABLE [dbo].[Agents] 
WITH CHECK ADD CONSTRAINT [FK_Agents_AgentTypes_AgentTypeID] FOREIGN KEY ([AgentTypeID])
REFERENCES [dbo].[AgentTypes] ([ID])
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Agents_AgentTypes_AgentTypeID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Agents]'))
ALTER TABLE [dbo].[Agents] CHECK CONSTRAINT [FK_Agents_AgentTypes_AgentTypeID]

/****** End Agent ******/

/****** Begin DisplayName ******/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DisplayNames]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DisplayNames](
	[ID] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [Name] [nvarchar](MAX) NOT NULL,
    [Created] [datetime] NOT NULL,
    [Updated] [datetime] NULL,
 CONSTRAINT [PK_DisplayNames] PRIMARY KEY CLUSTERED
(
    [ID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END

/****** End DisplayName ******/

/****** Begin UserStatus ******/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserStatuses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserStatuses](
	[ID] [tinyint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [Value] [nvarchar](MAX) NOT NULL,
    [Created] [datetime] NOT NULL,
    [Updated] [datetime] NULL,
 CONSTRAINT [PK_UserStatuses] PRIMARY KEY CLUSTERED
(
    [ID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END

/****** End UserStatus ******/

/****** Begin GenderType ******/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GenderTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GenderTypes](
	[ID] [tinyint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [Value] [nvarchar](MAX) NOT NULL,
    [Created] [datetime] NOT NULL,
    [Updated] [datetime] NULL,
 CONSTRAINT [PK_GenderTypes] PRIMARY KEY CLUSTERED
(
    [ID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END

/****** End GenderType ******/

/****** Begin User ******/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Users](
	[ID] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [Name] [varchar](64) NOT NULL,
    [DisplayNameID] [bigint] NULL,
    [UserModerationStatusID] [tinyint] NOT NULL,
    [Description] [nvarchar](MAX) NOT NULL,
    [AgeBracket] [tinyint] NOT NULL,
    [AgentID] [bigint] NULL,
    [BirthDate] [datetime] NULL,
    [GenderTypeID] [tinyint] NULL,
    [Created] [datetime] NOT NULL,
    [Updated] [datetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED
(
    [ID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_UserStatuses_UserModerationStatusID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
ALTER TABLE [dbo].[Users] 
WITH CHECK ADD CONSTRAINT [FK_Users_UserStatuses_UserModerationStatusID] FOREIGN KEY ([UserModerationStatusID])
REFERENCES [dbo].[UserStatuses] ([ID])
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_UserStatuses_UserModerationStatusID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_UserStatuses_UserModerationStatusID]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_Agents_AgentID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
ALTER TABLE [dbo].[Users] 
WITH CHECK ADD CONSTRAINT [FK_Users_Agents_AgentID] FOREIGN KEY ([AgentID])
REFERENCES [dbo].[Agents] ([ID])
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_Agents_AgentID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Agents_AgentID]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_GenderTypes_GenderTypeID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
ALTER TABLE [dbo].[Users] 
WITH CHECK ADD CONSTRAINT [FK_Users_GenderTypes_GenderTypeID] FOREIGN KEY ([GenderTypeID])
REFERENCES [dbo].[GenderTypes] ([ID])
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_GenderTypes_GenderTypeID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_GenderTypes_GenderTypeID]

/****** End User ******/

/****** Begin DisplayNameHistory ******/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DisplayNameHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DisplayNameHistory](
	[ID] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [UserID] [bigint] NOT NULL,
    [DisplayNameID] [bigint] NOT NULL,
    [Created] [datetime] NOT NULL,
    [Updated] [datetime] NULL,
 CONSTRAINT [PK_DisplayNameHistory] PRIMARY KEY CLUSTERED
(
    [ID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DisplayNameHistory_Users_UserID]') AND parent_object_id = OBJECT_ID(N'[dbo].[DisplayNameHistory]'))
ALTER TABLE [dbo].[DisplayNameHistory] 
WITH CHECK ADD CONSTRAINT [FK_DisplayNameHistory_Users_UserID] FOREIGN KEY ([UserID])
REFERENCES [dbo].[Users] ([ID])
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DisplayNameHistory_Users_UserID]') AND parent_object_id = OBJECT_ID(N'[dbo].[DisplayNameHistory]'))
ALTER TABLE [dbo].[DisplayNameHistory] CHECK CONSTRAINT [FK_DisplayNameHistory_Users_UserID]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DisplayNameHistory_DisplayNames_DisplayNameID]') AND parent_object_id = OBJECT_ID(N'[dbo].[DisplayNameHistory]'))
ALTER TABLE [dbo].[DisplayNameHistory] 
WITH CHECK ADD CONSTRAINT [FK_DisplayNameHistory_DisplayNames_DisplayNameID] FOREIGN KEY ([DisplayNameID])
REFERENCES [dbo].[DisplayNames] ([ID])
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DisplayNameHistory_DisplayNames_DisplayNameID]') AND parent_object_id = OBJECT_ID(N'[dbo].[DisplayNameHistory]'))
ALTER TABLE [dbo].[DisplayNameHistory] CHECK CONSTRAINT [FK_DisplayNameHistory_DisplayNames_DisplayNameID]

/****** End DisplayNameHistory ******/

/****** Begin UserNameHistory ******/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserNameHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserNameHistory](
	[ID] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [UserID] [bigint] NOT NULL,
    [Name] [varchar](64) NOT NULL,
    [Created] [datetime] NOT NULL,
    [Updated] [datetime] NULL,
 CONSTRAINT [PK_UserNameHistory] PRIMARY KEY CLUSTERED
(
    [ID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserNameHistory_Users_UserID]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserNameHistory]'))
ALTER TABLE [dbo].[UserNameHistory] 
WITH CHECK ADD CONSTRAINT [FK_UserNameHistory_Users_UserID] FOREIGN KEY ([UserID])
REFERENCES [dbo].[Users] ([ID])
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserNameHistory_Users_UserID]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserNameHistory]'))
ALTER TABLE [dbo].[UserNameHistory] CHECK CONSTRAINT [FK_UserNameHistory_Users_UserID]

/****** End UserNameHistory ******/

/****** Begin UserPasswordHash ******/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserPasswordHashes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserPasswordHashes](
	[ID] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [UserID] [bigint] NOT NULL,
    [IsValid] [bit] NOT NULL,
    [Hash] [varchar](128) NOT NULL,
    [Created] [datetime] NOT NULL,
    [Updated] [datetime] NULL,
 CONSTRAINT [PK_UserPasswordHashes] PRIMARY KEY CLUSTERED
(
    [ID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserPasswordHashes_Users_UserID]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserPasswordHashes]'))
ALTER TABLE [dbo].[UserPasswordHashes] 
WITH CHECK ADD CONSTRAINT [FK_UserPasswordHashes_Users_UserID] FOREIGN KEY ([UserID])
REFERENCES [dbo].[Users] ([ID])
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserPasswordHashes_Users_UserID]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserPasswordHashes]'))
ALTER TABLE [dbo].[UserPasswordHashes] CHECK CONSTRAINT [FK_UserPasswordHashes_Users_UserID]

/****** End UserPasswordHash ******/

/****** Begin UsersNeedingPasswordReset ******/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UsersNeedingPasswordReset]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UsersNeedingPasswordReset](
	[ID] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [UserID] [bigint] NOT NULL,
    [Created] [datetime] NOT NULL,
    [Updated] [datetime] NULL,
 CONSTRAINT [PK_UsersNeedingPasswordReset] PRIMARY KEY CLUSTERED
(
    [ID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UsersNeedingPasswordReset_Users_UserID]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersNeedingPasswordReset]'))
ALTER TABLE [dbo].[UsersNeedingPasswordReset] 
WITH CHECK ADD CONSTRAINT [FK_UsersNeedingPasswordReset_Users_UserID] FOREIGN KEY ([UserID])
REFERENCES [dbo].[Users] ([ID])
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UsersNeedingPasswordReset_Users_UserID]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersNeedingPasswordReset]'))
ALTER TABLE [dbo].[UsersNeedingPasswordReset] CHECK CONSTRAINT [FK_UsersNeedingPasswordReset_Users_UserID]

/****** End UsersNeedingPasswordReset ******/

/****** Begin Data Tables ******/

IF NOT EXISTS (SELECT * FROM sys.types WHERE user_type_id = TYPE_ID(N'[dbo].[BigIntList]') AND is_table_type = 1)
BEGIN
CREATE TYPE [dbo].[BigIntList] AS TABLE(
	[ID] [bigint] NOT NULL,
	PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)

END

/****** End Data Tables ******/

/****** Begin AgentType ******/

/* Standard Insertion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AgentTypes_InsertAgentType]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[AgentTypes_InsertAgentType] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[AgentTypes_InsertAgentType]
(
	@ID [tinyint] OUTPUT,
    @Value [nvarchar](MAX),
    @Created [datetime],
    @Updated [datetime] NULL
)
AS

SET NOCOUNT ON

INSERT INTO
	[AgentTypes]
(
[Value],
[Created],
[Updated]
)
VALUES
(
@Value,
@Created,
@Updated
)

SET @ID = SCOPE_IDENTITY();

SET NOCOUNT OFF

RETURN

GO

/* Standard Update */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AgentTypes_UpdateAgentTypeByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[AgentTypes_UpdateAgentTypeByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[AgentTypes_UpdateAgentTypeByID]
(
    @ID [tinyint],
    @Value [nvarchar](MAX),
    @Created [datetime],
    @Updated [datetime] NULL
)
AS

SET NOCOUNT ON

UPDATE
    [AgentTypes]
SET
[Value] = @Value,
[Created] = @Created,
[Updated] = @Updated
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Deletion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AgentTypes_DeleteAgentTypeByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[AgentTypes_DeleteAgentTypeByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[AgentTypes_DeleteAgentTypeByID]
(
    @ID [tinyint]
)
AS

SET NOCOUNT ON

DELETE FROM
    [AgentTypes]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Get-By-ID */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AgentTypes_GetAgentTypeByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[AgentTypes_GetAgentTypeByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[AgentTypes_GetAgentTypeByID]
(
    @ID [tinyint]
)
AS

SET NOCOUNT ON

SELECT
    [ID],
    [Value]
    ,[Created]
    ,[Updated]
FROM
    [AgentTypes]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AgentTypes_GetAgentTypeByValue]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[AgentTypes_GetAgentTypeByValue] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[AgentTypes_GetAgentTypeByValue]
(
    @Value [nvarchar](MAX)
)
AS

SET NOCOUNT ON

SELECT
    [ID]
    ,[Value]
    ,[Created]
    ,[Updated]
FROM
	[AgentTypes]
WHERE
	([Value] = @Value)

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AgentTypes_GetOrCreateAgentType]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[AgentTypes_GetOrCreateAgentType] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[AgentTypes_GetOrCreateAgentType]
(
    @CreatedNewEntity [bit] OUTPUT,
    @Value [nvarchar](MAX)
)
AS

SET NOCOUNT ON

DECLARE @ID [tinyint]

SELECT
    @ID = [ID]
FROM
	[AgentTypes]
WHERE
	([Value] = @Value)

IF (@ID IS NULL)
BEGIN
    DECLARE @Created [datetime] = GETDATE()
    DECLARE @Updated [datetime] = @Created
    INSERT INTO
	[AgentTypes]
    (
        [Value],
        [Created], 
        [Updated]
    )
    VALUES
    (
        @Value,
        @Created,
        @Updated
    )
    SET @ID = SCOPE_IDENTITY();
    SET @CreatedNewEntity = 1
END
ELSE
BEGIN
    SET @CreatedNewEntity = 0
END

SELECT
    [ID]
    ,[Value]
    ,[Created]
    ,[Updated]
FROM
    [AgentTypes]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO
/********** End AgentType **********/
/****** Begin Agent ******/

/* Standard Insertion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Agents_InsertAgent]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[Agents_InsertAgent] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[Agents_InsertAgent]
(
	@ID [bigint] OUTPUT,
    @AgentTypeID [tinyint],
    @AgentTargetID [bigint],
    @Created [datetime],
    @Updated [datetime] NULL
)
AS

SET NOCOUNT ON

INSERT INTO
	[Agents]
(
[AgentTypeID],
[AgentTargetID],
[Created],
[Updated]
)
VALUES
(
@AgentTypeID,
@AgentTargetID,
@Created,
@Updated
)

SET @ID = SCOPE_IDENTITY();

SET NOCOUNT OFF

RETURN

GO

/* Standard Update */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Agents_UpdateAgentByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[Agents_UpdateAgentByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[Agents_UpdateAgentByID]
(
    @ID [bigint],
    @AgentTypeID [tinyint],
    @AgentTargetID [bigint],
    @Created [datetime],
    @Updated [datetime] NULL
)
AS

SET NOCOUNT ON

UPDATE
    [Agents]
SET
[AgentTypeID] = @AgentTypeID,
[AgentTargetID] = @AgentTargetID,
[Created] = @Created,
[Updated] = @Updated
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Deletion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Agents_DeleteAgentByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[Agents_DeleteAgentByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[Agents_DeleteAgentByID]
(
    @ID [bigint]
)
AS

SET NOCOUNT ON

DELETE FROM
    [Agents]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Get-By-ID */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Agents_GetAgentByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[Agents_GetAgentByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[Agents_GetAgentByID]
(
    @ID [bigint]
)
AS

SET NOCOUNT ON

SELECT
    [ID],
    [AgentTypeID]
    ,[AgentTargetID]
    ,[Created]
    ,[Updated]
FROM
    [Agents]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Agents_GetAgentByAgentTypeIDAndAgentTargetID]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[Agents_GetAgentByAgentTypeIDAndAgentTargetID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Agents_GetAgentByAgentTypeIDAndAgentTargetID]
(
    @AgentTypeID [tinyint],
    @AgentTargetID [bigint]
)
AS

SET NOCOUNT ON

SELECT
    [ID]
    ,[AgentTypeID]
    ,[AgentTargetID]
    ,[Created]
    ,[Updated]
FROM
	[Agents]
WHERE
	([AgentTypeID] = @AgentTypeID) AND ([AgentTargetID] = @AgentTargetID)

SET NOCOUNT OFF

RETURN

GO
/********** End Agent **********/
/****** Begin DisplayName ******/

/* Standard Insertion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DisplayNames_InsertDisplayName]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[DisplayNames_InsertDisplayName] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[DisplayNames_InsertDisplayName]
(
	@ID [bigint] OUTPUT,
    @Name [nvarchar](MAX),
    @Created [datetime],
    @Updated [datetime] NULL
)
AS

SET NOCOUNT ON

INSERT INTO
	[DisplayNames]
(
[Name],
[Created],
[Updated]
)
VALUES
(
@Name,
@Created,
@Updated
)

SET @ID = SCOPE_IDENTITY();

SET NOCOUNT OFF

RETURN

GO

/* Standard Update */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DisplayNames_UpdateDisplayNameByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[DisplayNames_UpdateDisplayNameByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[DisplayNames_UpdateDisplayNameByID]
(
    @ID [bigint],
    @Name [nvarchar](MAX),
    @Created [datetime],
    @Updated [datetime] NULL
)
AS

SET NOCOUNT ON

UPDATE
    [DisplayNames]
SET
[Name] = @Name,
[Created] = @Created,
[Updated] = @Updated
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Deletion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DisplayNames_DeleteDisplayNameByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[DisplayNames_DeleteDisplayNameByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[DisplayNames_DeleteDisplayNameByID]
(
    @ID [bigint]
)
AS

SET NOCOUNT ON

DELETE FROM
    [DisplayNames]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Get-By-ID */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DisplayNames_GetDisplayNameByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[DisplayNames_GetDisplayNameByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[DisplayNames_GetDisplayNameByID]
(
    @ID [bigint]
)
AS

SET NOCOUNT ON

SELECT
    [ID],
    [Name]
    ,[Created]
    ,[Updated]
FROM
    [DisplayNames]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DisplayNames_GetOrCreateDisplayName]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[DisplayNames_GetOrCreateDisplayName] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[DisplayNames_GetOrCreateDisplayName]
(
    @CreatedNewEntity [bit] OUTPUT,
    @Name [nvarchar](MAX)
)
AS

SET NOCOUNT ON

DECLARE @ID [bigint]

SELECT
    @ID = [ID]
FROM
	[DisplayNames]
WHERE
	([Name] = @Name)

IF (@ID IS NULL)
BEGIN
    DECLARE @Created [datetime] = GETDATE()
    DECLARE @Updated [datetime] = @Created
    INSERT INTO
	[DisplayNames]
    (
        [Name],
        [Created], 
        [Updated]
    )
    VALUES
    (
        @Name,
        @Created,
        @Updated
    )
    SET @ID = SCOPE_IDENTITY();
    SET @CreatedNewEntity = 1
END
ELSE
BEGIN
    SET @CreatedNewEntity = 0
END

SELECT
    [ID]
    ,[Name]
    ,[Created]
    ,[Updated]
FROM
    [DisplayNames]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO
/********** End DisplayName **********/
/****** Begin UserStatus ******/

/* Standard Insertion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserStatuses_InsertUserStatus]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[UserStatuses_InsertUserStatus] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[UserStatuses_InsertUserStatus]
(
	@ID [tinyint] OUTPUT,
    @Value [nvarchar](MAX),
    @Created [datetime],
    @Updated [datetime] NULL
)
AS

SET NOCOUNT ON

INSERT INTO
	[UserStatuses]
(
[Value],
[Created],
[Updated]
)
VALUES
(
@Value,
@Created,
@Updated
)

SET @ID = SCOPE_IDENTITY();

SET NOCOUNT OFF

RETURN

GO

/* Standard Update */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserStatuses_UpdateUserStatusByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[UserStatuses_UpdateUserStatusByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[UserStatuses_UpdateUserStatusByID]
(
    @ID [tinyint],
    @Value [nvarchar](MAX),
    @Created [datetime],
    @Updated [datetime] NULL
)
AS

SET NOCOUNT ON

UPDATE
    [UserStatuses]
SET
[Value] = @Value,
[Created] = @Created,
[Updated] = @Updated
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Deletion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserStatuses_DeleteUserStatusByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[UserStatuses_DeleteUserStatusByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[UserStatuses_DeleteUserStatusByID]
(
    @ID [tinyint]
)
AS

SET NOCOUNT ON

DELETE FROM
    [UserStatuses]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Get-By-ID */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserStatuses_GetUserStatusByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[UserStatuses_GetUserStatusByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[UserStatuses_GetUserStatusByID]
(
    @ID [tinyint]
)
AS

SET NOCOUNT ON

SELECT
    [ID],
    [Value]
    ,[Created]
    ,[Updated]
FROM
    [UserStatuses]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserStatuses_GetUserStatusByValue]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[UserStatuses_GetUserStatusByValue] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[UserStatuses_GetUserStatusByValue]
(
    @Value [nvarchar](MAX)
)
AS

SET NOCOUNT ON

SELECT
    [ID]
    ,[Value]
    ,[Created]
    ,[Updated]
FROM
	[UserStatuses]
WHERE
	([Value] = @Value)

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserStatuses_GetOrCreateUserStatus]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[UserStatuses_GetOrCreateUserStatus] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[UserStatuses_GetOrCreateUserStatus]
(
    @CreatedNewEntity [bit] OUTPUT,
    @Value [nvarchar](MAX)
)
AS

SET NOCOUNT ON

DECLARE @ID [tinyint]

SELECT
    @ID = [ID]
FROM
	[UserStatuses]
WHERE
	([Value] = @Value)

IF (@ID IS NULL)
BEGIN
    DECLARE @Created [datetime] = GETDATE()
    DECLARE @Updated [datetime] = @Created
    INSERT INTO
	[UserStatuses]
    (
        [Value],
        [Created], 
        [Updated]
    )
    VALUES
    (
        @Value,
        @Created,
        @Updated
    )
    SET @ID = SCOPE_IDENTITY();
    SET @CreatedNewEntity = 1
END
ELSE
BEGIN
    SET @CreatedNewEntity = 0
END

SELECT
    [ID]
    ,[Value]
    ,[Created]
    ,[Updated]
FROM
    [UserStatuses]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO
/********** End UserStatus **********/
/****** Begin GenderType ******/

/* Standard Insertion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GenderTypes_InsertGenderType]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[GenderTypes_InsertGenderType] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[GenderTypes_InsertGenderType]
(
	@ID [tinyint] OUTPUT,
    @Value [nvarchar](MAX),
    @Created [datetime],
    @Updated [datetime] NULL
)
AS

SET NOCOUNT ON

INSERT INTO
	[GenderTypes]
(
[Value],
[Created],
[Updated]
)
VALUES
(
@Value,
@Created,
@Updated
)

SET @ID = SCOPE_IDENTITY();

SET NOCOUNT OFF

RETURN

GO

/* Standard Update */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GenderTypes_UpdateGenderTypeByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[GenderTypes_UpdateGenderTypeByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[GenderTypes_UpdateGenderTypeByID]
(
    @ID [tinyint],
    @Value [nvarchar](MAX),
    @Created [datetime],
    @Updated [datetime] NULL
)
AS

SET NOCOUNT ON

UPDATE
    [GenderTypes]
SET
[Value] = @Value,
[Created] = @Created,
[Updated] = @Updated
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Deletion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GenderTypes_DeleteGenderTypeByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[GenderTypes_DeleteGenderTypeByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[GenderTypes_DeleteGenderTypeByID]
(
    @ID [tinyint]
)
AS

SET NOCOUNT ON

DELETE FROM
    [GenderTypes]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Get-By-ID */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GenderTypes_GetGenderTypeByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[GenderTypes_GetGenderTypeByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[GenderTypes_GetGenderTypeByID]
(
    @ID [tinyint]
)
AS

SET NOCOUNT ON

SELECT
    [ID],
    [Value]
    ,[Created]
    ,[Updated]
FROM
    [GenderTypes]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GenderTypes_GetGenderTypeByValue]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[GenderTypes_GetGenderTypeByValue] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[GenderTypes_GetGenderTypeByValue]
(
    @Value [nvarchar](MAX)
)
AS

SET NOCOUNT ON

SELECT
    [ID]
    ,[Value]
    ,[Created]
    ,[Updated]
FROM
	[GenderTypes]
WHERE
	([Value] = @Value)

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GenderTypes_GetOrCreateGenderType]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[GenderTypes_GetOrCreateGenderType] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[GenderTypes_GetOrCreateGenderType]
(
    @CreatedNewEntity [bit] OUTPUT,
    @Value [nvarchar](MAX)
)
AS

SET NOCOUNT ON

DECLARE @ID [tinyint]

SELECT
    @ID = [ID]
FROM
	[GenderTypes]
WHERE
	([Value] = @Value)

IF (@ID IS NULL)
BEGIN
    DECLARE @Created [datetime] = GETDATE()
    DECLARE @Updated [datetime] = @Created
    INSERT INTO
	[GenderTypes]
    (
        [Value],
        [Created], 
        [Updated]
    )
    VALUES
    (
        @Value,
        @Created,
        @Updated
    )
    SET @ID = SCOPE_IDENTITY();
    SET @CreatedNewEntity = 1
END
ELSE
BEGIN
    SET @CreatedNewEntity = 0
END

SELECT
    [ID]
    ,[Value]
    ,[Created]
    ,[Updated]
FROM
    [GenderTypes]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO
/********** End GenderType **********/
/****** Begin User ******/

/* Standard Insertion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users_InsertUser]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[Users_InsertUser] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[Users_InsertUser]
(
	@ID [bigint] OUTPUT,
    @Name [varchar](64),
    @DisplayNameID [bigint] NULL,
    @UserModerationStatusID [tinyint],
    @Description [nvarchar](MAX),
    @AgeBracket [tinyint],
    @AgentID [bigint] NULL,
    @BirthDate [datetime] NULL,
    @GenderTypeID [tinyint] NULL,
    @Created [datetime],
    @Updated [datetime] NULL
)
AS

SET NOCOUNT ON

INSERT INTO
	[Users]
(
[Name],
[DisplayNameID],
[UserModerationStatusID],
[Description],
[AgeBracket],
[AgentID],
[BirthDate],
[GenderTypeID],
[Created],
[Updated]
)
VALUES
(
@Name,
@DisplayNameID,
@UserModerationStatusID,
@Description,
@AgeBracket,
@AgentID,
@BirthDate,
@GenderTypeID,
@Created,
@Updated
)

SET @ID = SCOPE_IDENTITY();

SET NOCOUNT OFF

RETURN

GO

/* Standard Update */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users_UpdateUserByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[Users_UpdateUserByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[Users_UpdateUserByID]
(
    @ID [bigint],
    @Name [varchar](64),
    @DisplayNameID [bigint] NULL,
    @UserModerationStatusID [tinyint],
    @Description [nvarchar](MAX),
    @AgeBracket [tinyint],
    @AgentID [bigint] NULL,
    @BirthDate [datetime] NULL,
    @GenderTypeID [tinyint] NULL,
    @Created [datetime],
    @Updated [datetime] NULL
)
AS

SET NOCOUNT ON

UPDATE
    [Users]
SET
[Name] = @Name,
[DisplayNameID] = @DisplayNameID,
[UserModerationStatusID] = @UserModerationStatusID,
[Description] = @Description,
[AgeBracket] = @AgeBracket,
[AgentID] = @AgentID,
[BirthDate] = @BirthDate,
[GenderTypeID] = @GenderTypeID,
[Created] = @Created,
[Updated] = @Updated
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Deletion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users_DeleteUserByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[Users_DeleteUserByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[Users_DeleteUserByID]
(
    @ID [bigint]
)
AS

SET NOCOUNT ON

DELETE FROM
    [Users]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Get-By-ID */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users_GetUserByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[Users_GetUserByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[Users_GetUserByID]
(
    @ID [bigint]
)
AS

SET NOCOUNT ON

SELECT
    [ID],
    [Name]
    ,[DisplayNameID]
    ,[UserModerationStatusID]
    ,[Description]
    ,[AgeBracket]
    ,[AgentID]
    ,[BirthDate]
    ,[GenderTypeID]
    ,[Created]
    ,[Updated]
FROM
    [Users]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users_GetUserByName]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[Users_GetUserByName] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Users_GetUserByName]
(
    @Name [varchar](64)
)
AS

SET NOCOUNT ON

SELECT
    [ID]
    ,[Name]
    ,[DisplayNameID]
    ,[UserModerationStatusID]
    ,[Description]
    ,[AgeBracket]
    ,[AgentID]
    ,[BirthDate]
    ,[GenderTypeID]
    ,[Created]
    ,[Updated]
FROM
	[Users]
WHERE
	([Name] = @Name)

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users_GetUsersByIDs]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[Users_GetUsersByIDs] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Users_GetUsersByIDs]
(
    @IDs [dbo].[BigIntList] READONLY
)
AS

SET NOCOUNT ON

SELECT
    [ID]
    ,[Name]
    ,[DisplayNameID]
    ,[UserModerationStatusID]
    ,[Description]
    ,[AgeBracket]
    ,[AgentID]
    ,[BirthDate]
    ,[GenderTypeID]
    ,[Created]
    ,[Updated]
FROM
	[Users]
WHERE
	([ID] IN (SELECT [ID] FROM @IDs))

SET NOCOUNT OFF

RETURN

GO
/********** End User **********/
/****** Begin DisplayNameHistory ******/

/* Standard Insertion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DisplayNameHistory_InsertDisplayNameHistory]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[DisplayNameHistory_InsertDisplayNameHistory] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[DisplayNameHistory_InsertDisplayNameHistory]
(
	@ID [bigint] OUTPUT,
    @UserID [bigint],
    @DisplayNameID [bigint],
    @Created [datetime],
    @Updated [datetime] NULL
)
AS

SET NOCOUNT ON

INSERT INTO
	[DisplayNameHistory]
(
[UserID],
[DisplayNameID],
[Created],
[Updated]
)
VALUES
(
@UserID,
@DisplayNameID,
@Created,
@Updated
)

SET @ID = SCOPE_IDENTITY();

SET NOCOUNT OFF

RETURN

GO

/* Standard Update */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DisplayNameHistory_UpdateDisplayNameHistoryByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[DisplayNameHistory_UpdateDisplayNameHistoryByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[DisplayNameHistory_UpdateDisplayNameHistoryByID]
(
    @ID [bigint],
    @UserID [bigint],
    @DisplayNameID [bigint],
    @Created [datetime],
    @Updated [datetime] NULL
)
AS

SET NOCOUNT ON

UPDATE
    [DisplayNameHistory]
SET
[UserID] = @UserID,
[DisplayNameID] = @DisplayNameID,
[Created] = @Created,
[Updated] = @Updated
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Deletion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DisplayNameHistory_DeleteDisplayNameHistoryByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[DisplayNameHistory_DeleteDisplayNameHistoryByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[DisplayNameHistory_DeleteDisplayNameHistoryByID]
(
    @ID [bigint]
)
AS

SET NOCOUNT ON

DELETE FROM
    [DisplayNameHistory]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Get-By-ID */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DisplayNameHistory_GetDisplayNameHistoryByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[DisplayNameHistory_GetDisplayNameHistoryByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[DisplayNameHistory_GetDisplayNameHistoryByID]
(
    @ID [bigint]
)
AS

SET NOCOUNT ON

SELECT
    [ID],
    [UserID]
    ,[DisplayNameID]
    ,[Created]
    ,[Updated]
FROM
    [DisplayNameHistory]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DisplayNameHistory_GetDisplayNameHistoryIDsByUserID_Paged]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[DisplayNameHistory_GetDisplayNameHistoryIDsByUserID_Paged] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[DisplayNameHistory_GetDisplayNameHistoryIDsByUserID_Paged]
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
	[DisplayNameHistory]
WHERE
	([UserID] = @UserID)
ORDER BY [ID]
OFFSET @StartRowIndex-2 ROWS FETCH NEXT @MaximumRows ROWS ONLY

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DisplayNameHistory_GetTotalNumberOfDisplayNameHistorysByUserID]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[DisplayNameHistory_GetTotalNumberOfDisplayNameHistorysByUserID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[DisplayNameHistory_GetTotalNumberOfDisplayNameHistorysByUserID]
(
    @UserID [bigint]
)
AS

SET NOCOUNT ON

SELECT
    COUNT(*)
FROM
	[DisplayNameHistory]
WHERE
	([UserID] = @UserID)

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DisplayNameHistory_GetDisplayNameHistoryIDsByDisplayNameID_Paged]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[DisplayNameHistory_GetDisplayNameHistoryIDsByDisplayNameID_Paged] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[DisplayNameHistory_GetDisplayNameHistoryIDsByDisplayNameID_Paged]
(
    @DisplayNameID [bigint],
    @StartRowIndex [bigint],
    @MaximumRows [bigint]
)
AS

SET NOCOUNT ON

SELECT
    [ID]
FROM
	[DisplayNameHistory]
WHERE
	([DisplayNameID] = @DisplayNameID)
ORDER BY [ID]
OFFSET @StartRowIndex-2 ROWS FETCH NEXT @MaximumRows ROWS ONLY

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DisplayNameHistory_GetTotalNumberOfDisplayNameHistorysByDisplayNameID]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[DisplayNameHistory_GetTotalNumberOfDisplayNameHistorysByDisplayNameID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[DisplayNameHistory_GetTotalNumberOfDisplayNameHistorysByDisplayNameID]
(
    @DisplayNameID [bigint]
)
AS

SET NOCOUNT ON

SELECT
    COUNT(*)
FROM
	[DisplayNameHistory]
WHERE
	([DisplayNameID] = @DisplayNameID)

SET NOCOUNT OFF

RETURN

GO
/********** End DisplayNameHistory **********/
/****** Begin UserNameHistory ******/

/* Standard Insertion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserNameHistory_InsertUserNameHistory]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[UserNameHistory_InsertUserNameHistory] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[UserNameHistory_InsertUserNameHistory]
(
	@ID [bigint] OUTPUT,
    @UserID [bigint],
    @Name [varchar](64),
    @Created [datetime],
    @Updated [datetime] NULL
)
AS

SET NOCOUNT ON

INSERT INTO
	[UserNameHistory]
(
[UserID],
[Name],
[Created],
[Updated]
)
VALUES
(
@UserID,
@Name,
@Created,
@Updated
)

SET @ID = SCOPE_IDENTITY();

SET NOCOUNT OFF

RETURN

GO

/* Standard Update */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserNameHistory_UpdateUserNameHistoryByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[UserNameHistory_UpdateUserNameHistoryByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[UserNameHistory_UpdateUserNameHistoryByID]
(
    @ID [bigint],
    @UserID [bigint],
    @Name [varchar](64),
    @Created [datetime],
    @Updated [datetime] NULL
)
AS

SET NOCOUNT ON

UPDATE
    [UserNameHistory]
SET
[UserID] = @UserID,
[Name] = @Name,
[Created] = @Created,
[Updated] = @Updated
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Deletion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserNameHistory_DeleteUserNameHistoryByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[UserNameHistory_DeleteUserNameHistoryByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[UserNameHistory_DeleteUserNameHistoryByID]
(
    @ID [bigint]
)
AS

SET NOCOUNT ON

DELETE FROM
    [UserNameHistory]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Get-By-ID */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserNameHistory_GetUserNameHistoryByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[UserNameHistory_GetUserNameHistoryByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[UserNameHistory_GetUserNameHistoryByID]
(
    @ID [bigint]
)
AS

SET NOCOUNT ON

SELECT
    [ID],
    [UserID]
    ,[Name]
    ,[Created]
    ,[Updated]
FROM
    [UserNameHistory]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserNameHistory_GetUserNameHistoryIDsByUserID_Paged]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[UserNameHistory_GetUserNameHistoryIDsByUserID_Paged] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[UserNameHistory_GetUserNameHistoryIDsByUserID_Paged]
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
	[UserNameHistory]
WHERE
	([UserID] = @UserID)
ORDER BY [ID]
OFFSET @StartRowIndex-2 ROWS FETCH NEXT @MaximumRows ROWS ONLY

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserNameHistory_GetTotalNumberOfUserNameHistorysByUserID]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[UserNameHistory_GetTotalNumberOfUserNameHistorysByUserID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[UserNameHistory_GetTotalNumberOfUserNameHistorysByUserID]
(
    @UserID [bigint]
)
AS

SET NOCOUNT ON

SELECT
    COUNT(*)
FROM
	[UserNameHistory]
WHERE
	([UserID] = @UserID)

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserNameHistory_GetUserNameHistoryIDsByName_Paged]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[UserNameHistory_GetUserNameHistoryIDsByName_Paged] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[UserNameHistory_GetUserNameHistoryIDsByName_Paged]
(
    @Name [varchar](64),
    @StartRowIndex [bigint],
    @MaximumRows [bigint]
)
AS

SET NOCOUNT ON

SELECT
    [ID]
FROM
	[UserNameHistory]
WHERE
	([Name] = @Name)
ORDER BY [ID]
OFFSET @StartRowIndex-2 ROWS FETCH NEXT @MaximumRows ROWS ONLY

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserNameHistory_GetTotalNumberOfUserNameHistorysByName]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[UserNameHistory_GetTotalNumberOfUserNameHistorysByName] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[UserNameHistory_GetTotalNumberOfUserNameHistorysByName]
(
    @Name [varchar](64)
)
AS

SET NOCOUNT ON

SELECT
    COUNT(*)
FROM
	[UserNameHistory]
WHERE
	([Name] = @Name)

SET NOCOUNT OFF

RETURN

GO
/********** End UserNameHistory **********/
/****** Begin UserPasswordHash ******/

/* Standard Insertion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserPasswordHashes_InsertUserPasswordHash]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[UserPasswordHashes_InsertUserPasswordHash] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[UserPasswordHashes_InsertUserPasswordHash]
(
	@ID [bigint] OUTPUT,
    @UserID [bigint],
    @IsValid [bit],
    @Hash [varchar](128),
    @Created [datetime],
    @Updated [datetime] NULL
)
AS

SET NOCOUNT ON

INSERT INTO
	[UserPasswordHashes]
(
[UserID],
[IsValid],
[Hash],
[Created],
[Updated]
)
VALUES
(
@UserID,
@IsValid,
@Hash,
@Created,
@Updated
)

SET @ID = SCOPE_IDENTITY();

SET NOCOUNT OFF

RETURN

GO

/* Standard Update */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserPasswordHashes_UpdateUserPasswordHashByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[UserPasswordHashes_UpdateUserPasswordHashByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[UserPasswordHashes_UpdateUserPasswordHashByID]
(
    @ID [bigint],
    @UserID [bigint],
    @IsValid [bit],
    @Hash [varchar](128),
    @Created [datetime],
    @Updated [datetime] NULL
)
AS

SET NOCOUNT ON

UPDATE
    [UserPasswordHashes]
SET
[UserID] = @UserID,
[IsValid] = @IsValid,
[Hash] = @Hash,
[Created] = @Created,
[Updated] = @Updated
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Deletion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserPasswordHashes_DeleteUserPasswordHashByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[UserPasswordHashes_DeleteUserPasswordHashByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[UserPasswordHashes_DeleteUserPasswordHashByID]
(
    @ID [bigint]
)
AS

SET NOCOUNT ON

DELETE FROM
    [UserPasswordHashes]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Get-By-ID */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserPasswordHashes_GetUserPasswordHashByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[UserPasswordHashes_GetUserPasswordHashByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[UserPasswordHashes_GetUserPasswordHashByID]
(
    @ID [bigint]
)
AS

SET NOCOUNT ON

SELECT
    [ID],
    [UserID]
    ,[IsValid]
    ,[Hash]
    ,[Created]
    ,[Updated]
FROM
    [UserPasswordHashes]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserPasswordHashes_GetTotalNumberOfValidUserPasswordHashesByUserID]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[UserPasswordHashes_GetTotalNumberOfValidUserPasswordHashesByUserID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[UserPasswordHashes_GetTotalNumberOfValidUserPasswordHashesByUserID]
(
    @UserID [bigint]
)
AS

SET NOCOUNT ON

SELECT
    COUNT(*)
FROM
	[UserPasswordHashes]
WHERE
	([UserID] = @UserID) AND ([IsValid] = 1)

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserPasswordHashes_GetValidUserPasswordHashIDsByUserID_Paged]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[UserPasswordHashes_GetValidUserPasswordHashIDsByUserID_Paged] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[UserPasswordHashes_GetValidUserPasswordHashIDsByUserID_Paged]
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
	[UserPasswordHashes]
WHERE
	([UserID] = @UserID) AND ([IsValid] = 1)
ORDER BY [ID]
OFFSET @StartRowIndex-2 ROWS FETCH NEXT @MaximumRows ROWS ONLY

SET NOCOUNT OFF

RETURN

GO
/********** End UserPasswordHash **********/
/****** Begin UsersNeedingPasswordReset ******/

/* Standard Insertion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UsersNeedingPasswordReset_InsertUsersNeedingPasswordReset]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[UsersNeedingPasswordReset_InsertUsersNeedingPasswordReset] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[UsersNeedingPasswordReset_InsertUsersNeedingPasswordReset]
(
	@ID [bigint] OUTPUT,
    @UserID [bigint],
    @Created [datetime],
    @Updated [datetime] NULL
)
AS

SET NOCOUNT ON

INSERT INTO
	[UsersNeedingPasswordReset]
(
[UserID],
[Created],
[Updated]
)
VALUES
(
@UserID,
@Created,
@Updated
)

SET @ID = SCOPE_IDENTITY();

SET NOCOUNT OFF

RETURN

GO

/* Standard Update */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UsersNeedingPasswordReset_UpdateUsersNeedingPasswordResetByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[UsersNeedingPasswordReset_UpdateUsersNeedingPasswordResetByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[UsersNeedingPasswordReset_UpdateUsersNeedingPasswordResetByID]
(
    @ID [bigint],
    @UserID [bigint],
    @Created [datetime],
    @Updated [datetime] NULL
)
AS

SET NOCOUNT ON

UPDATE
    [UsersNeedingPasswordReset]
SET
[UserID] = @UserID,
[Created] = @Created,
[Updated] = @Updated
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Deletion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UsersNeedingPasswordReset_DeleteUsersNeedingPasswordResetByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[UsersNeedingPasswordReset_DeleteUsersNeedingPasswordResetByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[UsersNeedingPasswordReset_DeleteUsersNeedingPasswordResetByID]
(
    @ID [bigint]
)
AS

SET NOCOUNT ON

DELETE FROM
    [UsersNeedingPasswordReset]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Get-By-ID */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UsersNeedingPasswordReset_GetUsersNeedingPasswordResetByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[UsersNeedingPasswordReset_GetUsersNeedingPasswordResetByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[UsersNeedingPasswordReset_GetUsersNeedingPasswordResetByID]
(
    @ID [bigint]
)
AS

SET NOCOUNT ON

SELECT
    [ID],
    [UserID]
    ,[Created]
    ,[Updated]
FROM
    [UsersNeedingPasswordReset]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UsersNeedingPasswordReset_GetUsersNeedingPasswordResetIDsByUserID]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[UsersNeedingPasswordReset_GetUsersNeedingPasswordResetIDsByUserID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[UsersNeedingPasswordReset_GetUsersNeedingPasswordResetIDsByUserID]
(
    @UserID [bigint]
)
AS

SET NOCOUNT ON

SELECT
    [ID]
FROM
	[UsersNeedingPasswordReset]
WHERE
	([UserID] = @UserID)

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UsersNeedingPasswordReset_GetUsersNeedingPasswordResetsByIDs]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[UsersNeedingPasswordReset_GetUsersNeedingPasswordResetsByIDs] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[UsersNeedingPasswordReset_GetUsersNeedingPasswordResetsByIDs]
(
    @IDs [dbo].[BigIntList] READONLY
)
AS

SET NOCOUNT ON

SELECT
    [ID]
    ,[UserID]
    ,[Created]
    ,[Updated]
FROM
	[UsersNeedingPasswordReset]
WHERE
	([ID] IN (SELECT [ID] FROM @IDs))

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UsersNeedingPasswordReset_GetOrCreateUsersNeedingPasswordReset]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[UsersNeedingPasswordReset_GetOrCreateUsersNeedingPasswordReset] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[UsersNeedingPasswordReset_GetOrCreateUsersNeedingPasswordReset]
(
    @CreatedNewEntity [bit] OUTPUT,
    @UserID [bigint]
)
AS

SET NOCOUNT ON

DECLARE @ID [bigint]

SELECT
    @ID = [ID]
FROM
	[UsersNeedingPasswordReset]
WHERE
	([UserID] = @UserID)

IF (@ID IS NULL)
BEGIN
    DECLARE @Created [datetime] = GETDATE()
    DECLARE @Updated [datetime] = @Created
    INSERT INTO
	[UsersNeedingPasswordReset]
    (
        [UserID],
        [Created], 
        [Updated]
    )
    VALUES
    (
        @UserID,
        @Created,
        @Updated
    )
    SET @ID = SCOPE_IDENTITY();
    SET @CreatedNewEntity = 1
END
ELSE
BEGIN
    SET @CreatedNewEntity = 0
END

SELECT
    [ID]
    ,[UserID]
    ,[Created]
    ,[Updated]
FROM
    [UsersNeedingPasswordReset]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO
/********** End UsersNeedingPasswordReset **********/