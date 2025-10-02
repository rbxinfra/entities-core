USE [master]
GO

IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = N'RobloxServices')
BEGIN
CREATE DATABASE [RobloxServices] ON  PRIMARY
( NAME = N'RobloxServices', FILENAME = N'/data/RobloxServices/RobloxServices.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxServices2', FILENAME = N'/data/RobloxServices/RobloxServices2.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxServices3', FILENAME = N'/data/RobloxServices/RobloxServices3.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxServices4', FILENAME = N'/data/RobloxServices/RobloxServices4.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxServices5', FILENAME = N'/data/RobloxServices/RobloxServices5.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxServices6', FILENAME = N'/data/RobloxServices/RobloxServices6.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxServices7', FILENAME = N'/data/RobloxServices/RobloxServices7.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxServices8', FILENAME = N'/data/RobloxServices/RobloxServices8.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB )
 LOG ON
( NAME = N'RobloxServices_log', FILENAME = N'/logs/RobloxServices/RobloxServices_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxServices2_log', FILENAME = N'/logs/RobloxServices/RobloxServices2_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxServices3_log', FILENAME = N'/logs/RobloxServices/RobloxServices3_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxServices4_log', FILENAME = N'/logs/RobloxServices/RobloxServices4_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxServices5_log', FILENAME = N'/logs/RobloxServices/RobloxServices5_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxServices6_log', FILENAME = N'/logs/RobloxServices/RobloxServices6_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxServices7_log', FILENAME = N'/logs/RobloxServices/RobloxServices7_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxServices8_log', FILENAME = N'/logs/RobloxServices/RobloxServices8_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB )
END
GO

ALTER DATABASE [RobloxServices] SET COMPATIBILITY_LEVEL = 100
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RobloxServices].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [RobloxServices] SET ANSI_NULL_DEFAULT OFF
GO

ALTER DATABASE [RobloxServices] SET ANSI_NULLS OFF
GO

ALTER DATABASE [RobloxServices] SET ANSI_PADDING OFF
GO

ALTER DATABASE [RobloxServices] SET ANSI_WARNINGS OFF
GO

ALTER DATABASE [RobloxServices] SET ARITHABORT OFF
GO

ALTER DATABASE [RobloxServices] SET AUTO_CLOSE OFF
GO

ALTER DATABASE [RobloxServices] SET AUTO_CREATE_STATISTICS ON
GO

ALTER DATABASE [RobloxServices] SET AUTO_SHRINK OFF
GO

ALTER DATABASE [RobloxServices] SET AUTO_UPDATE_STATISTICS ON
GO

ALTER DATABASE [RobloxServices] SET CURSOR_CLOSE_ON_COMMIT OFF
GO

ALTER DATABASE [RobloxServices] SET CURSOR_DEFAULT  GLOBAL
GO

ALTER DATABASE [RobloxServices] SET CONCAT_NULL_YIELDS_NULL OFF
GO

ALTER DATABASE [RobloxServices] SET NUMERIC_ROUNDABORT OFF
GO

ALTER DATABASE [RobloxServices] SET QUOTED_IDENTIFIER OFF
GO

ALTER DATABASE [RobloxServices] SET RECURSIVE_TRIGGERS OFF
GO

ALTER DATABASE [RobloxServices] SET  DISABLE_BROKER
GO

ALTER DATABASE [RobloxServices] SET AUTO_UPDATE_STATISTICS_ASYNC ON
GO

ALTER DATABASE [RobloxServices] SET DATE_CORRELATION_OPTIMIZATION OFF
GO

ALTER DATABASE [RobloxServices] SET TRUSTWORTHY OFF
GO

ALTER DATABASE [RobloxServices] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO

ALTER DATABASE [RobloxServices] SET PARAMETERIZATION SIMPLE
GO

ALTER DATABASE [RobloxServices] SET READ_COMMITTED_SNAPSHOT OFF
GO

ALTER DATABASE [RobloxServices] SET HONOR_BROKER_PRIORITY OFF
GO

ALTER DATABASE [RobloxServices] SET  READ_WRITE
GO

ALTER DATABASE [RobloxServices] SET RECOVERY FULL
GO

ALTER DATABASE [RobloxServices] SET  MULTI_USER
GO

ALTER DATABASE [RobloxServices] SET PAGE_VERIFY CHECKSUM
GO

ALTER DATABASE [RobloxServices] SET DB_CHAINING OFF
GO

USE [RobloxServices]
GO


/****** Begin StatusType ******/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StatusTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StatusTypes](
	[ID] [tinyint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [Value] [varchar](64) NOT NULL,
    [Created] [datetime] NOT NULL,
    [Updated] [datetime] NULL,
 CONSTRAINT [PK_StatusTypes] PRIMARY KEY CLUSTERED
(
    [ID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END


/****** End StatusType ******/

/****** Begin ApiClient ******/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ApiClients]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ApiClients](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [ApiKey] [uniqueidentifier] NOT NULL,
    [Note] [nvarchar](256) NOT NULL,
    [StatusTypeID] [tinyint] NOT NULL,
    [Created] [datetime] NOT NULL,
    [Updated] [datetime] NULL,
 CONSTRAINT [PK_ApiClients] PRIMARY KEY CLUSTERED
(
    [ID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ApiClients_StatusTypes_StatusTypeID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ApiClients]'))
ALTER TABLE [dbo].[ApiClients] 
WITH CHECK ADD CONSTRAINT [FK_ApiClients_StatusTypes_StatusTypeID] FOREIGN KEY ([StatusTypeID])
REFERENCES [dbo].[StatusTypes] ([ID])
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ApiClients_StatusTypes_StatusTypeID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ApiClients]'))
ALTER TABLE [dbo].[ApiClients] CHECK CONSTRAINT [FK_ApiClients_StatusTypes_StatusTypeID]


/****** End ApiClient ******/

/****** Begin AuthorizationType ******/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AuthorizationTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AuthorizationTypes](
	[ID] [tinyint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [Value] [varchar](64) NOT NULL,
    [Created] [datetime] NOT NULL,
    [Updated] [datetime] NULL,
 CONSTRAINT [PK_AuthorizationTypes] PRIMARY KEY CLUSTERED
(
    [ID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END


/****** End AuthorizationType ******/

/****** Begin Service ******/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Services]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Services](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [Name] [nvarchar](256) NOT NULL,
    [StatusTypeID] [tinyint] NOT NULL,
    [Created] [datetime] NOT NULL,
    [Updated] [datetime] NULL,
 CONSTRAINT [PK_Services] PRIMARY KEY CLUSTERED
(
    [ID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Services_StatusTypes_StatusTypeID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Services]'))
ALTER TABLE [dbo].[Services] 
WITH CHECK ADD CONSTRAINT [FK_Services_StatusTypes_StatusTypeID] FOREIGN KEY ([StatusTypeID])
REFERENCES [dbo].[StatusTypes] ([ID])
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Services_StatusTypes_StatusTypeID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Services]'))
ALTER TABLE [dbo].[Services] CHECK CONSTRAINT [FK_Services_StatusTypes_StatusTypeID]


/****** End Service ******/

/****** Begin Operation ******/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Operations]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Operations](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [Name] [nvarchar](256) NOT NULL,
    [ServiceID] [int] NOT NULL,
    [StatusTypeID] [tinyint] NOT NULL,
    [Created] [datetime] NOT NULL,
    [Updated] [datetime] NULL,
 CONSTRAINT [PK_Operations] PRIMARY KEY CLUSTERED
(
    [ID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Operations_Services_ServiceID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Operations]'))
ALTER TABLE [dbo].[Operations] 
WITH CHECK ADD CONSTRAINT [FK_Operations_Services_ServiceID] FOREIGN KEY ([ServiceID])
REFERENCES [dbo].[Services] ([ID])
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Operations_Services_ServiceID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Operations]'))
ALTER TABLE [dbo].[Operations] CHECK CONSTRAINT [FK_Operations_Services_ServiceID]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Operations_StatusTypes_StatusTypeID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Operations]'))
ALTER TABLE [dbo].[Operations] 
WITH CHECK ADD CONSTRAINT [FK_Operations_StatusTypes_StatusTypeID] FOREIGN KEY ([StatusTypeID])
REFERENCES [dbo].[StatusTypes] ([ID])
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Operations_StatusTypes_StatusTypeID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Operations]'))
ALTER TABLE [dbo].[Operations] CHECK CONSTRAINT [FK_Operations_StatusTypes_StatusTypeID]


/****** End Operation ******/

/****** Begin OperationAuthorization ******/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OperationAuthorizations]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OperationAuthorizations](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [OperationID] [int] NOT NULL,
    [ApiClientID] [int] NOT NULL,
    [AuthorizationTypeID] [tinyint] NOT NULL,
    [Created] [datetime] NOT NULL,
    [Updated] [datetime] NULL,
 CONSTRAINT [PK_OperationAuthorizations] PRIMARY KEY CLUSTERED
(
    [ID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OperationAuthorizations_Operations_OperationID]') AND parent_object_id = OBJECT_ID(N'[dbo].[OperationAuthorizations]'))
ALTER TABLE [dbo].[OperationAuthorizations] 
WITH CHECK ADD CONSTRAINT [FK_OperationAuthorizations_Operations_OperationID] FOREIGN KEY ([OperationID])
REFERENCES [dbo].[Operations] ([ID])
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OperationAuthorizations_Operations_OperationID]') AND parent_object_id = OBJECT_ID(N'[dbo].[OperationAuthorizations]'))
ALTER TABLE [dbo].[OperationAuthorizations] CHECK CONSTRAINT [FK_OperationAuthorizations_Operations_OperationID]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OperationAuthorizations_ApiClients_ApiClientID]') AND parent_object_id = OBJECT_ID(N'[dbo].[OperationAuthorizations]'))
ALTER TABLE [dbo].[OperationAuthorizations] 
WITH CHECK ADD CONSTRAINT [FK_OperationAuthorizations_ApiClients_ApiClientID] FOREIGN KEY ([ApiClientID])
REFERENCES [dbo].[ApiClients] ([ID])
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OperationAuthorizations_ApiClients_ApiClientID]') AND parent_object_id = OBJECT_ID(N'[dbo].[OperationAuthorizations]'))
ALTER TABLE [dbo].[OperationAuthorizations] CHECK CONSTRAINT [FK_OperationAuthorizations_ApiClients_ApiClientID]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OperationAuthorizations_AuthorizationTypes_AuthorizationTypeID]') AND parent_object_id = OBJECT_ID(N'[dbo].[OperationAuthorizations]'))
ALTER TABLE [dbo].[OperationAuthorizations] 
WITH CHECK ADD CONSTRAINT [FK_OperationAuthorizations_AuthorizationTypes_AuthorizationTypeID] FOREIGN KEY ([AuthorizationTypeID])
REFERENCES [dbo].[AuthorizationTypes] ([ID])
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OperationAuthorizations_AuthorizationTypes_AuthorizationTypeID]') AND parent_object_id = OBJECT_ID(N'[dbo].[OperationAuthorizations]'))
ALTER TABLE [dbo].[OperationAuthorizations] CHECK CONSTRAINT [FK_OperationAuthorizations_AuthorizationTypes_AuthorizationTypeID]


/****** End OperationAuthorization ******/

/****** Begin ServiceAuthorization ******/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServiceAuthorizations]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ServiceAuthorizations](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [ServiceID] [int] NOT NULL,
    [ApiClientID] [int] NOT NULL,
    [AuthorizationTypeID] [tinyint] NOT NULL,
    [Created] [datetime] NOT NULL,
    [Updated] [datetime] NULL,
 CONSTRAINT [PK_ServiceAuthorizations] PRIMARY KEY CLUSTERED
(
    [ID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ServiceAuthorizations_Services_ServiceID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServiceAuthorizations]'))
ALTER TABLE [dbo].[ServiceAuthorizations] 
WITH CHECK ADD CONSTRAINT [FK_ServiceAuthorizations_Services_ServiceID] FOREIGN KEY ([ServiceID])
REFERENCES [dbo].[Services] ([ID])
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ServiceAuthorizations_Services_ServiceID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServiceAuthorizations]'))
ALTER TABLE [dbo].[ServiceAuthorizations] CHECK CONSTRAINT [FK_ServiceAuthorizations_Services_ServiceID]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ServiceAuthorizations_ApiClients_ApiClientID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServiceAuthorizations]'))
ALTER TABLE [dbo].[ServiceAuthorizations] 
WITH CHECK ADD CONSTRAINT [FK_ServiceAuthorizations_ApiClients_ApiClientID] FOREIGN KEY ([ApiClientID])
REFERENCES [dbo].[ApiClients] ([ID])
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ServiceAuthorizations_ApiClients_ApiClientID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServiceAuthorizations]'))
ALTER TABLE [dbo].[ServiceAuthorizations] CHECK CONSTRAINT [FK_ServiceAuthorizations_ApiClients_ApiClientID]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ServiceAuthorizations_AuthorizationTypes_AuthorizationTypeID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServiceAuthorizations]'))
ALTER TABLE [dbo].[ServiceAuthorizations] 
WITH CHECK ADD CONSTRAINT [FK_ServiceAuthorizations_AuthorizationTypes_AuthorizationTypeID] FOREIGN KEY ([AuthorizationTypeID])
REFERENCES [dbo].[AuthorizationTypes] ([ID])
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ServiceAuthorizations_AuthorizationTypes_AuthorizationTypeID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServiceAuthorizations]'))
ALTER TABLE [dbo].[ServiceAuthorizations] CHECK CONSTRAINT [FK_ServiceAuthorizations_AuthorizationTypes_AuthorizationTypeID]


/****** End ServiceAuthorization ******/


/****** Begin StatusType ******/

/* Standard Insertion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StatusTypes_InsertStatusType]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[StatusTypes_InsertStatusType] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[StatusTypes_InsertStatusType]
(
	@ID [tinyint] OUTPUT,
    @Value [varchar](64),
    @Created [datetime],
    @Updated [datetime] NULL
)
AS

SET NOCOUNT ON

INSERT INTO
	[StatusTypes]
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

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StatusTypes_UpdateStatusTypeByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[StatusTypes_UpdateStatusTypeByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[StatusTypes_UpdateStatusTypeByID]
(
    @ID [tinyint],
    @Value [varchar](64),
    @Created [datetime],
    @Updated [datetime] NULL
)
AS

SET NOCOUNT ON

UPDATE
    [StatusTypes]
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

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StatusTypes_DeleteStatusTypeByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[StatusTypes_DeleteStatusTypeByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[StatusTypes_DeleteStatusTypeByID]
(
    @ID [tinyint]
)
AS

SET NOCOUNT ON

DELETE FROM
    [StatusTypes]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Get-By-ID */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StatusTypes_GetStatusTypeByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[StatusTypes_GetStatusTypeByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[StatusTypes_GetStatusTypeByID]
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
    [StatusTypes]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StatusTypes_GetStatusTypeByValue]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[StatusTypes_GetStatusTypeByValue] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[StatusTypes_GetStatusTypeByValue]
(
    @Value [varchar](64)
)
AS

SET NOCOUNT ON

SELECT
    [ID]
    ,[Value]
    ,[Created]
    ,[Updated]
FROM
	[StatusTypes]
WHERE
	([Value] = @Value)

SET NOCOUNT OFF

RETURN

GO
/********** End StatusType **********/
/****** Begin ApiClient ******/

/* Standard Insertion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ApiClients_InsertApiClient]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[ApiClients_InsertApiClient] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[ApiClients_InsertApiClient]
(
	@ID [int] OUTPUT,
    @ApiKey [uniqueidentifier],
    @Note [nvarchar](256),
    @StatusTypeID [tinyint],
    @Created [datetime],
    @Updated [datetime] NULL
)
AS

SET NOCOUNT ON

INSERT INTO
	[ApiClients]
(
[ApiKey],
[Note],
[StatusTypeID],
[Created],
[Updated]
)
VALUES
(
@ApiKey,
@Note,
@StatusTypeID,
@Created,
@Updated
)

SET @ID = SCOPE_IDENTITY();

SET NOCOUNT OFF

RETURN

GO

/* Standard Update */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ApiClients_UpdateApiClientByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[ApiClients_UpdateApiClientByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[ApiClients_UpdateApiClientByID]
(
    @ID [int],
    @ApiKey [uniqueidentifier],
    @Note [nvarchar](256),
    @StatusTypeID [tinyint],
    @Created [datetime],
    @Updated [datetime] NULL
)
AS

SET NOCOUNT ON

UPDATE
    [ApiClients]
SET
[ApiKey] = @ApiKey,
[Note] = @Note,
[StatusTypeID] = @StatusTypeID,
[Created] = @Created,
[Updated] = @Updated
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Deletion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ApiClients_DeleteApiClientByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[ApiClients_DeleteApiClientByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[ApiClients_DeleteApiClientByID]
(
    @ID [int]
)
AS

SET NOCOUNT ON

DELETE FROM
    [ApiClients]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Get-By-ID */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ApiClients_GetApiClientByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[ApiClients_GetApiClientByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[ApiClients_GetApiClientByID]
(
    @ID [int]
)
AS

SET NOCOUNT ON

SELECT
    [ID],
    [ApiKey]
    ,[Note]
    ,[StatusTypeID]
    ,[Created]
    ,[Updated]
FROM
    [ApiClients]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ApiClients_GetApiClientByApiKey]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[ApiClients_GetApiClientByApiKey] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[ApiClients_GetApiClientByApiKey]
(
    @ApiKey [uniqueidentifier]
)
AS

SET NOCOUNT ON

SELECT
    [ID]
    ,[ApiKey]
    ,[Note]
    ,[StatusTypeID]
    ,[Created]
    ,[Updated]
FROM
	[ApiClients]
WHERE
	([ApiKey] = @ApiKey)

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ApiClients_GetApiClientByNote]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[ApiClients_GetApiClientByNote] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[ApiClients_GetApiClientByNote]
(
    @Note [nvarchar](256)
)
AS

SET NOCOUNT ON

SELECT
    [ID]
    ,[ApiKey]
    ,[Note]
    ,[StatusTypeID]
    ,[Created]
    ,[Updated]
FROM
	[ApiClients]
WHERE
	([Note] = @Note)

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ApiClients_GetTotalNumberOfApiClients]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[ApiClients_GetTotalNumberOfApiClients] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[ApiClients_GetTotalNumberOfApiClients]
AS

SET NOCOUNT ON

SELECT
    COUNT(*)
FROM
	[ApiClients]

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ApiClients_GetAllApiClientIDs_Paged]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[ApiClients_GetAllApiClientIDs_Paged] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[ApiClients_GetAllApiClientIDs_Paged]
(
    @StartRowIndex [bigint],
    @MaximumRows [bigint]
)
AS

SET NOCOUNT ON

SELECT
    [ID]
FROM
	[ApiClients]
ORDER BY
    [ID] ASC
OFFSET @StartRowIndex ROWS FETCH NEXT @MaximumRows ROWS ONLY

SET NOCOUNT OFF

RETURN

GO
/********** End ApiClient **********/
/****** Begin AuthorizationType ******/

/* Standard Insertion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AuthorizationTypes_InsertAuthorizationType]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[AuthorizationTypes_InsertAuthorizationType] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[AuthorizationTypes_InsertAuthorizationType]
(
	@ID [tinyint] OUTPUT,
    @Value [varchar](64),
    @Created [datetime],
    @Updated [datetime] NULL
)
AS

SET NOCOUNT ON

INSERT INTO
	[AuthorizationTypes]
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

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AuthorizationTypes_UpdateAuthorizationTypeByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[AuthorizationTypes_UpdateAuthorizationTypeByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[AuthorizationTypes_UpdateAuthorizationTypeByID]
(
    @ID [tinyint],
    @Value [varchar](64),
    @Created [datetime],
    @Updated [datetime] NULL
)
AS

SET NOCOUNT ON

UPDATE
    [AuthorizationTypes]
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

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AuthorizationTypes_DeleteAuthorizationTypeByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[AuthorizationTypes_DeleteAuthorizationTypeByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[AuthorizationTypes_DeleteAuthorizationTypeByID]
(
    @ID [tinyint]
)
AS

SET NOCOUNT ON

DELETE FROM
    [AuthorizationTypes]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Get-By-ID */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AuthorizationTypes_GetAuthorizationTypeByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[AuthorizationTypes_GetAuthorizationTypeByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[AuthorizationTypes_GetAuthorizationTypeByID]
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
    [AuthorizationTypes]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AuthorizationTypes_GetAuthorizationTypeByValue]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[AuthorizationTypes_GetAuthorizationTypeByValue] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[AuthorizationTypes_GetAuthorizationTypeByValue]
(
    @Value [varchar](64)
)
AS

SET NOCOUNT ON

SELECT
    [ID]
    ,[Value]
    ,[Created]
    ,[Updated]
FROM
	[AuthorizationTypes]
WHERE
	([Value] = @Value)

SET NOCOUNT OFF

RETURN

GO
/********** End AuthorizationType **********/
/****** Begin Service ******/

/* Standard Insertion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Services_InsertService]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[Services_InsertService] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[Services_InsertService]
(
	@ID [int] OUTPUT,
    @Name [nvarchar](256),
    @StatusTypeID [tinyint],
    @Created [datetime],
    @Updated [datetime] NULL
)
AS

SET NOCOUNT ON

INSERT INTO
	[Services]
(
[Name],
[StatusTypeID],
[Created],
[Updated]
)
VALUES
(
@Name,
@StatusTypeID,
@Created,
@Updated
)

SET @ID = SCOPE_IDENTITY();

SET NOCOUNT OFF

RETURN

GO

/* Standard Update */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Services_UpdateServiceByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[Services_UpdateServiceByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[Services_UpdateServiceByID]
(
    @ID [int],
    @Name [nvarchar](256),
    @StatusTypeID [tinyint],
    @Created [datetime],
    @Updated [datetime] NULL
)
AS

SET NOCOUNT ON

UPDATE
    [Services]
SET
[Name] = @Name,
[StatusTypeID] = @StatusTypeID,
[Created] = @Created,
[Updated] = @Updated
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Deletion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Services_DeleteServiceByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[Services_DeleteServiceByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[Services_DeleteServiceByID]
(
    @ID [int]
)
AS

SET NOCOUNT ON

DELETE FROM
    [Services]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Get-By-ID */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Services_GetServiceByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[Services_GetServiceByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[Services_GetServiceByID]
(
    @ID [int]
)
AS

SET NOCOUNT ON

SELECT
    [ID],
    [Name]
    ,[StatusTypeID]
    ,[Created]
    ,[Updated]
FROM
    [Services]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Services_GetServiceByName]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[Services_GetServiceByName] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Services_GetServiceByName]
(
    @Name [nvarchar](256)
)
AS

SET NOCOUNT ON

SELECT
    [ID]
    ,[Name]
    ,[StatusTypeID]
    ,[Created]
    ,[Updated]
FROM
	[Services]
WHERE
	([Name] = @Name)

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Services_GetTotalNumberOfServices]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[Services_GetTotalNumberOfServices] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Services_GetTotalNumberOfServices]
AS

SET NOCOUNT ON

SELECT
    COUNT(*)
FROM
	[Services]

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Services_GetAllServiceIDs_Paged]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[Services_GetAllServiceIDs_Paged] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Services_GetAllServiceIDs_Paged]
(
    @StartRowIndex [bigint],
    @MaximumRows [bigint]
)
AS

SET NOCOUNT ON

SELECT
    [ID]
FROM
	[Services]
ORDER BY
    [ID] ASC
OFFSET @StartRowIndex ROWS FETCH NEXT @MaximumRows ROWS ONLY

SET NOCOUNT OFF

RETURN

GO
/********** End Service **********/
/****** Begin Operation ******/

/* Standard Insertion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Operations_InsertOperation]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[Operations_InsertOperation] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[Operations_InsertOperation]
(
	@ID [int] OUTPUT,
    @Name [nvarchar](256),
    @ServiceID [int],
    @StatusTypeID [tinyint],
    @Created [datetime],
    @Updated [datetime] NULL
)
AS

SET NOCOUNT ON

INSERT INTO
	[Operations]
(
[Name],
[ServiceID],
[StatusTypeID],
[Created],
[Updated]
)
VALUES
(
@Name,
@ServiceID,
@StatusTypeID,
@Created,
@Updated
)

SET @ID = SCOPE_IDENTITY();

SET NOCOUNT OFF

RETURN

GO

/* Standard Update */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Operations_UpdateOperationByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[Operations_UpdateOperationByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[Operations_UpdateOperationByID]
(
    @ID [int],
    @Name [nvarchar](256),
    @ServiceID [int],
    @StatusTypeID [tinyint],
    @Created [datetime],
    @Updated [datetime] NULL
)
AS

SET NOCOUNT ON

UPDATE
    [Operations]
SET
[Name] = @Name,
[ServiceID] = @ServiceID,
[StatusTypeID] = @StatusTypeID,
[Created] = @Created,
[Updated] = @Updated
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Deletion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Operations_DeleteOperationByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[Operations_DeleteOperationByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[Operations_DeleteOperationByID]
(
    @ID [int]
)
AS

SET NOCOUNT ON

DELETE FROM
    [Operations]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Get-By-ID */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Operations_GetOperationByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[Operations_GetOperationByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[Operations_GetOperationByID]
(
    @ID [int]
)
AS

SET NOCOUNT ON

SELECT
    [ID],
    [Name]
    ,[ServiceID]
    ,[StatusTypeID]
    ,[Created]
    ,[Updated]
FROM
    [Operations]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Operations_GetOperationByServiceIDAndName]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[Operations_GetOperationByServiceIDAndName] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Operations_GetOperationByServiceIDAndName]
(
    @ServiceID [int],
    @Name [nvarchar](256)
)
AS

SET NOCOUNT ON

SELECT
    [ID]
    ,[Name]
    ,[ServiceID]
    ,[StatusTypeID]
    ,[Created]
    ,[Updated]
FROM
	[Operations]
WHERE
	([ServiceID] = @ServiceID) AND ([Name] = @Name)

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Operations_GetTotalNumberOfOperationsByServiceID]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[Operations_GetTotalNumberOfOperationsByServiceID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Operations_GetTotalNumberOfOperationsByServiceID]
(
    @ServiceID [int]
)
AS

SET NOCOUNT ON

SELECT
    COUNT(*)
FROM
	[Operations]
WHERE
	([ServiceID] = @ServiceID)

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Operations_GetOperationIDsByServiceID_Paged]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[Operations_GetOperationIDsByServiceID_Paged] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Operations_GetOperationIDsByServiceID_Paged]
(
    @ServiceID [int],
    @StartRowIndex [bigint],
    @MaximumRows [bigint]
)
AS

SET NOCOUNT ON

SELECT
    [ID]
FROM
	[Operations]
WHERE
	([ServiceID] = @ServiceID)
ORDER BY
    [ID] ASC
OFFSET @StartRowIndex ROWS FETCH NEXT @MaximumRows ROWS ONLY

SET NOCOUNT OFF

RETURN

GO
/********** End Operation **********/
/****** Begin OperationAuthorization ******/

/* Standard Insertion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OperationAuthorizations_InsertOperationAuthorization]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[OperationAuthorizations_InsertOperationAuthorization] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[OperationAuthorizations_InsertOperationAuthorization]
(
	@ID [int] OUTPUT,
    @OperationID [int],
    @ApiClientID [int],
    @AuthorizationTypeID [tinyint],
    @Created [datetime],
    @Updated [datetime] NULL
)
AS

SET NOCOUNT ON

INSERT INTO
	[OperationAuthorizations]
(
[OperationID],
[ApiClientID],
[AuthorizationTypeID],
[Created],
[Updated]
)
VALUES
(
@OperationID,
@ApiClientID,
@AuthorizationTypeID,
@Created,
@Updated
)

SET @ID = SCOPE_IDENTITY();

SET NOCOUNT OFF

RETURN

GO

/* Standard Update */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OperationAuthorizations_UpdateOperationAuthorizationByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[OperationAuthorizations_UpdateOperationAuthorizationByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[OperationAuthorizations_UpdateOperationAuthorizationByID]
(
    @ID [int],
    @OperationID [int],
    @ApiClientID [int],
    @AuthorizationTypeID [tinyint],
    @Created [datetime],
    @Updated [datetime] NULL
)
AS

SET NOCOUNT ON

UPDATE
    [OperationAuthorizations]
SET
[OperationID] = @OperationID,
[ApiClientID] = @ApiClientID,
[AuthorizationTypeID] = @AuthorizationTypeID,
[Created] = @Created,
[Updated] = @Updated
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Deletion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OperationAuthorizations_DeleteOperationAuthorizationByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[OperationAuthorizations_DeleteOperationAuthorizationByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[OperationAuthorizations_DeleteOperationAuthorizationByID]
(
    @ID [int]
)
AS

SET NOCOUNT ON

DELETE FROM
    [OperationAuthorizations]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Get-By-ID */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OperationAuthorizations_GetOperationAuthorizationByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[OperationAuthorizations_GetOperationAuthorizationByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[OperationAuthorizations_GetOperationAuthorizationByID]
(
    @ID [int]
)
AS

SET NOCOUNT ON

SELECT
    [ID],
    [OperationID]
    ,[ApiClientID]
    ,[AuthorizationTypeID]
    ,[Created]
    ,[Updated]
FROM
    [OperationAuthorizations]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OperationAuthorizations_GetOperationAuthorizationByOperationIDAndApiClientID]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[OperationAuthorizations_GetOperationAuthorizationByOperationIDAndApiClientID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[OperationAuthorizations_GetOperationAuthorizationByOperationIDAndApiClientID]
(
    @OperationID [int],
    @ApiClientID [int]
)
AS

SET NOCOUNT ON

SELECT
    [ID]
    ,[OperationID]
    ,[ApiClientID]
    ,[AuthorizationTypeID]
    ,[Created]
    ,[Updated]
FROM
	[OperationAuthorizations]
WHERE
	([OperationID] = @OperationID) AND ([ApiClientID] = @ApiClientID)

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OperationAuthorizations_GetTotalNumberOfOperationAuthorizationsByOperationID]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[OperationAuthorizations_GetTotalNumberOfOperationAuthorizationsByOperationID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[OperationAuthorizations_GetTotalNumberOfOperationAuthorizationsByOperationID]
(
    @OperationID [int]
)
AS

SET NOCOUNT ON

SELECT
    COUNT(*)
FROM
	[OperationAuthorizations]
WHERE
	([OperationID] = @OperationID)

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OperationAuthorizations_GetOperationAuthorizationIDsByOperationID_Paged]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[OperationAuthorizations_GetOperationAuthorizationIDsByOperationID_Paged] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[OperationAuthorizations_GetOperationAuthorizationIDsByOperationID_Paged]
(
    @OperationID [int],
    @StartRowIndex [bigint],
    @MaximumRows [bigint]
)
AS

SET NOCOUNT ON

SELECT
    [ID]
FROM
	[OperationAuthorizations]
WHERE
	([OperationID] = @OperationID)
ORDER BY
    [ID] ASC
OFFSET @StartRowIndex ROWS FETCH NEXT @MaximumRows ROWS ONLY

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OperationAuthorizations_GetTotalNumberOfOperationAuthorizationsByApiClientID]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[OperationAuthorizations_GetTotalNumberOfOperationAuthorizationsByApiClientID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[OperationAuthorizations_GetTotalNumberOfOperationAuthorizationsByApiClientID]
(
    @ApiClientID [int]
)
AS

SET NOCOUNT ON

SELECT
    COUNT(*)
FROM
	[OperationAuthorizations]
WHERE
	([ApiClientID] = @ApiClientID)

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OperationAuthorizations_GetOperationAuthorizationIDsByApiClientID_Paged]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[OperationAuthorizations_GetOperationAuthorizationIDsByApiClientID_Paged] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[OperationAuthorizations_GetOperationAuthorizationIDsByApiClientID_Paged]
(
    @ApiClientID [int],
    @StartRowIndex [bigint],
    @MaximumRows [bigint]
)
AS

SET NOCOUNT ON

SELECT
    [ID]
FROM
	[OperationAuthorizations]
WHERE
	([ApiClientID] = @ApiClientID)
ORDER BY
    [ID] ASC
OFFSET @StartRowIndex ROWS FETCH NEXT @MaximumRows ROWS ONLY

SET NOCOUNT OFF

RETURN

GO
/********** End OperationAuthorization **********/
/****** Begin ServiceAuthorization ******/

/* Standard Insertion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServiceAuthorizations_InsertServiceAuthorization]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[ServiceAuthorizations_InsertServiceAuthorization] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[ServiceAuthorizations_InsertServiceAuthorization]
(
	@ID [int] OUTPUT,
    @ServiceID [int],
    @ApiClientID [int],
    @AuthorizationTypeID [tinyint],
    @Created [datetime],
    @Updated [datetime] NULL
)
AS

SET NOCOUNT ON

INSERT INTO
	[ServiceAuthorizations]
(
[ServiceID],
[ApiClientID],
[AuthorizationTypeID],
[Created],
[Updated]
)
VALUES
(
@ServiceID,
@ApiClientID,
@AuthorizationTypeID,
@Created,
@Updated
)

SET @ID = SCOPE_IDENTITY();

SET NOCOUNT OFF

RETURN

GO

/* Standard Update */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServiceAuthorizations_UpdateServiceAuthorizationByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[ServiceAuthorizations_UpdateServiceAuthorizationByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[ServiceAuthorizations_UpdateServiceAuthorizationByID]
(
    @ID [int],
    @ServiceID [int],
    @ApiClientID [int],
    @AuthorizationTypeID [tinyint],
    @Created [datetime],
    @Updated [datetime] NULL
)
AS

SET NOCOUNT ON

UPDATE
    [ServiceAuthorizations]
SET
[ServiceID] = @ServiceID,
[ApiClientID] = @ApiClientID,
[AuthorizationTypeID] = @AuthorizationTypeID,
[Created] = @Created,
[Updated] = @Updated
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Deletion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServiceAuthorizations_DeleteServiceAuthorizationByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[ServiceAuthorizations_DeleteServiceAuthorizationByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[ServiceAuthorizations_DeleteServiceAuthorizationByID]
(
    @ID [int]
)
AS

SET NOCOUNT ON

DELETE FROM
    [ServiceAuthorizations]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Get-By-ID */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServiceAuthorizations_GetServiceAuthorizationByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[ServiceAuthorizations_GetServiceAuthorizationByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[ServiceAuthorizations_GetServiceAuthorizationByID]
(
    @ID [int]
)
AS

SET NOCOUNT ON

SELECT
    [ID],
    [ServiceID]
    ,[ApiClientID]
    ,[AuthorizationTypeID]
    ,[Created]
    ,[Updated]
FROM
    [ServiceAuthorizations]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServiceAuthorizations_GetServiceAuthorizationByServiceIDAndApiClientID]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[ServiceAuthorizations_GetServiceAuthorizationByServiceIDAndApiClientID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[ServiceAuthorizations_GetServiceAuthorizationByServiceIDAndApiClientID]
(
    @ServiceID [int],
    @ApiClientID [int]
)
AS

SET NOCOUNT ON

SELECT
    [ID]
    ,[ServiceID]
    ,[ApiClientID]
    ,[AuthorizationTypeID]
    ,[Created]
    ,[Updated]
FROM
	[ServiceAuthorizations]
WHERE
	([ServiceID] = @ServiceID) AND ([ApiClientID] = @ApiClientID)

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServiceAuthorizations_GetTotalNumberOfServiceAuthorizationsByServiceID]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[ServiceAuthorizations_GetTotalNumberOfServiceAuthorizationsByServiceID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[ServiceAuthorizations_GetTotalNumberOfServiceAuthorizationsByServiceID]
(
    @ServiceID [int]
)
AS

SET NOCOUNT ON

SELECT
    COUNT(*)
FROM
	[ServiceAuthorizations]
WHERE
	([ServiceID] = @ServiceID)

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServiceAuthorizations_GetServiceAuthorizationIDsByServiceID_Paged]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[ServiceAuthorizations_GetServiceAuthorizationIDsByServiceID_Paged] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[ServiceAuthorizations_GetServiceAuthorizationIDsByServiceID_Paged]
(
    @ServiceID [int],
    @StartRowIndex [bigint],
    @MaximumRows [bigint]
)
AS

SET NOCOUNT ON

SELECT
    [ID]
FROM
	[ServiceAuthorizations]
WHERE
	([ServiceID] = @ServiceID)
ORDER BY
    [ID] ASC
OFFSET @StartRowIndex ROWS FETCH NEXT @MaximumRows ROWS ONLY

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServiceAuthorizations_GetTotalNumberOfServiceAuthorizationsByApiClientID]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[ServiceAuthorizations_GetTotalNumberOfServiceAuthorizationsByApiClientID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[ServiceAuthorizations_GetTotalNumberOfServiceAuthorizationsByApiClientID]
(
    @ApiClientID [int]
)
AS

SET NOCOUNT ON

SELECT
    COUNT(*)
FROM
	[ServiceAuthorizations]
WHERE
	([ApiClientID] = @ApiClientID)

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServiceAuthorizations_GetServiceAuthorizationIDsByApiClientID_Paged]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[ServiceAuthorizations_GetServiceAuthorizationIDsByApiClientID_Paged] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[ServiceAuthorizations_GetServiceAuthorizationIDsByApiClientID_Paged]
(
    @ApiClientID [int],
    @StartRowIndex [bigint],
    @MaximumRows [bigint]
)
AS

SET NOCOUNT ON

SELECT
    [ID]
FROM
	[ServiceAuthorizations]
WHERE
	([ApiClientID] = @ApiClientID)
ORDER BY
    [ID] ASC
OFFSET @StartRowIndex ROWS FETCH NEXT @MaximumRows ROWS ONLY

SET NOCOUNT OFF

RETURN

GO
/********** End ServiceAuthorization **********/