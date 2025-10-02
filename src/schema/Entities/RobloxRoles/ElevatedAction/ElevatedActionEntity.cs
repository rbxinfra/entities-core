namespace Roblox.Web.ElevatedActions.BLL;

using System;

using Roblox.Entities;

internal class ElevatedActionEntity : IElevatedActionEntity
{
    /// <inheritdoc cref="IEntity{TId}.Id" />
    public int Id { get; set; }
    /// <inheritdoc cref="IElevatedActionEntity.Name" />
    public string Name { get; set; }

    /// <inheritdoc cref="IElevatedActionEntity.Description" />
    public string Description { get; set; }

    /// <inheritdoc cref="IEntity{TId}.Created" />
    public DateTime Created { get; set; }

    /// <inheritdoc cref="IUpdateableEntity{T}.Updated" />
    public DateTime Updated { get; set; }

    /// <inheritdoc cref="IUpdateableEntity{T}.Update" />
    public void Update()
    {
        var cal = ElevatedAction.Get(Id) ?? throw new InvalidOperationException("Attempted update on unpersisted entity.");
        cal.Name = Name;
        cal.Description = Description;

        cal.Save();

        Updated = cal.Updated;
    }

    /// <inheritdoc cref="IEntity{TId}.Delete" />
    public void Delete()
    {
        var cal = ElevatedAction.Get(Id) ?? throw new InvalidOperationException("Attempted delete on unpersisted entity.");
        cal.Delete();
    }
}