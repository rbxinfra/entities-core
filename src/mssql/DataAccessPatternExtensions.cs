namespace Roblox.Entities.Mssql;

using System;
using System.Data;
using System.Linq;
using System.Data.SqlClient;
using System.Collections.Generic;

using Data;
using MssqlDatabases;

/// <summary>
/// Extension methods for <see cref="RobloxDatabase"/>
/// </summary>
public static class DataAccessPatternExtensions
{
    /// <summary>
    /// Perform a delete database operation.
    /// </summary>
    /// <typeparam name="TIndex">The type of ID.</typeparam>
    /// <param name="database">The database to perform against.</param>
    /// <param name="storedProcedureName">The name of the stored procudure.</param>
    /// <param name="id">The ID of the entity.</param>
    /// <param name="commandTimeout">The optional command timeout.</param>
    /// <param name="includeApplicationIntent">Should include an application intent?</param>
    /// <exception cref="ArgumentException">Required value not specified: ID.</exception>
    public static void Delete<TIndex>(this RobloxDatabase database, string storedProcedureName, TIndex id, int? commandTimeout = null, bool includeApplicationIntent = false)
        where TIndex : struct
    {
        if (EqualityComparer<TIndex>.Default.Equals(id, default(TIndex))) throw new ArgumentException("Required value not specified: ID.", nameof(id));

        database.ExecuteNonQuery(storedProcedureName, new[] { new SqlParameter("@ID", id) }, CommandType.StoredProcedure, commandTimeout, includeApplicationIntent ? ApplicationIntent.ReadWrite : null);
    }

    /// <summary>
    /// Perform a get database operation.
    /// </summary>
    /// <typeparam name="TDal">The type of DAL.</typeparam>
    /// <typeparam name="TIndex">The type of ID.</typeparam>
    /// <param name="database">The database to perform against.</param>
    /// <param name="storedProcedureName">The name of the stored procudure.</param>
    /// <param name="id">The ID of the entity.</param>
    /// <param name="dalBuilder">The DAL builder.</param>
    /// <param name="commandTimeout">The optional command timeout.</param>
    /// <param name="includeApplicationIntent">Should include an application intent?</param>
    /// <returns>The DAL.</returns>
    public static TDal Get<TDal, TIndex>(this RobloxDatabase database, string storedProcedureName, TIndex id, Func<IDictionary<string, object>, TDal> dalBuilder, int? commandTimeout = null, bool includeApplicationIntent = false)
        where TDal : class where TIndex : struct
    {
        if (EqualityComparer<TIndex>.Default.Equals(id, default(TIndex))) return default(TDal);

        return BuildDALFromRecords(database.ExecuteReader(storedProcedureName, new[] { new SqlParameter("@ID", id) }, CommandType.StoredProcedure, commandTimeout, includeApplicationIntent ? ApplicationIntent.ReadOnly : null), dalBuilder);
    }

    /// <summary>
    /// Perform a get or create database operation.
    /// </summary>
    /// <typeparam name="TDal">The type of DAL.</typeparam>
    /// <param name="database">The database to perform against.</param>
    /// <param name="storedProcedurename">The name of the stored procudure.</param>
    /// <param name="dalBuilder">The DAL builder.</param>
    /// <param name="queryParameters">The query parameters.</param>
    /// <returns>The DAL.</returns>
    public static EntityHelper.GetOrCreateDALWrapper<TDal> GetOrCreate<TDal>(this RobloxDatabase database, string storedProcedurename, Func<IDictionary<string, object>, TDal> dalBuilder, params SqlParameter[] queryParameters)
        where TDal : class
        => database.GetOrCreate(storedProcedurename, dalBuilder, null, false, queryParameters);

    /// <summary>
    /// Perform a get or create database operation.
    /// </summary>
    /// <typeparam name="TDal">The type of DAL.</typeparam>
    /// <param name="database">The database to perform against.</param>
    /// <param name="storedProcedurename">The name of the stored procudure.</param>
    /// <param name="dalBuilder">The DAL builder.</param>
    /// <param name="commandTimeout">The optional command timeout.</param>
    /// <param name="includeApplicationIntent">Should include an application intent?</param>
    /// <param name="queryParameters">The query parameters.</param>
    /// <returns>The DAL.</returns>
    public static EntityHelper.GetOrCreateDALWrapper<TDal> GetOrCreate<TDal>(this RobloxDatabase database, string storedProcedurename, Func<IDictionary<string, object>, TDal> dalBuilder, int? commandTimeout = null, bool includeApplicationIntent = false, params SqlParameter[] queryParameters) where TDal : class
    {
        var output = FindOutputSqlParameter(queryParameters, "@CreatedNewEntity");
        
        var reader = database.ExecuteReader(storedProcedurename, queryParameters, CommandType.StoredProcedure, commandTimeout, includeApplicationIntent ? ApplicationIntent.ReadWrite : null);

        return new EntityHelper.GetOrCreateDALWrapper<TDal>(
            (bool)output.Value,
            BuildDALFromRecords(
                reader,
                dalBuilder
            )
        );
    }

    /// <summary>
    /// Perform a get ID collection database operation.
    /// </summary>
    /// <typeparam name="TIndex">The type of ID.</typeparam>
    /// <param name="database">The database to perform against.</param>
    /// <param name="storedProcedureName">The name of the stored procudure.</param>
    /// <param name="queryParameters">The query parameters.</param>
    /// <returns>The ID Collection.</returns>
    public static ICollection<TIndex> GetIDCollection<TIndex>(this RobloxDatabase database, string storedProcedureName, params SqlParameter[] queryParameters)
        where TIndex : struct 
        => database.GetIDCollection<TIndex>(storedProcedureName, null, false, queryParameters);

    /// <summary>
    /// Perform a get ID collection database operation.
    /// </summary>
    /// <typeparam name="TIndex">The type of ID.</typeparam>
    /// <param name="database">The database to perform against.</param>
    /// <param name="storedProcedureName">The name of the stored procudure.</param>
    /// <param name="commandTimeout">The optional command timeout.</param>
    /// <param name="includeApplicationIntent">Should include an application intent?</param>
    /// <param name="queryParameters">The query parameters.</param>
    /// <returns>The ID Collection.</returns>
    public static ICollection<TIndex> GetIDCollection<TIndex>(this RobloxDatabase database, string storedProcedureName, int? commandTimeout = null, bool includeApplicationIntent = false, params SqlParameter[] queryParameters)
        where TIndex : struct
        => (from record in database.ExecuteReader(storedProcedureName, queryParameters, CommandType.StoredProcedure, commandTimeout, includeApplicationIntent ? ApplicationIntent.ReadOnly : null)
            select (TIndex)Convert.ChangeType(record["ID"], typeof(TIndex))).ToList();

    /// <summary>
    /// Perform a get count database operation.
    /// </summary>
    /// <typeparam name="TCount">The type of count.</typeparam>
    /// <param name="database">The database to perform against.</param>
    /// <param name="storedProcedureName">The name of the stored procudure.</param>
    /// <param name="queryParameters">The query parameters.</param>
    /// <returns>The count.</returns>
    public static TCount GetCount<TCount>(this RobloxDatabase database, string storedProcedureName, params SqlParameter[] queryParameters)
        where TCount : struct 
        => database.GetCount<TCount>(storedProcedureName, null, false, queryParameters);

    /// <summary>
    /// Perform a get count database operation.
    /// </summary>
    /// <typeparam name="TCount">The type of count.</typeparam>
    /// <param name="database">The database to perform against.</param>
    /// <param name="storedProcedureName">The name of the stored procudure.</param>
    /// <param name="commandTimeout">The optional command timeout.</param>
    /// <param name="includeApplicationIntent">Should include an application intent?</param>
    /// <param name="queryParameters">The query parameters.</param>
    /// <returns>The count.</returns>
    public static TCount GetCount<TCount>(this RobloxDatabase database, string storedProcedureName, int? commandTimeout = null, bool includeApplicationIntent = false, params SqlParameter[] queryParameters)
        where TCount : struct 
        => (TCount)database.ExecuteScalar(storedProcedureName, queryParameters, CommandType.StoredProcedure, commandTimeout, includeApplicationIntent ? ApplicationIntent.ReadOnly : null);

    /// <summary>
    /// Perform an insert database operation.
    /// </summary>
    /// <typeparam name="TIndex">The type of ID.</typeparam>
    /// <param name="database">The database to perform against.</param>
    /// <param name="storedProcedureName">The name of the stored procudure.</param>
    /// <param name="queryParameters">The query parameters.</param>
    /// <returns>The ID of the inserted entity.</returns>
    public static TIndex Insert<TIndex>(this RobloxDatabase database, string storedProcedureName, params SqlParameter[] queryParameters)
        where TIndex : struct 
        => database.Insert<TIndex>(storedProcedureName, null, false, queryParameters);

    /// <summary>
    /// Perform an insert database operation.
    /// </summary>
    /// <typeparam name="TIndex">The type of ID.</typeparam>
    /// <param name="database">The database to perform against.</param>
    /// <param name="storedProcedureName">The name of the stored procudure.</param>
    /// <param name="commandTimeout">The optional command timeout.</param>
    /// <param name="includeApplicationIntent">Should include an application intent?</param>
    /// <param name="queryParameters">The query parameters.</param>
    /// <returns>The ID of the inserted entity.</returns>
    public static TIndex Insert<TIndex>(this RobloxDatabase database, string storedProcedureName, int? commandTimeout = null, bool includeApplicationIntent = false, params SqlParameter[] queryParameters) where TIndex : struct
    {
        var outparam = FindOutputSqlParameter(queryParameters, "@ID");
        database.ExecuteNonQuery(storedProcedureName, queryParameters, CommandType.StoredProcedure, commandTimeout, includeApplicationIntent ? ApplicationIntent.ReadWrite : null);

        return (TIndex)outparam.Value;
    }

    /// <summary>
    /// Perform an ID lookup database operation.
    /// </summary>
    /// <typeparam name="TDal">The type of DAL.</typeparam>
    /// <param name="database">The database to perform against.</param>
    /// <param name="storedProcedureName">The name of the stored procudure.</param>
    /// <param name="dalBuilder">The DAL builder.</param>
    /// <param name="queryParameters">The query parameters.</param>
    /// <returns>The DAL of the ID lookup.</returns>
    public static TDal Lookup<TDal>(this RobloxDatabase database, string storedProcedureName, Func<IDictionary<string, object>, TDal> dalBuilder, params SqlParameter[] queryParameters) 
        where TDal : class
        => database.Lookup(storedProcedureName, dalBuilder, null, false, queryParameters);

    /// <summary>
    /// Perform an ID lookup database operation.
    /// </summary>
    /// <typeparam name="TDal">The type of DAL.</typeparam>
    /// <param name="database">The database to perform against.</param>
    /// <param name="storedProcedureName">The name of the stored procudure.</param>
    /// <param name="dalBuilder">The DAL builder.</param>
    /// <param name="commandTimeout">The optional command timeout.</param>
    /// <param name="includeApplicationIntent">Should include an application intent?</param>
    /// <param name="queryParameters">The query parameters.</param>
    /// <returns>The DAL of the ID lookup.</returns>
    public static TDal Lookup<TDal>(this RobloxDatabase database, string storedProcedureName, Func<IDictionary<string, object>, TDal> dalBuilder, int? commandTimeout = null, bool includeApplicationIntent = false, params SqlParameter[] queryParameters)
        where TDal : class
        => BuildDALFromRecords(database.ExecuteReader(storedProcedureName, queryParameters, CommandType.StoredProcedure, commandTimeout, includeApplicationIntent ? ApplicationIntent.ReadOnly : null), dalBuilder);

    /// <summary>
    /// Perform a multi get database operation.
    /// </summary>
    /// <typeparam name="TDal">The type of DAL.</typeparam>
    /// <typeparam name="TIndex">The type of ID.</typeparam>
    /// <param name="database">The database to perform against.</param>
    /// <param name="storedProcedureName">The name of the stored procudure.</param>
    /// <param name="ids">The IDs to fetch.</param>
    /// <param name="dalBuilder">The DAL builder.</param>
    /// <param name="commandTimeout">The optional command timeout.</param>
    /// <param name="includeApplicationIntent">Should include an application intent?</param>
    /// <returns>The DALs.</returns>
    /// <exception cref="ArgumentException">Null was supplied for '<paramref name="ids"/>' parameter</exception>
    public static ICollection<TDal> MultiGet<TDal, TIndex>(this RobloxDatabase database, string storedProcedureName, IEnumerable<TIndex> ids, Func<IDictionary<string, object>, TDal> dalBuilder, int? commandTimeout = null, bool includeApplicationIntent = false)
        where TDal : class
        where TIndex : struct
    {
        if (ids == null) throw new ArgumentException("Null was supplied for 'ids' parameter", nameof(ids));

        var parameters = EntityHelper.GetMultiGetIDsSqlParameters(ids);
        return database.ExecuteReader(storedProcedureName, parameters, CommandType.StoredProcedure, commandTimeout, includeApplicationIntent ? ApplicationIntent.ReadOnly : null).Select(dalBuilder).ToList();
    }

    /// <summary>
    /// Perform an update database operation.
    /// </summary>
    /// <param name="database">The database to perform against.</param>
    /// <param name="storedProcedureName">The name of the stored procudure.</param>
    /// <param name="queryParameters">The query parameters.</param>
    /// <returns>The ID of the inserted entity.</returns>
    public static void Update(this RobloxDatabase database, string storedProcedureName, params SqlParameter[] queryParameters)
        => database.Update(storedProcedureName, null, false, queryParameters);

    /// <summary>
    /// Perform an update database operation.
    /// </summary>
    /// <param name="database">The database to perform against.</param>
    /// <param name="storedProcedureName">The name of the stored procudure.</param>
    /// <param name="queryParameters">The query parameters.</param>
    /// <param name="commandTimeout">The optional command timeout.</param>
    /// <param name="includeApplicationIntent">Should include an application intent?</param>
    /// <returns>The ID of the inserted entity.</returns>
    public static void Update(this RobloxDatabase database, string storedProcedureName, int? commandTimeout = null, bool includeApplicationIntent = false, params SqlParameter[] queryParameters)
        => database.ExecuteNonQuery(storedProcedureName, queryParameters, CommandType.StoredProcedure, commandTimeout, includeApplicationIntent ? new ApplicationIntent?(0) : null);

    private static TDal BuildDALFromRecords<TDal>(IEnumerable<IDictionary<string, object>> records, Func<IDictionary<string, object>, TDal> dalBuilder) 
        where TDal : class
    {
        var record = records.LastOrDefault();
        if (record == null)
            return default(TDal);

        return dalBuilder(record);
    }

    private static SqlParameter FindOutputSqlParameter(IEnumerable<SqlParameter> queryParameters, string parameterName)
    {
        var outputParameter = queryParameters.FirstOrDefault(p => p.Direction == ParameterDirection.Output && p.ParameterName == parameterName) ?? throw new ArgumentException("Output SqlParameter " + parameterName + " not found in queryParameters", nameof(queryParameters));
        
        return outputParameter;
    }
}
