namespace Roblox.Platform.Membership.Entities;

using System;

using Roblox.Entities;

internal interface IUserNameHistoryEntity : IUpdateableEntity<long>
{
    /// <summary>
    /// The ID of the user this hash belongs to.
    /// </summary>
    long UserId { get; set; }

    /// <summary>
    /// The name of the user.
    /// </summary>
    string Name { get; set; }

}