namespace Roblox.TestMigrationSettings;

using Caching;
using Configuration;

/// <summary>
/// Settings for the caching library.
/// </summary>
public class Settings : BaseSettingsProvider<Settings>
{
    /// <inheritdoc cref="IVaultProvider.Path"/>
    protected override string ChildPath => "test-migration-settings";

    /// <summary>
    /// Gets the Memcached group name.
    /// </summary>
    public string MemcachedGroupName => GetOrDefault<string>(nameof(MemcachedGroupName), "test-migration");

    /// <summary>
    /// Gets the migration group name.
    /// </summary>
    public string MigrationGroupName => GetOrDefault<string>(nameof(MigrationGroupName), "test-migration");

    /// <summary>
    /// Gets the migration state.
    /// </summary>
    public MigrationStateChange MigrationStateChange => GetOrDefault<MigrationStateChange>(nameof(MigrationState), new MigrationStateChange(MigrationState.NoMigration, MigrationState.NoMigration, 0));
}
