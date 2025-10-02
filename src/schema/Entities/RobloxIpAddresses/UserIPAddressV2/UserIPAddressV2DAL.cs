namespace Roblox.Platform.IpAddresses.Entities;

using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;

using Roblox.Data;
using Roblox.Entities.Mssql;

internal class UserIPAddressV2DAL
{
    private const Roblox.MssqlDatabases.RobloxDatabase _Database = global::Roblox.MssqlDatabases.RobloxDatabase.RobloxIpAddresses;

    public long ID { get; set; }
    public long UserID { get; set; }
    public long IPAddressID { get; set; }
    public byte State { get; set; }
    public DateTime? LastSeen { get; set; }
    public DateTime Created { get; set; }

    private static UserIPAddressV2DAL BuildDAL(IDictionary<string, object> record)
    {
        var dal = new UserIPAddressV2DAL();
        dal.ID = (long)record["ID"];
        dal.UserID = (long)record["UserID"];
        dal.IPAddressID = (long)record["IPAddressID"];
        dal.State = (byte)record["State"];
        dal.LastSeen = record["LastSeen"] != null ? (DateTime)record["LastSeen"] : default(DateTime);
        dal.Created = (DateTime)record["Created"];

        return dal;
    }

    internal void Delete()
    {
        _Database.Delete("UserIPAddressesV3_DeleteUserIPAddressV2ByID", ID);
    }

    internal void Insert()
    {
        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@ID", ID) { Direction = ParameterDirection.Output },
            new SqlParameter("@UserID", UserID),
            new SqlParameter("@IPAddressID", IPAddressID),
            new SqlParameter("@State", State),
            new SqlParameter("@LastSeen", LastSeen == null ? DBNull.Value : (object)LastSeen),
            new SqlParameter("@Created", Created),
        };

        ID = _Database.Insert<long>("UserIPAddressesV3_InsertUserIPAddressV2", queryParameters);
    }

    internal void Update()
    {
        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@ID", ID),
            new SqlParameter("@UserID", UserID),
            new SqlParameter("@IPAddressID", IPAddressID),
            new SqlParameter("@State", State),
            new SqlParameter("@LastSeen", LastSeen == null ? DBNull.Value : (object)LastSeen),
            new SqlParameter("@Created", Created),
        };

        _Database.Update("UserIPAddressesV3_UpdateUserIPAddressV2ByID", queryParameters);
    }

    internal static UserIPAddressV2DAL Get(long id)
    {
        return _Database.Get(
            "UserIPAddressesV3_GetUserIPAddressV2ByID",
            id,
            BuildDAL
        );
    }

    public static ICollection<long> GetUserIPAddressesV2ByUserPaged(long userID, long startRowIndex, long maximumRows)
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
            "UserIPAddressesV3_GetUserIPAddressV2IDsByUserID_Paged",
            queryParameters
        );
    }

    public static ICollection<long> GetUserIPAddressesV2ByAddressPaged(long IPAddressID, long startRowIndex, long maximumRows)
    {
        if (IPAddressID == default(long)) 
            throw new ArgumentException("Parameter 'IPAddressID' cannot be null, empty or the default value.");
        if (startRowIndex < 1)
            throw new ApplicationException("Required value not specified: StartRowIndex.");
        if (maximumRows < 1)
            throw new ApplicationException("Required value not specified: MaximumRows.");

        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@IPAddressID", IPAddressID),
            new SqlParameter("@StartRowIndex", startRowIndex),
            new SqlParameter("@MaximumRows", maximumRows)
        };

        return _Database.GetIDCollection<long>(
            "UserIPAddressesV3_GetUserIPAddressV2IDsByIPAddressID_Paged",
            queryParameters
        );
    }

    public static int GetTotalNumberOfUserIPAddressesV2ByUser(long userID)
    {
        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@UserID", userID),
        };

        return _Database.GetCount<int>(
            "UserIPAddressesV3_GetTotalNumberOfUserIPAddressV2sByUserID",
            queryParameters: queryParameters
        );
    }

    public static int GetTotalNumberOfUserIPAddressesV2ByAddress(long IPAddressID)
    {
        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@IPAddressID", IPAddressID),
        };

        return _Database.GetCount<int>(
            "UserIPAddressesV3_GetTotalNumberOfUserIPAddressV2sByIPAddressID",
            queryParameters: queryParameters
        );
    }

    public static EntityHelper.GetOrCreateDALWrapper<UserIPAddressV2DAL> GetOrCreate(long userID, long IPAddressID)
    {
        if (userID == default(long)) 
            return null;
        if (IPAddressID == default(long)) 
            return null;

        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@CreatedNewEntity", SqlDbType.Bit) { Direction = ParameterDirection.Output },
            new SqlParameter("@UserID", userID),
            new SqlParameter("@IPAddressID", IPAddressID),
        };

        return _Database.GetOrCreate(
            "UserIPAddressesV3_GetOrCreateUserIPAddressV2",
            BuildDAL,
            queryParameters
        );
    }

    public static ICollection<UserIPAddressV2DAL> MultiGet(IEnumerable<long> ids)
    {
        return _Database.MultiGet(
            "UserIPAddressesV3_GetUserIPAddressV2sByIDs",
            ids,
            BuildDAL
        );
    }
}