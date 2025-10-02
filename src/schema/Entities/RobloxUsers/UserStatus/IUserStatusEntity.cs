namespace Roblox.Platform.Moderation.Entities;

using System;

using Roblox.Entities;

internal interface IUserStatusEntity : IUpdateableEntity<byte>
{
    /// <summary>
    /// Gets the name of the user status type
    /// </summary>
    string Value { get; set; }

}