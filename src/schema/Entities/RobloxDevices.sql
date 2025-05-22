USE [master]
GO

IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = N'RobloxDevices')
BEGIN
CREATE DATABASE [RobloxDevices] ON  PRIMARY
( NAME = N'RobloxDevices', FILENAME = N'/data/RobloxDevices/RobloxDevices.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxDevices2', FILENAME = N'/data/RobloxDevices/RobloxDevices2.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxDevices3', FILENAME = N'/data/RobloxDevices/RobloxDevices3.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxDevices4', FILENAME = N'/data/RobloxDevices/RobloxDevices4.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxDevices5', FILENAME = N'/data/RobloxDevices/RobloxDevices5.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxDevices6', FILENAME = N'/data/RobloxDevices/RobloxDevices6.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxDevices7', FILENAME = N'/data/RobloxDevices/RobloxDevices7.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxDevices8', FILENAME = N'/data/RobloxDevices/RobloxDevices8.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB )
 LOG ON
( NAME = N'RobloxDevices_log', FILENAME = N'/logs/RobloxDevices/RobloxDevices_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxDevices2_log', FILENAME = N'/logs/RobloxDevices/RobloxDevices2_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxDevices3_log', FILENAME = N'/logs/RobloxDevices/RobloxDevices3_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxDevices4_log', FILENAME = N'/logs/RobloxDevices/RobloxDevices4_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxDevices5_log', FILENAME = N'/logs/RobloxDevices/RobloxDevices5_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxDevices6_log', FILENAME = N'/logs/RobloxDevices/RobloxDevices6_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxDevices7_log', FILENAME = N'/logs/RobloxDevices/RobloxDevices7_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxDevices8_log', FILENAME = N'/logs/RobloxDevices/RobloxDevices8_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB )
END
GO

ALTER DATABASE [RobloxDevices] SET COMPATIBILITY_LEVEL = 100
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RobloxDevices].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [RobloxDevices] SET ANSI_NULL_DEFAULT OFF
GO

ALTER DATABASE [RobloxDevices] SET ANSI_NULLS OFF
GO

ALTER DATABASE [RobloxDevices] SET ANSI_PADDING OFF
GO

ALTER DATABASE [RobloxDevices] SET ANSI_WARNINGS OFF
GO

ALTER DATABASE [RobloxDevices] SET ARITHABORT OFF
GO

ALTER DATABASE [RobloxDevices] SET AUTO_CLOSE OFF
GO

ALTER DATABASE [RobloxDevices] SET AUTO_CREATE_STATISTICS ON
GO

ALTER DATABASE [RobloxDevices] SET AUTO_SHRINK OFF
GO

ALTER DATABASE [RobloxDevices] SET AUTO_UPDATE_STATISTICS ON
GO

ALTER DATABASE [RobloxDevices] SET CURSOR_CLOSE_ON_COMMIT OFF
GO

ALTER DATABASE [RobloxDevices] SET CURSOR_DEFAULT  GLOBAL
GO

ALTER DATABASE [RobloxDevices] SET CONCAT_NULL_YIELDS_NULL OFF
GO

ALTER DATABASE [RobloxDevices] SET NUMERIC_ROUNDABORT OFF
GO

ALTER DATABASE [RobloxDevices] SET QUOTED_IDENTIFIER OFF
GO

ALTER DATABASE [RobloxDevices] SET RECURSIVE_TRIGGERS OFF
GO

ALTER DATABASE [RobloxDevices] SET  DISABLE_BROKER
GO

ALTER DATABASE [RobloxDevices] SET AUTO_UPDATE_STATISTICS_ASYNC ON
GO

ALTER DATABASE [RobloxDevices] SET DATE_CORRELATION_OPTIMIZATION OFF
GO

ALTER DATABASE [RobloxDevices] SET TRUSTWORTHY OFF
GO

ALTER DATABASE [RobloxDevices] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO

ALTER DATABASE [RobloxDevices] SET PARAMETERIZATION SIMPLE
GO

ALTER DATABASE [RobloxDevices] SET READ_COMMITTED_SNAPSHOT OFF
GO

ALTER DATABASE [RobloxDevices] SET HONOR_BROKER_PRIORITY OFF
GO

ALTER DATABASE [RobloxDevices] SET  READ_WRITE
GO

ALTER DATABASE [RobloxDevices] SET RECOVERY FULL
GO

ALTER DATABASE [RobloxDevices] SET  MULTI_USER
GO

ALTER DATABASE [RobloxDevices] SET PAGE_VERIFY CHECKSUM
GO

ALTER DATABASE [RobloxDevices] SET DB_CHAINING OFF
GO

USE [RobloxDevices]
GO


/****** Begin DeviceType ******/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeviceTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DeviceTypes](
	[ID] [tinyint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [Value] [nvarchar](MAX) NOT NULL,
    [BitOrdinal] [tinyint] NOT NULL,
    [BitMask] [bigint] NOT NULL,
    [Created] [datetime] NOT NULL,
    [Updated] [datetime] NULL,
 CONSTRAINT [PK_DeviceTypes] PRIMARY KEY CLUSTERED
(
    [ID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END

/****** End DeviceType ******/


/****** Begin DeviceType ******/

/* Standard Insertion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeviceTypes_InsertDeviceType]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[DeviceTypes_InsertDeviceType] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[DeviceTypes_InsertDeviceType]
(
	@ID [tinyint] OUTPUT,
    @Value [nvarchar](MAX),
    @BitOrdinal [tinyint],
    @BitMask [bigint],
    @Created [datetime],
    @Updated [datetime] NULL
)
AS

SET NOCOUNT ON

INSERT INTO
	[DeviceTypes]
(
[Value],
[BitOrdinal],
[BitMask],
[Created],
[Updated]
)
VALUES
(
@Value,
@BitOrdinal,
@BitMask,
@Created,
@Updated
)

SET @ID = SCOPE_IDENTITY();

SET NOCOUNT OFF

RETURN

GO

/* Standard Update */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeviceTypes_UpdateDeviceTypeByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[DeviceTypes_UpdateDeviceTypeByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[DeviceTypes_UpdateDeviceTypeByID]
(
    @ID [tinyint],
    @Value [nvarchar](MAX),
    @BitOrdinal [tinyint],
    @BitMask [bigint],
    @Created [datetime],
    @Updated [datetime] NULL
)
AS

SET NOCOUNT ON

UPDATE
    [DeviceTypes]
SET
[Value] = @Value,
[BitOrdinal] = @BitOrdinal,
[BitMask] = @BitMask,
[Created] = @Created,
[Updated] = @Updated
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Deletion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeviceTypes_DeleteDeviceTypeByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[DeviceTypes_DeleteDeviceTypeByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[DeviceTypes_DeleteDeviceTypeByID]
(
    @ID [tinyint]
)
AS

SET NOCOUNT ON

DELETE FROM
    [DeviceTypes]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Get-By-ID */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeviceTypes_GetDeviceTypeByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[DeviceTypes_GetDeviceTypeByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[DeviceTypes_GetDeviceTypeByID]
(
    @ID [tinyint]
)
AS

SET NOCOUNT ON

SELECT
    [ID],
    [Value]
    ,[BitOrdinal]
    ,[BitMask]
    ,[Created]
    ,[Updated]
FROM
    [DeviceTypes]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeviceTypes_GetDeviceTypeByValue]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[DeviceTypes_GetDeviceTypeByValue] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[DeviceTypes_GetDeviceTypeByValue]
(
    @Value [nvarchar](MAX)
)
AS

SET NOCOUNT ON

SELECT
    [ID]
    ,[Value]
    ,[BitOrdinal]
    ,[BitMask]
    ,[Created]
    ,[Updated]
FROM
	[DeviceTypes]
WHERE
	([Value] = @Value)

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeviceTypes_GetDeviceTypeByBitOrdinal]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[DeviceTypes_GetDeviceTypeByBitOrdinal] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[DeviceTypes_GetDeviceTypeByBitOrdinal]
(
    @BitOrdinal [tinyint]
)
AS

SET NOCOUNT ON

SELECT
    [ID]
    ,[Value]
    ,[BitOrdinal]
    ,[BitMask]
    ,[Created]
    ,[Updated]
FROM
	[DeviceTypes]
WHERE
	([BitOrdinal] = @BitOrdinal)

SET NOCOUNT OFF

RETURN

GO
/********** End DeviceType **********/