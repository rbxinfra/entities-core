namespace Roblox.Platform.Agents.Entities;

using System;

using Roblox.Entities;

internal interface IAgentEntity : IUpdateableEntity<long>
{
    /// <summary>
    /// Gets the ID of the agent type
    /// </summary>
    byte AgentTypeId { get; set; }

    /// <summary>
    /// Gets the ID of the user or group
    /// </summary>
    long AgentTargetId { get; set; }

}