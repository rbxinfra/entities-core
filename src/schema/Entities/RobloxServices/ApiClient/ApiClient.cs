namespace Roblox.Api.ControlPlane;

using System;
using System.Linq;
using System.Collections.Generic;

using Roblox.Data;
using Roblox.Caching;
using Roblox.Data.Interfaces;
using Roblox.Caching.Interfaces;

internal class ApiClient : IRobloxEntity<int, ApiClientDAL>
{
    private ApiClientDAL _EntityDAL;

    /// <inheritdoc cref="ICacheableObject{TIndex}.ID"/>
    public int ID
    {
        get { return _EntityDAL.ID; }
    }

    public Guid ApiKey
    {
        get { return _EntityDAL.ApiKey; }
        set { _EntityDAL.ApiKey = value; }
    }

    public string Note
    {
        get { return _EntityDAL.Note; }
        set { _EntityDAL.Note = value; }
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

    public ApiClient()
    { 
        _EntityDAL = new ApiClientDAL();
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

    internal static ApiClient Get(int id)
    {
        return EntityHelper.GetEntity<int, ApiClientDAL, ApiClient>(
            EntityCacheInfo, 
            id, 
            () => ApiClientDAL.Get(id)
        );
    }

    public static ApiClient GetByApiKey(Guid apiKey)
    {
        return EntityHelper.GetEntityByLookup<int, ApiClientDAL, ApiClient>(
            EntityCacheInfo,
            string.Format("ApiKey:{0}", apiKey),
            () => ApiClientDAL.GetByApiKey(apiKey)
        );
    }

    public static ApiClient GetByNote(string note)
    {
        return EntityHelper.GetEntityByLookup<int, ApiClientDAL, ApiClient>(
            EntityCacheInfo,
            string.Format("Note:{0}", note),
            () => ApiClientDAL.GetByNote(note)
        );
    }

    public static int GetTotalNumberOfApiClients()
    {
        var countId = "GetTotalNumberOfApiClients";

        return EntityHelper.GetEntityCount<int>(
            EntityCacheInfo,
            CacheManager.UnqualifiedNonExpiringCachePolicy,
            countId,
            () => ApiClientDAL.GetTotalNumberOfApiClients()
        );
    }

    public static ICollection<ApiClient> GetAllPaged(long startRowIndex, long maximumRows)
    {
        var collectionId = "GetAllPaged";

        return EntityHelper.GetEntityCollection<ApiClient, int>(
            EntityCacheInfo,
            CacheManager.UnqualifiedNonExpiringCachePolicy,
            collectionId,
            () =>
            {
                return ApiClientDAL.GetAllPaged(
                    startRowIndex + 1,
                    maximumRows
                );
            },
            Get
        );
    }

    #region IRobloxEntity Members

    /// <inheritdoc cref="IRobloxEntity{TIndex, TDal}.Construct(TDal)"/>
    public void Construct(ApiClientDAL dal)
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
        typeof(ApiClient).ToString(),
        true
    );

    /// <inheritdoc cref="ICacheableObject.BuildEntityIDLookups"/>
    public IEnumerable<string> BuildEntityIDLookups()
    {
        yield return string.Format("ApiKey:{0}", ApiKey);
        yield return string.Format("Note:{0}", Note);
        yield break;
    }

    /// <inheritdoc cref="ICacheableObject.BuildStateTokenCollection"/>
    public IEnumerable<StateToken> BuildStateTokenCollection()
    {
        yield break;
    }

    #endregion ICacheableObject Members
}