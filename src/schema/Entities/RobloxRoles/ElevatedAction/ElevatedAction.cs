namespace Roblox.Web.ElevatedActions.BLL;

using System;
using System.Linq;
using System.Collections.Generic;

using Roblox.Data;
using Roblox.Caching;
using Roblox.Data.Interfaces;
using Roblox.Caching.Interfaces;

using Roblox.Web.ElevatedActions.DAL;

internal class ElevatedAction : IRobloxEntity<int, ElevatedActionDAL>
{
    private ElevatedActionDAL _EntityDAL;

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

    public string Description
    {
        get { return _EntityDAL.Description; }
        set { _EntityDAL.Description = value; }
    }

    public DateTime Created
    {
        get { return _EntityDAL.Created; }
    }

    public DateTime Updated
    {
        get { return _EntityDAL.Updated; }
    }

    public ElevatedAction()
    { 
        _EntityDAL = new ElevatedActionDAL();
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

    internal static ElevatedAction Get(int id)
    {
        return EntityHelper.GetEntity<int, ElevatedActionDAL, ElevatedAction>(
            EntityCacheInfo, 
            id, 
            () => ElevatedActionDAL.Get(id)
        );
    }

    public static ElevatedAction Get(string name)
    {
        return EntityHelper.GetEntityByLookup<int, ElevatedActionDAL, ElevatedAction>(
            EntityCacheInfo,
            string.Format("Name:{0}", name),
            () => ElevatedActionDAL.Get(name)
        );
    }

    public static ICollection<ElevatedAction> GetAllElevatedActions()
    {
        var collectionId = "GetAllElevatedActions";

        return EntityHelper.GetEntityCollection<ElevatedAction, int>(
            EntityCacheInfo,
            CacheManager.UnqualifiedNonExpiringCachePolicy,
            collectionId,
            () => ElevatedActionDAL.GetAllElevatedActionIDs(),
            Get
        );
    }

    #region IRobloxEntity Members

    /// <inheritdoc cref="IRobloxEntity{TIndex, TDal}.Construct(TDal)"/>
    public void Construct(ElevatedActionDAL dal)
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
        typeof(ElevatedAction).ToString(),
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
}