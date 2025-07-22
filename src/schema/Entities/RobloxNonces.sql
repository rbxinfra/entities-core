USE [master]
GO

IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = N'RobloxNonces')
BEGIN
CREATE DATABASE [RobloxNonces] ON  PRIMARY
( NAME = N'RobloxNonces', FILENAME = N'/data/RobloxNonces/RobloxNonces.mdf' , SIZE = 5120KB , MAXSIZE = 10MB , FILEGROWTH = 1024KB ),
( NAME = N'RobloxNonces2', FILENAME = N'/data/RobloxNonces/RobloxNonces2.mdf' , SIZE = 5120KB , MAXSIZE = 10MB , FILEGROWTH = 1024KB ),
( NAME = N'RobloxNonces3', FILENAME = N'/data/RobloxNonces/RobloxNonces3.mdf' , SIZE = 5120KB , MAXSIZE = 10MB , FILEGROWTH = 1024KB ),
( NAME = N'RobloxNonces4', FILENAME = N'/data/RobloxNonces/RobloxNonces4.mdf' , SIZE = 5120KB , MAXSIZE = 10MB , FILEGROWTH = 1024KB ),
( NAME = N'RobloxNonces5', FILENAME = N'/data/RobloxNonces/RobloxNonces5.mdf' , SIZE = 5120KB , MAXSIZE = 10MB , FILEGROWTH = 1024KB ),
( NAME = N'RobloxNonces6', FILENAME = N'/data/RobloxNonces/RobloxNonces6.mdf' , SIZE = 5120KB , MAXSIZE = 10MB , FILEGROWTH = 1024KB ),
( NAME = N'RobloxNonces7', FILENAME = N'/data/RobloxNonces/RobloxNonces7.mdf' , SIZE = 5120KB , MAXSIZE = 10MB , FILEGROWTH = 1024KB ),
( NAME = N'RobloxNonces8', FILENAME = N'/data/RobloxNonces/RobloxNonces8.mdf' , SIZE = 5120KB , MAXSIZE = 10MB , FILEGROWTH = 1024KB )
 LOG ON
( NAME = N'RobloxNonces_log', FILENAME = N'/logs/RobloxNonces/RobloxNonces_log.ldf' , SIZE = 5120KB , MAXSIZE = 10MB , FILEGROWTH = 1024KB ),
( NAME = N'RobloxNonces2_log', FILENAME = N'/logs/RobloxNonces/RobloxNonces2_log.ldf' , SIZE = 5120KB , MAXSIZE = 10MB , FILEGROWTH = 1024KB ),
( NAME = N'RobloxNonces3_log', FILENAME = N'/logs/RobloxNonces/RobloxNonces3_log.ldf' , SIZE = 5120KB , MAXSIZE = 10MB , FILEGROWTH = 1024KB ),
( NAME = N'RobloxNonces4_log', FILENAME = N'/logs/RobloxNonces/RobloxNonces4_log.ldf' , SIZE = 5120KB , MAXSIZE = 10MB , FILEGROWTH = 1024KB ),
( NAME = N'RobloxNonces5_log', FILENAME = N'/logs/RobloxNonces/RobloxNonces5_log.ldf' , SIZE = 5120KB , MAXSIZE = 10MB , FILEGROWTH = 1024KB ),
( NAME = N'RobloxNonces6_log', FILENAME = N'/logs/RobloxNonces/RobloxNonces6_log.ldf' , SIZE = 5120KB , MAXSIZE = 10MB , FILEGROWTH = 1024KB ),
( NAME = N'RobloxNonces7_log', FILENAME = N'/logs/RobloxNonces/RobloxNonces7_log.ldf' , SIZE = 5120KB , MAXSIZE = 10MB , FILEGROWTH = 1024KB ),
( NAME = N'RobloxNonces8_log', FILENAME = N'/logs/RobloxNonces/RobloxNonces8_log.ldf' , SIZE = 5120KB , MAXSIZE = 10MB , FILEGROWTH = 1024KB )
END
GO

ALTER DATABASE [RobloxNonces] SET COMPATIBILITY_LEVEL = 100
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RobloxNonces].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [RobloxNonces] SET ANSI_NULL_DEFAULT OFF
GO

ALTER DATABASE [RobloxNonces] SET ANSI_NULLS OFF
GO

ALTER DATABASE [RobloxNonces] SET ANSI_PADDING OFF
GO

ALTER DATABASE [RobloxNonces] SET ANSI_WARNINGS OFF
GO

ALTER DATABASE [RobloxNonces] SET ARITHABORT OFF
GO

ALTER DATABASE [RobloxNonces] SET AUTO_CLOSE OFF
GO

ALTER DATABASE [RobloxNonces] SET AUTO_CREATE_STATISTICS ON
GO

ALTER DATABASE [RobloxNonces] SET AUTO_SHRINK OFF
GO

ALTER DATABASE [RobloxNonces] SET AUTO_UPDATE_STATISTICS ON
GO

ALTER DATABASE [RobloxNonces] SET CURSOR_CLOSE_ON_COMMIT OFF
GO

ALTER DATABASE [RobloxNonces] SET CURSOR_DEFAULT  GLOBAL
GO

ALTER DATABASE [RobloxNonces] SET CONCAT_NULL_YIELDS_NULL OFF
GO

ALTER DATABASE [RobloxNonces] SET NUMERIC_ROUNDABORT OFF
GO

ALTER DATABASE [RobloxNonces] SET QUOTED_IDENTIFIER OFF
GO

ALTER DATABASE [RobloxNonces] SET RECURSIVE_TRIGGERS OFF
GO

ALTER DATABASE [RobloxNonces] SET  DISABLE_BROKER
GO

ALTER DATABASE [RobloxNonces] SET AUTO_UPDATE_STATISTICS_ASYNC ON
GO

ALTER DATABASE [RobloxNonces] SET DATE_CORRELATION_OPTIMIZATION OFF
GO

ALTER DATABASE [RobloxNonces] SET TRUSTWORTHY OFF
GO

ALTER DATABASE [RobloxNonces] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO

ALTER DATABASE [RobloxNonces] SET PARAMETERIZATION SIMPLE
GO

ALTER DATABASE [RobloxNonces] SET READ_COMMITTED_SNAPSHOT OFF
GO

ALTER DATABASE [RobloxNonces] SET HONOR_BROKER_PRIORITY OFF
GO

ALTER DATABASE [RobloxNonces] SET  READ_WRITE
GO

ALTER DATABASE [RobloxNonces] SET RECOVERY FULL
GO

ALTER DATABASE [RobloxNonces] SET  MULTI_USER
GO

ALTER DATABASE [RobloxNonces] SET PAGE_VERIFY CHECKSUM
GO

ALTER DATABASE [RobloxNonces] SET DB_CHAINING OFF
GO


USE [RobloxNonces]
GO


/****** Begin Ephemeral Nonces ******/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EphemeralNonces]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EphemeralNonces](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Nonce] [varchar](255) NOT NULL,
	[Expiration] [datetime] NOT NULL
 CONSTRAINT [PK_EphemeralNonces] PRIMARY KEY CLUSTERED
(
	[ID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END

/****** End Leased Locks ******/

/****** Begin Leased Locks ******/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EphemeralNonces_InsertEphemeralNonce]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[EphemeralNonces_InsertEphemeralNonce] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[EphemeralNonces_InsertEphemeralNonce]
(
	@Nonce   			[varchar](255),
	@ExpirationSeconds	[int],
	@IsInserted			[bit] OUTPUT
)
AS
SET NOCOUNT ON

DECLARE @ExpirationDateTime [datetime]
SET @ExpirationDateTime = DATEADD(second, @ExpirationSeconds, GETUTCDATE())

BEGIN TRY
	INSERT INTO [EphemeralNonces]
	(
		[Nonce],
		[Expiration]
	)
	VALUES
	(
		@Nonce,
		@ExpirationDateTime
	)
	
	SET @IsInserted = 1
END TRY
BEGIN CATCH
	SET @IsInserted = 0
END CATCH

SET NOCOUNT OFF
GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EphemeralNonces_TryRedeem]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[EphemeralNonces_TryRedeem] AS BEGIN SET NOCOUNT ON; END')
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[EphemeralNonces_TryRedeem]
(
	@Nonce [varchar](255),
	@IsRedeemed [bit] OUTPUT
)
AS
SET NOCOUNT ON

DECLARE @ID [int]
DECLARE @ExpirationDateTime [datetime]

-- Determine if the nonce exists
SELECT @ID = [ID], @ExpirationDateTime = [Expiration] FROM [EphemeralNonces] WHERE [Nonce] = @Nonce
IF @ID IS NULL -- Nonce does not exist
BEGIN
	SET @IsRedeemed = 0
END
ELSE -- Nonce exists
BEGIN
	-- Check if the nonce is expired
	IF GETUTCDATE() > @ExpirationDateTime
	BEGIN
		DELETE FROM [EphemeralNonces] WHERE [ID] = @ID
		SET @IsRedeemed = 0
	END
	ELSE -- Nonce is not expired
	BEGIN
		DELETE FROM [EphemeralNonces] WHERE [ID] = @ID
		SET @IsRedeemed = @@ROWCOUNT
	END
END

SET NOCOUNT OFF
GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EphemeralNonces_PurgeExpiredNonces]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[EphemeralNonces_PurgeExpiredNonces] AS BEGIN SET NOCOUNT ON; END')
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[EphemeralNonces_PurgeExpiredNonces]
(
	@DeletedCount [int] OUTPUT
)
AS
SET NOCOUNT ON

BEGIN TRY
	DELETE FROM [EphemeralNonces] 
	WHERE [Expiration] < GETUTCDATE()
	
	SET @DeletedCount = @@ROWCOUNT
END TRY
BEGIN CATCH
	SET @DeletedCount = -1
END CATCH
SET NOCOUNT OFF
GO

/****** End Leased Locks ******/