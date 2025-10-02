namespace Roblox.Platform.Passwords.Entities;

using System;

using Roblox.Entities;

internal interface IUsersNeedingPasswordResetEntity : IUpdateableEntity<long>
{
    /// <summary>
    /// The ID of the user.
    /// </summary>
    long UserId { get; set; }

}