namespace Roblox.Platform.Passwords.Entities;

using System;

using Roblox.Entities;

internal interface IUserPasswordHashEntity : IUpdateableEntity<long>
{
    /// <summary>
    /// The ID of the user this hash belongs to.
    /// </summary>
    long UserId { get; set; }

    /// <summary>
    /// Is this password hash in use anymore?
    /// </summary>
    bool IsValid { get; set; }

    /// <summary>
    /// The raw hash
    /// </summary>
    string Hash { get; set; }

}