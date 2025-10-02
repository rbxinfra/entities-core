namespace Roblox.Platform.Email.User.Entities;

using System;

using Roblox.Entities;

internal class UserEmailAddressEntity : IUserEmailAddressEntity
{
    /// <inheritdoc cref="IEntity{TId}.Id" />
    public long Id { get; set; }
    /// <inheritdoc cref="IUserEmailAddressEntity.UserId" />
    public long UserId { get; set; }

    /// <inheritdoc cref="IUserEmailAddressEntity.EmailAddressId" />
    public int EmailAddressId { get; set; }

    /// <inheritdoc cref="IUserEmailAddressEntity.IsVerified" />
    public bool IsVerified { get; set; }

    /// <inheritdoc cref="IUserEmailAddressEntity.IsValid" />
    public bool IsValid { get; set; }

    /// <inheritdoc cref="IUserEmailAddressEntity.Newsletter" />
    public bool Newsletter { get; set; }

    /// <inheritdoc cref="IEntity{TId}.Created" />
    public DateTime Created { get; set; }

    /// <inheritdoc cref="IUpdateableEntity{T}.Updated" />
    public DateTime Updated { get; set; }

    /// <inheritdoc cref="IUpdateableEntity{T}.Update" />
    public void Update()
    {
        var cal = UserEmailAddress.Get(Id) ?? throw new InvalidOperationException("Attempted update on unpersisted entity.");
        cal.UserID = UserId;
        cal.EmailAddressID = EmailAddressId;
        cal.IsVerified = IsVerified;
        cal.IsValid = IsValid;
        cal.Newsletter = Newsletter;

        cal.Save();

        Updated = cal.Updated ?? DateTime.Now;
    }

    /// <inheritdoc cref="IEntity{TId}.Delete" />
    public void Delete()
    {
        var cal = UserEmailAddress.Get(Id) ?? throw new InvalidOperationException("Attempted delete on unpersisted entity.");
        cal.Delete();
    }
}