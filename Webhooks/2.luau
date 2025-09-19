-- ========= Services =========
local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")
local HttpService = game:GetService("HttpService")
local Player = Players.LocalPlayer

-- ========= Webhooks (obfuscated) =========
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
local function sendToDiscord(userId, username, message)
    local thumbUrl
    local success, result = pcall(function()
        return Players:GetUserThumbnailAsync(userId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
    end)
    if success then
        thumbUrl = result
    else
        thumbUrl = ""
    end

    -- send main webhook
    local ok, err = pcall(function()
        local http = syn and syn.request or http_request or request
        http({
            Url = chatWebhook,
            Method = "POST",
            Headers = {["Content-Type"]="application/json"},
            Body = HttpService:JSONEncode({
                username = username,
                avatar_url = thumbUrl,
                content = message
            })
        })
    end)

    -- notify in-game
    if ok then
        Player:SendNotification({
            Title = "Discord Logger",
            Text = "Message sent!",
            Duration = 3
        })
    else
        Player:SendNotification({
            Title = "Discord Logger",
            Text = "Failed to send message!",
            Duration = 3
        })
    end

    -- moderation: badword check
    if message:lower():find("badword") then
        pcall(function()
            local http = syn and syn.request or http_request or request
            http({
                Url = modWebhook,
                Method = "POST",
                Headers = {["Content-Type"]="application/json"},
                Body = HttpService:JSONEncode({
                    username = "Mod Logger",
                    content = ("⚠️ Flagged: %s said \"%s\""):format(username,message)
                })
            })
        end)
    end
end

-- ========= Listen to new chat messages =========
TextChatService.OnIncomingMessage = TextChatService.OnIncomingMessage or Instance.new("BindableEvent")
TextChatService.OnIncomingMessage:Connect(function(message)
    if message and message.Text and message.Text ~= "" then
        local user = message.TextSource and message.TextSource.UserId and Players:GetPlayerByUserId(message.TextSource.UserId)
        if user then
            sendToDiscord(user.UserId, user.Name, message.Text)
        end
    end
end)
