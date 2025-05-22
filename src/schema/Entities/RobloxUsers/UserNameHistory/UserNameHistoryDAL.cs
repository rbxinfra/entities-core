namespace Roblox.Platform.Membership.Entities;

using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;

using Roblox.Data;
using Roblox.Entities.Mssql;

internal class UserNameHistoryDAL
{
    private const Roblox.MssqlDatabases.RobloxDatabase _Database = global::Roblox.MssqlDatabases.RobloxDatabase.RobloxUsers;

    public long ID { get; set; }
    public long UserID { get; set; }
    public string Name { get; set; }
    public DateTime Created { get; set; }
    public DateTime? Updated { get; set; }

    private static UserNameHistoryDAL BuildDAL(IDictionary<string, object> record)
    {
        var dal = new UserNameHistoryDAL();
        dal.ID = (long)record["ID"];
        dal.UserID = (long)record["UserID"];
        dal.Name = (string)record["Name"];
        dal.Created = (DateTime)record["Created"];
        dal.Updated = record["Updated"] != null ? (DateTime)record["Updated"] : default(DateTime);

        return dal;
    }

    internal void Delete()
    {
        _Database.Delete("UserNameHistory_DeleteUserNameHistoryByID", ID);
    }

    internal void Insert()
    {
        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@ID", ID) { Direction = ParameterDirection.Output },
            new SqlParameter("@UserID", UserID),
            new SqlParameter("@Name", Name),
            new SqlParameter("@Created", Created),
            new SqlParameter("@Updated", Updated == null ? DBNull.Value : (object)Updated),
        };

        ID = _Database.Insert<long>("UserNameHistory_InsertUserNameHistory", queryParameters);
    }

    internal void Update()
    {
        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@ID", ID),
            new SqlParameter("@UserID", UserID),
            new SqlParameter("@Name", Name),
            new SqlParameter("@Created", Created),
            new SqlParameter("@Updated", Updated == null ? DBNull.Value : (object)Updated),
        };

        _Database.Update("UserNameHistory_UpdateUserNameHistoryByID", queryParameters);
    }

    internal static UserNameHistoryDAL Get(long id)
    {
        return _Database.Get(
            "UserNameHistory_GetUserNameHistoryByID",
            id,
            BuildDAL
        );
    }

    public static ICollection<long> GetUserNameHistoryIDsByUserIDPaged(long userID, long startRowIndex, long maximumRows)
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
            "UserNameHistory_GetUserNameHistoryIDsByUserID_Paged",
            queryParameters
        );
    }

    public static int GetTotalNumberOfUserNameHistoryByUserID(long userID)
    {
        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@UserID", userID),
        };

        return _Database.GetCount<int>(
            "UserNameHistory_GetTotalNumberOfUserNameHistorysByUserID",
            queryParameters: queryParameters
        );
    }

    public static ICollection<long> GetUserNameHistoryIDsByNamePaged(string name, long startRowIndex, long maximumRows)
    {
        if (string.IsNullOrEmpty(name))
            throw new ArgumentException("Parameter 'name' cannot be null, empty or the default value.");
        if (startRowIndex < 1)
            throw new ApplicationException("Required value not specified: StartRowIndex.");
        if (maximumRows < 1)
            throw new ApplicationException("Required value not specified: MaximumRows.");

        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@Name", name),
            new SqlParameter("@StartRowIndex", startRowIndex),
            new SqlParameter("@MaximumRows", maximumRows)
        };

        return _Database.GetIDCollection<long>(
            "UserNameHistory_GetUserNameHistoryIDsByName_Paged",
            queryParameters
        );
    }

    public static int GetTotalNumberOfUserNameHistoryByName(string name)
    {
        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@Name", name),
        };

        return _Database.GetCount<int>(
            "UserNameHistory_GetTotalNumberOfUserNameHistorysByName",
            queryParameters: queryParameters
        );
    }
}