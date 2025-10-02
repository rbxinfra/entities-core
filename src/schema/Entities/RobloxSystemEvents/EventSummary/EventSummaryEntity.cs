namespace Roblox.SystemEvents.Entities;

using System;

using Roblox.Entities;

internal class EventSummaryEntity : IEventSummaryEntity
{
    /// <inheritdoc cref="IEntity{TId}.Id" />
    public long Id { get; set; }
    /// <inheritdoc cref="IEventSummaryEntity.Hash" />
    public string Hash { get; set; }

    /// <inheritdoc cref="IEventSummaryEntity.Value" />
    public string Value { get; set; }

    /// <inheritdoc cref="IEntity{TId}.Created" />
    public DateTime Created { get; set; }

    /// <inheritdoc cref="IUpdateableEntity{T}.Updated" />
    public DateTime Updated { get; set; }

    /// <inheritdoc cref="IUpdateableEntity{T}.Update" />
    public void Update()
    {
        var cal = EventSummary.Get(Id) ?? throw new InvalidOperationException("Attempted update on unpersisted entity.");
        cal.Hash = Hash;
        cal.Value = Value;

        cal.Save();

        Updated = cal.Updated;
    }

    /// <inheritdoc cref="IEntity{TId}.Delete" />
    public void Delete()
    {
        var cal = EventSummary.Get(Id) ?? throw new InvalidOperationException("Attempted delete on unpersisted entity.");
        cal.Delete();
    }
}