namespace Roblox.Api.ControlPlane;

using System;

using Roblox.Entities;

internal class OperationEntity : IOperationEntity
{
    /// <inheritdoc cref="IEntity{TId}.Id" />
    public int Id { get; set; }
    /// <inheritdoc cref="IOperationEntity.Name" />
    public string Name { get; set; }

    /// <inheritdoc cref="IOperationEntity.ServiceId" />
    public int ServiceId { get; set; }

    /// <inheritdoc cref="IOperationEntity.StatusTypeId" />
    public byte StatusTypeId { get; set; }

    /// <inheritdoc cref="IEntity{TId}.Created" />
    public DateTime Created { get; set; }

    /// <inheritdoc cref="IUpdateableEntity{T}.Updated" />
    public DateTime Updated { get; set; }

    /// <inheritdoc cref="IUpdateableEntity{T}.Update" />
    public void Update()
    {
        var cal = Operation.Get(Id) ?? throw new InvalidOperationException("Attempted update on unpersisted entity.");
        cal.Name = Name;
        cal.ServiceID = ServiceId;
        cal.StatusTypeID = StatusTypeId;

        cal.Save();

        Updated = cal.Updated ?? DateTime.Now;
    }

    /// <inheritdoc cref="IEntity{TId}.Delete" />
    public void Delete()
    {
        var cal = Operation.Get(Id) ?? throw new InvalidOperationException("Attempted delete on unpersisted entity.");
        cal.Delete();
    }
}