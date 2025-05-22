namespace Roblox.Api.ControlPlane;

using System;

using Roblox.Entities;

internal interface IAuthorizationTypeEntity : IUpdateableEntity<byte>
{
    /// <summary>
    /// Gets the name of the authorization type
    /// </summary>
    string Value { get; set; }

}