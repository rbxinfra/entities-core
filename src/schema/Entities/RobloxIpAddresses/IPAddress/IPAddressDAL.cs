namespace Roblox.Platform.IpAddresses.Entities;

using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;

using Roblox.Data;
using Roblox.Entities.Mssql;

internal class IPAddressDAL
{
    private const Roblox.MssqlDatabases.RobloxDatabase _Database = global::Roblox.MssqlDatabases.RobloxDatabase.RobloxIpAddresses;

    public long ID { get; set; }
    public string Address { get; set; }
    public byte State { get; set; }
    public DateTime? Expiration { get; set; }
    public DateTime Created { get; set; }
    public DateTime? Updated { get; set; }

    private static IPAddressDAL BuildDAL(IDictionary<string, object> record)
    {
        var dal = new IPAddressDAL();
        dal.ID = (long)record["ID"];
        dal.Address = (string)record["Address"];
        dal.State = (byte)record["State"];
        dal.Expiration = record["Expiration"] != null ? (DateTime)record["Expiration"] : default(DateTime);
        dal.Created = (DateTime)record["Created"];
        dal.Updated = record["Updated"] != null ? (DateTime)record["Updated"] : default(DateTime);

        return dal;
    }

    internal void Delete()
    {
        _Database.Delete("IPAddresses_DeleteIPAddressByID", ID);
    }

    internal void Insert()
    {
        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@ID", ID) { Direction = ParameterDirection.Output },
            new SqlParameter("@Address", Address),
            new SqlParameter("@State", State),
            new SqlParameter("@Expiration", Expiration == null ? DBNull.Value : (object)Expiration),
            new SqlParameter("@Created", Created),
            new SqlParameter("@Updated", Updated == null ? DBNull.Value : (object)Updated),
        };

        ID = _Database.Insert<long>("IPAddresses_InsertIPAddress", queryParameters);
    }

    internal void Update()
    {
        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@ID", ID),
            new SqlParameter("@Address", Address),
            new SqlParameter("@State", State),
            new SqlParameter("@Expiration", Expiration == null ? DBNull.Value : (object)Expiration),
            new SqlParameter("@Created", Created),
            new SqlParameter("@Updated", Updated == null ? DBNull.Value : (object)Updated),
        };

        _Database.Update("IPAddresses_UpdateIPAddressByID", queryParameters);
    }

    internal static IPAddressDAL Get(long id)
    {
        return _Database.Get(
            "IPAddresses_GetIPAddressByID",
            id,
            BuildDAL
        );
    }

    public static IPAddressDAL GetByValue(string value)
    {
        if (string.IsNullOrEmpty(value))
            return null;

        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@Value", value),
        };

        return _Database.Lookup(
            "IPAddresses_GetIPAddressByValue",
            BuildDAL,
            queryParameters
        );
    }

    public static EntityHelper.GetOrCreateDALWrapper<IPAddressDAL> GetOrCreate(int address, string value)
    {
        if (address == default(int)) 
            return null;
        if (string.IsNullOrEmpty(value))
            return null;

        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@CreatedNewEntity", SqlDbType.Bit) { Direction = ParameterDirection.Output },
            new SqlParameter("@Address", address),
            new SqlParameter("@Value", value),
        };

        return _Database.GetOrCreate(
            "IPAddresses_GetOrCreateIPAddress",
            BuildDAL,
            queryParameters
        );
    }

    public static ICollection<IPAddressDAL> MultiGet(IEnumerable<long> ids)
    {
        return _Database.MultiGet(
            "IPAddresses_GetIPAddresssByIDs",
            ids,
            BuildDAL
        );
    }
}