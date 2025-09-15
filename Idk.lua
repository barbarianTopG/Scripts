-- ========= Services =========
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer
local Debris = game:GetService("Debris")

-- ========= Original Lighting Save =========
local originalLighting = {
    Ambient = Lighting.Ambient,
    OutdoorAmbient = Lighting.OutdoorAmbient,
    FogColor = Lighting.FogColor,
    FogEnd = Lighting.FogEnd,
    Brightness = Lighting.Brightness,
    GlobalShadows = Lighting.GlobalShadows,
}

-- ========= Configuration =========
local CONFIG = {
    PlatformSize = Vector3.new(1200, 25, 1200),
    ObservatorySize = Vector3.new(80, 30, 80),
    BubbleSize = Vector3.new(70, 30, 70),
    TeleportPadSize = Vector3.new(15, 2, 15),
    PlanetData = {  -- Specific planets, no Sun
        {Name = "Mercury", Size = 20, Color = Color3.fromRGB(150, 150, 150), Spin = true, Texture = nil},
        {Name = "Venus", Size = 40, Color = Color3.fromRGB(200, 150, 50), Spin = true, Texture = nil},
        {Name = "Earth", Size = 40, Color = Color3.fromRGB(0, 100, 200), Spin = true, Texture = "rbxassetid://453515908"},
        {Name = "Moon", Size = 15, Color = Color3.fromRGB(200, 200, 200), Spin = false, Texture = nil},
        {Name = "Mars", Size = 30, Color = Color3.fromRGB(200, 50, 0), Spin = true, Texture = nil},
        {Name = "Jupiter", Size = 100, Color = Color3.fromRGB(200, 150, 100), Spin = true, Texture = nil},
        {Name = "Saturn", Size = 90, Color = Color3.fromRGB(180, 140, 60), Spin = true, Texture = nil},
        {Name = "Uranus", Size = 70, Color = Color3.fromRGB(100, 200, 200), Spin = true, Texture = nil},
        {Name = "Neptune", Size = 70, Color = Color3.fromRGB(50, 50, 200), Spin = true, Texture = nil},
        {Name = "Pluto", Size = 15, Color = Color3.fromRGB(200, 180, 150), Spin = true, Texture = nil},
        {Name = "Europa", Size = 20, Color = Color3.fromRGB(220, 220, 220), Spin = false, Texture = nil},
    },
    PlanetDistanceRange = {-1000, 1000},
    PlanetHeightRange = {600, 1200},
    AuraSize = Vector3.new(3000, 3000, 3000),
    SkyboxAsset = "http://www.roblox.com/asset/?id=159454299",
    PlatformTexture = "http://www.roblox.com/asset/?id=5107151155",
    AsteroidCount = 50,
    AsteroidSizeRange = {10, 30},
    AsteroidDistanceRange = {-1000, 1000},
    AsteroidHeightRange = {100, 800},
    NebulaParticleRate = 50,
    UFOSize = Vector3.new(40, 10, 40),
    NebulaRingCount = 3,
    HoloDisplayCount = 5,
    DebrisFieldCount = 30,
}

-- ========= GUI =========
local PlasmaMapUI = Instance.new("ScreenGui")
PlasmaMapUI.Name = "PlasmaMapUI_" .. HttpService:GenerateGUID(false)
PlasmaMapUI.ResetOnSpawn = false
PlasmaMapUI.Parent = game:GetService("CoreGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 220, 0, 160)
MainFrame.Position = UDim2.new(0, 10, 0, 10)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 15, 50)
MainFrame.BackgroundTransparency = 0.3
MainFrame.BorderSizePixel = 0
MainFrame.Parent = PlasmaMapUI

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundTransparency = 1
Title.Text = "Plasma Map Controls"
Title.TextColor3 = Color3.fromRGB(200, 200, 255)
Title.Font = Enum.Font.SciFi
Title.TextSize = 18
Title.Parent = MainFrame

local LightingToggle = Instance.new("TextButton")
LightingToggle.Size = UDim2.new(0.8, 0, 0, 30)
LightingToggle.Position = UDim2.new(0.1, 0, 0, 40)
LightingToggle.BackgroundColor3 = Color3.fromRGB(60, 35, 100)
LightingToggle.Text = "Custom Lighting: On"
LightingToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
LightingToggle.Font = Enum.Font.SciFi
LightingToggle.TextSize = 14
LightingToggle.Parent = MainFrame

local UICorner2 = Instance.new("UICorner")
UICorner2.CornerRadius = UDim.new(0, 6)
UICorner2.Parent = LightingToggle

local TeleportButton = Instance.new("TextButton")
TeleportButton.Size = UDim2.new(0.8, 0, 0, 30)
TeleportButton.Position = UDim2.new(0.1, 0, 0, 80)
TeleportButton.BackgroundColor3 = Color3.fromRGB(60, 35, 100)
TeleportButton.Text = "Teleport to Pad"
TeleportButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TeleportButton.Font = Enum.Font.SciFi
TeleportButton.TextSize = 14
TeleportButton.Parent = MainFrame

local UICorner3 = Instance.new("UICorner")
UICorner3.CornerRadius = UDim.new(0, 6)
UICorner3.Parent = TeleportButton

-- ========= Draggable GUI =========
local dragging, dragInput, dragStart, startPos
local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

MainFrame.InputBegan:Connect(function(input)
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

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

-- ========= Custom and Original Lighting =========
local customLighting = {
    Ambient = Color3.fromRGB(120, 50, 180),
    OutdoorAmbient = Color3.fromRGB(120, 50, 180),
    FogColor = Color3.fromRGB(40, 20, 80),
    FogEnd = 2500,
    Brightness = 0.3,
    GlobalShadows = true,
}

local isCustomLighting = true

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
        LightingToggle.Text = "Custom Lighting: On"
    else
        applyLighting(originalLighting)
        LightingToggle.Text = "Custom Lighting: Off"
    end
end)

local sky = Lighting:FindFirstChildOfClass("Sky") or Instance.new("Sky")
sky.SkyboxBk = CONFIG.SkyboxAsset
sky.SkyboxDn = CONFIG.SkyboxAsset
sky.SkyboxFt = CONFIG.SkyboxAsset
sky.SkyboxLf = CONFIG.SkyboxAsset
sky.SkyboxRt = CONFIG.SkyboxAsset
sky.SkyboxUp = CONFIG.SkyboxAsset
sky.StarCount = 5000
sky.Parent = Lighting

-- ========= Map Creation and Teleport =========
local island, teleportPad

local function createMap()
    -- Clean up existing map
    for _, obj in pairs(workspace:GetChildren()) do
        if obj.Name == "PlasmaMapIsland" then
            obj:Destroy()
        end
    end

    island = Instance.new("Model")
    island.Name = "PlasmaMapIsland"
    island.Parent = workspace

    local playerPos = (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")) and LocalPlayer.Character.HumanoidRootPart.Position or Vector3.new(0, 100, 0)

    local platform = Instance.new("Part")
    platform.Name = "NebulaPlatform"
    platform.Size = CONFIG.PlatformSize
    platform.Position = Vector3.new(playerPos.X, playerPos.Y + 500, playerPos.Z)
    platform.Anchored = true
    platform.Material = Enum.Material.Neon
    platform.Color = Color3.fromRGB(15, 3, 35)
    platform.Reflectance = 0.1
    platform.CanCollide = true
    platform.Parent = island

    local pattern = Instance.new("Decal")
    pattern.Face = Enum.NormalId.Top
    pattern.Texture = CONFIG.PlatformTexture
    pattern.Transparency = 0.2
    pattern.Parent = platform

    local observatory = Instance.new("Part")
    observatory.Name = "Observatory"
    observatory.Size = CONFIG.ObservatorySize
    observatory.Position = Vector3.new(playerPos.X, playerPos.Y + 515, playerPos.Z)
    observatory.Anchored = true
    observatory.Material = Enum.Material.Neon
    observatory.Color = Color3.fromRGB(70, 30, 120)
    observatory.Reflectance = 0.3
    observatory.CanCollide = true
    observatory.Parent = island

    local bubble = Instance.new("Part")
    bubble.Shape = Enum.PartType.Ball
    bubble.Size = CONFIG.BubbleSize
    bubble.Position = Vector3.new(playerPos.X, playerPos.Y + 540, playerPos.Z)
    bubble.Anchored = true
    bubble.Material = Enum.Material.Glass
    bubble.Transparency = 0.4
    bubble.Reflectance = 0.3
    bubble.Color = Color3.fromRGB(70, 120, 255)
    bubble.CanCollide = false
    bubble.Parent = island

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
    padLight.Brightness = 6
    padLight.Range = 20
    padLight.Color = Color3.fromRGB(0, 170, 255)
    padLight.Parent = teleportPad

    local pulseTween = TweenService:Create(
        padLight,
        TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
        { Brightness = 12}
    )
    pulseTween:Play()

    -- ========= UFO (New) =========
    local ufo = Instance.new("Part")
    ufo.Name = "UFO"
    ufo.Size = CONFIG.UFOSize
    ufo.Position = Vector3.new(playerPos.X + 200, playerPos.Y + 600, playerPos.Z)
    ufo.Anchored = true
    ufo.Material = Enum.Material.Metal
    ufo.Color = Color3.fromRGB(100, 100, 100)
    ufo.Reflectance = 0.4
    ufo.CanCollide = false
    ufo.Parent = island

    local ufoLight = Instance.new("PointLight")
    ufoLight.Brightness = 5
    ufoLight.Range = 30
    ufoLight.Color = Color3.fromRGB(0, 255, 100)
    ufoLight.Parent = ufo

    local ufoTween = TweenService:Create(
        ufo,
        TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
        { Position = ufo.Position + Vector3.new(0, 20, 0) }
    )
    ufoTween:Play()

    task.spawn(function()
        while ufo.Parent do
            ufo.CFrame = ufo.CFrame * CFrame.Angles(0, math.rad(1), 0)
            task.wait(0.05)
        end
    end)

    -- ========= Nebula Rings (New) =========
    for i = 1, CONFIG.NebulaRingCount do
        local ring = Instance.new("Part")
        ring.Name = "NebulaRing" .. i
        ring.Size = Vector3.new(200 + i * 100, 2, 200 + i * 100)
        ring.Position = Vector3.new(playerPos.X, playerPos.Y + 510 + i * 10, playerPos.Z)
        ring.Anchored = true
        ring.Material = Enum.Material.Neon
        ring.Color = Color3.fromRGB(120, 50, math.random(180, 255))
        ring.Transparency = 0.5
        ring.CanCollide = false
        ring.Parent = island

        task.spawn(function()
            while ring.Parent do
                ring.CFrame = ring.CFrame * CFrame.Angles(0, math.rad(0.5 * (i % 2 == 0 and 1 or -1)), 0)
                task.wait(0.05)
            end
        end)
    end

    -- ========= Holographic Displays (New) =========
    for i = 1, CONFIG.HoloDisplayCount do
        local holo = Instance.new("BillboardGui")
        holo.Name = "HoloDisplay" .. i
        holo.Size = UDim2.new(0, 50, 0, 50)
        holo.StudsOffset = Vector3.new(math.random(-300, 300), math.random(20, 50), math.random(-300, 300))
        holo.AlwaysOnTop = true
        holo.Parent = platform

        local holoImage = Instance.new("ImageLabel")
        holoImage.Size = UDim2.new(1, 0, 1, 0)
        holoImage.BackgroundTransparency = 1
        holoImage.Image = "rbxassetid://705351127"
        holoImage.ImageTransparency = 0.3
        holoImage.Parent = holo

        local holoTween = TweenService:Create(
            holoImage,
            TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
            { ImageTransparency = 0.7 }
        )
        holoTween:Play()
    end

    -- ========= Cosmic Debris Fields (New) =========
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
        debris.Transparency = 0.6
        debris.CanCollide = false
        debris.Parent = island

        task.spawn(function()
            while debris.Parent do
                debris.CFrame = debris.CFrame * CFrame.Angles(math.rad(math.random(1, 3)/10), math.rad(math.random(1, 3)/10), math.rad(math.random(1, 3)/10))
                task.wait(0.1)
            end
        end)
    end

    -- ========= Planets =========
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
        planet.Material = Enum.Material.SmoothPlastic
        planet.Color = data.Color
        planet.Reflectance = 0.1
        planet.CanCollide = true
        planet.Parent = island

        if data.Texture then
            local decal = Instance.new("Decal")
            decal.Texture = data.Texture
            decal.Face = Enum.NormalId.Front
            decal.Parent = planet
        end

        local glow = Instance.new("PointLight")
        glow.Brightness = math.random(5, 10)
        glow.Range = planet.Size.X * 2
        glow.Color = data.Color
        glow.Parent = planet

        planet:SetAttribute("Spin", data.Spin)
        table.insert(planets, planet)
    end

    -- ========= Floating Asteroids =========
    local asteroids = {}
    for i = 1, CONFIG.AsteroidCount do
        local asteroid = Instance.new("Part")
        asteroid.Shape = Enum.PartType.Ball
        local size = math.random(CONFIG.AsteroidSizeRange[1], CONFIG.AsteroidSizeRange[2])
        asteroid.Size = Vector3.new(size, size, size)
        asteroid.Position = Vector3.new(
            playerPos.X + math.random(CONFIG.AsteroidDistanceRange[1], CONFIG.AsteroidDistanceRange[2]),
            playerPos.Y + math.random(CONFIG.AsteroidHeightRange[1], CONFIG.AsteroidHeightRange[2]),
            playerPos.Z + math.random(CONFIG.AsteroidDistanceRange[1], CONFIG.AsteroidDistanceRange[2])
        )
        asteroid.Anchored = true
        asteroid.Material = Enum.Material.Rock
        asteroid.Color = Color3.fromRGB(math.random(50, 100), math.random(50, 100), math.random(50, 100))
        asteroid.Reflectance = 0.05
        asteroid.CanCollide = false
        asteroid.Parent = island

        task.spawn(function()
            while asteroid.Parent do
                asteroid.CFrame = asteroid.CFrame * CFrame.Angles(math.rad(math.random(1, 5)/10), math.rad(math.random(1, 5)/10), math.rad(math.random(1, 5)/10))
                task.wait(0.1)
            end
        end)
        table.insert(asteroids, asteroid)
    end

    -- ========= Nebula Particles =========
    local nebulaEmitter = Instance.new("ParticleEmitter")
    nebulaEmitter.Name = "NebulaParticles"
    nebulaEmitter.Texture = "rbxassetid://243660364"
    nebulaEmitter.Lifetime = NumberRange.new(10, 20)
    nebulaEmitter.Rate = CONFIG.NebulaParticleRate
    nebulaEmitter.Speed = NumberRange.new(5, 10)
    nebulaEmitter.SpreadAngle = Vector2.new(360, 360)
    nebulaEmitter.EmissionDirection = Enum.NormalId.Top
    nebulaEmitter.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(120, 50, 180)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(70, 120, 255))
    })
    nebulaEmitter.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.5),
        NumberSequenceKeypoint.new(1, 1)
    })
    nebulaEmitter.Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 5),
        NumberSequenceKeypoint.new(1, 20)
    })
    nebulaEmitter.Parent = platform
    nebulaEmitter.Enabled = true

    -- Create anchor parts for extra emitters
    for i = 1, 5 do
        local anchor = Instance.new("Part")
        anchor.Name = "NebulaAnchor" .. i
        anchor.Size = Vector3.new(1, 1, 1)
        anchor.Position = Vector3.new(playerPos.X + math.random(-600, 600), platform.Position.Y, playerPos.Z + math.random(-600, 600))
        anchor.Anchored = true
        anchor.Transparency = 1
        anchor.CanCollide = false
        anchor.Parent = island

        local extraEmitter = nebulaEmitter:Clone()
        extraEmitter.Parent = anchor
    end

    -- ========= Cosmic Aura =========
    local aura = Instance.new("Part")
    aura.Name = "CosmicAura"
    aura.Anchored = true
    aura.Size = CONFIG.AuraSize
    aura.Position = Vector3.new(playerPos.X, playerPos.Y + 500, playerPos.Z)
    aura.Transparency = 0.9
    aura.Material = Enum.Material.Neon
    aura.Color = Color3.fromRGB(50, 20, 100)
    aura.CanCollide = false
    aura.Parent = island

    local auraLight = Instance.new("PointLight")
    auraLight.Brightness = 5
    auraLight.Range = 1500
    auraLight.Color = aura.Color
    auraLight.Parent = aura

    local auraTween = TweenService:Create(
        auraLight,
        TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
        { Brightness = 12}
    )
    auraTween:Play()

    -- ========= Planet Rotation =========
    local planetConnection
    planetConnection = RunService.Heartbeat:Connect(function(dt)
        if not island.Parent then
            planetConnection:Disconnect()
            return
        end
        for _, planet in pairs(planets) do
            if planet.Parent and planet:GetAttribute("Spin") then
                planet.CFrame = planet.CFrame * CFrame.Angles(0, dt * 0.1, 0)
            end
        end
    end)

    return island, teleportPad
end

-- ========= Teleport Function =========
local function teleportToPad()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and teleportPad and teleportPad.Parent then
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(teleportPad.Position + Vector3.new(0, 5, 0))
    else
        warn("Cannot teleport: Character or teleport pad not found")
    end
end

-- ========= Initialize Map and Teleport =========
task.spawn(function()
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    character:WaitForChild("HumanoidRootPart")
    character:WaitForChild("Humanoid")
    island, teleportPad = createMap()
    teleportToPad()

    -- Handle manual teleport button
    TeleportButton.MouseButton1Click:Connect(teleportToPad)

    -- Handle character respawn
    LocalPlayer.CharacterAdded:Connect(function(newCharacter)
        newCharacter:WaitForChild("HumanoidRootPart")
        newCharacter:WaitForChild("Humanoid")
        task.wait(0.1)  -- Small delay to ensure map is ready
        teleportToPad()
    end)

    -- ========= Load External Scripts =========
    local function loadExternalScript(url)
        local success, result = pcall(function()
            return game:HttpGet(url)
        end)
        if success then
            local success, errorMsg = pcall(loadstring(result))
            if not success then
                warn("Failed to execute script from " .. url .. ": " .. errorMsg)
            end
        else
            warn("Failed to load script from " .. url .. ": " .. result)
        end
    end

    loadExternalScript("https://raw.githubusercontent.com/Something478/DevTools/main/Tag")
    task.spawn(function()
        task.wait(2)
        loadExternalScript("https://raw.githubusercontent.com/Something478/DevTools/main/Reanimate")
        task.wait(5)
        loadExternalScript("https://raw.githubusercontent.com/somethingsimade/KDV3-Fixed/refs/heads/main/KrystalDance3")
    end)
end)

-- ========= Cleanup =========
LocalPlayer.AncestryChanged:Connect(function()
    if not LocalPlayer.Parent then
        if island then island:Destroy() end
        PlasmaMapUI:Destroy()
        applyLighting(originalLighting)
    end
end)