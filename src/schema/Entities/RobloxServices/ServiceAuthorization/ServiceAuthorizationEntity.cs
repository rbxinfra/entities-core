namespace Roblox.Api.ControlPlane;

using System;

using Roblox.Entities;

internal class ServiceAuthorizationEntity : IServiceAuthorizationEntity
{
    /// <inheritdoc cref="IEntity{TId}.Id" />
    public int Id { get; set; }
    /// <inheritdoc cref="IServiceAuthorizationEntity.ServiceId" />
    public int ServiceId { get; set; }

    /// <inheritdoc cref="IServiceAuthorizationEntity.ApiClientId" />
    public int ApiClientId { get; set; }

    /// <inheritdoc cref="IServiceAuthorizationEntity.AuthorizationTypeId" />
    public byte AuthorizationTypeId { get; set; }

    /// <inheritdoc cref="IEntity{TId}.Created" />
    public DateTime Created { get; set; }

    /// <inheritdoc cref="IUpdateableEntity{T}.Updated" />
    public DateTime Updated { get; set; }

    /// <inheritdoc cref="IUpdateableEntity{T}.Update" />
    public void Update()
    {
        var cal = ServiceAuthorization.Get(Id) ?? throw new InvalidOperationException("Attempted update on unpersisted entity.");
        cal.ServiceID = ServiceId;
        cal.ApiClientID = ApiClientId;
        cal.AuthorizationTypeID = AuthorizationTypeId;

        cal.Save();

        Updated = cal.Updated ?? DateTime.Now;
    }

    /// <inheritdoc cref="IEntity{TId}.Delete" />
    public void Delete()
    {
        var cal = ServiceAuthorization.Get(Id) ?? throw new InvalidOperationException("Attempted delete on unpersisted entity.");
        cal.Delete();
    }
}