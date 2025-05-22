namespace Roblox.Entities.Mssql;

using System;
using System.Linq;
using System.Reflection;
using System.Linq.Expressions;
using System.Collections.Generic;


/// <summary>
/// Cache for the <see cref="DictionaryDeserializer{T}"/>
/// </summary>
/// <typeparam name="T"></typeparam>
public static class DictionaryDeserializerCache<T>
    where T : class, new()
{
    /// <summary>
    /// Static instance of <see cref="DictionaryDeserializerCache{T}"/>
    /// </summary>
    public static readonly DictionaryDeserializer<T> Default = new();
}

/// <summary>
/// Encododer for <see cref="IDictionary{TKey, TValue}"/>
/// </summary>
public static class DictionaryEncoder
{
    /// <summary>
    /// Decode an <see cref="IDictionary{TKey, TValue}"/>
    /// </summary>
    /// <typeparam name="T">The type to decode it to.</typeparam>
    /// <param name="record">The encoded record.</param>
    /// <returns>The decoded record.</returns>
    public static T Decode<T>(IDictionary<string, object> record)
        where T : class, new()
    {
        return DictionaryDeserializerCache<T>.Default.Deserialize(record);
    }
}

/// <summary>
/// Deserializer for <see cref="IDictionary{TKey, TValue}"/>
/// </summary>
/// <typeparam name="T">The type of encoded data.</typeparam>
public class DictionaryDeserializer<T>
    where T : class, new()
{
    private readonly KeyValuePair<string, Action<T, object>>[] _Setters;

    /// <summary>
    /// Construct a new instance of <see cref="DictionaryDeserializer{T}"/>
    /// </summary>
    public DictionaryDeserializer()
    {
        var properties = typeof(T).GetProperties(BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic);
        var setters = new Dictionary<string, Action<T, object>>();
        foreach (var property in properties)
            setters[property.Name] = CreateSetter(property);

        _Setters = setters.ToArray();
    }

    /// <summary>
    /// Deserialize the input <see cref="IDictionary{TKey, TValue}"/>
    /// </summary>
    /// <param name="dictionary">The encoded dictionary.</param>
    /// <returns>The decoded dictionary.</returns>
    public T Deserialize(IDictionary<string, object> dictionary)
    {
        if (dictionary == null) return default(T);

        var t = new T();
        foreach (var kvp in _Setters)
            if (dictionary.TryGetValue(kvp.Key, out var arg))
                kvp.Value(t, arg);

        return t;
    }

    private static Action<T, object> CreateSetter(PropertyInfo property)
    {
        var setMethod = property.GetSetMethod(true);
        var propertyType = property.PropertyType;
        var thisExpression = Expression.Parameter(typeof(T));
        var parameterExpression = Expression.Parameter(typeof(object));
        var expression = property.PropertyType.IsValueType
            ? Expression.Convert(parameterExpression, propertyType)
            : Expression.TypeAs(parameterExpression, propertyType);

        return Expression.Lambda<Action<T, object>>(
            Expression.Call(thisExpression, setMethod, expression),
            thisExpression,
            parameterExpression
        ).Compile();
    }
}
