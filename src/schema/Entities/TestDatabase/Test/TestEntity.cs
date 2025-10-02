namespace Roblox;

using System;

using Roblox.Entities;

internal class TestEntity : ITestEntity
{
    /// <inheritdoc cref="IEntity{TId}.Id" />
    public int Id { get; set; }
    /// <inheritdoc cref="ITestEntity.Name" />
    public string Name { get; set; }

    /// <inheritdoc cref="ITestEntity.Description" />
    public string Description { get; set; }

    /// <inheritdoc cref="ITestEntity.AccountId" />
    public long AccountId { get; set; }

    /// <inheritdoc cref="ITestEntity.TestEnumId" />
    public byte TestEnumId { get; set; }

    /// <inheritdoc cref="ITestEntity.RawHash" />
    public byte[]? RawHash { get; set; }

    /// <inheritdoc cref="IEntity{TId}.Created" />
    public DateTime Created { get; set; }

    /// <inheritdoc cref="IUpdateableEntity{T}.Updated" />
    public DateTime Updated { get; set; }

    /// <inheritdoc cref="IUpdateableEntity{T}.Update" />
    public void Update()
    {
        var cal = Test.Get(Id) ?? throw new InvalidOperationException("Attempted update on unpersisted entity.");
        cal.Description = Description;
        cal.AccountID = AccountId;
        cal.TestEnumID = TestEnumId;
        cal.RawHash = RawHash;

        cal.Save();

        Updated = cal.Updated;
    }

    /// <inheritdoc cref="IEntity{TId}.Delete" />
    public void Delete()
    {
        var cal = Test.Get(Id) ?? throw new InvalidOperationException("Attempted delete on unpersisted entity.");
        cal.Delete();
    }
}