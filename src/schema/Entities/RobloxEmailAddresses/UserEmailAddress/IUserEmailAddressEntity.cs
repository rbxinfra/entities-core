namespace Roblox.Platform.Email.User.Entities;

using System;

using Roblox.Entities;

internal interface IUserEmailAddressEntity : IUpdateableEntity<long>
{
    /// <summary>
    /// The ID of the user this email belongs to.
    /// </summary>
    long UserId { get; set; }

    /// <summary>
    /// The ID of the email.
    /// </summary>
    int EmailAddressId { get; set; }

    /// <summary>
    /// Determines if the email is verified
    /// </summary>
    bool IsVerified { get; set; }

    /// <summary>
    /// Whether this email address is valid
    /// </summary>
    bool IsValid { get; set; }

    /// <summary>
    /// Whether this email address is part of the newsletter
    /// </summary>
    bool Newsletter { get; set; }

}