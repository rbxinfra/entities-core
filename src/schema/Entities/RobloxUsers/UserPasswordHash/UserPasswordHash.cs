namespace Roblox.Platform.Passwords.Entities;

using System;
using System.Linq;
using System.Collections.Generic;

using Roblox.Data;
using Roblox.Caching;
using Roblox.Data.Interfaces;
using Roblox.Caching.Interfaces;

internal class UserPasswordHash : IRobloxEntity<long, UserPasswordHashDAL>, IRemoteCacheableObject
{
    private UserPasswordHashDAL _EntityDAL;

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

    public bool IsValid
    {
        get { return _EntityDAL.IsValid; }
        set { _EntityDAL.IsValid = value; }
    }

    public string Hash
    {
        get { return _EntityDAL.Hash; }
        set { _EntityDAL.Hash = value; }
    }

    public DateTime Created
    {
        get { return _EntityDAL.Created; }
    }

    public DateTime? Updated
    {
        get { return _EntityDAL.Updated; }
    }

    public UserPasswordHash()
    { 
        _EntityDAL = new UserPasswordHashDAL();
    }

    internal UserPasswordHash(UserPasswordHashDAL dal)
    {
        _EntityDAL = dal;
    }

    internal static UserPasswordHash CreateNew(long userID, bool isValid, string hash)
    {
        var entity = new UserPasswordHash();
        entity.UserID = userID;
        entity.IsValid = isValid;
        entity.Hash = hash;

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

    internal static UserPasswordHash Get(long id)
    {
        return EntityHelper.GetEntity<long, UserPasswordHashDAL, UserPasswordHash>(
            EntityCacheInfo, 
            id, 
            () => UserPasswordHashDAL.Get(id)
        );
    }

    public static int GetTotalNumberOfValidUserPasswordHashesByUserID(long userID)
    {
        var countId = string.Format("GetTotalNumberOfValidUserPasswordHashesByUserID_UserID:{0}", userID);

        return EntityHelper.GetEntityCount<int>(
            EntityCacheInfo,
            new CacheManager.CachePolicy(
                CacheManager.CacheScopeFilter.Qualified,
                string.Format("UserID:{0}", userID)
            ),
            countId,
            () => UserPasswordHashDAL.GetTotalNumberOfValidUserPasswordHashesByUserID(userID)
        );
    }

    public static ICollection<UserPasswordHash> GetValidUserPasswordHashesByUserIDPaged(long userID, long startRowIndex, long maximumRows)
    {
        var collectionId = string.Format("GetValidUserPasswordHashesByUserIDPaged_UserID:{0}_StartRowIndex:{1}_MaximumRows:{2}", userID, startRowIndex, maximumRows);

        return EntityHelper.GetEntityCollection<UserPasswordHash, long>(
            EntityCacheInfo,
            new CacheManager.CachePolicy(
                CacheManager.CacheScopeFilter.Qualified,
                string.Format("UserID:{0}", userID)
            ),
            collectionId,
            () =>
            {
                return UserPasswordHashDAL.GetValidUserPasswordHashIDsByUserIDPaged(
                    userID,
                    startRowIndex + 1,
                    maximumRows
                );
            },
            Get
        );
    }

    #region IRobloxEntity Members

    /// <inheritdoc cref="IRobloxEntity{TIndex, TDal}.Construct(TDal)"/>
    public void Construct(UserPasswordHashDAL dal)
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
        typeof(UserPasswordHash).ToString(),
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