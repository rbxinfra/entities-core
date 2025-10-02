namespace Roblox.Api.ControlPlane;

using System;

using Roblox.Entities;

internal class ServiceEntity : IServiceEntity
{
    /// <inheritdoc cref="IEntity{TId}.Id" />
    public int Id { get; set; }
    /// <inheritdoc cref="IServiceEntity.Name" />
    public string Name { get; set; }

    /// <inheritdoc cref="IServiceEntity.StatusTypeId" />
    public byte StatusTypeId { get; set; }

    /// <inheritdoc cref="IEntity{TId}.Created" />
    public DateTime Created { get; set; }

    /// <inheritdoc cref="IUpdateableEntity{T}.Updated" />
    public DateTime Updated { get; set; }

    /// <inheritdoc cref="IUpdateableEntity{T}.Update" />
    public void Update()
    {
        var cal = Service.Get(Id) ?? throw new InvalidOperationException("Attempted update on unpersisted entity.");
        cal.Name = Name;
        cal.StatusTypeID = StatusTypeId;

        cal.Save();

        Updated = cal.Updated ?? DateTime.Now;
    }

    /// <inheritdoc cref="IEntity{TId}.Delete" />
    public void Delete()
    {
        var cal = Service.Get(Id) ?? throw new InvalidOperationException("Attempted delete on unpersisted entity.");
        cal.Delete();
    }
}