namespace Roblox.Platform.Passwords.Entities;

using System;

using Roblox.Entities;

internal class UsersNeedingPasswordResetEntity : IUsersNeedingPasswordResetEntity
{
    /// <inheritdoc cref="IEntity{TId}.Id" />
    public long Id { get; set; }
    /// <inheritdoc cref="IUsersNeedingPasswordResetEntity.UserId" />
    public long UserId { get; set; }

    /// <inheritdoc cref="IEntity{TId}.Created" />
    public DateTime Created { get; set; }

    /// <inheritdoc cref="IUpdateableEntity{T}.Updated" />
    public DateTime Updated { get; set; }

    /// <inheritdoc cref="IUpdateableEntity{T}.Update" />
    public void Update()
    {
        var cal = UsersNeedingPasswordReset.Get(Id) ?? throw new InvalidOperationException("Attempted update on unpersisted entity.");
        cal.UserID = UserId;

        cal.Save();

        Updated = cal.Updated ?? DateTime.Now;
    }

    /// <inheritdoc cref="IEntity{TId}.Delete" />
    public void Delete()
    {
        var cal = UsersNeedingPasswordReset.Get(Id) ?? throw new InvalidOperationException("Attempted delete on unpersisted entity.");
        cal.Delete();
    }
}