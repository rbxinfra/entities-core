namespace Roblox.Api.ControlPlane;

using System;
using System.Linq;
using System.Collections.Generic;

using Roblox.Data;
using Roblox.Caching;
using Roblox.Data.Interfaces;
using Roblox.Caching.Interfaces;

internal class Operation : IRobloxEntity<int, OperationDAL>
{
    private OperationDAL _EntityDAL;

    /// <inheritdoc cref="ICacheableObject{TIndex}.ID"/>
    public int ID
    {
        get { return _EntityDAL.ID; }
    }

    public string Name
    {
        get { return _EntityDAL.Name; }
        set { _EntityDAL.Name = value; }
    }

    public int ServiceID
    {
        get { return _EntityDAL.ServiceID; }
        set { _EntityDAL.ServiceID = value; }
    }

    public byte StatusTypeID
    {
        get { return _EntityDAL.StatusTypeID; }
        set { _EntityDAL.StatusTypeID = value; }
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

    public Operation()
    { 
        _EntityDAL = new OperationDAL();
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

    internal static Operation Get(int id)
    {
        return EntityHelper.GetEntity<int, OperationDAL, Operation>(
            EntityCacheInfo, 
            id, 
            () => OperationDAL.Get(id)
        );
    }

    public static Operation GetByServiceIDAndName(int serviceID, string name)
    {
        return EntityHelper.GetEntityByLookup<int, OperationDAL, Operation>(
            EntityCacheInfo,
            string.Format("ServiceID:{0}_Name:{1}", serviceID, name),
            () => OperationDAL.GetByServiceIDAndName(serviceID, name)
        );
    }

    public static int GetTotalNumberOfOperationsByServiceID(int serviceID)
    {
        var countId = string.Format("GetTotalNumberOfOperationsByServiceID_ServiceID:{0}", serviceID);

        return EntityHelper.GetEntityCount<int>(
            EntityCacheInfo,
            new CacheManager.CachePolicy(
                CacheManager.CacheScopeFilter.Qualified,
                string.Format("ServiceID:{0}", serviceID)
            ),
            countId,
            () => OperationDAL.GetTotalNumberOfOperationsByServiceID(serviceID)
        );
    }

    public static ICollection<Operation> GetOperationsByServiceID(int serviceID, long startRowIndex, long maximumRows)
    {
        var collectionId = string.Format("GetOperationsByServiceID_ServiceID:{0}_StartRowIndex:{1}_MaximumRows:{2}", serviceID, startRowIndex, maximumRows);

        return EntityHelper.GetEntityCollection<Operation, int>(
            EntityCacheInfo,
            new CacheManager.CachePolicy(
                CacheManager.CacheScopeFilter.Qualified,
                string.Format("ServiceID:{0}", serviceID)
            ),
            collectionId,
            () =>
            {
                return OperationDAL.GetOperationsByServiceID(
                    serviceID,
                    startRowIndex + 1,
                    maximumRows
                );
            },
            Get
        );
    }

    #region IRobloxEntity Members

    /// <inheritdoc cref="IRobloxEntity{TIndex, TDal}.Construct(TDal)"/>
    public void Construct(OperationDAL dal)
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
        typeof(Operation).ToString(),
        true
    );

    /// <inheritdoc cref="ICacheableObject.BuildEntityIDLookups"/>
    public IEnumerable<string> BuildEntityIDLookups()
    {
        yield return string.Format("ServiceID:{0}_Name:{1}", ServiceID, Name);
        yield break;
    }

    /// <inheritdoc cref="ICacheableObject.BuildStateTokenCollection"/>
    public IEnumerable<StateToken> BuildStateTokenCollection()
    {
        yield return new StateToken(string.Format("ServiceID:{0}", ServiceID));
        yield break;
    }

    #endregion ICacheableObject Members
}