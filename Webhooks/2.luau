local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")

local webhookURL = "https://discord.com/api/webhooks/1417559562331885751/H1wpAzX-4igb3IB59XE_T2A8w_mW8F08A77sCnpkmlF0AebjiQVxzNnDPYK8-HAtX8bE"

local function getAvatarUrl(userId)
	return "https://www.roblox.com/headshot-thumbnail/image?userId=" .. userId .. "&width=100&height=100&format=png"
end

local function sendMessageToDiscord(player, msg)
	local payload = {
		username = player.DisplayName .. " (@" .. player.Name .. ")",
		avatar_url = getAvatarUrl(player.UserId),
		content = msg
	}
	local jsonData = HttpService:JSONEncode(payload)
	pcall(function()
		HttpService:PostAsync(webhookURL, jsonData, Enum.HttpContentType.ApplicationJson, false)
	end)
end

TextChatService.OnIncomingMessage = function(message)
	if message.TextSource and message.Text and message.TextChannel then

		if message.TextChannel.Name ~= "Whisper" then
			local plr = Players:GetPlayerByUserId(message.TextSource.UserId)
			if plr then
				sendMessageToDiscord(plr, message.Text)
			end
		end
	end
end
