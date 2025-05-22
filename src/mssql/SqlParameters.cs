namespace Roblox.Entities.Mssql;

using System;
using System.Linq;
using System.Data;
using System.Reflection;
using System.Data.SqlClient;
using System.Linq.Expressions;
using System.Collections.Generic;

/// <summary>
/// Cache for <see cref="SqlParameterSerializer{T}"/>
/// </summary>
internal static class SqlParameterSerializerCache<T>
{
    /// <summary>
    /// The default serializer.
    /// </summary>
    public static readonly SqlParameterSerializer<T> Default = new();
}

/// <summary>
/// Factory for spitting out Sql Parameters.
/// </summary>
public static class SqlParameterFactory
{
    /// <summary>
    /// Get default Sql Parameters
    /// </summary>
    /// <typeparam name="T">Parameters object type.</typeparam>
    /// <param name="queryParametersObject">Parameters object.</param>
    /// <returns>The parameters.</returns>
    public static SqlParameter[] GetSqlParameters<T>(T queryParametersObject) 
        => SqlParameterSerializerCache<T>.Default.GetSqlParameters(queryParametersObject);

    /// <summary>
    /// Get insert Sql Parameters.
    /// </summary>
    /// <typeparam name="T">Parameters object type.</typeparam>
    /// <param name="queryParametersObject">Parameters object.</param>
    /// <returns>The parameters.</returns>
    public static SqlParameter[] GetSqlParametersForInsert<T>(T queryParametersObject) 
        => SqlParameterSerializerCache<T>.Default.GetSqlParametersForInsert(queryParametersObject);

    /// <summary>
    /// Get get or create Sql Parameters.
    /// </summary>
    /// <typeparam name="T">Parameters object type.</typeparam>
    /// <param name="queryParametersObject">Parameters object.</param>
    /// <returns>The parameters.</returns>
    public static SqlParameter[] GetSqlParametersForGetOrCreate<T>(T queryParametersObject) 
        => SqlParameterSerializerCache<T>.Default.GetSqlParametersForGetOrCreate(queryParametersObject);
}

/// <summary>
/// Generic version of <see cref="SqlParameterSerializer"/>
/// </summary>
/// <typeparam name="T">The type of Sql Parameter</typeparam>
public class SqlParameterSerializer<T> : SqlParameterSerializer
{
    /// <summary>
    /// Construct a new instance of <see cref="SqlParameterSerializer{T}"/>
    /// </summary>
    public SqlParameterSerializer()
        : base(typeof(T))
    {
    }
}

/// <summary>
/// Serializer for Sql Parameters.
/// </summary>
public class SqlParameterSerializer
{
    private static readonly IDictionary<Type, SqlDbType> _SqlTypeMap = new Dictionary<Type, SqlDbType>
    {
        { typeof(long), SqlDbType.BigInt },
        { typeof(int), SqlDbType.Int },
        { typeof(short), SqlDbType.SmallInt },
        { typeof(byte), SqlDbType.TinyInt }
    };

    private readonly KeyValuePair<string, Func<object, object>>[] _Getters;
    private readonly SqlDbType? _PrimaryKeySqlType;

    /// <summary>
    /// Construct a new instance of <see cref="SqlParameterSerializer"/>
    /// </summary>
    /// <param name="type">The type of Sql Parameters.</param>
    public SqlParameterSerializer(Type type)
    {
        var properties = type.GetProperties(BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic);
        var getters = new Dictionary<string, Func<object, object>>();

        foreach (var property in properties)
        {
            if (property.Name == "ID")
                _PrimaryKeySqlType = _SqlTypeMap[property.PropertyType];

            getters[property.Name] = CreateGetter(type, property);
        }

        _Getters = getters.ToArray();
    }

    /// <summary>
    /// Get default Sql Parameters.
    /// </summary>
    /// <param name="queryParametersObject">Parameters object.</param>
    /// <returns>The parameters.</returns>
    public SqlParameter[] GetSqlParameters(object queryParametersObject) => PerformSerialization(queryParametersObject, SqlOperatonType.Normal);

    /// <summary>
    /// Get get or create Sql Parameters.
    /// </summary>
    /// <param name="queryParametersObject">Parameters object.</param>
    /// <returns>The parameters.</returns>
    public SqlParameter[] GetSqlParametersForGetOrCreate(object queryParametersObject) => PerformSerialization(queryParametersObject, SqlOperatonType.GetOrCreate);

    /// <summary>
    /// Get insert Sql Parameters.
    /// </summary>
    /// <param name="queryParametersObject">Parameters object.</param>
    /// <returns>The parameters.</returns>
    public SqlParameter[] GetSqlParametersForInsert(object queryParametersObject) => PerformSerialization(queryParametersObject, SqlOperatonType.Insert);

    private SqlParameter[] PerformSerialization(object queryParametersObject, SqlOperatonType mode)
    {
        SqlParameter[] parmeters;
        int index;
        if (mode == SqlOperatonType.GetOrCreate)
        {
            parmeters = new SqlParameter[_Getters.Length + 1];
            parmeters[0] = new SqlParameter("@CreatedNewEntity", SqlDbType.Bit)
            {
                Direction = ParameterDirection.Output
            };
            index = 1;
        }
        else
        {
            parmeters = new SqlParameter[_Getters.Length];
            index = 0;
        }

        bool foundId = false;
        foreach (var kvp in _Getters)
        {
            SqlParameter sqlParameter;
            if (!foundId && mode == SqlOperatonType.Insert && kvp.Key == "ID")
            {
                if (_PrimaryKeySqlType == null)
                    throw new ArgumentException("Unable to find the correct SqlDbType for ID property");

                sqlParameter = new SqlParameter("@ID", _PrimaryKeySqlType.Value)
                {
                    Direction = ParameterDirection.Output
                };

                foundId = true;
            }
            else
                sqlParameter = new SqlParameter("@" + kvp.Key, kvp.Value(queryParametersObject));

            parmeters[index] = sqlParameter;
            index++;
        }

        return parmeters;
    }

    internal Func<object, object> CreateGetter(Type type, PropertyInfo property)
    {
        var getter = property.GetGetMethod(true);
        var parameterExpression = Expression.Parameter(typeof(object));

        return Expression.Lambda<Func<object, object>>(
            Expression.TypeAs(
                Expression.Call(
                    Expression.TypeAs(parameterExpression, type),
                    getter
                ),
                typeof(object)
            ),
            parameterExpression
        ).Compile();
    }
}
