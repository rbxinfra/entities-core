namespace Roblox.Web.ElevatedActions.DAL;

using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;

using Roblox.Data;
using Roblox.Entities.Mssql;

internal class RoleSetElevatedActionDAL
{
    private const Roblox.MssqlDatabases.RobloxDatabase _Database = global::Roblox.MssqlDatabases.RobloxDatabase.RobloxRoles;

    public int ID { get; set; }
    public int RoleSetID { get; set; }
    public int ElevatedActionID { get; set; }
    public DateTime Created { get; set; }
    public DateTime Updated { get; set; }

    private static RoleSetElevatedActionDAL BuildDAL(IDictionary<string, object> record)
    {
        var dal = new RoleSetElevatedActionDAL();
        dal.ID = (int)record["ID"];
        dal.RoleSetID = (int)record["RoleSetID"];
        dal.ElevatedActionID = (int)record["ElevatedActionID"];
        dal.Created = (DateTime)record["Created"];
        dal.Updated = (DateTime)record["Updated"];

        return dal;
    }

    internal void Delete()
    {
        _Database.Delete("RoleSetElevatedActions_DeleteRoleSetElevatedActionByID", ID);
    }

    internal void Insert()
    {
        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@ID", ID) { Direction = ParameterDirection.Output },
            new SqlParameter("@RoleSetID", RoleSetID),
            new SqlParameter("@ElevatedActionID", ElevatedActionID),
            new SqlParameter("@Created", Created),
            new SqlParameter("@Updated", Updated),
        };

        ID = _Database.Insert<int>("RoleSetElevatedActions_InsertRoleSetElevatedAction", queryParameters);
    }

    internal void Update()
    {
        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@ID", ID),
            new SqlParameter("@RoleSetID", RoleSetID),
            new SqlParameter("@ElevatedActionID", ElevatedActionID),
            new SqlParameter("@Created", Created),
            new SqlParameter("@Updated", Updated),
        };

        _Database.Update("RoleSetElevatedActions_UpdateRoleSetElevatedActionByID", queryParameters);
    }

    internal static RoleSetElevatedActionDAL Get(int id)
    {
        return _Database.Get(
            "RoleSetElevatedActions_GetRoleSetElevatedActionByID",
            id,
            BuildDAL
        );
    }

    public static RoleSetElevatedActionDAL Get(int roleSetID, int elevatedActionID)
    {
        if (roleSetID == default(int)) 
            return null;
        if (elevatedActionID == default(int)) 
            return null;

        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@RoleSetID", roleSetID),
            new SqlParameter("@ElevatedActionID", elevatedActionID),
        };

        return _Database.Lookup(
            "RoleSetElevatedActions_GetRoleSetElevatedActionByRoleSetIDAndElevatedActionID",
            BuildDAL,
            queryParameters
        );
    }

    public static ICollection<int> GetRoleSetElevatedActionIDsByRoleSetID(int roleSetID)
    {
        if (roleSetID == default(int)) 
            throw new ArgumentException("Parameter 'roleSetID' cannot be null, empty or the default value.");

        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@RoleSetID", roleSetID),
        };

        return _Database.GetIDCollection<int>(
            "RoleSetElevatedActions_GetRoleSetElevatedActionIDsByRoleSetID",
            queryParameters
        );
    }
}