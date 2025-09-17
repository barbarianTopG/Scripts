--[[ Dont worry it just sends stuff you can get publicly this isnt a IP Grabber ]]
--// Services
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")

--// Url
local WebhookURL = "https://discord.com/api/webhooks/1417559424473632891/Ynt5h8wFB8LyFLu-eyZVE1ZlGCbPUayAM4NKlSMbCNdZ_ZjGBDnDPvbERU7gVARJOwr6"

local function SendUsageLog(player)
    local userId = player.UserId
    local username = player.Name
    local displayName = player.DisplayName

    -- Roblox headshot
    local thumbType = Enum.ThumbnailType.HeadShot
    local thumbSize = Enum.ThumbnailSize.Size420x420
    local pfpUrl, _ = Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)

    local gameId = game.PlaceId
    local profileUrl = "https://www.roblox.com/users/"..userId.."/profile"
    local gameUrl = "https://www.roblox.com/games/"..gameId

    local data = {
        username = displayName,
        avatar_url = pfpUrl,
        embeds = {{
            title = "Script Executed",
            description = "**"..displayName.."** (@"..username..") executed the script.",
            color = 5814783,
            fields = {
                {
                    name = "User Profile",
                    value = "[View Profile]("..profileUrl..")",
                    inline = true
                },
                {
                    name = "Game Link",
                    value = "[View Game]("..gameUrl..")",
                    inline = true
                }
            },
            footer = {
                text = "User ID: "..tostring(userId)
            },
            timestamp = DateTime.now():ToIsoDate()
        }}
    }

    local json = HttpService:JSONEncode(data)
    HttpService:PostAsync(WebhookURL, json, Enum.HttpContentType.ApplicationJson, false)
end

--// Trigger when executed
local player = Players.LocalPlayer or Players.PlayerAdded:Wait()
SendUsageLog(player)
