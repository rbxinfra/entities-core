namespace Roblox.Platform.Moderation.Entities;

using System;
using System.Linq;
using System.Collections.Generic;

using Roblox.Data;
using Roblox.Caching;
using Roblox.Data.Interfaces;
using Roblox.Caching.Interfaces;

internal class UserStatus : IRobloxEntity<byte, UserStatusDAL>
{
    private UserStatusDAL _EntityDAL;

    /// <inheritdoc cref="ICacheableObject{TIndex}.ID"/>
    public byte ID
    {
        get { return _EntityDAL.ID; }
    }

    public string Value
    {
        get { return _EntityDAL.Value; }
        set { _EntityDAL.Value = value; }
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

    public static readonly byte OkID;
    public const string OkValue = "Ok";

    public static readonly byte SuppressedID;
    public const string SuppressedValue = "Suppressed";

    public static readonly byte DeletedID;
    public const string DeletedValue = "Deleted";

    public static readonly byte PoisonedID;
    public const string PoisonedValue = "Poisoned";

    public static readonly byte ForgottenID;
    public const string ForgottenValue = "Forgotten";

    static UserStatus()
    {
        OkID = GetOrCreate(OkValue).ID;
        SuppressedID = GetOrCreate(SuppressedValue).ID;
        DeletedID = GetOrCreate(DeletedValue).ID;
        PoisonedID = GetOrCreate(PoisonedValue).ID;
        ForgottenID = GetOrCreate(ForgottenValue).ID;
    }

    public UserStatus()
    { 
        _EntityDAL = new UserStatusDAL();
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

    internal static UserStatus Get(byte id)
    {
        return EntityHelper.GetEntity<byte, UserStatusDAL, UserStatus>(
            EntityCacheInfo, 
            id, 
            () => UserStatusDAL.Get(id)
        );
    }

    public static UserStatus GetByValue(string value)
    {
        return EntityHelper.GetEntityByLookup<byte, UserStatusDAL, UserStatus>(
            EntityCacheInfo,
            string.Format("Value:{0}", value),
            () => UserStatusDAL.GetByValue(value)
        );
    }

    public static UserStatus GetOrCreate(string value)
    {
        return EntityHelper.GetOrCreateEntity<byte, UserStatus>(
            EntityCacheInfo,
            string.Format("Value:{0}", value),
            () => DoGetOrCreate(value)
        );
    }

    private static UserStatus DoGetOrCreate(string value)
    {
        return EntityHelper.DoGetOrCreate<byte, UserStatusDAL, UserStatus>(
            () => UserStatusDAL.GetOrCreate(value)
        );
    }

    #region IRobloxEntity Members

    /// <inheritdoc cref="IRobloxEntity{TIndex, TDal}.Construct(TDal)"/>
    public void Construct(UserStatusDAL dal)
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
        typeof(UserStatus).ToString(),
        true
    );

    /// <inheritdoc cref="ICacheableObject.BuildEntityIDLookups"/>
    public IEnumerable<string> BuildEntityIDLookups()
    {
        yield return string.Format("Value:{0}", Value);
        yield break;
    }

    /// <inheritdoc cref="ICacheableObject.BuildStateTokenCollection"/>
    public IEnumerable<StateToken> BuildStateTokenCollection()
    {
        yield break;
    }

    #endregion ICacheableObject Members
}