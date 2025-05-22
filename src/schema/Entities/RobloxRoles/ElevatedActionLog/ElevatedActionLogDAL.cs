namespace Roblox.Web.ElevatedActions.DAL;

using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;

using Roblox.Data;
using Roblox.Entities.Mssql;

internal class ElevatedActionLogDAL
{
    private const Roblox.MssqlDatabases.RobloxDatabase _Database = global::Roblox.MssqlDatabases.RobloxDatabase.RobloxRoles;

    public int ID { get; set; }
    public int ElevatedActionID { get; set; }
    public long UserID { get; set; }
    public int RoleSetID { get; set; }
    public string LogData { get; set; }
    public bool Success { get; set; }
    public string IpAddress { get; set; }
    public long BrowserTrackerID { get; set; }
    public DateTime Created { get; set; }
    public DateTime Updated { get; set; }

    private static ElevatedActionLogDAL BuildDAL(IDictionary<string, object> record)
    {
        var dal = new ElevatedActionLogDAL();
        dal.ID = (int)record["ID"];
        dal.ElevatedActionID = (int)record["ElevatedActionID"];
        dal.UserID = (long)record["UserID"];
        dal.RoleSetID = (int)record["RoleSetID"];
        dal.LogData = (string)record["LogData"];
        dal.Success = (bool)record["Success"];
        dal.IpAddress = (string)record["IpAddress"];
        dal.BrowserTrackerID = (long)record["BrowserTrackerID"];
        dal.Created = (DateTime)record["Created"];
        dal.Updated = (DateTime)record["Updated"];

        return dal;
    }

    internal void Delete()
    {
        _Database.Delete("ElevatedActionLogs_DeleteElevatedActionLogByID", ID);
    }

    internal void Insert()
    {
        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@ID", ID) { Direction = ParameterDirection.Output },
            new SqlParameter("@ElevatedActionID", ElevatedActionID),
            new SqlParameter("@UserID", UserID),
            new SqlParameter("@RoleSetID", RoleSetID),
            new SqlParameter("@LogData", LogData),
            new SqlParameter("@Success", Success),
            new SqlParameter("@IpAddress", IpAddress),
            new SqlParameter("@BrowserTrackerID", BrowserTrackerID),
            new SqlParameter("@Created", Created),
            new SqlParameter("@Updated", Updated),
        };

        ID = _Database.Insert<int>("ElevatedActionLogs_InsertElevatedActionLog", queryParameters);
    }

    internal void Update()
    {
        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@ID", ID),
            new SqlParameter("@ElevatedActionID", ElevatedActionID),
            new SqlParameter("@UserID", UserID),
            new SqlParameter("@RoleSetID", RoleSetID),
            new SqlParameter("@LogData", LogData),
            new SqlParameter("@Success", Success),
            new SqlParameter("@IpAddress", IpAddress),
            new SqlParameter("@BrowserTrackerID", BrowserTrackerID),
            new SqlParameter("@Created", Created),
            new SqlParameter("@Updated", Updated),
        };

        _Database.Update("ElevatedActionLogs_UpdateElevatedActionLogByID", queryParameters);
    }

    internal static ElevatedActionLogDAL Get(int id)
    {
        return _Database.Get(
            "ElevatedActionLogs_GetElevatedActionLogByID",
            id,
            BuildDAL
        );
    }
}