namespace Roblox.Platform.Membership.Entities;

using System;

using Roblox.Entities;

internal class UserEntity : IUserEntity
{
    /// <inheritdoc cref="IEntity{TId}.Id" />
    public long Id { get; set; }
    /// <inheritdoc cref="IUserEntity.Name" />
    public string Name { get; set; }

    /// <inheritdoc cref="IUserEntity.DisplayNameId" />
    public long? DisplayNameId { get; set; }

    /// <inheritdoc cref="IUserEntity.UserModerationStatusId" />
    public byte UserModerationStatusId { get; set; }

    /// <inheritdoc cref="IUserEntity.Description" />
    public string Description { get; set; }

    /// <inheritdoc cref="IUserEntity.AgeBracket" />
    public byte AgeBracket { get; set; }

    /// <inheritdoc cref="IUserEntity.AgentId" />
    public long? AgentId { get; set; }

    /// <inheritdoc cref="IUserEntity.BirthDate" />
    public DateTime? BirthDate { get; set; }

    /// <inheritdoc cref="IUserEntity.GenderTypeId" />
    public byte? GenderTypeId { get; set; }

    /// <inheritdoc cref="IEntity{TId}.Created" />
    public DateTime Created { get; set; }

    /// <inheritdoc cref="IUpdateableEntity{T}.Updated" />
    public DateTime Updated { get; set; }

    /// <inheritdoc cref="IUpdateableEntity{T}.Update" />
    public void Update()
    {
        var cal = User.Get(Id) ?? throw new InvalidOperationException("Attempted update on unpersisted entity.");
        cal.Name = Name;
        cal.DisplayNameID = DisplayNameId;
        cal.UserModerationStatusID = UserModerationStatusId;
        cal.Description = Description;
        cal.AgeBracket = AgeBracket;
        cal.AgentID = AgentId;
        cal.BirthDate = BirthDate;
        cal.GenderTypeID = GenderTypeId;

        cal.Save();

        Updated = cal.Updated ?? DateTime.Now;
    }

    /// <inheritdoc cref="IEntity{TId}.Delete" />
    public void Delete()
    {
        var cal = User.Get(Id) ?? throw new InvalidOperationException("Attempted delete on unpersisted entity.");
        cal.Delete();
    }
}