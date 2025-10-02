namespace Roblox.Platform.IpAddresses.Entities;

using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;

using Roblox.Data;
using Roblox.Entities.Mssql;

internal class MACAddressDAL
{
    private const Roblox.MssqlDatabases.RobloxDatabase _Database = global::Roblox.MssqlDatabases.RobloxDatabase.RobloxMacAddresses;

    public long ID { get; set; }
    public string MACAddress { get; set; }
    public byte State { get; set; }
    public DateTime? Expiration { get; set; }
    public DateTime Created { get; set; }
    public DateTime? Updated { get; set; }

    private static MACAddressDAL BuildDAL(IDictionary<string, object> record)
    {
        var dal = new MACAddressDAL();
        dal.ID = (long)record["ID"];
        dal.MACAddress = (string)record["MACAddress"];
        dal.State = (byte)record["State"];
        dal.Expiration = record["Expiration"] != null ? (DateTime)record["Expiration"] : default(DateTime);
        dal.Created = (DateTime)record["Created"];
        dal.Updated = record["Updated"] != null ? (DateTime)record["Updated"] : default(DateTime);

        return dal;
    }

    internal void Delete()
    {
        _Database.Delete("MACAddresses_DeleteMACAddressByID", ID);
    }

    internal void Insert()
    {
        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@ID", ID) { Direction = ParameterDirection.Output },
            new SqlParameter("@MACAddress", MACAddress),
            new SqlParameter("@State", State),
            new SqlParameter("@Expiration", Expiration == null ? DBNull.Value : (object)Expiration),
            new SqlParameter("@Created", Created),
            new SqlParameter("@Updated", Updated == null ? DBNull.Value : (object)Updated),
        };

        ID = _Database.Insert<long>("MACAddresses_InsertMACAddress", queryParameters);
    }

    internal void Update()
    {
        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@ID", ID),
            new SqlParameter("@MACAddress", MACAddress),
            new SqlParameter("@State", State),
            new SqlParameter("@Expiration", Expiration == null ? DBNull.Value : (object)Expiration),
            new SqlParameter("@Created", Created),
            new SqlParameter("@Updated", Updated == null ? DBNull.Value : (object)Updated),
        };

        _Database.Update("MACAddresses_UpdateMACAddressByID", queryParameters);
    }

    internal static MACAddressDAL Get(long id)
    {
        return _Database.Get(
            "MACAddresses_GetMACAddressByID",
            id,
            BuildDAL
        );
    }

    public static MACAddressDAL GetByAddress(string MACAddress)
    {
        if (string.IsNullOrEmpty(MACAddress))
            return null;

        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@MACAddress", MACAddress),
        };

        return _Database.Lookup(
            "MACAddresses_GetMACAddressByMACAddress",
            BuildDAL,
            queryParameters
        );
    }

    public static EntityHelper.GetOrCreateDALWrapper<MACAddressDAL> GetOrCreate(string MACAddress)
    {
        if (string.IsNullOrEmpty(MACAddress))
            return null;

        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@CreatedNewEntity", SqlDbType.Bit) { Direction = ParameterDirection.Output },
            new SqlParameter("@MACAddress", MACAddress),
        };

        return _Database.GetOrCreate(
            "MACAddresses_GetOrCreateMACAddress",
            BuildDAL,
            queryParameters
        );
    }
}