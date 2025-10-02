namespace Roblox.Platform.Passwords.Entities;

using System;

using Roblox.Entities;

internal class UserPasswordHashEntity : IUserPasswordHashEntity
{
    /// <inheritdoc cref="IEntity{TId}.Id" />
    public long Id { get; set; }
    /// <inheritdoc cref="IUserPasswordHashEntity.UserId" />
    public long UserId { get; set; }

    /// <inheritdoc cref="IUserPasswordHashEntity.IsValid" />
    public bool IsValid { get; set; }

    /// <inheritdoc cref="IUserPasswordHashEntity.Hash" />
    public string Hash { get; set; }

    /// <inheritdoc cref="IEntity{TId}.Created" />
    public DateTime Created { get; set; }

    /// <inheritdoc cref="IUpdateableEntity{T}.Updated" />
    public DateTime Updated { get; set; }

    /// <inheritdoc cref="IUpdateableEntity{T}.Update" />
    public void Update()
    {
        var cal = UserPasswordHash.Get(Id) ?? throw new InvalidOperationException("Attempted update on unpersisted entity.");
        cal.UserID = UserId;
        cal.IsValid = IsValid;
        cal.Hash = Hash;

        cal.Save();

        Updated = cal.Updated ?? DateTime.Now;
    }

    /// <inheritdoc cref="IEntity{TId}.Delete" />
    public void Delete()
    {
        var cal = UserPasswordHash.Get(Id) ?? throw new InvalidOperationException("Attempted delete on unpersisted entity.");
        cal.Delete();
    }
}