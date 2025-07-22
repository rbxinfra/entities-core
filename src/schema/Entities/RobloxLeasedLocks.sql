USE [master]
GO

IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = N'RobloxLeasedLocks')
BEGIN
CREATE DATABASE [RobloxLeasedLocks] ON  PRIMARY
( NAME = N'RobloxLeasedLocks', FILENAME = N'/data/RobloxLeasedLocks/RobloxLeasedLocks.mdf' , SIZE = 5120KB , MAXSIZE = 10MB , FILEGROWTH = 1024KB ),
( NAME = N'RobloxLeasedLocks2', FILENAME = N'/data/RobloxLeasedLocks/RobloxLeasedLocks2.mdf' , SIZE = 5120KB , MAXSIZE = 10MB , FILEGROWTH = 1024KB ),
( NAME = N'RobloxLeasedLocks3', FILENAME = N'/data/RobloxLeasedLocks/RobloxLeasedLocks3.mdf' , SIZE = 5120KB , MAXSIZE = 10MB , FILEGROWTH = 1024KB ),
( NAME = N'RobloxLeasedLocks4', FILENAME = N'/data/RobloxLeasedLocks/RobloxLeasedLocks4.mdf' , SIZE = 5120KB , MAXSIZE = 10MB , FILEGROWTH = 1024KB ),
( NAME = N'RobloxLeasedLocks5', FILENAME = N'/data/RobloxLeasedLocks/RobloxLeasedLocks5.mdf' , SIZE = 5120KB , MAXSIZE = 10MB , FILEGROWTH = 1024KB ),
( NAME = N'RobloxLeasedLocks6', FILENAME = N'/data/RobloxLeasedLocks/RobloxLeasedLocks6.mdf' , SIZE = 5120KB , MAXSIZE = 10MB , FILEGROWTH = 1024KB ),
( NAME = N'RobloxLeasedLocks7', FILENAME = N'/data/RobloxLeasedLocks/RobloxLeasedLocks7.mdf' , SIZE = 5120KB , MAXSIZE = 10MB , FILEGROWTH = 1024KB ),
( NAME = N'RobloxLeasedLocks8', FILENAME = N'/data/RobloxLeasedLocks/RobloxLeasedLocks8.mdf' , SIZE = 5120KB , MAXSIZE = 10MB , FILEGROWTH = 1024KB )
 LOG ON
( NAME = N'RobloxLeasedLocks_log', FILENAME = N'/logs/RobloxLeasedLocks/RobloxLeasedLocks_log.ldf' , SIZE = 5120KB , MAXSIZE = 10MB , FILEGROWTH = 1024KB ),
( NAME = N'RobloxLeasedLocks2_log', FILENAME = N'/logs/RobloxLeasedLocks/RobloxLeasedLocks2_log.ldf' , SIZE = 5120KB , MAXSIZE = 10MB , FILEGROWTH = 1024KB ),
( NAME = N'RobloxLeasedLocks3_log', FILENAME = N'/logs/RobloxLeasedLocks/RobloxLeasedLocks3_log.ldf' , SIZE = 5120KB , MAXSIZE = 10MB , FILEGROWTH = 1024KB ),
( NAME = N'RobloxLeasedLocks4_log', FILENAME = N'/logs/RobloxLeasedLocks/RobloxLeasedLocks4_log.ldf' , SIZE = 5120KB , MAXSIZE = 10MB , FILEGROWTH = 1024KB ),
( NAME = N'RobloxLeasedLocks5_log', FILENAME = N'/logs/RobloxLeasedLocks/RobloxLeasedLocks5_log.ldf' , SIZE = 5120KB , MAXSIZE = 10MB , FILEGROWTH = 1024KB ),
( NAME = N'RobloxLeasedLocks6_log', FILENAME = N'/logs/RobloxLeasedLocks/RobloxLeasedLocks6_log.ldf' , SIZE = 5120KB , MAXSIZE = 10MB , FILEGROWTH = 1024KB ),
( NAME = N'RobloxLeasedLocks7_log', FILENAME = N'/logs/RobloxLeasedLocks/RobloxLeasedLocks7_log.ldf' , SIZE = 5120KB , MAXSIZE = 10MB , FILEGROWTH = 1024KB ),
( NAME = N'RobloxLeasedLocks8_log', FILENAME = N'/logs/RobloxLeasedLocks/RobloxLeasedLocks8_log.ldf' , SIZE = 5120KB , MAXSIZE = 10MB , FILEGROWTH = 1024KB )
END
GO

ALTER DATABASE [RobloxLeasedLocks] SET COMPATIBILITY_LEVEL = 100
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RobloxLeasedLocks].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [RobloxLeasedLocks] SET ANSI_NULL_DEFAULT OFF
GO

ALTER DATABASE [RobloxLeasedLocks] SET ANSI_NULLS OFF
GO

ALTER DATABASE [RobloxLeasedLocks] SET ANSI_PADDING OFF
GO

ALTER DATABASE [RobloxLeasedLocks] SET ANSI_WARNINGS OFF
GO

ALTER DATABASE [RobloxLeasedLocks] SET ARITHABORT OFF
GO

ALTER DATABASE [RobloxLeasedLocks] SET AUTO_CLOSE OFF
GO

ALTER DATABASE [RobloxLeasedLocks] SET AUTO_CREATE_STATISTICS ON
GO

ALTER DATABASE [RobloxLeasedLocks] SET AUTO_SHRINK OFF
GO

ALTER DATABASE [RobloxLeasedLocks] SET AUTO_UPDATE_STATISTICS ON
GO

ALTER DATABASE [RobloxLeasedLocks] SET CURSOR_CLOSE_ON_COMMIT OFF
GO

ALTER DATABASE [RobloxLeasedLocks] SET CURSOR_DEFAULT  GLOBAL
GO

ALTER DATABASE [RobloxLeasedLocks] SET CONCAT_NULL_YIELDS_NULL OFF
GO

ALTER DATABASE [RobloxLeasedLocks] SET NUMERIC_ROUNDABORT OFF
GO

ALTER DATABASE [RobloxLeasedLocks] SET QUOTED_IDENTIFIER OFF
GO

ALTER DATABASE [RobloxLeasedLocks] SET RECURSIVE_TRIGGERS OFF
GO

ALTER DATABASE [RobloxLeasedLocks] SET  DISABLE_BROKER
GO

ALTER DATABASE [RobloxLeasedLocks] SET AUTO_UPDATE_STATISTICS_ASYNC ON
GO

ALTER DATABASE [RobloxLeasedLocks] SET DATE_CORRELATION_OPTIMIZATION OFF
GO

ALTER DATABASE [RobloxLeasedLocks] SET TRUSTWORTHY OFF
GO

ALTER DATABASE [RobloxLeasedLocks] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO

ALTER DATABASE [RobloxLeasedLocks] SET PARAMETERIZATION SIMPLE
GO

ALTER DATABASE [RobloxLeasedLocks] SET READ_COMMITTED_SNAPSHOT OFF
GO

ALTER DATABASE [RobloxLeasedLocks] SET HONOR_BROKER_PRIORITY OFF
GO

ALTER DATABASE [RobloxLeasedLocks] SET  READ_WRITE
GO

ALTER DATABASE [RobloxLeasedLocks] SET RECOVERY FULL
GO

ALTER DATABASE [RobloxLeasedLocks] SET  MULTI_USER
GO

ALTER DATABASE [RobloxLeasedLocks] SET PAGE_VERIFY CHECKSUM
GO

ALTER DATABASE [RobloxLeasedLocks] SET DB_CHAINING OFF
GO


USE [RobloxLeasedLocks]
GO


/****** Begin Leased Locks ******/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LeasedLocks]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LeasedLocks](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[LockKey] [varchar](255) NOT NULL,
	[IsAcquired] [bit] NOT NULL,
	[LockHolder] [uniqueidentifier] NOT NULL,
	[LockExpiration] [datetime] NOT NULL
 CONSTRAINT [PK_LeasedLocks] PRIMARY KEY CLUSTERED
(
	[ID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END

/****** End Leased Locks ******/

/****** Begin Leased Locks ******/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LeasedLocks_InsertLeasedLock]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[LeasedLocks_InsertLeasedLock] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[LeasedLocks_InsertLeasedLock]
(
	@ID				[int] 			OUTPUT,
	@LockKey		[varchar](255),
	@IsAcquired		[bit],
	@LockHolder	[uniqueidentifier],
	@LockExpiration	[datetime]
)
AS

SET NOCOUNT ON

INSERT INTO 
	[LeasedLocks]
(
[LockKey],
[IsAcquired],
[LockHolder],
[LockExpiration]
)
VALUES
(
@LockKey,
@IsAcquired,
@LockHolder,
@LockExpiration
)

SET @ID = SCOPE_IDENTITY();

SET NOCOUNT OFF

GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LeasedLocks_TryAcquire]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[LeasedLocks_TryAcquire] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[LeasedLocks_TryAcquire]
(
	@IsAcquired		[bit]			OUTPUT,
	@LockKey		[varchar](255),
	@LockRequester	[uniqueidentifier],
	@LeaseDurationMilliseconds	[int]
)
AS

SET NOCOUNT ON

DECLARE @LockExpiration [datetime]
DECLARE @ID [int]
DECLARE @LockAcquired [bit]
DECLARE @ExistingLockExpiration [datetime]

SET @LockExpiration = DATEADD(ms, @LeaseDurationMilliseconds, GETUTCDATE())

-- Determine if the lock exists
SELECT @ID = [ID], @LockAcquired = [IsAcquired], @ExistingLockExpiration = [LockExpiration] FROM [LeasedLocks] WHERE [LockKey] = @LockKey
IF @ID IS NULL -- Lock does not exist
BEGIN
	EXEC [LeasedLocks_InsertLeasedLock] @ID OUTPUT, @LockKey, 1, @LockRequester, @LockExpiration
	SET @IsAcquired = 1
END
ELSE -- Lock exists
BEGIN
	IF @LockAcquired = 1 -- Lock is already acquired
	BEGIN
		-- Check if the lock is expired
		IF GETUTCDATE() > @ExistingLockExpiration -- Lock is expired
		BEGIN
			UPDATE [LeasedLocks] SET [IsAcquired] = 1, [LockHolder] = @LockRequester, [LockExpiration] = @LockExpiration WHERE [ID] = @ID
			SET @IsAcquired = @@ROWCOUNT
		END
		ELSE -- Lock is not expired
		BEGIN
			SET @IsAcquired = 0
		END
	END
	ELSE -- Lock is not acquired
	BEGIN
		UPDATE [LeasedLocks] SET [IsAcquired] = 1, [LockHolder] = @LockRequester, [LockExpiration] = @LockExpiration WHERE [ID] = @ID
		SET @IsAcquired = @@ROWCOUNT
	END
END

SET NOCOUNT OFF

GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LeasedLocks_TryRelease]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[LeasedLocks_TryRelease] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[LeasedLocks_TryRelease]
(
	@IsReleased		[bit]			OUTPUT,
	@LockKey		[varchar](255),
	@LockHolder		[uniqueidentifier]
)
AS

SET NOCOUNT ON

DECLARE @ID [int]

-- Determine if the lock exists
SELECT @ID = [ID] FROM [LeasedLocks] WHERE [LockKey] = @LockKey AND [LockHolder] = @LockHolder AND [IsAcquired] = 1
IF @ID IS NULL -- Lock does not exist
BEGIN
	SET @IsReleased = 0

	SET NOCOUNT OFF

	-- End execution, as lock does not exist
	RETURN
END
ELSE -- Lock exists
BEGIN
	UPDATE [LeasedLocks] SET [IsAcquired] = 0, [LockExpiration] = GETUTCDATE() WHERE [ID] = @ID AND [LockHolder] = @LockHolder
	SET @IsReleased = @@ROWCOUNT
END

SET NOCOUNT OFF

GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LeasedLocks_TryRenew]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[LeasedLocks_TryRenew] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[LeasedLocks_TryRenew]
(
	@IsRenewed		[bit]			OUTPUT,
	@LockKey		[varchar](255),
	@LockHolder		[uniqueidentifier],
	@LeaseDurationMilliseconds	[int]
)
AS

SET NOCOUNT ON

DECLARE @LockExpiration [datetime]
DECLARE @ID [int]
DECLARE @ExistingLockExpiration [datetime]

SET @LockExpiration = DATEADD(ms, @LeaseDurationMilliseconds, GETUTCDATE())

-- Determine if the lock exists
SELECT @ID = [ID], @ExistingLockExpiration = [LockExpiration] FROM [LeasedLocks] WHERE [LockKey] = @LockKey AND [LockHolder] = @LockHolder AND [IsAcquired] = 1
IF @ID IS NULL -- Lock does not exist
BEGIN
	SET @IsRenewed = 0

	SET NOCOUNT OFF

	-- End execution, as lock does not exist
	RETURN
END
ELSE -- Lock exists
BEGIN
	-- Check if the lock is expired
	IF GETUTCDATE() > @ExistingLockExpiration -- Lock is expired
	BEGIN
		SET @IsRenewed = 0

		SET NOCOUNT OFF

		-- End execution, as lock is expired
		RETURN
	END
	ELSE -- Lock is not expired
	BEGIN
		UPDATE [LeasedLocks] SET [LockExpiration] = @LockExpiration WHERE [ID] = @ID AND [LockHolder] = @LockHolder
		SET @IsRenewed = @@ROWCOUNT
	END
END

SET NOCOUNT OFF

GO

/****** End Leased Locks ******/