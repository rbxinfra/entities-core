namespace Roblox.Platform.Membership.Entities;

using System;
using System.Linq;
using System.Collections.Generic;

using Roblox.Data;
using Roblox.Caching;
using Roblox.Data.Interfaces;
using Roblox.Caching.Interfaces;

internal class UserNameHistory : IRobloxEntity<long, UserNameHistoryDAL>, IRemoteCacheableObject
{
    private UserNameHistoryDAL _EntityDAL;

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

    public string Name
    {
        get { return _EntityDAL.Name; }
        set { _EntityDAL.Name = value; }
    }

    public DateTime Created
    {
        get { return _EntityDAL.Created; }
    }

    public DateTime? Updated
    {
        get { return _EntityDAL.Updated; }
    }

    public UserNameHistory()
    { 
        _EntityDAL = new UserNameHistoryDAL();
    }

    internal UserNameHistory(UserNameHistoryDAL dal)
    {
        _EntityDAL = dal;
    }

    internal static UserNameHistory CreateNew(long userID, string name)
    {
        var entity = new UserNameHistory();
        entity.UserID = userID;
        entity.Name = name;

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

    internal static UserNameHistory Get(long id)
    {
        return EntityHelper.GetEntity<long, UserNameHistoryDAL, UserNameHistory>(
            EntityCacheInfo, 
            id, 
            () => UserNameHistoryDAL.Get(id)
        );
    }

    public static ICollection<UserNameHistory> GetUserNameHistoryByUserIDPaged(long userID, long startRowIndex, long maximumRows)
    {
        var collectionId = string.Format("GetUserNameHistoryByUserIDPaged_UserID:{0}_StartRowIndex:{1}_MaximumRows:{2}", userID, startRowIndex, maximumRows);

        return EntityHelper.GetEntityCollection<UserNameHistory, long>(
            EntityCacheInfo,
            new CacheManager.CachePolicy(
                CacheManager.CacheScopeFilter.Qualified,
                string.Format("UserID:{0}", userID)
            ),
            collectionId,
            () =>
            {
                return UserNameHistoryDAL.GetUserNameHistoryIDsByUserIDPaged(
                    userID,
                    startRowIndex,
                    maximumRows
                );
            },
            Get
        );
    }

    public static int GetTotalNumberOfUserNameHistoryByUserID(long userID)
    {
        var countId = string.Format("GetTotalNumberOfUserNameHistoryByUserID_UserID:{0}", userID);

        return EntityHelper.GetEntityCount<int>(
            EntityCacheInfo,
            new CacheManager.CachePolicy(
                CacheManager.CacheScopeFilter.Qualified,
                string.Format("UserID:{0}", userID)
            ),
            countId,
            () => UserNameHistoryDAL.GetTotalNumberOfUserNameHistoryByUserID(userID)
        );
    }

    public static ICollection<UserNameHistory> GetUserNameHistoryByNamePaged(string name, long startRowIndex, long maximumRows)
    {
        var collectionId = string.Format("GetUserNameHistoryByNamePaged_Name:{0}_StartRowIndex:{1}_MaximumRows:{2}", name, startRowIndex, maximumRows);

        return EntityHelper.GetEntityCollection<UserNameHistory, long>(
            EntityCacheInfo,
            new CacheManager.CachePolicy(
                CacheManager.CacheScopeFilter.Qualified,
                string.Format("Name:{0}", name)
            ),
            collectionId,
            () =>
            {
                return UserNameHistoryDAL.GetUserNameHistoryIDsByNamePaged(
                    name,
                    startRowIndex,
                    maximumRows
                );
            },
            Get
        );
    }

    public static int GetTotalNumberOfUserNameHistoryByName(string name)
    {
        var countId = string.Format("GetTotalNumberOfUserNameHistoryByName_Name:{0}", name);

        return EntityHelper.GetEntityCount<int>(
            EntityCacheInfo,
            new CacheManager.CachePolicy(
                CacheManager.CacheScopeFilter.Qualified,
                string.Format("Name:{0}", name)
            ),
            countId,
            () => UserNameHistoryDAL.GetTotalNumberOfUserNameHistoryByName(name)
        );
    }

    #region IRobloxEntity Members

    /// <inheritdoc cref="IRobloxEntity{TIndex, TDal}.Construct(TDal)"/>
    public void Construct(UserNameHistoryDAL dal)
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
        typeof(UserNameHistory).ToString(),
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
        yield return new StateToken(string.Format("Name:{0}", Name));
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