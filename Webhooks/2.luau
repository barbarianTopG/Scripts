-- ========= Services =========
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

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

-- ========= GUI =========
local screenGui = Instance.new("ScreenGui", PlayerGui)
screenGui.Name = "ChatLoggerGui"

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 600, 0, 400)
frame.Position = UDim2.new(0.5, -300, 0.5, -200)
frame.BackgroundColor3 = Color3.fromRGB(245,245,245)
frame.BorderSizePixel = 1

local logFrame = Instance.new("ScrollingFrame", frame)
logFrame.Size = UDim2.new(1, -20, 0, 300)
logFrame.Position = UDim2.new(0, 10, 0, 10)
logFrame.BackgroundColor3 = Color3.fromRGB(250,250,250)
logFrame.BorderSizePixel = 1
logFrame.CanvasSize = UDim2.new(0,0,0,0)
logFrame.ScrollBarThickness = 6

local uiListLayout = Instance.new("UIListLayout", logFrame)
uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
uiListLayout.Padding = UDim.new(0,4)

local messageBox = Instance.new("TextBox", frame)
messageBox.Size = UDim2.new(0.75, -10, 0, 30)
messageBox.Position = UDim2.new(0, 10, 0, 320)
messageBox.PlaceholderText = "Message"
messageBox.BackgroundColor3 = Color3.fromRGB(255,255,255)

local sendButton = Instance.new("TextButton", frame)
sendButton.Size = UDim2.new(0.2, -10, 0, 30)
sendButton.Position = UDim2.new(0.78, 0, 0, 320)
sendButton.Text = "Send"
sendButton.BackgroundColor3 = Color3.fromRGB(50,150,50)

-- ========= Logging =========
local function addLog(user, msg)
    local label = Instance.new("TextLabel", logFrame)
    label.Size = UDim2.new(1,0,0,20)
    label.BackgroundTransparency = 1
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Text = ("[%s] %s: %s"):format(os.date("%X"), user, msg)
    logFrame.CanvasSize = UDim2.new(0,0,0,uiListLayout.AbsoluteContentSize.Y)
end

-- ========= Send to Discord =========
local function send()
    local user = Player.Name
    local msg  = messageBox.Text:match("%S+")
    if not msg then return end
    addLog(user,msg)

    -- get player's headshot for avatar
    local thumbType = Enum.ThumbnailType.HeadShot
    local thumbSize = Enum.ThumbnailSize.Size420x420
    local success, thumbUrl = pcall(function()
        return Players:GetUserThumbnailAsync(Player.UserId, thumbType, thumbSize)
    end)
    if not success then thumbUrl = "" end

    -- send main webhook
    pcall(function()
        local http = syn and syn.request or http_request or request
        http({
            Url = chatWebhook,
            Method = "POST",
            Headers = {["Content-Type"]="application/json"},
            Body = HttpService:JSONEncode({
                username = user,
                avatar_url = thumbUrl,
                content = msg
            })
        })
    end)

    -- moderation check
    if msg:lower():find("badword") then
        pcall(function()
            local http = syn and syn.request or http_request or request
            http({
                Url = modWebhook,
                Method = "POST",
                Headers = {["Content-Type"]="application/json"},
                Body = HttpService:JSONEncode({
                    username = "Mod Logger",
                    content = ("⚠️ Flagged: %s said \"%s\""):format(user,msg)
                })
            })
        end)
    end

    messageBox.Text = ""
end

sendButton.MouseButton1Click:Connect(send)
messageBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then send() end
end)
