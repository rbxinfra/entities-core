namespace Roblox.Platform.IpAddresses.Entities;

using System;
using System.Linq;
using System.Collections.Generic;

using Roblox.Data;
using Roblox.Caching;
using Roblox.Data.Interfaces;
using Roblox.Caching.Interfaces;

internal class IPAddress : IRobloxEntity<long, IPAddressDAL>, IRemoteCacheableObject
{
    private IPAddressDAL _EntityDAL;

    /// <inheritdoc cref="ICacheableObject{TIndex}.ID"/>
    public long ID
    {
        get { return _EntityDAL.ID; }
    }

    public string Address
    {
        get { return _EntityDAL.Address; }
        set { _EntityDAL.Address = value; }
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

    public IPAddress()
    { 
        _EntityDAL = new IPAddressDAL();
    }

    internal IPAddress(IPAddressDAL dal)
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

    internal static IPAddress Get(long id)
    {
        return EntityHelper.GetEntity<long, IPAddressDAL, IPAddress>(
            EntityCacheInfo, 
            id, 
            () => IPAddressDAL.Get(id)
        );
    }

    public static IPAddress Get(string value)
    {
        return EntityHelper.GetEntityByLookupWithRemoteCache<long, IPAddressDAL, IPAddress>(
            EntityCacheInfo,
            string.Format("Value:{0}", value),
            () => IPAddressDAL.GetByValue(value),
            Get
        );
    }

    public static IPAddress GetOrCreate(int address, string value)
    {
        return EntityHelper.GetOrCreateEntityWithRemoteCache<long, IPAddress>(
            EntityCacheInfo,
            string.Format("Address:{0}_Value:{1}", address, value),
            () => DoGetOrCreate(address, value),
            Get
        );
    }

    private static IPAddress DoGetOrCreate(int address, string value)
    {
        return EntityHelper.DoGetOrCreate<long, IPAddressDAL, IPAddress>(
            () => IPAddressDAL.GetOrCreate(address, value)
        );
    }

    public static ICollection<IPAddress> MultiGet(IEnumerable<long> ids)
    {
        if (ids == null) throw new ArgumentNullException(nameof(ids));
        if (!ids.Any()) return Array.Empty<IPAddress>();

        return EntityHelper.GetEntitiesByIds<IPAddress, IPAddressDAL, long>(
            EntityCacheInfo,
            ids.Distinct().ToList(),
            IPAddressDAL.MultiGet
        ).ToList();
    }

    #region IRobloxEntity Members

    /// <inheritdoc cref="IRobloxEntity{TIndex, TDal}.Construct(TDal)"/>
    public void Construct(IPAddressDAL dal)
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
        typeof(IPAddress).ToString(),
        true
    );

    /// <inheritdoc cref="ICacheableObject.BuildEntityIDLookups"/>
    public IEnumerable<string> BuildEntityIDLookups()
    {
        yield return string.Format("Value:{0}", Value);
        yield return string.Format("Address:{0}_Value:{1}", Address, Value);
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