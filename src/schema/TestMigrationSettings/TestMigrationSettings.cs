namespace Roblox.TestMigrationSettings;

using Roblox.Caching;
using Roblox.Configuration;

/// <summary>
/// Provides access to <see cref="IRemoteCachabilitySettings" /> and <see cref="IMigrationCacheabilitySettings" /> for tests.
/// </summary>
public static class TestMigrationSettings
{
    /// <summary>
    /// The <see cref="IRemoteCachabilitySettings" /> for tests.
    /// </summary>
    public static IRemoteCachabilitySettings RemoteCacheableSettings = new RemoteCachabilitySettings(
        global::Roblox.TestMigrationSettings.Settings.Singleton.ToSingleSetting(s => s.MemcachedGroupName)
    );

    /// <summary>
    /// The <see cref="IMigrationCacheabilitySettings" /> for tests.
    /// </summary>
    public static IMigrationCacheabilitySettings MigrationCacheableSettings = new MigrationCacheabilitySettings(
        global::Roblox.TestMigrationSettings.Settings.Singleton.ToSingleSetting(s => s.MigrationGroupName),
        global::Roblox.TestMigrationSettings.Settings.Singleton.ToSingleSetting(s => s.MigrationStateChange)
    );
}
