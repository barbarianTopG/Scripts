local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

local webhookURL = "https://discord.com/api/webhooks/1417559562331885751/H1wpAzX-4igb3IB59XE_T2A8w_mW8F08A77sCnpkmlF0AebjiQVxzNnDPYK8-HAtX8bE"

local function sendMessage(player, message)
 local data = {
  ["username"] = player.Name,
  ["embeds"] = {{
   ["title"] = "New Message",
   ["description"] = message,
   ["color"] = 10494192,
   ["footer"] = {["text"] = os.date("%Y-%m-%d %H:%M:%S")}
  }}
 }
 local jsonData = HttpService:JSONEncode(data)
 HttpService:PostAsync(webhookURL, jsonData, Enum.HttpContentType.ApplicationJson, false)
end

Players.PlayerAdded:Connect(function(player)
 player.Chatted:Connect(function(msg)
  sendMessage(player, msg)
 end)
end)
