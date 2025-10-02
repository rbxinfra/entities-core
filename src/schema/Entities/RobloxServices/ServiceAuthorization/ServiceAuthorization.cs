namespace Roblox.Api.ControlPlane;

using System;
using System.Linq;
using System.Collections.Generic;

using Roblox.Data;
using Roblox.Caching;
using Roblox.Data.Interfaces;
using Roblox.Caching.Interfaces;

internal class ServiceAuthorization : IRobloxEntity<int, ServiceAuthorizationDAL>
{
    private ServiceAuthorizationDAL _EntityDAL;

    /// <inheritdoc cref="ICacheableObject{TIndex}.ID"/>
    public int ID
    {
        get { return _EntityDAL.ID; }
    }

    public int ServiceID
    {
        get { return _EntityDAL.ServiceID; }
        set { _EntityDAL.ServiceID = value; }
    }

    public int ApiClientID
    {
        get { return _EntityDAL.ApiClientID; }
        set { _EntityDAL.ApiClientID = value; }
    }

    public byte AuthorizationTypeID
    {
        get { return _EntityDAL.AuthorizationTypeID; }
        set { _EntityDAL.AuthorizationTypeID = value; }
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

    public ServiceAuthorization()
    { 
        _EntityDAL = new ServiceAuthorizationDAL();
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

    internal static ServiceAuthorization Get(int id)
    {
        return EntityHelper.GetEntity<int, ServiceAuthorizationDAL, ServiceAuthorization>(
            EntityCacheInfo, 
            id, 
            () => ServiceAuthorizationDAL.Get(id)
        );
    }

    public static ServiceAuthorization GetByServiceIDAndApiClientID(int serviceID, int apiClientID)
    {
        return EntityHelper.GetEntityByLookup<int, ServiceAuthorizationDAL, ServiceAuthorization>(
            EntityCacheInfo,
            string.Format("ServiceID:{0}_ApiClientID:{1}", serviceID, apiClientID),
            () => ServiceAuthorizationDAL.GetByServiceIDAndApiClientID(serviceID, apiClientID)
        );
    }

    public static int GetTotalNumberOfServiceAuthorizationsByServiceID(int serviceID)
    {
        var countId = string.Format("GetTotalNumberOfServiceAuthorizationsByServiceID_ServiceID:{0}", serviceID);

        return EntityHelper.GetEntityCount<int>(
            EntityCacheInfo,
            new CacheManager.CachePolicy(
                CacheManager.CacheScopeFilter.Qualified,
                string.Format("ServiceID:{0}", serviceID)
            ),
            countId,
            () => ServiceAuthorizationDAL.GetTotalNumberOfServiceAuthorizationsByServiceID(serviceID)
        );
    }

    public static ICollection<ServiceAuthorization> GetServiceAuthorizationsByServiceID(int serviceID, long startRowIndex, long maximumRows)
    {
        var collectionId = string.Format("GetServiceAuthorizationsByServiceID_ServiceID:{0}_StartRowIndex:{1}_MaximumRows:{2}", serviceID, startRowIndex, maximumRows);

        return EntityHelper.GetEntityCollection<ServiceAuthorization, int>(
            EntityCacheInfo,
            new CacheManager.CachePolicy(
                CacheManager.CacheScopeFilter.Qualified,
                string.Format("ServiceID:{0}", serviceID)
            ),
            collectionId,
            () =>
            {
                return ServiceAuthorizationDAL.GetServiceAuthorizationsByServiceID(
                    serviceID,
                    startRowIndex,
                    maximumRows
                );
            },
            Get
        );
    }

    public static int GetTotalNumberOfServiceAuthorizationsByApiClientID(int apiClientID)
    {
        var countId = string.Format("GetTotalNumberOfServiceAuthorizationsByApiClientID_ApiClientID:{0}", apiClientID);

        return EntityHelper.GetEntityCount<int>(
            EntityCacheInfo,
            new CacheManager.CachePolicy(
                CacheManager.CacheScopeFilter.Qualified,
                string.Format("ApiClientID:{0}", apiClientID)
            ),
            countId,
            () => ServiceAuthorizationDAL.GetTotalNumberOfServiceAuthorizationsByApiClientID(apiClientID)
        );
    }

    public static ICollection<ServiceAuthorization> GetServiceAuthorizationsByApiClientID(int apiClientID, long startRowIndex, long maximumRows)
    {
        var collectionId = string.Format("GetServiceAuthorizationsByApiClientID_ApiClientID:{0}_StartRowIndex:{1}_MaximumRows:{2}", apiClientID, startRowIndex, maximumRows);

        return EntityHelper.GetEntityCollection<ServiceAuthorization, int>(
            EntityCacheInfo,
            new CacheManager.CachePolicy(
                CacheManager.CacheScopeFilter.Qualified,
                string.Format("ApiClientID:{0}", apiClientID)
            ),
            collectionId,
            () =>
            {
                return ServiceAuthorizationDAL.GetServiceAuthorizationsByApiClientID(
                    apiClientID,
                    startRowIndex,
                    maximumRows
                );
            },
            Get
        );
    }

    #region IRobloxEntity Members

    /// <inheritdoc cref="IRobloxEntity{TIndex, TDal}.Construct(TDal)"/>
    public void Construct(ServiceAuthorizationDAL dal)
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
        typeof(ServiceAuthorization).ToString(),
        true
    );

    /// <inheritdoc cref="ICacheableObject.BuildEntityIDLookups"/>
    public IEnumerable<string> BuildEntityIDLookups()
    {
        yield return string.Format("ServiceID:{0}_ApiClientID:{1}", ServiceID, ApiClientID);
        yield break;
    }

    /// <inheritdoc cref="ICacheableObject.BuildStateTokenCollection"/>
    public IEnumerable<StateToken> BuildStateTokenCollection()
    {
        yield return new StateToken(string.Format("ServiceID:{0}", ServiceID));
        yield return new StateToken(string.Format("ApiClientID:{0}", ApiClientID));
        yield break;
    }

    #endregion ICacheableObject Members
}