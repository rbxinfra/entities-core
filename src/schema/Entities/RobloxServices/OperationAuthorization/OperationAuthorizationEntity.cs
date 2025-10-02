namespace Roblox.Api.ControlPlane;

using System;

using Roblox.Entities;

internal class OperationAuthorizationEntity : IOperationAuthorizationEntity
{
    /// <inheritdoc cref="IEntity{TId}.Id" />
    public int Id { get; set; }
    /// <inheritdoc cref="IOperationAuthorizationEntity.OperationId" />
    public int OperationId { get; set; }

    /// <inheritdoc cref="IOperationAuthorizationEntity.ApiClientId" />
    public int ApiClientId { get; set; }

    /// <inheritdoc cref="IOperationAuthorizationEntity.AuthorizationTypeId" />
    public byte AuthorizationTypeId { get; set; }

    /// <inheritdoc cref="IEntity{TId}.Created" />
    public DateTime Created { get; set; }

    /// <inheritdoc cref="IUpdateableEntity{T}.Updated" />
    public DateTime Updated { get; set; }

    /// <inheritdoc cref="IUpdateableEntity{T}.Update" />
    public void Update()
    {
        var cal = OperationAuthorization.Get(Id) ?? throw new InvalidOperationException("Attempted update on unpersisted entity.");
        cal.OperationID = OperationId;
        cal.ApiClientID = ApiClientId;
        cal.AuthorizationTypeID = AuthorizationTypeId;

        cal.Save();

        Updated = cal.Updated ?? DateTime.Now;
    }

    /// <inheritdoc cref="IEntity{TId}.Delete" />
    public void Delete()
    {
        var cal = OperationAuthorization.Get(Id) ?? throw new InvalidOperationException("Attempted delete on unpersisted entity.");
        cal.Delete();
    }
}