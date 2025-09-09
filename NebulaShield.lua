local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local Arcade = Enum.Font.Arcade

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NebulaShield"
ScreenGui.Parent = player.PlayerGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 300, 0, 200)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Size = UDim2.new(1, 0, 0, 30)
TitleBar.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, -60, 1, 0)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "NEBULA SHIELD v2.1"
Title.TextColor3 = Color3.fromRGB(180, 120, 255)
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Font = Arcade
Title.TextSize = 14
Title.Parent = TitleBar

local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
MinimizeButton.Position = UDim2.new(1, -30, 0, 0)
MinimizeButton.BackgroundTransparency = 1
MinimizeButton.Text = "_"
MinimizeButton.TextColor3 = Color3.fromRGB(180, 120, 255)
MinimizeButton.Font = Arcade
MinimizeButton.TextSize = 16
MinimizeButton.Parent = TitleBar

local Content = Instance.new("Frame")
Content.Name = "Content"
Content.Size = UDim2.new(1, -20, 1, -50)
Content.Position = UDim2.new(0, 10, 0, 40)
Content.BackgroundTransparency = 1
Content.Parent = MainFrame

local AntiFlingFrame = Instance.new("Frame")
AntiFlingFrame.Name = "AntiFlingFrame"
AntiFlingFrame.Size = UDim2.new(1, 0, 0, 40)
AntiFlingFrame.BackgroundTransparency = 1
AntiFlingFrame.Parent = Content

local AntiFlingLabel = Instance.new("TextLabel")
AntiFlingLabel.Name = "AntiFlingLabel"
AntiFlingLabel.Size = UDim2.new(1, -50, 1, 0)
AntiFlingLabel.BackgroundTransparency = 1
AntiFlingLabel.Text = "Anti-Fling (No Collisions)"
AntiFlingLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
AntiFlingLabel.TextXAlignment = Enum.TextXAlignment.Left
AntiFlingLabel.Font = Arcade
AntiFlingLabel.TextSize = 14
AntiFlingLabel.Parent = AntiFlingFrame

local AntiFlingToggle = Instance.new("TextButton")
AntiFlingToggle.Name = "AntiFlingToggle"
AntiFlingToggle.Size = UDim2.new(0, 40, 0, 20)
AntiFlingToggle.Position = UDim2.new(1, -40, 0.5, -10)
AntiFlingToggle.BackgroundColor3 = Color3.fromRGB(120, 70, 200)
AntiFlingToggle.BorderSizePixel = 0
AntiFlingToggle.Text = ""
AntiFlingToggle.Parent = AntiFlingFrame

local UICorner2 = Instance.new("UICorner")
UICorner2.CornerRadius = UDim.new(0, 10)
UICorner2.Parent = AntiFlingToggle

local ToggleCircle = Instance.new("Frame")
ToggleCircle.Name = "ToggleCircle"
ToggleCircle.Size = UDim2.new(0, 16, 0, 16)
ToggleCircle.Position = UDim2.new(0.8, -8, 0.5, -8)
ToggleCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ToggleCircle.BorderSizePixel = 0
ToggleCircle.Parent = AntiFlingToggle

local UICorner3 = Instance.new("UICorner")
UICorner3.CornerRadius = UDim.new(0, 10)
UICorner3.Parent = ToggleCircle

local PreventToolsFrame = Instance.new("Frame")
PreventToolsFrame.Name = "PreventToolsFrame"
PreventToolsFrame.Size = UDim2.new(1, 0, 0, 40)
PreventToolsFrame.Position = UDim2.new(0, 0, 0, 50)
PreventToolsFrame.BackgroundTransparency = 1
PreventToolsFrame.Parent = Content

local PreventToolsLabel = Instance.new("TextLabel")
PreventToolsLabel.Name = "PreventToolsLabel"
PreventToolsLabel.Size = UDim2.new(1, -50, 1, 0)
PreventToolsLabel.BackgroundTransparency = 1
PreventToolsLabel.Text = "Prevent Tools"
PreventToolsLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
PreventToolsLabel.TextXAlignment = Enum.TextXAlignment.Left
PreventToolsLabel.Font = Arcade
PreventToolsLabel.TextSize = 14
PreventToolsLabel.Parent = PreventToolsFrame

local PreventToolsToggle = Instance.new("TextButton")
PreventToolsToggle.Name = "PreventToolsToggle"
PreventToolsToggle.Size = UDim2.new(0, 40, 0, 20)
PreventToolsToggle.Position = UDim2.new(1, -40, 0.5, -10)
PreventToolsToggle.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
PreventToolsToggle.BorderSizePixel = 0
PreventToolsToggle.Text = ""
PreventToolsToggle.Parent = PreventToolsFrame

local UICorner4 = Instance.new("UICorner")
UICorner4.CornerRadius = UDim.new(0, 10)
UICorner4.Parent = PreventToolsToggle

local ToggleCircle2 = Instance.new("Frame")
ToggleCircle2.Name = "ToggleCircle2"
ToggleCircle2.Size = UDim2.new(0, 16, 0, 16)
ToggleCircle2.Position = UDim2.new(0.2, -8, 0.5, -8)
ToggleCircle2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ToggleCircle2.BorderSizePixel = 0
ToggleCircle2.Parent = PreventToolsToggle

local UICorner5 = Instance.new("UICorner")
UICorner5.CornerRadius = UDim.new(0, 10)
UICorner5.Parent = ToggleCircle2

local MinimizedFrame = Instance.new("Frame")
MinimizedFrame.Name = "MinimizedFrame"
MinimizedFrame.Size = UDim2.new(0, 150, 0, 30)
MinimizedFrame.Position = UDim2.new(0.5, -75, 0, 10)
MinimizedFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
MinimizedFrame.BorderSizePixel = 0
MinimizedFrame.Visible = false
MinimizedFrame.Parent = ScreenGui

local UICorner6 = Instance.new("UICorner")
UICorner6.CornerRadius = UDim.new(0, 8)
UICorner6.Parent = MinimizedFrame

local MinimizedTitle = Instance.new("TextLabel")
MinimizedTitle.Name = "MinimizedTitle"
MinimizedTitle.Size = UDim2.new(1, -30, 1, 0)
MinimizedTitle.Position = UDim2.new(0, 10, 0, 0)
MinimizedTitle.BackgroundTransparency = 1
MinimizedTitle.Text = "NEBULA SHIELD"
MinimizedTitle.TextColor3 = Color3.fromRGB(180, 120, 255)
MinimizedTitle.TextXAlignment = Enum.TextXAlignment.Left
MinimizedTitle.Font = Arcade
MinimizedTitle.TextSize = 12
MinimizedTitle.Parent = MinimizedFrame

local MaximizeButton = Instance.new("TextButton")
MaximizeButton.Name = "MaximizeButton"
MaximizeButton.Size = UDim2.new(0, 30, 0, 30)
MaximizeButton.Position = UDim2.new(1, -30, 0, 0)
MaximizeButton.BackgroundTransparency = 1
MaximizeButton.Text = "+"
MaximizeButton.TextColor3 = Color3.fromRGB(180, 120, 255)
MaximizeButton.Font = Arcade
MaximizeButton.TextSize = 16
MaximizeButton.Parent = MinimizedFrame

local AntiFlingEnabled = true
local PreventToolsEnabled = false

local function ToggleAntiFling()
    AntiFlingEnabled = not AntiFlingEnabled
    if AntiFlingEnabled then
        TweenService:Create(AntiFlingToggle, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(120, 70, 200)}):Play()
        TweenService:Create(ToggleCircle, TweenInfo.new(0.2), {Position = UDim2.new(0.8, -8, 0.5, -8)}):Play()
        -- Enable anti-fling
        disableCollisions()
    else
        TweenService:Create(AntiFlingToggle, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50, 50, 60)}):Play()
        TweenService:Create(ToggleCircle, TweenInfo.new(0.2), {Position = UDim2.new(0.2, -8, 0.5, -8)}):Play()
        -- Disable anti-fling
        enableCollisions()
    end
end

local function TogglePreventTools()
    PreventToolsEnabled = not PreventToolsEnabled
    if PreventToolsEnabled then
        TweenService:Create(PreventToolsToggle, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(120, 70, 200)}):Play()
        TweenService:Create(ToggleCircle2, TweenInfo.new(0.2), {Position = UDim2.new(0.8, -8, 0.5, -8)}):Play()
    else
        TweenService:Create(PreventToolsToggle, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50, 50, 60)}):Play()
        TweenService:Create(ToggleCircle2, TweenInfo.new(0.2), {Position = UDim2.new(0.2, -8, 0.5, -8)}):Play()
    end
end

local function MinimizeGUI()
    MainFrame.Visible = false
    MinimizedFrame.Visible = true
end

local function MaximizeGUI()
    MainFrame.Visible = true
    MinimizedFrame.Visible = false
end

MinimizeButton.MouseButton1Click:Connect(MinimizeGUI)
MaximizeButton.MouseButton1Click:Connect(MaximizeGUI)

local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

TitleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

TitleBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

MinimizedFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MinimizedFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

MinimizedFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging and MinimizedFrame.Visible then
        local delta = input.Position - dragStart
        MinimizedFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

local originalCollisions = {}

local function disableCollisions()
    if not character then return end
    
    for _, part in pairs(character:GetDescendants()) do
        if part:IsA("BasePart") and part.CanCollide then
            originalCollisions[part] = part.CanCollide
            part.CanCollide = false
        end
    end
end

local function enableCollisions()
    if not character then return end
    
    for part, canCollide in pairs(originalCollisions) do
        if part.Parent then
            part.CanCollide = canCollide
        end
    end
    originalCollisions = {}
end

player.CharacterAdded:Connect(function(newChar)
    character = newChar
    humanoid = newChar:WaitForChild("Humanoid")
    
    if AntiFlingEnabled then
        disableCollisions()
    end
end)

AntiFlingToggle.MouseButton1Click:Connect(ToggleAntiFling)
PreventToolsToggle.MouseButton1Click:Connect(TogglePreventTools)

if character then
    disableCollisions()
end

local toolConnection = nil

local function setupToolListener(char)
    if toolConnection then
        toolConnection:Disconnect()
    end
    
    toolConnection = char.ChildAdded:Connect(function(child)
        if PreventToolsEnabled and child:IsA("Tool") then
            local humanoid = char:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:UnequipTools()
            end
        end
    end)
end

local function onCharacterAdded(char)
    setupToolListener(char)
end

if player.Character then
    onCharacterAdded(player.Character)
end

player.CharacterAdded:Connect(onCharacterAdded)

RunService.Heartbeat:Connect(function()
    if PreventToolsEnabled and player.Character then
        local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
        if humanoid and humanoid:FindFirstChildOfClass("Tool") then
            humanoid:UnequipTools()
        end
    end
end)