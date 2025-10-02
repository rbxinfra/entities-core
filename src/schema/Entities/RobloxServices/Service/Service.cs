namespace Roblox.Api.ControlPlane;

using System;
using System.Linq;
using System.Collections.Generic;

using Roblox.Data;
using Roblox.Caching;
using Roblox.Data.Interfaces;
using Roblox.Caching.Interfaces;

internal class Service : IRobloxEntity<int, ServiceDAL>
{
    private ServiceDAL _EntityDAL;

    /// <inheritdoc cref="ICacheableObject{TIndex}.ID"/>
    public int ID
    {
        get { return _EntityDAL.ID; }
    }

    public string Name
    {
        get { return _EntityDAL.Name; }
        set { _EntityDAL.Name = value; }
    }

    public byte StatusTypeID
    {
        get { return _EntityDAL.StatusTypeID; }
        set { _EntityDAL.StatusTypeID = value; }
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

    public Service()
    { 
        _EntityDAL = new ServiceDAL();
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

    internal static Service Get(int id)
    {
        return EntityHelper.GetEntity<int, ServiceDAL, Service>(
            EntityCacheInfo, 
            id, 
            () => ServiceDAL.Get(id)
        );
    }

    public static Service GetByName(string name)
    {
        return EntityHelper.GetEntityByLookup<int, ServiceDAL, Service>(
            EntityCacheInfo,
            string.Format("Name:{0}", name),
            () => ServiceDAL.GetByName(name)
        );
    }

    public static int GetTotalNumberOfServices()
    {
        var countId = "GetTotalNumberOfServices";

        return EntityHelper.GetEntityCount<int>(
            EntityCacheInfo,
            CacheManager.UnqualifiedNonExpiringCachePolicy,
            countId,
            () => ServiceDAL.GetTotalNumberOfServices()
        );
    }

    public static ICollection<Service> GetAllPaged(long startRowIndex, long maximumRows)
    {
        var collectionId = "GetAllPaged";

        return EntityHelper.GetEntityCollection<Service, int>(
            EntityCacheInfo,
            CacheManager.UnqualifiedNonExpiringCachePolicy,
            collectionId,
            () =>
            {
                return ServiceDAL.GetAllPaged(
                    startRowIndex,
                    maximumRows
                );
            },
            Get
        );
    }

    #region IRobloxEntity Members

    /// <inheritdoc cref="IRobloxEntity{TIndex, TDal}.Construct(TDal)"/>
    public void Construct(ServiceDAL dal)
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
        typeof(Service).ToString(),
        true
    );

    /// <inheritdoc cref="ICacheableObject.BuildEntityIDLookups"/>
    public IEnumerable<string> BuildEntityIDLookups()
    {
        yield return string.Format("Name:{0}", Name);
        yield break;
    }

    /// <inheritdoc cref="ICacheableObject.BuildStateTokenCollection"/>
    public IEnumerable<StateToken> BuildStateTokenCollection()
    {
        yield break;
    }

    #endregion ICacheableObject Members
}