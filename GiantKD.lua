local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local TextChatService = game:GetService("TextChatService")
local plr = Players.LocalPlayer
local playerGui = plr:WaitForChild("PlayerGui")

loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/DevTools/refs/heads/main/Tag.lua"))()

local Wait = task.wait

local function Send(message)
    TextChatService.TextChannels.RBXGeneral:SendAsync(message)
end

function notify(title, text, duration)
    StarterGui:SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = duration or 5
    })
end

-- Main UI
local gui = Instance.new("ScreenGui")
gui.ResetOnSpawn = false
gui.Parent = playerGui

-- Minimizer button
local minimizer = Instance.new("TextButton")
minimizer.Size = UDim2.new(0, 100, 0, 30)
minimizer.Position = UDim2.new(0.5, -50, 0, 10)
minimizer.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
minimizer.Font = Enum.Font.GothamBold
minimizer.TextSize = 16
minimizer.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizer.Text = "Enable"
minimizer.Parent = gui
Instance.new("UICorner", minimizer).CornerRadius = UDim.new(0, 10)

-- Popup UI
local popup = Instance.new("Frame")
popup.Size = UDim2.new(0, 350, 0, 250)
popup.Position = UDim2.new(0.5, -175, 0.5, -125)
popup.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
popup.Visible = false
popup.Parent = gui

local corner = Instance.new("UICorner", popup)
corner.CornerRadius = UDim.new(0, 40)

-- Title with Arcade font
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 40)
titleLabel.Position = UDim2.new(0, 0, 0, 20)
titleLabel.BackgroundTransparency = 1
titleLabel.Font = Enum.Font.Arcade
titleLabel.TextSize = 24
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Text = "Giant Krystal Dance"
titleLabel.Parent = popup

-- Description
local descLabel = Instance.new("TextLabel")
descLabel.Size = UDim2.new(1, -20, 0, 60)
descLabel.Position = UDim2.new(0, 10, 0, 60)
descLabel.BackgroundTransparency = 1
descLabel.Font = Enum.Font.Gotham
descLabel.TextSize = 16
descLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
descLabel.TextWrapped = true
descLabel.Text = "I do not own Krystal Dance V3 credits goes to the owners."
descLabel.Parent = popup

-- Reanimate button
local reanimateBtn = Instance.new("TextButton")
reanimateBtn.Size = UDim2.new(0.45, 0, 0, 35)
reanimateBtn.Position = UDim2.new(0.05, 0, 0.7, 0)
reanimateBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
reanimateBtn.Font = Enum.Font.GothamBold
reanimateBtn.TextSize = 18
reanimateBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
reanimateBtn.Text = "Reanimate"
reanimateBtn.Parent = popup
Instance.new("UICorner", reanimateBtn).CornerRadius = UDim.new(0, 20)

-- Credits button
local creditsBtn = Instance.new("TextButton")
creditsBtn.Size = UDim2.new(0.45, 0, 0, 35)
creditsBtn.Position = UDim2.new(0.5, 0, 0.7, 0)
creditsBtn.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
creditsBtn.Font = Enum.Font.GothamBold
creditsBtn.TextSize = 16
creditsBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
creditsBtn.Text = "Credits"
creditsBtn.Parent = popup
Instance.new("UICorner", creditsBtn).CornerRadius = UDim.new(0, 20)

-- Footer with Sarpanch font
local footerLabel = Instance.new("TextLabel")
footerLabel.Size = UDim2.new(1, 0, 0, 20)
footerLabel.Position = UDim2.new(0, 0, 0.9, 0)
footerLabel.BackgroundTransparency = 1
footerLabel.Font = Enum.Font.Sarpanch
footerLabel.TextSize = 14
footerLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
footerLabel.Text = "Made by PlasmaByte"
footerLabel.Parent = popup

-- UI state
local uiEnabled = false

-- Toggle UI function
local function toggleUI()
    uiEnabled = not uiEnabled
    
    if uiEnabled then
        minimizer.Text = "Disable"
        popup.Visible = true
        TweenService:Create(popup, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 350, 0, 250)
        }):Play()
    else
        minimizer.Text = "Enable"
        local tween = TweenService:Create(popup, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 0, 0, 0)
        })
        tween:Play()
        tween.Completed:Connect(function()
            popup.Visible = false
        end)
    end
end

-- Minimizer button click
minimizer.MouseButton1Click:Connect(toggleUI)

-- Close popup function
local function closePopup()
    local tween = TweenService:Create(popup, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
        Size = UDim2.new(0, 0, 0, 0)
    })
    tween:Play()
    tween.Completed:Wait()
    popup.Visible = false
    uiEnabled = false
    minimizer.Text = "Enable"
end

-- Reanimate button click
reanimateBtn.MouseButton1Click:Connect(function()
    closePopup()
    Send("-gh 6202063049,4602533885,4602533885,4602533885,4602533885,4602533885,4602533885,4602533885,4602533885,4602533885,4602533885,4602533885,4602533885,4602533885")
    Wait(3)
    local reps = "4602533885,"
    local repped = reps:rep(13)
    local base = "-gh 6202063049,"
    repped = repped:sub(1,-2)
    local done = base .. repped
    if setclipboard then
        setclipboard(done)
    else
        print(done)
    end
    repeat Wait() until plr.Character:FindFirstChild("Smile")
    Wait(.8)
    local char = plr.Character
    local cons = {}
    local ti = table.insert
    local rs = RunService
    local stepped = rs.Stepped
    local heartbeat = rs.Heartbeat
    local oldpos = char.HumanoidRootPart.CFrame
    char.HumanoidRootPart.CFrame = oldpos + Vector3.new(0,10000,0)
    Wait(.3)
    local reanimstorage = Instance.new("Folder",char)
    reanimstorage.Name = "ReanimStorage"
    local reanim = game:GetObjects("rbxassetid://9678834251")[1]
    reanim.Humanoid.CameraOffset = Vector3.new(0,9.5,0)
    reanim.Name = "Reanim"
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
            if v.Handle:FindFirstChild("SpecialMesh") then
                v.Handle.SpecialMesh:Destroy()
            end
        elseif v:IsA("Accessory") and v.Handle.Size ~= Vector3.new(6,6,6) and v.Name ~= "Smile" then
            v.Handle:BreakJoints()
            v:Destroy()
        end
    end
    align(char["HumanoidRootPart"], reanim["Head"], Vector3.new(0,0.5,0))
    for i,v in pairs(bighats) do
        v.Name = "bighat " .. tostring(i)
        v.Handle:BreakJoints()
    end
    smile.Handle:BreakJoints()
    align(bighats[1].Handle, reanim["Head"])
    align(smile.Handle, reanim["Head"], Vector3.new(0,0,-3.01), Vector3.new(0,90,0))
    align(bighats[2].Handle, reanim["Torso"], Vector3.new(-3,3,0))
    align(bighats[3].Handle, reanim["Torso"], Vector3.new(3,3,0))
    align(bighats[4].Handle, reanim["Torso"], Vector3.new(-3,-3,0))
    align(bighats[5].Handle, reanim["Torso"], Vector3.new(3,-3,0))
    align(bighats[6].Handle, reanim["Right Arm"], Vector3.new(0,3,0))
    align(bighats[7].Handle, reanim["Right Arm"], Vector3.new(0,-3,0))
    align(bighats[8].Handle, reanim["Left Arm"], Vector3.new(0,3,0))
    align(bighats[9].Handle, reanim["Left Arm"], Vector3.new(0,-3,0))
    align(bighats[10].Handle, reanim["Right Leg"], Vector3.new(0,3,0))
    align(bighats[11].Handle, reanim["Right Leg"], Vector3.new(0,-3,0))
    align(bighats[12].Handle, reanim["Left Leg"], Vector3.new(0,3,0))
    align(bighats[13].Handle, reanim["Left Leg"], Vector3.new(0,-3,0))
    workspace.CurrentCamera.CameraSubject = reanim.Humanoid
    plr.Character = reanim
    anim.Disabled = true
    anim.Disabled = false
    Wait(.3)
    plr.Character.HumanoidRootPart.CFrame = oldpos + Vector3.new(0,6,0)
    for i,v in pairs(bighats) do
        v.Handle.CFrame = plr.Character.HumanoidRootPart.CFrame
    end
    smile.Handle.CFrame = plr.Character.HumanoidRootPart.CFrame
    Send("-net")
    local reset = Instance.new("BindableEvent")
    ti(cons, reset.Event:Connect(function()
        reanim:Destroy()
        plr.Character = nil
        plr.Character = char
        plr.Character.Humanoid.Health = 0
        for i,v in pairs(cons) do
            v:Disconnect()
        end
        StarterGui:SetCore("ResetButtonCallback", true)
        reset:Destroy()
        notify("Resetting","Please wait " .. tostring(Players.RespawnTime) .. " seconds", Players.RespawnTime)
    end))
    StarterGui:SetCore("ResetButtonCallback", reset)
    Wait(5)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/KDV3-Fixed/refs/heads/main/KrystalDance3"))()
end)

-- Credits button click
creditsBtn.MouseButton1Click:Connect(function()
    closePopup()
    notify("Krystal Dance V3", "Made by NITRO-GT")
    Wait(0.95)
    notify("Krystal Dance V3", "Fixed by MrY7zz")
    Wait(0.95)
    notify("Krystal Dance V3", "Modded by PlasmaByte")
    Wait(0.95)
    notify("Krystal Dance V3", "Credits goes to them!!")
    Wait(0.95)
end)

Wait(1)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/DevTools/refs/heads/main/Keyboards"))()
notify("Giant Krystal Dance", "Please, choose a keyboard,")
Wait(0.95)
notify("Giant Krystal Dance", "becuz without one you")
Wait(0.95)
notify("Giant Krystal Dance", "wouldn't be able to use this")
Wait(0.95)
setclipboard("https://www.roblox.com/games/88308889239232/Green-baseplate")
notify("Giant Krystal Dance", "Supported game link copied."
Wait(0.95)
notify("Supported executors:", "Krnl, Delta, rest untested :P")