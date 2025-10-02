namespace Roblox;

using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;

using Roblox.Data;
using Roblox.Entities.Mssql;

internal class TestEnumDAL
{
    private const Roblox.MssqlDatabases.RobloxDatabase _Database = global::Roblox.MssqlDatabases.RobloxDatabase.TestDatabase;

    public byte ID { get; set; }
    public string Value { get; set; }
    public DateTime Created { get; set; }
    public DateTime Updated { get; set; }

    private static TestEnumDAL BuildDAL(IDictionary<string, object> record)
    {
        var dal = new TestEnumDAL();
        dal.ID = (byte)record["ID"];
        dal.Value = (string)record["Value"];
        dal.Created = (DateTime)record["Created"];
        dal.Updated = (DateTime)record["Updated"];

        return dal;
    }

    internal void Delete()
    {
        _Database.Delete("TestEnums_DeleteTestEnumByID", ID);
    }

    internal void Insert()
    {
        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@ID", ID) { Direction = ParameterDirection.Output },
            new SqlParameter("@Value", Value),
            new SqlParameter("@Created", Created),
            new SqlParameter("@Updated", Updated),
        };

        ID = _Database.Insert<byte>("TestEnums_InsertTestEnum", queryParameters);
    }

    internal void Update()
    {
        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@ID", ID),
            new SqlParameter("@Value", Value),
            new SqlParameter("@Created", Created),
            new SqlParameter("@Updated", Updated),
        };

        _Database.Update("TestEnums_UpdateTestEnumByID", queryParameters);
    }

    internal static TestEnumDAL Get(byte id)
    {
        return _Database.Get(
            "TestEnums_GetTestEnumByID",
            id,
            BuildDAL
        );
    }

    public static TestEnumDAL GetByValue(string value)
    {
        if (string.IsNullOrEmpty(value))
            return null;

        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@Value", value),
        };

        return _Database.Lookup(
            "TestEnums_GetTestEnumByValue",
            BuildDAL,
            queryParameters
        );
    }

    public static EntityHelper.GetOrCreateDALWrapper<TestEnumDAL> GetOrCreateTestEnum(string value)
    {
        if (string.IsNullOrEmpty(value))
            return null;

        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@CreatedNewEntity", SqlDbType.Bit) { Direction = ParameterDirection.Output },
            new SqlParameter("@Value", value),
        };

        return _Database.GetOrCreate(
            "TestEnums_GetOrCreateTestEnum",
            BuildDAL,
            queryParameters
        );
    }
}