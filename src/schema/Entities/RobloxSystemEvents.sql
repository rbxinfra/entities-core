USE [master]
GO

IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = N'RobloxSystemEvents')
BEGIN
CREATE DATABASE [RobloxSystemEvents] ON  PRIMARY
( NAME = N'RobloxSystemEvents', FILENAME = N'/data/RobloxSystemEvents/RobloxSystemEvents.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxSystemEvents2', FILENAME = N'/data/RobloxSystemEvents/RobloxSystemEvents2.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxSystemEvents3', FILENAME = N'/data/RobloxSystemEvents/RobloxSystemEvents3.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxSystemEvents4', FILENAME = N'/data/RobloxSystemEvents/RobloxSystemEvents4.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxSystemEvents5', FILENAME = N'/data/RobloxSystemEvents/RobloxSystemEvents5.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxSystemEvents6', FILENAME = N'/data/RobloxSystemEvents/RobloxSystemEvents6.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxSystemEvents7', FILENAME = N'/data/RobloxSystemEvents/RobloxSystemEvents7.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxSystemEvents8', FILENAME = N'/data/RobloxSystemEvents/RobloxSystemEvents8.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB )
 LOG ON
( NAME = N'RobloxSystemEvents_log', FILENAME = N'/logs/RobloxSystemEvents/RobloxSystemEvents_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxSystemEvents2_log', FILENAME = N'/logs/RobloxSystemEvents/RobloxSystemEvents2_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxSystemEvents3_log', FILENAME = N'/logs/RobloxSystemEvents/RobloxSystemEvents3_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxSystemEvents4_log', FILENAME = N'/logs/RobloxSystemEvents/RobloxSystemEvents4_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxSystemEvents5_log', FILENAME = N'/logs/RobloxSystemEvents/RobloxSystemEvents5_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxSystemEvents6_log', FILENAME = N'/logs/RobloxSystemEvents/RobloxSystemEvents6_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxSystemEvents7_log', FILENAME = N'/logs/RobloxSystemEvents/RobloxSystemEvents7_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxSystemEvents8_log', FILENAME = N'/logs/RobloxSystemEvents/RobloxSystemEvents8_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB )
END
GO

ALTER DATABASE [RobloxSystemEvents] SET COMPATIBILITY_LEVEL = 100
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RobloxSystemEvents].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [RobloxSystemEvents] SET ANSI_NULL_DEFAULT OFF
GO

ALTER DATABASE [RobloxSystemEvents] SET ANSI_NULLS OFF
GO

ALTER DATABASE [RobloxSystemEvents] SET ANSI_PADDING OFF
GO

ALTER DATABASE [RobloxSystemEvents] SET ANSI_WARNINGS OFF
GO

ALTER DATABASE [RobloxSystemEvents] SET ARITHABORT OFF
GO

ALTER DATABASE [RobloxSystemEvents] SET AUTO_CLOSE OFF
GO

ALTER DATABASE [RobloxSystemEvents] SET AUTO_CREATE_STATISTICS ON
GO

ALTER DATABASE [RobloxSystemEvents] SET AUTO_SHRINK OFF
GO

ALTER DATABASE [RobloxSystemEvents] SET AUTO_UPDATE_STATISTICS ON
GO

ALTER DATABASE [RobloxSystemEvents] SET CURSOR_CLOSE_ON_COMMIT OFF
GO

ALTER DATABASE [RobloxSystemEvents] SET CURSOR_DEFAULT  GLOBAL
GO

ALTER DATABASE [RobloxSystemEvents] SET CONCAT_NULL_YIELDS_NULL OFF
GO

ALTER DATABASE [RobloxSystemEvents] SET NUMERIC_ROUNDABORT OFF
GO

ALTER DATABASE [RobloxSystemEvents] SET QUOTED_IDENTIFIER OFF
GO

ALTER DATABASE [RobloxSystemEvents] SET RECURSIVE_TRIGGERS OFF
GO

ALTER DATABASE [RobloxSystemEvents] SET  DISABLE_BROKER
GO

ALTER DATABASE [RobloxSystemEvents] SET AUTO_UPDATE_STATISTICS_ASYNC ON
GO

ALTER DATABASE [RobloxSystemEvents] SET DATE_CORRELATION_OPTIMIZATION OFF
GO

ALTER DATABASE [RobloxSystemEvents] SET TRUSTWORTHY OFF
GO

ALTER DATABASE [RobloxSystemEvents] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO

ALTER DATABASE [RobloxSystemEvents] SET PARAMETERIZATION SIMPLE
GO

ALTER DATABASE [RobloxSystemEvents] SET READ_COMMITTED_SNAPSHOT OFF
GO

ALTER DATABASE [RobloxSystemEvents] SET HONOR_BROKER_PRIORITY OFF
GO

ALTER DATABASE [RobloxSystemEvents] SET  READ_WRITE
GO

ALTER DATABASE [RobloxSystemEvents] SET RECOVERY FULL
GO

ALTER DATABASE [RobloxSystemEvents] SET  MULTI_USER
GO

ALTER DATABASE [RobloxSystemEvents] SET PAGE_VERIFY CHECKSUM
GO

ALTER DATABASE [RobloxSystemEvents] SET DB_CHAINING OFF
GO

USE [RobloxSystemEvents]
GO


/****** Begin EventType ******/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EventTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EventTypes](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [Value] [varchar](64) NOT NULL,
    [Created] [datetime] NOT NULL,
    [Updated] [datetime] NOT NULL,
 CONSTRAINT [PK_EventTypes] PRIMARY KEY CLUSTERED
(
    [ID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END


/****** End EventType ******/

/****** Begin EventSubtype ******/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EventSubtypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EventSubtypes](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [Value] [varchar](64) NOT NULL,
    [Created] [datetime] NOT NULL,
    [Updated] [datetime] NOT NULL,
 CONSTRAINT [PK_EventSubtypes] PRIMARY KEY CLUSTERED
(
    [ID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END


/****** End EventSubtype ******/

/****** Begin EventSummary ******/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EventSummaries]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EventSummaries](
	[ID] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [Hash] [varchar](64) NOT NULL,
    [Value] [nvarchar](MAX) NOT NULL,
    [Created] [datetime] NOT NULL,
    [Updated] [datetime] NOT NULL,
 CONSTRAINT [PK_EventSummaries] PRIMARY KEY CLUSTERED
(
    [ID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END


/****** End EventSummary ******/

/****** Begin Event ******/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Events]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Events](
	[ID] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [EventTypeID] [int] NOT NULL,
    [EventSubtypeID] [int] NULL,
    [EventSummaryID] [bigint] NOT NULL,
    [Created] [datetime] NOT NULL,
 CONSTRAINT [PK_Events] PRIMARY KEY CLUSTERED
(
    [ID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Events_EventTypes_EventTypeID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Events]'))
ALTER TABLE [dbo].[Events] 
WITH CHECK ADD CONSTRAINT [FK_Events_EventTypes_EventTypeID] FOREIGN KEY ([EventTypeID])
REFERENCES [dbo].[EventTypes] ([ID])
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Events_EventTypes_EventTypeID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Events]'))
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Events_EventTypes_EventTypeID]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Events_EventSubtypes_EventSubtypeID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Events]'))
ALTER TABLE [dbo].[Events] 
WITH CHECK ADD CONSTRAINT [FK_Events_EventSubtypes_EventSubtypeID] FOREIGN KEY ([EventSubtypeID])
REFERENCES [dbo].[EventSubtypes] ([ID])
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Events_EventSubtypes_EventSubtypeID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Events]'))
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Events_EventSubtypes_EventSubtypeID]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Events_EventSummaries_EventSummaryID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Events]'))
ALTER TABLE [dbo].[Events] 
WITH CHECK ADD CONSTRAINT [FK_Events_EventSummaries_EventSummaryID] FOREIGN KEY ([EventSummaryID])
REFERENCES [dbo].[EventSummaries] ([ID])
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Events_EventSummaries_EventSummaryID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Events]'))
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Events_EventSummaries_EventSummaryID]


/****** End Event ******/

/****** Begin Data Tables ******/

IF NOT EXISTS (SELECT * FROM sys.types WHERE user_type_id = TYPE_ID(N'[dbo].[IntList]') AND is_table_type = 1)
BEGIN
CREATE TYPE [dbo].[IntList] AS TABLE(
	[ID] [int] NOT NULL,
	PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)

END

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

/****** Begin EventType ******/

/* Standard Insertion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EventTypes_InsertEventType]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[EventTypes_InsertEventType] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[EventTypes_InsertEventType]
(
	@ID [int] OUTPUT,
    @Value [varchar](64),
    @Created [datetime],
    @Updated [datetime]
)
AS

SET NOCOUNT ON

INSERT INTO
	[EventTypes]
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

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EventTypes_UpdateEventTypeByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[EventTypes_UpdateEventTypeByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[EventTypes_UpdateEventTypeByID]
(
    @ID [int],
    @Value [varchar](64),
    @Created [datetime],
    @Updated [datetime]
)
AS

SET NOCOUNT ON

UPDATE
    [EventTypes]
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

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EventTypes_DeleteEventTypeByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[EventTypes_DeleteEventTypeByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[EventTypes_DeleteEventTypeByID]
(
    @ID [int]
)
AS

SET NOCOUNT ON

DELETE FROM
    [EventTypes]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Get-By-ID */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EventTypes_GetEventTypeByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[EventTypes_GetEventTypeByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[EventTypes_GetEventTypeByID]
(
    @ID [int]
)
AS

SET NOCOUNT ON

SELECT
    [ID],
    [Value]
    ,[Created]
    ,[Updated]
FROM
    [EventTypes]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EventTypes_GetEventTypeByValue]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[EventTypes_GetEventTypeByValue] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[EventTypes_GetEventTypeByValue]
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
	[EventTypes]
WHERE
	([Value] = @Value)

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EventTypes_GetEventTypesByIDs]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[EventTypes_GetEventTypesByIDs] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[EventTypes_GetEventTypesByIDs]
(
    @IDs [dbo].[IntList] READONLY
)
AS

SET NOCOUNT ON

SELECT
    [ID]
    ,[Value]
    ,[Created]
    ,[Updated]
FROM
	[EventTypes]
WHERE
	([ID] IN (SELECT [ID] FROM @IDs))

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EventTypes_GetTotalNumberOfEventTypes]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[EventTypes_GetTotalNumberOfEventTypes] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[EventTypes_GetTotalNumberOfEventTypes]
AS

SET NOCOUNT ON

SELECT
    COUNT(*)
FROM
	[EventTypes]

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EventTypes_GetOrCreateEventType]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[EventTypes_GetOrCreateEventType] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[EventTypes_GetOrCreateEventType]
(
    @CreatedNewEntity [bit] OUTPUT,
    @Value [nvarchar](MAX)
)
AS

SET NOCOUNT ON

DECLARE @ID [int]

SELECT
    @ID = [ID]
FROM
	[EventTypes]
WHERE
	([Value] = @Value)

IF (@ID IS NULL)
BEGIN
    DECLARE @Created [datetime] = GETDATE()
    DECLARE @Updated [datetime] = @Created
    INSERT INTO
	[EventTypes]
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
    [EventTypes]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EventTypes_GetAllEventTypeIDs_Paged]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[EventTypes_GetAllEventTypeIDs_Paged] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[EventTypes_GetAllEventTypeIDs_Paged]
(
    @StartRowIndex [bigint],
    @MaximumRows [bigint]
)
AS

SET NOCOUNT ON

SELECT
    [ID]
FROM
	[EventTypes]
ORDER BY
    [ID] ASC
OFFSET @StartRowIndex ROWS FETCH NEXT @MaximumRows ROWS ONLY

SET NOCOUNT OFF

RETURN

GO
/********** End EventType **********/
/****** Begin EventSubtype ******/

/* Standard Insertion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EventSubtypes_InsertEventSubtype]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[EventSubtypes_InsertEventSubtype] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[EventSubtypes_InsertEventSubtype]
(
	@ID [int] OUTPUT,
    @Value [varchar](64),
    @Created [datetime],
    @Updated [datetime]
)
AS

SET NOCOUNT ON

INSERT INTO
	[EventSubtypes]
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

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EventSubtypes_UpdateEventSubtypeByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[EventSubtypes_UpdateEventSubtypeByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[EventSubtypes_UpdateEventSubtypeByID]
(
    @ID [int],
    @Value [varchar](64),
    @Created [datetime],
    @Updated [datetime]
)
AS

SET NOCOUNT ON

UPDATE
    [EventSubtypes]
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

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EventSubtypes_DeleteEventSubtypeByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[EventSubtypes_DeleteEventSubtypeByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[EventSubtypes_DeleteEventSubtypeByID]
(
    @ID [int]
)
AS

SET NOCOUNT ON

DELETE FROM
    [EventSubtypes]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Get-By-ID */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EventSubtypes_GetEventSubtypeByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[EventSubtypes_GetEventSubtypeByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[EventSubtypes_GetEventSubtypeByID]
(
    @ID [int]
)
AS

SET NOCOUNT ON

SELECT
    [ID],
    [Value]
    ,[Created]
    ,[Updated]
FROM
    [EventSubtypes]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EventSubtypes_GetEventSubtypeByValue]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[EventSubtypes_GetEventSubtypeByValue] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[EventSubtypes_GetEventSubtypeByValue]
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
	[EventSubtypes]
WHERE
	([Value] = @Value)

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EventSubtypes_GetEventSubtypesByIDs]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[EventSubtypes_GetEventSubtypesByIDs] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[EventSubtypes_GetEventSubtypesByIDs]
(
    @IDs [dbo].[IntList] READONLY
)
AS

SET NOCOUNT ON

SELECT
    [ID]
    ,[Value]
    ,[Created]
    ,[Updated]
FROM
	[EventSubtypes]
WHERE
	([ID] IN (SELECT [ID] FROM @IDs))

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EventSubtypes_GetOrCreateEventSubtype]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[EventSubtypes_GetOrCreateEventSubtype] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[EventSubtypes_GetOrCreateEventSubtype]
(
    @CreatedNewEntity [bit] OUTPUT,
    @Value [nvarchar](MAX)
)
AS

SET NOCOUNT ON

DECLARE @ID [int]

SELECT
    @ID = [ID]
FROM
	[EventSubtypes]
WHERE
	([Value] = @Value)

IF (@ID IS NULL)
BEGIN
    DECLARE @Created [datetime] = GETDATE()
    DECLARE @Updated [datetime] = @Created
    INSERT INTO
	[EventSubtypes]
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
    [EventSubtypes]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO
/********** End EventSubtype **********/
/****** Begin EventSummary ******/

/* Standard Insertion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EventSummaries_InsertEventSummary]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[EventSummaries_InsertEventSummary] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[EventSummaries_InsertEventSummary]
(
	@ID [bigint] OUTPUT,
    @Hash [varchar](64),
    @Value [nvarchar](MAX),
    @Created [datetime],
    @Updated [datetime]
)
AS

SET NOCOUNT ON

INSERT INTO
	[EventSummaries]
(
[Hash],
[Value],
[Created],
[Updated]
)
VALUES
(
@Hash,
@Value,
@Created,
@Updated
)

SET @ID = SCOPE_IDENTITY();

SET NOCOUNT OFF

RETURN

GO

/* Standard Update */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EventSummaries_UpdateEventSummaryByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[EventSummaries_UpdateEventSummaryByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[EventSummaries_UpdateEventSummaryByID]
(
    @ID [bigint],
    @Hash [varchar](64),
    @Value [nvarchar](MAX),
    @Created [datetime],
    @Updated [datetime]
)
AS

SET NOCOUNT ON

UPDATE
    [EventSummaries]
SET
[Hash] = @Hash,
[Value] = @Value,
[Created] = @Created,
[Updated] = @Updated
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Deletion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EventSummaries_DeleteEventSummaryByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[EventSummaries_DeleteEventSummaryByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[EventSummaries_DeleteEventSummaryByID]
(
    @ID [bigint]
)
AS

SET NOCOUNT ON

DELETE FROM
    [EventSummaries]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Get-By-ID */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EventSummaries_GetEventSummaryByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[EventSummaries_GetEventSummaryByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[EventSummaries_GetEventSummaryByID]
(
    @ID [bigint]
)
AS

SET NOCOUNT ON

SELECT
    [ID],
    [Hash]
    ,[Value]
    ,[Created]
    ,[Updated]
FROM
    [EventSummaries]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EventSummaries_GetEventSummaryByHash]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[EventSummaries_GetEventSummaryByHash] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[EventSummaries_GetEventSummaryByHash]
(
    @Hash [varchar](64)
)
AS

SET NOCOUNT ON

SELECT
    [ID]
    ,[Hash]
    ,[Value]
    ,[Created]
    ,[Updated]
FROM
	[EventSummaries]
WHERE
	([Hash] = @Hash)

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EventSummaries_GetEventSummarysByIDs]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[EventSummaries_GetEventSummarysByIDs] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[EventSummaries_GetEventSummarysByIDs]
(
    @IDs [dbo].[BigIntList] READONLY
)
AS

SET NOCOUNT ON

SELECT
    [ID]
    ,[Hash]
    ,[Value]
    ,[Created]
    ,[Updated]
FROM
	[EventSummaries]
WHERE
	([ID] IN (SELECT [ID] FROM @IDs))

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EventSummaries_GetOrCreateEventSummaryByHashAndValue]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[EventSummaries_GetOrCreateEventSummaryByHashAndValue] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[EventSummaries_GetOrCreateEventSummaryByHashAndValue]
(
    @CreatedNewEntity [bit] OUTPUT,
    @Hash [varchar](64),
    @Value [nvarchar](MAX)
)
AS

SET NOCOUNT ON

DECLARE @ID [bigint]

SELECT
    @ID = [ID]
FROM
	[EventSummaries]
WHERE
	([Hash] = @Hash) AND ([Value] = @Value)

IF (@ID IS NULL)
BEGIN
    DECLARE @Created [datetime] = GETDATE()
    DECLARE @Updated [datetime] = @Created
    INSERT INTO
	[EventSummaries]
    (
        [Hash],
        [Value],
        [Created], 
        [Updated]
    )
    VALUES
    (
        @Hash,
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
    ,[Hash]
    ,[Value]
    ,[Created]
    ,[Updated]
FROM
    [EventSummaries]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO
/********** End EventSummary **********/
/****** Begin Event ******/

/* Standard Insertion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Events_InsertEvent]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[Events_InsertEvent] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[Events_InsertEvent]
(
	@ID [bigint] OUTPUT,
    @EventTypeID [int],
    @EventSubtypeID [int] NULL,
    @EventSummaryID [bigint],
    @Created [datetime]
)
AS

SET NOCOUNT ON

INSERT INTO
	[Events]
(
[EventTypeID],
[EventSubtypeID],
[EventSummaryID],
[Created]
)
VALUES
(
@EventTypeID,
@EventSubtypeID,
@EventSummaryID,
@Created
)

SET @ID = SCOPE_IDENTITY();

SET NOCOUNT OFF

RETURN

GO

/* Standard Update */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Events_UpdateEventByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[Events_UpdateEventByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[Events_UpdateEventByID]
(
    @ID [bigint],
    @EventTypeID [int],
    @EventSubtypeID [int] NULL,
    @EventSummaryID [bigint],
    @Created [datetime]
)
AS

SET NOCOUNT ON

UPDATE
    [Events]
SET
[EventTypeID] = @EventTypeID,
[EventSubtypeID] = @EventSubtypeID,
[EventSummaryID] = @EventSummaryID,
[Created] = @Created
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Deletion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Events_DeleteEventByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[Events_DeleteEventByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[Events_DeleteEventByID]
(
    @ID [bigint]
)
AS

SET NOCOUNT ON

DELETE FROM
    [Events]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Get-By-ID */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Events_GetEventByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[Events_GetEventByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[Events_GetEventByID]
(
    @ID [bigint]
)
AS

SET NOCOUNT ON

SELECT
    [ID],
    [EventTypeID]
    ,[EventSubtypeID]
    ,[EventSummaryID]
    ,[Created]
FROM
    [Events]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Events_GetAllEventIDs_Paged]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[Events_GetAllEventIDs_Paged] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Events_GetAllEventIDs_Paged]
(
    @StartRowIndex [bigint],
    @MaximumRows [bigint]
)
AS

SET NOCOUNT ON

SELECT
    [ID]
FROM
	[Events]
ORDER BY
    [ID] DESC
OFFSET @StartRowIndex ROWS FETCH NEXT @MaximumRows ROWS ONLY

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Events_GetTotalNumberOfEvents]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[Events_GetTotalNumberOfEvents] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Events_GetTotalNumberOfEvents]
AS

SET NOCOUNT ON

SELECT
    COUNT(*)
FROM
	[Events]

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Events_GetAllEventIDsBetweenDates_Paged]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[Events_GetAllEventIDsBetweenDates_Paged] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Events_GetAllEventIDsBetweenDates_Paged]
(
    @StartDate [datetime],
    @EndDate [datetime],
    @StartRowIndex [bigint],
    @MaximumRows [bigint]
)
AS

SET NOCOUNT ON

SELECT
    [ID]
FROM
	[Events]
WHERE
    ([Created] BETWEEN @StartDate AND @EndDate)
ORDER BY
    [ID] DESC
OFFSET @StartRowIndex ROWS FETCH NEXT @MaximumRows ROWS ONLY

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Events_GetTotalNumberOfEventsBetweenDates]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[Events_GetTotalNumberOfEventsBetweenDates] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Events_GetTotalNumberOfEventsBetweenDates]
(
    @StartDate [datetime],
    @EndDate [datetime]
)
AS

SET NOCOUNT ON

SELECT
    COUNT(*)
FROM
	[Events]
WHERE
    ([Created] BETWEEN @StartDate AND @EndDate)

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Events_GetEventIDsByEventSubtypeID_Paged]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[Events_GetEventIDsByEventSubtypeID_Paged] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Events_GetEventIDsByEventSubtypeID_Paged]
(
    @EventSubtypeID [int],
    @StartRowIndex [bigint],
    @MaximumRows [bigint]
)
AS

SET NOCOUNT ON

SELECT
    [ID]
FROM
	[Events]
WHERE
	([EventSubtypeID] = @EventSubtypeID)
ORDER BY
    [ID] DESC
OFFSET @StartRowIndex ROWS FETCH NEXT @MaximumRows ROWS ONLY

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Events_GetTotalNumberOfEventsByEventSubtypeID]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[Events_GetTotalNumberOfEventsByEventSubtypeID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Events_GetTotalNumberOfEventsByEventSubtypeID]
(
    @EventSubtypeID [int]
)
AS

SET NOCOUNT ON

SELECT
    COUNT(*)
FROM
	[Events]
WHERE
	([EventSubtypeID] = @EventSubtypeID)

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Events_GetEventIDsByEventSubtypeIDBetweenDates_Paged]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[Events_GetEventIDsByEventSubtypeIDBetweenDates_Paged] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Events_GetEventIDsByEventSubtypeIDBetweenDates_Paged]
(
    @EventSubtypeID [int],
    @StartDate [datetime],
    @EndDate [datetime],
    @StartRowIndex [bigint],
    @MaximumRows [bigint]
)
AS

SET NOCOUNT ON

SELECT
    [ID]
FROM
	[Events]
WHERE
	([EventSubtypeID] = @EventSubtypeID) AND 
    ([Created] BETWEEN @StartDate AND @EndDate)
ORDER BY
    [ID] DESC
OFFSET @StartRowIndex ROWS FETCH NEXT @MaximumRows ROWS ONLY

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Events_GetTotalNumberOfEventsBySubtypeIDBetweenDates]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[Events_GetTotalNumberOfEventsBySubtypeIDBetweenDates] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Events_GetTotalNumberOfEventsBySubtypeIDBetweenDates]
(
    @EventSubtypeID [int],
    @StartDate [datetime],
    @EndDate [datetime]
)
AS

SET NOCOUNT ON

SELECT
    COUNT(*)
FROM
	[Events]
WHERE
	([EventSubtypeID] = @EventSubtypeID) AND 
    ([Created] BETWEEN @StartDate AND @EndDate)

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Events_GetEventIDsByEventTypeID_Paged]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[Events_GetEventIDsByEventTypeID_Paged] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Events_GetEventIDsByEventTypeID_Paged]
(
    @EventTypeID [int],
    @StartRowIndex [bigint],
    @MaximumRows [bigint]
)
AS

SET NOCOUNT ON

SELECT
    [ID]
FROM
	[Events]
WHERE
	([EventTypeID] = @EventTypeID)
ORDER BY
    [ID] DESC
OFFSET @StartRowIndex ROWS FETCH NEXT @MaximumRows ROWS ONLY

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Events_GetTotalNumberOfEventsByEventTypeID]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[Events_GetTotalNumberOfEventsByEventTypeID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Events_GetTotalNumberOfEventsByEventTypeID]
(
    @EventTypeID [int]
)
AS

SET NOCOUNT ON

SELECT
    COUNT(*)
FROM
	[Events]
WHERE
	([EventTypeID] = @EventTypeID)

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Events_GetEventIDsByEventTypeIDBetweenDates_Paged]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[Events_GetEventIDsByEventTypeIDBetweenDates_Paged] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Events_GetEventIDsByEventTypeIDBetweenDates_Paged]
(
    @EventTypeID [int],
    @StartDate [datetime],
    @EndDate [datetime],
    @StartRowIndex [bigint],
    @MaximumRows [bigint]
)
AS

SET NOCOUNT ON

SELECT
    [ID]
FROM
	[Events]
WHERE
	([EventTypeID] = @EventTypeID) AND 
    ([Created] BETWEEN @StartDate AND @EndDate)
ORDER BY
    [ID] DESC
OFFSET @StartRowIndex ROWS FETCH NEXT @MaximumRows ROWS ONLY

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Events_GetTotalNumberOfEventsByEventTypeIDBetweenDates]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[Events_GetTotalNumberOfEventsByEventTypeIDBetweenDates] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Events_GetTotalNumberOfEventsByEventTypeIDBetweenDates]
(
    @EventTypeID [int],
    @StartDate [datetime],
    @EndDate [datetime]
)
AS

SET NOCOUNT ON

SELECT
    COUNT(*)
FROM
	[Events]
WHERE
	([EventTypeID] = @EventTypeID) AND 
    ([Created] BETWEEN @StartDate AND @EndDate)

SET NOCOUNT OFF

RETURN

GO
/********** End Event **********/