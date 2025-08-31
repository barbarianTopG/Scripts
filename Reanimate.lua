-- /// Credits:
--[[ Gelatekussy (Owner of GelatekHub)
]]

local Global = (getgenv and getgenv()) or shared
Global.GelatekHubConfig = {
	["Permanent Death"] = true,      -- enabled by default
	["Torso Fling"] = false,
	["Bullet Enabled"] = false,
	["Enable Collisions"] = false,
	["Keep Hats On Head"] = true,    -- enabled by default
	["Headless On Perma"] = false,
	["Anti Void"] = false,
	["Anti Void Offset"] = 75
}

-- Shortcut to send messages to RBXGeneral
local function Send(message)
	game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(message)
end

-- Load core function packs
loadstring(game:HttpGet("https://raw.githubusercontent.com/Gelatekussy/GelatekHub/main/src/packages/FunctionPack.lua"))()

-- Reanimate with automatic "-net" after 6.25s
loadstring(game:HttpGet("https://raw.githubusercontent.com/Gelatekussy/GelatekHub/main/src/lib/Reanimate.lua"))()
task.wait(6.25)
Send("-net")

-- Optional: If you want to toggle other features in code, you can do:
-- Global.GelatekHubConfig["Torso Fling"] = true
-- Global.GelatekHubConfig["Bullet Enabled"] = true
-- Global.GelatekHubConfig["Enable Collisions"] = true
-- Global.GelatekHubConfig["Headless On Perma"] = true
-- Global.GelatekHubConfig["Anti Void"] = true