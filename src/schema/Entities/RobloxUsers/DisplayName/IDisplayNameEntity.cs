namespace Roblox.Platform.Membership.Entities;

using System;

using Roblox.Entities;

internal interface IDisplayNameEntity : IUpdateableEntity<long>
{
    /// <summary>
    /// The name of the user.
    /// </summary>
    string Name { get; set; }

}