namespace Roblox.Platform.IpAddresses.Entities;

using System;

using Roblox.Entities;

internal class UserIPAddressV2Entity : IUserIPAddressV2Entity
{
    /// <inheritdoc cref="IEntity{TId}.Id" />
    public long Id { get; set; }
    /// <inheritdoc cref="IUserIPAddressV2Entity.UserId" />
    public long UserId { get; set; }

    /// <inheritdoc cref="IUserIPAddressV2Entity.IpaddressId" />
    public long IpaddressId { get; set; }

    /// <inheritdoc cref="IUserIPAddressV2Entity.State" />
    public byte State { get; set; }

    /// <inheritdoc cref="IUserIPAddressV2Entity.LastSeen" />
    public DateTime? LastSeen { get; set; }

    /// <inheritdoc cref="IEntity{TId}.Created" />
    public DateTime Created { get; set; }

    /// <inheritdoc cref="IEntity{TId}.Delete" />
    public void Delete()
    {
        var cal = UserIPAddressV2.Get(Id) ?? throw new InvalidOperationException("Attempted delete on unpersisted entity.");
        cal.Delete();
    }
}