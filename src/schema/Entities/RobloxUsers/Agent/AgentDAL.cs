namespace Roblox.Platform.Agents.Entities;

using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;

using Roblox.Data;
using Roblox.Entities.Mssql;

internal class AgentDAL
{
    private const Roblox.MssqlDatabases.RobloxDatabase _Database = global::Roblox.MssqlDatabases.RobloxDatabase.RobloxUsers;

    public long ID { get; set; }
    public byte AgentTypeID { get; set; }
    public long AgentTargetID { get; set; }
    public DateTime Created { get; set; }
    public DateTime? Updated { get; set; }

    private static AgentDAL BuildDAL(IDictionary<string, object> record)
    {
        var dal = new AgentDAL();
        dal.ID = (long)record["ID"];
        dal.AgentTypeID = (byte)record["AgentTypeID"];
        dal.AgentTargetID = (long)record["AgentTargetID"];
        dal.Created = (DateTime)record["Created"];
        dal.Updated = record["Updated"] != null ? (DateTime)record["Updated"] : default(DateTime);

        return dal;
    }

    internal void Delete()
    {
        _Database.Delete("Agents_DeleteAgentByID", ID);
    }

    internal void Insert()
    {
        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@ID", ID) { Direction = ParameterDirection.Output },
            new SqlParameter("@AgentTypeID", AgentTypeID),
            new SqlParameter("@AgentTargetID", AgentTargetID),
            new SqlParameter("@Created", Created),
            new SqlParameter("@Updated", Updated == null ? DBNull.Value : (object)Updated),
        };

        ID = _Database.Insert<long>("Agents_InsertAgent", queryParameters);
    }

    internal void Update()
    {
        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@ID", ID),
            new SqlParameter("@AgentTypeID", AgentTypeID),
            new SqlParameter("@AgentTargetID", AgentTargetID),
            new SqlParameter("@Created", Created),
            new SqlParameter("@Updated", Updated == null ? DBNull.Value : (object)Updated),
        };

        _Database.Update("Agents_UpdateAgentByID", queryParameters);
    }

    internal static AgentDAL Get(long id)
    {
        return _Database.Get(
            "Agents_GetAgentByID",
            id,
            BuildDAL
        );
    }

    public static AgentDAL GetByAgentTypeIDAndAgentTargetID(byte agentTypeID, long agentTargetID)
    {
        if (agentTypeID == default(byte)) 
            return null;
        if (agentTargetID == default(long)) 
            return null;

        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@AgentTypeID", agentTypeID),
            new SqlParameter("@AgentTargetID", agentTargetID),
        };

        return _Database.Lookup(
            "Agents_GetAgentByAgentTypeIDAndAgentTargetID",
            BuildDAL,
            queryParameters
        );
    }
}