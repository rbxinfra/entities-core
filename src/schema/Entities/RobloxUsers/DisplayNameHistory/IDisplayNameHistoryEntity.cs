namespace Roblox.Platform.Membership.Entities;

using System;

using Roblox.Entities;

internal interface IDisplayNameHistoryEntity : IUpdateableEntity<long>
{
    /// <summary>
    /// The ID of the user this hash belongs to.
    /// </summary>
    long UserId { get; set; }

    /// <summary>
    /// The ID of the displayName
    /// </summary>
    long DisplayNameId { get; set; }

}