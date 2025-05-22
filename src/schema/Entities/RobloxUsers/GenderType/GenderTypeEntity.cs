namespace Roblox.Platform.Membership.Entities;

using System;

using Roblox.Entities;

internal class GenderTypeEntity : IGenderTypeEntity
{
    /// <inheritdoc cref="IEntity{TId}.Id" />
    public byte Id { get; set; }
    /// <inheritdoc cref="IGenderTypeEntity.Value" />
    public string Value { get; set; }

    /// <inheritdoc cref="IEntity{TId}.Created" />
    public DateTime Created { get; set; }

    /// <inheritdoc cref="IUpdateableEntity{T}.Updated" />
    public DateTime Updated { get; set; }

    /// <inheritdoc cref="IUpdateableEntity{T}.Update" />
    public void Update()
    {
        var cal = GenderType.Get(Id) ?? throw new InvalidOperationException("Attempted update on unpersisted entity.");
        cal.Value = Value;

        cal.Save();

        Updated = cal.Updated ?? DateTime.Now;
    }

    /// <inheritdoc cref="IEntity{TId}.Delete" />
    public void Delete()
    {
        var cal = GenderType.Get(Id) ?? throw new InvalidOperationException("Attempted delete on unpersisted entity.");
        cal.Delete();
    }
}