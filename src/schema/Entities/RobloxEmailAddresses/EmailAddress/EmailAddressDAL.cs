namespace Roblox.Platform.Email.Entities;

using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;

using Roblox.Data;
using Roblox.Entities.Mssql;

internal class EmailAddressDAL
{
    private const Roblox.MssqlDatabases.RobloxDatabase _Database = global::Roblox.MssqlDatabases.RobloxDatabase.RobloxEmailAddresses;

    public int ID { get; set; }
    public string Address { get; set; }
    public bool IsBlacklisted { get; set; }
    public bool IsApproved { get; set; }
    public bool IsReviewed { get; set; }
    public DateTime? Reviewed { get; set; }
    public DateTime Created { get; set; }
    public DateTime? Updated { get; set; }

    private static EmailAddressDAL BuildDAL(IDictionary<string, object> record)
    {
        var dal = new EmailAddressDAL();
        dal.ID = (int)record["ID"];
        dal.Address = (string)record["Address"];
        dal.IsBlacklisted = (bool)record["IsBlacklisted"];
        dal.IsApproved = (bool)record["IsApproved"];
        dal.IsReviewed = (bool)record["IsReviewed"];
        dal.Reviewed = record["Reviewed"] != null ? (DateTime)record["Reviewed"] : default(DateTime);
        dal.Created = (DateTime)record["Created"];
        dal.Updated = record["Updated"] != null ? (DateTime)record["Updated"] : default(DateTime);

        return dal;
    }

    internal void Delete()
    {
        _Database.Delete("EmailAddresses_DeleteEmailAddressByID", ID);
    }

    internal void Insert()
    {
        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@ID", ID) { Direction = ParameterDirection.Output },
            new SqlParameter("@Address", Address),
            new SqlParameter("@IsBlacklisted", IsBlacklisted),
            new SqlParameter("@IsApproved", IsApproved),
            new SqlParameter("@IsReviewed", IsReviewed),
            new SqlParameter("@Reviewed", Reviewed == null ? DBNull.Value : (object)Reviewed),
            new SqlParameter("@Created", Created),
            new SqlParameter("@Updated", Updated == null ? DBNull.Value : (object)Updated),
        };

        ID = _Database.Insert<int>("EmailAddresses_InsertEmailAddress", queryParameters);
    }

    internal void Update()
    {
        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@ID", ID),
            new SqlParameter("@Address", Address),
            new SqlParameter("@IsBlacklisted", IsBlacklisted),
            new SqlParameter("@IsApproved", IsApproved),
            new SqlParameter("@IsReviewed", IsReviewed),
            new SqlParameter("@Reviewed", Reviewed == null ? DBNull.Value : (object)Reviewed),
            new SqlParameter("@Created", Created),
            new SqlParameter("@Updated", Updated == null ? DBNull.Value : (object)Updated),
        };

        _Database.Update("EmailAddresses_UpdateEmailAddressByID", queryParameters);
    }

    internal static EmailAddressDAL Get(int id)
    {
        return _Database.Get(
            "EmailAddresses_GetEmailAddressByID",
            id,
            BuildDAL
        );
    }

    public static EmailAddressDAL Get(string address)
    {
        if (string.IsNullOrEmpty(address))
            return null;

        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@Address", address),
        };

        return _Database.Lookup(
            "EmailAddresses_GetEmailAddressByAddress",
            BuildDAL,
            queryParameters
        );
    }

    public static EntityHelper.GetOrCreateDALWrapper<EmailAddressDAL> GetOrCreate(string address)
    {
        if (string.IsNullOrEmpty(address))
            return null;

        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@CreatedNewEntity", SqlDbType.Bit) { Direction = ParameterDirection.Output },
            new SqlParameter("@Address", address),
        };

        return _Database.GetOrCreate(
            "EmailAddresses_GetOrCreateEmailAddress",
            BuildDAL,
            queryParameters
        );
    }

    public static ICollection<int> GetBlacklistedEmailAddressIDsPaged(long startRowIndex, long maximumRows)
    {
        if (startRowIndex < 1)
            throw new ApplicationException("Required value not specified: StartRowIndex.");
        if (maximumRows < 1)
            throw new ApplicationException("Required value not specified: MaximumRows.");

        var queryParameters = new SqlParameter[]
        {
            new SqlParameter("@StartRowIndex", startRowIndex),
            new SqlParameter("@MaximumRows", maximumRows)
        };

        return _Database.GetIDCollection<int>(
            "EmailAddresses_GetAllEmailAddressIDs_Paged",
            queryParameters
        );
    }

    public static int GetTotalNumberOfBlacklistedEmailAddresses()
    {
        return _Database.GetCount<int>(
            "EmailAddresses_GetTotalNumberOfEmailAddresss"
        );
    }

    public static ICollection<EmailAddressDAL> MultiGet(IEnumerable<int> ids)
    {
        return _Database.MultiGet(
            "EmailAddresses_GetEmailAddresssByIDs",
            ids,
            BuildDAL
        );
    }
}