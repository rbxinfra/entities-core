namespace Roblox.Platform.Membership.Entities;

using System;

using Roblox.Entities;

internal class RoleSetEntity : IRoleSetEntity
{
    /// <inheritdoc cref="IEntity{TId}.Id" />
    public int Id { get; set; }
    /// <inheritdoc cref="IRoleSetEntity.Name" />
    public string Name { get; set; }

    /// <inheritdoc cref="IRoleSetEntity.Rank" />
    public int Rank { get; set; }

    /// <inheritdoc cref="IEntity{TId}.Created" />
    public DateTime Created { get; set; }

    /// <inheritdoc cref="IUpdateableEntity{T}.Updated" />
    public DateTime Updated { get; set; }

    /// <inheritdoc cref="IUpdateableEntity{T}.Update" />
    public void Update()
    {
        var cal = RoleSet.Get(Id) ?? throw new InvalidOperationException("Attempted update on unpersisted entity.");
        cal.Name = Name;
        cal.Rank = Rank;

        cal.Save();

        Updated = cal.Updated;
    }

    /// <inheritdoc cref="IEntity{TId}.Delete" />
    public void Delete()
    {
        var cal = RoleSet.Get(Id) ?? throw new InvalidOperationException("Attempted delete on unpersisted entity.");
        cal.Delete();
    }
}