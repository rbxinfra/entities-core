namespace Roblox.Platform.Membership.Entities;

using System;
using System.Linq;
using System.Collections.Generic;

using Roblox.Data;
using Roblox.Caching;
using Roblox.Data.Interfaces;
using Roblox.Caching.Interfaces;

internal class User : IRobloxEntity<long, UserDAL>, IRemoteCacheableObject
{
    private UserDAL _EntityDAL;

    /// <inheritdoc cref="ICacheableObject{TIndex}.ID"/>
    public long ID
    {
        get { return _EntityDAL.ID; }
    }

    public string Name
    {
        get { return _EntityDAL.Name; }
        set { _EntityDAL.Name = value; }
    }

    public long? DisplayNameID
    {
        get { return _EntityDAL.DisplayNameID; }
        set { _EntityDAL.DisplayNameID = value; }
    }

    public byte UserModerationStatusID
    {
        get { return _EntityDAL.UserModerationStatusID; }
        set { _EntityDAL.UserModerationStatusID = value; }
    }

    public string Description
    {
        get { return _EntityDAL.Description; }
        set { _EntityDAL.Description = value; }
    }

    public byte AgeBracket
    {
        get { return _EntityDAL.AgeBracket; }
        set { _EntityDAL.AgeBracket = value; }
    }

    public long? AgentID
    {
        get { return _EntityDAL.AgentID; }
        set { _EntityDAL.AgentID = value; }
    }

    public DateTime? BirthDate
    {
        get { return _EntityDAL.BirthDate; }
        set { _EntityDAL.BirthDate = value; }
    }

    public byte? GenderTypeID
    {
        get { return _EntityDAL.GenderTypeID; }
        set { _EntityDAL.GenderTypeID = value; }
    }

    public DateTime Created
    {
        get { return _EntityDAL.Created; }
    }

    public DateTime? Updated
    {
        get { return _EntityDAL.Updated; }
    }

    public User()
    { 
        _EntityDAL = new UserDAL();
    }

    internal User(UserDAL dal)
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

    internal static User Get(long id)
    {
        return EntityHelper.GetEntity<long, UserDAL, User>(
            EntityCacheInfo, 
            id, 
            () => UserDAL.Get(id)
        );
    }

    public static User Get(string name)
    {
        return EntityHelper.GetEntityByLookupWithRemoteCache<long, UserDAL, User>(
            EntityCacheInfo,
            string.Format("Name:{0}", name),
            () => UserDAL.GetByName(name),
            Get
        );
    }

    public static ICollection<User> MultiGet(IEnumerable<long> ids)
    {
        if (ids == null) throw new ArgumentNullException(nameof(ids));
        if (!ids.Any()) return Array.Empty<User>();

        return EntityHelper.GetEntitiesByIds<User, UserDAL, long>(
            EntityCacheInfo,
            ids.Distinct().ToList(),
            UserDAL.MultiGet
        ).ToList();
    }

    #region IRobloxEntity Members

    /// <inheritdoc cref="IRobloxEntity{TIndex, TDal}.Construct(TDal)"/>
    public void Construct(UserDAL dal)
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
        typeof(User).ToString(),
        true
    );

    /// <inheritdoc cref="ICacheableObject.BuildEntityIDLookups"/>
    public IEnumerable<string> BuildEntityIDLookups()
    {
        yield return string.Format("Name:{0}", Name);
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