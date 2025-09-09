local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NebulaShield"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = player:WaitForChild("PlayerGui")
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
Title.Font = Enum.Font.Arcade
Title.TextSize = 14
Title.Parent = TitleBar

local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
MinimizeButton.Position = UDim2.new(1, -30, 0, 0)
MinimizeButton.BackgroundTransparency = 1
MinimizeButton.Text = "_"
MinimizeButton.TextColor3 = Color3.fromRGB(180, 120, 255)
MinimizeButton.Font = Enum.Font.Arcade
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
AntiFlingLabel.Text = "Anti-Fling"
AntiFlingLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
AntiFlingLabel.TextXAlignment = Enum.TextXAlignment.Left
AntiFlingLabel.Font = Enum.Font.Arcade
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
MinimizedTitle.Font = Enum.Font.Arcade
MinimizedTitle.TextSize = 12
MinimizedTitle.Parent = MinimizedFrame

local MaximizeButton = Instance.new("TextButton")
MaximizeButton.Name = "MaximizeButton"
MaximizeButton.Size = UDim2.new(0, 30, 0, 30)
MaximizeButton.Position = UDim2.new(1, -30, 0, 0)
MaximizeButton.BackgroundTransparency = 1
MaximizeButton.Text = "+"
MaximizeButton.TextColor3 = Color3.fromRGB(180, 120, 255)
MaximizeButton.Font = Enum.Font.Arcade
MaximizeButton.TextSize = 16
MaximizeButton.Parent = MinimizedFrame

local AntiFlingEnabled = true
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")

RunService.Heartbeat:Connect(function()
    if AntiFlingEnabled and rootPart and humanoid and humanoid.Health > 0 then
        humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
        humanoid.PlatformStand = false
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") and part.CanCollide then
                part.CanCollide = false
            end
        end
    end
end)

AntiFlingToggle.MouseButton1Click:Connect(function()
    AntiFlingEnabled = not AntiFlingEnabled
    if AntiFlingEnabled then
        TweenService:Create(AntiFlingToggle, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(120, 70, 200)}):Play()
        TweenService:Create(ToggleCircle, TweenInfo.new(0.2), {Position = UDim2.new(0.8, -8, 0.5, -8)}):Play()
    else
        TweenService:Create(AntiFlingToggle, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50, 50, 60)}):Play()
        TweenService:Create(ToggleCircle, TweenInfo.new(0.2), {Position = UDim2.new(0.2, -8, 0.5, -8)}):Play()
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
            end
        end
    end
end)

MinimizeButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    MinimizedFrame.Visible = true
end)

MaximizeButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
    MinimizedFrame.Visible = false
end)

local dragging, dragInput, dragStart, startPos
local function update(input, frame)
    local delta = input.Position - dragStart
    local goal = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    TweenService:Create(frame, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = goal}):Play()
end

local function drag(frame)
    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input, frame)
        end
    end)
end

drag(TitleBar)
drag(MinimizedFrame)
