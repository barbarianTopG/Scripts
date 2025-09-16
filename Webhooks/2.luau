--[[ Ts is just a chat logger i use for myself ]]

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")

local webhookURL = "https://discord.com/api/webhooks/1417546012347600956/acofRyUB7ZSTG8seQrrPZRuofEtFp0abT2kq2A67n-t9n7IKaq_MCi9jff7yVS5dMRN-"

local function sendMessage(player, msg)
local thumb = Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
local data = {
username = player.DisplayName .. " (@" .. player.Name .. ")",
avatar_url = thumb,
content = msg
}
local jsonData = HttpService:JSONEncode(data)
pcall(function()
HttpService:PostAsync(webhookURL, jsonData, Enum.HttpContentType.ApplicationJson)
end)
end

TextChatService.OnIncomingMessage = function(message)
local plr = Players:GetPlayerByUserId(message.TextSource and message.TextSource.UserId or 0)
if plr and message.Text then
sendMessage(plr, message.Text)
end
end
