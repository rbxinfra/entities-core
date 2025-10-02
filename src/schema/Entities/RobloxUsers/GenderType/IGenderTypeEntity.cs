namespace Roblox.Platform.Membership.Entities;

using System;

using Roblox.Entities;

internal interface IGenderTypeEntity : IUpdateableEntity<byte>
{
    /// <summary>
    /// Gets the name of the gender type
    /// </summary>
    string Value { get; set; }

}