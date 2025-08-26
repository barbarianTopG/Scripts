-- /// Da Blacklist

local Players = game:GetService("Players")

local TARGET_USERNAMES = {
    "User1",
    "User2" 
} -- Add more here

local TAG_NAME = "Blacklisted"
local TargetLookup = {}

for _, name in pairs(TARGET_USERNAMES) do
    TargetLookup[name] = true
end

local function Blacklist(player)
    if player.Character then
        if player.Character:FindFirstChild("Head") and player.Character.Head:FindFirstChild(TAG_NAME) then
            return
        end
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "From ChillbyteHD";
            Text = "You are blacklisted by the owner, sorry! :(";
            Duration = 3;
        })
    end
end

for _, player in pairs(Players:GetPlayers()) do
    if TargetLookup[player.Name] then
        Blacklist(player)
        return
    end
end