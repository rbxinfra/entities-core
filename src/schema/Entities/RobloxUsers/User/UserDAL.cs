namespace Roblox.Platform.Membership.Entities;

using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;

using Roblox.Data;
using Roblox.Entities.Mssql;

internal class UserDAL
{
    private const Roblox.MssqlDatabases.RobloxDatabase _Database = global::Roblox.MssqlDatabases.RobloxDatabase.RobloxUsers;

    public long ID { get; set; }
    public string Name { get; set; }
    public long? DisplayNameID { get; set; }
    public byte UserModerationStatusID { get; set; }
    public string Description { get; set; }
    public byte AgeBracket { get; set; }
    public long? AgentID { get; set; }
    public DateTime? BirthDate { get; set; }
    public byte? GenderTypeID { get; set; }
    public DateTime Created { get; set; }
    public DateTime? Updated { get; set; }

    private static UserDAL BuildDAL(IDictionary<string, object> record)
    {
        var dal = new UserDAL();
        dal.ID = (long)record["ID"];
        dal.Name = (string)record["Name"];
        dal.DisplayNameID = record["DisplayNameID"] != null ? (long)record["DisplayNameID"] : default(long);
        dal.UserModerationStatusID = (byte)record["UserModerationStatusID"];
        dal.Description = (string)record["Description"];
        dal.AgeBracket = (byte)record["AgeBracket"];
        dal.AgentID = record["AgentID"] != null ? (long)record["AgentID"] : default(long);
        dal.BirthDate = record["BirthDate"] != null ? (DateTime)record["BirthDate"] : default(DateTime);
        dal.GenderTypeID = record["GenderTypeID"] != null ? (byte)record["GenderTypeID"] : default(byte);
        dal.Created = (DateTime)record["Created"];
        dal.Updated = record["Updated"] != null ? (DateTime)record["Updated"] : default(DateTime);

        return dal;
    }

    internal void Delete()
    {
        _Database.Delete("Users_DeleteUserByID", ID);
    }

    internal void Insert()
    {
        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@ID", ID) { Direction = ParameterDirection.Output },
            new SqlParameter("@Name", Name),
            new SqlParameter("@DisplayNameID", DisplayNameID == null ? DBNull.Value : (object)DisplayNameID),
            new SqlParameter("@UserModerationStatusID", UserModerationStatusID),
            new SqlParameter("@Description", Description),
            new SqlParameter("@AgeBracket", AgeBracket),
            new SqlParameter("@AgentID", AgentID == null ? DBNull.Value : (object)AgentID),
            new SqlParameter("@BirthDate", BirthDate == null ? DBNull.Value : (object)BirthDate),
            new SqlParameter("@GenderTypeID", GenderTypeID == null ? DBNull.Value : (object)GenderTypeID),
            new SqlParameter("@Created", Created),
            new SqlParameter("@Updated", Updated == null ? DBNull.Value : (object)Updated),
        };

        ID = _Database.Insert<long>("Users_InsertUser", queryParameters);
    }

    internal void Update()
    {
        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@ID", ID),
            new SqlParameter("@Name", Name),
            new SqlParameter("@DisplayNameID", DisplayNameID == null ? DBNull.Value : (object)DisplayNameID),
            new SqlParameter("@UserModerationStatusID", UserModerationStatusID),
            new SqlParameter("@Description", Description),
            new SqlParameter("@AgeBracket", AgeBracket),
            new SqlParameter("@AgentID", AgentID == null ? DBNull.Value : (object)AgentID),
            new SqlParameter("@BirthDate", BirthDate == null ? DBNull.Value : (object)BirthDate),
            new SqlParameter("@GenderTypeID", GenderTypeID == null ? DBNull.Value : (object)GenderTypeID),
            new SqlParameter("@Created", Created),
            new SqlParameter("@Updated", Updated == null ? DBNull.Value : (object)Updated),
        };

        _Database.Update("Users_UpdateUserByID", queryParameters);
    }

    internal static UserDAL Get(long id)
    {
        return _Database.Get(
            "Users_GetUserByID",
            id,
            BuildDAL
        );
    }

    public static UserDAL GetByName(string name)
    {
        if (string.IsNullOrEmpty(name))
            return null;

        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@Name", name),
        };

        return _Database.Lookup(
            "Users_GetUserByName",
            BuildDAL,
            queryParameters
        );
    }

    public static ICollection<UserDAL> MultiGet(IEnumerable<long> ids)
    {
        return _Database.MultiGet(
            "Users_GetUsersByIDs",
            ids,
            BuildDAL
        );
    }
}