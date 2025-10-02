namespace Roblox.Api.ControlPlane;

using System;

using Roblox.Entities;

internal interface IOperationEntity : IUpdateableEntity<int>
{
    /// <summary>
    /// Gets the name of the operation
    /// </summary>
    string Name { get; set; }

    /// <summary>
    /// Gets the service of the operation
    /// </summary>
    int ServiceId { get; set; }

    /// <summary>
    /// Gets the status type of the operation
    /// </summary>
    byte StatusTypeId { get; set; }

}