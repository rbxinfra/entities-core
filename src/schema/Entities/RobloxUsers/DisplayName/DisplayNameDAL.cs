namespace Roblox.Platform.Membership.Entities;

using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;

using Roblox.Data;
using Roblox.Entities.Mssql;

internal class DisplayNameDAL
{
    private const Roblox.MssqlDatabases.RobloxDatabase _Database = global::Roblox.MssqlDatabases.RobloxDatabase.RobloxUsers;

    public long ID { get; set; }
    public string Name { get; set; }
    public DateTime Created { get; set; }
    public DateTime? Updated { get; set; }

    private static DisplayNameDAL BuildDAL(IDictionary<string, object> record)
    {
        var dal = new DisplayNameDAL();
        dal.ID = (long)record["ID"];
        dal.Name = (string)record["Name"];
        dal.Created = (DateTime)record["Created"];
        dal.Updated = record["Updated"] != null ? (DateTime)record["Updated"] : default(DateTime);

        return dal;
    }

    internal void Delete()
    {
        _Database.Delete("DisplayNames_DeleteDisplayNameByID", ID);
    }

    internal void Insert()
    {
        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@ID", ID) { Direction = ParameterDirection.Output },
            new SqlParameter("@Name", Name),
            new SqlParameter("@Created", Created),
            new SqlParameter("@Updated", Updated == null ? DBNull.Value : (object)Updated),
        };

        ID = _Database.Insert<long>("DisplayNames_InsertDisplayName", queryParameters);
    }

    internal void Update()
    {
        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@ID", ID),
            new SqlParameter("@Name", Name),
            new SqlParameter("@Created", Created),
            new SqlParameter("@Updated", Updated == null ? DBNull.Value : (object)Updated),
        };

        _Database.Update("DisplayNames_UpdateDisplayNameByID", queryParameters);
    }

    internal static DisplayNameDAL Get(long id)
    {
        return _Database.Get(
            "DisplayNames_GetDisplayNameByID",
            id,
            BuildDAL
        );
    }

    public static EntityHelper.GetOrCreateDALWrapper<DisplayNameDAL> GetOrCreate(string name)
    {
        if (string.IsNullOrEmpty(name))
            return null;

        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@CreatedNewEntity", SqlDbType.Bit) { Direction = ParameterDirection.Output },
            new SqlParameter("@Name", name),
        };

        return _Database.GetOrCreate(
            "DisplayNames_GetOrCreateDisplayName",
            BuildDAL,
            queryParameters
        );
    }
}