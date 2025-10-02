namespace Roblox.Platform.Email.Entities;

using System;

using Roblox.Entities;

internal class EmailAddressEntity : IEmailAddressEntity
{
    /// <inheritdoc cref="IEntity{TId}.Id" />
    public int Id { get; set; }
    /// <inheritdoc cref="IEmailAddressEntity.Address" />
    public string Address { get; set; }

    /// <inheritdoc cref="IEmailAddressEntity.IsBlacklisted" />
    public bool IsBlacklisted { get; set; }

    /// <inheritdoc cref="IEmailAddressEntity.IsApproved" />
    public bool IsApproved { get; set; }

    /// <inheritdoc cref="IEmailAddressEntity.IsReviewed" />
    public bool IsReviewed { get; set; }

    /// <inheritdoc cref="IEmailAddressEntity.Reviewed" />
    public DateTime? Reviewed { get; set; }

    /// <inheritdoc cref="IEntity{TId}.Created" />
    public DateTime Created { get; set; }

    /// <inheritdoc cref="IUpdateableEntity{T}.Updated" />
    public DateTime Updated { get; set; }

    /// <inheritdoc cref="IUpdateableEntity{T}.Update" />
    public void Update()
    {
        var cal = EmailAddress.Get(Id) ?? throw new InvalidOperationException("Attempted update on unpersisted entity.");
        cal.Address = Address;
        cal.IsBlacklisted = IsBlacklisted;
        cal.IsApproved = IsApproved;
        cal.IsReviewed = IsReviewed;
        cal.Reviewed = Reviewed;

        cal.Save();

        Updated = cal.Updated ?? DateTime.Now;
    }

    /// <inheritdoc cref="IEntity{TId}.Delete" />
    public void Delete()
    {
        var cal = EmailAddress.Get(Id) ?? throw new InvalidOperationException("Attempted delete on unpersisted entity.");
        cal.Delete();
    }
}