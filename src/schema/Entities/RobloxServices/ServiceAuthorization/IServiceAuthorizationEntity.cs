namespace Roblox.Api.ControlPlane;

using System;

using Roblox.Entities;

internal interface IServiceAuthorizationEntity : IUpdateableEntity<int>
{
    /// <summary>
    /// Gets the service of the service authorization
    /// </summary>
    int ServiceId { get; set; }

    /// <summary>
    /// Gets the api client of the service authorization
    /// </summary>
    int ApiClientId { get; set; }

    /// <summary>
    /// Gets the authorization type of the service authorization
    /// </summary>
    byte AuthorizationTypeId { get; set; }

}