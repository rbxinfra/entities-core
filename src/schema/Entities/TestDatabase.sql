USE [master]
GO

IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = N'TestDatabase')
BEGIN
CREATE DATABASE [TestDatabase] ON  PRIMARY
( NAME = N'TestDatabase', FILENAME = N'/data/TestDatabase/TestDatabase.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'TestDatabase2', FILENAME = N'/data/TestDatabase/TestDatabase2.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'TestDatabase3', FILENAME = N'/data/TestDatabase/TestDatabase3.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'TestDatabase4', FILENAME = N'/data/TestDatabase/TestDatabase4.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'TestDatabase5', FILENAME = N'/data/TestDatabase/TestDatabase5.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'TestDatabase6', FILENAME = N'/data/TestDatabase/TestDatabase6.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'TestDatabase7', FILENAME = N'/data/TestDatabase/TestDatabase7.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'TestDatabase8', FILENAME = N'/data/TestDatabase/TestDatabase8.mdf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB )
 LOG ON
( NAME = N'TestDatabase_log', FILENAME = N'/logs/TestDatabase/TestDatabase_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'TestDatabase2_log', FILENAME = N'/logs/TestDatabase/TestDatabase2_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'TestDatabase3_log', FILENAME = N'/logs/TestDatabase/TestDatabase3_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'TestDatabase4_log', FILENAME = N'/logs/TestDatabase/TestDatabase4_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'TestDatabase5_log', FILENAME = N'/logs/TestDatabase/TestDatabase5_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'TestDatabase6_log', FILENAME = N'/logs/TestDatabase/TestDatabase6_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'TestDatabase7_log', FILENAME = N'/logs/TestDatabase/TestDatabase7_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB ),
( NAME = N'TestDatabase8_log', FILENAME = N'/logs/TestDatabase/TestDatabase8_log.ldf' , SIZE = 5120KB, MAXSIZE = 10MB, FILEGROWTH = 1024KB )
END
GO

ALTER DATABASE [TestDatabase] SET COMPATIBILITY_LEVEL = 100
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TestDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [TestDatabase] SET ANSI_NULL_DEFAULT OFF
GO

ALTER DATABASE [TestDatabase] SET ANSI_NULLS OFF
GO

ALTER DATABASE [TestDatabase] SET ANSI_PADDING OFF
GO

ALTER DATABASE [TestDatabase] SET ANSI_WARNINGS OFF
GO

ALTER DATABASE [TestDatabase] SET ARITHABORT OFF
GO

ALTER DATABASE [TestDatabase] SET AUTO_CLOSE OFF
GO

ALTER DATABASE [TestDatabase] SET AUTO_CREATE_STATISTICS ON
GO

ALTER DATABASE [TestDatabase] SET AUTO_SHRINK OFF
GO

ALTER DATABASE [TestDatabase] SET AUTO_UPDATE_STATISTICS ON
GO

ALTER DATABASE [TestDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF
GO

ALTER DATABASE [TestDatabase] SET CURSOR_DEFAULT  GLOBAL
GO

ALTER DATABASE [TestDatabase] SET CONCAT_NULL_YIELDS_NULL OFF
GO

ALTER DATABASE [TestDatabase] SET NUMERIC_ROUNDABORT OFF
GO

ALTER DATABASE [TestDatabase] SET QUOTED_IDENTIFIER OFF
GO

ALTER DATABASE [TestDatabase] SET RECURSIVE_TRIGGERS OFF
GO

ALTER DATABASE [TestDatabase] SET  DISABLE_BROKER
GO

ALTER DATABASE [TestDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC ON
GO

ALTER DATABASE [TestDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF
GO

ALTER DATABASE [TestDatabase] SET TRUSTWORTHY OFF
GO

ALTER DATABASE [TestDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO

ALTER DATABASE [TestDatabase] SET PARAMETERIZATION SIMPLE
GO

ALTER DATABASE [TestDatabase] SET READ_COMMITTED_SNAPSHOT OFF
GO

ALTER DATABASE [TestDatabase] SET HONOR_BROKER_PRIORITY OFF
GO

ALTER DATABASE [TestDatabase] SET  READ_WRITE
GO

ALTER DATABASE [TestDatabase] SET RECOVERY FULL
GO

ALTER DATABASE [TestDatabase] SET  MULTI_USER
GO

ALTER DATABASE [TestDatabase] SET PAGE_VERIFY CHECKSUM
GO

ALTER DATABASE [TestDatabase] SET DB_CHAINING OFF
GO

USE [TestDatabase]
GO


/****** Begin TestEnum ******/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TestEnums]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TestEnums](
	[ID] [tinyint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [Value] [nvarchar](MAX) NOT NULL,
    [Created] [datetime] NOT NULL,
    [Updated] [datetime] NOT NULL,
 CONSTRAINT [PK_TestEnums] PRIMARY KEY CLUSTERED
(
    [ID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END


/****** End TestEnum ******/

/****** Begin Test ******/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tests]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Tests](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [Name] [nvarchar](MAX) NOT NULL,
    [Description] [nvarchar](MAX) NULL,
    [AccountID] [bigint] NOT NULL,
    [TestEnumID] [tinyint] NOT NULL,
    [RawHash] [binary](200) NULL,
    [Created] [datetime] NOT NULL,
    [Updated] [datetime] NOT NULL,
 CONSTRAINT [PK_Tests] PRIMARY KEY CLUSTERED
(
    [ID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tests_TestEnums_TestEnumID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tests]'))
ALTER TABLE [dbo].[Tests] 
WITH CHECK ADD CONSTRAINT [FK_Tests_TestEnums_TestEnumID] FOREIGN KEY ([TestEnumID])
REFERENCES [dbo].[TestEnums] ([ID])
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tests_TestEnums_TestEnumID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tests]'))
ALTER TABLE [dbo].[Tests] CHECK CONSTRAINT [FK_Tests_TestEnums_TestEnumID]


/****** End Test ******/

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

/****** End Data Tables ******/

/****** Begin TestEnum ******/

/* Standard Insertion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TestEnums_InsertTestEnum]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[TestEnums_InsertTestEnum] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[TestEnums_InsertTestEnum]
(
	@ID [tinyint] OUTPUT,
    @Value [nvarchar](MAX),
    @Created [datetime],
    @Updated [datetime]
)
AS

SET NOCOUNT ON

INSERT INTO
	[TestEnums]
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

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TestEnums_UpdateTestEnumByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[TestEnums_UpdateTestEnumByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[TestEnums_UpdateTestEnumByID]
(
    @ID [tinyint],
    @Value [nvarchar](MAX),
    @Created [datetime],
    @Updated [datetime]
)
AS

SET NOCOUNT ON

UPDATE
    [TestEnums]
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

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TestEnums_DeleteTestEnumByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[TestEnums_DeleteTestEnumByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[TestEnums_DeleteTestEnumByID]
(
    @ID [tinyint]
)
AS

SET NOCOUNT ON

DELETE FROM
    [TestEnums]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Get-By-ID */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TestEnums_GetTestEnumByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[TestEnums_GetTestEnumByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[TestEnums_GetTestEnumByID]
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
    [TestEnums]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TestEnums_GetTestEnumByValue]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[TestEnums_GetTestEnumByValue] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[TestEnums_GetTestEnumByValue]
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
	[TestEnums]
WHERE
	([Value] = @Value)

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TestEnums_GetOrCreateTestEnum]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[TestEnums_GetOrCreateTestEnum] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[TestEnums_GetOrCreateTestEnum]
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
	[TestEnums]
WHERE
	([Value] = @Value)

IF (@ID IS NULL)
BEGIN
    DECLARE @Created [datetime] = GETDATE()
    DECLARE @Updated [datetime] = @Created
    INSERT INTO
	[TestEnums]
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
    [TestEnums]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO
/********** End TestEnum **********/
/****** Begin Test ******/

/* Standard Insertion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tests_InsertTest]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[Tests_InsertTest] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[Tests_InsertTest]
(
	@ID [int] OUTPUT,
    @Name [nvarchar](MAX),
    @Description [nvarchar](MAX) NULL,
    @AccountID [bigint],
    @TestEnumID [tinyint],
    @RawHash [binary](200) NULL,
    @Created [datetime],
    @Updated [datetime]
)
AS

SET NOCOUNT ON

INSERT INTO
	[Tests]
(
[Name],
[Description],
[AccountID],
[TestEnumID],
[RawHash],
[Created],
[Updated]
)
VALUES
(
@Name,
@Description,
@AccountID,
@TestEnumID,
@RawHash,
@Created,
@Updated
)

SET @ID = SCOPE_IDENTITY();

SET NOCOUNT OFF

RETURN

GO

/* Standard Update */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tests_UpdateTestByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[Tests_UpdateTestByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[Tests_UpdateTestByID]
(
    @ID [int],
    @Name [nvarchar](MAX),
    @Description [nvarchar](MAX) NULL,
    @AccountID [bigint],
    @TestEnumID [tinyint],
    @RawHash [binary](200) NULL,
    @Created [datetime],
    @Updated [datetime]
)
AS

SET NOCOUNT ON

UPDATE
    [Tests]
SET
[Name] = @Name,
[Description] = @Description,
[AccountID] = @AccountID,
[TestEnumID] = @TestEnumID,
[RawHash] = @RawHash,
[Created] = @Created,
[Updated] = @Updated
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Deletion */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tests_DeleteTestByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[Tests_DeleteTestByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[Tests_DeleteTestByID]
(
    @ID [int]
)
AS

SET NOCOUNT ON

DELETE FROM
    [Tests]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO

/* Standard Get-By-ID */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tests_GetTestByID]') AND type in (N'P', N'PC'))
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[Tests_GetTestByID] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[Tests_GetTestByID]
(
    @ID [int]
)
AS

SET NOCOUNT ON

SELECT
    [ID],
    [Name]
    ,[Description]
    ,[AccountID]
    ,[TestEnumID]
    ,[RawHash]
    ,[Created]
    ,[Updated]
FROM
    [Tests]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tests_GetTestByName]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[Tests_GetTestByName] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Tests_GetTestByName]
(
    @Name [nvarchar](MAX)
)
AS

SET NOCOUNT ON

SELECT
    [ID]
    ,[Name]
    ,[Description]
    ,[AccountID]
    ,[TestEnumID]
    ,[RawHash]
    ,[Created]
    ,[Updated]
FROM
	[Tests]
WHERE
	([Name] = @Name)

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tests_GetTestByAccountIDAndName]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[Tests_GetTestByAccountIDAndName] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Tests_GetTestByAccountIDAndName]
(
    @AccountID [int],
    @Name [nvarchar](MAX)
)
AS

SET NOCOUNT ON

SELECT
    [ID]
    ,[Name]
    ,[Description]
    ,[AccountID]
    ,[TestEnumID]
    ,[RawHash]
    ,[Created]
    ,[Updated]
FROM
	[Tests]
WHERE
	([AccountID] = @AccountID) AND ([Name] = @Name)

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tests_GetAllTestIDs_Paged]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[Tests_GetAllTestIDs_Paged] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Tests_GetAllTestIDs_Paged]
(
    @StartRowIndex [bigint],
    @MaximumRows [bigint]
)
AS

SET NOCOUNT ON

SELECT
    [ID]
FROM
	[Tests]
ORDER BY
    [ID] ASC
OFFSET @StartRowIndex ROWS FETCH NEXT @MaximumRows ROWS ONLY

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tests_GetTestIDsByName_Paged]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[Tests_GetTestIDsByName_Paged] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Tests_GetTestIDsByName_Paged]
(
    @Name [nvarchar](MAX),
    @StartRowIndex [bigint],
    @MaximumRows [bigint]
)
AS

SET NOCOUNT ON

SELECT
    [ID]
FROM
	[Tests]
WHERE
	([Name] = @Name)
ORDER BY
    [ID] ASC
OFFSET @StartRowIndex ROWS FETCH NEXT @MaximumRows ROWS ONLY

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tests_GetTestsByIDs]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[Tests_GetTestsByIDs] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Tests_GetTestsByIDs]
(
    @IDs [dbo].[IntList] READONLY
)
AS

SET NOCOUNT ON

SELECT
    [ID]
    ,[Name]
    ,[Description]
    ,[AccountID]
    ,[TestEnumID]
    ,[RawHash]
    ,[Created]
    ,[Updated]
FROM
	[Tests]
WHERE
	([ID] IN (SELECT [ID] FROM @IDs))

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tests_GetAllTestIDs]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[Tests_GetAllTestIDs] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Tests_GetAllTestIDs]
AS

SET NOCOUNT ON

SELECT
    [ID]
FROM
	[Tests]

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tests_GetTotalNumberOfTests]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[Tests_GetTotalNumberOfTests] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Tests_GetTotalNumberOfTests]
AS

SET NOCOUNT ON

SELECT
    COUNT(*)
FROM
	[Tests]

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tests_GetTotalNumberOfTestsByAccountIDAndName]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[Tests_GetTotalNumberOfTestsByAccountIDAndName] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Tests_GetTotalNumberOfTestsByAccountIDAndName]
(
    @AccountID [int],
    @Name [nvarchar](MAX)
)
AS

SET NOCOUNT ON

SELECT
    COUNT(*)
FROM
	[Tests]
WHERE
	([AccountID] = @AccountID) AND ([Name] = @Name)

SET NOCOUNT OFF

RETURN

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tests_GetOrCreateTest]') AND type in (N'P', N'PC'))
BEGIN
	EXEC('CREATE PROCEDURE [dbo].[Tests_GetOrCreateTest] AS BEGIN SET NOCOUNT ON; END')
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Tests_GetOrCreateTest]
(
    @CreatedNewEntity [bit] OUTPUT,
    @Name [nvarchar](MAX),
    @AccountID [int],
    @TestEnumID [tinyint]
)
AS

SET NOCOUNT ON

DECLARE @ID [int]

SELECT
    @ID = [ID]
FROM
	[Tests]
WHERE
	([Name] = @Name) AND ([AccountID] = @AccountID) AND ([TestEnumID] = @TestEnumID)

IF (@ID IS NULL)
BEGIN
    DECLARE @Created [datetime] = GETDATE()
    DECLARE @Updated [datetime] = @Created
    INSERT INTO
	[Tests]
    (
        [Name],
        [AccountID],
        [TestEnumID],
        [Created], 
        [Updated]
    )
    VALUES
    (
        @Name,
        @AccountID,
        @TestEnumID,
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
    ,[Description]
    ,[AccountID]
    ,[TestEnumID]
    ,[RawHash]
    ,[Created]
    ,[Updated]
FROM
    [Tests]
WHERE
    ([ID] = @ID)

SET NOCOUNT OFF

RETURN

GO
/********** End Test **********/