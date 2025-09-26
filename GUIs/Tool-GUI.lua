local lp = game:GetService("Players").LocalPlayer
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local loopKillEnabled = false
local targetPlayer = nil
local killInProgress = false

local function gplr(String)
    local Found = {}
    local strl = String:lower()
    if strl == "all" then
        for i,v in pairs(game:GetService("Players"):GetPlayers()) do
            table.insert(Found,v)
        end
    elseif strl == "others" then
        for i,v in pairs(game:GetService("Players"):GetPlayers()) do
            if v.Name ~= lp.Name then
                table.insert(Found,v)
            end
        end
    elseif strl == "me" then
        for i,v in pairs(game:GetService("Players"):GetPlayers()) do
            if v.Name == lp.Name then
                table.insert(Found,v)
            end
        end
    else
        for i,v in pairs(game:GetService("Players"):GetPlayers()) do
            if v.Name:lower():sub(1, #String) == String:lower() or
                (v.DisplayName and v.DisplayName:lower():sub(1, #String) == String:lower()) then
                table.insert(Found,v)
            end
        end
    end
    return Found
end

local function notify(text)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "★ Kill Gui ★";
        Text = text;
        Duration = 3;
    })
end

local function tweenObject(obj, properties, duration, style)
    local tweenInfo = TweenInfo.new(duration, style or Enum.EasingStyle.Quad)
    local tween = TweenService:Create(obj, tweenInfo, properties)
    tween:Play()
    return tween
end

local function isPlayerAlive(player)
    return player and player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local ui = Instance.new("Frame")
ui.Name = "ui"
ui.Parent = ScreenGui
ui.Active = true
ui.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
ui.BackgroundTransparency = 0
ui.BorderSizePixel = 0
ui.Position = UDim2.new(0.3, 0, 0.3, 0)
ui.Size = UDim2.new(0, 320, 0, 200)
ui.Draggable = true

local UICorner = Instance.new("UICorner")
UICorner.Parent = ui
UICorner.CornerRadius = UDim.new(0.08, 0)

local uiStroke = Instance.new("UIStroke")
uiStroke.Parent = ui
uiStroke.Color = Color3.fromRGB(60, 60, 80)
uiStroke.Thickness = 2

local title = Instance.new("TextLabel")
title.Name = "title"
title.Parent = ui
title.BackgroundTransparency = 1
title.Position = UDim2.new(0, 0, 0.02, 0)
title.Size = UDim2.new(1, 0, 0, 50)
title.Font = Enum.Font.GothamBold
title.Text = "★ Kill Gui ★"
title.TextColor3 = Color3.fromRGB(0, 200, 255)
title.TextScaled = true
title.TextWrapped = true

local titleGlow = Instance.new("UIGradient")
titleGlow.Parent = title
titleGlow.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 150, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 200))
})
titleGlow.Rotation = 45

local Frame = Instance.new("Frame")
Frame.Parent = title
Frame.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
Frame.Position = UDim2.new(0.07, 0, 0.86, 0)
Frame.Size = UDim2.new(0.85, 0, 0, 3)
Frame.BorderSizePixel = 0

local Username = Instance.new("TextBox")
Username.Name = "Username"
Username.Parent = ui
Username.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
Username.Position = UDim2.new(0.05, 0, 0.25, 0)
Username.Size = UDim2.new(0.9, 0, 0, 40)
Username.Font = Enum.Font.Gotham
Username.PlaceholderText = "Username or Display Name"
Username.Text = ""
Username.TextColor3 = Color3.fromRGB(220, 220, 220)
Username.TextScaled = true
Username.TextWrapped = true
Username.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)

local textBoxCorner = Instance.new("UICorner")
textBoxCorner.CornerRadius = UDim.new(0, 6)
textBoxCorner.Parent = Username

local textBoxStroke = Instance.new("UIStroke")
textBoxStroke.Parent = Username
textBoxStroke.Color = Color3.fromRGB(60, 60, 80)
textBoxStroke.Thickness = 1

local Kill = Instance.new("TextButton")
Kill.Name = "Kill"
Kill.Parent = ui
Kill.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
Kill.Position = UDim2.new(0.1, 0, 0.55, 0)
Kill.Size = UDim2.new(0.35, 0, 0, 35)
Kill.Font = Enum.Font.GothamBold
Kill.Text = "Kill"
Kill.TextColor3 = Color3.new(1, 1, 1)
Kill.TextScaled = true
Kill.TextWrapped = true

local killCorner = Instance.new("UICorner")
killCorner.CornerRadius = UDim.new(0, 6)
killCorner.Parent = Kill

local killGradient = Instance.new("UIGradient")
killGradient.Parent = Kill
killGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 150, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 200, 200))
})

local LoopKill = Instance.new("TextButton")
LoopKill.Name = "LoopKill"
LoopKill.Parent = ui
LoopKill.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
LoopKill.Position = UDim2.new(0.55, 0, 0.55, 0)
LoopKill.Size = UDim2.new(0.35, 0, 0, 35)
LoopKill.Font = Enum.Font.GothamBold
LoopKill.Text = "Loop: OFF"
LoopKill.TextColor3 = Color3.fromRGB(150, 150, 150)
LoopKill.TextScaled = true
LoopKill.TextWrapped = true

local loopCorner = Instance.new("UICorner")
loopCorner.CornerRadius = UDim.new(0, 6)
loopCorner.Parent = LoopKill

local loopStroke = Instance.new("UIStroke")
loopStroke.Parent = LoopKill
loopStroke.Color = Color3.fromRGB(60, 60, 80)
loopStroke.Thickness = 1

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Name = "StatusLabel"
StatusLabel.Parent = ui
StatusLabel.BackgroundTransparency = 1
StatusLabel.Position = UDim2.new(0.05, 0, 0.8, 0)
StatusLabel.Size = UDim2.new(0.9, 0, 0, 25)
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.Text = "Ready"
StatusLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
StatusLabel.TextScaled = true
StatusLabel.TextWrapped = true

local function highlightMatches()
    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
        if player.Character and player.Character.PrimaryPart then
            if player.Character:FindFirstChild("Highlight") then
                player.Character.Highlight:Destroy()
            end
            if Username.Text ~= "" and (string.find(player.Name:lower(), Username.Text:lower()) or
                string.find(player.DisplayName:lower(), Username.Text:lower())) then
                local highlight = Instance.new("Highlight")
                highlight.Name = "Highlight"
                highlight.Adornee = player.Character
                highlight.FillColor = Color3.fromRGB(255, 50, 50)
                highlight.FillTransparency = 0.7
                highlight.OutlineColor = Color3.fromRGB(255, 0, 0)
                highlight.OutlineTransparency = 0
                highlight.Parent = player.Character
            end
        end
    end
end

local function updateStatus(text, color)
    StatusLabel.Text = text
    StatusLabel.TextColor3 = color or Color3.fromRGB(150, 150, 150)
end

local function waitForRespawn()
    if isPlayerAlive(lp) then return true end
    updateStatus("Waiting for respawn...", Color3.fromRGB(255, 200, 50))
    local startTime = tick()
    local connection
    local respawned = false
    connection = lp.CharacterAdded:Connect(function()
        respawned = true
        if connection then connection:Disconnect() end
    end)
    while not respawned and tick() - startTime < 15 do
        task.wait(0.5)
        if isPlayerAlive(lp) then
            respawned = true
            break
        end
    end
    if connection then connection:Disconnect() end
    if respawned then
        task.wait(1)
        return true
    else
        updateStatus("Respawn timeout", Color3.fromRGB(255, 50, 50))
        return false
    end
end

local function equipAllTools()
    local character = lp.Character
    if not character then return false end
    local backpack = lp.Backpack
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        for _, tool in pairs(character:GetChildren()) do
            if tool:IsA("Tool") then
                tool.Parent = backpack
            end
        end
        for _, tool in pairs(backpack:GetChildren()) do
            if tool:IsA("Tool") then
                tool.Parent = character
            end
        end
        return true
    end
    return false
end

local function performKill()
    if killInProgress then
        updateStatus("Kill already in progress", Color3.fromRGB(255, 150, 50))
        return false
    end
    local Player = gplr(Username.Text)[1]
    if not Player then
        updateStatus("Player not found", Color3.fromRGB(255, 50, 50))
        notify("Player is not in the server.")
        return false
    end
    if not isPlayerAlive(Player) then
        updateStatus("Target is not alive", Color3.fromRGB(255, 150, 50))
        notify("Target player is not alive.")
        return false
    end
    if not isPlayerAlive(lp) then
        if not waitForRespawn() then
            updateStatus("Respawn failed", Color3.fromRGB(255, 50, 50))
            return false
        end
    end
    killInProgress = true
    updateStatus("Starting kill...", Color3.fromRGB(255, 200, 50))
    local success = false
    local maxAttempts = 3
    local attempts = 0
    while attempts < maxAttempts and not success do
        attempts += 1
        updateStatus("Attempt "..attempts.."/"..maxAttempts, Color3.fromRGB(255, 200, 50))
        local LocalPlayer = game.Players.LocalPlayer
        if not isPlayerAlive(lp) then
            updateStatus("Died before attempt, waiting...", Color3.fromRGB(255, 150, 50))
            if not waitForRespawn() then
                break
            end
        end
        local previousCFrame = LocalPlayer.Character.PrimaryPart.CFrame
        if LocalPlayer.Character and LocalPlayer.Character.PrimaryPart then
            local Character = LocalPlayer.Character
            Character.Archivable = true
            local Clone = Character:Clone()
            LocalPlayer.Character = Clone
            task.wait(0.3)
            LocalPlayer.Character = Character
            task.wait(0.15)
            if LocalPlayer.Character and Player.Character and Player.Character.PrimaryPart then
                if LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                    LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):Destroy()
                end
                local Humanoid = Instance.new("Humanoid")
                Humanoid.Parent = LocalPlayer.Character
                if not equipAllTools() then
                    updateStatus("Tool equip failed", Color3.fromRGB(255, 50, 50))
                    break
                end
                local tools = {}
                for _, tool in pairs(LocalPlayer.Character:GetChildren()) do
                    if tool:IsA("Tool") then
                        table.insert(tools, tool)
                    end
                end
                if #tools > 0 then
                    Player.Character.HumanoidRootPart.Anchored = true
                    local primaryTool = tools[1]
                    local Arm = game.Players.LocalPlayer.Character['Right Arm'].CFrame * CFrame.new(0, -1, 0, 1, 0, 0, 0, 0, 1, 0, -1, 0)
                    primaryTool.Grip = Arm:ToObjectSpace(Player.Character.PrimaryPart.CFrame):Inverse()
                    workspace.CurrentCamera.CameraSubject = primaryTool.Handle
                    local startTime = tick()
                    while primaryTool and primaryTool.Parent ~= workspace and primaryTool.Parent ~= Player.Character do
                        if tick() - startTime > 5 then
                            break
                        end
                        task.wait(0.1)
                    end
                    Player.Character.HumanoidRootPart.Anchored = false
                    task.wait(0.05)
                    Humanoid.Health = 0
                    task.wait(0.5)
                    LocalPlayer.Character = nil
                    updateStatus("Waiting for respawn...", Color3.fromRGB(255, 200, 50))
                    if not waitForRespawn() then
                        break
                    end
                    if Player.Character and Player.Character.Humanoid.Health <= 15 then
                        updateStatus("Kill successful!", Color3.fromRGB(50, 255, 50))
                        notify("Success!")
                        success = true
                    else
                        if attempts < maxAttempts then
                            updateStatus("Retrying...", Color3.fromRGB(255, 150, 50))
                            notify("Attempt "..attempts.." failed, retrying...")
                            task.wait(2)
                        else
                            updateStatus("Kill failed after "..maxAttempts.." attempts", Color3.fromRGB(255, 50, 50))
                            notify("Kill failed after "..maxAttempts.." attempts.")
                        end
                    end
                else
                    updateStatus("No tools found", Color3.fromRGB(255, 50, 50))
                    notify("Error: No tools equipped.")
                    break
                end
            else
                updateStatus("Character error", Color3.fromRGB(255, 50, 50))
                notify("Error: Character issue.")
                break
            end
        else
            updateStatus("Local player error", Color3.fromRGB(255, 50, 50))
            notify("Error: Local player issue.")
            break
        end
    end
    killInProgress = false
    return success
end

local function startLoopKill()
    if not targetPlayer then return end
    spawn(function()
        while loopKillEnabled and targetPlayer do
            if not isPlayerAlive(targetPlayer) then
                updateStatus("Waiting for target respawn...", Color3.fromRGB(255, 200, 50))
                repeat
                    task.wait(1)
                    if not loopKillEnabled or not targetPlayer then break end
                until isPlayerAlive(targetPlayer)
            end
            if not isPlayerAlive(lp) then
                updateStatus("Waiting for local respawn...", Color3.fromRGB(255, 200, 50))
                repeat
                    task.wait(1)
                    if not loopKillEnabled or not targetPlayer then break end
                until isPlayerAlive(lp)
            end
            if loopKillEnabled and targetPlayer and isPlayerAlive(targetPlayer) and isPlayerAlive(lp) and not killInProgress then
                local success = performKill()
                if not success then
                    task.wait(3)
                else
                    task.wait(1)
                end
            else
                task.wait(0.5)
            end
            task.wait(0.1)
        end
        if not loopKillEnabled then
            updateStatus("Loop kill stopped", Color3.fromRGB(150, 150, 150))
        end
    end)
end

Username:GetPropertyChangedSignal("Text"):Connect(highlightMatches)
Kill.MouseButton1Click:Connect(function()
    if not killInProgress then
        performKill()
    end
end)
LoopKill.MouseButton1Click:Connect(function()
    loopKillEnabled = not loopKillEnabled
    if loopKillEnabled then
        targetPlayer = gplr(Username.Text)[1]
        if targetPlayer then
            LoopKill.Text = "Loop: ON"
            LoopKill.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
            LoopKill.TextColor3 = Color3.fromRGB(255, 255, 255)
            updateStatus("Loop kill activated", Color3.fromRGB(255, 100, 100))
            startLoopKill()
        else
            loopKillEnabled = false
            updateStatus("Invalid target for loop", Color3.fromRGB(255, 50, 50))
        end
    else
        LoopKill.Text = "Loop: OFF"
        LoopKill.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
        LoopKill.TextColor3 = Color3.fromRGB(150, 150, 150)
        updateStatus("Loop kill deactivated", Color3.fromRGB(150, 150, 150))
        targetPlayer = nil
    end
end)
lp.CharacterAdded:Connect(function()
    if killInProgress then
        updateStatus("Respawned, continuing...", Color3.fromRGB(100, 255, 100))
    end
end)
highlightMatches()
