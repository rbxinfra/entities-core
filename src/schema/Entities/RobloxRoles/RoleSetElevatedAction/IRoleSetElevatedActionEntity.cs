namespace Roblox.Web.ElevatedActions.BLL;

using System;

using Roblox.Entities;

internal interface IRoleSetElevatedActionEntity : IUpdateableEntity<int>
{
    /// <summary>
    /// Gets the id of the role set
    /// </summary>
    int RoleSetId { get; set; }

    /// <summary>
    /// Gets the id of the elevated action
    /// </summary>
    int ElevatedActionId { get; set; }

}