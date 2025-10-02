USE [master]
GO

IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = N'RobloxIpAddresses')
BEGIN
CREATE DATABASE [RobloxIpAddresses] ON  PRIMARY
( NAME = N'RobloxIpAddresses', FILENAME = N'/data/RobloxIpAddresses/RobloxIpAddresses.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxIpAddresses2', FILENAME = N'/data/RobloxIpAddresses/RobloxIpAddresses2.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxIpAddresses3', FILENAME = N'/data/RobloxIpAddresses/RobloxIpAddresses3.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxIpAddresses4', FILENAME = N'/data/RobloxIpAddresses/RobloxIpAddresses4.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxIpAddresses5', FILENAME = N'/data/RobloxIpAddresses/RobloxIpAddresses5.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxIpAddresses6', FILENAME = N'/data/RobloxIpAddresses/RobloxIpAddresses6.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxIpAddresses7', FILENAME = N'/data/RobloxIpAddresses/RobloxIpAddresses7.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxIpAddresses8', FILENAME = N'/data/RobloxIpAddresses/RobloxIpAddresses8.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB )
 LOG ON
( NAME = N'RobloxIpAddresses_log', FILENAME = N'/logs/RobloxIpAddresses/RobloxIpAddresses_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxIpAddresses2_log', FILENAME = N'/logs/RobloxIpAddresses/RobloxIpAddresses2_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxIpAddresses3_log', FILENAME = N'/logs/RobloxIpAddresses/RobloxIpAddresses3_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxIpAddresses4_log', FILENAME = N'/logs/RobloxIpAddresses/RobloxIpAddresses4_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxIpAddresses5_log', FILENAME = N'/logs/RobloxIpAddresses/RobloxIpAddresses5_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxIpAddresses6_log', FILENAME = N'/logs/RobloxIpAddresses/RobloxIpAddresses6_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxIpAddresses7_log', FILENAME = N'/logs/RobloxIpAddresses/RobloxIpAddresses7_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxIpAddresses8_log', FILENAME = N'/logs/RobloxIpAddresses/RobloxIpAddresses8_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB )
END
GO

ALTER DATABASE [RobloxIpAddresses] SET COMPATIBILITY_LEVEL = 100
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RobloxIpAddresses].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [RobloxIpAddresses] SET ANSI_NULL_DEFAULT OFF
GO

ALTER DATABASE [RobloxIpAddresses] SET ANSI_NULLS OFF
GO

ALTER DATABASE [RobloxIpAddresses] SET ANSI_PADDING OFF
GO

ALTER DATABASE [RobloxIpAddresses] SET ANSI_WARNINGS OFF
GO

ALTER DATABASE [RobloxIpAddresses] SET ARITHABORT OFF
GO

ALTER DATABASE [RobloxIpAddresses] SET AUTO_CLOSE OFF
GO

ALTER DATABASE [RobloxIpAddresses] SET AUTO_CREATE_STATISTICS ON
GO

ALTER DATABASE [RobloxIpAddresses] SET AUTO_SHRINK OFF
GO

ALTER DATABASE [RobloxIpAddresses] SET AUTO_UPDATE_STATISTICS ON
GO

ALTER DATABASE [RobloxIpAddresses] SET CURSOR_CLOSE_ON_COMMIT OFF
GO

ALTER DATABASE [RobloxIpAddresses] SET CURSOR_DEFAULT  GLOBAL
GO

ALTER DATABASE [RobloxIpAddresses] SET CONCAT_NULL_YIELDS_NULL OFF
GO

ALTER DATABASE [RobloxIpAddresses] SET NUMERIC_ROUNDABORT OFF
GO

ALTER DATABASE [RobloxIpAddresses] SET QUOTED_IDENTIFIER OFF
GO

ALTER DATABASE [RobloxIpAddresses] SET RECURSIVE_TRIGGERS OFF
GO

ALTER DATABASE [RobloxIpAddresses] SET  DISABLE_BROKER
GO

ALTER DATABASE [RobloxIpAddresses] SET AUTO_UPDATE_STATISTICS_ASYNC ON
GO

ALTER DATABASE [RobloxIpAddresses] SET DATE_CORRELATION_OPTIMIZATION OFF
GO

ALTER DATABASE [RobloxIpAddresses] SET TRUSTWORTHY OFF
GO

ALTER DATABASE [RobloxIpAddresses] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO

ALTER DATABASE [RobloxIpAddresses] SET PARAMETERIZATION SIMPLE
GO

ALTER DATABASE [RobloxIpAddresses] SET READ_COMMITTED_SNAPSHOT OFF
GO

ALTER DATABASE [RobloxIpAddresses] SET HONOR_BROKER_PRIORITY OFF
GO

ALTER DATABASE [RobloxIpAddresses] SET  READ_WRITE
GO

ALTER DATABASE [RobloxIpAddresses] SET RECOVERY FULL
GO

ALTER DATABASE [RobloxIpAddresses] SET  MULTI_USER
GO

ALTER DATABASE [RobloxIpAddresses] SET PAGE_VERIFY CHECKSUM
GO

ALTER DATABASE [RobloxIpAddresses] SET DB_CHAINING OFF
GO

USE [RobloxIpAddresses]
GO


/****** Begin IPAddress ******/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IPAddresses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[IPAddresses](
	[ID] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [Address] [varchar](15) NOT NULL,
    [State] [tinyint] NOT NULL,
    [Expiration] [datetime] NULL,
    [Created] [datetime] NOT NULL,
    [Updated] [datetime] NULL,
 CONSTRAINT [PK_IPAddresses] PRIMARY KEY CLUSTERED
(
    [ID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END


/****** End IPAddress ******/

/****** Begin UserIPAddressV2 ******/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserIPAddressesV3]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserIPAddressesV3](
	[ID] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [UserID] [bigint] NOT NULL,
    [IPAddressID] [bigint] NOT NULL,
    [State] [tinyint] NOT NULL,
    [LastSeen] [datetime] NULL,
    [Created] [datetime] NOT NULL,
 CONSTRAINT [PK_UserIPAddressesV3] PRIMARY KEY CLUSTERED
(
    [ID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserIPAddressesV3_IPAddresses_IPAddressID]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserIPAddressesV3]'))
ALTER TABLE [dbo].[UserIPAddressesV3] 
WITH CHECK ADD CONSTRAINT [FK_UserIPAddressesV3_IPAddresses_IPAddressID] FOREIGN KEY ([IPAddressID])
REFERENCES [dbo].[IPAddresses] ([ID])
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserIPAddressesV3_IPAddresses_IPAddressID]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserIPAddressesV3]'))
ALTER TABLE [dbo].[UserIPAddressesV3] CHECK CONSTRAINT [FK_UserIPAddressesV3_IPAddresses_IPAddressID]


/****** End UserIPAddressV2 ******/

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

/****** Begin IPAddress ******/

/* Standard Insertion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IPAddresses_InsertIPAddress]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[IPAddresses_InsertIPAddress] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[IPAddresses_InsertIPAddress]
(
	@ID [bigint] OUTPUT,
    @Address [varchar](15),
    @State [tinyint],
    @Expiration [datetime] NULL,
    @Created [datetime],
    @Updated [datetime] NULL
)
AS

SET NOCOUNT ON

INSERT INTO
	[IPAddresses]
(
[Address],
[State],
[Expiration],
[Created],
[Updated]
)
VALUES
(
@Address,
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

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IPAddresses_UpdateIPAddressByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[IPAddresses_UpdateIPAddressByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[IPAddresses_UpdateIPAddressByID]
(
    @ID [bigint],
    @Address [varchar](15),
    @State [tinyint],
    @Expiration [datetime] NULL,
    @Created [datetime],
    @Updated [datetime] NULL
)
AS

SET NOCOUNT ON

UPDATE
    [IPAddresses]
SET
[Address] = @Address,
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

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IPAddresses_DeleteIPAddressByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[IPAddresses_DeleteIPAddressByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[IPAddresses_DeleteIPAddressByID]
(
    @ID [bigint]
)
AS

SET NOCOUNT ON

DELETE FROM
    [IPAddresses]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Get-By-ID */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IPAddresses_GetIPAddressByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[IPAddresses_GetIPAddressByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[IPAddresses_GetIPAddressByID]
(
    @ID [bigint]
)
AS

SET NOCOUNT ON

SELECT
    [ID],
    [Address]
    ,[State]
    ,[Expiration]
    ,[Created]
    ,[Updated]
FROM
    [IPAddresses]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IPAddresses_GetIPAddressByAddress]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[IPAddresses_GetIPAddressByAddress] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[IPAddresses_GetIPAddressByAddress]
(
    @Address [varchar](15)
)
AS

SET NOCOUNT ON

SELECT
    [ID]
    ,[Address]
    ,[State]
    ,[Expiration]
    ,[Created]
    ,[Updated]
FROM
	[IPAddresses]
WHERE
	([Address] = @Address)

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IPAddresses_GetOrCreateIPAddress]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[IPAddresses_GetOrCreateIPAddress] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[IPAddresses_GetOrCreateIPAddress]
(
    @CreatedNewEntity [bit] OUTPUT,
    @Address [varchar](15)
)
AS

SET NOCOUNT ON

DECLARE @ID [bigint]

SELECT
    @ID = [ID]
FROM
	[IPAddresses]
WHERE
	([Address] = @Address)

IF (@ID IS NULL)
BEGIN
    DECLARE @Created [datetime] = GETDATE()
    DECLARE @Updated [datetime] = @Created
    INSERT INTO
	[IPAddresses]
    (
        [Address],
        [Created], 
        [Updated]
    )
    VALUES
    (
        @Address,
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
    ,[Address]
    ,[State]
    ,[Expiration]
    ,[Created]
    ,[Updated]
FROM
    [IPAddresses]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IPAddresses_GetIPAddresssByIDs]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[IPAddresses_GetIPAddresssByIDs] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[IPAddresses_GetIPAddresssByIDs]
(
    @IDs [dbo].[BigIntList] READONLY
)
AS

SET NOCOUNT ON

SELECT
    [ID]
    ,[Address]
    ,[State]
    ,[Expiration]
    ,[Created]
    ,[Updated]
FROM
	[IPAddresses]
WHERE
	([ID] IN (SELECT [ID] FROM @IDs))

SET NOCOUNT OFF

RETURN

GO
/********** End IPAddress **********/
/****** Begin UserIPAddressV2 ******/

/* Standard Insertion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserIPAddressesV3_InsertUserIPAddressV2]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[UserIPAddressesV3_InsertUserIPAddressV2] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[UserIPAddressesV3_InsertUserIPAddressV2]
(
	@ID [bigint] OUTPUT,
    @UserID [bigint],
    @IPAddressID [bigint],
    @State [tinyint],
    @LastSeen [datetime] NULL,
    @Created [datetime]
)
AS

SET NOCOUNT ON

INSERT INTO
	[UserIPAddressesV3]
(
[UserID],
[IPAddressID],
[State],
[LastSeen],
[Created]
)
VALUES
(
@UserID,
@IPAddressID,
@State,
@LastSeen,
@Created
)

SET @ID = SCOPE_IDENTITY();

SET NOCOUNT OFF

RETURN

GO

/* Standard Update */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserIPAddressesV3_UpdateUserIPAddressV2ByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[UserIPAddressesV3_UpdateUserIPAddressV2ByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[UserIPAddressesV3_UpdateUserIPAddressV2ByID]
(
    @ID [bigint],
    @UserID [bigint],
    @IPAddressID [bigint],
    @State [tinyint],
    @LastSeen [datetime] NULL,
    @Created [datetime]
)
AS

SET NOCOUNT ON

UPDATE
    [UserIPAddressesV3]
SET
[UserID] = @UserID,
[IPAddressID] = @IPAddressID,
[State] = @State,
[LastSeen] = @LastSeen,
[Created] = @Created
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Deletion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserIPAddressesV3_DeleteUserIPAddressV2ByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[UserIPAddressesV3_DeleteUserIPAddressV2ByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[UserIPAddressesV3_DeleteUserIPAddressV2ByID]
(
    @ID [bigint]
)
AS

SET NOCOUNT ON

DELETE FROM
    [UserIPAddressesV3]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Get-By-ID */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserIPAddressesV3_GetUserIPAddressV2ByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[UserIPAddressesV3_GetUserIPAddressV2ByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[UserIPAddressesV3_GetUserIPAddressV2ByID]
(
    @ID [bigint]
)
AS

SET NOCOUNT ON

SELECT
    [ID],
    [UserID]
    ,[IPAddressID]
    ,[State]
    ,[LastSeen]
    ,[Created]
FROM
    [UserIPAddressesV3]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserIPAddressesV3_GetUserIPAddressV2IDsByUserID_Paged]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[UserIPAddressesV3_GetUserIPAddressV2IDsByUserID_Paged] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[UserIPAddressesV3_GetUserIPAddressV2IDsByUserID_Paged]
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
	[UserIPAddressesV3]
WHERE
	([UserID] = @UserID)
ORDER BY
    [ID] ASC
OFFSET @StartRowIndex ROWS FETCH NEXT @MaximumRows ROWS ONLY

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserIPAddressesV3_GetUserIPAddressV2IDsByIPAddressID_Paged]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[UserIPAddressesV3_GetUserIPAddressV2IDsByIPAddressID_Paged] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[UserIPAddressesV3_GetUserIPAddressV2IDsByIPAddressID_Paged]
(
    @IPAddressID [bigint],
    @StartRowIndex [bigint],
    @MaximumRows [bigint]
)
AS

SET NOCOUNT ON

SELECT
    [ID]
FROM
	[UserIPAddressesV3]
WHERE
	([IPAddressID] = @IPAddressID)
ORDER BY
    [ID] ASC
OFFSET @StartRowIndex ROWS FETCH NEXT @MaximumRows ROWS ONLY

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserIPAddressesV3_GetTotalNumberOfUserIPAddressV2sByUserID]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[UserIPAddressesV3_GetTotalNumberOfUserIPAddressV2sByUserID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[UserIPAddressesV3_GetTotalNumberOfUserIPAddressV2sByUserID]
(
    @UserID [bigint]
)
AS

SET NOCOUNT ON

SELECT
    COUNT(*)
FROM
	[UserIPAddressesV3]
WHERE
	([UserID] = @UserID)

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserIPAddressesV3_GetTotalNumberOfUserIPAddressV2sByIPAddressID]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[UserIPAddressesV3_GetTotalNumberOfUserIPAddressV2sByIPAddressID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[UserIPAddressesV3_GetTotalNumberOfUserIPAddressV2sByIPAddressID]
(
    @IPAddressID [bigint]
)
AS

SET NOCOUNT ON

SELECT
    COUNT(*)
FROM
	[UserIPAddressesV3]
WHERE
	([IPAddressID] = @IPAddressID)

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserIPAddressesV3_GetOrCreateUserIPAddressV2]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[UserIPAddressesV3_GetOrCreateUserIPAddressV2] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[UserIPAddressesV3_GetOrCreateUserIPAddressV2]
(
    @CreatedNewEntity [bit] OUTPUT,
    @UserID [bigint],
    @IPAddressID [bigint]
)
AS

SET NOCOUNT ON

DECLARE @ID [bigint]

SELECT
    @ID = [ID]
FROM
	[UserIPAddressesV3]
WHERE
	([UserID] = @UserID) AND ([IPAddressID] = @IPAddressID)

IF (@ID IS NULL)
BEGIN
    DECLARE @Created [datetime] = GETDATE()
    INSERT INTO
	[UserIPAddressesV3]
    (
        [UserID],
        [IPAddressID],
        [Created]
    )
    VALUES
    (
        @UserID,
        @IPAddressID,
        @Created
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
    ,[IPAddressID]
    ,[State]
    ,[LastSeen]
    ,[Created]
FROM
    [UserIPAddressesV3]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserIPAddressesV3_GetUserIPAddressV2sByIDs]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[UserIPAddressesV3_GetUserIPAddressV2sByIDs] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[UserIPAddressesV3_GetUserIPAddressV2sByIDs]
(
    @IDs [dbo].[BigIntList] READONLY
)
AS

SET NOCOUNT ON

SELECT
    [ID]
    ,[UserID]
    ,[IPAddressID]
    ,[State]
    ,[LastSeen]
    ,[Created]
FROM
	[UserIPAddressesV3]
WHERE
	([ID] IN (SELECT [ID] FROM @IDs))

SET NOCOUNT OFF

RETURN

GO
/********** End UserIPAddressV2 **********/