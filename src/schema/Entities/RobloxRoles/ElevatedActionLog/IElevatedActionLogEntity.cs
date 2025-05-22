namespace Roblox.Web.ElevatedActions.BLL;

using System;

using Roblox.Entities;

internal interface IElevatedActionLogEntity : IUpdateableEntity<int>
{
    /// <summary>
    /// Gets the id of the elevated action
    /// </summary>
    int ElevatedActionId { get; set; }

    /// <summary>
    /// Gets the id of the user
    /// </summary>
    long UserId { get; set; }

    /// <summary>
    /// Gets the id of the role set
    /// </summary>
    int RoleSetId { get; set; }

    /// <summary>
    /// Gets the data of the elevated action log
    /// </summary>
    string LogData { get; set; }

    /// <summary>
    /// Was the log a success
    /// </summary>
    bool Success { get; set; }

    /// <summary>
    /// Gets the ip address of the elevated action log
    /// </summary>
    string IpAddress { get; set; }

    /// <summary>
    /// Gets the id of the browser tracker
    /// </summary>
    long BrowserTrackerId { get; set; }

}