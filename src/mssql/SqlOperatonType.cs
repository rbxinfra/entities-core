namespace Roblox.Entities.Mssql;

/// <summary>
/// Represents a SQL operation type
/// </summary>
internal enum SqlOperatonType
{
    /// <summary>
    /// Represents a normal operation
    /// </summary>
    Normal,

    /// <summary>
    /// Represents an insert operation
    /// </summary>
    Insert,

    /// <summary>
    /// Represents a get or create operation
    /// </summary>
    GetOrCreate
}
