USE [master]
GO

IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = N'RobloxModeration')
BEGIN
CREATE DATABASE [RobloxModeration] ON  PRIMARY
( NAME = N'RobloxModeration', FILENAME = N'/data/RobloxModeration/RobloxModeration.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxModeration2', FILENAME = N'/data/RobloxModeration/RobloxModeration2.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxModeration3', FILENAME = N'/data/RobloxModeration/RobloxModeration3.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxModeration4', FILENAME = N'/data/RobloxModeration/RobloxModeration4.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxModeration5', FILENAME = N'/data/RobloxModeration/RobloxModeration5.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxModeration6', FILENAME = N'/data/RobloxModeration/RobloxModeration6.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxModeration7', FILENAME = N'/data/RobloxModeration/RobloxModeration7.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxModeration8', FILENAME = N'/data/RobloxModeration/RobloxModeration8.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB )
 LOG ON
( NAME = N'RobloxModeration_log', FILENAME = N'/logs/RobloxModeration/RobloxModeration_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxModeration2_log', FILENAME = N'/logs/RobloxModeration/RobloxModeration2_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxModeration3_log', FILENAME = N'/logs/RobloxModeration/RobloxModeration3_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxModeration4_log', FILENAME = N'/logs/RobloxModeration/RobloxModeration4_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxModeration5_log', FILENAME = N'/logs/RobloxModeration/RobloxModeration5_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxModeration6_log', FILENAME = N'/logs/RobloxModeration/RobloxModeration6_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxModeration7_log', FILENAME = N'/logs/RobloxModeration/RobloxModeration7_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'RobloxModeration8_log', FILENAME = N'/logs/RobloxModeration/RobloxModeration8_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB )
END
GO

ALTER DATABASE [RobloxModeration] SET COMPATIBILITY_LEVEL = 100
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RobloxModeration].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [RobloxModeration] SET ANSI_NULL_DEFAULT OFF
GO

ALTER DATABASE [RobloxModeration] SET ANSI_NULLS OFF
GO

ALTER DATABASE [RobloxModeration] SET ANSI_PADDING OFF
GO

ALTER DATABASE [RobloxModeration] SET ANSI_WARNINGS OFF
GO

ALTER DATABASE [RobloxModeration] SET ARITHABORT OFF
GO

ALTER DATABASE [RobloxModeration] SET AUTO_CLOSE OFF
GO

ALTER DATABASE [RobloxModeration] SET AUTO_CREATE_STATISTICS ON
GO

ALTER DATABASE [RobloxModeration] SET AUTO_SHRINK OFF
GO

ALTER DATABASE [RobloxModeration] SET AUTO_UPDATE_STATISTICS ON
GO

ALTER DATABASE [RobloxModeration] SET CURSOR_CLOSE_ON_COMMIT OFF
GO

ALTER DATABASE [RobloxModeration] SET CURSOR_DEFAULT  GLOBAL
GO

ALTER DATABASE [RobloxModeration] SET CONCAT_NULL_YIELDS_NULL OFF
GO

ALTER DATABASE [RobloxModeration] SET NUMERIC_ROUNDABORT OFF
GO

ALTER DATABASE [RobloxModeration] SET QUOTED_IDENTIFIER OFF
GO

ALTER DATABASE [RobloxModeration] SET RECURSIVE_TRIGGERS OFF
GO

ALTER DATABASE [RobloxModeration] SET  DISABLE_BROKER
GO

ALTER DATABASE [RobloxModeration] SET AUTO_UPDATE_STATISTICS_ASYNC ON
GO

ALTER DATABASE [RobloxModeration] SET DATE_CORRELATION_OPTIMIZATION OFF
GO

ALTER DATABASE [RobloxModeration] SET TRUSTWORTHY OFF
GO

ALTER DATABASE [RobloxModeration] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO

ALTER DATABASE [RobloxModeration] SET PARAMETERIZATION SIMPLE
GO

ALTER DATABASE [RobloxModeration] SET READ_COMMITTED_SNAPSHOT OFF
GO

ALTER DATABASE [RobloxModeration] SET HONOR_BROKER_PRIORITY OFF
GO

ALTER DATABASE [RobloxModeration] SET  READ_WRITE
GO

ALTER DATABASE [RobloxModeration] SET RECOVERY FULL
GO

ALTER DATABASE [RobloxModeration] SET  MULTI_USER
GO

ALTER DATABASE [RobloxModeration] SET PAGE_VERIFY CHECKSUM
GO

ALTER DATABASE [RobloxModeration] SET DB_CHAINING OFF
GO

USE [RobloxModeration]
GO


