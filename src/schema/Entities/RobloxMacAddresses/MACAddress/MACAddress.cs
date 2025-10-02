namespace Roblox.Platform.IpAddresses.Entities;

using System;
using System.Linq;
using System.Collections.Generic;

using Roblox.Data;
using Roblox.Caching;
using Roblox.Data.Interfaces;
using Roblox.Caching.Interfaces;

internal class MACAddress : IRobloxEntity<long, MACAddressDAL>, IRemoteCacheableObject
{
    private MACAddressDAL _EntityDAL;

    /// <inheritdoc cref="ICacheableObject{TIndex}.ID"/>
    public long ID
    {
        get { return _EntityDAL.ID; }
    }

    public string MACAddress
    {
        get { return _EntityDAL.MACAddress; }
        set { _EntityDAL.MACAddress = value; }
    }

    public byte State
    {
        get { return _EntityDAL.State; }
        set { _EntityDAL.State = value; }
    }

    public DateTime? Expiration
    {
        get { return _EntityDAL.Expiration; }
        set { _EntityDAL.Expiration = value; }
    }

    public DateTime Created
    {
        get { return _EntityDAL.Created; }
    }

    public DateTime? Updated
    {
        get { return _EntityDAL.Updated; }
    }

    public MACAddress()
    { 
        _EntityDAL = new MACAddressDAL();
    }

    internal MACAddress(MACAddressDAL dal)
    {
        _EntityDAL = dal;
    }


    internal void Delete()
    {
        EntityHelper.DeleteEntityWithRemoteCache(
            this,
            _EntityDAL.Delete
        );
    }

    internal void Save()
    {
        EntityHelper.SaveEntityWithRemoteCache(
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

    internal static MACAddress Get(long id)
    {
        return EntityHelper.GetEntity<long, MACAddressDAL, MACAddress>(
            EntityCacheInfo, 
            id, 
            () => MACAddressDAL.Get(id)
        );
    }

    public static MACAddress Get(string MACAddress)
    {
        return EntityHelper.GetEntityByLookupWithRemoteCache<long, MACAddressDAL, MACAddress>(
            EntityCacheInfo,
            string.Format("MACAddress:{0}", MACAddress),
            () => MACAddressDAL.GetByAddress(MACAddress),
            Get
        );
    }

    public static MACAddress GetOrCreate(string MACAddress)
    {
        return EntityHelper.GetOrCreateEntityWithRemoteCache<long, MACAddress>(
            EntityCacheInfo,
            string.Format("MACAddress:{0}", MACAddress),
            () => DoGetOrCreate(MACAddress),
            Get
        );
    }

    private static MACAddress DoGetOrCreate(string MACAddress)
    {
        return EntityHelper.DoGetOrCreate<long, MACAddressDAL, MACAddress>(
            () => MACAddressDAL.GetOrCreate(MACAddress)
        );
    }

    #region IRobloxEntity Members

    /// <inheritdoc cref="IRobloxEntity{TIndex, TDal}.Construct(TDal)"/>
    public void Construct(MACAddressDAL dal)
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
        typeof(MACAddress).ToString(),
        true
    );

    /// <inheritdoc cref="ICacheableObject.BuildEntityIDLookups"/>
    public IEnumerable<string> BuildEntityIDLookups()
    {
        yield return string.Format("MACAddress:{0}", MACAddress);
        yield break;
    }

    /// <inheritdoc cref="ICacheableObject.BuildStateTokenCollection"/>
    public IEnumerable<StateToken> BuildStateTokenCollection()
    {
        yield break;
    }

    #endregion ICacheableObject Members

    #region IRemoteCacheableObject Members

    /// <inheritdoc cref="IRemoteCacheableObject.GetSerializable"/>
    public object GetSerializable()
    {
        return _EntityDAL;
    }

    #endregion IRemoteCacheableObject Members
}