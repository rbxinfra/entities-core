namespace Roblox.Entities.Mssql;

/// <summary>
/// Extension methods for SQL strings.
/// </summary>
public static class SqlStringExtensions
{
    /// <summary>
    /// Truncate a string to an NVarChar
    /// </summary>
    /// <param name="x">The string.</param>
    /// <param name="numberOfCharacters">Number of chars.</param>
    /// <returns>The truncated string.</returns>
    public static string TruncateToNVarChar(this string x, int numberOfCharacters)
    {
        int chars = 0;
        for (int i = 0; i < x.Length; i++)
        {
            if (char.IsHighSurrogate(x[i]))
            {
                i++;
                chars += 4;
            }
            else
                chars += 2;

            if (chars > numberOfCharacters * 2)
                return x.Substring(0, i - 1);
        }

        return x;
    }
}
