-- Blacklist

local Players = game:GetService("Players")
local function notif(str,dur)
	game:GetService("StarterGui"):SetCore("SendNotification", { 
    Title = "Service";
    Text = str;})
Duration = dur or 3;
end


local Players = game:GetService("Players")

local TAG_NAME = "Blacklisted"
local TARGET_USERNAMES = { "Username1", "Username2" } -- Add more here

local TargetLookup = {}
for _, name in pairs(TARGET_USERNAMES) do
	TargetLookup[name] = true
end

local function Blacklist(player)
	if player.Character then
		if player.Character.Head:FindFirstChild(TAG_NAME) then return end
local function notif1(str1,dur1)
	game:GetService("StarterGui"):SetCore("SendNotification", { 
    Title = "From ChillbyteHD";
    Text = str1;})
Duration = dur1 or 3;
end
notif1("You Are Blacklisted by the owner! sorry! :( ")
	end
end


wait()
		for _, player in pairs(Players:GetPlayers()) do
			if TargetLookup[player.Name] then         
			return Blacklist(player)
			end
		end