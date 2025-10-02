namespace Roblox.Platform.Membership.Entities;

using System;

using Roblox.Entities;

internal class DisplayNameHistoryEntity : IDisplayNameHistoryEntity
{
    /// <inheritdoc cref="IEntity{TId}.Id" />
    public long Id { get; set; }
    /// <inheritdoc cref="IDisplayNameHistoryEntity.UserId" />
    public long UserId { get; set; }

    /// <inheritdoc cref="IDisplayNameHistoryEntity.DisplayNameId" />
    public long DisplayNameId { get; set; }

    /// <inheritdoc cref="IEntity{TId}.Created" />
    public DateTime Created { get; set; }

    /// <inheritdoc cref="IUpdateableEntity{T}.Updated" />
    public DateTime Updated { get; set; }

    /// <inheritdoc cref="IUpdateableEntity{T}.Update" />
    public void Update()
    {
        var cal = DisplayNameHistory.Get(Id) ?? throw new InvalidOperationException("Attempted update on unpersisted entity.");
        cal.UserID = UserId;
        cal.DisplayNameID = DisplayNameId;

        cal.Save();

        Updated = cal.Updated ?? DateTime.Now;
    }

    /// <inheritdoc cref="IEntity{TId}.Delete" />
    public void Delete()
    {
        var cal = DisplayNameHistory.Get(Id) ?? throw new InvalidOperationException("Attempted delete on unpersisted entity.");
        cal.Delete();
    }
}