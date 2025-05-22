namespace Roblox.Web.ElevatedActions.DAL;

using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;

using Roblox.Data;
using Roblox.Entities.Mssql;

internal class ElevatedActionDAL
{
    private const Roblox.MssqlDatabases.RobloxDatabase _Database = global::Roblox.MssqlDatabases.RobloxDatabase.RobloxRoles;

    public int ID { get; set; }
    public string Name { get; set; }
    public string Description { get; set; }
    public DateTime Created { get; set; }
    public DateTime Updated { get; set; }

    private static ElevatedActionDAL BuildDAL(IDictionary<string, object> record)
    {
        var dal = new ElevatedActionDAL();
        dal.ID = (int)record["ID"];
        dal.Name = (string)record["Name"];
        dal.Description = (string)record["Description"];
        dal.Created = (DateTime)record["Created"];
        dal.Updated = (DateTime)record["Updated"];

        return dal;
    }

    internal void Delete()
    {
        _Database.Delete("ElevatedActions_DeleteElevatedActionByID", ID);
    }

    internal void Insert()
    {
        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@ID", ID) { Direction = ParameterDirection.Output },
            new SqlParameter("@Name", Name),
            new SqlParameter("@Description", Description),
            new SqlParameter("@Created", Created),
            new SqlParameter("@Updated", Updated),
        };

        ID = _Database.Insert<int>("ElevatedActions_InsertElevatedAction", queryParameters);
    }

    internal void Update()
    {
        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@ID", ID),
            new SqlParameter("@Name", Name),
            new SqlParameter("@Description", Description),
            new SqlParameter("@Created", Created),
            new SqlParameter("@Updated", Updated),
        };

        _Database.Update("ElevatedActions_UpdateElevatedActionByID", queryParameters);
    }

    internal static ElevatedActionDAL Get(int id)
    {
        return _Database.Get(
            "ElevatedActions_GetElevatedActionByID",
            id,
            BuildDAL
        );
    }

    public static ElevatedActionDAL Get(string name)
    {
        if (string.IsNullOrEmpty(name))
            return null;

        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@Name", name),
        };

        return _Database.Lookup(
            "ElevatedActions_GetElevatedActionByName",
            BuildDAL,
            queryParameters
        );
    }

    public static ICollection<int> GetAllElevatedActionIDs()
    {
        return _Database.GetIDCollection<int>(
            "ElevatedActions_GetAllElevatedActionIDs"
        );
    }
}