-- ~~~~~~ Services ~~~~~~
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local TextChatService = game:GetService("TextChatService")

-- ~~~~~~ Webhooks ~~~~~~
local function decode(str)
    local bytes = {}
    for i = 1, #str, 2 do
        table.insert(bytes, tonumber(str:sub(i, i+1), 16))
    end
    return string.char(unpack(bytes))
end

local chatWebhook = decode("68747470733a2f2f646973636f72642e636f6d2f6170692f776562686f6f6b732f313431373535393536323331313838353735312f48317770417a582d346967623349425859455f54324138575f4d3846303841373743736e706b6d6c463065626a6971767a6e6470796b")
local modWebhook  = decode("68747470733a2f2f646973636f72642e636f6d2f6170692f776562686f6f6b732f313431383237333137333231313834303539322f496647535878344b5a58556e70766c5456685572696a5f544e37545a355a484a3262596d614f7971434d766878795f44523936475f68664a64567a4c436a6b4442735869")

-- ~~~~~~ HTTP Wrapper ~~~~~~
local function sendToWebhook(webhookUrl, username, avatar, content)
    local body = HttpService:JSONEncode({
        username = username,
        avatar_url = avatar,
        content = content
    })
    local req = syn and syn.request or http_request or request
    pcall(function()
        req({Url = webhookUrl, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = body})
    end)
end

-- ~~~~~~ Avatar Helper ~~~~~~
local function getPlayerAvatar(userId)
    local url = "https://www.roblox.com/Thumbs/Avatar.ashx?x=420&y=420&Format=Png" -- fallback
    local ok, result = pcall(function()
        return Players:GetUserThumbnailAsync(userId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
    end)
    if ok and result then url = result end
    return url
end

-- ~~~~~~ Handle Message ~~~~~~
local function handleMessage(player, message)
    if not player or not message or message:match("^%s*$") then return end
    local displayName = player.DisplayName
    local username = player.Name
    local avatarUrl = getPlayerAvatar(player.UserId)
    local timestamp = os.date("%H:%M:%S")
    
    -- Send main message
    sendToWebhook(chatWebhook, ("%s (%s)"):format(displayName, username), avatarUrl, ("[%s] %s"):format(timestamp, message))
    
    -- Moderation check
    if message:lower():find("badword") then
        sendToWebhook(modWebhook, "Mod Logger", "", ("⚠️ Flagged: %s (%s) said \"%s\""):format(displayName, username, message))
    end
end

-- ~~~~~~ Hook TextChatService ~~~~~~
TextChatService.OnIncomingMessage = function(messageData)
    local speakerName = messageData.FromSpeaker
    local player = speakerName and Players:FindFirstChild(speakerName)
    if player then
        handleMessage(player, messageData.Message)
    end
end