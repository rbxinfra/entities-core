namespace Roblox.Platform.Moderation.Entities;

using System;

using Roblox.Entities;

internal class UserStatusEntity : IUserStatusEntity
{
    /// <inheritdoc cref="IEntity{TId}.Id" />
    public byte Id { get; set; }
    /// <inheritdoc cref="IUserStatusEntity.Value" />
    public string Value { get; set; }

    /// <inheritdoc cref="IEntity{TId}.Created" />
    public DateTime Created { get; set; }

    /// <inheritdoc cref="IUpdateableEntity{T}.Updated" />
    public DateTime Updated { get; set; }

    /// <inheritdoc cref="IUpdateableEntity{T}.Update" />
    public void Update()
    {
        var cal = UserStatus.Get(Id) ?? throw new InvalidOperationException("Attempted update on unpersisted entity.");
        cal.Value = Value;

        cal.Save();

        Updated = cal.Updated ?? DateTime.Now;
    }

    /// <inheritdoc cref="IEntity{TId}.Delete" />
    public void Delete()
    {
        var cal = UserStatus.Get(Id) ?? throw new InvalidOperationException("Attempted delete on unpersisted entity.");
        cal.Delete();
    }
}