local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")
local StarterGui = game:GetService("StarterGui")
local lp = Players.LocalPlayer

local function gplr(String)
    local Found = {}
    local strl = String:lower()
    if strl == "all" then
        for i,v in pairs(Players:GetPlayers()) do
            table.insert(Found,v)
        end
    elseif strl == "others" then
        for i,v in pairs(Players:GetPlayers()) do
            if v.Name ~= lp.Name then
                table.insert(Found,v)
            end
        end
    elseif strl == "me" then
        table.insert(Found, lp)
    else
        for i,v in pairs(Players:GetPlayers()) do
            if v.Name:lower():sub(1, #String) == String:lower() then
                table.insert(Found,v)
            end
        end
    end
    return Found
end

local function notify(text)
    StarterGui:SetCore("SendNotification", {
        Title = "+ Dupe GUI V1 +";
        Text = text;
        Duration = 3;
    })
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local ui = Instance.new("Frame")
ui.Parent = ScreenGui
ui.BackgroundColor3 = Color3.fromRGB(33, 0, 84)
ui.BorderSizePixel = 0
ui.Position = UDim2.new(0.254, 0, 0.42, 0)
ui.Size = UDim2.new(0, 278, 0, 220)
ui.Active = true
ui.Draggable = true

local UICorner = Instance.new("UICorner")
UICorner.Parent = ui
UICorner.CornerRadius = UDim.new(0.1, 0)

local title = Instance.new("TextLabel")
title.Parent = ui
title.BackgroundTransparency = 1
title.Position = UDim2.new(0, 0, 0.02, 0)
title.Size = UDim2.new(1, 0, 0, 50)
title.Font = Enum.Font.SourceSans
title.Text = "• Dupe GUI •"
title.TextColor3 = Color3.fromRGB(150, 0, 255)
title.TextScaled = true

local Frame = Instance.new("Frame")
Frame.Parent = title
Frame.BackgroundColor3 = Color3.fromRGB(150, 0, 255)
Frame.Position = UDim2.new(0.07, 0, 0.86, 0)
Frame.Size = UDim2.new(0.85, 0, 0, 6)

local Username = Instance.new("TextBox")
Username.Parent = ui
Username.BackgroundColor3 = Color3.new(1, 1, 1)
Username.Position = UDim2.new(0.1, 0, 0.3, 0)
Username.Size = UDim2.new(0.6, 0, 0, 50)
Username.Font = Enum.Font.SourceSans
Username.PlaceholderText = "Username"
Username.Text = ""
Username.TextColor3 = Color3.new(0, 0, 0)
Username.TextScaled = true

local PlayerList = Instance.new("ScrollingFrame")
PlayerList.Parent = ui
PlayerList.Position = UDim2.new(0.1, 0, 0.55, 0)
PlayerList.Size = UDim2.new(0.8, 0, 0.35, 0)
PlayerList.CanvasSize = UDim2.new(0, 0, 0, 0)
PlayerList.ScrollBarThickness = 6
PlayerList.BackgroundTransparency = 0.1
PlayerList.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

local function refreshPlayerList()
    for _,child in pairs(PlayerList:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end
    local y = 0
    for _,player in ipairs(Players:GetPlayers()) do
        local btn = Instance.new("TextButton")
        btn.Parent = PlayerList
        btn.Size = UDim2.new(1, 0, 0, 30)
        btn.Position = UDim2.new(0, 0, 0, y)
        btn.Text = player.DisplayName .. " (" .. player.Name .. ")"
        btn.TextScaled = true
        btn.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
        btn.MouseButton1Click:Connect(function()
            Username.Text = player.Name
        end)
        y = y + 30
    end
    PlayerList.CanvasSize = UDim2.new(0, 0, 0, y)
end

refreshPlayerList()
Players.PlayerAdded:Connect(refreshPlayerList)
Players.PlayerRemoving:Connect(refreshPlayerList)

local DupeButton = Instance.new("TextButton")
DupeButton.Parent = ui
DupeButton.Size = UDim2.new(0.2, 0, 0, 50)
DupeButton.Position = UDim2.new(0.72, 0, 0.3, 0)
DupeButton.Text = "Dupe"
DupeButton.TextScaled = true
DupeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)

DupeButton.MouseButton1Click:Connect(function()
    local target = gplr(Username.Text)[1]
    if target then
        local message = "Duping item to " .. target.DisplayName .. "..."
        TextChatService.TextChannels.RBXGeneral:SendAsync(message)
        notify(message)
    else
        notify("Player not found.")
    end
end)