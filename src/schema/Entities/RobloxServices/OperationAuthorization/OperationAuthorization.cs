namespace Roblox.Api.ControlPlane;

using System;
using System.Linq;
using System.Collections.Generic;

using Roblox.Data;
using Roblox.Caching;
using Roblox.Data.Interfaces;
using Roblox.Caching.Interfaces;

internal class OperationAuthorization : IRobloxEntity<int, OperationAuthorizationDAL>
{
    private OperationAuthorizationDAL _EntityDAL;

    /// <inheritdoc cref="ICacheableObject{TIndex}.ID"/>
    public int ID
    {
        get { return _EntityDAL.ID; }
    }

    public int OperationID
    {
        get { return _EntityDAL.OperationID; }
        set { _EntityDAL.OperationID = value; }
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

    public OperationAuthorization()
    { 
        _EntityDAL = new OperationAuthorizationDAL();
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

    internal static OperationAuthorization Get(int id)
    {
        return EntityHelper.GetEntity<int, OperationAuthorizationDAL, OperationAuthorization>(
            EntityCacheInfo, 
            id, 
            () => OperationAuthorizationDAL.Get(id)
        );
    }

    public static OperationAuthorization GetByOperationIDAndApiClientID(int operationID, int apiClientID)
    {
        return EntityHelper.GetEntityByLookup<int, OperationAuthorizationDAL, OperationAuthorization>(
            EntityCacheInfo,
            string.Format("OperationID:{0}_ApiClientID:{1}", operationID, apiClientID),
            () => OperationAuthorizationDAL.GetByOperationIDAndApiClientID(operationID, apiClientID)
        );
    }

    public static int GetTotalNumberOfOperationAuthorizationsByOperationID(int operationID)
    {
        var countId = string.Format("GetTotalNumberOfOperationAuthorizationsByOperationID_OperationID:{0}", operationID);

        return EntityHelper.GetEntityCount<int>(
            EntityCacheInfo,
            new CacheManager.CachePolicy(
                CacheManager.CacheScopeFilter.Qualified,
                string.Format("OperationID:{0}", operationID)
            ),
            countId,
            () => OperationAuthorizationDAL.GetTotalNumberOfOperationAuthorizationsByOperationID(operationID)
        );
    }

    public static ICollection<OperationAuthorization> GetOperationAuthorizationsByOperationID(int operationID, long startRowIndex, long maximumRows)
    {
        var collectionId = string.Format("GetOperationAuthorizationsByOperationID_OperationID:{0}_StartRowIndex:{1}_MaximumRows:{2}", operationID, startRowIndex, maximumRows);

        return EntityHelper.GetEntityCollection<OperationAuthorization, int>(
            EntityCacheInfo,
            new CacheManager.CachePolicy(
                CacheManager.CacheScopeFilter.Qualified,
                string.Format("OperationID:{0}", operationID)
            ),
            collectionId,
            () =>
            {
                return OperationAuthorizationDAL.GetOperationAuthorizationsByOperationID(
                    operationID,
                    startRowIndex,
                    maximumRows
                );
            },
            Get
        );
    }

    public static int GetTotalNumberOfOperationAuthorizationsByApiClientID(int apiClientID)
    {
        var countId = string.Format("GetTotalNumberOfOperationAuthorizationsByApiClientID_ApiClientID:{0}", apiClientID);

        return EntityHelper.GetEntityCount<int>(
            EntityCacheInfo,
            new CacheManager.CachePolicy(
                CacheManager.CacheScopeFilter.Qualified,
                string.Format("ApiClientID:{0}", apiClientID)
            ),
            countId,
            () => OperationAuthorizationDAL.GetTotalNumberOfOperationAuthorizationsByApiClientID(apiClientID)
        );
    }

    public static ICollection<OperationAuthorization> GetOperationAuthorizationsByApiClientID(int apiClientID, long startRowIndex, long maximumRows)
    {
        var collectionId = string.Format("GetOperationAuthorizationsByApiClientID_ApiClientID:{0}_StartRowIndex:{1}_MaximumRows:{2}", apiClientID, startRowIndex, maximumRows);

        return EntityHelper.GetEntityCollection<OperationAuthorization, int>(
            EntityCacheInfo,
            new CacheManager.CachePolicy(
                CacheManager.CacheScopeFilter.Qualified,
                string.Format("ApiClientID:{0}", apiClientID)
            ),
            collectionId,
            () =>
            {
                return OperationAuthorizationDAL.GetOperationAuthorizationsByApiClientID(
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
    public void Construct(OperationAuthorizationDAL dal)
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
        typeof(OperationAuthorization).ToString(),
        true
    );

    /// <inheritdoc cref="ICacheableObject.BuildEntityIDLookups"/>
    public IEnumerable<string> BuildEntityIDLookups()
    {
        yield return string.Format("OperationID:{0}_ApiClientID:{1}", OperationID, ApiClientID);
        yield break;
    }

    /// <inheritdoc cref="ICacheableObject.BuildStateTokenCollection"/>
    public IEnumerable<StateToken> BuildStateTokenCollection()
    {
        yield return new StateToken(string.Format("OperationID:{0}", OperationID));
        yield return new StateToken(string.Format("ApiClientID:{0}", ApiClientID));
        yield break;
    }

    #endregion ICacheableObject Members
}