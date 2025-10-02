namespace Roblox;

using System;

using Roblox.Entities;

internal interface ITestEntity : IUpdateableEntity<int>
{
    string Name { get; set; }

    string Description { get; set; }

    long AccountId { get; set; }

    byte TestEnumId { get; set; }

    byte[]? RawHash { get; set; }

}