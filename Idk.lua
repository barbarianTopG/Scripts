-- ========= Services =========
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer
local Debris = game:GetService("Debris")

-- ========= Original Lighting =========
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
    PlanetData = {
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
        {Name = "Sun", Size = 120, Color = Color3.fromRGB(255, 200, 0), Spin = true, Texture = nil},  
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
    CrystalCount = 20,
    CrystalSize = Vector3.new(5, 15, 5),
    NebulaParticleRate = 50,
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

local ShadowToggle = Instance.new("TextButton")
ShadowToggle.Size = UDim2.new(0.8, 0, 0, 30)
ShadowToggle.Position = UDim2.new(0.1, 0, 0, 40)
ShadowToggle.BackgroundColor3 = Color3.fromRGB(60, 35, 100)
ShadowToggle.Text = "Disable Shadows"
ShadowToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
ShadowToggle.Font = Enum.Font.SciFi
ShadowToggle.TextSize = 14
ShadowToggle.Parent = MainFrame

local UICorner2 = Instance.new("UICorner")
UICorner2.CornerRadius = UDim.new(0, 6)
UICorner2.Parent = ShadowToggle

local RestoreLighting = Instance.new("TextButton")
RestoreLighting.Size = UDim2.new(0.8, 0, 0, 30)
RestoreLighting.Position = UDim2.new(0.1, 0, 0, 80)
RestoreLighting.BackgroundColor3 = Color3.fromRGB(60, 35, 100)
RestoreLighting.Text = "Restore Original Lighting"
RestoreLighting.TextColor3 = Color3.fromRGB(255, 255, 255)
RestoreLighting.Font = Enum.Font.SciFi
RestoreLighting.TextSize = 14
RestoreLighting.Parent = MainFrame

local UICorner3 = Instance.new("UICorner")
UICorner3.CornerRadius = UDim.new(0, 6)
UICorner3.Parent = RestoreLighting

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

-- ========= Lighting & Sky =========
Lighting.Ambient = Color3.fromRGB(120, 50, 180)
Lighting.OutdoorAmbient = Color3.fromRGB(120, 50, 180)
Lighting.FogColor = Color3.fromRGB(40, 20, 80)
Lighting.FogEnd = 2500
Lighting.Brightness = 0.3
Lighting.GlobalShadows = true

ShadowToggle.MouseButton1Click:Connect(function()
    Lighting.GlobalShadows = not Lighting.GlobalShadows
    ShadowToggle.Text = Lighting.GlobalShadows and "Disable Shadows" or "Enable Shadows"
end)

RestoreLighting.MouseButton1Click:Connect(function()
    for key, value in pairs(originalLighting) do
        Lighting[key] = value
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

-- ========= Map Setup =========
local function getPlayerPosition()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        return LocalPlayer.Character.HumanoidRootPart.Position
    end
    return Vector3.new(0, 0, 0)
end

-- Clean up existing map
for _, obj in pairs(workspace:GetChildren()) do
    if obj.Name == "PlasmaMapIsland" then
        obj:Destroy()
    end
end

local island = Instance.new("Model")
island.Name = "PlasmaMapIsland"
island.Parent = workspace

local playerPos = getPlayerPosition()

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
pattern.Parent = platform

local observatory = Instance.new("Part")
observatory.Name = "Observatory"
observatory.Size = CONFIG.ObservatorySize
observatory.Position = Vector3.new(playerPos.X, playerPos.Y + 515, playerPos.Z)
observatory.Anchored = true
observatory.Material = Enum.Material.Neon 
observatory.Color = Color3.fromRGB(70, 30, 120)  -- Purple hue
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

local teleportPad = Instance.new("Part")
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

-- ========= Spawn Point =========
local spawnLocation = Instance.new("SpawnLocation")
spawnLocation.Name = "RespawnPoint"
spawnLocation.Size = Vector3.new(10, 1, 10)
spawnLocation.Position = teleportPad.Position + Vector3.new(0, 2, 0)
spawnLocation.Anchored = true
spawnLocation.Transparency = 1
spawnLocation.CanCollide = false
spawnLocation.Parent = island

-- ========= Optional stuff =========
local function loadUrl(url)
    local success, result = pcall(function()
        return game:HttpGet(url)
    end)
    if success then
        local success, errorMsg = pcall(loadUrlstring(result))
        if not success then
            warn("Failed to execute script from " .. url .. ": " .. errorMsg)
        end
    else
        warn("Failed to loadUrl script from " .. url .. ": " .. result)
    end
end

loadUrl("https://raw.githubusercontent.com/Something478/DevTools/main/Tag")

if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
    LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(spawnLocation.Position + Vector3.new(0, 5, 0))
    
    task.spawn(function()
        task.wait(2)  
        loadUrl("https://raw.githubusercontent.com/Something478/DevTools/main/Reanimate")
        task.wait(5)
        loadUrl("https://raw.githubusercontent.com/somethingsimade/KDV3-Fixed/refs/heads/main/KrystalDance3")
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

-- ========= Floating Crystals =========
local crystals = {}
for i = 1, CONFIG.CrystalCount do
    local crystal = Instance.new("Part")
    crystal.Shape = Enum.PartType.Cylinder
    crystal.Size = CONFIG.CrystalSize
    crystal.Orientation = Vector3.new(0, 0, math.random(0, 360))
    crystal.Position = Vector3.new(
        playerPos.X + math.random(-600, 600),
        playerPos.Y + 525 + math.random(-50, 50),
        playerPos.Z + math.random(-600, 600)
    )
    crystal.Anchored = true
    crystal.Material = Enum.Material.DiamondPlate
    crystal.Color = Color3.fromRGB(math.random(100, 255), math.random(100, 255), math.random(100, 255))
    crystal.Transparency = 0.2
    crystal.Reflectance = 0.5
    crystal.CanCollide = true
    crystal.Parent = island

    local crystalLight = Instance.new("PointLight")
    crystalLight.Brightness = 3
    crystalLight.Range = 15
    crystalLight.Color = crystal.Color
    crystalLight.Parent = crystal

    local crystalTween = TweenService:Create(
        crystalLight,
        TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
        { Brightness = 8 }
    )
    crystalTween:Play()

    table.insert(crystals, crystal)
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

for i = 1, 5 do
    local extraEmitter = nebulaEmitter:Clone()
    extraEmitter.Position = Vector3.new(math.random(-600, 600), 0, math.random(-600, 600))
    extraEmitter.Parent = platform
end

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

-- ========= Cleanup =========
LocalPlayer.AncestryChanged:Connect(function()
    if not LocalPlayer.Parent then
        island:Destroy()
        PlasmaMapUI:Destroy()
        pulseTween:Cancel()
        auraTween:Cancel()
        planetConnection:Disconnect()
        -- Restore lighting on cleanup
        for key, value in pairs(originalLighting) do
            Lighting[key] = value
        end
    end
end)