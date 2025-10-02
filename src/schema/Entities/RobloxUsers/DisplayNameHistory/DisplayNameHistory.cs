namespace Roblox.Platform.Membership.Entities;

using System;
using System.Linq;
using System.Collections.Generic;

using Roblox.Data;
using Roblox.Caching;
using Roblox.Data.Interfaces;
using Roblox.Caching.Interfaces;

internal class DisplayNameHistory : IRobloxEntity<long, DisplayNameHistoryDAL>, IRemoteCacheableObject
{
    private DisplayNameHistoryDAL _EntityDAL;

    /// <inheritdoc cref="ICacheableObject{TIndex}.ID"/>
    public long ID
    {
        get { return _EntityDAL.ID; }
    }

    public long UserID
    {
        get { return _EntityDAL.UserID; }
        set { _EntityDAL.UserID = value; }
    }

    public long DisplayNameID
    {
        get { return _EntityDAL.DisplayNameID; }
        set { _EntityDAL.DisplayNameID = value; }
    }

    public DateTime Created
    {
        get { return _EntityDAL.Created; }
    }

    public DateTime? Updated
    {
        get { return _EntityDAL.Updated; }
    }

    public DisplayNameHistory()
    { 
        _EntityDAL = new DisplayNameHistoryDAL();
    }

    internal DisplayNameHistory(DisplayNameHistoryDAL dal)
    {
        _EntityDAL = dal;
    }

    internal static DisplayNameHistory CreateNew(long userID, long displayNameID)
    {
        var entity = new DisplayNameHistory();
        entity.UserID = userID;
        entity.DisplayNameID = displayNameID;

        entity.Save();

        return entity;
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

    internal static DisplayNameHistory Get(long id)
    {
        return EntityHelper.GetEntity<long, DisplayNameHistoryDAL, DisplayNameHistory>(
            EntityCacheInfo, 
            id, 
            () => DisplayNameHistoryDAL.Get(id)
        );
    }

    public static ICollection<DisplayNameHistory> GetDisplayNameHistoryByUserIDPaged(long userID, long startRowIndex, long maximumRows)
    {
        var collectionId = string.Format("GetDisplayNameHistoryByUserIDPaged_UserID:{0}_StartRowIndex:{1}_MaximumRows:{2}", userID, startRowIndex, maximumRows);

        return EntityHelper.GetEntityCollection<DisplayNameHistory, long>(
            EntityCacheInfo,
            new CacheManager.CachePolicy(
                CacheManager.CacheScopeFilter.Qualified,
                string.Format("UserID:{0}", userID)
            ),
            collectionId,
            () =>
            {
                return DisplayNameHistoryDAL.GetDisplayNameHistoryIDsByUserIDPaged(
                    userID,
                    startRowIndex,
                    maximumRows
                );
            },
            Get
        );
    }

    public static int GetTotalNumberOfDisplayNameHistoryByUserID(long userID)
    {
        var countId = string.Format("GetTotalNumberOfDisplayNameHistoryByUserID_UserID:{0}", userID);

        return EntityHelper.GetEntityCount<int>(
            EntityCacheInfo,
            new CacheManager.CachePolicy(
                CacheManager.CacheScopeFilter.Qualified,
                string.Format("UserID:{0}", userID)
            ),
            countId,
            () => DisplayNameHistoryDAL.GetTotalNumberOfDisplayNameHistoryByUserID(userID)
        );
    }

    public static ICollection<DisplayNameHistory> GetDisplayNameHistoryByDisplayNameIDPaged(long displayNameID, long startRowIndex, long maximumRows)
    {
        var collectionId = string.Format("GetDisplayNameHistoryByDisplayNameIDPaged_DisplayNameID:{0}_StartRowIndex:{1}_MaximumRows:{2}", displayNameID, startRowIndex, maximumRows);

        return EntityHelper.GetEntityCollection<DisplayNameHistory, long>(
            EntityCacheInfo,
            new CacheManager.CachePolicy(
                CacheManager.CacheScopeFilter.Qualified,
                string.Format("DisplayNameID:{0}", displayNameID)
            ),
            collectionId,
            () =>
            {
                return DisplayNameHistoryDAL.GetDisplayNameHistoryIDsByDisplayNameIDPaged(
                    displayNameID,
                    startRowIndex,
                    maximumRows
                );
            },
            Get
        );
    }

    public static int GetTotalNumberOfDisplayNameHistoryByDisplayNameID(long displayNameID)
    {
        var countId = string.Format("GetTotalNumberOfDisplayNameHistoryByDisplayNameID_DisplayNameID:{0}", displayNameID);

        return EntityHelper.GetEntityCount<int>(
            EntityCacheInfo,
            new CacheManager.CachePolicy(
                CacheManager.CacheScopeFilter.Qualified,
                string.Format("DisplayNameID:{0}", displayNameID)
            ),
            countId,
            () => DisplayNameHistoryDAL.GetTotalNumberOfDisplayNameHistoryByDisplayNameID(displayNameID)
        );
    }

    #region IRobloxEntity Members

    /// <inheritdoc cref="IRobloxEntity{TIndex, TDal}.Construct(TDal)"/>
    public void Construct(DisplayNameHistoryDAL dal)
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
        typeof(DisplayNameHistory).ToString(),
        true
    );

    /// <inheritdoc cref="ICacheableObject.BuildEntityIDLookups"/>
    public IEnumerable<string> BuildEntityIDLookups()
    {
        yield break;
    }

    /// <inheritdoc cref="ICacheableObject.BuildStateTokenCollection"/>
    public IEnumerable<StateToken> BuildStateTokenCollection()
    {
        yield return new StateToken(string.Format("UserID:{0}", UserID));
        yield return new StateToken(string.Format("DisplayNameID:{0}", DisplayNameID));
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