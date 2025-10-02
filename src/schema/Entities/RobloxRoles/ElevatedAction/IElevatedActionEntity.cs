namespace Roblox.Web.ElevatedActions.BLL;

using System;

using Roblox.Entities;

internal interface IElevatedActionEntity : IUpdateableEntity<int>
{
    /// <summary>
    /// Gets the name of the elevated action
    /// </summary>
    string Name { get; set; }

    /// <summary>
    /// Gets the description of the elevated action
    /// </summary>
    string Description { get; set; }

}