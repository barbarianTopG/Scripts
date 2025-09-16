local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")

local webhookURL = "https://discord.com/api/webhooks/1417546012347600956/acofRyUB7ZSTG8seQrrPZRuofEtFp0abT2kq2A67n-t9n7IKaq_MCi9jff7yVS5dMRN-"

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
