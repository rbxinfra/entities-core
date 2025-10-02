namespace Roblox.SystemEvents.Entities;

using System;

using Roblox.Entities;

internal interface IEventEntity : IEntity<long>
{
    /// <summary>
    /// Gets the event type of the event
    /// </summary>
    int EventTypeId { get; set; }

    /// <summary>
    /// Gets the status type of the event
    /// </summary>
    int? EventSubtypeId { get; set; }

    /// <summary>
    /// Gets the event summary of the event
    /// </summary>
    long EventSummaryId { get; set; }

}