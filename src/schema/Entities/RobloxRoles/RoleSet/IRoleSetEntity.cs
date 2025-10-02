namespace Roblox.Platform.Membership.Entities;

using System;

using Roblox.Entities;

internal interface IRoleSetEntity : IUpdateableEntity<int>
{
    /// <summary>
    /// Gets the name of the role set
    /// </summary>
    string Name { get; set; }

    /// <summary>
    /// Gets the rank of the role set
    /// </summary>
    int Rank { get; set; }

}