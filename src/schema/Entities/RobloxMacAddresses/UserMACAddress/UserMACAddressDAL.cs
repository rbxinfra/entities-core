namespace Roblox.Platform.IpAddresses.Entities;

using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;

using Roblox.Data;
using Roblox.Entities.Mssql;

internal class UserMACAddressDAL
{
    private const Roblox.MssqlDatabases.RobloxDatabase _Database = global::Roblox.MssqlDatabases.RobloxDatabase.RobloxMacAddresses;

    public long ID { get; set; }
    public long UserID { get; set; }
    public long MACAddressID { get; set; }
    public DateTime Created { get; set; }

    private static UserMACAddressDAL BuildDAL(IDictionary<string, object> record)
    {
        var dal = new UserMACAddressDAL();
        dal.ID = (long)record["ID"];
        dal.UserID = (long)record["UserID"];
        dal.MACAddressID = (long)record["MACAddressID"];
        dal.Created = (DateTime)record["Created"];

        return dal;
    }

    internal void Delete()
    {
        _Database.Delete("UserMACAddresses_DeleteUserMACAddressByID", ID);
    }

    internal void Insert()
    {
        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@ID", ID) { Direction = ParameterDirection.Output },
            new SqlParameter("@UserID", UserID),
            new SqlParameter("@MACAddressID", MACAddressID),
            new SqlParameter("@Created", Created),
        };

        ID = _Database.Insert<long>("UserMACAddresses_InsertUserMACAddress", queryParameters);
    }

    internal void Update()
    {
        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@ID", ID),
            new SqlParameter("@UserID", UserID),
            new SqlParameter("@MACAddressID", MACAddressID),
            new SqlParameter("@Created", Created),
        };

        _Database.Update("UserMACAddresses_UpdateUserMACAddressByID", queryParameters);
    }

    internal static UserMACAddressDAL Get(long id)
    {
        return _Database.Get(
            "UserMACAddresses_GetUserMACAddressByID",
            id,
            BuildDAL
        );
    }

    public static UserMACAddressDAL GetUserMACAddressByUserIDAndMACAddressID(long userID, long MACAddressID)
    {
        if (userID == default(long)) 
            return null;
        if (MACAddressID == default(long)) 
            return null;

        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@UserID", userID),
            new SqlParameter("@MACAddressID", MACAddressID),
        };

        return _Database.Lookup(
            "UserMACAddresses_GetUserMACAddressByUserIDAndMACAddressID",
            BuildDAL,
            queryParameters
        );
    }

    public static ICollection<long> GetUserMACAddressesByUserPaged(long userID, long startRowIndex, long maximumRows)
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
            "UserMACAddresses_GetUserMACAddressIDsByUserID_Paged",
            queryParameters
        );
    }

    public static ICollection<long> GetUserMACAddressesByAddressPaged(long MACAddressID, long startRowIndex, long maximumRows)
    {
        if (MACAddressID == default(long)) 
            throw new ArgumentException("Parameter 'MACAddressID' cannot be null, empty or the default value.");
        if (startRowIndex < 1)
            throw new ApplicationException("Required value not specified: StartRowIndex.");
        if (maximumRows < 1)
            throw new ApplicationException("Required value not specified: MaximumRows.");

        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@MACAddressID", MACAddressID),
            new SqlParameter("@StartRowIndex", startRowIndex),
            new SqlParameter("@MaximumRows", maximumRows)
        };

        return _Database.GetIDCollection<long>(
            "UserMACAddresses_GetUserMACAddressIDsByMACAddressID_Paged",
            queryParameters
        );
    }

    public static int GetTotalNumberOfUserMACAddressesByUser(long userID)
    {
        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@UserID", userID),
        };

        return _Database.GetCount<int>(
            "UserMACAddresses_GetTotalNumberOfUserMACAddresssByUserID",
            queryParameters: queryParameters
        );
    }

    public static int GetTotalNumberOfUserMACAddressesByAddress(long MACAddressID)
    {
        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@MACAddressID", MACAddressID),
        };

        return _Database.GetCount<int>(
            "UserMACAddresses_GetTotalNumberOfUserMACAddresssByMACAddressID",
            queryParameters: queryParameters
        );
    }
}