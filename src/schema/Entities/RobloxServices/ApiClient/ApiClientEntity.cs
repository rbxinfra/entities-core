namespace Roblox.Api.ControlPlane;

using System;

using Roblox.Entities;

internal class ApiClientEntity : IApiClientEntity
{
    /// <inheritdoc cref="IEntity{TId}.Id" />
    public int Id { get; set; }
    /// <inheritdoc cref="IApiClientEntity.ApiKey" />
    public Guid ApiKey { get; set; }

    /// <inheritdoc cref="IApiClientEntity.Note" />
    public string Note { get; set; }

    /// <inheritdoc cref="IApiClientEntity.StatusTypeId" />
    public byte StatusTypeId { get; set; }

    /// <inheritdoc cref="IEntity{TId}.Created" />
    public DateTime Created { get; set; }

    /// <inheritdoc cref="IUpdateableEntity{T}.Updated" />
    public DateTime Updated { get; set; }

    /// <inheritdoc cref="IUpdateableEntity{T}.Update" />
    public void Update()
    {
        var cal = ApiClient.Get(Id) ?? throw new InvalidOperationException("Attempted update on unpersisted entity.");
        cal.ApiKey = ApiKey;
        cal.Note = Note;
        cal.StatusTypeID = StatusTypeId;

        cal.Save();

        Updated = cal.Updated ?? DateTime.Now;
    }

    /// <inheritdoc cref="IEntity{TId}.Delete" />
    public void Delete()
    {
        var cal = ApiClient.Get(Id) ?? throw new InvalidOperationException("Attempted delete on unpersisted entity.");
        cal.Delete();
    }
}