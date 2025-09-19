-- ========= Services =========
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")

-- ========= Webhooks =========
local function decode(str)
    local bytes = {}
    for i=1,#str,2 do
        table.insert(bytes, tonumber(str:sub(i,i+1),16))
    end
    return string.char(unpack(bytes))
end

local chatWebhook = decode("68747470733a2f2f646973636f72642e636f6d2f6170692f776562686f6f6b732f313431373535393536323331313838353735312f48317770417a582d346967623349425859455f54324138575f4d3846303841373743736e706b6d6c463065626a6971767a6e6470796b")
local modWebhook  = decode("68747470733a2f2f646973636f72642e636f6d2f6170692f776562686f6f6b732f313431383237333137333231313834303539322f496647535878344b5a58556e70766c5456685572696a5f544e37545a355a484a3262596d614f7971434d766878795f44523936475f68664a64567a4c436a6b4442735869")

-- ========= Helper: Send to Discord =========
local function sendToWebhook(webhookUrl, username, avatar, content)
    local body = HttpService:JSONEncode({
        username = username,
        avatar_url = avatar,
        content = content
    })
    local requestFunction = syn and syn.request or http_request or request
    pcall(function()
        requestFunction({
            Url = webhookUrl,
            Method = "POST",
            Headers = {["Content-Type"]="application/json"},
            Body = body
        })
    end)
end

-- ========= Helper: Get Headshot =========
local function getPlayerAvatar(userId)
    local thumbType = Enum.ThumbnailType.HeadShot
    local thumbSize = Enum.ThumbnailSize.Size420x420
    local success, url = pcall(function()
        return Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)
    end)
    return success and url or ""
end

-- ========= Message Handler =========
local function handleMessage(player, message)
    if not message or message:match("^%s*$") then return end

    local displayName = player.DisplayName
    local username = player.Name
    local timestamp = os.date("%H:%M:%S")
    local avatarUrl = getPlayerAvatar(player.UserId)

    -- send main message
    local content = string.format("[%s] %s: %s", timestamp, message, "")
    sendToWebhook(chatWebhook, ("%s (%s)"):format(displayName, username), avatarUrl, message)

    -- moderation
    if message:lower():find("badword") then
        sendToWebhook(modWebhook, "Mod Logger", "", ("⚠️ Flagged: %s (%s) said \"%s\""):format(displayName, username, message))
    end
end

-- ========= Connect Chatted Events =========
local function connectPlayer(player)
    player.Chatted:Connect(function(msg)
        handleMessage(player, msg)
    end)
end

-- connect existing players
for _,p in ipairs(Players:GetPlayers()) do
    connectPlayer(p)
end

-- connect new players
Players.PlayerAdded:Connect(connectPlayer)
