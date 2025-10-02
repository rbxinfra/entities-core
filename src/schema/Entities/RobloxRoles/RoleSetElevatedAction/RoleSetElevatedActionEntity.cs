namespace Roblox.Web.ElevatedActions.BLL;

using System;

using Roblox.Entities;

internal class RoleSetElevatedActionEntity : IRoleSetElevatedActionEntity
{
    /// <inheritdoc cref="IEntity{TId}.Id" />
    public int Id { get; set; }
    /// <inheritdoc cref="IRoleSetElevatedActionEntity.RoleSetId" />
    public int RoleSetId { get; set; }

    /// <inheritdoc cref="IRoleSetElevatedActionEntity.ElevatedActionId" />
    public int ElevatedActionId { get; set; }

    /// <inheritdoc cref="IEntity{TId}.Created" />
    public DateTime Created { get; set; }

    /// <inheritdoc cref="IUpdateableEntity{T}.Updated" />
    public DateTime Updated { get; set; }

    /// <inheritdoc cref="IUpdateableEntity{T}.Update" />
    public void Update()
    {
        var cal = RoleSetElevatedAction.Get(Id) ?? throw new InvalidOperationException("Attempted update on unpersisted entity.");
        cal.RoleSetID = RoleSetId;
        cal.ElevatedActionID = ElevatedActionId;

        cal.Save();

        Updated = cal.Updated;
    }

    /// <inheritdoc cref="IEntity{TId}.Delete" />
    public void Delete()
    {
        var cal = RoleSetElevatedAction.Get(Id) ?? throw new InvalidOperationException("Attempted delete on unpersisted entity.");
        cal.Delete();
    }
}