namespace Roblox.Platform.Membership.Entities;

using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;

using Roblox.Data;
using Roblox.Entities.Mssql;

internal class DisplayNameHistoryDAL
{
    private const Roblox.MssqlDatabases.RobloxDatabase _Database = global::Roblox.MssqlDatabases.RobloxDatabase.RobloxUsers;

    public long ID { get; set; }
    public long UserID { get; set; }
    public long DisplayNameID { get; set; }
    public DateTime Created { get; set; }
    public DateTime? Updated { get; set; }

    private static DisplayNameHistoryDAL BuildDAL(IDictionary<string, object> record)
    {
        var dal = new DisplayNameHistoryDAL();
        dal.ID = (long)record["ID"];
        dal.UserID = (long)record["UserID"];
        dal.DisplayNameID = (long)record["DisplayNameID"];
        dal.Created = (DateTime)record["Created"];
        dal.Updated = record["Updated"] != null ? (DateTime)record["Updated"] : default(DateTime);

        return dal;
    }

    internal void Delete()
    {
        _Database.Delete("DisplayNameHistory_DeleteDisplayNameHistoryByID", ID);
    }

    internal void Insert()
    {
        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@ID", ID) { Direction = ParameterDirection.Output },
            new SqlParameter("@UserID", UserID),
            new SqlParameter("@DisplayNameID", DisplayNameID),
            new SqlParameter("@Created", Created),
            new SqlParameter("@Updated", Updated == null ? DBNull.Value : (object)Updated),
        };

        ID = _Database.Insert<long>("DisplayNameHistory_InsertDisplayNameHistory", queryParameters);
    }

    internal void Update()
    {
        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@ID", ID),
            new SqlParameter("@UserID", UserID),
            new SqlParameter("@DisplayNameID", DisplayNameID),
            new SqlParameter("@Created", Created),
            new SqlParameter("@Updated", Updated == null ? DBNull.Value : (object)Updated),
        };

        _Database.Update("DisplayNameHistory_UpdateDisplayNameHistoryByID", queryParameters);
    }

    internal static DisplayNameHistoryDAL Get(long id)
    {
        return _Database.Get(
            "DisplayNameHistory_GetDisplayNameHistoryByID",
            id,
            BuildDAL
        );
    }

    public static ICollection<long> GetDisplayNameHistoryIDsByUserIDPaged(long userID, long startRowIndex, long maximumRows)
    {
        if (userID == default(long)) 
            throw new ArgumentException("Parameter 'userID' cannot be null, empty or the default value.");
        if (startRowIndex < 1)
            throw new ApplicationException("Required value not specified: StartRowIndex.");
        if (maximumRows < 1)
            throw new ApplicationException("Required value not specified: MaximumRows.");

        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@UserID", userID),
            new SqlParameter("@StartRowIndex", startRowIndex),
            new SqlParameter("@MaximumRows", maximumRows)
        };

        return _Database.GetIDCollection<long>(
            "DisplayNameHistory_GetDisplayNameHistoryIDsByUserID_Paged",
            queryParameters
        );
    }

    public static int GetTotalNumberOfDisplayNameHistoryByUserID(long userID)
    {
        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@UserID", userID),
        };

        return _Database.GetCount<int>(
            "DisplayNameHistory_GetTotalNumberOfDisplayNameHistorysByUserID",
            queryParameters: queryParameters
        );
    }

    public static ICollection<long> GetDisplayNameHistoryIDsByDisplayNameIDPaged(long displayNameID, long startRowIndex, long maximumRows)
    {
        if (displayNameID == default(long)) 
            throw new ArgumentException("Parameter 'displayNameID' cannot be null, empty or the default value.");
        if (startRowIndex < 1)
            throw new ApplicationException("Required value not specified: StartRowIndex.");
        if (maximumRows < 1)
            throw new ApplicationException("Required value not specified: MaximumRows.");

        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@DisplayNameID", displayNameID),
            new SqlParameter("@StartRowIndex", startRowIndex),
            new SqlParameter("@MaximumRows", maximumRows)
        };

        return _Database.GetIDCollection<long>(
            "DisplayNameHistory_GetDisplayNameHistoryIDsByDisplayNameID_Paged",
            queryParameters
        );
    }

    public static int GetTotalNumberOfDisplayNameHistoryByDisplayNameID(long displayNameID)
    {
        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@DisplayNameID", displayNameID),
        };

        return _Database.GetCount<int>(
            "DisplayNameHistory_GetTotalNumberOfDisplayNameHistorysByDisplayNameID",
            queryParameters: queryParameters
        );
    }
}