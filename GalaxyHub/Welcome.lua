local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local StarterGui = game:GetService("StarterGui")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- Its basic stuff, cuh
local function loadHub()
    if _G.GalaxyHub and _G.GalaxyHub.HubLoaded then return end
    if not _G.GalaxyHub then _G.GalaxyHub = {} end
    _G.GalaxyHub.HubLoaded = true
    
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/Scripts/refs/heads/main/GalaxyHub/Script.lua"))()
end

if not _G.GalaxyHub then
    _G.GalaxyHub = {}
end

if _G.GalaxyHub.WelcomeGUILoaded then return end
_G.GalaxyHub.WelcomeGUILoaded = true

if PlayerGui:FindFirstChild("WelcomeGUI") then
    PlayerGui:FindFirstChild("WelcomeGUI"):Destroy()
end

local welcomeMessages = {
    "Hi, ", "Hello, ", "Hey, ", "Welcome, ", "Greetings, ", "Howdy, ", "Sup, ", 
    "What's up, ", "Nice to see you, ", "Good to see you, ", "Ciao, ", "Bonjour, ", 
    "Hola, ", "こんにちは, ", "안녕하세요, ", "你好, ", "Wsp, ", "Oi, ", "Hallo, ", "Hej, "
}

local randomWelcome = welcomeMessages[math.random(1, #welcomeMessages)] .. Player.Name .. "!"

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = PlayerGui
ScreenGui.ResetOnSpawn = false
ScreenGui.Name = "WelcomeGUI"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 400, 0, 300)
Frame.Position = UDim2.new(0.5, 0, -0.5, 0)
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Frame.BorderSizePixel = 0
Frame.ClipsDescendants = true
Frame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 15)
UICorner.Parent = Frame

local Gradient = Instance.new("UIGradient")
Gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 0, 80)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 15, 15))
}
Gradient.Rotation = -45
Gradient.Parent = Frame

local ProfileFrame = Instance.new("Frame")
ProfileFrame.Size = UDim2.new(0, 80, 0, 80)
ProfileFrame.Position = UDim2.new(0.5, -40, 0.1, 0)
ProfileFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
ProfileFrame.BorderSizePixel = 0
ProfileFrame.Parent = Frame

local ProfileCorner = Instance.new("UICorner")
ProfileCorner.CornerRadius = UDim.new(1, 0)
ProfileCorner.Parent = ProfileFrame

local ProfileImage = Instance.new("ImageLabel")
ProfileImage.Size = UDim2.new(0, 70, 0, 70)
ProfileImage.Position = UDim2.new(0.5, -35, 0.5, -35)
ProfileImage.BackgroundTransparency = 1
ProfileImage.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. Player.UserId .. "&width=420&height=420&format=png"
ProfileImage.Parent = ProfileFrame

local ProfileImageCorner = Instance.new("UICorner")
ProfileImageCorner.CornerRadius = UDim.new(1, 0)
ProfileImageCorner.Parent = ProfileImage

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Position = UDim2.new(0, 0, 0.35, 0)
Title.BackgroundTransparency = 1
Title.Text = randomWelcome
Title.TextColor3 = Color3.fromRGB(200, 200, 200)
Title.Font = Enum.Font.Arcade
Title.TextSize = 22
Title.Parent = Frame

local Subtitle = Instance.new("TextLabel")
Subtitle.Size = UDim2.new(1, 0, 0, 30)
Subtitle.Position = UDim2.new(0, 0, 0.45, 0)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "Local Hub"
Subtitle.TextColor3 = Color3.fromRGB(180, 100, 255)
Subtitle.Font = Enum.Font.Arcade
Subtitle.TextSize = 18
Subtitle.Parent = Frame

local TimerContainer = Instance.new("Frame")
TimerContainer.Size = UDim2.new(0.8, 0, 0, 6)
TimerContainer.Position = UDim2.new(0.1, 0, 0.65, 0)
TimerContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TimerContainer.BorderSizePixel = 0
TimerContainer.Parent = Frame

local TimerContainerCorner = Instance.new("UICorner")
TimerContainerCorner.CornerRadius = UDim.new(1, 0)
TimerContainerCorner.Parent = TimerContainer

local TimerLine = Instance.new("Frame")
TimerLine.Size = UDim2.new(0, 0, 1, 0)
TimerLine.BackgroundColor3 = Color3.fromRGB(180, 100, 255)
TimerLine.BorderSizePixel = 0
TimerLine.Parent = TimerContainer

local TimerLineCorner = Instance.new("UICorner")
TimerLineCorner.CornerRadius = UDim.new(1, 0)
TimerLineCorner.Parent = TimerLine

local TimerText = Instance.new("TextLabel")
TimerText.Size = UDim2.new(1, 0, 0, 20)
TimerText.Position = UDim2.new(0, 0, 0.72, 0)
TimerText.BackgroundTransparency = 1
TimerText.Text = "Loading hub in 5 seconds..."
TimerText.TextColor3 = Color3.fromRGB(150, 150, 150)
TimerText.Font = Enum.Font.Arcade
TimerText.TextSize = 14
TimerText.Parent = Frame

local SkipButton = Instance.new("TextButton")
SkipButton.Size = UDim2.new(0.7, 0, 0, 45)
SkipButton.Position = UDim2.new(0.15, 0, 0.8, 0)
SkipButton.Text = "SKIP TIMER"
SkipButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SkipButton.BackgroundColor3 = Color3.fromRGB(80, 0, 160)
SkipButton.Font = Enum.Font.Arcade
SkipButton.TextSize = 18
SkipButton.AutoButtonColor = false
SkipButton.Parent = Frame

local SkipButtonCorner = Instance.new("UICorner")
SkipButtonCorner.CornerRadius = UDim.new(0, 8)
SkipButtonCorner.Parent = SkipButton

SkipButton.MouseEnter:Connect(function()
    TweenService:Create(SkipButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(100, 20, 180)}):Play()
end)

SkipButton.MouseLeave:Connect(function()
    TweenService:Create(SkipButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(80, 0, 160)}):Play()
end)

local function loadHubAndClose()
    -- Prevent multiple executions
    if _G.GalaxyHub and _G.GalaxyHub.HubLoading then return end
    if not _G.GalaxyHub then _G.GalaxyHub = {} end
    _G.GalaxyHub.HubLoading = true
    
    TweenService:Create(Frame, TweenInfo.new(0.7, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
        Position = UDim2.new(0.5, 0, -0.5, 0),
        Size = UDim2.new(0, 0, 0, 0)
    }):Play()
    wait(0.7)
    ScreenGui:Destroy()
    loadHub()
end

SkipButton.MouseButton1Click:Connect(loadHubAndClose)

local timerDuration = 5 -- seconds
local startTime = tick()
local timerEnd = startTime + timerDuration

local function updateTimer()
    local currentTime = tick()
    local timeLeft = timerEnd - currentTime
    
    if timeLeft <= 0 then
        loadHubAndClose()
        return
    end
    
    local progress = 1 - (timeLeft / timerDuration)
    TimerLine.Size = UDim2.new(progress, 0, 1, 0)
    
    TimerText.Text = "Loading in " .. math.ceil(timeLeft) .. " seconds..."
end

local timerConnection
timerConnection = RunService.Heartbeat:Connect(function()
    updateTimer()
    
    if tick() >= timerEnd then
        timerConnection:Disconnect()
    end
end)

local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
local tweenGoal = {Position = UDim2.new(0.5, 0, 0.5, 0)}
local tween = TweenService:Create(Frame, tweenInfo, tweenGoal)
tween:Play()

local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    Frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

Frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = Frame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

Frame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)