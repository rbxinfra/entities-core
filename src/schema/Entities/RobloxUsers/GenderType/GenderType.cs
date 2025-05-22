namespace Roblox.Platform.Membership.Entities;

using System;
using System.Linq;
using System.Collections.Generic;

using Roblox.Data;
using Roblox.Caching;
using Roblox.Data.Interfaces;
using Roblox.Caching.Interfaces;

internal class GenderType : IRobloxEntity<byte, GenderTypeDAL>
{
    private GenderTypeDAL _EntityDAL;

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

    public static readonly byte UnknownID;
    public const string UnknownValue = "Unknown";

    public static readonly byte MaleID;
    public const string MaleValue = "Male";

    public static readonly byte FemaleID;
    public const string FemaleValue = "Female";

    static GenderType()
    {
        UnknownID = GetOrCreate(UnknownValue).ID;
        MaleID = GetOrCreate(MaleValue).ID;
        FemaleID = GetOrCreate(FemaleValue).ID;
    }

    public GenderType()
    { 
        _EntityDAL = new GenderTypeDAL();
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

    internal static GenderType Get(byte id)
    {
        return EntityHelper.GetEntity<byte, GenderTypeDAL, GenderType>(
            EntityCacheInfo, 
            id, 
            () => GenderTypeDAL.Get(id)
        );
    }

    public static GenderType GetByValue(string value)
    {
        return EntityHelper.GetEntityByLookup<byte, GenderTypeDAL, GenderType>(
            EntityCacheInfo,
            string.Format("Value:{0}", value),
            () => GenderTypeDAL.GetByValue(value)
        );
    }

    public static GenderType GetOrCreate(string value)
    {
        return EntityHelper.GetOrCreateEntity<byte, GenderType>(
            EntityCacheInfo,
            string.Format("Value:{0}", value),
            () => DoGetOrCreate(value)
        );
    }

    private static GenderType DoGetOrCreate(string value)
    {
        return EntityHelper.DoGetOrCreate<byte, GenderTypeDAL, GenderType>(
            () => GenderTypeDAL.GetOrCreate(value)
        );
    }

    #region IRobloxEntity Members

    /// <inheritdoc cref="IRobloxEntity{TIndex, TDal}.Construct(TDal)"/>
    public void Construct(GenderTypeDAL dal)
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
        typeof(GenderType).ToString(),
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