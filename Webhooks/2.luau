--// This is just my personal chat logger

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local MarketplaceService = game:GetService("MarketplaceService")

local webhookURL = "YOUR_WEBHOOK_HERE"

local function getPlayerThumbnail(player)
    local success, thumb = pcall(function()
        return Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
    end)
    if success and thumb then
        return thumb
    else
        return "" 
    end
end

local function getPlaceName()
    local success, name = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId).Name
    end)
    return success and name or tostring(game.PlaceId)
end

local function sendToWebhook(player, message)
    local avatarURL = getPlayerThumbnail(player)
    local placeName = getPlaceName()

    local payload = {
        username = tostring(player.Name),
        avatar_url = tostring(avatarURL),
        embeds = {{
            title = "💬 Roblox Chat",
            color = 3447003, -- blue
            fields = {
                {name = "Player", value = tostring(player.Name), inline = true},
                {name = "Message", value = tostring(message), inline = false},
                {name = "Place", value = tostring(placeName), inline = true}
            },
            timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
        }}
    }

    pcall(function()
        HttpService:PostAsync(webhookURL, HttpService:JSONEncode(payload), Enum.HttpContentType.ApplicationJson)
    end)
end

local function onPlayerChatted(player, message, recipient)
    if recipient == nil then
        sendToWebhook(player, message)
    end
end

for _, player in pairs(Players:GetPlayers()) do
    player.Chatted:Connect(function(msg, recipient)
        onPlayerChatted(player, msg, recipient)
    end)
end

Players.PlayerAdded:Connect(function(player)
    player.Chatted:Connect(function(msg, recipient)
        onPlayerChatted(player, msg, recipient)
    end)
end)
