namespace Roblox.Platform.Email.User.Entities;

using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;

using Roblox.Data;
using Roblox.Entities.Mssql;

internal class UserEmailAddressDAL
{
    private const Roblox.MssqlDatabases.RobloxDatabase _Database = global::Roblox.MssqlDatabases.RobloxDatabase.RobloxEmailAddresses;

    public long ID { get; set; }
    public long UserID { get; set; }
    public int EmailAddressID { get; set; }
    public bool IsVerified { get; set; }
    public bool IsValid { get; set; }
    public bool Newsletter { get; set; }
    public DateTime Created { get; set; }
    public DateTime? Updated { get; set; }

    private static UserEmailAddressDAL BuildDAL(IDictionary<string, object> record)
    {
        var dal = new UserEmailAddressDAL();
        dal.ID = (long)record["ID"];
        dal.UserID = (long)record["UserID"];
        dal.EmailAddressID = (int)record["EmailAddressID"];
        dal.IsVerified = (bool)record["IsVerified"];
        dal.IsValid = (bool)record["IsValid"];
        dal.Newsletter = (bool)record["Newsletter"];
        dal.Created = (DateTime)record["Created"];
        dal.Updated = record["Updated"] != null ? (DateTime)record["Updated"] : default(DateTime);

        return dal;
    }

    internal void Delete()
    {
        _Database.Delete("UserEmailAddresses_DeleteUserEmailAddressByID", ID);
    }

    internal void Insert()
    {
        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@ID", ID) { Direction = ParameterDirection.Output },
            new SqlParameter("@UserID", UserID),
            new SqlParameter("@EmailAddressID", EmailAddressID),
            new SqlParameter("@IsVerified", IsVerified),
            new SqlParameter("@IsValid", IsValid),
            new SqlParameter("@Newsletter", Newsletter),
            new SqlParameter("@Created", Created),
            new SqlParameter("@Updated", Updated == null ? DBNull.Value : (object)Updated),
        };

        ID = _Database.Insert<long>("UserEmailAddresses_InsertUserEmailAddress", queryParameters);
    }

    internal void Update()
    {
        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@ID", ID),
            new SqlParameter("@UserID", UserID),
            new SqlParameter("@EmailAddressID", EmailAddressID),
            new SqlParameter("@IsVerified", IsVerified),
            new SqlParameter("@IsValid", IsValid),
            new SqlParameter("@Newsletter", Newsletter),
            new SqlParameter("@Created", Created),
            new SqlParameter("@Updated", Updated == null ? DBNull.Value : (object)Updated),
        };

        _Database.Update("UserEmailAddresses_UpdateUserEmailAddressByID", queryParameters);
    }

    internal static UserEmailAddressDAL Get(long id)
    {
        return _Database.Get(
            "UserEmailAddresses_GetUserEmailAddressByID",
            id,
            BuildDAL
        );
    }

    public static int GetTotalNumberOfValidUserEmailAddresses(long userID)
    {
        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@UserID", userID),
        };

        return _Database.GetCount<int>(
            "UserEmailAddresses_GetTotalNumberOfValidUserEmailAddressesByUserID",
            queryParameters: queryParameters
        );
    }

    public static int GetTotalNumberOfUsersByValidEmailAddressID(int emailAddressID)
    {
        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@EmailAddressID", emailAddressID),
        };

        return _Database.GetCount<int>(
            "UserEmailAddresses_GetTotalNumberOfUsersByValidEmailAddressID",
            queryParameters: queryParameters
        );
    }

    public static ICollection<long> GetValidUserEmailAddressIDs(int emailAddressID)
    {
        if (emailAddressID == default(int)) 
            throw new ArgumentException("Parameter 'emailAddressID' cannot be null, empty or the default value.");

        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@EmailAddressID", emailAddressID),
        };

        return _Database.GetIDCollection<long>(
            "UserEmailAddresses_GetValidUserEmailAddressIDsByEmailAddressID",
            queryParameters
        );
    }

    public static ICollection<long> GetValidUserEmailAddressIDsPaged(long userID, long startRowIndex, long maximumRows)
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
            "UserEmailAddresses_GetValidUserEmailAddressIDsByUserID_Paged",
            queryParameters
        );
    }

    public static ICollection<long> GetValidUserEmailAddressIDsByIsVerifiedPaged(long userID, bool isVerified, long startRowIndex, long maximumRows)
    {
        if (userID == default(long)) 
            throw new ArgumentException("Parameter 'userID' cannot be null, empty or the default value.");
        if (isVerified == default(bool)) 
            throw new ArgumentException("Parameter 'isVerified' cannot be null, empty or the default value.");
        if (startRowIndex < 1)
            throw new ApplicationException("Required value not specified: StartRowIndex.");
        if (maximumRows < 1)
            throw new ApplicationException("Required value not specified: MaximumRows.");

        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@UserID", userID),
            new SqlParameter("@IsVerified", isVerified),
            new SqlParameter("@StartRowIndex", startRowIndex),
            new SqlParameter("@MaximumRows", maximumRows)
        };

        return _Database.GetIDCollection<long>(
            "UserEmailAddresses_GetValidUserEmailAddressIDsByUserIDAndIsVerified_Paged",
            queryParameters
        );
    }

    public static ICollection<long> GetUserEmailAddressIDsPaged(long userID, long startRowIndex, long maximumRows)
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
            "UserEmailAddresses_GetUserEmailAddressIDsByUserID_Paged",
            queryParameters
        );
    }

    public static int GetTotalNumberOfUserEmailAddressIDsByEmailAddressID(int emailAddressID)
    {
        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@EmailAddressID", emailAddressID),
        };

        return _Database.GetCount<int>(
            "UserEmailAddresses_GetTotalNumberOfUserEmailAddresssByEmailAddressID",
            queryParameters: queryParameters
        );
    }

    public static ICollection<UserEmailAddressDAL> MultiGet(IEnumerable<long> ids)
    {
        return _Database.MultiGet(
            "UserEmailAddresses_GetUserEmailAddresssByIDs",
            ids,
            BuildDAL
        );
    }
}