namespace Roblox.SystemEvents.Entities;

using System;

using Roblox.Entities;

internal class EventEntity : IEventEntity
{
    /// <inheritdoc cref="IEntity{TId}.Id" />
    public long Id { get; set; }
    /// <inheritdoc cref="IEventEntity.EventTypeId" />
    public int EventTypeId { get; set; }

    /// <inheritdoc cref="IEventEntity.EventSubtypeId" />
    public int? EventSubtypeId { get; set; }

    /// <inheritdoc cref="IEventEntity.EventSummaryId" />
    public long EventSummaryId { get; set; }

    /// <inheritdoc cref="IEntity{TId}.Created" />
    public DateTime Created { get; set; }

    /// <inheritdoc cref="IEntity{TId}.Delete" />
    public void Delete()
    {
        var cal = Event.Get(Id) ?? throw new InvalidOperationException("Attempted delete on unpersisted entity.");
        cal.Delete();
    }
}