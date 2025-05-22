using System;
using Newtonsoft.Json;
using Roblox;
using Roblox.Platform.Moderation.Entities;
using Roblox.Platform.Membership.Entities;
using Roblox.Platform.Devices.Entities;
using Roblox.Platform.Agents.Entities;

var test = TestEnum.MustGet(TestEnum.Test1Value);

Console.WriteLine(test.ID);
Console.WriteLine(TestEnum.Test1ID);

Console.WriteLine(test.ID);

Console.WriteLine(DeviceType.Get(DeviceType.PhoneID));

void createDisplayName(User user, string displayName) {
  var displayNameE = DisplayName.GetOrCreate(displayName);

  DisplayNameHistory.CreateNew(user.ID, displayNameE.ID);
}

void setUserName(User user, string userName) {

  if (user.Name == userName)
    return;
  user.Name = userName;
  user.Save();
  UserNameHistory.CreateNew(user.ID, userName);
}

var user = User.Get("Roblox");
if (user == null) {
  user = new User();

  user.Name = "Roblox";
  user.UserModerationStatusID = UserStatus.OkID;
  user.Description =
      "Welcome to the Roblox profile! This is where you can check out the " +
      "newest items in the catalog, and get a jumpstart on exploring and " +
      "building on our Imagination Platform. If you want news on updates to " +
      "the Roblox platform, or great new experiences to play with friends, " +
      "check out blog.roblox.com. Please note, this is an automated account. " +
      "If you need to reach Roblox for any customer service needs find help " +
      "at www.roblox.com/help";
  user.AgeBracket = 1;
  user.GenderTypeID = GenderType.MaleID;
  createDisplayName(user, "Roblox 22");
  UserNameHistory.CreateNew(user.ID, user.Name);
  user.AgentID = Agent.CreateNew(AgentType.UserID, user.ID).ID;
  user.Save();
}

var rng = new Random();

for (int i = 0; i < 20; i++)
  lock (user) createDisplayName(user, rng.Next(1, 100000000).ToString());

setUserName(user, "Test");

Console.WriteLine(JsonConvert.SerializeObject(user));
