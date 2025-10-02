namespace Roblox.Platform.Devices.Entities;

using System;

using Roblox.Entities;

internal interface IDeviceTypeEntity : IUpdateableEntity<byte>
{
    /// <summary>
    /// Gets the name of the device type
    /// </summary>
    string Value { get; set; }

    /// <summary>
    /// Gets the bit ordinal of the device type
    /// </summary>
    byte BitOrdinal { get; set; }

    /// <summary>
    /// Gets the bit mask of the device type
    /// </summary>
    long BitMask { get; set; }

}