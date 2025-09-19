-- ========= Services =========
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local Debris = game:GetService("Debris")

local PLAYER = Players.LocalPlayer
local CAMERA = Workspace.CurrentCamera

-- ========= Configuration =========
local MAP_SIZE = 2000
local PLANET_SPEED_MULTIPLIER = 1
local ASTEROID_COUNT = 50
local COMET_COUNT = 5
local UFO_COUNT = 3

-- Save original lighting to revert
local OriginalLighting = {
	ClockTime = Lighting.ClockTime,
	Brightness = Lighting.Brightness,
	Ambient = Lighting.Ambient,
	OutdoorAmbient = Lighting.OutdoorAmbient,
	GlobalShadows = Lighting.GlobalShadows,
	FogEnd = Lighting.FogEnd,
	FogStart = Lighting.FogStart,
	FogColor = Lighting.FogColor,
}

-- ========= Clear Workspace =========
for _, v in pairs(Workspace:GetChildren()) do
	if v:IsA("BasePart") or v:IsA("Model") then
		v:Destroy()
	end
end

-- ========= Observatory Platform =========
local platform = Instance.new("Part")
platform.Size = Vector3.new(50, 5, 50)
platform.Position = Vector3.new(0, 0, 0)
platform.Anchored = true
platform.Material = Enum.Material.Neon
platform.Color = Color3.fromRGB(50, 50, 100)
platform.Name = "ObservatoryPlatform"
platform.Parent = Workspace

-- Add some detail to the platform
local centerPiece = Instance.new("Part")
centerPiece.Size = Vector3.new(10, 1, 10)
centerPiece.Position = platform.Position + Vector3.new(0, 3, 0)
centerPiece.Anchored = true
centerPiece.Material = Enum.Material.Neon
centerPiece.Color = Color3.fromRGB(70, 70, 150)
centerPiece.Name = "CenterPiece"
centerPiece.Parent = Workspace

-- ========= Sun =========
local sun = Instance.new("Part")
sun.Shape = Enum.PartType.Ball
sun.Size = Vector3.new(100, 100, 100)
sun.Anchored = true
sun.Material = Enum.Material.Neon
sun.BrickColor = BrickColor.new("New Yeller")
sun.Position = Vector3.new(0, 500, 0)
sun.Name = "Sun"
sun.Parent = Workspace

-- Add sun glow effect
local sunGlow = Instance.new("SurfaceLight", sun)
sunGlow.Brightness = 5
sunGlow.Range = 100
sunGlow.Color = Color3.fromRGB(255, 200, 50)

local sunLight = Instance.new("PointLight", sun)
sunLight.Range = 2000
sunLight.Brightness = 5
sunLight.Color = Color3.fromRGB(255, 255, 150)

-- Animate the sun
spawn(function()
	while true do
		local tween = TweenService:Create(
			sun,
			TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
			{Size = Vector3.new(110, 110, 110)}
		)
		tween:Play()
		tween.Completed:Wait()
		
		local tween2 = TweenService:Create(
			sun,
			TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
			{Size = Vector3.new(100, 100, 100)}
		)
		tween2:Play()
		tween2.Completed:Wait()
	end
end)

-- ========= Planets =========
local planetData = {
	{name="Mercury", color=Color3.fromRGB(169,169,169), radius=10, distance=150, speed=0.02},
	{name="Venus", color=Color3.fromRGB(218,165,32), radius=18, distance=220, speed=0.015},
	{name="Earth", color=Color3.fromRGB(0,102,204), radius=20, distance=300, speed=0.01},
	{name="Mars", color=Color3.fromRGB(188,39,50), radius=15, distance=400, speed=0.008},
	{name="Jupiter", color=Color3.fromRGB(218,165,32), radius=35, distance=550, speed=0.005},
	{name="Saturn", color=Color3.fromRGB(210,180,140), radius=30, distance=700, speed=0.004},
	{name="Uranus", color=Color3.fromRGB(173,216,230), radius=25, distance=850, speed=0.003},
	{name="Neptune", color=Color3.fromRGB(0,0,255), radius=25, distance=1000, speed=0.002},
}

local planets = {}

for _, data in pairs(planetData) do
	local planet = Instance.new("Part")
	planet.Shape = Enum.PartType.Ball
	planet.Size = Vector3.new(data.radius*2, data.radius*2, data.radius*2)
	planet.Color = data.color
	planet.Anchored = true
	planet.Position = Vector3.new(data.distance, 0, 0)
	planet.Name = data.name
	planet.Parent = Workspace
	
	-- Add a ring for Saturn
	if data.name == "Saturn" then
		local ring = Instance.new("Part")
		ring.Shape = Enum.PartType.Cylinder
		ring.Size = Vector3.new(1, data.radius * 2.5, data.radius * 2.5)
		ring.Color = Color3.fromRGB(210, 180, 140)
		ring.Transparency = 0.5
		ring.Material = Enum.Material.Neon
		ring.Anchored = true
		ring.CFrame = planet.CFrame * CFrame.Angles(math.pi/2, 0, 0)
		ring.Name = "SaturnRing"
		ring.Parent = planet
	end
	
	planets[data.name] = {obj = planet, distance = data.distance, speed = data.speed, angle = math.random()*math.pi*2}
end

-- ========= Black Hole =========
local blackHole = Instance.new("Part")
blackHole.Shape = Enum.PartType.Ball
blackHole.Size = Vector3.new(60, 60, 60)
blackHole.Anchored = true
blackHole.Material = Enum.Material.SmoothPlastic
blackHole.Color = Color3.fromRGB(5, 5, 5)
blackHole.Position = Vector3.new(-1200, 200, -1200) -- Positioned far from the solar system
blackHole.Name = "BlackHole"
blackHole.Parent = Workspace

-- Add black hole effects
local blackHoleGlow = Instance.new("PointLight", blackHole)
blackHoleGlow.Range = 100
blackHoleGlow.Brightness = 2
blackHoleGlow.Color = Color3.fromRGB(50, 0, 100)

-- Create accretion disk around black hole
local accretionDisk = Instance.new("Part")
accretionDisk.Shape = Enum.PartType.Cylinder
accretionDisk.Size = Vector3.new(2, 120, 120)
accretionDisk.Anchored = true
accretionDisk.Material = Enum.Material.Neon
accretionDisk.Color = Color3.fromRGB(200, 50, 255)
accretionDisk.Transparency = 0.7
accretionDisk.CFrame = blackHole.CFrame * CFrame.Angles(math.pi/2, 0, 0)
accretionDisk.Name = "AccretionDisk"
accretionDisk.Parent = Workspace

-- ========= Supernova =========
local supernova = Instance.new("Part")
supernova.Shape = Enum.PartType.Ball
supernova.Size = Vector3.new(150, 150, 150)
supernova.Anchored = true
supernova.Material = Enum.Material.Neon
supernova.Color = Color3.fromRGB(255, 100, 50)
supernova.Position = Vector3.new(1500, 400, 1500) -- Positioned far from the solar system
supernova.Name = "Supernova"
supernova.Parent = Workspace

-- Add supernova effects
local supernovaLight = Instance.new("PointLight", supernova)
supernovaLight.Range = 2000
supernovaLight.Brightness = 10
supernovaLight.Color = Color3.fromRGB(255, 150, 50)

-- Animate the supernova
spawn(function()
	while true do
		-- Pulsating effect
		for i = 1, 10 do
			local size = 150 + i * 5
			supernova.Size = Vector3.new(size, size, size)
			supernovaLight.Brightness = 10 + i
			wait(0.3)
		end
		
		for i = 10, 1, -1 do
			local size = 150 + i * 5
			supernova.Size = Vector3.new(size, size, size)
			supernovaLight.Brightness = 10 + i
			wait(0.3)
		end
	end
end)

-- ========= Asteroids =========
local asteroids = {}
for i=1, ASTEROID_COUNT do
	local ast = Instance.new("Part")
	ast.Shape = Enum.PartType.Ball
	ast.Size = Vector3.new(math.random(3, 8), math.random(3, 8), math.random(3, 8))
	ast.Color = Color3.fromRGB(120, 120, 120)
	ast.Position = Vector3.new(math.random(-MAP_SIZE/2, MAP_SIZE/2), math.random(50, 500), math.random(-MAP_SIZE/2, MAP_SIZE/2))
	ast.Anchored = true
	ast.Material = Enum.Material.Slate
	ast.Parent = Workspace
	table.insert(asteroids, ast)
end

-- ========= Comets =========
local comets = {}
for i=1, COMET_COUNT do
	local comet = Instance.new("Part")
	comet.Shape = Enum.PartType.Ball
	comet.Size = Vector3.new(5, 5, 5)
	comet.Color = Color3.fromRGB(200, 200, 255)
	comet.Position = Vector3.new(math.random(-MAP_SIZE, MAP_SIZE), math.random(200, 600), math.random(-MAP_SIZE, MAP_SIZE))
	comet.Anchored = true
	comet.Material = Enum.Material.Neon
	comet.Parent = Workspace
	
	-- Add comet tail
	local tail = Instance.new("Part")
	tail.Shape = Enum.PartType.Cylinder
	tail.Size = Vector3.new(1, 15, 15)
	tail.Color = Color3.fromRGB(150, 150, 255)
	tail.Transparency = 0.7
	tail.Material = Enum.Material.Neon
	tail.Anchored = true
	tail.Name = "CometTail"
	tail.Parent = comet
	
	table.insert(comets, {obj=comet, velocity=Vector3.new(math.random(-10,10),0,math.random(-10,10))})
end

-- ========= UFOs =========
local ufos = {}
for i=1, UFO_COUNT do
	local ufoBase = Instance.new("Part")
	ufoBase.Shape = Enum.PartType.Cylinder
	ufoBase.Size = Vector3.new(5, 15, 15)
	ufoBase.Color = Color3.fromRGB(0, 255, 0)
	ufoBase.Anchored = true
	ufoBase.Position = Vector3.new(math.random(-MAP_SIZE/2, MAP_SIZE/2), math.random(50,300), math.random(-MAP_SIZE/2, MAP_SIZE/2))
	ufoBase.Material = Enum.Material.Neon
	ufoBase.Parent = Workspace
	
	local ufoTop = Instance.new("Part")
	ufoTop.Shape = Enum.PartType.Ball
	ufoTop.Size = Vector3.new(10, 5, 10)
	ufoTop.Color = Color3.fromRGB(0, 200, 0)
	ufoTop.Anchored = true
	ufoTop.Position = ufoBase.Position + Vector3.new(0, 7, 0)
	ufoTop.Material = Enum.Material.Neon
	ufoTop.Parent = Workspace
	
	-- Add UFO light
	local ufoLight = Instance.new("PointLight", ufoTop)
	ufoLight.Range = 30
	ufoLight.Brightness = 3
	ufoLight.Color = Color3.fromRGB(0, 255, 0)
	
	table.insert(ufos, {base = ufoBase, top = ufoTop, speed=Vector3.new(math.random(-2,2),0,math.random(-2,2))})
end

-- ========= GUI =========
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ObservatoryGUI"
ScreenGui.Parent = PLAYER:WaitForChild("PlayerGui")

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 300, 0, 220)
mainFrame.Position = UDim2.new(0.05, 0, 0.05, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 40)
mainFrame.BorderSizePixel = 2
mainFrame.BorderColor3 = Color3.fromRGB(50, 50, 80)
mainFrame.Parent = ScreenGui
mainFrame.Active = true

-- Make GUI draggable
local dragging
local dragInput
local dragStart
local startPos

local function update(input)
	local delta = input.Position - dragStart
	mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

mainFrame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = mainFrame.Position
		
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

mainFrame.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
	end
end)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundColor3 = Color3.fromRGB(40, 40, 80)
title.Text = "Observatory Controls"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.Parent = mainFrame

-- Purple space lighting toggle
local spaceToggle = Instance.new("TextButton")
spaceToggle.Size = UDim2.new(0, 120, 0, 30)
spaceToggle.Position = UDim2.new(0, 10, 0, 40)
spaceToggle.Text = "Space Lighting"
spaceToggle.Font = Enum.Font.Gotham
spaceToggle.TextSize = 14
spaceToggle.BackgroundColor3 = Color3.fromRGB(100, 0, 150)
spaceToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
spaceToggle.Parent = mainFrame

local spaceEnabled = false
spaceToggle.MouseButton1Click:Connect(function()
	spaceEnabled = not spaceEnabled
	if spaceEnabled then
		spaceToggle.BackgroundColor3 = Color3.fromRGB(150, 50, 200)
		-- Custom purple space lightning
		Lighting.ClockTime = 14
		Lighting.Brightness = 2
		Lighting.Ambient = Color3.fromRGB(60, 0, 100)
		Lighting.OutdoorAmbient = Color3.fromRGB(80, 0, 150)
		Lighting.FogColor = Color3.fromRGB(40, 0, 80)
		Lighting.FogStart = 0
		Lighting.FogEnd = 2000
		Lighting.GlobalShadows = false
	else
		spaceToggle.BackgroundColor3 = Color3.fromRGB(100, 0, 150)
		-- Revert to original
		Lighting.ClockTime = OriginalLighting.ClockTime
		Lighting.Brightness = OriginalLighting.Brightness
		Lighting.Ambient = OriginalLighting.Ambient
		Lighting.OutdoorAmbient = OriginalLighting.OutdoorAmbient
		Lighting.FogColor = OriginalLighting.FogColor
		Lighting.FogStart = OriginalLighting.FogStart
		Lighting.FogEnd = OriginalLighting.FogEnd
		Lighting.GlobalShadows = OriginalLighting.GlobalShadows
	end
end)

-- Speed control slider
local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(0, 120, 0, 20)
speedLabel.Position = UDim2.new(0, 10, 0, 80)
speedLabel.BackgroundTransparency = 1
speedLabel.Text = "Speed: " .. PLANET_SPEED_MULTIPLIER
speedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
speedLabel.Font = Enum.Font.Gotham
speedLabel.TextSize = 14
speedLabel.Parent = mainFrame

local speedSlider = Instance.new("TextButton")
speedSlider.Size = UDim2.new(0, 200, 0, 20)
speedSlider.Position = UDim2.new(0, 10, 0, 100)
speedSlider.Text = ""
speedSlider.BackgroundColor3 = Color3.fromRGB(60, 60, 100)
speedSlider.BorderSizePixel = 0
speedSlider.Parent = mainFrame

local speedFill = Instance.new("Frame")
speedFill.Size = UDim2.new(PLANET_SPEED_MULTIPLIER / 5, 0, 1, 0)
speedFill.Position = UDim2.new(0, 0, 0, 0)
speedFill.BackgroundColor3 = Color3.fromRGB(100, 100, 200)
speedFill.BorderSizePixel = 0
speedFill.Parent = speedSlider

speedSlider.MouseButton1Click:Connect(function(x)
	local percent = math.clamp((x - speedSlider.AbsolutePosition.X) / speedSlider.AbsoluteSize.X, 0, 1)
	PLANET_SPEED_MULTIPLIER = math.floor(percent * 500) / 100
	speedFill.Size = UDim2.new(PLANET_SPEED_MULTIPLIER / 5, 0, 1, 0)
	speedLabel.Text = "Speed: " .. string.format("%.2f", PLANET_SPEED_MULTIPLIER)
end)

-- Toggle visibility buttons
local togglePlanets = Instance.new("TextButton")
togglePlanets.Size = UDim2.new(0, 120, 0, 30)
togglePlanets.Position = UDim2.new(0, 150, 0, 40)
togglePlanets.Text = "Hide Planets"
togglePlanets.Font = Enum.Font.Gotham
togglePlanets.TextSize = 14
togglePlanets.BackgroundColor3 = Color3.fromRGB(80, 80, 160)
togglePlanets.TextColor3 = Color3.fromRGB(255, 255, 255)
togglePlanets.Parent = mainFrame

local planetsVisible = true
togglePlanets.MouseButton1Click:Connect(function()
	planetsVisible = not planetsVisible
	for _, data in pairs(planets) do
		data.obj.Transparency = planetsVisible and 0 or 1
		if data.name == "Saturn" then
			local ring = data.obj:FindFirstChild("SaturnRing")
			if ring then
				ring.Transparency = planetsVisible and 0.5 or 1
			end
		end
	end
	togglePlanets.Text = planetsVisible and "Hide Planets" or "Show Planets"
end)

local toggleAsteroids = Instance.new("TextButton")
toggleAsteroids.Size = UDim2.new(0, 120, 0, 30)
toggleAsteroids.Position = UDim2.new(0, 150, 0, 80)
toggleAsteroids.Text = "Hide Asteroids"
toggleAsteroids.Font = Enum.Font.Gotham
toggleAsteroids.TextSize = 14
toggleAsteroids.BackgroundColor3 = Color3.fromRGB(80, 80, 160)
toggleAsteroids.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleAsteroids.Parent = mainFrame

local asteroidsVisible = true
toggleAsteroids.MouseButton1Click:Connect(function()
	asteroidsVisible = not asteroidsVisible
	for _, ast in pairs(asteroids) do
		ast.Transparency = asteroidsVisible and 0 or 1
	end
	toggleAsteroids.Text = asteroidsVisible and "Hide Asteroids" or "Show Asteroids"
end)

-- Close button
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 50, 0, 30)
closeButton.Position = UDim2.new(1, -60, 0, 10)
closeButton.Text = "X"
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 18
closeButton.BackgroundColor3 = Color3.fromRGB(120, 50, 50)
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Parent = mainFrame

closeButton.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
end)

-- Info text
local infoText = Instance.new("TextLabel")
infoText.Size = UDim2.new(1, -20, 0, 40)
infoText.Position = UDim2.new(0, 10, 1, -50)
infoText.BackgroundTransparency = 1
infoText.Text = "Drag to move GUI\nClick speed bar to adjust"
infoText.TextColor3 = Color3.fromRGB(200, 200, 200)
infoText.Font = Enum.Font.Gotham
infoText.TextSize = 12
infoText.TextWrapped = true
infoText.Parent = mainFrame

-- ========= RunService loop =========
RunService.RenderStepped:Connect(function(delta)
	-- Planets orbit around the sun
	for _, data in pairs(planets) do
		data.angle = data.angle + data.speed * delta * PLANET_SPEED_MULTIPLIER
		local x = math.cos(data.angle) * data.distance
		local z = math.sin(data.angle) * data.distance
		data.obj.Position = Vector3.new(x, 0, z) + sun.Position
		
		-- Rotate planets
		data.obj.CFrame = CFrame.new(data.obj.Position) * CFrame.Angles(0, tick() * data.speed, 0)
		
		-- Keep Saturn's ring aligned
		if data.name == "Saturn" then
			local ring = data.obj:FindFirstChild("SaturnRing")
			if ring then
				ring.CFrame = data.obj.CFrame * CFrame.Angles(math.pi/2, 0, 0)
			end
		end
	end

	-- Move comets
	for _, c in pairs(comets) do
		c.obj.Position = c.obj.Position + c.velocity * delta * 50
		
		-- Update comet tail position and orientation
		local tail = c.obj:FindFirstChild("CometTail")
		if tail then
			tail.CFrame = CFrame.new(c.obj.Position) * 
				CFrame.new(0, 0, 7.5) * 
				CFrame.Angles(math.pi/2, 0, 0) *
				CFrame.Angles(0, 0, math.atan2(c.velocity.X, c.velocity.Z))
		end
		
		if math.abs(c.obj.Position.X) > MAP_SIZE or math.abs(c.obj.Position.Z) > MAP_SIZE then
			c.obj.Position = Vector3.new(math.random(-MAP_SIZE, MAP_SIZE), math.random(200,600), math.random(-MAP_SIZE, MAP_SIZE))
		end
	end

	-- Move UFOs
	for _, u in pairs(ufos) do
		u.base.Position = u.base.Position + u.speed * delta * 20
		u.top.Position = u.base.Position + Vector3.new(0, 7, 0)
		
		-- Rotate UFOs
		u.base.CFrame = CFrame.new(u.base.Position) * CFrame.Angles(0, tick() * 0.5, 0)
		u.top.CFrame = CFrame.new(u.top.Position) * CFrame.Angles(0, tick() * 0.5, 0)
		
		if math.abs(u.base.Position.X) > MAP_SIZE/2 then 
			u.speed = Vector3.new(-u.speed.X, u.speed.Y, u.speed.Z) 
		end
		if math.abs(u.base.Position.Z) > MAP_SIZE/2 then 
			u.speed = Vector3.new(u.speed.X, u.speed.Y, -u.speed.Z) 
		end
	end
	
	-- Rotate black hole accretion disk
	accretionDisk.CFrame = blackHole.CFrame * CFrame.Angles(math.pi/2, tick() * 0.1, 0)
	
	-- Rotate black hole
	blackHole.CFrame = CFrame.new(blackHole.Position) * CFrame.Angles(0, tick() * 0.2, 0)
end)