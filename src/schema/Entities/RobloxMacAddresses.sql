USE [master]
GO

IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = N'RobloxMacAddresses')
BEGIN
CREATE DATABASE [RobloxMacAddresses] ON  PRIMARY
( NAME = N'RobloxMacAddresses', FILENAME = N'/data/RobloxMacAddresses/RobloxMacAddresses.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxMacAddresses2', FILENAME = N'/data/RobloxMacAddresses/RobloxMacAddresses2.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxMacAddresses3', FILENAME = N'/data/RobloxMacAddresses/RobloxMacAddresses3.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxMacAddresses4', FILENAME = N'/data/RobloxMacAddresses/RobloxMacAddresses4.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxMacAddresses5', FILENAME = N'/data/RobloxMacAddresses/RobloxMacAddresses5.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxMacAddresses6', FILENAME = N'/data/RobloxMacAddresses/RobloxMacAddresses6.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxMacAddresses7', FILENAME = N'/data/RobloxMacAddresses/RobloxMacAddresses7.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxMacAddresses8', FILENAME = N'/data/RobloxMacAddresses/RobloxMacAddresses8.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB )
 LOG ON
( NAME = N'RobloxMacAddresses_log', FILENAME = N'/logs/RobloxMacAddresses/RobloxMacAddresses_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxMacAddresses2_log', FILENAME = N'/logs/RobloxMacAddresses/RobloxMacAddresses2_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxMacAddresses3_log', FILENAME = N'/logs/RobloxMacAddresses/RobloxMacAddresses3_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxMacAddresses4_log', FILENAME = N'/logs/RobloxMacAddresses/RobloxMacAddresses4_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxMacAddresses5_log', FILENAME = N'/logs/RobloxMacAddresses/RobloxMacAddresses5_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxMacAddresses6_log', FILENAME = N'/logs/RobloxMacAddresses/RobloxMacAddresses6_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxMacAddresses7_log', FILENAME = N'/logs/RobloxMacAddresses/RobloxMacAddresses7_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxMacAddresses8_log', FILENAME = N'/logs/RobloxMacAddresses/RobloxMacAddresses8_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB )
END
GO

ALTER DATABASE [RobloxMacAddresses] SET COMPATIBILITY_LEVEL = 100
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RobloxMacAddresses].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [RobloxMacAddresses] SET ANSI_NULL_DEFAULT OFF
GO

ALTER DATABASE [RobloxMacAddresses] SET ANSI_NULLS OFF
GO

ALTER DATABASE [RobloxMacAddresses] SET ANSI_PADDING OFF
GO

ALTER DATABASE [RobloxMacAddresses] SET ANSI_WARNINGS OFF
GO

ALTER DATABASE [RobloxMacAddresses] SET ARITHABORT OFF
GO

ALTER DATABASE [RobloxMacAddresses] SET AUTO_CLOSE OFF
GO

ALTER DATABASE [RobloxMacAddresses] SET AUTO_CREATE_STATISTICS ON
GO

ALTER DATABASE [RobloxMacAddresses] SET AUTO_SHRINK OFF
GO

ALTER DATABASE [RobloxMacAddresses] SET AUTO_UPDATE_STATISTICS ON
GO

ALTER DATABASE [RobloxMacAddresses] SET CURSOR_CLOSE_ON_COMMIT OFF
GO

ALTER DATABASE [RobloxMacAddresses] SET CURSOR_DEFAULT  GLOBAL
GO

ALTER DATABASE [RobloxMacAddresses] SET CONCAT_NULL_YIELDS_NULL OFF
GO

ALTER DATABASE [RobloxMacAddresses] SET NUMERIC_ROUNDABORT OFF
GO

ALTER DATABASE [RobloxMacAddresses] SET QUOTED_IDENTIFIER OFF
GO

ALTER DATABASE [RobloxMacAddresses] SET RECURSIVE_TRIGGERS OFF
GO

ALTER DATABASE [RobloxMacAddresses] SET  DISABLE_BROKER
GO

ALTER DATABASE [RobloxMacAddresses] SET AUTO_UPDATE_STATISTICS_ASYNC ON
GO

ALTER DATABASE [RobloxMacAddresses] SET DATE_CORRELATION_OPTIMIZATION OFF
GO

ALTER DATABASE [RobloxMacAddresses] SET TRUSTWORTHY OFF
GO

ALTER DATABASE [RobloxMacAddresses] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO

ALTER DATABASE [RobloxMacAddresses] SET PARAMETERIZATION SIMPLE
GO

ALTER DATABASE [RobloxMacAddresses] SET READ_COMMITTED_SNAPSHOT OFF
GO

ALTER DATABASE [RobloxMacAddresses] SET HONOR_BROKER_PRIORITY OFF
GO

ALTER DATABASE [RobloxMacAddresses] SET  READ_WRITE
GO

ALTER DATABASE [RobloxMacAddresses] SET RECOVERY FULL
GO

ALTER DATABASE [RobloxMacAddresses] SET  MULTI_USER
GO

ALTER DATABASE [RobloxMacAddresses] SET PAGE_VERIFY CHECKSUM
GO

ALTER DATABASE [RobloxMacAddresses] SET DB_CHAINING OFF
GO

USE [RobloxMacAddresses]
GO


/****** Begin MACAddress ******/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MACAddresses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MACAddresses](
	[ID] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [MACAddress] [varchar](15) NOT NULL,
    [State] [tinyint] NOT NULL,
    [Expiration] [datetime] NULL,
    [Created] [datetime] NOT NULL,
    [Updated] [datetime] NULL,
 CONSTRAINT [PK_MACAddresses] PRIMARY KEY CLUSTERED
(
    [ID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END


/****** End MACAddress ******/

/****** Begin UserMACAddress ******/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserMACAddresses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserMACAddresses](
	[ID] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [UserID] [bigint] NOT NULL,
    [MACAddressID] [bigint] NOT NULL,
    [Created] [datetime] NOT NULL,
 CONSTRAINT [PK_UserMACAddresses] PRIMARY KEY CLUSTERED
(
    [ID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserMACAddresses_MACAddresses_MACAddressID]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserMACAddresses]'))
ALTER TABLE [dbo].[UserMACAddresses] 
WITH CHECK ADD CONSTRAINT [FK_UserMACAddresses_MACAddresses_MACAddressID] FOREIGN KEY ([MACAddressID])
REFERENCES [dbo].[MACAddresses] ([ID])
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserMACAddresses_MACAddresses_MACAddressID]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserMACAddresses]'))
ALTER TABLE [dbo].[UserMACAddresses] CHECK CONSTRAINT [FK_UserMACAddresses_MACAddresses_MACAddressID]


/****** End UserMACAddress ******/


/****** Begin MACAddress ******/

/* Standard Insertion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MACAddresses_InsertMACAddress]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[MACAddresses_InsertMACAddress] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[MACAddresses_InsertMACAddress]
(
	@ID [bigint] OUTPUT,
    @MACAddress [varchar](15),
    @State [tinyint],
    @Expiration [datetime] NULL,
    @Created [datetime],
    @Updated [datetime] NULL
)
AS

SET NOCOUNT ON

INSERT INTO
	[MACAddresses]
(
[MACAddress],
[State],
[Expiration],
[Created],
[Updated]
)
VALUES
(
@MACAddress,
@State,
@Expiration,
@Created,
@Updated
)

SET @ID = SCOPE_IDENTITY();

SET NOCOUNT OFF

RETURN

GO

/* Standard Update */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MACAddresses_UpdateMACAddressByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[MACAddresses_UpdateMACAddressByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[MACAddresses_UpdateMACAddressByID]
(
    @ID [bigint],
    @MACAddress [varchar](15),
    @State [tinyint],
    @Expiration [datetime] NULL,
    @Created [datetime],
    @Updated [datetime] NULL
)
AS

SET NOCOUNT ON

UPDATE
    [MACAddresses]
SET
[MACAddress] = @MACAddress,
[State] = @State,
[Expiration] = @Expiration,
[Created] = @Created,
[Updated] = @Updated
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Deletion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MACAddresses_DeleteMACAddressByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[MACAddresses_DeleteMACAddressByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[MACAddresses_DeleteMACAddressByID]
(
    @ID [bigint]
)
AS

SET NOCOUNT ON

DELETE FROM
    [MACAddresses]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Get-By-ID */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MACAddresses_GetMACAddressByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[MACAddresses_GetMACAddressByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[MACAddresses_GetMACAddressByID]
(
    @ID [bigint]
)
AS

SET NOCOUNT ON

SELECT
    [ID],
    [MACAddress]
    ,[State]
    ,[Expiration]
    ,[Created]
    ,[Updated]
FROM
    [MACAddresses]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MACAddresses_GetMACAddressByMACAddress]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[MACAddresses_GetMACAddressByMACAddress] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[MACAddresses_GetMACAddressByMACAddress]
(
    @MACAddress [varchar](15)
)
AS

SET NOCOUNT ON

SELECT
    [ID]
    ,[MACAddress]
    ,[State]
    ,[Expiration]
    ,[Created]
    ,[Updated]
FROM
	[MACAddresses]
WHERE
	([MACAddress] = @MACAddress)

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MACAddresses_GetOrCreateMACAddress]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[MACAddresses_GetOrCreateMACAddress] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[MACAddresses_GetOrCreateMACAddress]
(
    @CreatedNewEntity [bit] OUTPUT,
    @MACAddress [varchar](15)
)
AS

SET NOCOUNT ON

DECLARE @ID [bigint]

SELECT
    @ID = [ID]
FROM
	[MACAddresses]
WHERE
	([MACAddress] = @MACAddress)

IF (@ID IS NULL)
BEGIN
    DECLARE @Created [datetime] = GETDATE()
    DECLARE @Updated [datetime] = @Created
    INSERT INTO
	[MACAddresses]
    (
        [MACAddress],
        [Created], 
        [Updated]
    )
    VALUES
    (
        @MACAddress,
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
    ,[MACAddress]
    ,[State]
    ,[Expiration]
    ,[Created]
    ,[Updated]
FROM
    [MACAddresses]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO
/********** End MACAddress **********/
/****** Begin UserMACAddress ******/

/* Standard Insertion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserMACAddresses_InsertUserMACAddress]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[UserMACAddresses_InsertUserMACAddress] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[UserMACAddresses_InsertUserMACAddress]
(
	@ID [bigint] OUTPUT,
    @UserID [bigint],
    @MACAddressID [bigint],
    @Created [datetime]
)
AS

SET NOCOUNT ON

INSERT INTO
	[UserMACAddresses]
(
[UserID],
[MACAddressID],
[Created]
)
VALUES
(
@UserID,
@MACAddressID,
@Created
)

SET @ID = SCOPE_IDENTITY();

SET NOCOUNT OFF

RETURN

GO

/* Standard Update */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserMACAddresses_UpdateUserMACAddressByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[UserMACAddresses_UpdateUserMACAddressByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[UserMACAddresses_UpdateUserMACAddressByID]
(
    @ID [bigint],
    @UserID [bigint],
    @MACAddressID [bigint],
    @Created [datetime]
)
AS

SET NOCOUNT ON

UPDATE
    [UserMACAddresses]
SET
[UserID] = @UserID,
[MACAddressID] = @MACAddressID,
[Created] = @Created
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Deletion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserMACAddresses_DeleteUserMACAddressByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[UserMACAddresses_DeleteUserMACAddressByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[UserMACAddresses_DeleteUserMACAddressByID]
(
    @ID [bigint]
)
AS

SET NOCOUNT ON

DELETE FROM
    [UserMACAddresses]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Get-By-ID */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserMACAddresses_GetUserMACAddressByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[UserMACAddresses_GetUserMACAddressByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[UserMACAddresses_GetUserMACAddressByID]
(
    @ID [bigint]
)
AS

SET NOCOUNT ON

SELECT
    [ID],
    [UserID]
    ,[MACAddressID]
    ,[Created]
FROM
    [UserMACAddresses]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserMACAddresses_GetUserMACAddressByUserIDAndMACAddressID]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[UserMACAddresses_GetUserMACAddressByUserIDAndMACAddressID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[UserMACAddresses_GetUserMACAddressByUserIDAndMACAddressID]
(
    @UserID [bigint],
    @MACAddressID [bigint]
)
AS

SET NOCOUNT ON

SELECT
    [ID]
    ,[UserID]
    ,[MACAddressID]
    ,[Created]
FROM
	[UserMACAddresses]
WHERE
	([UserID] = @UserID) AND ([MACAddressID] = @MACAddressID)

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserMACAddresses_GetUserMACAddressIDsByUserID_Paged]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[UserMACAddresses_GetUserMACAddressIDsByUserID_Paged] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[UserMACAddresses_GetUserMACAddressIDsByUserID_Paged]
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
	[UserMACAddresses]
WHERE
	([UserID] = @UserID)
ORDER BY
    [ID] ASC
OFFSET @StartRowIndex ROWS FETCH NEXT @MaximumRows ROWS ONLY

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserMACAddresses_GetUserMACAddressIDsByMACAddressID_Paged]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[UserMACAddresses_GetUserMACAddressIDsByMACAddressID_Paged] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[UserMACAddresses_GetUserMACAddressIDsByMACAddressID_Paged]
(
    @MACAddressID [bigint],
    @StartRowIndex [bigint],
    @MaximumRows [bigint]
)
AS

SET NOCOUNT ON

SELECT
    [ID]
FROM
	[UserMACAddresses]
WHERE
	([MACAddressID] = @MACAddressID)
ORDER BY
    [ID] ASC
OFFSET @StartRowIndex ROWS FETCH NEXT @MaximumRows ROWS ONLY

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserMACAddresses_GetTotalNumberOfUserMACAddresssByUserID]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[UserMACAddresses_GetTotalNumberOfUserMACAddresssByUserID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[UserMACAddresses_GetTotalNumberOfUserMACAddresssByUserID]
(
    @UserID [bigint]
)
AS

SET NOCOUNT ON

SELECT
    COUNT(*)
FROM
	[UserMACAddresses]
WHERE
	([UserID] = @UserID)

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserMACAddresses_GetTotalNumberOfUserMACAddresssByMACAddressID]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[UserMACAddresses_GetTotalNumberOfUserMACAddresssByMACAddressID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[UserMACAddresses_GetTotalNumberOfUserMACAddresssByMACAddressID]
(
    @MACAddressID [bigint]
)
AS

SET NOCOUNT ON

SELECT
    COUNT(*)
FROM
	[UserMACAddresses]
WHERE
	([MACAddressID] = @MACAddressID)

SET NOCOUNT OFF

RETURN

GO
/********** End UserMACAddress **********/