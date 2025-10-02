namespace Roblox.SystemEvents.Entities;

using System;

using Roblox.Entities;

internal interface IEventTypeEntity : IUpdateableEntity<int>
{
    /// <summary>
    /// Gets the value of the event type
    /// </summary>
    string Value { get; set; }

}