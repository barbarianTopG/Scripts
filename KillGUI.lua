local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 250, 0, 150)
MainFrame.Position = UDim2.new(0.05, 0, 0.2, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(50, 0, 150)
MainFrame.BorderColor3 = Color3.fromRGB(0,0,0)
MainFrame.BorderSizePixel = 2
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundTransparency = 1
Title.Text = "★ Kill GUI ★"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 20
Title.Parent = MainFrame

local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(0.9, 0, 0, 30)
TextBox.Position = UDim2.new(0.05, 0, 0.3, 0)
TextBox.PlaceholderText = "Enter Username"
TextBox.Text = ""
TextBox.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Font = Enum.Font.SourceSans
TextBox.TextSize = 18
TextBox.Parent = MainFrame

local KillButton = Instance.new("TextButton")
KillButton.Size = UDim2.new(0.9, 0, 0, 30)
KillButton.Position = UDim2.new(0.05, 0, 0.65, 0)
KillButton.Text = "Kill"
KillButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
KillButton.TextColor3 = Color3.fromRGB(255, 255, 255)
KillButton.Font = Enum.Font.SourceSansBold
KillButton.TextSize = 18
KillButton.Parent = MainFrame

local ToggleListButton = Instance.new("TextButton")
ToggleListButton.Size = UDim2.new(0, 100, 0, 30)
ToggleListButton.Position = UDim2.new(1.05, 0, 0, 0)
ToggleListButton.Text = "Player List"
ToggleListButton.BackgroundColor3 = Color3.fromRGB(2, 30, 214)
ToggleListButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleListButton.Font = Enum.Font.SourceSansBold
ToggleListButton.TextSize = 18
ToggleListButton.Parent = MainFrame

local PlayerListBG = Instance.new("Frame")
PlayerListBG.Parent = ScreenGui
PlayerListBG.BackgroundColor3 = Color3.fromRGB(50, 0, 150)
PlayerListBG.BorderColor3 = Color3.fromRGB(0,0,0)
PlayerListBG.BorderSizePixel = 2
PlayerListBG.Position = UDim2.new(0.05, 270, 0.2, 0)
PlayerListBG.Size = UDim2.new(0, 270, 0, 150)
PlayerListBG.Visible = false
PlayerListBG.ClipsDescendants = true

local PlayerList = Instance.new("ScrollingFrame")
PlayerList.Parent = PlayerListBG
PlayerList.Size = UDim2.new(1, 0, 1, 0)
PlayerList.CanvasSize = UDim2.new(0, 0, 0, 0)
PlayerList.ScrollBarThickness = 6
PlayerList.BackgroundTransparency = 1

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = PlayerList
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

local function highlightPlayer(player, state)
    local highlight = player.Character and player.Character:FindFirstChild("ESP_Highlight")
    if state then
        if not highlight and player.Character then
            highlight = Instance.new("Highlight")
            highlight.Name = "ESP_Highlight"
            highlight.FillColor = Color3.fromRGB(255, 0, 0)
            highlight.FillTransparency = 0.5
            highlight.OutlineTransparency = 1
            highlight.Parent = player.Character
        end
    else
        if highlight then
            highlight:Destroy()
        end
    end
end

local function refreshList()
    for _, child in ipairs(PlayerList:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local Button = Instance.new("TextButton")
            Button.Size = UDim2.new(1, -10, 0, 30)
            Button.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
            Button.Text = player.DisplayName .. " (" .. player.Name .. ")"
            Button.TextColor3 = Color3.fromRGB(255, 255, 255)
            Button.Font = Enum.Font.SourceSans
            Button.TextSize = 16
            Button.Parent = PlayerList

            Button.MouseButton1Click:Connect(function()
                TextBox.Text = player.Name
                for _, plr in ipairs(Players:GetPlayers()) do
                    highlightPlayer(plr, plr.Name:lower() == player.Name:lower())
                end
            end)
        end
    end

    PlayerList.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y)
end

Players.PlayerAdded:Connect(refreshList)
Players.PlayerRemoving:Connect(refreshList)

ToggleListButton.MouseButton1Click:Connect(function()
    PlayerListBG.Visible = not PlayerListBG.Visible
    if PlayerListBG.Visible then
        refreshList()
    end
end)

TextBox:GetPropertyChangedSignal("Text"):Connect(function()
    local text = TextBox.Text:lower()
    for _, plr in ipairs(Players:GetPlayers()) do
        highlightPlayer(plr, text ~= "" and plr.Name:lower():find(text))
    end
end)

KillButton.MouseButton1Click:Connect(function()
    local targetName = TextBox.Text:lower()
    for _, player in ipairs(Players:GetPlayers()) do
        if player.Name:lower() == targetName then
            if player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid.Health = 0
            end
        end
    end
end)

refreshList()
