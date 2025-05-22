namespace Roblox;

using System;

using Roblox.Entities;

internal interface ITestEnumEntity : IUpdateableEntity<byte>
{
    string Value { get; set; }

}