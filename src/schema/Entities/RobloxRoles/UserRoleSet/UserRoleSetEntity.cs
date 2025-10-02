namespace Roblox.Platform.Membership.Entities;

using System;

using Roblox.Entities;

internal class UserRoleSetEntity : IUserRoleSetEntity
{
    /// <inheritdoc cref="IEntity{TId}.Id" />
    public long Id { get; set; }
    /// <inheritdoc cref="IUserRoleSetEntity.UserId" />
    public long UserId { get; set; }

    /// <inheritdoc cref="IUserRoleSetEntity.RoleSetId" />
    public int RoleSetId { get; set; }

    /// <inheritdoc cref="IEntity{TId}.Created" />
    public DateTime Created { get; set; }

    /// <inheritdoc cref="IUpdateableEntity{T}.Updated" />
    public DateTime Updated { get; set; }

    /// <inheritdoc cref="IUpdateableEntity{T}.Update" />
    public void Update()
    {
        var cal = UserRoleSet.Get(Id) ?? throw new InvalidOperationException("Attempted update on unpersisted entity.");
        cal.UserID = UserId;
        cal.RoleSetID = RoleSetId;

        cal.Save();

        Updated = cal.Updated;
    }

    /// <inheritdoc cref="IEntity{TId}.Delete" />
    public void Delete()
    {
        var cal = UserRoleSet.Get(Id) ?? throw new InvalidOperationException("Attempted delete on unpersisted entity.");
        cal.Delete();
    }
}