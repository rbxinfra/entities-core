namespace Roblox.Mssql.Tests.DAL;

using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;

using Roblox.Data;
using Roblox.MssqlDatabases;

[Serializable]
internal class TestDAL
{
    private int _ID = default(int);
    private string _Name = string.Empty;
    private string _Description = string.Empty;
    private long _AccountID = default(long);
    private byte _TestEnumID = default(byte);
    private byte[]? _RawHash = null;
    private DateTime _Created = default(DateTime);
    private DateTime _Updated = default(DateTime);

    public int ID
    {
        get { return _ID; }
        set { _ID = value; }
    }

    public string Name
    {
        get { return _Name; }
        set { _Name = value; }
    }

    public string Description
    {
        get { return _Description; }
        set { _Description = value; }
    }

    public long AccountID
    {
        get { return _AccountID; }
        set { _AccountID = value; }
    }

    public byte TestEnumID
    {
        get { return _TestEnumID; }
        set { _TestEnumID = value; }
    }

    public byte[]? RawHash
    {
        get { return _RawHash; }
        set { _RawHash = value; }
    }

    public DateTime Created
    {
        get { return _Created; }
        set { _Created = value; }
    }

    public DateTime Updated
    {
        get { return _Updated; }
        set { _Updated = value; }
    }


    private static string ConnectionString
    {
        get { return global::Roblox.MssqlDatabases.RobloxDatabase.TestDatabase.GetConnectionString(); }
    }

    internal void Delete()
    {
        if (_ID == default(int))
            throw new ApplicationException("Required value not specified: ID.");

        var queryParameters = new List<SqlParameter>();
        queryParameters.Add(new SqlParameter("@ID", _ID));

        var dbInfo = new DbInfo(
            ConnectionString, 
            "[dbo].[Tests_DeleteTestByID]", 
            queryParameters
        );

        EntityHelper.DoEntityDALDelete(dbInfo);
    }

    public TestDAL() { }

    internal void Insert()
    {
        if (string.IsNullOrEmpty(_Name))
            throw new ApplicationException("Required value not specified: Name.");
        if (_AccountID == default(long))
            throw new ApplicationException("Required value not specified: AccountID.");
        if (_TestEnumID == default(byte))
            throw new ApplicationException("Required value not specified: TestEnumID.");
        if (_Created == default(DateTime))
            throw new ApplicationException("Required value not specified: Created.");
        if (_Updated == default(DateTime))
            throw new ApplicationException("Required value not specified: Updated.");

        var queryParameters = new List<SqlParameter>();
        queryParameters.Add(new SqlParameter("@Name", _Name));
        queryParameters.Add(new SqlParameter("@Description", _Description));
        queryParameters.Add(new SqlParameter("@AccountID", _AccountID));
        queryParameters.Add(new SqlParameter("@TestEnumID", _TestEnumID));
        queryParameters.Add(new SqlParameter("@RawHash", _RawHash == null ? DBNull.Value : (object)_RawHash));
        queryParameters.Add(new SqlParameter("@Created", _Created));
        queryParameters.Add(new SqlParameter("@Updated", _Updated));

        if (!string.IsNullOrEmpty(_Description))
            queryParameters.Add(new SqlParameter("@Description", _Description));
        else
            queryParameters.Add(new SqlParameter("@Description", DBNull.Value));

        var dbInfo = new DbInfo(
            ConnectionString,
            "[dbo].[Tests_InsertTest]",
            new SqlParameter("@ID", SqlDbType.Int),
            queryParameters
        );

        _ID = EntityHelper.DoEntityDALInsert<int>(dbInfo);
    }

    internal void Update()
    {
        if (_ID == default(int))
            throw new ApplicationException("Required value not specified: ID.");
        if (string.IsNullOrEmpty(_Name))
            throw new ApplicationException("Required value not specified: Name.");
        if (_AccountID == default(long))
            throw new ApplicationException("Required value not specified: AccountID.");
        if (_TestEnumID == default(byte))
            throw new ApplicationException("Required value not specified: TestEnumID.");
        if (_Created == default(DateTime))
            throw new ApplicationException("Required value not specified: Created.");
        if (_Updated == default(DateTime))
            throw new ApplicationException("Required value not specified: Updated.");

        var queryParameters = new List<SqlParameter>();
        queryParameters.Add(new SqlParameter("@ID", _ID));
        queryParameters.Add(new SqlParameter("@Name", _Name));
        queryParameters.Add(new SqlParameter("@Description", _Description));
        queryParameters.Add(new SqlParameter("@AccountID", _AccountID));
        queryParameters.Add(new SqlParameter("@TestEnumID", _TestEnumID));
        queryParameters.Add(new SqlParameter("@RawHash", _RawHash == null ? DBNull.Value : (object)_RawHash));
        queryParameters.Add(new SqlParameter("@Created", _Created));
        queryParameters.Add(new SqlParameter("@Updated", _Updated));

        if (!string.IsNullOrEmpty(_Description))
            queryParameters.Add(new SqlParameter("@Description", _Description));
        else
            queryParameters.Add(new SqlParameter("@Description", DBNull.Value));

        var dbInfo = new DbInfo(
            ConnectionString,
            "[dbo].[Tests_UpdateTestByID]",
            queryParameters
        );

        EntityHelper.DoEntityDALUpdate(dbInfo);
    }

    private static TestDAL BuildDAL(SqlDataReader reader)
    {
        var dal = new TestDAL();

        while (reader.Read())
        {
            dal.ID = (int)reader["ID"];
            dal.Name = (string)reader["Name"];
            dal.Description = reader["Description"].Equals(DBNull.Value) ? null : (string)reader["Description"];
            dal.AccountID = (long)reader["AccountID"];
            dal.TestEnumID = (byte)reader["TestEnumID"];
            dal.RawHash = reader["RawHash"].Equals(DBNull.Value) ? null : (byte[])reader["RawHash"];
            dal.Created = (DateTime)reader["Created"];
            dal.Updated = (DateTime)reader["Updated"];
        }

        if (dal.ID == default(int))
            return null;

        return dal;
    }

    internal static TestDAL Get(int id)
    {
        if (id == default(int))
            return null;

        var queryParameters = new List<SqlParameter>();
        queryParameters.Add(new SqlParameter("@ID", id));
        var dbInfo = new DbInfo(
            ConnectionString,
            "[dbo].[Tests_GetTestByID]",
            queryParameters
        );

        return EntityHelper.GetEntityDAL(dbInfo, BuildDAL);
    }


    public static TestDAL GetByName(string name)
    {
        if (string.IsNullOrEmpty(name))
            return null;

        var queryParameters = new List<SqlParameter>();
        queryParameters.Add(new SqlParameter("@Name", name));

        var dbInfo = new DbInfo(
            ConnectionString,
            "[dbo].[Tests_GetTestByName]",
            queryParameters
        );

        return EntityHelper.GetEntityDAL(
            dbInfo,
            BuildDAL
        );
    }

    public static TestDAL GetByAccountIDAndName(int accountID, string name)
    {
        if (accountID == default(int)) 
            return null;
        if (string.IsNullOrEmpty(name))
            return null;

        var queryParameters = new List<SqlParameter>();
        queryParameters.Add(new SqlParameter("@AccountID", accountID));
        queryParameters.Add(new SqlParameter("@Name", name));

        var dbInfo = new DbInfo(
            ConnectionString,
            "[dbo].[Tests_GetTestByAccountIDAndName]",
            queryParameters
        );

        return EntityHelper.GetEntityDAL(
            dbInfo,
            BuildDAL
        );
    }

    public static ICollection<int> GetAllPaged(long startRowIndex, long maximumRows)
    {
        var queryParameters = new List<SqlParameter>();
        queryParameters.Add(new SqlParameter("@StartRowIndex", startRowIndex));
        queryParameters.Add(new SqlParameter("@MaximumRows", maximumRows));

        return EntityHelper.GetDataEntityIDCollection<int>(
            new DbInfo(
                ConnectionString,
                "[dbo].[Tests_GetAllTestIDs_Paged]",
                queryParameters
            )
        );
    }

    public static ICollection<int> GetByNamePaged(string name, long startRowIndex, long maximumRows)
    {
        var queryParameters = new List<SqlParameter>();
        queryParameters.Add(new SqlParameter("@Name", name));
        queryParameters.Add(new SqlParameter("@StartRowIndex", startRowIndex));
        queryParameters.Add(new SqlParameter("@MaximumRows", maximumRows));

        return EntityHelper.GetDataEntityIDCollection<int>(
            new DbInfo(
                ConnectionString,
                "[dbo].[Tests_GetTestIDsByName_Paged]",
                queryParameters
            )
        );
    }

    public static ICollection<TestDAL> MultiGet(ICollection<int> ids)
    {
        var dbInfo = new DbInfo(
            ConnectionString,
            "[dbo].[Tests_GetTestsByIDs]"
        );

        return EntityHelper.GetEntityDALCollection<TestDAL, int>(
            dbInfo,
            ids,
            BuildDALCollection
        );
    }

    private static List<TestDAL> BuildDALCollection(SqlDataReader reader)
    {
        var dals = new List<TestDAL>();

        while (reader.Read())
        {
            var dal = new TestDAL();
            dal.ID = (int)reader["ID"];
            dal.Name = (string)reader["Name"];
            dal.Description = reader["Description"].Equals(DBNull.Value) ? null : (string)reader["Description"];
            dal.AccountID = (long)reader["AccountID"];
            dal.TestEnumID = (byte)reader["TestEnumID"];
            dal.RawHash = reader["RawHash"].Equals(DBNull.Value) ? null : (byte[])reader["RawHash"];
            dal.Created = (DateTime)reader["Created"];
            dal.Updated = (DateTime)reader["Updated"];

            dals.Add(dal);
        }

        return dals;
    }

    public static ICollection<int> GetAll()
    {
        return EntityHelper.GetDataEntityIDCollection<int>(
            new DbInfo(
                ConnectionString,
                "[dbo].[Tests_GetAllTestIDs]"
            )
        );
    }

    public static int GetTotalNumberOfTests()
    {
        var dbInfo = new DbInfo(
            ConnectionString,
            "[dbo].[Tests_GetTotalNumberOfTests]"
        );

        return EntityHelper.GetDataCount<int>(dbInfo);
    }

    public static int GetTotalNumberOfTestsByAccountIDAndName(int accountID, string name)
    {
        var queryParameters = new List<SqlParameter>();
        queryParameters.Add(new SqlParameter("@AccountID", accountID));
        queryParameters.Add(new SqlParameter("@Name", name));

        var dbInfo = new DbInfo(
            ConnectionString,
            "[dbo].[Tests_GetTotalNumberOfTestsByAccountIDAndName]"
            ,
            queryParameters
        );

        return EntityHelper.GetDataCount<int>(dbInfo);
    }

    public static EntityHelper.GetOrCreateDALWrapper<TestDAL> GetOrCreate(string name, int accountID, byte testEnumID)
    {
        if (string.IsNullOrEmpty(name))
            throw new ApplicationException("Required value not specified: Name.");
        if (accountID == default(int)) 
            throw new ApplicationException("Required value not specified: AccountID.");
        if (testEnumID == default(byte)) 
            throw new ApplicationException("Required value not specified: TestEnumID.");

        var queryParameters = new List<SqlParameter>();
        queryParameters.Add(new SqlParameter("@Name", name));
        queryParameters.Add(new SqlParameter("@AccountID", accountID));
        queryParameters.Add(new SqlParameter("@TestEnumID", testEnumID));

        var dbInfo = new DbInfo(
            ConnectionString,
            "[dbo].[Tests_GetOrCreateTest]",
            queryParameters
        );

        return EntityHelper.GetOrCreateEntityDAL(
            dbInfo,
            BuildDAL
        );
    }
}