namespace Roblox.SystemEvents.Entities;

using System;

using Roblox.Entities;

internal interface IEventSummaryEntity : IUpdateableEntity<long>
{
    /// <summary>
    /// Gets the hash of the event summary
    /// </summary>
    string Hash { get; set; }

    /// <summary>
    /// Gets the value of the event summary
    /// </summary>
    string Value { get; set; }

}