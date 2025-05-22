namespace Roblox.Api.ControlPlane;

using System;

using Roblox.Entities;

internal interface IServiceEntity : IUpdateableEntity<int>
{
    /// <summary>
    /// Gets the name of the service
    /// </summary>
    string Name { get; set; }

    /// <summary>
    /// Gets the status type of the service
    /// </summary>
    byte StatusTypeId { get; set; }

}