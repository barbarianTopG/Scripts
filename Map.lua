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

-- ========= Map =========
local island, teleportPad, specialEffects = {}, nil, {}

local function createMap()
    for _, obj in pairs(workspace:GetChildren()) do
        if obj.Name == "StellarNexusIsland" then
            obj:Destroy()
        end
    end
    
    for _, effect in pairs(specialEffects) do
        if effect then
            effect:Disconnect()
        end
    end
    specialEffects = {}

    island = Instance.new("Model")
    island.Name = "StellarNexusIsland"
    island.Parent = workspace

    local playerPos = (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")) and LocalPlayer.Character.HumanoidRootPart.Position or Vector3.new(0, 100, 0)

    local platform = Instance.new("Part")
    platform.Name = "NebulaPlatform"
    platform.Size = CONFIG.PlatformSize
    platform.Position = Vector3.new(playerPos.X, playerPos.Y + 500, playerPos.Z)
    platform.Anchored = true
    platform.Material = Enum.Material.Neon
    platform.Color = Color3.fromRGB(15, 3, 35)
    platform.Reflectance = 0.2
    platform.CanCollide = true
    platform.Parent = island

    local pattern = Instance.new("Texture")
    pattern.Face = Enum.NormalId.Top
    pattern.Texture = CONFIG.PlatformTexture
    pattern.Transparency = 0.2
    pattern.Parent = platform

    local grid = Instance.new("Part")
    grid.Size = Vector3.new(platform.Size.X, 1, platform.Size.Z)
    grid.Position = platform.Position + Vector3.new(0, 1, 0)
    grid.Anchored = true
    grid.Material = Enum.Material.Neon
    grid.Color = Color3.fromRGB(70, 30, 120)
    grid.Transparency = 0.7
    grid.CanCollide = false
    grid.Parent = island
    
    local gridPattern = Instance.new("Texture")
    gridPattern.Face = Enum.NormalId.Top
    gridPattern.Texture = "rbxassetid://130762310"
    gridPattern.StudsPerTileU = 50
    gridPattern.StudsPerTileV = 50
    gridPattern.Transparency = 0.5
    gridPattern.Parent = grid

    local observatory = Instance.new("Part")
    observatory.Name = "Observatory"
    observatory.Size = CONFIG.ObservatorySize
    observatory.Position = Vector3.new(playerPos.X, playerPos.Y + 515, playerPos.Z)
    observatory.Anchored = true
    observatory.Material = Enum.Material.Neon
    observatory.Color = Color3.fromRGB(70, 30, 120)
    observatory.Reflectance = 0.4
    observatory.CanCollide = true
    observatory.Parent = island

    local observatoryRing = Instance.new("Part")
    observatoryRing.Size = Vector3.new(observatory.Size.X + 10, 5, observatory.Size.Z + 10)
    observatoryRing.Position = observatory.Position + Vector3.new(0, observatory.Size.Y/2 + 2, 0)
    observatoryRing.Anchored = true
    observatoryRing.Material = Enum.Material.Neon
    observatoryRing.Color = Color3.fromRGB(100, 50, 180)
    observatoryRing.CanCollide = false
    observatoryRing.Parent = island

    local bubble = Instance.new("Part")
    bubble.Shape = Enum.PartType.Ball
    bubble.Size = CONFIG.BubbleSize
    bubble.Position = Vector3.new(playerPos.X, playerPos.Y + 540, playerPos.Z)
    bubble.Anchored = true
    bubble.Material = Enum.Material.Glass
    bubble.Transparency = 0.3
    bubble.Reflectance = 0.4
    bubble.Color = Color3.fromRGB(70, 120, 255)
    bubble.CanCollide = false
    bubble.Parent = island

    local domeLight = Instance.new("PointLight")
    domeLight.Brightness = 3
    domeLight.Range = 50
    domeLight.Color = Color3.fromRGB(100, 150, 255)
    domeLight.Parent = bubble

    teleportPad = Instance.new("Part")
    teleportPad.Name = "TeleportPad"
    teleportPad.Size = CONFIG.TeleportPadSize
    teleportPad.Position = observatory.Position + Vector3.new(0, 16, 0)
    teleportPad.Anchored = true
    teleportPad.Material = Enum.Material.Neon
    teleportPad.Color = Color3.fromRGB(0, 170, 255)
    teleportPad.CanCollide = true
    teleportPad.Parent = island

    local padLight = Instance.new("PointLight")
    padLight.Brightness = 8
    padLight.Range = 20
    padLight.Color = Color3.fromRGB(0, 170, 255)
    padLight.Parent = teleportPad

    local pulseTween = TweenService:Create(
        padLight,
        TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
        { Brightness = 15 }
    )
    pulseTween:Play()

    local teleportParticles = Instance.new("ParticleEmitter")
    teleportParticles.Texture = "rbxassetid://243660373"
    teleportParticles.Lifetime = NumberRange.new(0.5, 1.5)
    teleportParticles.Rate = 30
    teleportParticles.Speed = NumberRange.new(2, 5)
    teleportParticles.Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 2),
        NumberSequenceKeypoint.new(1, 5)
    })
    teleportParticles.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(1, 1)
    })
    teleportParticles.Color = ColorSequence.new(Color3.fromRGB(0, 170, 255))
    teleportParticles.Acceleration = Vector3.new(0, 5, 0)
    teleportParticles.Parent = teleportPad

    local blackHole = Instance.new("Part")
    blackHole.Name = "BlackHole"
    blackHole.Shape = Enum.PartType.Ball
    blackHole.Size = Vector3.new(CONFIG.BlackHoleSize, CONFIG.BlackHoleSize, CONFIG.BlackHoleSize)
    blackHole.Position = playerPos + CONFIG.BlackHolePosition
    blackHole.Anchored = true
    blackHole.Material = Enum.Material.Neon
    blackHole.Color = Color3.fromRGB(10, 10, 10)
    blackHole.Reflectance = 0.8
    blackHole.CanCollide = false
    blackHole.Parent = island

    local accretionDisk = Instance.new("Part")
    accretionDisk.Name = "AccretionDisk"
    accretionDisk.Size = Vector3.new(CONFIG.BlackHoleSize * 3, 1, CONFIG.BlackHoleSize * 3)
    accretionDisk.Position = blackHole.Position
    accretionDisk.Anchored = true
    accretionDisk.Material = Enum.Material.Neon
    accretionDisk.Color = Color3.fromRGB(200, 80, 50)
    accretionDisk.Transparency = 0.5
    accretionDisk.CanCollide = false
    accretionDisk.Parent = island

    local blackHoleParticles = Instance.new("ParticleEmitter")
    blackHoleParticles.Texture = "rbxassetid://243660364"
    blackHoleParticles.Lifetime = NumberRange.new(3, 5)
    blackHoleParticles.Rate = 100
    blackHoleParticles.Speed = NumberRange.new(5, 15)
    blackHoleParticles.Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 3),
        NumberSequenceKeypoint.new(1, 8)
    })
    blackHoleParticles.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.5),
        NumberSequenceKeypoint.new(1, 1)
    })
    blackHoleParticles.Color = ColorSequence.new(Color3.fromRGB(150, 50, 50))
    blackHoleParticles.Acceleration = Vector3.new(0, 0, 0)
    blackHoleParticles.Parent = blackHole

    task.spawn(function()
        while blackHole.Parent do
            blackHole.CFrame = blackHole.CFrame * CFrame.Angles(0, math.rad(0.5), 0)
            accretionDisk.CFrame = accretionDisk.CFrame * CFrame.Angles(0, math.rad(-1), 0)
            task.wait(0.03)
        end
    end)

    for i = 1, CONFIG.UFOCount do
        local ufo = Instance.new("Part")
        ufo.Name = "UFO_" .. i
        ufo.Size = CONFIG.UFOSize
        ufo.Position = Vector3.new(
            playerPos.X + math.random(-CONFIG.UFOPathRadius, CONFIG.UFOPathRadius),
            playerPos.Y + 600 + math.random(-CONFIG.UFOPathHeight, CONFIG.UFOPathHeight),
            playerPos.Z + math.random(-CONFIG.UFOPathRadius, CONFIG.UFOPathRadius)
        )
        ufo.Anchored = true
        ufo.Material = Enum.Material.Neon
        ufo.Color = Color3.fromRGB(math.random(100, 200), math.random(100, 200), math.random(100, 200))
        ufo.Reflectance = 0.5
        ufo.CanCollide = false
        ufo.Parent = island

        local ufoDome = Instance.new("Part")
        ufoDome.Shape = Enum.PartType.Ball
        ufoDome.Size = Vector3.new(ufo.Size.X * 0.6, ufo.Size.Y * 0.8, ufo.Size.Z * 0.6)
        ufoDome.Position = ufo.Position + Vector3.new(0, ufo.Size.Y/2 + ufoDome.Size.Y/2, 0)
        ufoDome.Anchored = true
        ufoDome.Material = Enum.Material.Glass
        ufoDome.Transparency = 0.2
        ufoDome.Color = Color3.fromRGB(100, 200, 255)
        ufoDome.CanCollide = false
        ufoDome.Parent = island

        local ufoLight = Instance.new("PointLight")
        ufoLight.Brightness = 10
        ufoLight.Range = 30
        ufoLight.Color = Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))
        ufoLight.Parent = ufoDome

        local ufoBeam = Instance.new("Part")
        ufoBeam.Size = Vector3.new(5, 50, 5)
        ufoBeam.Position = ufo.Position - Vector3.new(0, 30, 0)
        ufoBeam.Anchored = true
        ufoBeam.Material = Enum.Material.Neon
        ufoBeam.Color = ufoLight.Color
        ufoBeam.Transparency = 0.7
        ufoBeam.CanCollide = false
        ufoBeam.Parent = island

        local beamLight = Instance.new("SpotLight")
        beamLight.Brightness = 15
        beamLight.Range = 100
        beamLight.Angle = 30
        beamLight.Color = ufoLight.Color
        beamLight.Face = Enum.NormalId.Bottom
        beamLight.Parent = ufoBeam

        local startAngle = math.random(0, 360)
        local orbitRadius = math.random(200, CONFIG.UFOPathRadius)
        local orbitSpeed = math.random(5, 15) / 100
        local heightVariation = math.random(20, CONFIG.UFOPathHeight)
        
        task.spawn(function()
            local angle = startAngle
            while ufo.Parent and ufoDome.Parent do
                angle = (angle + orbitSpeed) % 360
                local rad = math.rad(angle)
                local x = math.cos(rad) * orbitRadius
                local z = math.sin(rad) * orbitRadius
                local y = math.sin(rad * 2) * heightVariation
                
                ufo.CFrame = CFrame.new(playerPos.X + x, playerPos.Y + 600 + y, playerPos.Z + z) * 
                             CFrame.Angles(0, rad, 0)
                ufoDome.CFrame = ufo.CFrame * CFrame.new(0, ufo.Size.Y/2 + ufoDome.Size.Y/2, 0)
                ufoBeam.CFrame = ufo.CFrame * CFrame.new(0, -ufo.Size.Y/2 - ufoBeam.Size.Y/2, 0) * 
                                CFrame.Angles(math.pi, 0, 0)
                
                ufo.CFrame = ufo.CFrame * CFrame.Angles(0, math.rad(0.5), 0)
                ufoDome.CFrame = ufoDome.CFrame * CFrame.Angles(0, math.rad(0.5), 0)
                
                task.wait(0.03)
            end
        end)
    end

    for i = 1, CONFIG.CometCount do
        local comet = Instance.new("Part")
        comet.Name = "Comet_" .. i
        comet.Shape = Enum.PartType.Ball
        comet.Size = Vector3.new(15, 15, 15)
        comet.Position = Vector3.new(
            playerPos.X + math.random(-1500, 1500),
            playerPos.Y + math.random(800, 1200),
            playerPos.Z + math.random(-1500, 1500)
        )
        comet.Anchored = true
        comet.Material = Enum.Material.Neon
        comet.Color = Color3.fromRGB(200, 200, 255)
        comet.Reflectance = 0.4
        comet.CanCollide = false
        comet.Parent = island

        local cometLight = Instance.new("PointLight")
        cometLight.Brightness = 8
        cometLight.Range = 30
        cometLight.Color = Color3.fromRGB(150, 200, 255)
        cometLight.Parent = comet

        local cometTail = Instance.new("ParticleEmitter")
        cometTail.Texture = "rbxassetid://243660373"
        cometTail.Lifetime = NumberRange.new(1, 2)
        cometTail.Rate = 100
        cometTail.Speed = NumberRange.new(5, 10)
        cometTail.Size = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 5),
            NumberSequenceKeypoint.new(1, 2)
        })
        cometTail.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0),
            NumberSequenceKeypoint.new(1, 1)
        })
        cometTail.Color = ColorSequence.new(Color3.fromRGB(150, 200, 255))
        cometTail.Acceleration = Vector3.new(0, 0, -10)
        cometTail.Parent = comet

        local direction = Vector3.new(math.random(-1, 1), math.random(-0.5, -0.2), math.random(-1, 1)).Unit
        local speed = math.random(5, 15)
        
        task.spawn(function()
            while comet.Parent do
                comet.Position = comet.Position + (direction * speed)
                if (comet.Position - playerPos).Magnitude > 2000 then
                    comet.Position = Vector3.new(
                        playerPos.X + math.random(-1500, 1500),
                        playerPos.Y + math.random(800, 1200),
                        playerPos.Z + math.random(-1500, 1500)
                    )
                    direction = Vector3.new(math.random(-1, 1), math.random(-0.5, -0.2), math.random(-1, 1)).Unit
                end
                task.wait(0.03)
            end
        end)
    end

    for i = 1, CONFIG.NebulaRingCount do
        local ring = Instance.new("Part")
        ring.Name = "NebulaRing" .. i
        ring.Size = Vector3.new(200 + i * 100, 2, 200 + i * 100)
        ring.Position = Vector3.new(playerPos.X, playerPos.Y + 510 + i * 10, playerPos.Z)
        ring.Anchored = true
        ring.Material = Enum.Material.Neon
        ring.Color = Color3.fromRGB(120, 50, math.random(180, 255))
        ring.Transparency = 0.4
        ring.CanCollide = false
        ring.Parent = island

        local ringLight = Instance.new("PointLight")
        ringLight.Brightness = 2
        ringLight.Range = 100
        ringLight.Color = ring.Color
        ringLight.Parent = ring

        task.spawn(function()
            while ring.Parent do
                ring.CFrame = ring.CFrame * CFrame.Angles(0, math.rad(0.5 * (i % 2 == 0 and 1 or -1)), 0)
                task.wait(0.05)
            end
        end)
    end

    for i = 1, CONFIG.HoloDisplayCount do
        local holo = Instance.new("BillboardGui")
        holo.Name = "HoloDisplay" .. i
        holo.Size = UDim2.new(0, 80, 0, 80)
        holo.StudsOffset = Vector3.new(math.random(-300, 300), math.random(20, 50), math.random(-300, 300))
        holo.AlwaysOnTop = true
        holo.Parent = platform

        local holoImage = Instance.new("ImageLabel")
        holoImage.Size = UDim2.new(1, 0, 1, 0)
        holoImage.BackgroundTransparency = 1
        holoImage.Image = "rbxassetid://705351127"
        holoImage.ImageTransparency = 0.2
        holoImage.Parent = holo

        local holoTween = TweenService:Create(
            holoImage,
            TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
            { ImageTransparency = 0.6, Rotation = math.rad(360) }
        )
        holoTween:Play()
    end

    for i = 1, CONFIG.DebrisFieldCount do
        local debris = Instance.new("Part")
        debris.Name = "CosmicDebris" .. i
        local size = math.random(5, 15)
        debris.Size = Vector3.new(size, size, size)
        debris.Position = Vector3.new(
            playerPos.X + math.random(-800, 800),
            playerPos.Y + math.random(300, 700),
            playerPos.Z + math.random(-800, 800)
        )
        debris.Anchored = true
        debris.Material = Enum.Material.Neon
        debris.Color = Color3.fromRGB(math.random(100, 255), math.random(50, 150), math.random(150, 255))
        debris.Transparency = 0.5
        debris.CanCollide = false
        debris.Parent = island

        local debrisLight = Instance.new("PointLight")
        debrisLight.Brightness = 3
        debrisLight.Range = 20
        debrisLight.Color = debris.Color
        debrisLight.Parent = debris

        task.spawn(function()
            while debris.Parent do
                debris.CFrame = debris.CFrame * CFrame.Angles(math.rad(math.random(1, 3)/10), math.rad(math.random(1, 3)/10), math.rad(math.random(1, 3)/10))
                task.wait(0.1)
            end
        end)
    end

    local planets = {}
    for i, data in ipairs(CONFIG.PlanetData) do
        local planet = Instance.new("Part")
        planet.Name = data.Name
        planet.Shape = Enum.PartType.Ball
        planet.Size = Vector3.new(data.Size, data.Size, data.Size)
        planet.Position = Vector3.new(
            playerPos.X + math.random(CONFIG.PlanetDistanceRange[1], CONFIG.PlanetDistanceRange[2]),
            playerPos.Y + math.random(CONFIG.PlanetHeightRange[1], CONFIG.PlanetHeightRange[2]),
            playerPos.Z + math.random(CONFIG.PlanetDistanceRange[1], CONFIG.PlanetDistanceRange[2])
        )
        planet.Anchored = true
        planet.Material = Enum.Material.Neon
        planet.Color = data.Color
        planet.Reflectance = 0.3
        planet.CanCollide = false
        planet.Parent = island

        local texture = Instance.new("Texture")
        texture.Texture = data.Texture
        texture.Face = Enum.NormalId.Front
        texture.StudsPerTileU = 5
        texture.StudsPerTileV = 5
        texture.Parent = planet

                local planetLight = Instance.new("PointLight")
        planetLight.Brightness = 2
        planetLight.Range = data.Size * 3
        planetLight.Color = data.Color
        planetLight.Parent = planet

        if data.Ring then
            local ring = Instance.new("Part")
            ring.Name = data.Name .. "Ring"
            ring.Size = Vector3.new(data.Size * data.RingSize, 1, data.Size * data.RingSize)
            ring.Position = planet.Position
            ring.Anchored = true
            ring.Material = Enum.Material.Neon
            ring.Color = data.RingColor
            ring.Transparency = 0.3
            ring.CanCollide = false
            ring.Parent = island
            
            local ringWeld = Instance.new("Weld")
            ringWeld.Part0 = planet
            ringWeld.Part1 = ring
            ringWeld.C0 = CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(45), 0, 0)
            ringWeld.Parent = ring
        end

        planets[i] = {Part = planet, Data = data, OriginalPosition = planet.Position}
    end

    for i = 1, CONFIG.AsteroidCount do
        local asteroid = Instance.new("Part")
        asteroid.Name = "Asteroid" .. i
        local size = math.random(CONFIG.AsteroidSizeRange[1], CONFIG.AsteroidSizeRange[2])
        asteroid.Size = Vector3.new(size, size, size)
        asteroid.Position = Vector3.new(
            playerPos.X + math.random(CONFIG.AsteroidDistanceRange[1], CONFIG.AsteroidDistanceRange[2]),
            playerPos.Y + math.random(CONFIG.AsteroidHeightRange[1], CONFIG.AsteroidHeightRange[2]),
            playerPos.Z + math.random(CONFIG.AsteroidDistanceRange[1], CONFIG.AsteroidDistanceRange[2])
        )
        asteroid.Anchored = true
        asteroid.Material = Enum.Material.Neon
        asteroid.Color = Color3.fromRGB(math.random(100, 150), math.random(80, 120), math.random(60, 100))
        asteroid.Reflectance = 0.1
        asteroid.CanCollide = false
        asteroid.Parent = island

        task.spawn(function()
            while asteroid.Parent do
                asteroid.CFrame = asteroid.CFrame * CFrame.Angles(
                    math.rad(math.random(1, 3)/10),
                    math.rad(math.random(1, 3)/10),
                    math.rad(math.random(1, 3)/10)
                )
                task.wait(0.1)
            end
        end)
    end

    for i = 1, CONFIG.StarCount do
        local star = Instance.new("Part")
        star.Name = "Star" .. i
        star.Size = Vector3.new(2, 2, 2)
        star.Position = Vector3.new(
            playerPos.X + math.random(-2000, 2000),
            playerPos.Y + math.random(800, 1500),
            playerPos.Z + math.random(-2000, 2000)
        )
        star.Anchored = true
        star.Material = Enum.Material.Neon
        star.Color = Color3.fromRGB(math.random(200, 255), math.random(200, 255), math.random(150, 255))
        star.CanCollide = false
        star.Parent = island

        local starLight = Instance.new("PointLight")
        starLight.Brightness = math.random(5, 15)
        starLight.Range = math.random(20, 50)
        starLight.Color = star.Color
        starLight.Parent = star

        local twinkleTween = TweenService:Create(
            starLight,
            TweenInfo.new(math.random(1, 3), Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
            {Brightness = starLight.Brightness / 2}
        )
        twinkleTween:Play()
    end

    for i = 1, CONFIG.ConstellationCount do
        local startPoint = Vector3.new(
            playerPos.X + math.random(-1500, 1500),
            playerPos.Y + math.random(900, 1300),
            playerPos.Z + math.random(-1500, 1500)
        )
        
        for j = 1, math.random(3, 8) do
            local star = Instance.new("Part")
            star.Name = "ConstellationStar_" .. i .. "_" .. j
            star.Size = Vector3.new(3, 3, 3)
            star.Position = startPoint + Vector3.new(
                math.random(-300, 300),
                math.random(-100, 100),
                math.random(-300, 300)
            )
            star.Anchored = true
            star.Material = Enum.Material.Neon
            star.Color = Color3.fromRGB(255, 255, 200)
            star.CanCollide = false
            star.Parent = island

            local starLight = Instance.new("PointLight")
            starLight.Brightness = 10
            starLight.Range = 50
            starLight.Color = star.Color
            starLight.Parent = star

            if j > 1 then
                local connection = Instance.new("Part")
                connection.Name = "ConstellationLine_" .. i .. "_" .. (j-1) .. "_" .. j
                connection.Size = Vector3.new(1, 1, (star.Position - startPoint).Magnitude)
                connection.Position = (startPoint + star.Position) / 2
                connection.Anchored = true
                connection.Material = Enum.Material.Neon
                connection.Color = Color3.fromRGB(200, 200, 255)
                connection.Transparency = 0.5
                connection.CanCollide = false
                connection.Parent = island
                
                connection.CFrame = CFrame.new(connection.Position, star.Position) * 
                                   CFrame.Angles(math.pi/2, 0, 0)
            end
            
            startPoint = star.Position
        end
    end

    local aura = Instance.new("Part")
    aura.Name = "CosmicAura"
    aura.Size = CONFIG.AuraSize
    aura.Position = playerPos + Vector3.new(0, 500, 0)
    aura.Anchored = true
    aura.Material = Enum.Material.Neon
    aura.Color = Color3.fromRGB(30, 10, 60)
    aura.Transparency = 0.95
    aura.CanCollide = false
    aura.Parent = island

    local auraParticles = Instance.new("ParticleEmitter")
    auraParticles.Texture = "rbxassetid://243660373"
    auraParticles.Lifetime = NumberRange.new(3, 7)
    auraParticles.Rate = CONFIG.NebulaParticleRate
    auraParticles.Speed = NumberRange.new(2, 5)
    auraParticles.Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 10),
        NumberSequenceKeypoint.new(1, 20)
    })
    auraParticles.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.5),
        NumberSequenceKeypoint.new(1, 1)
    })
    auraParticles.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(120, 50, 180)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(80, 30, 120)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(50, 10, 80))
    })
    auraParticles.Parent = aura

    local skybox = Instance.new("Sky")
    for _, child in pairs(Lighting:GetChildren()) do
        if child:IsA("Sky") then
            child:Destroy()
        end
    end
    skybox.SkyboxBk = CONFIG.SkyboxAsset
    skybox.SkyboxDn = CONFIG.SkyboxAsset
    skybox.SkyboxFt = CONFIG.SkyboxAsset
    skybox.SkyboxLf = CONFIG.SkyboxAsset
    skybox.SkyboxRt = CONFIG.SkyboxAsset
    skybox.SkyboxUp = CONFIG.SkyboxAsset
    skybox.Parent = Lighting

    local planetOrbitConnections = {}
    for _, planetData in pairs(planets) do
        local connection = RunService.Heartbeat:Connect(function(deltaTime)
            if planetData.Part and planetData.Part.Parent then
                if planetData.Data.Spin then
                    planetData.Part.CFrame = planetData.Part.CFrame * CFrame.Angles(0, math.rad(0.2), 0)
                end
                
                local orbitRadius = (planetData.Part.Position - playerPos).Magnitude
                local orbitSpeed = 100 / orbitRadius
                
                planetData.Part.CFrame = planetData.OriginalPosition * CFrame.Angles(0, math.rad(orbitSpeed * deltaTime * 10), 0)
                planetData.OriginalPosition = planetData.Part.Position
            end
        end)
        table.insert(planetOrbitConnections, connection)
    end
    table.insert(specialEffects, planetOrbitConnections)

    local ufoSound = Instance.new("Sound")
    ufoSound.SoundId = "rbxassetid://9119731302"
    ufoSound.Volume = 0.3
    ufoSound.Looped = true
    ufoSound.Parent = workspace
    ufoSound:Play()

    table.insert(specialEffects, ufoSound)

    toggleMusic(isMusicEnabled)
end

-- ========= TP func =========
TeleportButton.MouseButton1Click:Connect(function()
    if teleportPad and teleportPad.Parent then
        local character = LocalPlayer.Character
        if character then
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                humanoidRootPart.CFrame = teleportPad.CFrame + Vector3.new(0, 5, 0)
            end
        end
    else
        createMap()
    end
end)

-- ========= Effects Toggle =========
EffectsToggle.MouseButton1Click:Connect(function()
    isEffectsEnabled = not isEffectsEnabled
    
    if isEffectsEnabled then
        for _, effect in pairs(specialEffects) do
            if effect then
                if typeof(effect) == "Instance" and effect:IsA("Sound") then
                    effect:Play()
                elseif typeof(effect) == "RBXScriptConnection" then
                    effect.Connected = true
                elseif type(effect) == "table" then
                    for _, subEffect in pairs(effect) do
                        if subEffect and typeof(subEffect) == "RBXScriptConnection" then
                            subEffect.Connected = true
                        end
                    end
                end
            end
        end
        EffectsToggle.Text = "Special Effects: ON"
    else
        for _, effect in pairs(specialEffects) do
            if effect then
                if typeof(effect) == "Instance" and effect:IsA("Sound") then
                    effect:Pause()
                elseif typeof(effect) == "RBXScriptConnection" then
                    effect.Connected = false
                elseif type(effect) == "table" then
                    for _, subEffect in pairs(effect) do
                        if subEffect and typeof(subEffect) == "RBXScriptConnection" then
                            subEffect.Connected = false
                        end
                    end
                end
            end
        end
        EffectsToggle.Text = "Special Effects: OFF"
    end
end)

-- ========= Close btn =========
CloseButton.MouseButton1Click:Connect(function()
    StellarNexusUI:Destroy()
    applyLighting(originalLighting)
    
    for _, effect in pairs(specialEffects) do
        if effect then
            if typeof(effect) == "Instance" then
                effect:Destroy()
            elseif typeof(effect) == "RBXScriptConnection" then
                effect:Disconnect()
            elseif type(effect) == "table" then
                for _, subEffect in pairs(effect) do
                    if subEffect and typeof(subEffect) == "RBXScriptConnection" then
                        subEffect:Disconnect()
                    end
                end
            end
        end
    end
    
    if island and island.Parent then
        island:Destroy()
    end
    
    for _, child in pairs(Lighting:GetChildren()) do
        if child:IsA("Sky") then
            child:Destroy()
        end
    end
    
    backgroundMusic:Stop()
    ambientSound:Stop()
end)

-- ========= Initialize =========
createMap()

LocalPlayer.CharacterRemoving:Connect(function()
    if StellarNexusUI then
        StellarNexusUI:Destroy()
    end
    applyLighting(originalLighting)
end)
