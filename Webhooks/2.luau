local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

local webhookURL = "https://discord.com/api/webhooks/1417559562331885751/H1wpAzX-4igb3IB59XE_T2A8w_mW8F08A77sCnpkmlF0AebjiQVxzNnDPYK8-HAtX8bE"

local function sendMessage(player, message)
    local data = {
        ["username"] = player.Name,
        ["embeds"] = {{
            ["title"] = "💬 Chat Log",
            ["description"] = message,
            ["color"] = 65280,
            ["fields"] = {
                {
                    name = "Player",
                    value = player.Name,
                    inline = true
                },
                {
                    name = "UserId",
                    value = player.UserId,
                    inline = true
                }
            },
            ["footer"] = {
                ["text"] = os.date("📅 %Y-%m-%d | 🕒 %H:%M:%S")
            }
        }}
    }

    local jsonData = HttpService:JSONEncode(data)

    local success, result = pcall(function()
        local response = HttpService:RequestAsync({
            Url = webhookURL,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = jsonData
        })
        return response
    end)

    if not success then
        warn("[WEBHOOK FAILED]: " .. tostring(result))
    end
end

Players.PlayerAdded:Connect(function(player)
    player.Chatted:Connect(function(message)
        sendMessage(player, message)
    end)
end)