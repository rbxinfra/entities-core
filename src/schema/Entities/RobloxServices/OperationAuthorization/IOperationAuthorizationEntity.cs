namespace Roblox.Api.ControlPlane;

using System;

using Roblox.Entities;

internal interface IOperationAuthorizationEntity : IUpdateableEntity<int>
{
    /// <summary>
    /// Gets the operation of the operation authorization
    /// </summary>
    int OperationId { get; set; }

    /// <summary>
    /// Gets the api client of the operation authorization
    /// </summary>
    int ApiClientId { get; set; }

    /// <summary>
    /// Gets the authorization type of the operation authorization
    /// </summary>
    byte AuthorizationTypeId { get; set; }

}