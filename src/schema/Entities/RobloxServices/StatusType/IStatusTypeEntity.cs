namespace Roblox.Api.ControlPlane;

using System;

using Roblox.Entities;

internal interface IStatusTypeEntity : IUpdateableEntity<byte>
{
    /// <summary>
    /// Gets the name of the status type
    /// </summary>
    string Value { get; set; }

}