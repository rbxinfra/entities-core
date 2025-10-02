namespace Roblox;

using System;
using System.Linq;
using System.Collections.Generic;

using Roblox.Data;
using Roblox.Caching;
using Roblox.Configuration;
using Roblox.Data.Interfaces;
using Roblox.Caching.Interfaces;

using Roblox.Mssql.Tests.DAL;

internal class Test : IRobloxEntity<int, TestDAL>, IRemoteCacheableObject
{
    private TestDAL _EntityDAL;

    /// <inheritdoc cref="ICacheableObject{TIndex}.ID"/>
    public int ID
    {
        get { return _EntityDAL.ID; }
    }

    public string Name
    {
        get { return _EntityDAL.Name; }
    }

    public string Description
    {
        get { return _EntityDAL.Description; }
        set { _EntityDAL.Description = value; }
    }

    public long AccountID
    {
        get { return _EntityDAL.AccountID; }
        set { _EntityDAL.AccountID = value; }
    }

    public byte TestEnumID
    {
        get { return _EntityDAL.TestEnumID; }
        set { _EntityDAL.TestEnumID = value; }
    }

    public byte[]? RawHash
    {
        get { return _EntityDAL.RawHash; }
        set { _EntityDAL.RawHash = value; }
    }

    public DateTime Created
    {
        get { return _EntityDAL.Created; }
    }

    public DateTime Updated
    {
        get { return _EntityDAL.Updated; }
    }

    public Test()
    { 
        _EntityDAL = new TestDAL();
    }

    internal Test(TestDAL dal)
    {
        _EntityDAL = dal;
    }

    internal static Test CreateNew(string description, long accountID, byte testEnumID, byte[]? rawHash)
    {
        var entity = new Test();
        entity.Description = description;
        entity.AccountID = accountID;
        entity.TestEnumID = testEnumID;
        entity.RawHash = rawHash;

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

    internal static Test Get(int id)
    {
        return EntityHelper.GetEntity<int, TestDAL, Test>(
            EntityCacheInfo, 
            id, 
            () => TestDAL.Get(id)
        );
    }

    internal static Test MustGet(int id)
    {
        return EntityHelper.MustGet<int, Test>(
            id, 
            Get
        );
    }

    public static Test GetByName(string name)
    {
        return EntityHelper.GetEntityByLookupWithRemoteCache<int, TestDAL, Test>(
            EntityCacheInfo,
            string.Format("Name:{0}", name),
            () => TestDAL.GetByName(name),
            Get
        );
    }

    public static Test GetByAccountIDAndName(int accountID, string name)
    {
        return EntityHelper.GetEntityByLookupWithRemoteCache<int, TestDAL, Test>(
            EntityCacheInfo,
            string.Format("AccountID:{0}_Name:{1}", accountID, name),
            () => TestDAL.GetByAccountIDAndName(accountID, name),
            Get
        );
    }

    public static ICollection<Test> GetAllPaged(long startRowIndex, long maximumRows)
    {
        var collectionId = "GetAllPaged";

        return EntityHelper.GetEntityCollection<Test, int>(
            EntityCacheInfo,
            CacheManager.UnqualifiedNonExpiringCachePolicy,
            collectionId,
            () =>
            {
                return TestDAL.GetAllPaged(
                    startRowIndex,
                    maximumRows
                );
            },
            Get
        );
    }

    public static ICollection<Test> GetByNamePaged(string name, long startRowIndex, long maximumRows)
    {
        var collectionId = string.Format("GetByNamePaged_Name:{0}_StartRowIndex:{1}_MaximumRows:{2}", name, startRowIndex, maximumRows);

        return EntityHelper.GetEntityCollection<Test, int>(
            EntityCacheInfo,
            new CacheManager.CachePolicy(
                CacheManager.CacheScopeFilter.Qualified,
                string.Format("Name:{0}", name)
            ),
            collectionId,
            () =>
            {
                return TestDAL.GetByNamePaged(
                    name,
                    startRowIndex,
                    maximumRows
                );
            },
            Get
        );
    }
    public static ICollection<Test> MultiGet(ICollection<int> ids)
    {

        return EntityHelper.MultiGetEntity<int, TestDAL, Test>(
            ids,
            EntityCacheInfo,
            TestDAL.MultiGet
        ).ToList();
    }

    public static ICollection<Test> GetAll()
    {
        var collectionId = "GetAll";

        return EntityHelper.GetEntityCollection<Test, int>(
            EntityCacheInfo,
            CacheManager.UnqualifiedNonExpiringCachePolicy,
            collectionId,
            () => TestDAL.GetAll(),
            Get
        );
    }

    public static int GetTotalNumberOfTests()
    {
        var countId = "GetTotalNumberOfTests";

        return EntityHelper.GetEntityCount<int>(
            EntityCacheInfo,
            CacheManager.UnqualifiedNonExpiringCachePolicy,
            countId,
            () => TestDAL.GetTotalNumberOfTests()
        );
    }

    public static int GetTotalNumberOfTestsByAccountIDAndName(int accountID, string name)
    {
        var countId = string.Format("GetTotalNumberOfTestsByAccountIDAndName_AccountID:{0}_Name:{1}", accountID, name);

        return EntityHelper.GetEntityCount<int>(
            EntityCacheInfo,
            new CacheManager.CachePolicy(
                CacheManager.CacheScopeFilter.Qualified,
                string.Format("AccountID:{0}_Name:{1}", accountID, name)
            ),
            countId,
            () => TestDAL.GetTotalNumberOfTestsByAccountIDAndName(accountID, name)
        );
    }

    public static Test GetOrCreate(string name, int accountID, byte testEnumID)
    {
        return EntityHelper.GetOrCreateEntityWithRemoteCache<int, Test>(
            EntityCacheInfo,
            string.Format("Name:{0}_AccountID:{1}_TestEnumID:{2}", name, accountID, testEnumID),
            () => DoGetOrCreate(name, accountID, testEnumID),
            Get
        );
    }

    private static Test DoGetOrCreate(string name, int accountID, byte testEnumID)
    {
        return EntityHelper.DoGetOrCreate<int, TestDAL, Test>(
            () => TestDAL.GetOrCreate(name, accountID, testEnumID)
        );
    }

    #region IRobloxEntity Members

    /// <inheritdoc cref="IRobloxEntity{TIndex, TDal}.Construct(TDal)"/>
    public void Construct(TestDAL dal)
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
        new CacheabilitySettings(collectionsAreCacheable: false, countsAreCacheable: false, entityIsCacheable: false, idLookupsAreCacheable: false, hasUnqualifiedCollections: false, idLookupsAreCaseSensitive: false),
        typeof(Test).ToString(),
        false,
        global::Roblox.TestMigrationSettings.TestMigrationSettings.RemoteCacheableSettings
    );

    /// <inheritdoc cref="ICacheableObject.BuildEntityIDLookups"/>
    public IEnumerable<string> BuildEntityIDLookups()
    {
        yield return string.Format("Name:{0}", Name);
        yield return string.Format("AccountID:{0}_Name:{1}", AccountID, Name);
        yield return string.Format("Name:{0}_AccountID:{1}_TestEnumID:{2}", Name, AccountID, TestEnumID);
        yield break;
    }

    /// <inheritdoc cref="ICacheableObject.BuildStateTokenCollection"/>
    public IEnumerable<StateToken> BuildStateTokenCollection()
    {
        yield return new StateToken(string.Format("Name:{0}", Name));
        yield return new StateToken(string.Format("AccountID:{0}_Name:{1}", AccountID, Name));
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