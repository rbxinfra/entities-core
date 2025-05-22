namespace Roblox.Platform.Passwords.Entities;

using System;
using System.Linq;
using System.Collections.Generic;

using Roblox.Data;
using Roblox.Caching;
using Roblox.Data.Interfaces;
using Roblox.Caching.Interfaces;

internal class UsersNeedingPasswordReset : IRobloxEntity<long, UsersNeedingPasswordResetDAL>, IRemoteCacheableObject
{
    private UsersNeedingPasswordResetDAL _EntityDAL;

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

    public DateTime Created
    {
        get { return _EntityDAL.Created; }
    }

    public DateTime? Updated
    {
        get { return _EntityDAL.Updated; }
    }

    public UsersNeedingPasswordReset()
    { 
        _EntityDAL = new UsersNeedingPasswordResetDAL();
    }

    internal UsersNeedingPasswordReset(UsersNeedingPasswordResetDAL dal)
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

    internal static UsersNeedingPasswordReset Get(long id)
    {
        return EntityHelper.GetEntity<long, UsersNeedingPasswordResetDAL, UsersNeedingPasswordReset>(
            EntityCacheInfo, 
            id, 
            () => UsersNeedingPasswordResetDAL.Get(id)
        );
    }

    public static ICollection<UsersNeedingPasswordReset> GetUsersNeedingPasswordResetByUserID(long userID)
    {
        var collectionId = string.Format("GetUsersNeedingPasswordResetByUserID_UserID:{0}", userID);

        return EntityHelper.GetEntityCollection<UsersNeedingPasswordReset, long>(
            EntityCacheInfo,
            new CacheManager.CachePolicy(
                CacheManager.CacheScopeFilter.Qualified,
                string.Format("UserID:{0}", userID)
            ),
            collectionId,
            () => UsersNeedingPasswordResetDAL.GetUsersNeedingPasswordResetByUserID(userID),
            Get
        );
    }

    public static ICollection<UsersNeedingPasswordReset> MultiGet(IEnumerable<long> ids)
    {
        if (ids == null) throw new ArgumentNullException(nameof(ids));
        if (!ids.Any()) return Array.Empty<UsersNeedingPasswordReset>();

        return EntityHelper.GetEntitiesByIds<UsersNeedingPasswordReset, UsersNeedingPasswordResetDAL, long>(
            EntityCacheInfo,
            ids.Distinct().ToList(),
            UsersNeedingPasswordResetDAL.MultiGet
        ).ToList();
    }

    public static UsersNeedingPasswordReset GetOrCreate(long userID)
    {
        return EntityHelper.GetOrCreateEntityWithRemoteCache<long, UsersNeedingPasswordReset>(
            EntityCacheInfo,
            string.Format("UserID:{0}", userID),
            () => DoGetOrCreate(userID),
            Get
        );
    }

    private static UsersNeedingPasswordReset DoGetOrCreate(long userID)
    {
        return EntityHelper.DoGetOrCreate<long, UsersNeedingPasswordResetDAL, UsersNeedingPasswordReset>(
            () => UsersNeedingPasswordResetDAL.GetOrCreate(userID)
        );
    }

    #region IRobloxEntity Members

    /// <inheritdoc cref="IRobloxEntity{TIndex, TDal}.Construct(TDal)"/>
    public void Construct(UsersNeedingPasswordResetDAL dal)
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
        typeof(UsersNeedingPasswordReset).ToString(),
        true
    );

    /// <inheritdoc cref="ICacheableObject.BuildEntityIDLookups"/>
    public IEnumerable<string> BuildEntityIDLookups()
    {
        yield return string.Format("UserID:{0}", UserID);
        yield break;
    }

    /// <inheritdoc cref="ICacheableObject.BuildStateTokenCollection"/>
    public IEnumerable<StateToken> BuildStateTokenCollection()
    {
        yield return new StateToken(string.Format("UserID:{0}", UserID));
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