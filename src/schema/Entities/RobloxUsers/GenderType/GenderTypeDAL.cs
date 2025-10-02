namespace Roblox.Platform.Membership.Entities;

using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;

using Roblox.Data;
using Roblox.Entities.Mssql;

internal class GenderTypeDAL
{
    private const Roblox.MssqlDatabases.RobloxDatabase _Database = global::Roblox.MssqlDatabases.RobloxDatabase.RobloxUsers;

    public byte ID { get; set; }
    public string Value { get; set; }
    public DateTime Created { get; set; }
    public DateTime? Updated { get; set; }

    private static GenderTypeDAL BuildDAL(IDictionary<string, object> record)
    {
        var dal = new GenderTypeDAL();
        dal.ID = (byte)record["ID"];
        dal.Value = (string)record["Value"];
        dal.Created = (DateTime)record["Created"];
        dal.Updated = record["Updated"] != null ? (DateTime)record["Updated"] : default(DateTime);

        return dal;
    }

    internal void Delete()
    {
        _Database.Delete("GenderTypes_DeleteGenderTypeByID", ID);
    }

    internal void Insert()
    {
        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@ID", ID) { Direction = ParameterDirection.Output },
            new SqlParameter("@Value", Value),
            new SqlParameter("@Created", Created),
            new SqlParameter("@Updated", Updated == null ? DBNull.Value : (object)Updated),
        };

        ID = _Database.Insert<byte>("GenderTypes_InsertGenderType", queryParameters);
    }

    internal void Update()
    {
        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@ID", ID),
            new SqlParameter("@Value", Value),
            new SqlParameter("@Created", Created),
            new SqlParameter("@Updated", Updated == null ? DBNull.Value : (object)Updated),
        };

        _Database.Update("GenderTypes_UpdateGenderTypeByID", queryParameters);
    }

    internal static GenderTypeDAL Get(byte id)
    {
        return _Database.Get(
            "GenderTypes_GetGenderTypeByID",
            id,
            BuildDAL
        );
    }

    public static GenderTypeDAL GetByValue(string value)
    {
        if (string.IsNullOrEmpty(value))
            return null;

        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@Value", value),
        };

        return _Database.Lookup(
            "GenderTypes_GetGenderTypeByValue",
            BuildDAL,
            queryParameters
        );
    }

    public static EntityHelper.GetOrCreateDALWrapper<GenderTypeDAL> GetOrCreate(string value)
    {
        if (string.IsNullOrEmpty(value))
            return null;

        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@CreatedNewEntity", SqlDbType.Bit) { Direction = ParameterDirection.Output },
            new SqlParameter("@Value", value),
        };

        return _Database.GetOrCreate(
            "GenderTypes_GetOrCreateGenderType",
            BuildDAL,
            queryParameters
        );
    }
}