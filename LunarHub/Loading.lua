--[[
loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/Scripts/main/LunarHub/Loading.lua"))()
]]

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local StarterGui = game:GetService("StarterGui")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

if not _G.LunarHub then
    _G.LunarHub = {
        HubLoaded = false,
        WelcomeGUILoaded = false
    }
end

if _G.LunarHub.WelcomeGUILoaded then return end
_G.LunarHub.WelcomeGUILoaded = true

if PlayerGui:FindFirstChild("WelcomeGUI") then
    PlayerGui:FindFirstChild("WelcomeGUI"):Destroy()
end

local welcomeMessages = {
    "Hi, ","Hello, ","Hey, ","Welcome, ","Greetings, ","Howdy, ","Sup, ",
    "What's up, ","Nice to see you, ","Good to see you, ","Ciao, ","Bonjour, ",
    "Hola, ","こんにちは, ","안녕하세요, ","你好, ","Wsp, ","Oi, ","Hallo, ","Hej, ","Konichiwa, "
}

local randomWelcome = welcomeMessages[math.random(1, #welcomeMessages)] .. Player.Name .. "!"

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = PlayerGui
ScreenGui.ResetOnSpawn = false
ScreenGui.Name = "WelcomeGUI"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true

local BackgroundBlur = Instance.new("BlurEffect")
BackgroundBlur.Size = 0
BackgroundBlur.Parent = game:GetService("Lighting")

local MainContainer = Instance.new("Frame")
MainContainer.Size = UDim2.new(0, 500, 0, 400)
MainContainer.Position = UDim2.new(0.5, 0, -0.5, 0)
MainContainer.AnchorPoint = Vector2.new(0.5, 0.5)
MainContainer.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
MainContainer.BorderSizePixel = 0
MainContainer.ClipsDescendants = true
MainContainer.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainContainer

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(20, 20, 120)
MainStroke.Thickness = 2
MainStroke.Parent = MainContainer

local BackgroundPattern = Instance.new("ImageLabel")
BackgroundPattern.Size = UDim2.new(1, 0, 1, 0)
BackgroundPattern.BackgroundTransparency = 1
BackgroundPattern.Image = "rbxassetid://11543912319"
BackgroundPattern.ImageColor3 = Color3.fromRGB(15, 5, 30)
BackgroundPattern.ScaleType = Enum.ScaleType.Tile
BackgroundPattern.TileSize = UDim2.new(0, 150, 0, 150)
BackgroundPattern.Parent = MainContainer

local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 30)
TopBar.Position = UDim2.new(0, 0, 0, 0)
TopBar.BackgroundColor3 = Color3.fromRGB(15, 5, 30)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainContainer

local TopBarCorner = Instance.new("UICorner")
TopBarCorner.CornerRadius = UDim.new(0, 12)
TopBarCorner.Parent = TopBar

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0, 200, 1, 0)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "LUNAR HUB"
Title.TextColor3 = Color3.fromRGB(180, 100, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TopBar

local CloseButton = Instance.new("ImageButton")
CloseButton.Size = UDim2.new(0, 20, 0, 20)
CloseButton.Position = UDim2.new(1, -25, 0, 5)
CloseButton.BackgroundTransparency = 1
CloseButton.Image = "rbxassetid://11544261453"
CloseButton.ImageColor3 = Color3.fromRGB(200, 200, 200)
CloseButton.Parent = TopBar

CloseButton.MouseEnter:Connect(function()
    TweenService:Create(CloseButton, TweenInfo.new(0.2), {ImageColor3 = Color3.fromRGB(255, 80, 80)}):Play()
end)
CloseButton.MouseLeave:Connect(function()
    TweenService:Create(CloseButton, TweenInfo.new(0.2), {ImageColor3 = Color3.fromRGB(200, 200, 200)}):Play()
end)
CloseButton.MouseButton1Click:Connect(function()
    TweenService:Create(MainContainer, TweenInfo.new(0.7, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
        Position = UDim2.new(0.5, 0, -0.5, 0),
        Size = UDim2.new(0, 0, 0, 0)
    }):Play()
    TweenService:Create(BackgroundBlur, TweenInfo.new(0.7), {Size = 0}):Play()
    wait(0.7)
    ScreenGui:Destroy()
    BackgroundBlur:Destroy()
end)

local ProfileContainer = Instance.new("Frame")
ProfileContainer.Size = UDim2.new(0, 100, 0, 100)
ProfileContainer.Position = UDim2.new(0.5, -50, 0.15, 0)
ProfileContainer.BackgroundColor3 = Color3.fromRGB(20, 10, 35)
ProfileContainer.BorderSizePixel = 0
ProfileContainer.Parent = MainContainer

local ProfileCorner = Instance.new("UICorner")
ProfileCorner.CornerRadius = UDim.new(1, 0)
ProfileCorner.Parent = ProfileContainer

local ProfileImage = Instance.new("ImageLabel")
ProfileImage.Size = UDim2.new(0, 90, 0, 90)
ProfileImage.Position = UDim2.new(0.5, -45, 0.5, -45)
ProfileImage.BackgroundTransparency = 1
ProfileImage.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. Player.UserId .. "&width=420&height=420&format=png"
ProfileImage.Parent = ProfileContainer

local ProfileImageCorner = Instance.new("UICorner")
ProfileImageCorner.CornerRadius = UDim.new(1, 0)
ProfileImageCorner.Parent = ProfileImage

local WelcomeText = Instance.new("TextLabel")
WelcomeText.Size = UDim2.new(1, -40, 0, 40)
WelcomeText.Position = UDim2.new(0, 20, 0, 140)
WelcomeText.BackgroundTransparency = 1
WelcomeText.Text = randomWelcome
WelcomeText.TextColor3 = Color3.fromRGB(220, 220, 220)
WelcomeText.Font = Enum.Font.GothamBold
WelcomeText.TextSize = 22
WelcomeText.TextWrapped = true
WelcomeText.Parent = MainContainer

local Subtitle = Instance.new("TextLabel")
Subtitle.Size = UDim2.new(1, -40, 0, 24)
Subtitle.Position = UDim2.new(0, 20, 0, 180)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "Loading..."
Subtitle.TextColor3 = Color3.fromRGB(180, 100, 255)
Subtitle.Font = Enum.Font.Gotham
Subtitle.TextSize = 16
Subtitle.TextWrapped = true
Subtitle.Parent = MainContainer

local TimerContainer = Instance.new("Frame")
TimerContainer.Size = UDim2.new(0.8, 0, 0, 8)
TimerContainer.Position = UDim2.new(0.1, 0, 0.65, 0)
TimerContainer.BackgroundColor3 = Color3.fromRGB(25, 15, 40)
TimerContainer.BorderSizePixel = 0
TimerContainer.Parent = MainContainer

local TimerContainerCorner = Instance.new("UICorner")
TimerContainerCorner.CornerRadius = UDim.new(1, 0)
TimerContainerCorner.Parent = TimerContainer

local TimerLine = Instance.new("Frame")
TimerLine.Size = UDim2.new(0, 0, 1, 0)
TimerLine.BackgroundColor3 = Color3.fromRGB(180, 100, 255)
TimerLine.BorderSizePixel = 0
TimerLine.ZIndex = 2
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
TimerText.Font = Enum.Font.Gotham
TimerText.TextSize = 14
TimerText.Parent = MainContainer

local SkipButton = Instance.new("TextButton")
SkipButton.Size = UDim2.new(0.7, 0, 0, 45)
SkipButton.Position = UDim2.new(0.15, 0, 0.82, 0)
SkipButton.Text = "Skip"
SkipButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SkipButton.BackgroundColor3 = Color3.fromRGB(70, 10, 140)
SkipButton.Font = Enum.Font.GothamBold
SkipButton.TextSize = 16
SkipButton.AutoButtonColor = false
SkipButton.Parent = MainContainer

local SkipButtonCorner = Instance.new("UICorner")
SkipButtonCorner.CornerRadius = UDim.new(0, 8)
SkipButtonCorner.Parent = SkipButton

local SkipButtonStroke = Instance.new("UIStroke")
SkipButtonStroke.Color = Color3.fromRGB(120, 50, 200)
SkipButtonStroke.Thickness = 2
SkipButtonStroke.Parent = SkipButton

SkipButton.MouseEnter:Connect(function()
    TweenService:Create(SkipButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(90, 30, 170)}):Play()
    TweenService:Create(SkipButtonStroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(160, 100, 240)}):Play()
end)
SkipButton.MouseLeave:Connect(function()
    TweenService:Create(SkipButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(70, 10, 140)}):Play()
    TweenService:Create(SkipButtonStroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(120, 50, 200)}):Play()
end)

local function loadHubAndClose()
    if _G.LunarHub and _G.LunarHub.HubLoading then return end
    if not _G.LunarHub then _G.LunarHub = {} end
    _G.LunarHub.HubLoading = true

    TweenService:Create(MainContainer, TweenInfo.new(0.7, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
        Position = UDim2.new(0.5, 0, -0.5, 0),
        Size = UDim2.new(0, 0, 0, 0)
    }):Play()
    TweenService:Create(BackgroundBlur, TweenInfo.new(0.7), {Size = 0}):Play()
    wait(0.7)
    ScreenGui:Destroy()
    BackgroundBlur:Destroy()

    loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/Scripts/main/LunarHub/Main.lua"))()
end

SkipButton.MouseButton1Click:Connect(loadHubAndClose)

local timerDuration = 5
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
local tween = TweenService:Create(MainContainer, tweenInfo, tweenGoal)
tween:Play()
TweenService:Create(BackgroundBlur, TweenInfo.new(1), {Size = 12}):Play()

local dragging, dragInput, dragStart, startPos
local function update(input)
    local delta = input.Position - dragStart
    MainContainer.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

TopBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainContainer.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

TopBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)
