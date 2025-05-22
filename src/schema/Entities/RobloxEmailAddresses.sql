USE [master]
GO

IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = N'RobloxEmailAddresses')
BEGIN
CREATE DATABASE [RobloxEmailAddresses] ON  PRIMARY
( NAME = N'RobloxEmailAddresses', FILENAME = N'/data/RobloxEmailAddresses/RobloxEmailAddresses.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxEmailAddresses2', FILENAME = N'/data/RobloxEmailAddresses/RobloxEmailAddresses2.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxEmailAddresses3', FILENAME = N'/data/RobloxEmailAddresses/RobloxEmailAddresses3.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxEmailAddresses4', FILENAME = N'/data/RobloxEmailAddresses/RobloxEmailAddresses4.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxEmailAddresses5', FILENAME = N'/data/RobloxEmailAddresses/RobloxEmailAddresses5.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxEmailAddresses6', FILENAME = N'/data/RobloxEmailAddresses/RobloxEmailAddresses6.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxEmailAddresses7', FILENAME = N'/data/RobloxEmailAddresses/RobloxEmailAddresses7.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxEmailAddresses8', FILENAME = N'/data/RobloxEmailAddresses/RobloxEmailAddresses8.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB )
 LOG ON
( NAME = N'RobloxEmailAddresses_log', FILENAME = N'/logs/RobloxEmailAddresses/RobloxEmailAddresses_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxEmailAddresses2_log', FILENAME = N'/logs/RobloxEmailAddresses/RobloxEmailAddresses2_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxEmailAddresses3_log', FILENAME = N'/logs/RobloxEmailAddresses/RobloxEmailAddresses3_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxEmailAddresses4_log', FILENAME = N'/logs/RobloxEmailAddresses/RobloxEmailAddresses4_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxEmailAddresses5_log', FILENAME = N'/logs/RobloxEmailAddresses/RobloxEmailAddresses5_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxEmailAddresses6_log', FILENAME = N'/logs/RobloxEmailAddresses/RobloxEmailAddresses6_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxEmailAddresses7_log', FILENAME = N'/logs/RobloxEmailAddresses/RobloxEmailAddresses7_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxEmailAddresses8_log', FILENAME = N'/logs/RobloxEmailAddresses/RobloxEmailAddresses8_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB )
END
GO

ALTER DATABASE [RobloxEmailAddresses] SET COMPATIBILITY_LEVEL = 100
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RobloxEmailAddresses].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [RobloxEmailAddresses] SET ANSI_NULL_DEFAULT OFF
GO

ALTER DATABASE [RobloxEmailAddresses] SET ANSI_NULLS OFF
GO

ALTER DATABASE [RobloxEmailAddresses] SET ANSI_PADDING OFF
GO

ALTER DATABASE [RobloxEmailAddresses] SET ANSI_WARNINGS OFF
GO

ALTER DATABASE [RobloxEmailAddresses] SET ARITHABORT OFF
GO

ALTER DATABASE [RobloxEmailAddresses] SET AUTO_CLOSE OFF
GO

ALTER DATABASE [RobloxEmailAddresses] SET AUTO_CREATE_STATISTICS ON
GO

ALTER DATABASE [RobloxEmailAddresses] SET AUTO_SHRINK OFF
GO

ALTER DATABASE [RobloxEmailAddresses] SET AUTO_UPDATE_STATISTICS ON
GO

ALTER DATABASE [RobloxEmailAddresses] SET CURSOR_CLOSE_ON_COMMIT OFF
GO

ALTER DATABASE [RobloxEmailAddresses] SET CURSOR_DEFAULT  GLOBAL
GO

ALTER DATABASE [RobloxEmailAddresses] SET CONCAT_NULL_YIELDS_NULL OFF
GO

ALTER DATABASE [RobloxEmailAddresses] SET NUMERIC_ROUNDABORT OFF
GO

ALTER DATABASE [RobloxEmailAddresses] SET QUOTED_IDENTIFIER OFF
GO

ALTER DATABASE [RobloxEmailAddresses] SET RECURSIVE_TRIGGERS OFF
GO

ALTER DATABASE [RobloxEmailAddresses] SET  DISABLE_BROKER
GO

ALTER DATABASE [RobloxEmailAddresses] SET AUTO_UPDATE_STATISTICS_ASYNC ON
GO

ALTER DATABASE [RobloxEmailAddresses] SET DATE_CORRELATION_OPTIMIZATION OFF
GO

ALTER DATABASE [RobloxEmailAddresses] SET TRUSTWORTHY OFF
GO

ALTER DATABASE [RobloxEmailAddresses] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO

ALTER DATABASE [RobloxEmailAddresses] SET PARAMETERIZATION SIMPLE
GO

ALTER DATABASE [RobloxEmailAddresses] SET READ_COMMITTED_SNAPSHOT OFF
GO

ALTER DATABASE [RobloxEmailAddresses] SET HONOR_BROKER_PRIORITY OFF
GO

ALTER DATABASE [RobloxEmailAddresses] SET  READ_WRITE
GO

ALTER DATABASE [RobloxEmailAddresses] SET RECOVERY FULL
GO

ALTER DATABASE [RobloxEmailAddresses] SET  MULTI_USER
GO

ALTER DATABASE [RobloxEmailAddresses] SET PAGE_VERIFY CHECKSUM
GO

ALTER DATABASE [RobloxEmailAddresses] SET DB_CHAINING OFF
GO

USE [RobloxEmailAddresses]
GO


/****** Begin EmailAddress ******/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EmailAddresses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EmailAddresses](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [Address] [varchar](256) NOT NULL,
    [IsBlacklisted] [bit] NOT NULL,
    [IsApproved] [bit] NOT NULL,
    [IsReviewed] [bit] NOT NULL,
    [Reviewed] [datetime] NULL,
    [Created] [datetime] NOT NULL,
    [Updated] [datetime] NULL,
 CONSTRAINT [PK_EmailAddresses] PRIMARY KEY CLUSTERED
(
    [ID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END

/****** End EmailAddress ******/

/****** Begin UserEmailAddress ******/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserEmailAddresses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserEmailAddresses](
	[ID] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [UserID] [bigint] NOT NULL,
    [EmailAddressID] [int] NOT NULL,
    [IsVerified] [bit] NOT NULL,
    [IsValid] [bit] NOT NULL,
    [Newsletter] [bit] NOT NULL,
    [Created] [datetime] NOT NULL,
    [Updated] [datetime] NULL,
 CONSTRAINT [PK_UserEmailAddresses] PRIMARY KEY CLUSTERED
(
    [ID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserEmailAddresses_EmailAddresses_EmailAddressID]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserEmailAddresses]'))
ALTER TABLE [dbo].[UserEmailAddresses] 
WITH CHECK ADD CONSTRAINT [FK_UserEmailAddresses_EmailAddresses_EmailAddressID] FOREIGN KEY ([EmailAddressID])
REFERENCES [dbo].[EmailAddresses] ([ID])
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserEmailAddresses_EmailAddresses_EmailAddressID]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserEmailAddresses]'))
ALTER TABLE [dbo].[UserEmailAddresses] CHECK CONSTRAINT [FK_UserEmailAddresses_EmailAddresses_EmailAddressID]

/****** End UserEmailAddress ******/

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

/****** Begin EmailAddress ******/

/* Standard Insertion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EmailAddresses_InsertEmailAddress]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[EmailAddresses_InsertEmailAddress] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[EmailAddresses_InsertEmailAddress]
(
	@ID [int] OUTPUT,
    @Address [varchar](256),
    @IsBlacklisted [bit],
    @IsApproved [bit],
    @IsReviewed [bit],
    @Reviewed [datetime] NULL,
    @Created [datetime],
    @Updated [datetime] NULL
)
AS

SET NOCOUNT ON

INSERT INTO
	[EmailAddresses]
(
[Address],
[IsBlacklisted],
[IsApproved],
[IsReviewed],
[Reviewed],
[Created],
[Updated]
)
VALUES
(
@Address,
@IsBlacklisted,
@IsApproved,
@IsReviewed,
@Reviewed,
@Created,
@Updated
)

SET @ID = SCOPE_IDENTITY();

SET NOCOUNT OFF

RETURN

GO

/* Standard Update */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EmailAddresses_UpdateEmailAddressByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[EmailAddresses_UpdateEmailAddressByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[EmailAddresses_UpdateEmailAddressByID]
(
    @ID [int],
    @Address [varchar](256),
    @IsBlacklisted [bit],
    @IsApproved [bit],
    @IsReviewed [bit],
    @Reviewed [datetime] NULL,
    @Created [datetime],
    @Updated [datetime] NULL
)
AS

SET NOCOUNT ON

UPDATE
    [EmailAddresses]
SET
[Address] = @Address,
[IsBlacklisted] = @IsBlacklisted,
[IsApproved] = @IsApproved,
[IsReviewed] = @IsReviewed,
[Reviewed] = @Reviewed,
[Created] = @Created,
[Updated] = @Updated
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Deletion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EmailAddresses_DeleteEmailAddressByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[EmailAddresses_DeleteEmailAddressByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[EmailAddresses_DeleteEmailAddressByID]
(
    @ID [int]
)
AS

SET NOCOUNT ON

DELETE FROM
    [EmailAddresses]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Get-By-ID */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EmailAddresses_GetEmailAddressByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[EmailAddresses_GetEmailAddressByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[EmailAddresses_GetEmailAddressByID]
(
    @ID [int]
)
AS

SET NOCOUNT ON

SELECT
    [ID],
    [Address]
    ,[IsBlacklisted]
    ,[IsApproved]
    ,[IsReviewed]
    ,[Reviewed]
    ,[Created]
    ,[Updated]
FROM
    [EmailAddresses]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EmailAddresses_GetEmailAddressByAddress]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[EmailAddresses_GetEmailAddressByAddress] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[EmailAddresses_GetEmailAddressByAddress]
(
    @Address [varchar](256)
)
AS

SET NOCOUNT ON

SELECT
    [ID]
    ,[Address]
    ,[IsBlacklisted]
    ,[IsApproved]
    ,[IsReviewed]
    ,[Reviewed]
    ,[Created]
    ,[Updated]
FROM
	[EmailAddresses]
WHERE
	([Address] = @Address)

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EmailAddresses_GetOrCreateEmailAddress]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[EmailAddresses_GetOrCreateEmailAddress] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[EmailAddresses_GetOrCreateEmailAddress]
(
    @CreatedNewEntity [bit] OUTPUT,
    @Address [varchar](256)
)
AS

SET NOCOUNT ON

DECLARE @ID [int]

SELECT
    @ID = [ID]
FROM
	[EmailAddresses]
WHERE
	([Address] = @Address)

IF (@ID IS NULL)
BEGIN
    DECLARE @Created [datetime] = GETDATE()
    DECLARE @Updated [datetime] = @Created
    INSERT INTO
	[EmailAddresses]
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
    ,[IsBlacklisted]
    ,[IsApproved]
    ,[IsReviewed]
    ,[Reviewed]
    ,[Created]
    ,[Updated]
FROM
    [EmailAddresses]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EmailAddresses_GetAllEmailAddressIDs_Paged]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[EmailAddresses_GetAllEmailAddressIDs_Paged] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[EmailAddresses_GetAllEmailAddressIDs_Paged]
(
    @StartRowIndex [bigint],
    @MaximumRows [bigint]
)
AS

SET NOCOUNT ON

SELECT
    [ID]
FROM
	[EmailAddresses]
WHERE
	([IsBlacklisted] = 1)
ORDER BY [ID]
OFFSET @StartRowIndex-2 ROWS FETCH NEXT @MaximumRows ROWS ONLY

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EmailAddresses_GetTotalNumberOfEmailAddresss]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[EmailAddresses_GetTotalNumberOfEmailAddresss] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[EmailAddresses_GetTotalNumberOfEmailAddresss]
AS

SET NOCOUNT ON

SELECT
    COUNT(*)
FROM
	[EmailAddresses]
WHERE
	([IsBlacklisted] = 1)

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EmailAddresses_GetEmailAddresssByIDs]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[EmailAddresses_GetEmailAddresssByIDs] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[EmailAddresses_GetEmailAddresssByIDs]
(
    @IDs [dbo].[IntList] READONLY
)
AS

SET NOCOUNT ON

SELECT
    [ID]
    ,[Address]
    ,[IsBlacklisted]
    ,[IsApproved]
    ,[IsReviewed]
    ,[Reviewed]
    ,[Created]
    ,[Updated]
FROM
	[EmailAddresses]
WHERE
	([ID] IN (SELECT [ID] FROM @IDs))

SET NOCOUNT OFF

RETURN

GO
/********** End EmailAddress **********/
/****** Begin UserEmailAddress ******/

/* Standard Insertion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserEmailAddresses_InsertUserEmailAddress]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[UserEmailAddresses_InsertUserEmailAddress] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[UserEmailAddresses_InsertUserEmailAddress]
(
	@ID [bigint] OUTPUT,
    @UserID [bigint],
    @EmailAddressID [int],
    @IsVerified [bit],
    @IsValid [bit],
    @Newsletter [bit],
    @Created [datetime],
    @Updated [datetime] NULL
)
AS

SET NOCOUNT ON

INSERT INTO
	[UserEmailAddresses]
(
[UserID],
[EmailAddressID],
[IsVerified],
[IsValid],
[Newsletter],
[Created],
[Updated]
)
VALUES
(
@UserID,
@EmailAddressID,
@IsVerified,
@IsValid,
@Newsletter,
@Created,
@Updated
)

SET @ID = SCOPE_IDENTITY();

SET NOCOUNT OFF

RETURN

GO

/* Standard Update */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserEmailAddresses_UpdateUserEmailAddressByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[UserEmailAddresses_UpdateUserEmailAddressByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[UserEmailAddresses_UpdateUserEmailAddressByID]
(
    @ID [bigint],
    @UserID [bigint],
    @EmailAddressID [int],
    @IsVerified [bit],
    @IsValid [bit],
    @Newsletter [bit],
    @Created [datetime],
    @Updated [datetime] NULL
)
AS

SET NOCOUNT ON

UPDATE
    [UserEmailAddresses]
SET
[UserID] = @UserID,
[EmailAddressID] = @EmailAddressID,
[IsVerified] = @IsVerified,
[IsValid] = @IsValid,
[Newsletter] = @Newsletter,
[Created] = @Created,
[Updated] = @Updated
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Deletion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserEmailAddresses_DeleteUserEmailAddressByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[UserEmailAddresses_DeleteUserEmailAddressByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[UserEmailAddresses_DeleteUserEmailAddressByID]
(
    @ID [bigint]
)
AS

SET NOCOUNT ON

DELETE FROM
    [UserEmailAddresses]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Get-By-ID */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserEmailAddresses_GetUserEmailAddressByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[UserEmailAddresses_GetUserEmailAddressByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[UserEmailAddresses_GetUserEmailAddressByID]
(
    @ID [bigint]
)
AS

SET NOCOUNT ON

SELECT
    [ID],
    [UserID]
    ,[EmailAddressID]
    ,[IsVerified]
    ,[IsValid]
    ,[Newsletter]
    ,[Created]
    ,[Updated]
FROM
    [UserEmailAddresses]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserEmailAddresses_GetTotalNumberOfValidUserEmailAddressesByUserID]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[UserEmailAddresses_GetTotalNumberOfValidUserEmailAddressesByUserID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[UserEmailAddresses_GetTotalNumberOfValidUserEmailAddressesByUserID]
(
    @UserID [bigint]
)
AS

SET NOCOUNT ON

SELECT
    COUNT(*)
FROM
	[UserEmailAddresses]
WHERE
	([UserID] = @UserID) AND ([IsValid] = 1)

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserEmailAddresses_GetTotalNumberOfUsersByValidEmailAddressID]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[UserEmailAddresses_GetTotalNumberOfUsersByValidEmailAddressID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[UserEmailAddresses_GetTotalNumberOfUsersByValidEmailAddressID]
(
    @EmailAddressID [int]
)
AS

SET NOCOUNT ON

SELECT
    COUNT(*)
FROM
	[UserEmailAddresses]
WHERE
	([EmailAddressID] = @EmailAddressID) AND ([IsValid] = 1)

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserEmailAddresses_GetValidUserEmailAddressIDsByEmailAddressID]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[UserEmailAddresses_GetValidUserEmailAddressIDsByEmailAddressID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[UserEmailAddresses_GetValidUserEmailAddressIDsByEmailAddressID]
(
    @EmailAddressID [int]
)
AS

SET NOCOUNT ON

SELECT
    [ID]
FROM
	[UserEmailAddresses]
WHERE
	([EmailAddressID] = @EmailAddressID) AND ([IsValid] = 1)

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserEmailAddresses_GetValidUserEmailAddressIDsByUserID_Paged]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[UserEmailAddresses_GetValidUserEmailAddressIDsByUserID_Paged] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[UserEmailAddresses_GetValidUserEmailAddressIDsByUserID_Paged]
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
	[UserEmailAddresses]
WHERE
	([UserID] = @UserID) AND ([IsValid] = 1)
ORDER BY [ID]
OFFSET @StartRowIndex-2 ROWS FETCH NEXT @MaximumRows ROWS ONLY

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserEmailAddresses_GetValidUserEmailAddressIDsByUserIDAndIsVerified_Paged]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[UserEmailAddresses_GetValidUserEmailAddressIDsByUserIDAndIsVerified_Paged] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[UserEmailAddresses_GetValidUserEmailAddressIDsByUserIDAndIsVerified_Paged]
(
    @UserID [bigint],
    @IsVerified [bit],
    @StartRowIndex [bigint],
    @MaximumRows [bigint]
)
AS

SET NOCOUNT ON

SELECT
    [ID]
FROM
	[UserEmailAddresses]
WHERE
	([UserID] = @UserID) AND ([IsVerified] = @IsVerified) AND ([IsValid] = 1)
ORDER BY [ID]
OFFSET @StartRowIndex-2 ROWS FETCH NEXT @MaximumRows ROWS ONLY

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserEmailAddresses_GetUserEmailAddressIDsByUserID_Paged]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[UserEmailAddresses_GetUserEmailAddressIDsByUserID_Paged] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[UserEmailAddresses_GetUserEmailAddressIDsByUserID_Paged]
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
	[UserEmailAddresses]
WHERE
	([UserID] = @UserID)
ORDER BY [ID]
OFFSET @StartRowIndex-2 ROWS FETCH NEXT @MaximumRows ROWS ONLY

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserEmailAddresses_GetUserEmailAddressIDsByEmailAddressID]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[UserEmailAddresses_GetUserEmailAddressIDsByEmailAddressID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[UserEmailAddresses_GetUserEmailAddressIDsByEmailAddressID]
(
    @EmailAddressID [int],
    @Count [int],
    @ExclusiveStartID [bigint] NOT NULL
)
AS

SET NOCOUNT ON

DECLARE @ExclusiveStartIDOffset int
SELECT
    @ExclusiveStartIDOffset = ROW_NUMBER() OVER (ORDER BY [ID])
FROM
    [UserEmailAddresses]
WHERE
    ([ID] = @ExclusiveStartID) AND ([EmailAddressID] = @EmailAddressID)
ORDER BY
    [ID]

SELECT
    [ID]
FROM
	[UserEmailAddresses]
WHERE
	([EmailAddressID] = @EmailAddressID)
ORDER BY
    [ID]
OFFSET @ExclusiveStartIDOffset ROWS FETCH NEXT @Count ROWS ONLY

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserEmailAddresses_GetTotalNumberOfUserEmailAddresssByEmailAddressID]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[UserEmailAddresses_GetTotalNumberOfUserEmailAddresssByEmailAddressID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[UserEmailAddresses_GetTotalNumberOfUserEmailAddresssByEmailAddressID]
(
    @EmailAddressID [int]
)
AS

SET NOCOUNT ON

SELECT
    COUNT(*)
FROM
	[UserEmailAddresses]
WHERE
	([EmailAddressID] = @EmailAddressID)

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserEmailAddresses_GetUserEmailAddressIDsByEmailAddressIDAndIsValid]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[UserEmailAddresses_GetUserEmailAddressIDsByEmailAddressIDAndIsValid] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[UserEmailAddresses_GetUserEmailAddressIDsByEmailAddressIDAndIsValid]
(
    @EmailAddressID [int],
    @IsValid [bit],
    @Count [int],
    @ExclusiveStartID [bigint] NOT NULL
)
AS

SET NOCOUNT ON

DECLARE @ExclusiveStartIDOffset int
SELECT
    @ExclusiveStartIDOffset = ROW_NUMBER() OVER (ORDER BY [ID])
FROM
    [UserEmailAddresses]
WHERE
    ([ID] = @ExclusiveStartID) AND ([EmailAddressID] = @EmailAddressID) AND ([IsValid] = @IsValid)
ORDER BY
    [ID]

SELECT
    [ID]
FROM
	[UserEmailAddresses]
WHERE
	([EmailAddressID] = @EmailAddressID) AND ([IsValid] = @IsValid)
ORDER BY
    [ID]
OFFSET @ExclusiveStartIDOffset ROWS FETCH NEXT @Count ROWS ONLY

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserEmailAddresses_GetUserEmailAddressIDsByEmailAddressIDIsVerifiedAndIsValid]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[UserEmailAddresses_GetUserEmailAddressIDsByEmailAddressIDIsVerifiedAndIsValid] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[UserEmailAddresses_GetUserEmailAddressIDsByEmailAddressIDIsVerifiedAndIsValid]
(
    @EmailAddressID [int],
    @IsVerified [bit],
    @IsValid [bit],
    @Count [int],
    @ExclusiveStartID [bigint] NOT NULL
)
AS

SET NOCOUNT ON

DECLARE @ExclusiveStartIDOffset int
SELECT
    @ExclusiveStartIDOffset = ROW_NUMBER() OVER (ORDER BY [ID])
FROM
    [UserEmailAddresses]
WHERE
    ([ID] = @ExclusiveStartID) AND ([EmailAddressID] = @EmailAddressID) AND ([IsVerified] = @IsVerified) AND ([IsValid] = @IsValid)
ORDER BY
    [ID]

SELECT
    [ID]
FROM
	[UserEmailAddresses]
WHERE
	([EmailAddressID] = @EmailAddressID) AND ([IsVerified] = @IsVerified) AND ([IsValid] = @IsValid)
ORDER BY
    [ID]
OFFSET @ExclusiveStartIDOffset ROWS FETCH NEXT @Count ROWS ONLY

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserEmailAddresses_GetUserEmailAddresssByIDs]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[UserEmailAddresses_GetUserEmailAddresssByIDs] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[UserEmailAddresses_GetUserEmailAddresssByIDs]
(
    @IDs [dbo].[BigIntList] READONLY
)
AS

SET NOCOUNT ON

SELECT
    [ID]
    ,[UserID]
    ,[EmailAddressID]
    ,[IsVerified]
    ,[IsValid]
    ,[Newsletter]
    ,[Created]
    ,[Updated]
FROM
	[UserEmailAddresses]
WHERE
	([ID] IN (SELECT [ID] FROM @IDs))

SET NOCOUNT OFF

RETURN

GO
/********** End UserEmailAddress **********/