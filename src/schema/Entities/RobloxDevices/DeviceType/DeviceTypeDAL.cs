namespace Roblox.Platform.Devices.Entities;

using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;

using Roblox.Data;
using Roblox.Entities.Mssql;

internal class DeviceTypeDAL
{
    private const Roblox.MssqlDatabases.RobloxDatabase _Database = global::Roblox.MssqlDatabases.RobloxDatabase.RobloxDevices;

    public byte ID { get; set; }
    public string Value { get; set; }
    public byte BitOrdinal { get; set; }
    public long BitMask { get; set; }
    public DateTime Created { get; set; }
    public DateTime? Updated { get; set; }

    private static DeviceTypeDAL BuildDAL(IDictionary<string, object> record)
    {
        var dal = new DeviceTypeDAL();
        dal.ID = (byte)record["ID"];
        dal.Value = (string)record["Value"];
        dal.BitOrdinal = (byte)record["BitOrdinal"];
        dal.BitMask = (long)record["BitMask"];
        dal.Created = (DateTime)record["Created"];
        dal.Updated = record["Updated"] != null ? (DateTime)record["Updated"] : default(DateTime);

        return dal;
    }

    internal void Delete()
    {
        _Database.Delete("DeviceTypes_DeleteDeviceTypeByID", ID);
    }

    internal void Insert()
    {
        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@ID", ID) { Direction = ParameterDirection.Output },
            new SqlParameter("@Value", Value),
            new SqlParameter("@BitOrdinal", BitOrdinal),
            new SqlParameter("@BitMask", BitMask),
            new SqlParameter("@Created", Created),
            new SqlParameter("@Updated", Updated == null ? DBNull.Value : (object)Updated),
        };

        ID = _Database.Insert<byte>("DeviceTypes_InsertDeviceType", queryParameters);
    }

    internal void Update()
    {
        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@ID", ID),
            new SqlParameter("@Value", Value),
            new SqlParameter("@BitOrdinal", BitOrdinal),
            new SqlParameter("@BitMask", BitMask),
            new SqlParameter("@Created", Created),
            new SqlParameter("@Updated", Updated == null ? DBNull.Value : (object)Updated),
        };

        _Database.Update("DeviceTypes_UpdateDeviceTypeByID", queryParameters);
    }

    internal static DeviceTypeDAL Get(byte id)
    {
        return _Database.Get(
            "DeviceTypes_GetDeviceTypeByID",
            id,
            BuildDAL
        );
    }

    public static DeviceTypeDAL GetByValue(string value)
    {
        if (string.IsNullOrEmpty(value))
            return null;

        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@Value", value),
        };

        return _Database.Lookup(
            "DeviceTypes_GetDeviceTypeByValue",
            BuildDAL,
            queryParameters
        );
    }

    public static DeviceTypeDAL GetByBitOrdinal(byte bitOrdinal)
    {
        if (bitOrdinal == default(byte)) 
            return null;

        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@BitOrdinal", bitOrdinal),
        };

        return _Database.Lookup(
            "DeviceTypes_GetDeviceTypeByBitOrdinal",
            BuildDAL,
            queryParameters
        );
    }
}