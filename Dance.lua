pcall(function()
    if not shared.FunctionPatchesForTrashExecutor == true then
        loadstring(game:HttpGet("https://pastefy.app/TL0PGJ2Z/raw"))()
        shared.FunctionPatchesForTrashExecutor = true
    end
end)
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local TextChatService = game:GetService("TextChatService")

local plr = Players.LocalPlayer
local playerGui = plr:WaitForChild("PlayerGui")

local function Chat(message)
    TextChatService.TextChannels.RBXGeneral:SendAsync(message)
end

function notify(title, text, duration)
    StarterGui:SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = duration or 3
    })
end

local colorScheme = {
    primary = Color3.fromRGB(75, 0, 130),
    secondary = Color3.fromRGB(148, 0, 211),
    accent = Color3.fromRGB(123, 104, 238),
    danger = Color3.fromRGB(220, 20, 60),
    success = Color3.fromRGB(0, 200, 83),
    background = Color3.fromRGB(30, 30, 40),
    text = Color3.fromRGB(240, 240, 240),
    subtext = Color3.fromRGB(180, 180, 190)
}

local uiState = {
    enabled = false,
    minimized = false,
    lastSize = UDim2.new(0, 350, 0, 300)
}

local gui = Instance.new("ScreenGui")
gui.ResetOnSpawn = false
gui.Parent = playerGui

local minimizer = Instance.new("TextButton")
minimizer.Size = UDim2.new(0, 100, 0, 40)
minimizer.Position = UDim2.new(0, 10, 0, 10)
minimizer.BackgroundColor3 = colorScheme.primary
minimizer.Font = Enum.Font.Arcade
minimizer.TextSize = 16
minimizer.TextColor3 = colorScheme.text
minimizer.Text = "Enable"
minimizer.TextScaled = true
minimizer.TextWrapped = true
minimizer.Parent = gui
minimizer.ZIndex = 10

local corner = Instance.new("UICorner", minimizer)
corner.CornerRadius = UDim.new(0, 20)

local minimizerBg = Instance.new("Frame")
minimizerBg.Size = UDim2.new(1, 6, 1, 6)
minimizerBg.Position = UDim2.new(0, -3, 0, -3)
minimizerBg.BackgroundColor3 = colorScheme.accent
minimizerBg.ZIndex = 9
minimizerBg.Parent = minimizer

local cornerBg = Instance.new("UICorner", minimizerBg)
cornerBg.CornerRadius = UDim.new(0, 23)

local popup = Instance.new("Frame")
popup.Size = uiState.lastSize
popup.Position = UDim2.new(0.5, -175, 0.5, -150)
popup.BackgroundColor3 = colorScheme.background
popup.Visible = false
popup.ClipsDescendants = true
popup.Parent = gui

local corner = Instance.new("UICorner", popup)
corner.CornerRadius = UDim.new(0, 40)

local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, colorScheme.background),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 25, 35))
}
gradient.Rotation = 90
gradient.Parent = popup

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, -40, 0, 40)
titleLabel.Position = UDim2.new(0, 20, 0, 20)
titleLabel.BackgroundTransparency = 1
titleLabel.Font = Enum.Font.Arcade
titleLabel.TextSize = 22
titleLabel.TextColor3 = colorScheme.text
titleLabel.Text = "Giant Dance"
titleLabel.TextScaled = true
titleLabel.TextWrapped = true
titleLabel.Parent = popup

local descLabel = Instance.new("TextLabel")
descLabel.Size = UDim2.new(1, -40, 0, 60)
descLabel.Position = UDim2.new(0, 20, 0, 60)
descLabel.BackgroundTransparency = 1
descLabel.Font = Enum.Font.Arcade
descLabel.TextSize = 14
descLabel.TextColor3 = colorScheme.subtext
descLabel.TextWrapped = true
descLabel.TextScaled = true
descLabel.Text = "I do not own Krystal Dance V3, press 'Click Me!' button for more details."
descLabel.Parent = popup

local function createButton(name, text, color, position)
    local buttonContainer = Instance.new("Frame")
    buttonContainer.Size = UDim2.new(0.45, 0, 0, 40)
    buttonContainer.Position = position
    buttonContainer.BackgroundTransparency = 1
    buttonContainer.Parent = popup

    local buttonBg = Instance.new("Frame")
    buttonBg.Size = UDim2.new(1, 6, 1, 6)
    buttonBg.Position = UDim2.new(0, -3, 0, -3)
    buttonBg.BackgroundColor3 = color
    buttonBg.ZIndex = 1
    buttonBg.Parent = buttonContainer

    local cornerBg = Instance.new("UICorner", buttonBg)
    cornerBg.CornerRadius = UDim.new(0, 15)

    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 1, 0)
    button.BackgroundColor3 = color
    button.Font = Enum.Font.Arcade
    button.TextSize = 14
    button.TextColor3 = colorScheme.text
    button.Text = text
    button.TextScaled = true
    button.TextWrapped = true
    button.Name = name
    button.ZIndex = 2
    button.Parent = buttonContainer

    local corner = Instance.new("UICorner", button)
    corner.CornerRadius = UDim.new(0, 12)

    return button
end

local reanimateBtn = createButton("ReanimateBtn", "Reanimate", colorScheme.success, UDim2.new(0.05, 0, 0.6, 0))
local creditsBtn = createButton("CreditsBtn", "Click Me!", colorScheme.accent, UDim2.new(0.5, 0, 0.6, 0))
local stopBtn = createButton("StopBtn", "Stop Script", colorScheme.danger, UDim2.new(0.05, 0, 0.75, 0))
stopBtn.Parent.Size = UDim2.new(0.9, 0, 0, 40)

local footerLabel = Instance.new("TextLabel")
footerLabel.Size = UDim2.new(1, -40, 0, 20)
footerLabel.Position = UDim2.new(0, 20, 0.9, 0)
footerLabel.BackgroundTransparency = 1
footerLabel.Font = Enum.Font.Sarpanch
footerLabel.TextSize = 12
footerLabel.TextColor3 = colorScheme.subtext
footerLabel.Text = "Made by StarFlow"
footerLabel.TextScaled = true
footerLabel.TextWrapped = true
footerLabel.Parent = popup

local function toggleUI()
    uiState.enabled = not uiState.enabled
    if uiState.enabled then
        minimizer.Text = "Disable"
        popup.Visible = true
        -- Sped up the opening animation from 0.6 to 0.3 seconds
        local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        TweenService:Create(popup, tweenInfo, {Size = uiState.lastSize}):Play()
    else
        minimizer.Text = "Enable"
        uiState.lastSize = popup.Size
        local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
        local tween = TweenService:Create(popup, tweenInfo, {Size = UDim2.new(0, 0, 0, 0)})
        tween:Play()
        tween.Completed:Connect(function()
            if not uiState.enabled then
                popup.Visible = false
            end
        end)
    end
end

minimizer.MouseButton1Click:Connect(toggleUI)

local function closePopup()
    uiState.enabled = false
    uiState.lastSize = popup.Size
    local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
    local tween = TweenService:Create(popup, tweenInfo, {Size = UDim2.new(0, 0, 0, 0)})
    tween:Play()
    tween.Completed:Wait()
    if not uiState.enabled then
        popup.Visible = false
        minimizer.Text = "Enable"
    end
end

stopBtn.MouseButton1Click:Connect(function()
    closePopup()
    Chat("-rj ")
    notify("Giant Dance", "Rejooning :P", 3)
end)

reanimateBtn.MouseButton1Click:Connect(function()
    closePopup()
    Chat("-gh 6202063049,4602533885,4602533885,4602533885,4602533885,4602533885,4602533885,4602533885,4602533885,4602533885,4602533885,4602533885,4602533885,4602533885")
    task.wait(3)
    local reps = "4602533885,"
    local repped = reps:rep(13)
    local base = "-gh 6202063049,"
    repped = repped:sub(1, -2)
    local done = base .. repped
    if setclipboard then
        setclipboard(done)
    else
        print(done)
    end
    repeat task.wait() until plr.Character:FindFirstChild("Smile")
    task.wait(.8)

    local char = plr.Character
    local cons = {}
    local ti = table.insert
    local rs = RunService
    local stepped = rs.Stepped
    local heartbeat = rs.Heartbeat
    local oldpos = char.HumanoidRootPart.CFrame
    char.HumanoidRootPart.CFrame = oldpos + Vector3.new(0, 10000, 0)
    task.wait(.3)

    local reanimstorage = Instance.new("Folder", char)
    reanimstorage.Name = "ReanimStorage"
    local reanim = game:GetObjects("rbxassetid://9678834251")[1]
    reanim.Humanoid.CameraOffset = Vector3.new(0, 9.5, 0)
    reanim.Name = "Reanim"

    local anim = char.Animate
    anim.Parent = reanim

    for i, v in pairs(reanim:GetDescendants()) do
        if v:IsA("BasePart") or v:IsA("Decal") then
            v.Transparency = 1
        end
        if v:IsA("ParticleEmitter") then
            v.Enabled = false
        end
    end

    reanim.Parent = reanimstorage
    reanim.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame * CFrame.new(0, 5, 0)

    local netless_Y = Vector3.new(0, 30, 0)
    local v3_101 = Vector3.new(1, 0, 1)
    local inf = math.huge
    local v3_0 = Vector3.new(0, 0, 0)

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
            local realVelocity = Vector3.new(0, 30, 0)
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
            ti(cons, steppedcon)
            ti(cons, heartbeatcon)
        end

        att0.Orientation = r or v3_0
        att0.Position = v3_0
        att1.Orientation = v3_0
        att1.Position = p or v3_0
        Part0.CFrame = Part1.CFrame
    end

    for _, part in next, char:GetDescendants() do
        if part:IsA("BasePart") then
            ti(cons, stepped:Connect(function()
                part.CanCollide = false
            end))
        end
    end

    local bighats = {}
    local smile = char:FindFirstChild("Smile")

    for i, v in pairs(char:GetChildren()) do
        if v:IsA("BasePart") and (v.Name:find("Arm") or v.Name:find("Leg")) then
            v:Destroy()
        end
        if v:IsA("Accessory") and v.Handle.Size == Vector3.new(6, 6, 6) then
            table.insert(bighats, v)
            if v.Handle:FindFirstChild("SpecialMesh") then
                v.Handle.SpecialMesh:Destroy()
            end
        elseif v:IsA("Accessory") and v.Handle.Size ~= Vector3.new(6, 6, 6) and v.Name ~= "Smile" then
            v.Handle:BreakJoints()
            v:Destroy()
        end
    end

    align(char["HumanoidRootPart"], reanim["Head"], Vector3.new(0, 0.5, 0))

    for i, v in pairs(bighats) do
        v.Name = "bighat " .. tostring(i)
        v.Handle:BreakJoints()
    end

    smile.Handle:BreakJoints()
    align(bighats[1].Handle, reanim["Head"])
    align(smile.Handle, reanim["Head"], Vector3.new(0, 0, -3.01), Vector3.new(0, 90, 0))
    align(bighats[2].Handle, reanim["Torso"], Vector3.new(-3, 3, 0))
    align(bighats[3].Handle, reanim["Torso"], Vector3.new(3, 3, 0))
    align(bighats[4].Handle, reanim["Torso"], Vector3.new(-3, -3, 0))
    align(bighats[5].Handle, reanim["Torso"], Vector3.new(3, -3, 0))
    align(bighats[6].Handle, reanim["Right Arm"], Vector3.new(0, 3, 0))
    align(bighats[7].Handle, reanim["Right Arm"], Vector3.new(0, -3, 0))
    align(bighats[8].Handle, reanim["Left Arm"], Vector3.new(0, 3, 0))
    align(bighats[9].Handle, reanim["Left Arm"], Vector3.new(0, -3, 0))
    align(bighats[10].Handle, reanim["Right Leg"], Vector3.new(0, 3, 0))
    align(bighats[11].Handle, reanim["Right Leg"], Vector3.new(0, -3, 0))
    align(bighats[12].Handle, reanim["Left Leg"], Vector3.new(0, 3, 0))
    align(bighats[13].Handle, reanim["Left Leg"], Vector3.new(0, -3, 0))

    workspace.CurrentCamera.CameraSubject = reanim.Humanoid
    plr.Character = reanim
    anim.Disabled = true
    anim.Disabled = false
    task.wait(.3)
    plr.Character.HumanoidRootPart.CFrame = oldpos + Vector3.new(0, 6, 0)

    for i, v in pairs(bighats) do
        v.Handle.CFrame = plr.Character.HumanoidRootPart.CFrame
    end
    smile.Handle.CFrame = plr.Character.HumanoidRootPart.CFrame

    Chat("-net")

    local reset = Instance.new("BindableEvent")
    ti(cons, reset.Event:Connect(function()
        reanim:Destroy()
        plr.Character = nil
        plr.Character = char
        plr.Character.Humanoid.Health = 0
        for i, v in pairs(cons) do
            v:Disconnect()
        end
        StarterGui:SetCore("ResetButtonCallback", true)
        reset:Destroy()
        notify("Resetting", "Please wait " .. tostring(Players.RespawnTime) .. " seconds", Players.RespawnTime)
    end))
    StarterGui:SetCore("ResetButtonCallback", reset)

    task.wait(5)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/KDV3-Fixed/refs/heads/main/KrystalDance3"))()
end)

creditsBtn.MouseButton1Click:Connect(function()
    closePopup()
    print("------------------------------------------")
    print("Krystal Dance V3 - Made by NITRO-GT")
    task.wait(.1)
    print("Krystal Dance V3 - Fixed by MrY7zz")
    task.wait(.1)
    print("Krystal Dance V3 - Credits goes to them!!")
    task.wait(.1)
    print("------------------Changelog------------------")
    task.wait(.1)
    print("Renamed from Giant Krystal Dance to Giant Dance.")
    task.wait(.1)
    print("Love from StarFlow 💖")
    task.wait(.1)
    print("------------------------------------------")
    task.wait(.1)
    notify("Giant Dance", "Check Console!")
end)

gui:GetPropertyChangedSignal("Enabled"):Connect(function()
    if gui.Enabled and uiState.enabled then
        popup.Visible = true
        popup.Size = uiState.lastSize
        minimizer.Text = "Disable"
    end
end)

task.wait(1)
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local plr = Players.LocalPlayer
local playerGui = plr:WaitForChild("PlayerGui")

local gui = Instance.new("ScreenGui")
gui.Name = "KeyboardSelector"
gui.ResetOnSpawn = false
gui.Parent = playerGui
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local function scaleValue(value)
    return value * (math.min(playerGui.AbsoluteSize.X, playerGui.AbsoluteSize.Y) / 1080)
end

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, scaleValue(350), 0, scaleValue(400))
frame.Position = UDim2.new(0.5, -scaleValue(175), 1.5, 0)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
frame.BorderSizePixel = 0
frame.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, scaleValue(12))
corner.Parent = frame

local outline = Instance.new("UIStroke")
outline.Thickness = 2
outline.Color = Color3.fromRGB(80, 0, 120)
outline.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
outline.Parent = frame

local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, scaleValue(40))
header.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
header.BorderSizePixel = 0
header.Parent = frame

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, scaleValue(12))
headerCorner.Parent = header

local headerGradient = Instance.new("UIGradient")
headerGradient.Rotation = 90
headerGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(60, 0, 90)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 0, 60))
}
headerGradient.Parent = header

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 1, 0)
title.BackgroundTransparency = 1
title.Text = "SELECT KEYBOARD"
title.Font = Enum.Font.Fantasy
title.TextSize = scaleValue(18)
title.TextColor3 = Color3.fromRGB(220, 220, 220)
title.Parent = header

local closeBtn = Instance.new("ImageButton")
closeBtn.Size = UDim2.new(0, scaleValue(24), 0, scaleValue(24))
closeBtn.Position = UDim2.new(1, -scaleValue(32), 0, scaleValue(8))
closeBtn.BackgroundTransparency = 1
closeBtn.Image = "rbxassetid://3926305904"
closeBtn.ImageRectOffset = Vector2.new(924, 724)
closeBtn.ImageRectSize = Vector2.new(36, 36)
closeBtn.ImageColor3 = Color3.fromRGB(180, 180, 180)
closeBtn.Parent = header

closeBtn.MouseEnter:Connect(function()
    TweenService:Create(closeBtn, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        ImageColor3 = Color3.fromRGB(220, 100, 220)
    }):Play()
end)

closeBtn.MouseLeave:Connect(function()
    TweenService:Create(closeBtn, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        ImageColor3 = Color3.fromRGB(180, 180, 180)
    }):Play()
end)

closeBtn.MouseButton1Click:Connect(function()
    TweenService:Create(frame, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
        Position = UDim2.new(0.5, -scaleValue(175), 1.5, 0)
    }):Play()
    task.wait(0.65)
    gui:Destroy()
end)

local buttonContainer = Instance.new("ScrollingFrame")
buttonContainer.Size = UDim2.new(1, 0, 1, -scaleValue(50))
buttonContainer.Position = UDim2.new(0, 0, 0, scaleValue(50))
buttonContainer.BackgroundTransparency = 1
buttonContainer.BorderSizePixel = 0
buttonContainer.ScrollBarThickness = scaleValue(4)
buttonContainer.ScrollBarImageColor3 = Color3.fromRGB(80, 0, 120)
buttonContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
buttonContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y
buttonContainer.Parent = frame

local uiListLayout = Instance.new("UIListLayout")
uiListLayout.Padding = UDim.new(0, scaleValue(10))
uiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
uiListLayout.Parent = buttonContainer

local function createButton(name, layoutOrder, func)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0.9, 0, 0, scaleValue(50))
    button.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    button.AutoButtonColor = false
    button.Text = ""
    button.LayoutOrder = layoutOrder
    button.Parent = buttonContainer

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, scaleValue(8))
    btnCorner.Parent = button

    local btnStroke = Instance.new("UIStroke")
    btnStroke.Thickness = 1
    btnStroke.Color = Color3.fromRGB(60, 0, 90)
    btnStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    btnStroke.Parent = button

    local buttonTitle = Instance.new("TextLabel")
    buttonTitle.Size = UDim2.new(1, 0, 1, 0)
    buttonTitle.BackgroundTransparency = 1
    buttonTitle.Text = name
    buttonTitle.Font = Enum.Font.Fantasy
    buttonTitle.TextSize = scaleValue(16)
    buttonTitle.TextColor3 = Color3.fromRGB(220, 220, 220)
    buttonTitle.Parent = button

    local buttonHighlight = Instance.new("Frame")
    buttonHighlight.Size = UDim2.new(1, 0, 1, 0)
    buttonHighlight.BackgroundColor3 = Color3.fromRGB(80, 0, 120)
    buttonHighlight.BackgroundTransparency = 0.9
    buttonHighlight.BorderSizePixel = 0
    buttonHighlight.ZIndex = -1
    buttonHighlight.Parent = button

    local highlightCorner = Instance.new("UICorner")
    highlightCorner.CornerRadius = UDim.new(0, scaleValue(8))
    highlightCorner.Parent = buttonHighlight

     Hover effects
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        }):Play()
        TweenService:Create(btnStroke, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Color = Color3.fromRGB(120, 0, 180)
        }):Play()
        TweenService:Create(buttonHighlight, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundTransparency = 0.7
        }):Play()
    end)

    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        }):Play()
        TweenService:Create(btnStroke, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Color = Color3.fromRGB(60, 0, 90)
        }):Play()
        TweenService:Create(buttonHighlight, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundTransparency = 0.9
        }):Play()
    end)

    button.MouseButton1Down:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        }):Play()
        TweenService:Create(buttonHighlight, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundTransparency = 0.5
        }):Play()
    end)

    button.MouseButton1Up:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        }):Play()
        TweenService:Create(buttonHighlight, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundTransparency = 0.7
        }):Play()
    end)

    button.MouseButton1Click:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundColor3 = Color3.fromRGB(30, 30, 30),
            Size = UDim2.new(0.85, 0, 0, scaleValue(50))
        }):Play()
        TweenService:Create(buttonHighlight, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundTransparency = 0.8
        }):Play()
        
        for _, child in ipairs(buttonContainer:GetChildren()) do
            if child:IsA("TextButton") then
                TweenService:Create(child, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    BackgroundTransparency = 1,
                    TextTransparency = 1
                }):Play()
            end
        end
        
        TweenService:Create(frame, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
            Position = UDim2.new(0.5, -scaleValue(175), -0.5, 0)
        }):Play()
        task.wait(0.65)
        func()
        gui:Destroy()
    end)
end

createButton("Byte Keyboard", 1, function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/Scripts/main/Keyboards/Byte.lua"))()
end)

createButton("Kilobyte Keyboard", 2, function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/Scripts/main/Keyboards/KiloByte.lua"))()
end)

createButton("Delta Keyboard", 3, function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/Scripts/main/Keyboards/Delta.lua"))()
end)

createButton("Virtual Keyboard", 4, function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/Scripts/main/Keyboards/Virtual.lua"))()
end)

createButton("Mob Keyboard", 5, function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
end)

TweenService:Create(frame, TweenInfo.new(0.8, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
    Position = UDim2.new(0.5, -scaleValue(175), 0.5, -scaleValue(200))
}):Play()

playerGui:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
    frame.Size = UDim2.new(0, scaleValue(350), 0, scaleValue(400))
    frame.Position = UDim2.new(0.5, -scaleValue(175), 0.5, -scaleValue(200))
    corner.CornerRadius = UDim.new(0, scaleValue(12))
    header.Size = UDim2.new(1, 0, 0, scaleValue(40))
    title.TextSize = scaleValue(18)
    closeBtn.Size = UDim2.new(0, scaleValue(24), 0, scaleValue(24))
    closeBtn.Position = UDim2.new(1, -scaleValue(32), 0, scaleValue(8))
    buttonContainer.Size = UDim2.new(1, 0, 1, -scaleValue(50))
    buttonContainer.Position = UDim2.new(0, 0, 0, scaleValue(50))
    buttonContainer.ScrollBarThickness = scaleValue(4)
    uiListLayout.Padding = UDim.new(0, scaleValue(10))
    
    for _, button in ipairs(buttonContainer:GetChildren()) do
        if button:IsA("TextButton") then
            button.Size = UDim2.new(0.9, 0, 0, scaleValue(50))
            button:FindFirstChildWhichIsA("UICorner").CornerRadius = UDim.new(0, scaleValue(8))
            button:FindFirstChildWhichIsA("TextLabel").TextSize = scaleValue(16)
        end
    end
end)
notify("Giant Dance", "Please, choose a keyboard,")
task.wait(0.95)
notify("Giant Dance", "bc without one you")
task.wait(0.95)
notify("Giant Dance", "won't be able to use this")
task.wait(0.95)
notify("Giant Dance", "Supported games:")
task.wait(0.95)
notify("Giant Dance", "Just a baseplate,")
task.wait(0.95)
notify("Giant Dance", "Green Baseplate.")
