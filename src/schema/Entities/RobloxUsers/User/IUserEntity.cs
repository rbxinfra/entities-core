namespace Roblox.Platform.Membership.Entities;

using System;

using Roblox.Entities;

internal interface IUserEntity : IUpdateableEntity<long>
{
    /// <summary>
    /// Gets the name of the user
    /// </summary>
    string Name { get; set; }

    /// <summary>
    /// Gets the display name of the user
    /// </summary>
    long? DisplayNameId { get; set; }

    /// <summary>
    /// Gets the moderation status type ID of the user
    /// </summary>
    byte UserModerationStatusId { get; set; }

    /// <summary>
    /// Gets the description of the user
    /// </summary>
    string Description { get; set; }

    /// <summary>
    /// Gets the age bracket of the user
    /// </summary>
    byte AgeBracket { get; set; }

    /// <summary>
    /// Gets the agent ID of the user
    /// </summary>
    long? AgentId { get; set; }

    /// <summary>
    /// Gets the birth date of the user
    /// </summary>
    DateTime? BirthDate { get; set; }

    /// <summary>
    /// Gets the gender type ID of the user
    /// </summary>
    byte? GenderTypeId { get; set; }

}