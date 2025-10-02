namespace Roblox.Platform.IpAddresses.Entities;

using System;
using System.Linq;
using System.Collections.Generic;

using Roblox.Data;
using Roblox.Caching;
using Roblox.Data.Interfaces;
using Roblox.Caching.Interfaces;

internal class UserMACAddress : IRobloxEntity<long, UserMACAddressDAL>, IRemoteCacheableObject
{
    private UserMACAddressDAL _EntityDAL;

    /// <inheritdoc cref="ICacheableObject{TIndex}.ID"/>
    public long ID
    {
        get { return _EntityDAL.ID; }
    }

    public long UserID
    {
        get { return _EntityDAL.UserID; }
    }

    public long MACAddressID
    {
        get { return _EntityDAL.MACAddressID; }
    }

    public DateTime Created
    {
        get { return _EntityDAL.Created; }
    }

    public UserMACAddress()
    { 
        _EntityDAL = new UserMACAddressDAL();
    }

    internal UserMACAddress(UserMACAddressDAL dal)
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
                _EntityDAL.Insert();
            }, 
            _EntityDAL.Update
        );
    }

    internal static UserMACAddress Get(long id)
    {
        return EntityHelper.GetEntity<long, UserMACAddressDAL, UserMACAddress>(
            EntityCacheInfo, 
            id, 
            () => UserMACAddressDAL.Get(id)
        );
    }

    public static UserMACAddress Get(long userID, long MACAddressID)
    {
        return EntityHelper.GetEntityByLookupWithRemoteCache<long, UserMACAddressDAL, UserMACAddress>(
            EntityCacheInfo,
            string.Format("UserID:{0}_MACAddressID:{1}", userID, MACAddressID),
            () => UserMACAddressDAL.GetUserMACAddressByUserIDAndMACAddressID(userID, MACAddressID),
            Get
        );
    }

    public static ICollection<UserMACAddress> GetUserMACAddressesByUserPaged(long userID, long startRowIndex, long maximumRows)
    {
        var collectionId = string.Format("GetUserMACAddressesByUserPaged_UserID:{0}_StartRowIndex:{1}_MaximumRows:{2}", userID, startRowIndex, maximumRows);

        return EntityHelper.GetEntityCollection<UserMACAddress, long>(
            EntityCacheInfo,
            new CacheManager.CachePolicy(
                CacheManager.CacheScopeFilter.Qualified,
                string.Format("UserID:{0}", userID)
            ),
            collectionId,
            () =>
            {
                return UserMACAddressDAL.GetUserMACAddressesByUserPaged(
                    userID,
                    startRowIndex,
                    maximumRows
                );
            },
            Get
        );
    }

    public static ICollection<UserMACAddress> GetUserMACAddressesByAddressPaged(long MACAddressID, long startRowIndex, long maximumRows)
    {
        var collectionId = string.Format("GetUserMACAddressesByAddressPaged_MACAddressID:{0}_StartRowIndex:{1}_MaximumRows:{2}", MACAddressID, startRowIndex, maximumRows);

        return EntityHelper.GetEntityCollection<UserMACAddress, long>(
            EntityCacheInfo,
            new CacheManager.CachePolicy(
                CacheManager.CacheScopeFilter.Qualified,
                string.Format("MACAddressID:{0}", MACAddressID)
            ),
            collectionId,
            () =>
            {
                return UserMACAddressDAL.GetUserMACAddressesByAddressPaged(
                    MACAddressID,
                    startRowIndex,
                    maximumRows
                );
            },
            Get
        );
    }

    public static int GetTotalNumberOfUserMACAddressesByUser(long userID)
    {
        var countId = string.Format("GetTotalNumberOfUserMACAddressesByUser_UserID:{0}", userID);

        return EntityHelper.GetEntityCount<int>(
            EntityCacheInfo,
            new CacheManager.CachePolicy(
                CacheManager.CacheScopeFilter.Qualified,
                string.Format("UserID:{0}", userID)
            ),
            countId,
            () => UserMACAddressDAL.GetTotalNumberOfUserMACAddressesByUser(userID)
        );
    }

    public static int GetTotalNumberOfUserMACAddressesByAddress(long MACAddressID)
    {
        var countId = string.Format("GetTotalNumberOfUserMACAddressesByAddress_MACAddressID:{0}", MACAddressID);

        return EntityHelper.GetEntityCount<int>(
            EntityCacheInfo,
            new CacheManager.CachePolicy(
                CacheManager.CacheScopeFilter.Qualified,
                string.Format("MACAddressID:{0}", MACAddressID)
            ),
            countId,
            () => UserMACAddressDAL.GetTotalNumberOfUserMACAddressesByAddress(MACAddressID)
        );
    }

    #region IRobloxEntity Members

    /// <inheritdoc cref="IRobloxEntity{TIndex, TDal}.Construct(TDal)"/>
    public void Construct(UserMACAddressDAL dal)
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
        typeof(UserMACAddress).ToString(),
        true
    );

    /// <inheritdoc cref="ICacheableObject.BuildEntityIDLookups"/>
    public IEnumerable<string> BuildEntityIDLookups()
    {
        yield return string.Format("UserID:{0}_MACAddressID:{1}", UserID, MACAddressID);
        yield break;
    }

    /// <inheritdoc cref="ICacheableObject.BuildStateTokenCollection"/>
    public IEnumerable<StateToken> BuildStateTokenCollection()
    {
        yield return new StateToken(string.Format("UserID:{0}", UserID));
        yield return new StateToken(string.Format("MACAddressID:{0}", MACAddressID));
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