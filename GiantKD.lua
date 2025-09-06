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
        Duration = duration or 3
    })
end

-- Color scheme
local colorScheme = {
    primary = Color3.fromRGB(75, 0, 130),    -- Purple
    secondary = Color3.fromRGB(148, 0, 211), -- Dark Violet
    accent = Color3.fromRGB(123, 104, 238),  -- Medium Slate Blue
    danger = Color3.fromRGB(220, 20, 60),    -- Crimson
    success = Color3.fromRGB(0, 200, 83),    -- Emerald Green
    background = Color3.fromRGB(30, 30, 40), -- Dark Blue-Gray
    text = Color3.fromRGB(240, 240, 240),    -- Almost White
    subtext = Color3.fromRGB(180, 180, 190)  -- Light Gray
}

local gui = Instance.new("ScreenGui")
gui.ResetOnSpawn = false
gui.Parent = playerGui

-- Create minimizer button with squircle shape
local minimizer = Instance.new("TextButton")
minimizer.Size = UDim2.new(0, 100, 0, 40)
minimizer.Position = UDim2.new(0, 10, 0, 10) -- Moved to left side
minimizer.BackgroundColor3 = colorScheme.primary
minimizer.Font = Enum.Font.Arcade
minimizer.TextSize = 16
minimizer.TextColor3 = colorScheme.text
minimizer.Text = "Enable"
minimizer.Parent = gui
minimizer.ZIndex = 10

-- Create squircle shape for minimizer
local corner = Instance.new("UICorner", minimizer)
corner.CornerRadius = UDim.new(0, 20)

-- Create background shape layer for outline effect
local minimizerBg = Instance.new("Frame")
minimizerBg.Size = UDim2.new(1, 6, 1, 6)
minimizerBg.Position = UDim2.new(0, -3, 0, -3)
minimizerBg.BackgroundColor3 = colorScheme.accent
minimizerBg.ZIndex = 9
minimizerBg.Parent = minimizer

local cornerBg = Instance.new("UICorner", minimizerBg)
cornerBg.CornerRadius = UDim.new(0, 23)

local popup = Instance.new("Frame")
popup.Size = UDim2.new(0, 350, 0, 300) -- Increased height for the stop button
popup.Position = UDim2.new(0.5, -175, 0.5, -150)
popup.BackgroundColor3 = colorScheme.background
popup.Visible = false
popup.Parent = gui

local corner = Instance.new("UICorner", popup)
corner.CornerRadius = UDim.new(0, 40)

-- Add a subtle gradient
local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, colorScheme.background),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 25, 35))
}
gradient.Rotation = 90
gradient.Parent = popup

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 40)
titleLabel.Position = UDim2.new(0, 0, 0, 20)
titleLabel.BackgroundTransparency = 1
titleLabel.Font = Enum.Font.Arcade
titleLabel.TextSize = 24
titleLabel.TextColor3 = colorScheme.text
titleLabel.Text = "Giant Krystal Dance"
titleLabel.Parent = popup

local descLabel = Instance.new("TextLabel")
descLabel.Size = UDim2.new(1, -20, 0, 60)
descLabel.Position = UDim2.new(0, 10, 0, 60)
descLabel.BackgroundTransparency = 1
descLabel.Font = Enum.Font.Gotham
descLabel.TextSize = 16
descLabel.TextColor3 = colorScheme.subtext
descLabel.TextWrapped = true
descLabel.Text = "I do not own Krystal Dance V3, press credits to see the credits."
descLabel.Parent = popup

-- Create button template function
local function createButton(name, text, color, position)
    local buttonContainer = Instance.new("Frame")
    buttonContainer.Size = UDim2.new(0.45, 0, 0, 40)
    buttonContainer.Position = position
    buttonContainer.BackgroundTransparency = 1
    buttonContainer.Parent = popup
    
    -- Background shape layer
    local buttonBg = Instance.new("Frame")
    buttonBg.Size = UDim2.new(1, 6, 1, 6)
    buttonBg.Position = UDim2.new(0, -3, 0, -3)
    buttonBg.BackgroundColor3 = color
    buttonBg.ZIndex = 1
    buttonBg.Parent = buttonContainer
    
    local cornerBg = Instance.new("UICorner", buttonBg)
    cornerBg.CornerRadius = UDim.new(0, 15)
    
    -- Main button
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 1, 0)
    button.BackgroundColor3 = color
    button.Font = Enum.Font.Arcade
    button.TextSize = 16
    button.TextColor3 = colorScheme.text
    button.Text = text
    button.Name = name
    button.ZIndex = 2
    button.Parent = buttonContainer
    
    local corner = Instance.new("UICorner", button)
    corner.CornerRadius = UDim.new(0, 12)
    
    return button
end

-- Create buttons using template
local reanimateBtn = createButton("ReanimateBtn", "Reanimate", colorScheme.success, UDim2.new(0.05, 0, 0.6, 0))
local creditsBtn = createButton("CreditsBtn", "Click me!", colorScheme.accent, UDim2.new(0.5, 0, 0.6, 0))
local stopBtn = createButton("StopBtn", "Stop Script", colorScheme.danger, UDim2.new(0.05, 0, 0.75, 0))
stopBtn.Parent.Size = UDim2.new(0.9, 0, 0, 40) 

local footerLabel = Instance.new("TextLabel")
footerLabel.Size = UDim2.new(1, 0, 0, 20)
footerLabel.Position = UDim2.new(0, 0, 0.9, 0)
footerLabel.BackgroundTransparency = 1
footerLabel.Font = Enum.Font.Sarpanch
footerLabel.TextSize = 14
footerLabel.TextColor3 = colorScheme.subtext
footerLabel.Text = "Made by PlasmaByte"
footerLabel.Parent = popup

-- UI state
local uiEnabled = false
local danceScriptActive = false

-- Toggle UI function
local function toggleUI()
    uiEnabled = not uiEnabled
    
    if uiEnabled then
        minimizer.Text = "Disable"
        popup.Visible = true
        TweenService:Create(popup, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 350, 0, 300)
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

-- Function to stop the dance script
local function stopDanceScript()
    if danceScriptActive then
        Send("-rs")
        danceScriptActive = false
        notify("Script Stopped", "Krystal Dance script has been stopped.", 3)
    else
        notify("Info", "No active script to stop.", 3)
    end
end

-- Stop button click
stopBtn.MouseButton1Click:Connect(function()
    closePopup()
    stopDanceScript()
end)

-- Reanimate button click
reanimateBtn.MouseButton1Click:Connect(function()
    danceScriptActive = true
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
    -- Krystal Dance V3, Made by Hemi (es muy janky)
if isfolder and not isfolder('Dances') then
    makefolder('Dances')
end
local char = game:GetService('Players').LocalPlayer.Character
local GetObjects = game.GetObjects
local InsertService = game:GetService('InsertService')

local isfile, writefile, getcustomasset = isfile, writefile, getcustomasset

local function load(name, url)
    local wrap = {}
    if not isfile(name) then
        local full = game:HttpGet(url)
        writefile(name, full)
        local asset = getcustomasset(name)

        local a = InsertService:LoadLocalAsset(asset)
        wrap[1] = a
        return wrap
    else
        local asset = getcustomasset(name)

        local a = InsertService:LoadLocalAsset(asset)
        wrap[1] = a
        return wrap
    end
end

local suc, _ = pcall(function()
    return game:GetObjects('rbxassetid://107495486817639')
end)
if not suc then --// if true then
    GetObjects = function(_, asset)
        if asset == 'rbxassetid://107495486817639' then
            return load(
                'full-DO-NOT-REMOVE-REQUIRED-FOR-KRYSTAL-DANCE-V3.rbxm',
                'https://github.com/AppleMaker35/host-huh/raw/refs/heads/main/full.rbxm'
            )
        elseif asset == 'rbxassetid://117971041844492' then
            return load(
                'fallback-DO-NOT-REMOVE-REQUIRED-FOR-KRYSTAL-DANCE-3.rbxm',
                'https://github.com/AppleMaker35/host-huh/raw/refs/heads/main/fallback.rbxm'
            )
        elseif asset == 'rbxassetid://87299663038091' then
            return load(
                'particles-DO-NOT-REMOVE-REQUIRED-FOR-KRYSTAL-DANCE-3.rbxm',
                'https://github.com/AppleMaker35/host-huh/raw/refs/heads/main/particle.rbxm'
            )
        end
    end
end

local lol = math.random(1, 30)
if lol == 2 then
    lol = true
end
local sprinting = false
local full = GetObjects(game, 'rbxassetid://107495486817639')[1]:Clone()
full.Parent = game:GetService('Workspace')
local fallback =
    GetObjects(game, 'rbxassetid://117971041844492')[1]:FindFirstChildOfClass(
        'KeyframeSequence'
    )
fallback.Parent = full

--local is = game:GetService("InsertService")
--// userdata propaganda
local is = newproxy(true)
local function loadlocalasset(id)
    local id = tostring(id)
    local id = id:gsub('^rbxassetid://', '')
    local _, asset = pcall(function()
        return full[id]
    end)
    if not _ or not asset then
        asset = fallback
    end

    return asset:Clone()
end
getmetatable(is).__namecall = function(_, id)
    return loadlocalasset(id)
end

local idleanim = is:LoadLocalAsset('rbxassetid://74204337812128') -- uuid. 136078657506707
local walkanim = is:LoadLocalAsset('rbxassetid://73688515498572') -- uuid. 130213485744288
local sprintanim = is:LoadLocalAsset('rbxassetid://73688515498572') -- uuid. 119558526211035
local randompart = Instance.new('Part', game:GetService('RunService'))
local coolparticles =
    game:GetObjects('rbxassetid://87299663038091')[1].ParticleAttachment
coolparticles.Parent = randompart
local playbacktrack = true
local script = Instance.new('LocalScript')
real = true
local timeposcur = 0
pcall(function()
    local OxideApi = loadstring(
        game:HttpGet(
            'https://raw.githubusercontent.com/somethingsimade/Utils/refs/heads/main/OxideApi'
        )
    )()
    OxideApi.Notification('Krystal Dance V3, Made by Hemi, fixed by MrY7zz', 10)
end)
local playanother = false
local playing = false
local dancing = false
local rtrnv
local c
local tbl3
local v
local anim
local count
local hhhh
local asdf
local s
local animid
local plr
local hum = char:FindFirstChildOfClass('Humanoid')
if char:FindFirstChild('Animate') then
    char.Animate.Enabled = false
end
for i, v in pairs(hum:GetPlayingAnimationTracks()) do
    v:Stop()
end
local h = char.Head
local t = char.Torso
local hrp = char.HumanoidRootPart
local cframe
local torso
local rs
local ls
local rh
local lh
local n
local rj
local rsc0
local lsc0
local rhc0
local lhc0
local rjc0
local nc02
local gc0
local orsc0
local olsc0
local orhc0
local olhc0
local orjc0
local onc0
local count2
local maxcount2
local walking = false
local idle = false
local RunService = game:GetService('RunService')

local function getnext(tbl, number)
    local best = math.huge
    local r
    for t in pairs(tbl) do
        local d = t - number
        if d > 0 and d < best then
            best = d
            r = t
        end
    end
    if not r then
        for t in pairs(tbl) do
            if not r or t < r then
                r = t
            end
        end
    end
    return r
end

local function wait2(tim)
    if tim < 0.1 then
        game:GetService('RunService').Heartbeat:Wait()
    else
        for i = 1, tim * 40 do
            game:GetService('RunService').Heartbeat:Wait()
        end
    end
end
local function kftotbl(kf) -- Below this is literal pain..
    tbl3 = {}
    for i, v in pairs(kf:GetDescendants()) do
        if v:IsA('Pose') then
            tbl3[string.sub(v.Name, 1, 1) .. string.sub(
                v.Name,
                #v.Name,
                #v.Name
            )] =
                v.CFrame
        end
    end
    return tbl3
end

local getnamecallmethod = getnamecallmethod
if not getnamecallmethod then
    --[====[

getnamecallmethod.lua
-- Originally © 2024 strawberrys (MIT License)
-- Modified by MrY7zz, 2025 (MIT License)

-- The script creates a function to extract the __namecall method name in Luau

]====]

    local OverlapParams_new, debug_info, _pcall, _xpcall, string_find, string_sub =
        OverlapParams.new, debug.info, pcall, xpcall, string.find, string.sub

    local _, handler = _xpcall(function()
        OverlapParams_new():__namecall()
    end, function()
        return debug_info(2, 'f')
    end)

    function getnamecallmethod()
        local _, r = _pcall(handler)
        local s = string_find(r, ' is not a valid', 1, true)
        return s and string_sub(r, 1, s - 1) or 'AddToFilter'
    end
end
local realsound = Instance.new('Sound', game:GetService('RunService'))
local sound69 = newproxy(true)
getmetatable(sound69).__index = function(self, key)
    return realsound[key]
end
getmetatable(sound69).__newindex = function(self, key, new)
    if new == 'SoundId' then
        realsound:Stop()
        realsound.TimePosition = 0
        realsound[key] = new
        realsound.TimePosition = 0
        return
    end
    realsound[key] = new
    return
end
local namecall = getrawmetatable(realsound).__namecall
getmetatable(sound69).__namecall = function(a, ...)
    if getnamecallmethod() == 'Play' then
        realsound.TimePosition = 0
        realsound:Play()
        realsound.TimePosition = 0
    end
    return namecall(realsound, ...)
end

sound69.Looped = true
sound69.Name = 'danc'
sound69.Playing = true
sound69.Volume = 0.75
local plr = game.Players.LocalPlayer
local RunService = game:GetService('RunService')

local function functionToBind()
    char.Humanoid:Move(Vector3.new(0, 0, -1), false)
end
local script = Instance.new('Script')
ArtificialHB = Instance.new('BindableEvent', script)
ArtificialHB.Name = 'Heartbeat'
script:WaitForChild('Heartbeat')
frame = 1 / 60
tf = 0
allowframeloss = false
tossremainder = false
lastframe = tick()
script.Heartbeat:Fire()
game:GetService('RunService').Heartbeat:Connect(function(s, p)
    tf = tf + s
    if tf >= frame then
        if allowframeloss then
            script.Heartbeat:Fire()
            lastframe = tick()
        else
            for i = 1, math.floor(tf / frame) do
                pcall(function()
                    script.Heartbeat:Fire()
                end)
            end
            lastframe = tick()
        end
        if tossremainder then
            tf = 0
        else
            tf = tf - frame * math.floor(tf / frame)
        end
    end
end)
function swait(num)
    if num == 0 or num == nil then
        ArtificialHB.Event:Wait()
    else
        for i = 0, num do
            ArtificialHB.Event:Wait()
        end
    end
end

function fwait(seconds)
    seconds = (seconds < 0.000001) and 0.000001 or seconds -- absolute limit of roblox, anything below just crashes lol so this limits it so it doesnt crash

    local event = game:GetService('RunService').PreRender
        or game:GetService('RunService').Heartbeat

    local startTime = tick()
    while tick() - startTime < seconds do
        event:Wait()
    end
end
local legitjustran = false
local loopsplaying = 0
local rst
local lst
local rht
local lht
local nt
local rjt
local ReplicatedStorage = game:GetService('ReplicatedStorage')

local function makeanimlibrary() --// yeah sorry im not going to edit and mix at least 1000 lines of modules together under 30 minutes
    local RunService = game:GetService('RunService')

    local __EasingStyles__ = Enum.EasingStyle
    local __EasingDirections__ = Enum.EasingDirection
    local __Enum__PoseEasingStyle__ = #'Enum.PoseEasingStyle.'
    local __Enum__PoseEasingDirection__ = #'Enum.PoseEasingDirection.'

    local function EasingStyleFix(style)
        local name = string.sub(tostring(style), __Enum__PoseEasingStyle__ + 1)
        return (function()
            local suc, res = pcall(function()
                return __EasingStyles__[name]
            end)
            if not suc then
                return Enum.EasingStyle.Linear
            else
                return res
            end
        end)()
    end

    local function EasingDirectionFix(dir)
        local name =
            string.sub(tostring(dir), __Enum__PoseEasingDirection__ + 1)
        return __EasingDirections__[name] or Enum.EasingDirection.In
    end

    local function ConvertToTable(animationInstance)
        assert(
            animationInstance
                and typeof(animationInstance) == 'Instance'
                and animationInstance:IsA('KeyframeSequence'),
            'ConvertToTable requires a KeyframeSequence instance'
        )
        local keyframes = animationInstance:GetKeyframes()
        local sequence = {}
        for i, frame in ipairs(keyframes) do
            local entry = { Time = frame.Time, Data = {} }
            for _, child in ipairs(frame:GetDescendants()) do
                if child:IsA('Pose') and child.Weight > 0 then
                    entry.Data[child.Name] = {
                        CFrame = child.CFrame,
                        EasingStyle = EasingStyleFix(child.EasingStyle),
                        EasingDirection = EasingDirectionFix(
                            child.EasingDirection
                        ),
                        Weight = child.Weight,
                    }
                end
            end
            sequence[i] = entry
        end
        table.sort(sequence, function(a, b)
            return a.Time < b.Time
        end)
        return sequence, animationInstance.Loop
    end

    local function AutoGetMotor6D(model, motorType)
        assert(
            model and typeof(model) == 'Instance' and model:IsA('Model'),
            'AutoGetMotor6D requires a Model instance'
        )
        local useBone = false
        if motorType == 'Bone' then
            useBone = true
        else
            for _, desc in ipairs(model:GetDescendants()) do
                if desc:IsA('Bone') then
                    useBone = true
                    break
                end
            end
        end
        local motors = {}
        if useBone then
            for _, bone in ipairs(model:GetDescendants()) do
                if bone:IsA('Bone') then
                    motors[bone.Name] = bone
                end
            end
        else
            for _, part in ipairs(model:GetDescendants()) do
                if part:IsA('BasePart') then
                    for _, joint in ipairs(part:GetJoints()) do
                        if joint:IsA('Motor6D') and joint.Part1 == part then
                            motors[part.Name] = joint
                            break
                        end
                    end
                end
            end
        end
        return motors
    end

    local cframe_zero = CFrame.new()
    local UpdateEvent = RunService.PreSimulation

    local AnimLibrary = {}
    AnimLibrary.__index = AnimLibrary

    function AnimLibrary.new(target, keyframeSeq, settings, motorType)
        local self = setmetatable({}, AnimLibrary)
        self.Looped = false
        self.TimePosition = 0
        self.IsPlaying = false
        self.Speed = 1
        self.Settings = settings or {}

        if typeof(target) == 'Instance' and target:IsA('Model') then
            self.Motor6D = AutoGetMotor6D(target, motorType)
        else
            self.Motor6D = target
        end

        assert(keyframeSeq, 'Animation keyframe sequence required')
        if typeof(keyframeSeq) == 'Instance' then
            local seq, looped = ConvertToTable(keyframeSeq)
            self.Animation = seq
            self.Looped = looped
        elseif type(keyframeSeq) == 'table' then
            self.Animation = keyframeSeq
        else
            error('Invalid keyframe sequence format')
        end

        self.Length = self.Animation[#self.Animation].Time
        return self
    end

    local function getSurrounding(seq, t)
        local prev, next = seq[1], seq[#seq]
        for i = 1, #seq - 1 do
            if seq[i].Time <= t and seq[i + 1].Time >= t then
                prev, next = seq[i], seq[i + 1]
                break
            end
        end
        return prev, next
    end

    function AnimLibrary:Play()
        if self.IsPlaying then
            return
        end
        self.IsPlaying = true
        if self.TimePosition >= self.Length then
            self.TimePosition = 0
        end

        self._conn = UpdateEvent:Connect(function(delta)
            if not self.IsPlaying then
                return
            end
            local dt = delta * (self.Speed or 1)

            local pos = self.TimePosition + dt

            if pos > self.Length then
                if self.Looped then
                    pos = pos - self.Length
                else
                    pos = self.Length
                    self:Stop()
                    return
                end
            end
            self.TimePosition = pos

            local prev, next = getSurrounding(self.Animation, pos)
            local span = next.Time - prev.Time
            local alpha = span > 0 and (pos - prev.Time) / span or 0
            for joint, prevData in pairs(prev.Data) do
                local nextData = next.Data[joint] or prevData
                local ease = game:GetService('TweenService'):GetValue(
                    alpha,
                    nextData.EasingStyle,
                    nextData.EasingDirection
                )
                local cf1, cf2 = prevData.CFrame, nextData.CFrame
                local cf = cf1:Lerp(cf2, ease)
                local motor = self.Motor6D[joint]
                if motor then
                    motor.Transform = cf
                end
            end
        end)
    end

    function AnimLibrary:Stop()
        self.IsPlaying = false
        if self._conn then
            self._conn:Disconnect()
            self._conn = nil
        end
        for _, motor in pairs(self.Motor6D) do
            motor.Transform = cframe_zero
        end
    end

    AnimLibrary.AutoGetMotor6D = AutoGetMotor6D
    AnimLibrary.KeyFrameSequanceToTable = ConvertToTable
    return AnimLibrary
end

local animplayer = makeanimlibrary()

local currentanim = nil
local iscurrentadance = nil

local rigTable = animplayer.AutoGetMotor6D(char, 'Motor6D')
local function playanim(id, speed, isDance, customInstance)
    speed = speed or 1

    local asset
    if customInstance then
        asset = customInstance
    else
        asset = is:LoadLocalAsset(id)
    end

    if currentanim then
        currentanim:Stop()
    end
    iscurrentadance = isDance

    local keyframeTable = animplayer.KeyFrameSequanceToTable(asset)

    currentanim = animplayer.new(rigTable, asset, nil, nil, 'Motor6D')
    currentanim.Speed = speed
    currentanim.Looped = true
    currentanim:Play()
end

local exploit = getexecutorname and getexecutorname()
    or identifyexecutor and identifyexecutor()
    or 'CurrentAngle Executor'

local function choose()
    local choice = math.random(1, 3)
    if choice == 1 then
        return 'rbxassetid://35930009'
    elseif choice == 2 then
        return 'rbxassetid://1846368080'
    elseif choice == 3 then
        return 'rbxassetid://17422147220'
    end
end

local customasset = function(id)
    if exploit ~= 'CaetSploit' then
        idwithoutthatbit = string.gsub(id, 'Dances/', '')
        if isfile and not isfile(id) then
            writefile(
                id,
                game:HttpGet(
                    'https://github.com/AppleMaker35/music/raw/refs/heads/main/'
                        .. idwithoutthatbit
                )
            )
        end
        repeat
            task.wait()
        until function()
                if not isfile then
                    return true
                end
            end or isfile(id)
    else
        warn('________ _____ ____ _________ __ ___ ______')
    end
    local s = Instance.new('Sound')
    s.Parent = game:GetService('RunService')
    s.SoundId = getcustomasset and getcustomasset(id) or choose()
    task.spawn(function()
        task.wait(1)
        s:Destroy()
    end)
    return s.SoundId
end
local function stopanim()
    if loopsplaying > 0 then
        loopsplaying -= 1
    end
    playanother = true
    playanother = true
    playanother = true
    playanother = true
    sound69.PlaybackSpeed = 1
    if playbacktrack == true then
        if lol ~= true then
            sound69.SoundId = customasset('Dances/myuu.mp3')
        else
            sound69.SoundId = customasset('Dances/emoboy.mp3')
        end
        sound69.Volume = 0.75
    else
        sound69:Stop()
    end
    coolparticles.Parent = randompart
    pcall(function()
        rst:Cancel()
        rht:Cancel()
        lht:Cancel()
        lst:Cancel()
        nt:Cancel()
        rjt:Cancel()
    end)
    if dancing == true then
        sound69.TimePosition = timeposcur
        dancing = false
        idle = true
        char.Humanoid:Move(Vector3.new(0, 0, -1), true)
        walking = false
        wait(0.065)
        if
            walking == true
            and idle == false
            and char.Humanoid.MoveDirection ~= Vector3.new(0, 0, 0)
            and dancing == false
            and playanother == true
        then
            task.spawn(function()
                playanim(74204337812128, 1, false) -- uuid.
            end)
        end
    end
end
local mode = 1

local INPUTLOOP
local uis = game:GetService('UserInputService')
INPUTLOOP = uis.InputBegan:Connect(function(k, chatting)
    if char.Humanoid.Sit == true then
        return
    end
    if chatting then
        return
    end
    local k =
        string.lower(string.gsub(tostring(k.KeyCode), 'Enum.KeyCode.', ''))
    if mode == 1 then
        if k == 'q' then
            if dancing == false then
                stopanim()
                dancing = true
                task.wait(0.005)
                sound69.SoundId = customasset('Dances/rat.mp3')
                timeposcur = sound69.TimePosition
                sound69:Play()
                playanim(117971041844492) -- uuid. 106353328250763
            else
                stopanim()
            end
        elseif k == 'e' then
            if dancing == false then
                stopanim()
                dancing = true
                task.wait(0.005)
                sound69.SoundId = customasset('Dances/boogie.mp3')
                sound69.PlaybackSpeed = 2
                timeposcur = sound69.TimePosition
                sound69:Play()
                playanim(122471664395501) -- uuid. 16769959846
            else
                stopanim()
                sound69.PlaybackSpeed = 1
            end
        elseif k == 'r' then
            if dancing == false then
                stopanim()
                dancing = true
                task.wait(0.005)
                sound69.SoundId = customasset('Dances/valen.mp3')
                sound69.PlaybackSpeed = 1
                timeposcur = sound69.TimePosition
                sound69:Play()
                playanim(100632740547268) -- uuid. 136962185637891
            else
                stopanim()
                sound69.PlaybackSpeed = 1
            end
        elseif k == 't' then
            if dancing == false then
                stopanim()
                dancing = true
                task.wait(0.005)
                sound69.SoundId = customasset('Dances/order.mp3')
                sound69.PlaybackSpeed = 2
                timeposcur = sound69.TimePosition
                sound69:Play()
                playanim(129902601971178) -- uuid. 130968726197789
            else
                stopanim()
                sound69.PlaybackSpeed = 1
            end
        elseif k == 'y' then
            if dancing == false then
                stopanim()
                dancing = true
                task.wait(0.005)
                sound69.SoundId = customasset('Dances/sturdy.mp3')
                sound69.PlaybackSpeed = 1
                timeposcur = sound69.TimePosition
                sound69:Play()
                playanim(132552289751540) -- uuid. 100864643591096
            else
                stopanim()
                sound69.PlaybackSpeed = 1
            end
        elseif k == 'u' then
            if dancing == false then
                stopanim()
                dancing = true
                task.wait(0.005)
                sound69.SoundId = customasset('Dances/caramell.mp3')
                sound69.PlaybackSpeed = 1
                timeposcur = sound69.TimePosition
                sound69:Play()
                playanim(114964447248296) -- uuid. 103597509139287
            else
                stopanim()
                sound69.PlaybackSpeed = 1
            end
        elseif k == 'f' then
            if dancing == false then
                stopanim()
                dancing = true
                task.wait(0.005)
                sound69.SoundId = customasset('Dances/billy.mp3')
                char.Humanoid.WalkSpeed = 4 * char:GetScale()
                timeposcur = sound69.TimePosition
                sound69:Play()
                playanim(18945296583)
            else
                stopanim()
            end
        elseif k == 'g' then
            if dancing == false then
                stopanim()
                dancing = true
                task.wait(0.005)
                sound69.SoundId = customasset('Dances/gangnamm.mp3')
                timeposcur = sound69.TimePosition
                sound69:Play()
                playanim(133530633475679) -- uuid. 12438774071
            else
                stopanim()
            end
        elseif k == 'p' then
            if dancing == false then
                stopanim()
                dancing = true
                task.wait(0.005)
                sound69.SoundId = customasset('Dances/pogo.mp3')
                timeposcur = sound69.TimePosition
                sound69:Play()
                playanim(8829798048, 1.5)
            else
                stopanim()
            end
        elseif k == 'j' then
            if dancing == false then
                stopanim()
                dancing = true
                task.wait(0.005)
                sound69.SoundId = customasset('Dances/dancingin.mp3')
                timeposcur = sound69.TimePosition
                sound69:Play()
                playanim(136139381223407) -- uuid. 96444866125796
            else
                stopanim()
            end
        elseif k == 'k' then
            if dancing == false then
                stopanim()
                dancing = true
                task.wait(0.005)
                sound69.SoundId = customasset('Dances/dr.wav')
                char.Humanoid.WalkSpeed = 4 * char:GetScale()
                timeposcur = sound69.TimePosition
                sound69:Play()
                playanim(110403709064010, 1) -- uuid. 12637912409
            else
                char.Humanoid.WalkSpeed = 14 * char:GetScale()
                stopanim()
            end
        elseif k == 'l' then
            if dancing == false then
                stopanim()
                dancing = true
                task.wait(0.005)
                sound69.SoundId = customasset('Dances/griddy.mp3')
                char.Humanoid.WalkSpeed = 4 * char:GetScale()
                timeposcur = sound69.TimePosition
                sound69:Play()
                playanim(114928062507098) -- uuid. 15704995372
            else
                char.Humanoid.WalkSpeed = 14 * char:GetScale()
                stopanim()
            end
        elseif k == 'z' then
            if dancing == false then
                stopanim()
                dancing = true
                task.wait(0.005)
                sound69.SoundId = customasset('Dances/lux.ogg')
                timeposcur = sound69.TimePosition
                sound69:Play()
                playanim(94534967284996) -- uuid. 15092317950
            else
                stopanim()
            end
        elseif k == 'x' then
            if dancing == false then
                stopanim()
                dancing = true
                task.wait(0.005)
                sound69.SoundId = customasset('Dances/kazot.mp3')
                timeposcur = sound69.TimePosition
                sound69:Play()
                playanim(86634257330162, 1) -- uuid. 114036336168567
            else
                stopanim()
            end
        elseif k == 'h' then
            if dancing == false then
                stopanim()
                dancing = true
                task.wait(0.005)
                sound69.SoundId = 'rbxassetid://1846368080'
                timeposcur = sound69.TimePosition
                sound69:Play()
                playanim(76647570617571, 0.75) -- impossible for now
            else
                stopanim()
            end
        elseif k == 'v' then
            if dancing == false then
                stopanim()
                dancing = true
                task.wait(0.005)
                sound69.SoundId = customasset('Dances/bimbam.mp3')
                timeposcur = sound69.TimePosition
                sound69:Play()
                playanim(115910850138449, 1.25) -- uuid. 16361564081
            else
                stopanim()
            end
        elseif k == 'c' then
            if dancing == false then
                stopanim()
                dancing = true
                task.wait(0.005)
                sound69.SoundId = customasset('Dances/Moongazer.mp3')
                timeposcur = sound69.TimePosition
                sound69:Play()
                playanim(80947480089411) -- uuid. 118766274919427
            else
                stopanim()
            end
        elseif k == 'n' then
            if dancing == false then
                stopanim()
                dancing = true
                task.wait(0.005)
                sound69.SoundId = customasset('Dances/Down.mp3')
                timeposcur = sound69.TimePosition
                sound69:Play()
                playanim(111249002064299)
            else
                stopanim()
            end
        elseif k == 'comma' then
            if dancing == false then
                stopanim()
                dancing = true
                task.wait(0.005)
                sound69.SoundId = customasset('Dances/Mystery.mp3')
                timeposcur = sound69.TimePosition
                sound69:Play()
                playanim(106920825643057) -- uuid. 131401099812672
            else
                stopanim()
            end
        elseif k == 'leftbracket' then
            if dancing == false then
                stopanim()
                dancing = true
                task.wait(0.005)
                sound69.SoundId = customasset('Dances/true_heart.mp3')
                timeposcur = sound69.TimePosition
                sound69:Play()
                playanim(131776726113292)
            else
                stopanim()
            end
        elseif k == 'quote' then
            if dancing == false then
                stopanim()
                dancing = true
                task.wait(0.005)
                sound69.SoundId = customasset('Dances/Rewind.mp3')
                timeposcur = sound69.TimePosition
                sound69:Play()
                playanim(140376973204352)
            else
                stopanim()
            end
        end
    end
    if mode == 2 then
        if k == 'q' then
            if dancing == false then
                stopanim()
                dancing = true
                task.wait(0.005)
                sound69.SoundId = customasset('Dances/XO.mp3')
                timeposcur = sound69.TimePosition
                sound69:Play()
                playanim(89807443968447) -- uuid. 73559770055600
            else
                stopanim()
            end
        elseif k == 'e' then
            if dancing == false then
                stopanim()
                dancing = true
                task.wait(0.005)
                sound69.SoundId = customasset('Dances/drip.mp3')
                timeposcur = sound69.TimePosition
                sound69:Play()
                playanim(105662609338555) -- uuid. 100177280567649
            else
                stopanim()
            end
        elseif k == 'r' then
            if dancing == false then
                stopanim()
                dancing = true
                task.wait(0.005)
                sound69.SoundId = customasset('Dances/freeflow.mp3')
                timeposcur = sound69.TimePosition
                sound69:Play()
                playanim(75378609077044) -- uuid. 101564911432113
            else
                stopanim()
            end
        elseif k == 't' then
            if dancing == false then
                stopanim()
                dancing = true
                task.wait(0.005)
                sound69.SoundId = customasset('Dances/whateverlike.mp3')
                timeposcur = sound69.TimePosition
                sound69:Play()
                playanim(99152023738830) -- uuid. 83266223088944
            else
                stopanim()
            end
        elseif k == 'y' then
            if dancing == false then
                stopanim()
                dancing = true
                task.wait(0.005)
                sound69.SoundId = customasset('Dances/balls.mp3')
                timeposcur = sound69.TimePosition
                sound69:Play()
                playanim(124616782933406) -- uuid. 15039779727
            else
                stopanim()
            end
        elseif k == 'h' then
            if dancing == false then
                stopanim()
                dancing = true
                task.wait(0.005)
                sound69.SoundId = customasset('Dances/faster.ogg')
                timeposcur = sound69.TimePosition
                sound69:Play()
                playanim(10609437925)
            else
                stopanim()
            end
        elseif k == 'g' then
            if dancing == false then
                stopanim()
                dancing = true
                task.wait(0.005)
                sound69.SoundId = customasset('Dances/tryna.mp3')
                timeposcur = sound69.TimePosition
                sound69:Play()
                playanim(106801620167778, 1.25) -- uuid. 14887006269
            else
                stopanim()
            end
        elseif k == [[f]] then
            if dancing == false then
                stopanim()
                dancing = true
                task.wait(0.005)
                sound69.SoundId = customasset('Dances/chronoshift.mp3')
                timeposcur = sound69.TimePosition
                sound69:Play()
                playanim(100136191465523) -- uuid. 125834337223799
            else
                stopanim()
            end
        elseif k == 'j' then
            if dancing == false then
                stopanim()
                dancing = true
                task.wait(0.005)
                sound69.SoundId = customasset('Dances/dancingwit.mp3')
                sound69.PlaybackSpeed = 1
                timeposcur = sound69.TimePosition
                sound69:Play()
                coolparticles.Parent = char.Torso
                playanim(114660931657915, 0.75) -- uuid. 93585895457618
            else
                stopanim()
                sound69.PlaybackSpeed = 1
            end
        elseif k == 'k' then
            if dancing == false then
                stopanim()
                dancing = true
                task.wait(0.005)
                sound69.SoundId = customasset('Dances/frightfunk.mp3')
                timeposcur = sound69.TimePosition
                sound69:Play()
                playanim(82437456855605) -- uuid. 70835462045983
            else
                stopanim()
            end
        elseif k == 'u' then
            if dancing == false then
                stopanim()
                dancing = true
                task.wait(0.005)
                sound69.SoundId = customasset('Dances/bloodpop.mp3')
                timeposcur = sound69.TimePosition
                sound69:Play()
                playanim(82472212108809) -- uuid. 132026285699359
            else
                stopanim()
            end
        --[[elseif k == 'n' then
            if dancing == false then
                stopanim()
                dancing = true
                task.wait(0.005)
                playanim(91732165937556) -- uuid. 90819860436349
            else
                stopanim()
            end]]
        elseif k == 'z' then
            if dancing == false then
                stopanim()
                dancing = true
                task.wait(0.005)
                sound69.SoundId = customasset('Dances/leftright.mp3')
                timeposcur = sound69.TimePosition
                sound69:Play()
                playanim(107261816578577) -- uuid. 137845929482571
            else
                stopanim()
            end
        elseif k == 'x' then
            if dancing == false then
                stopanim()
                dancing = true
                task.wait(0.005)
                sound69.SoundId = customasset('Dances/heavylove.mp3')
                timeposcur = sound69.TimePosition
                sound69:Play()
                playanim(101332118847458) -- uuid. 85856686932206
            else
                stopanim()
            end
        elseif k == 'c' then
            if dancing == false then
                stopanim()
                dancing = true
                task.wait(0.005)
                sound69.SoundId = customasset('Dances/million.mp3')
                timeposcur = sound69.TimePosition
                sound69:Play()
                playanim(109123683211464)
            else
                stopanim()
            end
        elseif k == 'v' then
            if dancing == false then
                stopanim()
                dancing = true
                task.wait(0.005)
                sound69.SoundId = customasset('Dances/chaseme.mp3')
                timeposcur = sound69.TimePosition
                sound69:Play()
                playanim(124173723813941) -- uuid. 118311613925473
            else
                stopanim()
            end
        end
    elseif mode == 3 then
        if k == 'q' then
            if dancing == false then
                stopanim()
                dancing = true
                task.wait(0.005)
                sound69.SoundId = customasset('Dances/crisscross.mp3')
                timeposcur = sound69.TimePosition
                sound69:Play()
                playanim(109275255555630) -- uuid. 73116243097694
            else
                stopanim()
            end
        elseif k == 'e' then
            if dancing == false then
                stopanim()
                dancing = true
                task.wait(0.005)
                sound69.SoundId = customasset('Dances/brain.mp3')
                char.Humanoid.WalkSpeed = 4 * char:GetScale()
                timeposcur = sound69.TimePosition
                sound69:Play()
                playanim(93547721311170) -- uuid. 86485871533985
            else
                stopanim()
            end
        elseif k == 'r' then
            if dancing == false then
                stopanim()
                dancing = true
                task.wait(0.005)
                sound69.SoundId = customasset('Dances/duck.mp3')
                timeposcur = sound69.TimePosition
                sound69:Play()
                playanim(77920672554221, 1, true, nil, false) -- uuid. 13357063395
            else
                stopanim()
            end
        elseif k == 't' then
            if dancing == false then
                stopanim()
                dancing = true
                task.wait(0.005)
                sound69.SoundId = customasset('Dances/espresso.mp3')
                timeposcur = sound69.TimePosition
                sound69:Play()
                playanim(87342159331194) -- uuid. 87342159331194
            else
                stopanim()
            end
        elseif k == 'y' then
            if dancing == false then
                stopanim()
                dancing = true
                task.wait(0.005)
                sound69.SoundId = customasset('Dances/rakuten.mp3')
                timeposcur = sound69.TimePosition
                sound69:Play()
                playanim(121967347012647) -- uuid. 18985726113
            else
                stopanim()
            end
        elseif k == 'u' then
            if dancing == false then
                stopanim()
                dancing = true
                task.wait(0.005)
                sound69.SoundId = customasset('Dances/daynnite.mp3')
                timeposcur = sound69.TimePosition
                sound69:Play()
                playanim(116431235454771) -- uuid. 8915458946
            else
                stopanim()
            end
        elseif k == 'f' then
            if dancing == false then
                stopanim()
                dancing = true
                task.wait(0.005)
                sound69.SoundId = customasset('Dances/tort.mp3')
                timeposcur = sound69.TimePosition
                sound69:Play()
                playanim(99811468921857) -- uuid. 79630525228564
            else
                stopanim()
            end
        elseif k == 'g' then
            if dancing == false then
                stopanim()
                dancing = true
                task.wait(0.005)
                sound69.SoundId = customasset('Dances/lemon.mp3')
                timeposcur = sound69.TimePosition
                sound69:Play()
                playanim(138510336377177, 0.8) -- uuid. 120262284704633
            else
                stopanim()
            end
        elseif k == 'h' then
            if dancing == false then
                stopanim()
                dancing = true
                task.wait(0.005)
                sound69.SoundId = customasset('Dances/boom.mp3')
                timeposcur = sound69.TimePosition
                sound69:Play()
                playanim(92629504992703) -- uuid. 84471848998012
            else
                stopanim()
            end
        elseif k == 'j' then
            if dancing == false then
                stopanim()
                dancing = true
                task.wait(0.005)
                sound69.SoundId = customasset('Dances/doodle.mp3')
                timeposcur = sound69.TimePosition
                sound69:Play()
                playanim(137217645571244, 2) -- uuid. 90069083924245
            else
                stopanim()
            end
        elseif k == 'k' then
            if dancing == false then
                stopanim()
                dancing = true
                task.wait(0.005)
                sound69.SoundId = customasset('Dances/hypno.mp3')
                timeposcur = sound69.TimePosition
                sound69:Play()
                playanim(90469668054306) -- uuid. 72723551972407
            else
                stopanim()
            end
        elseif k == 'z' then
            if dancing == false then
                stopanim()
                dancing = true
                task.wait(0.005)
                sound69.SoundId = customasset('Dances/assum.mp3')
                timeposcur = sound69.TimePosition
                sound69:Play()
                playanim(129275138998868) -- uuid. 15705077587
            else
                stopanim()
            end
        elseif k == 'x' then
            if dancing == false then
                stopanim()
                dancing = true
                task.wait(0.005)
                sound69.SoundId = customasset('Dances/rotten.mp3')
                timeposcur = sound69.TimePosition
                sound69:Play()
                playanim(89457637802764, 2) -- uuid. 109990576374190
            else
                stopanim()
            end
        elseif k == 'c' then
            if dancing == false then
                stopanim()
                dancing = true
                task.wait(0.005)
                sound69.SoundId = customasset('Dances/decadent.mp3')
                timeposcur = sound69.TimePosition
                sound69:Play()
                playanim(109167288749488, 0.35, true, nil, false) -- uuid. 84587788869282
            else
                stopanim()
            end
        elseif k == 'v' then
            if dancing == false then
                stopanim()
                dancing = true
                task.wait(0.005)
                sound69.SoundId = customasset('Dances/misc.mp3')
                timeposcur = sound69.TimePosition
                sound69:Play()
                playanim(135122971004487, 2) -- uuid. 100305033962391
            else
                stopanim()
            end
        elseif k == 'n' then
            if dancing == false then
                stopanim()
                dancing = true
                task.wait(0.005)
                sound69.SoundId = customasset('Dances/jung.mp3')
                timeposcur = sound69.TimePosition
                sound69:Play()
                playanim(135648012207180) -- uuid. 71723925114737
            else
                stopanim()
            end
        end
    end
    if k == 'equals' then
        playbacktrack = not playbacktrack
        if dancing == false then
            if playbacktrack == true then
                sound69:Play()
                sound69.Volume = 0.75
                game:GetService('StarterGui'):SetCore('SendNotification', {
                    Title = 'Krystal Dance V3',
                    Duration = 5,
                    Text = 'Background music enabled',
                })
            else
                sound69:Stop()
                game:GetService('StarterGui'):SetCore('SendNotification', {
                    Title = 'Krystal Dance V3',
                    Duration = 5,
                    Text = 'Background music disabled',
                })
            end
        end
    end
    if k == 'leftcontrol' then
        sprinting = not sprinting
    end
    if k == 'm' then
        if mode == 2 then
            mode = 3
            game:GetService('StarterGui'):SetCore('SendNotification', {
                Title = 'Krystal Dance V3',
                Duration = 5,
                Text = 'You are on page 3',
            })
        elseif mode == 1 then
            mode = 2
            game:GetService('StarterGui'):SetCore('SendNotification', {
                Title = 'Krystal Dance V3',
                Duration = 5,
                Text = 'You are on page 2',
            })
        elseif mode == 3 then
            mode = 1
            game:GetService('StarterGui'):SetCore('SendNotification', {
                Title = 'Krystal Dance V3',
                Duration = 5,
                Text = 'You are on page 1',
            })
        end
    end
end)
char.Humanoid:GetPropertyChangedSignal('MoveDirection'):Connect(function()
    if char.Humanoid.Sit == false then
        if
            char.Humanoid.MoveDirection == Vector3.new(0, 0, 0)
            and dancing == false
            and idle == false
        then
            walking = false
            idle = true
            stopanim()
            fwait(1 / 500)
            if
                idle == true
                and walking == false
                and char.Humanoid.MoveDirection == Vector3.new(0, 0, 0)
                and dancing == false
                and playanother == true
            then
                playanim(0, 1, false, idleanim)
            end
        elseif
            char.Humanoid.MoveDirection ~= Vector3.new(0, 0, 0)
            and dancing == false
            and walking == false
        then
            char.Humanoid.WalkSpeed = 14 * char:GetScale()
            walking = true
            idle = false
            stopanim()
            fwait(1 / 500)
            if sprinting == false then
                char.Humanoid.WalkSpeed = 14 * char:GetScale()
                if
                    walking == true
                    and idle == false
                    and char.Humanoid.MoveDirection ~= Vector3.new(0, 0, 0)
                    and dancing == false
                    and playanother == true
                then
                    playanim(130213485744288, 1, false, walkanim)
                end
            else
                char.Humanoid.WalkSpeed = 24 * char:GetScale()
                if
                    walking == true
                    and idle == false
                    and char.Humanoid.MoveDirection ~= Vector3.new(0, 0, 0)
                    and dancing == false
                    and playanother == true
                then
                    playanim(130213485744288, 2.2, false, sprintanim)
                end
            end
        end
    end
end)
char.Humanoid:GetPropertyChangedSignal('Sit'):Connect(function()
    print('sit')
    if char.Humanoid.Sit == true then
        stopanim()

        math.randomseed(os.clock())
        if math.random(1, 2) == 1 then
            playanim(133312100962627, 1, false)
        else
            playanim(122775909441631, 1, false)
        end
    else
        stopanim()
        task.wait(0.05)
        stopanim()
        char.Humanoid:Move(Vector3.new(0, 0, -1), true)
        char.Humanoid:Move(Vector3.new(0, 0, -1), true)
        char.Humanoid:Move(Vector3.new(0, 0, -1), true)
    end
end)

local RunService = game:GetService('RunService')

local Player = game:GetService('Players').LocalPlayer
local PlayerMouse = Player:GetMouse()
local Camera = workspace.CurrentCamera
local Character = char

local Humanoid = Character:WaitForChild('Humanoid')
local IsR6 = (Humanoid.RigType == Enum.HumanoidRigType.R6)

local Head = Character:WaitForChild('Head')
local Torso = if IsR6
    then Character:WaitForChild('Torso')
    else Character:WaitForChild('UpperTorso')

local Neck = if IsR6
    then Torso:WaitForChild('Neck')
    else Head:WaitForChild('Neck')
local Waist = if IsR6 then nil else Torso:WaitForChild('Waist')

local NeckOriginC0 = Neck.C0
local WaistOriginC0 = if Waist then Waist.C0 else nil

Neck.MaxVelocity = 1 / 3

local AllowedStates = {
    Enum.HumanoidStateType.Running,
    Enum.HumanoidStateType.Climbing,
    Enum.HumanoidStateType.Swimming,
    Enum.HumanoidStateType.Freefall,
    Enum.HumanoidStateType.Seated,
}
local IsAllowedState = (table.find(AllowedStates, Humanoid:GetState()) ~= nil)

local find = table.find
local atan = math.atan
local atan2 = math.atan2

Humanoid.StateChanged:Connect(function(_, new)
    IsAllowedState = (find(AllowedStates, new) ~= nil)
end)
local oldC0N = Neck.C0

local updatesPerSecond = 10
local Character = char
local Root = char.HumanoidRootPart
introsound = Instance.new('Sound', Root)
introsound.SoundId = 'rbxassetid://236146895'
introsound.Volume = 8
introsound:Play()

bigfedora = Instance.new('Part', Character)
bigfedora.Size = Vector3.new(2, 2, 2)
bigfedora.CFrame = bigfedora.CFrame:inverse()
    * Root.CFrame
    * CFrame.new(math.random(-60, 60), -0.2, math.random(-60, 60))
    * CFrame.Angles(0, math.rad(math.random(-180, 180)), 0)
bigfedora.CanCollide = false
bigfedora.Anchored = true
bigfedora.Name = 'mbigf'
mbigfedora = Instance.new('SpecialMesh', bigfedora)
mbigfedora.MeshType = 'FileMesh'
mbigfedora.Scale = Vector3.new(5, 5, 5)
mbigfedora.MeshId, mbigfedora.TextureId =
    'http://www.roblox.com/asset/?id=1125478',
    'http://www.roblox.com/asset/?id=1125479'

for i = 1, 60 do
    bigfedora.CFrame = bigfedora.CFrame:lerp(
        CFrame.new(Root.Position)
            * CFrame.new(0, -0.1, 0)
            * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)),
        0.09
    )
    task.wait(1 / 60)
end
wait(0.25)
for i = 1, 50 do
    bigfedora.CFrame =
        bigfedora.CFrame:lerp(CFrame.new(char.Head.Position), 0.05)
    task.wait(1 / 60)
end
zmc = 0
for i = 1, 29 do
    zmc = zmc + 2
    mbigfedora.Scale = mbigfedora.Scale - Vector3.new(0.25, 0.25, 0.25)
    bigfedora.CFrame = bigfedora.CFrame
        * CFrame.Angles(math.rad(0), math.rad(zmc), 0)
    task.wait(1 / 60)
end
bigfedora:Remove()
local nim = 0
char.Humanoid.Died:Connect(function()
    sound69.PlaybackSpeed = 0
    sound69.Parent = nil
    sound69.Volume = 0
end)
local hum = char.Humanoid
local cf = CFrame.new
local DIEDLOOP
local HEADLOOP
repeat
    char.Humanoid:Move(Vector3.new(0, 0, -1), true)
    task.wait(1 / 60)
    nim = nim + 1
until nim == 3
RunService.RenderStepped:Connect(function(deltaTime: number)
    local function Alpha(n)
        return math.clamp(n * deltaTime * 60, 0, 1)
    end
    hum.CameraOffset = hum.CameraOffset:Lerp(
        (hrp.CFrame * cf(0, 1.5, 0)):PointToObjectSpace(h.Position),
        Alpha(0.15)
    )
    if IsAllowedState and dancing == false then
        local HeadPosition = Head.Position
        if Neck then
            local MousePos = PlayerMouse.Hit.Position
            local TranslationVector = (HeadPosition - MousePos).Unit
            local Pitch = atan(TranslationVector.Y)
            local Yaw = TranslationVector:Cross(Torso.CFrame.LookVector).Y
            local Roll = atan(Yaw)

            local NeckCFrame
            if IsR6 then
                NeckCFrame = CFrame.Angles(Pitch, 0, Yaw)
            else
                NeckCFrame = CFrame.Angles(-Pitch * 0.5, Yaw, -Roll * 0.5)
                local waistCFrame = CFrame.Angles(-Pitch * 0.5, Yaw * 0.5, 0)
                Waist.C0 = Waist.C0:Lerp(
                    WaistOriginC0 * waistCFrame,
                    updatesPerSecond * deltaTime
                )
            end
            Neck.C0 = Neck.C0:Lerp(
                NeckOriginC0 * NeckCFrame,
                updatesPerSecond * deltaTime
            )
        end
    elseif dancing == true then
        Neck.C0 = oldC0N
    end
    if char.Humanoid.MoveDirection == Vector3.new(0, 0, 0) then
        walking = false
        idle = true
    else
        walking = true
        idle = false
    end
end)
--

end)

-- Credits button click
creditsBtn.MouseButton1Click:Connect(function()
    closePopup()
    print("------------------------------------------")
print("Krystal Dance V3 - Made by NITRO-GT")
Wait(0.2)
print("Krystal Dance V3 - Fixed by MrY7zz")
Wait(0.2)
print("Krystal Dance V3 - Modded by PlasmaByte")
Wait(0.2)
print("Krystal Dance V3 - Credits goes to them!!")
Wait(0.2)
print("Controls:")
Wait(0.2)
print("Q, E, R, T, Y, U, I, P, F, G, H, J, K, L, Z, X, C, V, N, Sometimes the comma key, M to scroll pages")
Wait(0.2)
print("------------------------------------------")
Wait(0.2)
notify("Giant Krystal Dance", "Check Console!")
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
notify("Giant Krystal Dance", "Supported game link copied.")