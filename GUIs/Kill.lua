--[=[

 d888b  db    db d888888b      .d888b.      db      db    db  .d8b.  
88' Y8b 88    88   `88'        VP  `8D      88      88    88 d8' `8b 
88      88    88    88            odD'      88      88    88 88ooo88 
88  ooo 88    88    88          .88'        88      88    88 88~~~88 
88. ~8~ 88b  d88   .88.        j88.         88booo. 88b  d88 88   88    
 Y888P  ~Y8888P' Y888888P      888888D      Y88888P ~Y8888P' YP   YP  
 
]=]

local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local lp = Players.LocalPlayer

local loopKillEnabled = false
local targetPlayer = nil
local killInProgress = false
local playerListVisible = false

local KillGUI = {}

KillGUI["ScreenGui_1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"))
KillGUI["ScreenGui_1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling
KillGUI["ScreenGui_1"]["ResetOnSpawn"] = false
CollectionService:AddTag(KillGUI["ScreenGui_1"], [[main]])

KillGUI["Frame_2"] = Instance.new("Frame", KillGUI["ScreenGui_1"])
KillGUI["Frame_2"]["BorderSizePixel"] = 0
KillGUI["Frame_2"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
KillGUI["Frame_2"]["Size"] = UDim2.new(0.3055, 0, 0.36783, 0)
KillGUI["Frame_2"]["Position"] = UDim2.new(0.34639, 0, 0.26597, 0)

KillGUI["FrameCorner_3"] = Instance.new("UICorner", KillGUI["Frame_2"])
KillGUI["FrameCorner_3"]["Name"] = [[FrameCorner]]

KillGUI["Creator_4"] = Instance.new("TextLabel", KillGUI["Frame_2"])
KillGUI["Creator_4"]["TextWrapped"] = true
KillGUI["Creator_4"]["BorderSizePixel"] = 0
KillGUI["Creator_4"]["TextScaled"] = true
KillGUI["Creator_4"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31)
KillGUI["Creator_4"]["TextColor3"] = Color3.fromRGB(119, 0, 255)
KillGUI["Creator_4"]["Size"] = UDim2.new(0.56693, 0, 0.18462, 0)
KillGUI["Creator_4"]["Text"] = [[Made by StarFlow]]
KillGUI["Creator_4"]["Name"] = [[Creator]]
KillGUI["Creator_4"]["Position"] = UDim2.new(0.4252, 0, 0.01538, 0)

KillGUI["UICorner_5"] = Instance.new("UICorner", KillGUI["Creator_4"])

KillGUI["Kill_6"] = Instance.new("TextButton", KillGUI["Frame_2"])
KillGUI["Kill_6"]["TextWrapped"] = true
KillGUI["Kill_6"]["BorderSizePixel"] = 0
KillGUI["Kill_6"]["TextScaled"] = true
KillGUI["Kill_6"]["TextColor3"] = Color3.fromRGB(119, 0, 255)
KillGUI["Kill_6"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31)
KillGUI["Kill_6"]["Size"] = UDim2.new(0.48819, 0, 0.29231, 0)
KillGUI["Kill_6"]["Text"] = [[Kill]]
KillGUI["Kill_6"]["Name"] = [[Kill]]
KillGUI["Kill_6"]["Position"] = UDim2.new(0.0315, 0, 0.63077, 0)

KillGUI["UICorner_7"] = Instance.new("UICorner", KillGUI["Kill_6"])

KillGUI["ScriptName_8"] = Instance.new("TextLabel", KillGUI["Frame_2"])
KillGUI["ScriptName_8"]["TextWrapped"] = true
KillGUI["ScriptName_8"]["BorderSizePixel"] = 0
KillGUI["ScriptName_8"]["TextScaled"] = true
KillGUI["ScriptName_8"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31)
KillGUI["ScriptName_8"]["TextColor3"] = Color3.fromRGB(119, 0, 255)
KillGUI["ScriptName_8"]["Size"] = UDim2.new(0.40157, 0, 0.18462, 0)
KillGUI["ScriptName_8"]["Text"] = [[Kill Gui]]
KillGUI["ScriptName_8"]["Name"] = [[ScriptName]]
KillGUI["ScriptName_8"]["Position"] = UDim2.new(0.00787, 0, 0.01538, 0)

KillGUI["UICorner_9"] = Instance.new("UICorner", KillGUI["ScriptName_8"])

KillGUI["List_a"] = Instance.new("TextButton", KillGUI["Frame_2"])
KillGUI["List_a"]["TextWrapped"] = true
KillGUI["List_a"]["BorderSizePixel"] = 0
KillGUI["List_a"]["TextScaled"] = true
KillGUI["List_a"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31)
KillGUI["List_a"]["Size"] = UDim2.new(0.17323, 0, 0.30769, 0)
KillGUI["List_a"]["Text"] = [[📋]]
KillGUI["List_a"]["Name"] = [[List]]
KillGUI["List_a"]["Position"] = UDim2.new(0.7874, 0, 0.26154, 0)

KillGUI["UICorner_b"] = Instance.new("UICorner", KillGUI["List_a"])

KillGUI["FrameStroke_c"] = Instance.new("UIStroke", KillGUI["Frame_2"])
KillGUI["FrameStroke_c"]["Name"] = [[FrameStroke]]
KillGUI["FrameStroke_c"]["Color"] = Color3.fromRGB(119, 0, 255)

KillGUI["TextBox_d"] = Instance.new("TextBox", KillGUI["Frame_2"])
KillGUI["TextBox_d"]["CursorPosition"] = -1
KillGUI["TextBox_d"]["BorderSizePixel"] = 0
KillGUI["TextBox_d"]["TextWrapped"] = true
KillGUI["TextBox_d"]["TextColor3"] = Color3.fromRGB(113, 113, 113)
KillGUI["TextBox_d"]["TextScaled"] = true
KillGUI["TextBox_d"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31)
KillGUI["TextBox_d"]["PlaceholderText"] = [[DisplayName or Username]]
KillGUI["TextBox_d"]["Size"] = UDim2.new(0.74803, 0, 0.35385, 0)
KillGUI["TextBox_d"]["Position"] = UDim2.new(0.02362, 0, 0.23077, 0)
KillGUI["TextBox_d"]["Text"] = [[]]

KillGUI["UICorner_e"] = Instance.new("UICorner", KillGUI["TextBox_d"])

KillGUI["UIDragDetector_f"] = Instance.new("UIDragDetector", KillGUI["Frame_2"])
KillGUI["UIDragDetector_f"]["DragUDim2"] = UDim2.new(0, 23, 0, -1)

KillGUI["Loop_10"] = Instance.new("TextButton", KillGUI["Frame_2"])
KillGUI["Loop_10"]["TextWrapped"] = true
KillGUI["Loop_10"]["BorderSizePixel"] = 0
KillGUI["Loop_10"]["TextScaled"] = true
KillGUI["Loop_10"]["TextColor3"] = Color3.fromRGB(119, 0, 255)
KillGUI["Loop_10"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31)
KillGUI["Loop_10"]["Size"] = UDim2.new(0.4252, 0, 0.30769, 0)
KillGUI["Loop_10"]["Text"] = [[Looped: false]]
KillGUI["Loop_10"]["Name"] = [[Loop]]
KillGUI["Loop_10"]["Position"] = UDim2.new(0.53543, 0, 0.63077, 0)

KillGUI["UICorner_11"] = Instance.new("UICorner", KillGUI["Loop_10"])

KillGUI["UIAspectRatioConstraint_12"] = Instance.new("UIAspectRatioConstraint", KillGUI["Frame_2"])
KillGUI["UIAspectRatioConstraint_12"]["AspectRatio"] = 1.95385

KillGUI["PlayerListFrame"] = Instance.new("Frame", KillGUI["ScreenGui_1"])
KillGUI["PlayerListFrame"]["BorderSizePixel"] = 0
KillGUI["PlayerListFrame"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
KillGUI["PlayerListFrame"]["Size"] = UDim2.new(0.25, 0, 0.4, 0)
KillGUI["PlayerListFrame"]["Position"] = UDim2.new(0.65, 0, 0.26597, 0)
KillGUI["PlayerListFrame"]["Visible"] = false

KillGUI["PlayerListCorner"] = Instance.new("UICorner", KillGUI["PlayerListFrame"])

KillGUI["PlayerListStroke"] = Instance.new("UIStroke", KillGUI["PlayerListFrame"])
KillGUI["PlayerListStroke"]["Color"] = Color3.fromRGB(119, 0, 255)

KillGUI["PlayerListTitle"] = Instance.new("TextLabel", KillGUI["PlayerListFrame"])
KillGUI["PlayerListTitle"]["TextWrapped"] = true
KillGUI["PlayerListTitle"]["BorderSizePixel"] = 0
KillGUI["PlayerListTitle"]["TextScaled"] = true
KillGUI["PlayerListTitle"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31)
KillGUI["PlayerListTitle"]["TextColor3"] = Color3.fromRGB(119, 0, 255)
KillGUI["PlayerListTitle"]["Size"] = UDim2.new(0.9, 0, 0.1, 0)
KillGUI["PlayerListTitle"]["Text"] = [[Player List]]
KillGUI["PlayerListTitle"]["Position"] = UDim2.new(0.05, 0, 0.02, 0)

KillGUI["PlayerListUICorner"] = Instance.new("UICorner", KillGUI["PlayerListTitle"])

KillGUI["PlayerListScrollingFrame"] = Instance.new("ScrollingFrame", KillGUI["PlayerListFrame"])
KillGUI["PlayerListScrollingFrame"]["BorderSizePixel"] = 0
KillGUI["PlayerListScrollingFrame"]["BackgroundColor3"] = Color3.fromRGB(20, 20, 20)
KillGUI["PlayerListScrollingFrame"]["Size"] = UDim2.new(0.9, 0, 0.8, 0)
KillGUI["PlayerListScrollingFrame"]["Position"] = UDim2.new(0.05, 0, 0.15, 0)
KillGUI["PlayerListScrollingFrame"]["ScrollBarThickness"] = 8

KillGUI["PlayerListScrollingCorner"] = Instance.new("UICorner", KillGUI["PlayerListScrollingFrame"])

KillGUI["PlayerListLayout"] = Instance.new("UIListLayout", KillGUI["PlayerListScrollingFrame"])
KillGUI["PlayerListLayout"]["Padding"] = UDim.new(0, 5)

local function gplr(String)
    local Found = {}
    local strl = String:lower()
    if strl == "all" then
        for i,v in pairs(Players:GetPlayers()) do
            table.insert(Found,v)
        end
    elseif strl == "others" then
        for i,v in pairs(Players:GetPlayers()) do
            if v.Name ~= lp.Name then
                table.insert(Found,v)
            end
        end
    elseif strl == "me" then
        for i,v in pairs(Players:GetPlayers()) do
            if v.Name == lp.Name then
                table.insert(Found,v)
            end
        end
    else
        for i,v in pairs(Players:GetPlayers()) do
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
        Title = "★ Kill Gui ★",
        Text = text,
        Duration = 3,
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

local function updatePlayerList()
    local scrollingFrame = KillGUI["PlayerListScrollingFrame"]
    
    for _, child in pairs(scrollingFrame:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end
    
    for _, player in pairs(Players:GetPlayers()) do
        local playerButton = Instance.new("TextButton")
        playerButton.Name = player.Name
        playerButton.Parent = scrollingFrame
        playerButton.Size = UDim2.new(0.95, 0, 0, 30)
        playerButton.Position = UDim2.new(0.025, 0, 0, 0)
        playerButton.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
        playerButton.BorderSizePixel = 0
        playerButton.TextColor3 = Color3.fromRGB(200, 200, 200)
        playerButton.TextScaled = true
        playerButton.TextWrapped = true
        
        local displayText = player.DisplayName ~= player.Name and player.DisplayName .. " (@" .. player.Name .. ")" or player.Name
        playerButton.Text = displayText
        
        local corner = Instance.new("UICorner")
        corner.Parent = playerButton
        
        playerButton.MouseButton1Click:Connect(function()
            KillGUI["TextBox_d"].Text = player.Name
            if playerListVisible then
                KillGUI["PlayerListFrame"].Visible = false
                playerListVisible = false
            end
        end)
    end
    
    local playerCount = #Players:GetPlayers()
    scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, playerCount * 35)
end

local function performKill()
    if killInProgress then
        notify("Kill already in progress")
        return false
    end

    local Player = gplr(KillGUI["TextBox_d"].Text)[1]
    if not Player then
        notify("Player not found")
        return false
    end

    if not isPlayerAlive(Player) then
        notify("Target is not alive")
        return false
    end

    if not isPlayerAlive(lp) then
        notify("Please wait for respawn")
        return false
    end

    killInProgress = true

    local LocalPlayer = game.Players.LocalPlayer
    if LocalPlayer.Character and LocalPlayer.Character.PrimaryPart then
        local Character = LocalPlayer.Character
        local previous = LocalPlayer.Character.PrimaryPart.CFrame
        Character.Archivable = true
        local Clone = Character:Clone()
        LocalPlayer.Character = Clone
        task.wait(0.5)
        LocalPlayer.Character = Character
        task.wait(0.2)

        if LocalPlayer.Character and Player.Character and Player.Character.PrimaryPart then
            if LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):Destroy()
            end
            local Humanoid = Instance.new("Humanoid")
            Humanoid.Parent = LocalPlayer.Character

            local Tool = nil
            if LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                Tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
            elseif LocalPlayer.Backpack and LocalPlayer.Backpack:FindFirstChildOfClass("Tool") then
                Tool = LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
            end

            if Tool ~= nil then
                Tool.Parent = LocalPlayer.Backpack
                Player.Character.HumanoidRootPart.Anchored = true
                local Arm = game.Players.LocalPlayer.Character['Right Arm'].CFrame * CFrame.new(0, -1, 0, 1, 0, 0, 0, 0, 1, 0, -1, 0)
                Tool.Grip = Arm:ToObjectSpace(Player.Character.PrimaryPart.CFrame):Inverse()
                Tool.Parent = LocalPlayer.Character
                workspace.CurrentCamera.CameraSubject = Tool.Handle
                repeat task.wait() until not Tool or (Tool.Parent == workspace or Tool.Parent == Player.Character)
                Player.Character.HumanoidRootPart.Anchored = false
                task.wait(0.1)
                Humanoid.Health = 0
                LocalPlayer.Character = nil

                spawn(function()
                    LocalPlayer.CharacterAdded:Wait()
                    Player.Character.HumanoidRootPart.Anchored = false
                    if Player.Character.Humanoid.Health <= 15 then
                        notify("Kill successful!")
                        repeat task.wait() until LocalPlayer.Character and LocalPlayer.Character.PrimaryPart
                        task.wait(0.4)
                        LocalPlayer.Character:SetPrimaryPartCFrame(previous)
                    else
                        notify("Kill failed")
                    end
                    killInProgress = false
                end)
            else
                notify("No tool found")
                killInProgress = false
            end
        else
            notify("Character error")
            killInProgress = false
        end
    else
        notify("Local player error")
        killInProgress = false
    end
end

local function startLoopKill()
    if not targetPlayer then return end

    spawn(function()
        while loopKillEnabled and targetPlayer do
            if not isPlayerAlive(targetPlayer) then
                repeat task.wait(1) until isPlayerAlive(targetPlayer) or not loopKillEnabled or not targetPlayer
            end

            if not isPlayerAlive(lp) then
                repeat task.wait(1) until isPlayerAlive(lp) or not loopKillEnabled or not targetPlayer
            end

            if loopKillEnabled and targetPlayer and isPlayerAlive(targetPlayer) and isPlayerAlive(lp) and not killInProgress then
                performKill()
            end

            task.wait(2)
        end
    end)
end

KillGUI["List_a"].MouseButton1Click:Connect(function()
    playerListVisible = not playerListVisible
    KillGUI["PlayerListFrame"].Visible = playerListVisible
    if playerListVisible then
        updatePlayerList()
    end
end)

KillGUI["Kill_6"].MouseButton1Click:Connect(function()
    if not killInProgress then
        performKill()
    end
end)

KillGUI["Loop_10"].MouseButton1Click:Connect(function()
    loopKillEnabled = not loopKillEnabled
    if loopKillEnabled then
        targetPlayer = gplr(KillGUI["TextBox_d"].Text)[1]
        if targetPlayer then
            KillGUI["Loop_10"].Text = "Looped: true"
            KillGUI["Loop_10"].BackgroundColor3 = Color3.fromRGB(80, 0, 160)
            notify("Loop kill activated")
            startLoopKill()
        else
            loopKillEnabled = false
            notify("Invalid target for loop")
        end
    else
        KillGUI["Loop_10"].Text = "Looped: Off"
        KillGUI["Loop_10"].BackgroundColor3 = Color3.fromRGB(31, 31, 31)
        notify("Loop kill deactivated")
    end
end)

Players.PlayerAdded:Connect(updatePlayerList)
Players.PlayerRemoving:Connect(updatePlayerList)

updatePlayerList()

return KillGUI["ScreenGui_1"], require