namespace Roblox.Api.ControlPlane;

using System;

using Roblox.Entities;

internal interface IApiClientEntity : IUpdateableEntity<int>
{
    /// <summary>
    /// Gets the key of the api client
    /// </summary>
    Guid ApiKey { get; set; }

    /// <summary>
    /// Gets the note of the api client
    /// </summary>
    string Note { get; set; }

    /// <summary>
    /// Gets the status type of the api client
    /// </summary>
    byte StatusTypeId { get; set; }

}