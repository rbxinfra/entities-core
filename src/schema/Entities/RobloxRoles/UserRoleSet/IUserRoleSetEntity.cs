namespace Roblox.Platform.Membership.Entities;

using System;

using Roblox.Entities;

internal interface IUserRoleSetEntity : IUpdateableEntity<long>
{
    /// <summary>
    /// Gets the ID of the user
    /// </summary>
    long UserId { get; set; }

    /// <summary>
    /// Gets the ID of the role set
    /// </summary>
    int RoleSetId { get; set; }

}