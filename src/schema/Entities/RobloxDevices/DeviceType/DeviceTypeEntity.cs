namespace Roblox.Platform.Devices.Entities;

using System;

using Roblox.Entities;

internal class DeviceTypeEntity : IDeviceTypeEntity
{
    /// <inheritdoc cref="IEntity{TId}.Id" />
    public byte Id { get; set; }
    /// <inheritdoc cref="IDeviceTypeEntity.Value" />
    public string Value { get; set; }

    /// <inheritdoc cref="IDeviceTypeEntity.BitOrdinal" />
    public byte BitOrdinal { get; set; }

    /// <inheritdoc cref="IDeviceTypeEntity.BitMask" />
    public long BitMask { get; set; }

    /// <inheritdoc cref="IEntity{TId}.Created" />
    public DateTime Created { get; set; }

    /// <inheritdoc cref="IUpdateableEntity{T}.Updated" />
    public DateTime Updated { get; set; }

    /// <inheritdoc cref="IUpdateableEntity{T}.Update" />
    public void Update()
    {
        var cal = DeviceType.Get(Id) ?? throw new InvalidOperationException("Attempted update on unpersisted entity.");
        cal.Value = Value;
        cal.BitOrdinal = BitOrdinal;
        cal.BitMask = BitMask;

        cal.Save();

        Updated = cal.Updated ?? DateTime.Now;
    }

    /// <inheritdoc cref="IEntity{TId}.Delete" />
    public void Delete()
    {
        var cal = DeviceType.Get(Id) ?? throw new InvalidOperationException("Attempted delete on unpersisted entity.");
        cal.Delete();
    }
}