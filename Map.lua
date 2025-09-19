-- ========= Services =========
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer
local Debris = game:GetService("Debris")
local SoundService = game:GetService("SoundService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- ========= Original Light =========
local originalLighting = {
    Ambient = Lighting.Ambient,
    OutdoorAmbient = Lighting.OutdoorAmbient,
    FogColor = Lighting.FogColor,
    FogEnd = Lighting.FogEnd,
    Brightness = Lighting.Brightness,
    GlobalShadows = Lighting.GlobalShadows,
    ClockTime = Lighting.ClockTime,
    ExposureCompensation = Lighting.ExposureCompensation or 0,
    EnvironmentDiffuseScale = Lighting.EnvironmentDiffuseScale or 0,
    EnvironmentSpecularScale = Lighting.EnvironmentSpecularScale or 0
}

-- ========= Config =========
local CONFIG = {
    PlatformSize = Vector3.new(1200, 25, 1200),
    ObservatorySize = Vector3.new(80, 30, 80),
    BubbleSize = Vector3.new(70, 30, 70),
    TeleportPadSize = Vector3.new(15, 2, 15),
    PlanetData = {
        {Name = "Mercury", Size = 20, Color = Color3.fromRGB(150, 150, 150), Spin = true, Texture = "rbxassetid://5107153182", Ring = false},
        {Name = "Venus", Size = 40, Color = Color3.fromRGB(200, 150, 50), Spin = true, Texture = "rbxassetid://5107153182", Ring = false},
        {Name = "Earth", Size = 40, Color = Color3.fromRGB(0, 100, 200), Spin = true, Texture = "rbxassetid://453515908", Ring = false},
        {Name = "Moon", Size = 15, Color = Color3.fromRGB(200, 200, 200), Spin = false, Texture = "rbxassetid://5107153182", Ring = false},
        {Name = "Mars", Size = 30, Color = Color3.fromRGB(200, 50, 0), Spin = true, Texture = "rbxassetid://5107153182", Ring = false},
        {Name = "Jupiter", Size = 100, Color = Color3.fromRGB(200, 150, 100), Spin = true, Texture = "rbxassetid://5107153182", Ring = false},
        {Name = "Saturn", Size = 90, Color = Color3.fromRGB(180, 140, 60), Spin = true, Texture = "rbxassetid://5107153182", Ring = true, RingColor = Color3.fromRGB(210, 180, 140), RingSize = 1.5},
        {Name = "Uranus", Size = 70, Color = Color3.fromRGB(100, 200, 200), Spin = true, Texture = "rbxassetid://5107153182", Ring = false},
        {Name = "Neptune", Size = 70, Color = Color3.fromRGB(50, 50, 200), Spin = true, Texture = "rbxassetid://5107153182", Ring = false},
        {Name = "Pluto", Size = 15, Color = Color3.fromRGB(200, 180, 150), Spin = true, Texture = "rbxassetid://5107153182", Ring = false},
        {Name = "Europa", Size = 20, Color = Color3.fromRGB(220, 220, 220), Spin = false, Texture = "rbxassetid://5107153182", Ring = false},
    },
    PlanetDistanceRange = {-1000, 1000},
    PlanetHeightRange = {600, 1200},
    AuraSize = Vector3.new(3000, 3000, 3000),
    SkyboxAsset = "rbxassetid://159454299",
    PlatformTexture = "rbxassetid://5107151155",
    AsteroidCount = 100,
    AsteroidSizeRange = {10, 30},
    AsteroidDistanceRange = {-1000, 1000},
    AsteroidHeightRange = {100, 800},
    NebulaParticleRate = 50,
    UFOSize = Vector3.new(40, 10, 40),
    NebulaRingCount = 5,
    HoloDisplayCount = 8,
    DebrisFieldCount = 50,
    UFOCount = 5,
    UFOPathRadius = 300,
    UFOPathHeight = 100,
    CometCount = 8,
    BlackHoleSize = 80,
    BlackHolePosition = Vector3.new(0, 800, 0),
    ConstellationCount = 10,
    StarCount = 200,
    MusicId = "rbxassetid://9126429361",
    AmbientSoundId = "rbxassetid://9119722812"
}

-- ========= UI =========
local StellarNexusUI = Instance.new("ScreenGui")
StellarNexusUI.Name = "StellarNexusUI_" .. HttpService:GenerateGUID(false)
StellarNexusUI.ResetOnSpawn = false
StellarNexusUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
StellarNexusUI.Parent = game:GetService("CoreGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 300, 0, 280)
MainFrame.Position = UDim2.new(0, 10, 0, 10)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 5, 30)
MainFrame.BackgroundTransparency = 0.1
MainFrame.BorderSizePixel = 0
MainFrame.Parent = StellarNexusUI

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 14)
UICorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(120, 80, 220)
UIStroke.Thickness = 3
UIStroke.Transparency = 0.3
UIStroke.Parent = MainFrame

local BackgroundGlow = Instance.new("ImageLabel")
BackgroundGlow.Size = UDim2.new(1, 20, 1, 20)
BackgroundGlow.Position = UDim2.new(0, -10, 0, -10)
BackgroundGlow.BackgroundTransparency = 1
BackgroundGlow.Image = "rbxassetid://4999756995"
BackgroundGlow.ImageColor3 = Color3.fromRGB(80, 40, 160)
BackgroundGlow.ScaleType = Enum.ScaleType.Slice
BackgroundGlow.SliceCenter = Rect.new(20, 20, 280, 280)
BackgroundGlow.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.Text = "STELLAR NEXUS CONTROL"
Title.TextColor3 = Color3.fromRGB(170, 170, 255)
Title.Font = Enum.Font.SciFi
Title.TextSize = 22
Title.TextStrokeTransparency = 0.8
Title.TextStrokeColor3 = Color3.fromRGB(100, 70, 200)
Title.Parent = MainFrame

local Divider = Instance.new("Frame")
Divider.Size = UDim2.new(0.8, 0, 0, 2)
Divider.Position = UDim2.new(0.1, 0, 0, 40)
Divider.BackgroundColor3 = Color3.fromRGB(100, 70, 200)
Divider.BorderSizePixel = 0
Divider.Parent = MainFrame

local function createControlButton(text, yPosition)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0.85, 0, 0, 36)
    button.Position = UDim2.new(0.075, 0, 0, yPosition)
    button.BackgroundColor3 = Color3.fromRGB(30, 15, 60)
    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.SciFi
    button.TextSize = 16
    button.AutoButtonColor = false
    button.Parent = MainFrame

    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 10)
    buttonCorner.Parent = button

    local buttonStroke = Instance.new("UIStroke")
    buttonStroke.Color = Color3.fromRGB(120, 80, 220)
    buttonStroke.Thickness = 2
    buttonStroke.Parent = button

    local buttonGlow = Instance.new("Frame")
    buttonGlow.Size = UDim2.new(1, 0, 1, 0)
    buttonGlow.BackgroundColor3 = Color3.fromRGB(120, 80, 220)
    buttonGlow.BackgroundTransparency = 0.9
    buttonGlow.BorderSizePixel = 0
    buttonGlow.ZIndex = -1
    buttonGlow.Parent = button

    local glowCorner = Instance.new("UICorner")
    glowCorner.CornerRadius = UDim.new(0, 10)
    glowCorner.Parent = buttonGlow

    button.MouseEnter:Connect(function()
        TweenService:Create(buttonGlow, TweenInfo.new(0.2), {BackgroundTransparency = 0.7}):Play()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 20, 80)}):Play()
    end)

    button.MouseLeave:Connect(function()
        TweenService:Create(buttonGlow, TweenInfo.new(0.2), {BackgroundTransparency = 0.9}):Play()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(30, 15, 60)}):Play()
    end)

    button.MouseButton1Down:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(50, 25, 100)}):Play()
    end)

    button.MouseButton1Up:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(40, 20, 80)}):Play()
    end)

    return button
end

local LightingToggle = createControlButton("Cosmic Lighting: ON", 50)
local TeleportButton = createControlButton("Teleport to Observatory", 95)
local EffectsToggle = createControlButton("Special Effects: ON", 140)
local MusicToggle = createControlButton("Space Ambience: ON", 185)
local CloseButton = createControlButton("Close Nexus", 230)

-- ========= GUI =========
local dragging, dragInput, dragStart, startPos
local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
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

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

-- ========= Custom Light =========
local customLighting = {
    Ambient = Color3.fromRGB(120, 50, 180),
    OutdoorAmbient = Color3.fromRGB(120, 50, 180),
    FogColor = Color3.fromRGB(40, 20, 80),
    FogEnd = 2500,
    Brightness = 0.3,
    GlobalShadows = true,
    ClockTime = 0,
    ExposureCompensation = -1,
    EnvironmentDiffuseScale = 0.1,
    EnvironmentSpecularScale = 0.1
}

local isCustomLighting = true
local isEffectsEnabled = true
local isMusicEnabled = true

local function applyLighting(settings)
    for key, value in pairs(settings) do
        Lighting[key] = value
    end
end

applyLighting(customLighting)

LightingToggle.MouseButton1Click:Connect(function()
    isCustomLighting = not isCustomLighting
    if isCustomLighting then
        applyLighting(customLighting)
        LightingToggle.Text = "Cosmic Lighting: ON"
    else
        applyLighting(originalLighting)
        LightingToggle.Text = "Cosmic Lighting: OFF"
    end
end)

-- ========= Soundz =========
local backgroundMusic = Instance.new("Sound")
backgroundMusic.SoundId = CONFIG.MusicId
backgroundMusic.Volume = 0.6
backgroundMusic.Looped = true
backgroundMusic.Parent = workspace

local ambientSound = Instance.new("Sound")
ambientSound.SoundId = CONFIG.AmbientSoundId
ambientSound.Volume = 0.4
ambientSound.Looped = true
ambientSound.Parent = workspace

local function toggleMusic(state)
    if state then
        backgroundMusic:Play()
        ambientSound:Play()
        MusicToggle.Text = "Space Ambience: ON"
    else
        backgroundMusic:Stop()
        ambientSound:Stop()
        MusicToggle.Text = "Space Ambience: OFF"
    end
end

MusicToggle.MouseButton1Click:Connect(function()
    isMusicEnabled = not isMusicEnabled
    toggleMusic(isMusicEnabled)
end)