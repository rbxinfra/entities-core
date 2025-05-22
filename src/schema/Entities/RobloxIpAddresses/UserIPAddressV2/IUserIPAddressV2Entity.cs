namespace Roblox.Platform.IpAddresses.Entities;

using System;

using Roblox.Entities;

internal interface IUserIPAddressV2Entity : IEntity<long>
{
    /// <summary>
    /// The user ID of the IP address
    /// </summary>
    long UserId { get; set; }

    /// <summary>
    /// The IP address ID of the IP address
    /// </summary>
    long IpaddressId { get; set; }

    /// <summary>
    /// Gets the state of the IP address
    /// </summary>
    byte State { get; set; }

    /// <summary>
    /// The last seen date of the IP address
    /// </summary>
    DateTime? LastSeen { get; set; }

}