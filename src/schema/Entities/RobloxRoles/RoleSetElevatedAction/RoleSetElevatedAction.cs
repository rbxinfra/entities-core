namespace Roblox.Web.ElevatedActions.BLL;

using System;
using System.Linq;
using System.Collections.Generic;

using Roblox.Data;
using Roblox.Caching;
using Roblox.Data.Interfaces;
using Roblox.Caching.Interfaces;

using Roblox.Web.ElevatedActions.DAL;

internal class RoleSetElevatedAction : IRobloxEntity<int, RoleSetElevatedActionDAL>
{
    private RoleSetElevatedActionDAL _EntityDAL;

    /// <inheritdoc cref="ICacheableObject{TIndex}.ID"/>
    public int ID
    {
        get { return _EntityDAL.ID; }
    }

    public int RoleSetID
    {
        get { return _EntityDAL.RoleSetID; }
        set { _EntityDAL.RoleSetID = value; }
    }

    public int ElevatedActionID
    {
        get { return _EntityDAL.ElevatedActionID; }
        set { _EntityDAL.ElevatedActionID = value; }
    }

    public DateTime Created
    {
        get { return _EntityDAL.Created; }
    }

    public DateTime Updated
    {
        get { return _EntityDAL.Updated; }
    }

    public RoleSetElevatedAction()
    { 
        _EntityDAL = new RoleSetElevatedActionDAL();
    }
    internal static RoleSetElevatedAction CreateNew(int roleSetID, int elevatedActionID)
    {
        var entity = new RoleSetElevatedAction();
        entity.RoleSetID = roleSetID;
        entity.ElevatedActionID = elevatedActionID;

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

    internal static RoleSetElevatedAction Get(int id)
    {
        return EntityHelper.GetEntity<int, RoleSetElevatedActionDAL, RoleSetElevatedAction>(
            EntityCacheInfo, 
            id, 
            () => RoleSetElevatedActionDAL.Get(id)
        );
    }

    public static RoleSetElevatedAction Get(int roleSetID, int elevatedActionID)
    {
        return EntityHelper.GetEntityByLookup<int, RoleSetElevatedActionDAL, RoleSetElevatedAction>(
            EntityCacheInfo,
            string.Format("RoleSetID:{0}_ElevatedActionID:{1}", roleSetID, elevatedActionID),
            () => RoleSetElevatedActionDAL.Get(roleSetID, elevatedActionID)
        );
    }

    public static ICollection<RoleSetElevatedAction> GetRoleSetElevatedActionsByRoleSetID(int roleSetID)
    {
        var collectionId = string.Format("GetRoleSetElevatedActionsByRoleSetID_RoleSetID:{0}", roleSetID);

        return EntityHelper.GetEntityCollection<RoleSetElevatedAction, int>(
            EntityCacheInfo,
            new CacheManager.CachePolicy(
                CacheManager.CacheScopeFilter.Qualified,
                string.Format("RoleSetID:{0}", roleSetID)
            ),
            collectionId,
            () => RoleSetElevatedActionDAL.GetRoleSetElevatedActionIDsByRoleSetID(roleSetID),
            Get
        );
    }

    #region IRobloxEntity Members

    /// <inheritdoc cref="IRobloxEntity{TIndex, TDal}.Construct(TDal)"/>
    public void Construct(RoleSetElevatedActionDAL dal)
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
        typeof(RoleSetElevatedAction).ToString(),
        true
    );

    /// <inheritdoc cref="ICacheableObject.BuildEntityIDLookups"/>
    public IEnumerable<string> BuildEntityIDLookups()
    {
        yield return string.Format("RoleSetID:{0}_ElevatedActionID:{1}", RoleSetID, ElevatedActionID);
        yield break;
    }

    /// <inheritdoc cref="ICacheableObject.BuildStateTokenCollection"/>
    public IEnumerable<StateToken> BuildStateTokenCollection()
    {
        yield return new StateToken(string.Format("RoleSetID:{0}", RoleSetID));
        yield break;
    }

    #endregion ICacheableObject Members
}