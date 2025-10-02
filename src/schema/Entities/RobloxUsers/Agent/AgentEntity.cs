namespace Roblox.Platform.Agents.Entities;

using System;

using Roblox.Entities;

internal class AgentEntity : IAgentEntity
{
    /// <inheritdoc cref="IEntity{TId}.Id" />
    public long Id { get; set; }
    /// <inheritdoc cref="IAgentEntity.AgentTypeId" />
    public byte AgentTypeId { get; set; }

    /// <inheritdoc cref="IAgentEntity.AgentTargetId" />
    public long AgentTargetId { get; set; }

    /// <inheritdoc cref="IEntity{TId}.Created" />
    public DateTime Created { get; set; }

    /// <inheritdoc cref="IUpdateableEntity{T}.Updated" />
    public DateTime Updated { get; set; }

    /// <inheritdoc cref="IUpdateableEntity{T}.Update" />
    public void Update()
    {
        var cal = Agent.Get(Id) ?? throw new InvalidOperationException("Attempted update on unpersisted entity.");
        cal.AgentTypeID = AgentTypeId;
        cal.AgentTargetID = AgentTargetId;

        cal.Save();

        Updated = cal.Updated ?? DateTime.Now;
    }

    /// <inheritdoc cref="IEntity{TId}.Delete" />
    public void Delete()
    {
        var cal = Agent.Get(Id) ?? throw new InvalidOperationException("Attempted delete on unpersisted entity.");
        cal.Delete();
    }
}