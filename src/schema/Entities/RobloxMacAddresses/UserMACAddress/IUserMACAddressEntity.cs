namespace Roblox.Platform.IpAddresses.Entities;

using System;

using Roblox.Entities;

internal interface IUserMACAddressEntity : IEntity<long>
{
    /// <summary>
    /// The user ID of the MAC address
    /// </summary>
    long UserId { get; set; }

    /// <summary>
    /// The MAC address ID of the MAC address
    /// </summary>
    long MacaddressId { get; set; }

}