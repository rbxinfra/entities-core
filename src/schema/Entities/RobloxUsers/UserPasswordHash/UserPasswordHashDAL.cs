namespace Roblox.Platform.Passwords.Entities;

using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;

using Roblox.Data;
using Roblox.Entities.Mssql;

internal class UserPasswordHashDAL
{
    private const Roblox.MssqlDatabases.RobloxDatabase _Database = global::Roblox.MssqlDatabases.RobloxDatabase.RobloxUsers;

    public long ID { get; set; }
    public long UserID { get; set; }
    public bool IsValid { get; set; }
    public string Hash { get; set; }
    public DateTime Created { get; set; }
    public DateTime? Updated { get; set; }

    private static UserPasswordHashDAL BuildDAL(IDictionary<string, object> record)
    {
        var dal = new UserPasswordHashDAL();
        dal.ID = (long)record["ID"];
        dal.UserID = (long)record["UserID"];
        dal.IsValid = (bool)record["IsValid"];
        dal.Hash = (string)record["Hash"];
        dal.Created = (DateTime)record["Created"];
        dal.Updated = record["Updated"] != null ? (DateTime)record["Updated"] : default(DateTime);

        return dal;
    }

    internal void Delete()
    {
        _Database.Delete("UserPasswordHashes_DeleteUserPasswordHashByID", ID);
    }

    internal void Insert()
    {
        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@ID", ID) { Direction = ParameterDirection.Output },
            new SqlParameter("@UserID", UserID),
            new SqlParameter("@IsValid", IsValid),
            new SqlParameter("@Hash", Hash),
            new SqlParameter("@Created", Created),
            new SqlParameter("@Updated", Updated == null ? DBNull.Value : (object)Updated),
        };

        ID = _Database.Insert<long>("UserPasswordHashes_InsertUserPasswordHash", queryParameters);
    }

    internal void Update()
    {
        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@ID", ID),
            new SqlParameter("@UserID", UserID),
            new SqlParameter("@IsValid", IsValid),
            new SqlParameter("@Hash", Hash),
            new SqlParameter("@Created", Created),
            new SqlParameter("@Updated", Updated == null ? DBNull.Value : (object)Updated),
        };

        _Database.Update("UserPasswordHashes_UpdateUserPasswordHashByID", queryParameters);
    }

    internal static UserPasswordHashDAL Get(long id)
    {
        return _Database.Get(
            "UserPasswordHashes_GetUserPasswordHashByID",
            id,
            BuildDAL
        );
    }

    public static int GetTotalNumberOfValidUserPasswordHashesByUserID(long userID)
    {
        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@UserID", userID),
        };

        return _Database.GetCount<int>(
            "UserPasswordHashes_GetTotalNumberOfValidUserPasswordHashesByUserID",
            queryParameters: queryParameters
        );
    }

    public static ICollection<long> GetValidUserPasswordHashIDsByUserIDPaged(long userID, long startRowIndex, long maximumRows)
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
            "UserPasswordHashes_GetValidUserPasswordHashIDsByUserID_Paged",
            queryParameters
        );
    }
}