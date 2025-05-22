namespace Roblox;

using System;
using System.Linq;
using System.Collections.Generic;

using Roblox.Data;
using Roblox.Caching;
using Roblox.Data.Interfaces;
using Roblox.Caching.Interfaces;

internal class TestEnum : IRobloxEntity<byte, TestEnumDAL>, IRemoteCacheableObject
{
    private TestEnumDAL _EntityDAL;

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
    }

    public DateTime Updated
    {
        get { return _EntityDAL.Updated; }
    }

    public static readonly byte Test1ID;
    public const string Test1Value = "Test1";

    public static readonly byte Test2ID;
    public const string Test2Value = "Test2";

    public static readonly byte Test3ID;
    public const string Test3Value = "Test3";

    static TestEnum()
    {
        Test1ID = GetOrCreate(Test1Value).ID;
        Test2ID = GetOrCreate(Test2Value).ID;
        Test3ID = GetOrCreate(Test3Value).ID;
    }

    public TestEnum()
    { 
        _EntityDAL = new TestEnumDAL();
    }

    internal TestEnum(TestEnumDAL dal)
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

    internal static TestEnum Get(byte id)
    {
        return EntityHelper.GetEntity<byte, TestEnumDAL, TestEnum>(
            EntityCacheInfo, 
            id, 
            () => TestEnumDAL.Get(id)
        );
    }

    public static TestEnum GetByValue(string value)
    {
        return EntityHelper.GetEntityByLookupWithRemoteCache<byte, TestEnumDAL, TestEnum>(
            EntityCacheInfo,
            string.Format("Value:{0}", value),
            () => TestEnumDAL.GetByValue(value),
            Get
        );
    }

    public static TestEnum MustGet(string value)
    {
        var entity = GetByValue(value);
        if (entity == null) throw new DataIntegrityException("Unable to load TestEnum");

        return entity;
    }

    public static TestEnum GetOrCreate(string value)
    {
        return EntityHelper.GetOrCreateEntityWithRemoteCache<byte, TestEnum>(
            EntityCacheInfo,
            string.Format("Value:{0}", value),
            () => DoGetOrCreate(value),
            Get
        );
    }

    private static TestEnum DoGetOrCreate(string value)
    {
        return EntityHelper.DoGetOrCreate<byte, TestEnumDAL, TestEnum>(
            () => TestEnumDAL.GetOrCreateTestEnum(value)
        );
    }

    #region IRobloxEntity Members

    /// <inheritdoc cref="IRobloxEntity{TIndex, TDal}.Construct(TDal)"/>
    public void Construct(TestEnumDAL dal)
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
        typeof(TestEnum).ToString(),
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

    #region IRemoteCacheableObject Members

    /// <inheritdoc cref="IRemoteCacheableObject.GetSerializable"/>
    public object GetSerializable()
    {
        return _EntityDAL;
    }

    #endregion IRemoteCacheableObject Members
}