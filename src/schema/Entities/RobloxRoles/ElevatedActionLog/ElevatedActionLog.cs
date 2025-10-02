namespace Roblox.Web.ElevatedActions.BLL;

using System;
using System.Linq;
using System.Collections.Generic;

using Roblox.Data;
using Roblox.Caching;
using Roblox.Data.Interfaces;
using Roblox.Caching.Interfaces;

using Roblox.Web.ElevatedActions.DAL;

internal class ElevatedActionLog : IRobloxEntity<int, ElevatedActionLogDAL>
{
    private ElevatedActionLogDAL _EntityDAL;

    /// <inheritdoc cref="ICacheableObject{TIndex}.ID"/>
    public int ID
    {
        get { return _EntityDAL.ID; }
    }

    public int ElevatedActionID
    {
        get { return _EntityDAL.ElevatedActionID; }
        set { _EntityDAL.ElevatedActionID = value; }
    }

    public long UserID
    {
        get { return _EntityDAL.UserID; }
        set { _EntityDAL.UserID = value; }
    }

    public int RoleSetID
    {
        get { return _EntityDAL.RoleSetID; }
        set { _EntityDAL.RoleSetID = value; }
    }

    public string LogData
    {
        get { return _EntityDAL.LogData; }
        set { _EntityDAL.LogData = value; }
    }

    public bool Success
    {
        get { return _EntityDAL.Success; }
        set { _EntityDAL.Success = value; }
    }

    public string IpAddress
    {
        get { return _EntityDAL.IpAddress; }
        set { _EntityDAL.IpAddress = value; }
    }

    public long BrowserTrackerID
    {
        get { return _EntityDAL.BrowserTrackerID; }
        set { _EntityDAL.BrowserTrackerID = value; }
    }

    public DateTime Created
    {
        get { return _EntityDAL.Created; }
    }

    public DateTime Updated
    {
        get { return _EntityDAL.Updated; }
    }

    public ElevatedActionLog()
    { 
        _EntityDAL = new ElevatedActionLogDAL();
    }
    internal static ElevatedActionLog CreateNew(int elevatedActionID, long userID, int roleSetID, string logData, bool success, string ipAddress, long browserTrackerID)
    {
        var entity = new ElevatedActionLog();
        entity.ElevatedActionID = elevatedActionID;
        entity.UserID = userID;
        entity.RoleSetID = roleSetID;
        entity.LogData = logData;
        entity.Success = success;
        entity.IpAddress = ipAddress;
        entity.BrowserTrackerID = browserTrackerID;

        entity.Save();

        return entity;
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

    internal static ElevatedActionLog Get(int id)
    {
        return EntityHelper.GetEntity<int, ElevatedActionLogDAL, ElevatedActionLog>(
            EntityCacheInfo, 
            id, 
            () => ElevatedActionLogDAL.Get(id)
        );
    }

    #region IRobloxEntity Members

    /// <inheritdoc cref="IRobloxEntity{TIndex, TDal}.Construct(TDal)"/>
    public void Construct(ElevatedActionLogDAL dal)
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
        typeof(ElevatedActionLog).ToString(),
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
        yield break;
    }

    #endregion ICacheableObject Members
}