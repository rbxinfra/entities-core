namespace Roblox.Platform.Agents.Entities;

using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;

using Roblox.Data;
using Roblox.Entities.Mssql;

internal class AgentTypeDAL
{
    private const Roblox.MssqlDatabases.RobloxDatabase _Database = global::Roblox.MssqlDatabases.RobloxDatabase.RobloxUsers;

    public byte ID { get; set; }
    public string Value { get; set; }
    public DateTime Created { get; set; }
    public DateTime? Updated { get; set; }

    private static AgentTypeDAL BuildDAL(IDictionary<string, object> record)
    {
        var dal = new AgentTypeDAL();
        dal.ID = (byte)record["ID"];
        dal.Value = (string)record["Value"];
        dal.Created = (DateTime)record["Created"];
        dal.Updated = record["Updated"] != null ? (DateTime)record["Updated"] : default(DateTime);

        return dal;
    }

    internal void Delete()
    {
        _Database.Delete("AgentTypes_DeleteAgentTypeByID", ID);
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

        ID = _Database.Insert<byte>("AgentTypes_InsertAgentType", queryParameters);
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

        _Database.Update("AgentTypes_UpdateAgentTypeByID", queryParameters);
    }

    internal static AgentTypeDAL Get(byte id)
    {
        return _Database.Get(
            "AgentTypes_GetAgentTypeByID",
            id,
            BuildDAL
        );
    }

    public static AgentTypeDAL GetByValue(string value)
    {
        if (string.IsNullOrEmpty(value))
            return null;

        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@Value", value),
        };

        return _Database.Lookup(
            "AgentTypes_GetAgentTypeByValue",
            BuildDAL,
            queryParameters
        );
    }

    public static EntityHelper.GetOrCreateDALWrapper<AgentTypeDAL> GetOrCreate(string value)
    {
        if (string.IsNullOrEmpty(value))
            return null;

        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@CreatedNewEntity", SqlDbType.Bit) { Direction = ParameterDirection.Output },
            new SqlParameter("@Value", value),
        };

        return _Database.GetOrCreate(
            "AgentTypes_GetOrCreateAgentType",
            BuildDAL,
            queryParameters
        );
    }
}