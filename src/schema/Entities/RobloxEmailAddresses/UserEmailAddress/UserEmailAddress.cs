namespace Roblox.Platform.Email.User.Entities;

using System;
using System.Linq;
using System.Collections.Generic;

using Roblox.Data;
using Roblox.Caching;
using Roblox.Data.Interfaces;
using Roblox.Caching.Interfaces;

internal class UserEmailAddress : IRobloxEntity<long, UserEmailAddressDAL>, IRemoteCacheableObject
{
    private UserEmailAddressDAL _EntityDAL;

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

    public int EmailAddressID
    {
        get { return _EntityDAL.EmailAddressID; }
        set { _EntityDAL.EmailAddressID = value; }
    }

    public bool IsVerified
    {
        get { return _EntityDAL.IsVerified; }
        set { _EntityDAL.IsVerified = value; }
    }

    public bool IsValid
    {
        get { return _EntityDAL.IsValid; }
        set { _EntityDAL.IsValid = value; }
    }

    public bool Newsletter
    {
        get { return _EntityDAL.Newsletter; }
        set { _EntityDAL.Newsletter = value; }
    }

    public DateTime Created
    {
        get { return _EntityDAL.Created; }
    }

    public DateTime? Updated
    {
        get { return _EntityDAL.Updated; }
    }

    public UserEmailAddress()
    { 
        _EntityDAL = new UserEmailAddressDAL();
    }

    internal UserEmailAddress(UserEmailAddressDAL dal)
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

    internal static UserEmailAddress Get(long id)
    {
        return EntityHelper.GetEntity<long, UserEmailAddressDAL, UserEmailAddress>(
            EntityCacheInfo, 
            id, 
            () => UserEmailAddressDAL.Get(id)
        );
    }

    public static int GetTotalNumberOfValidUserEmailAddresses(long userID)
    {
        var countId = string.Format("GetTotalNumberOfValidUserEmailAddresses_UserID:{0}", userID);

        return EntityHelper.GetEntityCount<int>(
            EntityCacheInfo,
            new CacheManager.CachePolicy(
                CacheManager.CacheScopeFilter.Qualified,
                string.Format("UserID:{0}", userID)
            ),
            countId,
            () => UserEmailAddressDAL.GetTotalNumberOfValidUserEmailAddresses(userID)
        );
    }

    public static int GetTotalNumberOfUsersByValidEmailAddressID(int emailAddressID)
    {
        var countId = string.Format("GetTotalNumberOfUsersByValidEmailAddressID_EmailAddressID:{0}", emailAddressID);

        return EntityHelper.GetEntityCount<int>(
            EntityCacheInfo,
            new CacheManager.CachePolicy(
                CacheManager.CacheScopeFilter.Qualified,
                string.Format("EmailAddressID:{0}", emailAddressID)
            ),
            countId,
            () => UserEmailAddressDAL.GetTotalNumberOfUsersByValidEmailAddressID(emailAddressID)
        );
    }

    public static ICollection<UserEmailAddress> GetValidUserEmailAddresses(int emailAddressID)
    {
        var collectionId = string.Format("GetValidUserEmailAddresses_EmailAddressID:{0}", emailAddressID);

        return EntityHelper.GetEntityCollection<UserEmailAddress, long>(
            EntityCacheInfo,
            new CacheManager.CachePolicy(
                CacheManager.CacheScopeFilter.Qualified,
                string.Format("EmailAddressID:{0}", emailAddressID)
            ),
            collectionId,
            () => UserEmailAddressDAL.GetValidUserEmailAddressIDs(emailAddressID),
            Get
        );
    }

    public static ICollection<UserEmailAddress> GetValidUserEmailAddressesPaged(long userID, long startRowIndex, long maximumRows)
    {
        var collectionId = string.Format("GetValidUserEmailAddressesPaged_UserID:{0}_StartRowIndex:{1}_MaximumRows:{2}", userID, startRowIndex, maximumRows);

        return EntityHelper.GetEntityCollection<UserEmailAddress, long>(
            EntityCacheInfo,
            new CacheManager.CachePolicy(
                CacheManager.CacheScopeFilter.Qualified,
                string.Format("UserID:{0}", userID)
            ),
            collectionId,
            () =>
            {
                return UserEmailAddressDAL.GetValidUserEmailAddressIDsPaged(
                    userID,
                    startRowIndex,
                    maximumRows
                );
            },
            Get
        );
    }

    public static ICollection<UserEmailAddress> GetValidUserEmailAddressesByIsVerifiedPaged(long userID, bool isVerified, long startRowIndex, long maximumRows)
    {
        var collectionId = string.Format("GetValidUserEmailAddressesByIsVerifiedPaged_UserID:{0}_IsVerified:{1}_StartRowIndex:{2}_MaximumRows:{3}", userID, isVerified, startRowIndex, maximumRows);

        return EntityHelper.GetEntityCollection<UserEmailAddress, long>(
            EntityCacheInfo,
            new CacheManager.CachePolicy(
                CacheManager.CacheScopeFilter.Qualified,
                string.Format("UserID:{0}_IsVerified:{1}", userID, isVerified)
            ),
            collectionId,
            () =>
            {
                return UserEmailAddressDAL.GetValidUserEmailAddressIDsByIsVerifiedPaged(
                    userID,
                    isVerified,
                    startRowIndex,
                    maximumRows
                );
            },
            Get
        );
    }

    public static ICollection<UserEmailAddress> GetUserEmailAddressesPaged(long userID, long startRowIndex, long maximumRows)
    {
        var collectionId = string.Format("GetUserEmailAddressesPaged_UserID:{0}_StartRowIndex:{1}_MaximumRows:{2}", userID, startRowIndex, maximumRows);

        return EntityHelper.GetEntityCollection<UserEmailAddress, long>(
            EntityCacheInfo,
            new CacheManager.CachePolicy(
                CacheManager.CacheScopeFilter.Qualified,
                string.Format("UserID:{0}", userID)
            ),
            collectionId,
            () =>
            {
                return UserEmailAddressDAL.GetUserEmailAddressIDsPaged(
                    userID,
                    startRowIndex,
                    maximumRows
                );
            },
            Get
        );
    }

    public static int GetTotalNumberOfUserEmailAddressesByEmailAddressID(int emailAddressID)
    {
        var countId = string.Format("GetTotalNumberOfUserEmailAddressesByEmailAddressID_EmailAddressID:{0}", emailAddressID);

        return EntityHelper.GetEntityCount<int>(
            EntityCacheInfo,
            new CacheManager.CachePolicy(
                CacheManager.CacheScopeFilter.Qualified,
                string.Format("EmailAddressID:{0}", emailAddressID)
            ),
            countId,
            () => UserEmailAddressDAL.GetTotalNumberOfUserEmailAddressIDsByEmailAddressID(emailAddressID)
        );
    }

    public static ICollection<UserEmailAddress> MultiGet(IEnumerable<long> ids)
    {
        if (ids == null) throw new ArgumentNullException(nameof(ids));
        if (!ids.Any()) return Array.Empty<UserEmailAddress>();

        return EntityHelper.GetEntitiesByIds<UserEmailAddress, UserEmailAddressDAL, long>(
            EntityCacheInfo,
            ids.Distinct().ToList(),
            UserEmailAddressDAL.MultiGet
        ).ToList();
    }

    #region IRobloxEntity Members

    /// <inheritdoc cref="IRobloxEntity{TIndex, TDal}.Construct(TDal)"/>
    public void Construct(UserEmailAddressDAL dal)
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
        typeof(UserEmailAddress).ToString(),
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
        yield return new StateToken(string.Format("EmailAddressID:{0}", EmailAddressID));
        yield return new StateToken(string.Format("UserID:{0}_IsVerified:{1}", UserID, IsVerified));
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