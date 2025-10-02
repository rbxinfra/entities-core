namespace Roblox.Platform.Agents.Entities;

using System;
using System.Linq;
using System.Collections.Generic;

using Roblox.Data;
using Roblox.Caching;
using Roblox.Data.Interfaces;
using Roblox.Caching.Interfaces;

internal class Agent : IRobloxEntity<long, AgentDAL>
{
    private AgentDAL _EntityDAL;

    /// <inheritdoc cref="ICacheableObject{TIndex}.ID"/>
    public long ID
    {
        get { return _EntityDAL.ID; }
    }

    public byte AgentTypeID
    {
        get { return _EntityDAL.AgentTypeID; }
        set { _EntityDAL.AgentTypeID = value; }
    }

    public long AgentTargetID
    {
        get { return _EntityDAL.AgentTargetID; }
        set { _EntityDAL.AgentTargetID = value; }
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

    public Agent()
    { 
        _EntityDAL = new AgentDAL();
    }
    internal static Agent CreateNew(byte agentTypeID, long agentTargetID)
    {
        var entity = new Agent();
        entity.AgentTypeID = agentTypeID;
        entity.AgentTargetID = agentTargetID;

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

    internal static Agent Get(long id)
    {
        return EntityHelper.GetEntity<long, AgentDAL, Agent>(
            EntityCacheInfo, 
            id, 
            () => AgentDAL.Get(id)
        );
    }

    public static Agent GetByAgentTypeIDAndAgentTargetID(byte agentTypeID, long agentTargetID)
    {
        return EntityHelper.GetEntityByLookup<long, AgentDAL, Agent>(
            EntityCacheInfo,
            string.Format("AgentTypeID:{0}_AgentTargetID:{1}", agentTypeID, agentTargetID),
            () => AgentDAL.GetByAgentTypeIDAndAgentTargetID(agentTypeID, agentTargetID)
        );
    }

    #region IRobloxEntity Members

    /// <inheritdoc cref="IRobloxEntity{TIndex, TDal}.Construct(TDal)"/>
    public void Construct(AgentDAL dal)
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
        typeof(Agent).ToString(),
        true
    );

    /// <inheritdoc cref="ICacheableObject.BuildEntityIDLookups"/>
    public IEnumerable<string> BuildEntityIDLookups()
    {
        yield return string.Format("AgentTypeID:{0}_AgentTargetID:{1}", AgentTypeID, AgentTargetID);
        yield break;
    }

    /// <inheritdoc cref="ICacheableObject.BuildStateTokenCollection"/>
    public IEnumerable<StateToken> BuildStateTokenCollection()
    {
        yield break;
    }

    #endregion ICacheableObject Members
}