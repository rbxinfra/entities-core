namespace Roblox.Web.ElevatedActions.BLL;

using System;

using Roblox.Entities;

internal class ElevatedActionLogEntity : IElevatedActionLogEntity
{
    /// <inheritdoc cref="IEntity{TId}.Id" />
    public int Id { get; set; }
    /// <inheritdoc cref="IElevatedActionLogEntity.ElevatedActionId" />
    public int ElevatedActionId { get; set; }

    /// <inheritdoc cref="IElevatedActionLogEntity.UserId" />
    public long UserId { get; set; }

    /// <inheritdoc cref="IElevatedActionLogEntity.RoleSetId" />
    public int RoleSetId { get; set; }

    /// <inheritdoc cref="IElevatedActionLogEntity.LogData" />
    public string LogData { get; set; }

    /// <inheritdoc cref="IElevatedActionLogEntity.Success" />
    public bool Success { get; set; }

    /// <inheritdoc cref="IElevatedActionLogEntity.IpAddress" />
    public string IpAddress { get; set; }

    /// <inheritdoc cref="IElevatedActionLogEntity.BrowserTrackerId" />
    public long BrowserTrackerId { get; set; }

    /// <inheritdoc cref="IEntity{TId}.Created" />
    public DateTime Created { get; set; }

    /// <inheritdoc cref="IUpdateableEntity{T}.Updated" />
    public DateTime Updated { get; set; }

    /// <inheritdoc cref="IUpdateableEntity{T}.Update" />
    public void Update()
    {
        var cal = ElevatedActionLog.Get(Id) ?? throw new InvalidOperationException("Attempted update on unpersisted entity.");
        cal.ElevatedActionID = ElevatedActionId;
        cal.UserID = UserId;
        cal.RoleSetID = RoleSetId;
        cal.LogData = LogData;
        cal.Success = Success;
        cal.IpAddress = IpAddress;
        cal.BrowserTrackerID = BrowserTrackerId;

        cal.Save();

        Updated = cal.Updated;
    }

    /// <inheritdoc cref="IEntity{TId}.Delete" />
    public void Delete()
    {
        var cal = ElevatedActionLog.Get(Id) ?? throw new InvalidOperationException("Attempted delete on unpersisted entity.");
        cal.Delete();
    }
}