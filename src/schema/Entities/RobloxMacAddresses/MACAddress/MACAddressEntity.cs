namespace Roblox.Platform.IpAddresses.Entities;

using System;

using Roblox.Entities;

internal class MACAddressEntity : IMACAddressEntity
{
    /// <inheritdoc cref="IEntity{TId}.Id" />
    public long Id { get; set; }
    /// <inheritdoc cref="IMACAddressEntity.Macaddress" />
    public string Macaddress { get; set; }

    /// <inheritdoc cref="IMACAddressEntity.State" />
    public byte State { get; set; }

    /// <inheritdoc cref="IMACAddressEntity.Expiration" />
    public DateTime? Expiration { get; set; }

    /// <inheritdoc cref="IEntity{TId}.Created" />
    public DateTime Created { get; set; }

    /// <inheritdoc cref="IUpdateableEntity{T}.Updated" />
    public DateTime Updated { get; set; }

    /// <inheritdoc cref="IUpdateableEntity{T}.Update" />
    public void Update()
    {
        var cal = MACAddress.Get(Id) ?? throw new InvalidOperationException("Attempted update on unpersisted entity.");
        cal.MACAddress = Macaddress;
        cal.State = State;
        cal.Expiration = Expiration;

        cal.Save();

        Updated = cal.Updated ?? DateTime.Now;
    }

    /// <inheritdoc cref="IEntity{TId}.Delete" />
    public void Delete()
    {
        var cal = MACAddress.Get(Id) ?? throw new InvalidOperationException("Attempted delete on unpersisted entity.");
        cal.Delete();
    }
}