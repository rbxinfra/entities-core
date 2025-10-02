namespace Roblox.Platform.IpAddresses.Entities;

using System;

using Roblox.Entities;

internal interface IMACAddressEntity : IUpdateableEntity<long>
{
    /// <summary>
    /// Gets the value of MAC address
    /// </summary>
    string Macaddress { get; set; }

    /// <summary>
    /// Gets the state of the IP address
    /// </summary>
    byte State { get; set; }

    /// <summary>
    /// The expiration date of the IP address
    /// </summary>
    DateTime? Expiration { get; set; }

}