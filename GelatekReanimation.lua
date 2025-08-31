-- /// Credits to Gelatekussy for the Original Gelatek Hub.

local Global = (getgenv and getgenv()) or shared
Global.GelatekHubConfig = {
	["Permanent Death"] = false,
	["Torso Fling"] = false,
	["Bullet Enabled"] = false,
	["Enable Collisions"] = false,
	["Keep Hats On Head"] = false,
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

-- Load UI library
local Library
if Global.OldGui ~= true then
	Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Gelatekussy/GelatekHub/main/src/lib/AltUiLib.lua"))()
else
	Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Gelatekussy/GelatekHub/main/src/lib/UILibrary.lua"))()
end

local Main = Library:Create("Gelatek Hub")
local UserInputService = game:GetService("UserInputService")

if UserInputService.TouchEnabled then
	game.StarterGui:SetCore("SendNotification", {
		Title = "MOBILE USER ALERT! ";
		Text = "This hub was never really meant to support mobile executors for a reasons, check discord for info.";
		Duration = 5
	})
end

-- Create Reanimate tab
local Reanimate = Main:MakeTab("Reanimate")

-- Reanimate button with 6.25s delay to send "-net"
Reanimate:MakeButton("Reanimate", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Gelatekussy/GelatekHub/main/src/lib/Reanimate.lua"))()
	task.wait(6.25)
	Send("-net")
end)

-- Reanimate Toggles
Reanimate:MakeToggle("Permanent Death", function(Bool)
	Global.GelatekHubConfig["Permanent Death"] = Bool
end)
Reanimate:MakeToggle("Torso Fling", function(Bool)
	Global.GelatekHubConfig["Torso Fling"] = Bool
end)
Reanimate:MakeToggle("Bullet Enabled", function(Bool)
	Global.GelatekHubConfig["Bullet Enabled"] = Bool
end)
Reanimate:MakeToggle("Enable Collisions", function(Bool)
	Global.GelatekHubConfig["Enable Collisions"] = Bool
end)
Reanimate:MakeToggle("Keep Hats On Head", function(Bool)
	Global.GelatekHubConfig["Keep Hats On Head"] = Bool
end)
Reanimate:MakeToggle("Headless On Perma", function(Bool)
	Global.GelatekHubConfig["Headless On Perma"] = Bool
end)
Reanimate:MakeToggle("Disable Animations", function(Bool)
	Global.GelatekHubConfig["Disable Anims"] = Bool
end)
Reanimate:MakeToggle("Anti Void", function(Bool)
	Global.GelatekHubConfig["Anti Void"] = Bool
end)

-- Create Free Scripts tab
local FreeScripts = Main:MakeTab("Free Scripts")

local function BetterStopScript()
	StopScript()
	task.wait(0.25)
	StopScript()
end

-- Stop Script button
FreeScripts:MakeButton(" - [ Stop Script ] - ", BetterStopScript)