namespace Roblox.Platform.Email.Entities;

using System;
using System.Linq;
using System.Collections.Generic;

using Roblox.Data;
using Roblox.Caching;
using Roblox.Data.Interfaces;
using Roblox.Caching.Interfaces;

internal class EmailAddress : IRobloxEntity<int, EmailAddressDAL>, IRemoteCacheableObject
{
    private EmailAddressDAL _EntityDAL;

    /// <inheritdoc cref="ICacheableObject{TIndex}.ID"/>
    public int ID
    {
        get { return _EntityDAL.ID; }
    }

    public string Address
    {
        get { return _EntityDAL.Address; }
        set { _EntityDAL.Address = value; }
    }

    public bool IsBlacklisted
    {
        get { return _EntityDAL.IsBlacklisted; }
        set { _EntityDAL.IsBlacklisted = value; }
    }

    public bool IsApproved
    {
        get { return _EntityDAL.IsApproved; }
        set { _EntityDAL.IsApproved = value; }
    }

    public bool IsReviewed
    {
        get { return _EntityDAL.IsReviewed; }
        set { _EntityDAL.IsReviewed = value; }
    }

    public DateTime? Reviewed
    {
        get { return _EntityDAL.Reviewed; }
        set { _EntityDAL.Reviewed = value; }
    }

    public DateTime Created
    {
        get { return _EntityDAL.Created; }
    }

    public DateTime? Updated
    {
        get { return _EntityDAL.Updated; }
    }

    public EmailAddress()
    { 
        _EntityDAL = new EmailAddressDAL();
    }

    internal EmailAddress(EmailAddressDAL dal)
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

    internal static EmailAddress Get(int id)
    {
        return EntityHelper.GetEntity<int, EmailAddressDAL, EmailAddress>(
            EntityCacheInfo, 
            id, 
            () => EmailAddressDAL.Get(id)
        );
    }

    public static EmailAddress Get(string address)
    {
        return EntityHelper.GetEntityByLookupWithRemoteCache<int, EmailAddressDAL, EmailAddress>(
            EntityCacheInfo,
            string.Format("Address:{0}", address),
            () => EmailAddressDAL.Get(address),
            Get
        );
    }

    public static EmailAddress GetOrCreate(string address)
    {
        return EntityHelper.GetOrCreateEntityWithRemoteCache<int, EmailAddress>(
            EntityCacheInfo,
            string.Format("Address:{0}", address),
            () => DoGetOrCreate(address),
            Get
        );
    }

    private static EmailAddress DoGetOrCreate(string address)
    {
        return EntityHelper.DoGetOrCreate<int, EmailAddressDAL, EmailAddress>(
            () => EmailAddressDAL.GetOrCreate(address)
        );
    }

    public static ICollection<EmailAddress> GetBlacklistedEmailAddressesPaged(long startRowIndex, long maximumRows)
    {
        var collectionId = "GetBlacklistedEmailAddressesPaged";

        return EntityHelper.GetEntityCollection<EmailAddress, int>(
            EntityCacheInfo,
            CacheManager.UnqualifiedNonExpiringCachePolicy,
            collectionId,
            () =>
            {
                return EmailAddressDAL.GetBlacklistedEmailAddressIDsPaged(
                    startRowIndex,
                    maximumRows
                );
            },
            Get
        );
    }

    public static int GetTotalNumberOfBlacklistedEmailAddresses()
    {
        var countId = "GetTotalNumberOfBlacklistedEmailAddresses";

        return EntityHelper.GetEntityCount<int>(
            EntityCacheInfo,
            CacheManager.UnqualifiedNonExpiringCachePolicy,
            countId,
            () => EmailAddressDAL.GetTotalNumberOfBlacklistedEmailAddresses()
        );
    }

    public static ICollection<EmailAddress> MultiGet(IEnumerable<int> ids)
    {
        if (ids == null) throw new ArgumentNullException(nameof(ids));
        if (!ids.Any()) return Array.Empty<EmailAddress>();

        return EntityHelper.GetEntitiesByIds<EmailAddress, EmailAddressDAL, int>(
            EntityCacheInfo,
            ids.Distinct().ToList(),
            EmailAddressDAL.MultiGet
        ).ToList();
    }

    #region IRobloxEntity Members

    /// <inheritdoc cref="IRobloxEntity{TIndex, TDal}.Construct(TDal)"/>
    public void Construct(EmailAddressDAL dal)
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
        typeof(EmailAddress).ToString(),
        true,
    );

    /// <inheritdoc cref="ICacheableObject.BuildEntityIDLookups"/>
    public IEnumerable<string> BuildEntityIDLookups()
    {
        yield return string.Format("Address:{0}", Address);
        yield break;
    }

    /// <inheritdoc cref="ICacheableObject.BuildStateTokenCollection"/>
    public IEnumerable<StateToken> BuildStateTokenCollection()
    {
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