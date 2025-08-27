local Vector3_101 = Vector3.new(1, 0, 1)
local netless_Y = Vector3.new(0, 25.1, 0)
local function getNetlessVelocity(realPartVelocity)
    local netlessVelocity = realPartVelocity * Vector3_101
    local mag = netlessVelocity.Magnitude
    if mag > 0.1 then
        netlessVelocity *= 100 / mag
    end
    netlessVelocity += netless_Y
    return netlessVelocity
end

local lp = game:GetService("Players").LocalPlayer
local rs = game:GetService("RunService")
local stepped = rs.Stepped
local heartbeat = rs.Heartbeat
local renderstepped = rs.RenderStepped
local sg = game:GetService("StarterGui")
local ws = game:GetService("Workspace")
local cf = CFrame.new
local v3 = Vector3.new
local v3_0 = v3(0, 0, 0)
local inf = math.huge

local c = lp.Character
if not (c and c.Parent) then return end
c.Destroying:Connect(function() c = nil end)

local function gp(parent, name, className)
    if typeof(parent) == "Instance" then
        for _, v in pairs(parent:GetChildren()) do
            if (v.Name == name) and v:IsA(className) then
                return v
            end
        end
    end
    return nil
end

local function align(Part0, Part1)
    Part0.CustomPhysicalProperties = PhysicalProperties.new(0.0001,0.0001,0.0001,0.0001,0.0001)
    local att0 = Instance.new("Attachment", Part0)
    local att1 = Instance.new("Attachment", Part1)
    local ape = Instance.new("AlignPosition", att0)
    ape.MaxForce = inf
    ape.MaxVelocity = inf
    ape.Responsiveness = 200
    ape.Attachment0 = att0
    ape.Attachment1 = att1
    ape.RigidityEnabled = true
    local apd = Instance.new("AlignPosition", att0)
    apd.MaxForce = inf
    apd.MaxVelocity = inf
    apd.Responsiveness = 200
    apd.Attachment0 = att0
    apd.Attachment1 = att1
    apd.RigidityEnabled = false
    local ao = Instance.new("AlignOrientation", att0)
    ao.MaxAngularVelocity = inf
    ao.MaxTorque = inf
    ao.Responsiveness = 200
    ao.Attachment0 = att0
    ao.Attachment1 = att1
    if type(getNetlessVelocity) == "function" then
        local realVelocity = v3_0
        local steppedcon = stepped:Connect(function() Part0.Velocity = realVelocity end)
        local heartbeatcon = heartbeat:Connect(function()
            realVelocity = Part0.Velocity
            Part0.Velocity = getNetlessVelocity(realVelocity)
        end)
        Part0.Destroying:Connect(function()
            Part0=nil
            steppedcon:Disconnect()
            heartbeatcon:Disconnect()
        end)
    end
end

for _, v in pairs(c:GetChildren()) do
    if v:IsA("LocalScript") then
        v.Disabled = true
    end
end

local hum = c:FindFirstChildOfClass("Humanoid")
if hum then
    for _, v in pairs(hum:GetPlayingAnimationTracks()) do
        v:Stop()
    end
end

local OLDscripts = {}
for _, v in pairs(c:GetDescendants()) do
    if v.ClassName == "Script" then
        table.insert(OLDscripts, v)
    end
end

local scriptNames = {}
for i, v in pairs(c:GetDescendants()) do
    if v:IsA("BasePart") then
        local newName = tostring(i)
        local exists = true
        while exists do
            exists = false
            for _, v in pairs(OLDscripts) do
                if v.Name == newName then
                    exists = true
                end
            end
            if exists then
                newName = newName .. "_"
            end
        end
        table.insert(scriptNames, newName)
        Instance.new("Script", v).Name = newName
    end
end

c.Archivable = true
local cl = c:Clone()
for _, v in pairs(cl:GetDescendants()) do
    if v:IsA("BasePart") then
        v.Transparency = 1
        v.Anchored = false
    end
end

local model = Instance.new("Model", c)
for _, v in pairs(c:GetChildren()) do
    if v ~= model then
        v.Parent = model
    end
end
local head = gp(model,"Head","BasePart")
local torso = gp(model,"Torso","BasePart")
if head and torso then
    for _, v in pairs(model:GetDescendants()) do
        if v:IsA("Weld") or v:IsA("Motor6D") then
            v:Destroy()
        end
    end
end
model:BreakJoints()

cl.Parent = c
for _, v in pairs(cl:GetChildren()) do v.Parent = c end
cl:Destroy()

for _, scr in pairs(model:GetDescendants()) do
    if (scr.ClassName == "Script") and table.find(scriptNames,scr.Name) then
        local Part0 = scr.Parent
        if Part0:IsA("BasePart") then
            for _, scr1 in pairs(c:GetDescendants()) do
                if (scr1.ClassName=="Script") and (scr1.Name==scr.Name) and (not scr1:IsDescendantOf(model)) then
                    local Part1 = scr1.Parent
                    if Part1.ClassName==Part0.ClassName and Part1.Name==Part0.Name then
                        align(Part0,Part1)
                        break
                    end
                end
            end
        end
    end
end

for _, v in pairs(c:GetDescendants()) do
    if v and v.Parent then
        if v.ClassName=="Script" and table.find(scriptNames,v.Name) then
            v:Destroy()
        elseif not v:IsDescendantOf(model) then
            if v:IsA("Decal") then v.Transparency=1
            elseif v:IsA("ForceField") then v.Visible=false
            elseif v:IsA("Sound") then v.Playing=false
            elseif v:IsA("BillboardGui") or v:IsA("SurfaceGui") or v:IsA("ParticleEmitter") then
                v.Enabled=false
            end
        end
    end
end

local hum0 = model:FindFirstChildOfClass("Humanoid")
if hum0 then hum0.Destroying:Connect(function() hum0=nil end) end
local hum1 = c:FindFirstChildOfClass("Humanoid")
if hum1 then
    ws.CurrentCamera.CameraSubject = hum1
    local camSubCon
    camSubCon = renderstepped:Connect(function() camSubCon:Disconnect() if c and hum1 then ws.CurrentCamera.CameraSubject=hum1 end end)
end

task.wait(8)

loadstring(game:HttpGet("https://pastebin.com/raw/XJeBNe0s"))()
local LocalPlayer = game.Players.LocalPlayer

local function getGlove()
	for _,v in pairs(LocalPlayer.Backpack:GetChildren()) do
		if v:IsA("Tool") and v:FindFirstChild("Event") then
			return v, v.Event
		end
	end
	if LocalPlayer.Character then
		for _,v in pairs(LocalPlayer.Character:GetChildren()) do
			if v:IsA("Tool") and v:FindFirstChild("Event") then
				return v, v.Event
			end
		end
	end
end

local function KillTarget(targetPlr)
	if targetPlr and targetPlr.Character then
		local hum = targetPlr.Character:FindFirstChildOfClass("Humanoid")
		if hum then
			spawn(function()
				for i=1,10 do
					hum.Health = hum.Health - (hum.MaxHealth/10)
					task.wait(0.1)
				end
				hum.Health = hum.MaxHealth
			end)
		end
	end
end

function MagnitudeDamage(Part, Magnitude, MinimumDamage, MaximumDamage, KnockBack, Type, HitSound, HitPitch)
	for _, c in pairs(workspace:GetChildren()) do
		local hum = c:FindFirstChildOfClass("Humanoid")
		local plr = game.Players:GetPlayerFromCharacter(c)
		if hum and plr and plr ~= LocalPlayer then
			local head = c:FindFirstChild("Torso") or c:FindFirstChild("HumanoidRootPart")
			if head and (head.Position - Part.Position).magnitude <= Magnitude then
				KillTarget(plr)
			end
		end
	end
end