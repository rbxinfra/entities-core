namespace Roblox.Platform.IpAddresses.Entities;

using System;

using Roblox.Entities;

internal class IPAddressEntity : IIPAddressEntity
{
    /// <inheritdoc cref="IEntity{TId}.Id" />
    public long Id { get; set; }
    /// <inheritdoc cref="IIPAddressEntity.Address" />
    public string Address { get; set; }

    /// <inheritdoc cref="IIPAddressEntity.State" />
    public byte State { get; set; }

    /// <inheritdoc cref="IIPAddressEntity.Expiration" />
    public DateTime? Expiration { get; set; }

    /// <inheritdoc cref="IEntity{TId}.Created" />
    public DateTime Created { get; set; }

    /// <inheritdoc cref="IUpdateableEntity{T}.Updated" />
    public DateTime Updated { get; set; }

    /// <inheritdoc cref="IUpdateableEntity{T}.Update" />
    public void Update()
    {
        var cal = IPAddress.Get(Id) ?? throw new InvalidOperationException("Attempted update on unpersisted entity.");
        cal.Address = Address;
        cal.State = State;
        cal.Expiration = Expiration;

        cal.Save();

        Updated = cal.Updated ?? DateTime.Now;
    }

    /// <inheritdoc cref="IEntity{TId}.Delete" />
    public void Delete()
    {
        var cal = IPAddress.Get(Id) ?? throw new InvalidOperationException("Attempted delete on unpersisted entity.");
        cal.Delete();
    }
}