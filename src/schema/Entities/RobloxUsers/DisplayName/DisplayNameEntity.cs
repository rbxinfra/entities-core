namespace Roblox.Platform.Membership.Entities;

using System;

using Roblox.Entities;

internal class DisplayNameEntity : IDisplayNameEntity
{
    /// <inheritdoc cref="IEntity{TId}.Id" />
    public long Id { get; set; }
    /// <inheritdoc cref="IDisplayNameEntity.Name" />
    public string Name { get; set; }

    /// <inheritdoc cref="IEntity{TId}.Created" />
    public DateTime Created { get; set; }

    /// <inheritdoc cref="IUpdateableEntity{T}.Updated" />
    public DateTime Updated { get; set; }

    /// <inheritdoc cref="IUpdateableEntity{T}.Update" />
    public void Update()
    {
        var cal = DisplayName.Get(Id) ?? throw new InvalidOperationException("Attempted update on unpersisted entity.");
        cal.Name = Name;

        cal.Save();

        Updated = cal.Updated ?? DateTime.Now;
    }

    /// <inheritdoc cref="IEntity{TId}.Delete" />
    public void Delete()
    {
        var cal = DisplayName.Get(Id) ?? throw new InvalidOperationException("Attempted delete on unpersisted entity.");
        cal.Delete();
    }
}