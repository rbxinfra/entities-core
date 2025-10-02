namespace Roblox.Platform.IpAddresses.Entities;

using System;

using Roblox.Entities;

internal class UserMACAddressEntity : IUserMACAddressEntity
{
    /// <inheritdoc cref="IEntity{TId}.Id" />
    public long Id { get; set; }
    /// <inheritdoc cref="IUserMACAddressEntity.UserId" />
    public long UserId { get; set; }

    /// <inheritdoc cref="IUserMACAddressEntity.MacaddressId" />
    public long MacaddressId { get; set; }

    /// <inheritdoc cref="IEntity{TId}.Created" />
    public DateTime Created { get; set; }

    /// <inheritdoc cref="IEntity{TId}.Delete" />
    public void Delete()
    {
        var cal = UserMACAddress.Get(Id) ?? throw new InvalidOperationException("Attempted delete on unpersisted entity.");
        cal.Delete();
    }
}