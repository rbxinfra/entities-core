namespace Roblox.Platform.Agents.Entities;

using System;
using System.Linq;
using System.Collections.Generic;

using Roblox.Data;
using Roblox.Caching;
using Roblox.Data.Interfaces;
using Roblox.Caching.Interfaces;

internal class AgentType : IRobloxEntity<byte, AgentTypeDAL>
{
    private AgentTypeDAL _EntityDAL;

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

    public static readonly byte UserID;
    public const string UserValue = "User";

    public static readonly byte GroupID;
    public const string GroupValue = "Group";

    static AgentType()
    {
        UserID = GetOrCreate(UserValue).ID;
        GroupID = GetOrCreate(GroupValue).ID;
    }

    public AgentType()
    { 
        _EntityDAL = new AgentTypeDAL();
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

    internal static AgentType Get(byte id)
    {
        return EntityHelper.GetEntity<byte, AgentTypeDAL, AgentType>(
            EntityCacheInfo, 
            id, 
            () => AgentTypeDAL.Get(id)
        );
    }

    public static AgentType GetByValue(string value)
    {
        return EntityHelper.GetEntityByLookup<byte, AgentTypeDAL, AgentType>(
            EntityCacheInfo,
            string.Format("Value:{0}", value),
            () => AgentTypeDAL.GetByValue(value)
        );
    }

    public static AgentType GetOrCreate(string value)
    {
        return EntityHelper.GetOrCreateEntity<byte, AgentType>(
            EntityCacheInfo,
            string.Format("Value:{0}", value),
            () => DoGetOrCreate(value)
        );
    }

    private static AgentType DoGetOrCreate(string value)
    {
        return EntityHelper.DoGetOrCreate<byte, AgentTypeDAL, AgentType>(
            () => AgentTypeDAL.GetOrCreate(value)
        );
    }

    #region IRobloxEntity Members

    /// <inheritdoc cref="IRobloxEntity{TIndex, TDal}.Construct(TDal)"/>
    public void Construct(AgentTypeDAL dal)
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
        typeof(AgentType).ToString(),
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