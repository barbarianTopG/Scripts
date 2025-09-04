local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local TextChatService = game:GetService("TextChatService")
local plr = Players.LocalPlayer
local playerGui = plr:WaitForChild("PlayerGui")

loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/ScriptLoader/refs/heads/main/Tag.lua"))()

function notify(title,text,duration)
 StarterGui:SetCore("SendNotification",{Title=title,Text=text,Duration=duration or 5})
end

local gui = Instance.new("ScreenGui")
gui.ResetOnSpawn=false
gui.Parent=playerGui

local popup = Instance.new("Frame")
popup.Size=UDim2.new(0,350,0,200)
popup.Position=UDim2.new(0,-400,0.5,-100)
popup.BackgroundColor3=Color3.fromRGB(25,25,25)
popup.Parent=gui

local corner = Instance.new("UICorner",popup)
corner.CornerRadius=UDim.new(0,40)

local titleLabel=Instance.new("TextLabel")
titleLabel.Size=UDim2.new(1,0,0,40)
titleLabel.Position=UDim2.new(0,0,0,10)
titleLabel.BackgroundTransparency=1
titleLabel.Font=Enum.Font.GothamBold
titleLabel.TextSize=22
titleLabel.TextColor3=Color3.fromRGB(255,255,255)
titleLabel.Text="WASSUP VRO!"
titleLabel.Parent=popup

local descLabel=Instance.new("TextLabel")
descLabel.Size=UDim2.new(1,-20,0,60)
descLabel.Position=UDim2.new(0,10,0,50)
descLabel.BackgroundTransparency=1
descLabel.Font=Enum.Font.Gotham
descLabel.TextSize=16
descLabel.TextColor3=Color3.fromRGB(200,200,200)
descLabel.TextWrapped=true
descLabel.Text="After a long time, Giant Krystal Dance is working again! As Always creds to the respective owners of the scripts (Kdv3, Just Grass Giant)"
descLabel.Parent=popup

local executeBtn=Instance.new("TextButton")
executeBtn.Size=UDim2.new(0.45,0,0,35)
executeBtn.Position=UDim2.new(0.05,0,0.7,0)
executeBtn.BackgroundColor3=Color3.fromRGB(0,170,255)
executeBtn.Font=Enum.Font.GothamBold
executeBtn.TextSize=18
executeBtn.TextColor3=Color3.fromRGB(255,255,255)
executeBtn.Text="Execute"
executeBtn.Parent=popup
Instance.new("UICorner",executeBtn).CornerRadius=UDim.new(0,20)

local noBtn=Instance.new("TextButton")
noBtn.Size=UDim2.new(0.45,0,0,35)
noBtn.Position=UDim2.new(0.5,0,0.7,0)
noBtn.BackgroundColor3=Color3.fromRGB(170,0,0)
noBtn.Font=Enum.Font.GothamBold
noBtn.TextSize=16
noBtn.TextColor3=Color3.fromRGB(255,255,255)
noBtn.Text="NO ONE CAREZ!"
noBtn.Parent=popup
Instance.new("UICorner",noBtn).CornerRadius=UDim.new(0,20)

TweenService:Create(popup,TweenInfo.new(0.6,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Position=UDim2.new(0,20,0.5,-100)}):Play()

local function closePopup()
 local tw=TweenService:Create(popup,TweenInfo.new(0.5,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{Position=UDim2.new(0,-400,0.5,-100)})
 tw:Play()
 tw.Completed:Wait()
 popup:Destroy()
end

executeBtn.MouseButton1Click:Connect(function()
 closePopup()

 notify("Hey!","Giant Krystal Dance is back BABYYYY!!",3)

game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 6202063049,4602533885,4602533885,4602533885,4602533885,4602533885,4602533885,4602533885,4602533885,4602533885,4602533885,4602533885,4602533885,4602533885")
task.wait(3)

local reps = "4602533885,"

local repped = reps:rep(13)

local base = "-gh 6202063049,"

repped = repped:sub(1,-2)

local done = base .. repped

--game.Players:Chat(done) -- get hats needed
if setclipboard then setclipboard(done) else print(done) end
repeat wait() until game.Players.LocalPlayer.Character:FindFirstChild("Smile")
wait(.8)
local plr = game.Players.LocalPlayer
local char = plr.Character
local cons = {}
local ti = table.insert
local rs = game:GetService("RunService")
local stepped = rs.Stepped
local heartbeat = rs.Heartbeat

local oldpos = char.HumanoidRootPart.CFrame
char.HumanoidRootPart.CFrame = oldpos + Vector3.new(0,10000,0)
wait(.3)
local function notify(title,text,duration)
    game.StarterGui:SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = duration or 5;
    })
end


local reanimstorage = Instance.new("Folder",char)
reanimstorage.Name="ReanimStorage"

local reanim = game:GetObjects("rbxassetid://9678834251")[1]
reanim.Humanoid.CameraOffset = Vector3.new(0,9.5,0)
reanim.Name="Reanim"


local anim = char.Animate
anim.Parent = reanim

for i,v in pairs(reanim:GetDescendants()) do
    if v:IsA("BasePart") or v:IsA("Decal") then
        v.Transparency = 1 
    end 
    if v:IsA("ParticleEmitter") then
        v.Enabled = false
    end
end

reanim.Parent = reanimstorage
reanim.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame * CFrame.new(0,5,0)

-- netless/align by MyWorld, ty cutie <3
local netless_Y = Vector3.new(0, 30, 0)
local v3_101 = Vector3.new(1, 0, 1)
local inf = math.huge
local v3_0 = Vector3.new(0,0,0)
local function getNetlessVelocity(realPartVelocity)
    if (realPartVelocity.Y > 1) or (realPartVelocity.Y < -1) then
        return realPartVelocity * (25.1 / realPartVelocity.Y)
    end
    realPartVelocity = realPartVelocity * v3_101
    local mag = realPartVelocity.Magnitude
    if mag > 1 then
        realPartVelocity = realPartVelocity * 100 / mag
    end
    return realPartVelocity + netless_Y
end

local function align(Part0, Part1, p, r)
	Part0.CustomPhysicalProperties = PhysicalProperties.new(0.0001, 0.0001, 0.0001, 0.0001, 0.0001)
    Part0.CFrame = Part1.CFrame
	local att0 = Instance.new("Attachment", Part0)
	att0.Orientation = r or v3_0
	att0.Position = v3_0
	att0.Name = "att0_" .. Part0.Name
	local att1 = Instance.new("Attachment", Part1)
	att1.Orientation = v3_0 
	att1.Position = p or v3_0
	att1.Name = "att1_" .. Part1.Name

	local ape = Instance.new("AlignPosition", att0)
	ape.ApplyAtCenterOfMass = false
	ape.MaxForce = inf
	ape.MaxVelocity = inf
	ape.ReactionForceEnabled = false
	ape.Responsiveness = 200
	ape.Attachment1 = att1
	ape.Attachment0 = att0
	ape.Name = "AlignPositionRtrue"
	ape.RigidityEnabled = true

	local apd = Instance.new("AlignPosition", att0)
	apd.ApplyAtCenterOfMass = false
	apd.MaxForce = inf
	apd.MaxVelocity = inf
	apd.ReactionForceEnabled = false
	apd.Responsiveness = 200
	apd.Attachment1 = att1
	apd.Attachment0 = att0
	apd.Name = "AlignPositionRfalse"
	apd.RigidityEnabled = false

	local ao = Instance.new("AlignOrientation", att0)
	ao.MaxAngularVelocity = inf
	ao.MaxTorque = inf
	ao.PrimaryAxisOnly = false
	ao.ReactionTorqueEnabled = false
	ao.Responsiveness = 200
	ao.Attachment1 = att1
	ao.Attachment0 = att0
	ao.RigidityEnabled = false
    
	if type(getNetlessVelocity) == "function" then
	    local realVelocity = Vector3.new(0,30,0)
        local steppedcon = stepped:Connect(function()
            Part0.Velocity = realVelocity
        end)
        local heartbeatcon = heartbeat:Connect(function()
            realVelocity = Part0.Velocity
            Part0.Velocity = getNetlessVelocity(realVelocity)
        end)
        Part0.Destroying:Connect(function()
            Part0 = nil
            steppedcon:Disconnect()
            heartbeatcon:Disconnect()
        end)
        ti(cons,steppedcon)
        ti(cons,heartbeatcon)
	end
	
    att0.Orientation = r or v3_0
	att0.Position = v3_0
	att1.Orientation = v3_0 
	att1.Position = p or v3_0
	Part0.CFrame = Part1.CFrame
end

for _,part in next, char:GetDescendants() do
    if part:IsA("BasePart") then
        ti(cons,stepped:Connect(function()
            part.CanCollide = false
        end))
    end
end

local bighats = {}
local smile = char:FindFirstChild("Smile")
for i,v in pairs(char:GetChildren()) do
    if v:IsA("BasePart") and (v.Name:find("Arm") or v.Name:find("Leg")) then
        v:Destroy()
    end
    if v:IsA("Accessory") and v.Handle.Size == Vector3.new(6,6,6) then
        table.insert(bighats,v)
        v.Handle.SpecialMesh:Destroy()
    elseif v:IsA("Accessory") and v.Handle.Size ~= Vector3.new(6,6,6) and v.Name ~= "Smile" then
        v.Handle:BreakJoints()
        v:Destroy()
    end
end

align(char["HumanoidRootPart"],reanim["Head"],Vector3.new(0,0.5,0))

for i,v in pairs(bighats) do
    v.Name = "bighat " .. tostring(i)
    v.Handle:BreakJoints()
end
smile.Handle:BreakJoints()

align(bighats[1].Handle,reanim["Head"])
align(smile.Handle,reanim["Head"],Vector3.new(0,0,-3.01),Vector3.new(0,90,0))

align(bighats[2].Handle,reanim["Torso"],Vector3.new(-3,3,0))
align(bighats[3].Handle,reanim["Torso"],Vector3.new(3,3,0))
align(bighats[4].Handle,reanim["Torso"],Vector3.new(-3,-3,0))
align(bighats[5].Handle,reanim["Torso"],Vector3.new(3,-3,0))

align(bighats[6].Handle,reanim["Right Arm"],Vector3.new(0,3,0))
align(bighats[7].Handle,reanim["Right Arm"],Vector3.new(0,-3,0))

align(bighats[8].Handle,reanim["Left Arm"],Vector3.new(0,3,0))
align(bighats[9].Handle,reanim["Left Arm"],Vector3.new(0,-3,0))

align(bighats[10].Handle,reanim["Right Leg"],Vector3.new(0,3,0))
align(bighats[11].Handle,reanim["Right Leg"],Vector3.new(0,-3,0))

align(bighats[12].Handle,reanim["Left Leg"],Vector3.new(0,3,0))
align(bighats[13].Handle,reanim["Left Leg"],Vector3.new(0,-3,0))

workspace.CurrentCamera.CameraSubject = reanim.Humanoid
plr.Character = reanim

anim.Disabled = true
anim.Disabled = false
wait(.3)
plr.Character.HumanoidRootPart.CFrame = oldpos + Vector3.new(0,6,0)

for i,v in pairs(bighats) do
    v.Handle.CFrame = plr.Character.HumanoidRootPart.CFrame
end
smile.Handle.CFrame = plr.Character.HumanoidRootPart.CFrame 

game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")


local reset = Instance.new("BindableEvent")
ti(cons,reset.Event:Connect(function()
    reanim:Destroy()
    plr.Character = nil
    plr.Character = char
    plr.Character.Humanoid.Health = 0
    for i,v in pairs(cons) do
        v:Disconnect()
    end
    game:GetService("StarterGui"):SetCore("ResetButtonCallback", true)
    reset:Remove()
    notify("Resetting","Please wait " .. tostring(game.Players.RespawnTime) .. " seconds",game.Players.RespawnTime)
end))

game:GetService("StarterGui"):SetCore("ResetButtonCallback", reset)

task.wait(5)
 loadstring(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/KDV3-Fixed/refs/heads/main/KrystalDance3"))()
end)

task.wait(1)

loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/MyScripts/refs/heads/main/SelectKeyboard.lua"))()

noBtn.MouseButton1Click:Connect(function()
 closePopup()
 task.wait(0.5)
 plr:Kick("GET OUT!!!")
end)
