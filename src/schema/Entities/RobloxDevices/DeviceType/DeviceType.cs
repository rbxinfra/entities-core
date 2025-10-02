namespace Roblox.Platform.Devices.Entities;

using System;
using System.Linq;
using System.Collections.Generic;

using Roblox.Data;
using Roblox.Caching;
using Roblox.Data.Interfaces;
using Roblox.Caching.Interfaces;

internal class DeviceType : IRobloxEntity<byte, DeviceTypeDAL>
{
    private DeviceTypeDAL _EntityDAL;

    /// <inheritdoc cref="ICacheableObject{TIndex}.ID"/>
    public byte ID
    {
        get { return _EntityDAL.ID; }
    }

    public string Value
    {
        get { return _EntityDAL.Value; }
        set { _EntityDAL.Value = value; }
    }

    public byte BitOrdinal
    {
        get { return _EntityDAL.BitOrdinal; }
        set { _EntityDAL.BitOrdinal = value; }
    }

    public long BitMask
    {
        get { return _EntityDAL.BitMask; }
        set { _EntityDAL.BitMask = value; }
    }

    public DateTime Created
    {
        get { return _EntityDAL.Created; }
        set { _EntityDAL.Created = value; }
    }

    public DateTime? Updated
    {
        get { return _EntityDAL.Updated; }
        set { _EntityDAL.Updated = value; }
    }

    public static readonly byte ComputerID;
    public const string ComputerValue = "Computer";

    public static readonly byte PhoneID;
    public const string PhoneValue = "Phone";

    public static readonly byte TabletID;
    public const string TabletValue = "Tablet";

    public static readonly byte ConsoleID;
    public const string ConsoleValue = "Console";

    static DeviceType()
    {
        ComputerID = GetByValue(ComputerValue).ID;
        PhoneID = GetByValue(PhoneValue).ID;
        TabletID = GetByValue(TabletValue).ID;
        ConsoleID = GetByValue(ConsoleValue).ID;
    }

    public DeviceType()
    { 
        _EntityDAL = new DeviceTypeDAL();
    }

    internal void Delete()
    {
        EntityHelper.DeleteEntity(
            this,
            _EntityDAL.Delete
        );
    }

    internal void Save()
    {
        EntityHelper.SaveEntity(
            this, 
            () =>
            {
                _EntityDAL.Created = DateTime.Now;
                _EntityDAL.Updated = _EntityDAL.Created;
                _EntityDAL.Insert();
            }, 
            () =>
            {
                _EntityDAL.Updated = DateTime.Now;
                _EntityDAL.Update();
            }
        );
    }

    internal static DeviceType Get(byte id)
    {
        return EntityHelper.GetEntity<byte, DeviceTypeDAL, DeviceType>(
            EntityCacheInfo, 
            id, 
            () => DeviceTypeDAL.Get(id)
        );
    }

    public static DeviceType GetByValue(string value)
    {
        return EntityHelper.GetEntityByLookup<byte, DeviceTypeDAL, DeviceType>(
            EntityCacheInfo,
            string.Format("Value:{0}", value),
            () => DeviceTypeDAL.GetByValue(value)
        );
    }

    public static DeviceType GetByBitOrdinal(byte bitOrdinal)
    {
        return EntityHelper.GetEntityByLookup<byte, DeviceTypeDAL, DeviceType>(
            EntityCacheInfo,
            string.Format("BitOrdinal:{0}", bitOrdinal),
            () => DeviceTypeDAL.GetByBitOrdinal(bitOrdinal)
        );
    }

    #region IRobloxEntity Members

    /// <inheritdoc cref="IRobloxEntity{TIndex, TDal}.Construct(TDal)"/>
    public void Construct(DeviceTypeDAL dal)
    {
        _EntityDAL = dal;
    }

    #endregion IRobloxEntity Members

    #region ICacheableObject Members

    /// <inheritdoc cref="ICacheableObject.CacheInfo"/>
    public CacheInfo CacheInfo
    {
        get { return EntityCacheInfo; }
    }

    /// <inheritdoc cref="ICacheableObject.CacheInfo"/>
    public static CacheInfo EntityCacheInfo = new CacheInfo(
        new CacheabilitySettings(collectionsAreCacheable: false, countsAreCacheable: false, entityIsCacheable: true, idLookupsAreCacheable: true, hasUnqualifiedCollections: false, idLookupsAreCaseSensitive: false),
        typeof(DeviceType).ToString(),
        true
    );

    /// <inheritdoc cref="ICacheableObject.BuildEntityIDLookups"/>
    public IEnumerable<string> BuildEntityIDLookups()
    {
        yield return string.Format("Value:{0}", Value);
        yield return string.Format("BitOrdinal:{0}", BitOrdinal);
        yield break;
    }

    /// <inheritdoc cref="ICacheableObject.BuildStateTokenCollection"/>
    public IEnumerable<StateToken> BuildStateTokenCollection()
    {
        yield break;
    }

    #endregion ICacheableObject Members
}