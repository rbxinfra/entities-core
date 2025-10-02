namespace Roblox.Api.ControlPlane;

using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;

using Roblox.Data;
using Roblox.Entities.Mssql;

internal class AuthorizationTypeDAL
{
    private const Roblox.MssqlDatabases.RobloxDatabase _Database = global::Roblox.MssqlDatabases.RobloxDatabase.RobloxServices;

    public byte ID { get; set; }
    public string Value { get; set; }
    public DateTime Created { get; set; }
    public DateTime? Updated { get; set; }

    private static AuthorizationTypeDAL BuildDAL(IDictionary<string, object> record)
    {
        var dal = new AuthorizationTypeDAL();
        dal.ID = (byte)record["ID"];
        dal.Value = (string)record["Value"];
        dal.Created = (DateTime)record["Created"];
        dal.Updated = record["Updated"] != null ? (DateTime)record["Updated"] : default(DateTime);

        return dal;
    }

    internal void Delete()
    {
        _Database.Delete("AuthorizationTypes_DeleteAuthorizationTypeByID", ID);
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

        ID = _Database.Insert<byte>("AuthorizationTypes_InsertAuthorizationType", queryParameters);
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

        _Database.Update("AuthorizationTypes_UpdateAuthorizationTypeByID", queryParameters);
    }

    internal static AuthorizationTypeDAL Get(byte id)
    {
        return _Database.Get(
            "AuthorizationTypes_GetAuthorizationTypeByID",
            id,
            BuildDAL
        );
    }

    public static AuthorizationTypeDAL GetByValue(string value)
    {
        if (string.IsNullOrEmpty(value))
            return null;

        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@Value", value),
        };

        return _Database.Lookup(
            "AuthorizationTypes_GetAuthorizationTypeByValue",
            BuildDAL,
            queryParameters
        );
    }
}