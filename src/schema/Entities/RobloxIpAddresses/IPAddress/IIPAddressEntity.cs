namespace Roblox.Platform.IpAddresses.Entities;

using System;

using Roblox.Entities;

internal interface IIPAddressEntity : IUpdateableEntity<long>
{
    /// <summary>
    /// Gets the address of the IP address
    /// </summary>
    int Address { get; set; }

    /// <summary>
    /// Gets the value of IP address
    /// </summary>
    string Value { get; set; }

    /// <summary>
    /// Gets the state of the IP address
    /// </summary>
    byte State { get; set; }

    /// <summary>
    /// The expiration date of the IP address
    /// </summary>
    DateTime? Expiration { get; set; }

}