namespace Roblox.Platform.Passwords.Entities;

using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;

using Roblox.Data;
using Roblox.Entities.Mssql;

internal class UsersNeedingPasswordResetDAL
{
    private const Roblox.MssqlDatabases.RobloxDatabase _Database = global::Roblox.MssqlDatabases.RobloxDatabase.RobloxUsers;

    public long ID { get; set; }
    public long UserID { get; set; }
    public DateTime Created { get; set; }
    public DateTime? Updated { get; set; }

    private static UsersNeedingPasswordResetDAL BuildDAL(IDictionary<string, object> record)
    {
        var dal = new UsersNeedingPasswordResetDAL();
        dal.ID = (long)record["ID"];
        dal.UserID = (long)record["UserID"];
        dal.Created = (DateTime)record["Created"];
        dal.Updated = record["Updated"] != null ? (DateTime)record["Updated"] : default(DateTime);

        return dal;
    }

    internal void Delete()
    {
        _Database.Delete("UsersNeedingPasswordReset_DeleteUsersNeedingPasswordResetByID", ID);
    }

    internal void Insert()
    {
        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@ID", ID) { Direction = ParameterDirection.Output },
            new SqlParameter("@UserID", UserID),
            new SqlParameter("@Created", Created),
            new SqlParameter("@Updated", Updated == null ? DBNull.Value : (object)Updated),
        };

        ID = _Database.Insert<long>("UsersNeedingPasswordReset_InsertUsersNeedingPasswordReset", queryParameters);
    }

    internal void Update()
    {
        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@ID", ID),
            new SqlParameter("@UserID", UserID),
            new SqlParameter("@Created", Created),
            new SqlParameter("@Updated", Updated == null ? DBNull.Value : (object)Updated),
        };

        _Database.Update("UsersNeedingPasswordReset_UpdateUsersNeedingPasswordResetByID", queryParameters);
    }

    internal static UsersNeedingPasswordResetDAL Get(long id)
    {
        return _Database.Get(
            "UsersNeedingPasswordReset_GetUsersNeedingPasswordResetByID",
            id,
            BuildDAL
        );
    }

    public static ICollection<long> GetUsersNeedingPasswordResetByUserID(long userID)
    {
        if (userID == default(long)) 
            throw new ArgumentException("Parameter 'userID' cannot be null, empty or the default value.");

        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@UserID", userID),
        };

        return _Database.GetIDCollection<long>(
            "UsersNeedingPasswordReset_GetUsersNeedingPasswordResetIDsByUserID",
            queryParameters
        );
    }

    public static ICollection<UsersNeedingPasswordResetDAL> MultiGet(IEnumerable<long> ids)
    {
        return _Database.MultiGet(
            "UsersNeedingPasswordReset_GetUsersNeedingPasswordResetsByIDs",
            ids,
            BuildDAL
        );
    }

    public static EntityHelper.GetOrCreateDALWrapper<UsersNeedingPasswordResetDAL> GetOrCreate(long userID)
    {
        if (userID == default(long)) 
            return null;

        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@CreatedNewEntity", SqlDbType.Bit) { Direction = ParameterDirection.Output },
            new SqlParameter("@UserID", userID),
        };

        return _Database.GetOrCreate(
            "UsersNeedingPasswordReset_GetOrCreateUsersNeedingPasswordReset",
            BuildDAL,
            queryParameters
        );
    }
}