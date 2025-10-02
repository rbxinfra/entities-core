namespace Roblox.SystemEvents.Entities;

using System;

using Roblox.Entities;

internal interface IEventSubtypeEntity : IUpdateableEntity<int>
{
    /// <summary>
    /// Gets the value of the event sub type
    /// </summary>
    string Value { get; set; }

}