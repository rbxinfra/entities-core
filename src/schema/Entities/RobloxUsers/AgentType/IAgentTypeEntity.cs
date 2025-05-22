namespace Roblox.Platform.Agents.Entities;

using System;

using Roblox.Entities;

internal interface IAgentTypeEntity : IUpdateableEntity<byte>
{
    /// <summary>
    /// Gets the name of the agent type
    /// </summary>
    string Value { get; set; }

}