namespace Roblox.Platform.Email.Entities;

using System;

using Roblox.Entities;

internal interface IEmailAddressEntity : IUpdateableEntity<int>
{
    /// <summary>
    /// Gets the address of the email
    /// </summary>
    string Address { get; set; }

    /// <summary>
    /// Determines if the email is blacklisted
    /// </summary>
    bool IsBlacklisted { get; set; }

    /// <summary>
    /// Whether this email address has been Verified by external service
    /// </summary>
    bool IsApproved { get; set; }

    /// <summary>
    /// Whether this email address is valid, as determined by external service
    /// </summary>
    bool IsReviewed { get; set; }

    /// <summary>
    /// The date this email address was reviewed
    /// </summary>
    DateTime? Reviewed { get; set; }

}