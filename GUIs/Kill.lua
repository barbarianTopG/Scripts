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

local KillGui = {}

KillGui["ScreenGui_1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"))
KillGui["ScreenGui_1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling
CollectionService:AddTag(KillGui["ScreenGui_1"], [[main]])

KillGui["Frame_2"] = Instance.new("Frame", KillGui["ScreenGui_1"])
KillGui["Frame_2"]["BorderSizePixel"] = 0
KillGui["Frame_2"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
KillGui["Frame_2"]["Size"] = UDim2.new(0.3055, 0, 0.36783, 0)
KillGui["Frame_2"]["Position"] = UDim2.new(0.34639, 0, 0.26597, 0)

KillGui["FrameCorner_3"] = Instance.new("UICorner", KillGui["Frame_2"])
KillGui["FrameCorner_3"]["Name"] = [[FrameCorner]]

KillGui["Creator_4"] = Instance.new("TextLabel", KillGui["Frame_2"])
KillGui["Creator_4"]["TextWrapped"] = true
KillGui["Creator_4"]["BorderSizePixel"] = 0
KillGui["Creator_4"]["TextScaled"] = true
KillGui["Creator_4"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31)
KillGui["Creator_4"]["TextColor3"] = Color3.fromRGB(119, 0, 255)
KillGui["Creator_4"]["Size"] = UDim2.new(0.56693, 0, 0.18462, 0)
KillGui["Creator_4"]["Text"] = [[Made by StarFlow]]
KillGui["Creator_4"]["Name"] = [[Creator]]
KillGui["Creator_4"]["Position"] = UDim2.new(0.4252, 0, 0.01538, 0)

KillGui["UICorner_5"] = Instance.new("UICorner", KillGui["Creator_4"])

KillGui["Kill_6"] = Instance.new("TextButton", KillGui["Frame_2"])
KillGui["Kill_6"]["TextWrapped"] = true
KillGui["Kill_6"]["BorderSizePixel"] = 0
KillGui["Kill_6"]["TextScaled"] = true
KillGui["Kill_6"]["TextColor3"] = Color3.fromRGB(119, 0, 255)
KillGui["Kill_6"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31)
KillGui["Kill_6"]["Size"] = UDim2.new(0.48819, 0, 0.29231, 0)
KillGui["Kill_6"]["Text"] = [[Kill]]
KillGui["Kill_6"]["Name"] = [[Kill]]
KillGui["Kill_6"]["Position"] = UDim2.new(0.0315, 0, 0.63077, 0)

KillGui["UICorner_7"] = Instance.new("UICorner", KillGui["Kill_6"])

KillGui["ScriptName_8"] = Instance.new("TextLabel", KillGui["Frame_2"])
KillGui["ScriptName_8"]["TextWrapped"] = true
KillGui["ScriptName_8"]["BorderSizePixel"] = 0
KillGui["ScriptName_8"]["TextScaled"] = true
KillGui["ScriptName_8"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31)
KillGui["ScriptName_8"]["TextColor3"] = Color3.fromRGB(119, 0, 255)
KillGui["ScriptName_8"]["Size"] = UDim2.new(0.40157, 0, 0.18462, 0)
KillGui["ScriptName_8"]["Text"] = [[Kill Gui]]
KillGui["ScriptName_8"]["Name"] = [[ScriptName]]
KillGui["ScriptName_8"]["Position"] = UDim2.new(0.00787, 0, 0.01538, 0)

KillGui["UICorner_9"] = Instance.new("UICorner", KillGui["ScriptName_8"])

KillGui["List_a"] = Instance.new("TextButton", KillGui["Frame_2"])
KillGui["List_a"]["TextWrapped"] = true
KillGui["List_a"]["BorderSizePixel"] = 0
KillGui["List_a"]["TextScaled"] = true
KillGui["List_a"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31)
KillGui["List_a"]["Size"] = UDim2.new(0.17323, 0, 0.30769, 0)
KillGui["List_a"]["Text"] = [[📋]]
KillGui["List_a"]["Name"] = [[List]]
KillGui["List_a"]["Position"] = UDim2.new(0.7874, 0, 0.26154, 0)

KillGui["UICorner_b"] = Instance.new("UICorner", KillGui["List_a"])

KillGui["FrameStroke_c"] = Instance.new("UIStroke", KillGui["Frame_2"])
KillGui["FrameStroke_c"]["Name"] = [[FrameStroke]]
KillGui["FrameStroke_c"]["Color"] = Color3.fromRGB(119, 0, 255)

KillGui["TextBox_d"] = Instance.new("TextBox", KillGui["Frame_2"])
KillGui["TextBox_d"]["CursorPosition"] = -1
KillGui["TextBox_d"]["BorderSizePixel"] = 0
KillGui["TextBox_d"]["TextWrapped"] = true
KillGui["TextBox_d"]["TextColor3"] = Color3.fromRGB(113, 113, 113)
KillGui["TextBox_d"]["TextScaled"] = true
KillGui["TextBox_d"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31)
KillGui["TextBox_d"]["PlaceholderText"] = [[DisplayName or Username]]
KillGui["TextBox_d"]["Size"] = UDim2.new(0.74803, 0, 0.35385, 0)
KillGui["TextBox_d"]["Position"] = UDim2.new(0.02362, 0, 0.23077, 0)
KillGui["TextBox_d"]["Text"] = [[]]

KillGui["UICorner_e"] = Instance.new("UICorner", KillGui["TextBox_d"])

KillGui["UIDragDetector_f"] = Instance.new("UIDragDetector", KillGui["Frame_2"])
KillGui["UIDragDetector_f"]["DragUDim2"] = UDim2.new(0, 23, 0, -1)

KillGui["Loop_10"] = Instance.new("TextButton", KillGui["Frame_2"])
KillGui["Loop_10"]["TextWrapped"] = true
KillGui["Loop_10"]["BorderSizePixel"] = 0
KillGui["Loop_10"]["TextScaled"] = true
KillGui["Loop_10"]["TextColor3"] = Color3.fromRGB(119, 0, 255)
KillGui["Loop_10"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31)
KillGui["Loop_10"]["Size"] = UDim2.new(0.4252, 0, 0.30769, 0)
KillGui["Loop_10"]["Text"] = [[Looped: Off]]
KillGui["Loop_10"]["Name"] = [[Loop]]
KillGui["Loop_10"]["Position"] = UDim2.new(0.53543, 0, 0.63077, 0)

KillGui["UICorner_11"] = Instance.new("UICorner", KillGui["Loop_10"])

KillGui["UIAspectRatioConstraint_12"] = Instance.new("UIAspectRatioConstraint", KillGui["Frame_2"])
KillGui["UIAspectRatioConstraint_12"]["AspectRatio"] = 1.95385

KillGui["PlayerListFrame"] = Instance.new("Frame", KillGui["ScreenGui_1"])
KillGui["PlayerListFrame"]["BorderSizePixel"] = 0
KillGui["PlayerListFrame"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
KillGui["PlayerListFrame"]["Size"] = UDim2.new(0.25, 0, 0.4, 0)
KillGui["PlayerListFrame"]["Position"] = UDim2.new(0.65, 0, 0.26597, 0)
KillGui["PlayerListFrame"]["Visible"] = false

KillGui["PlayerListCorner"] = Instance.new("UICorner", KillGui["PlayerListFrame"])

KillGui["PlayerListStroke"] = Instance.new("UIStroke", KillGui["PlayerListFrame"])
KillGui["PlayerListStroke"]["Color"] = Color3.fromRGB(119, 0, 255)

KillGui["PlayerListTitle"] = Instance.new("TextLabel", KillGui["PlayerListFrame"])
KillGui["PlayerListTitle"]["TextWrapped"] = true
KillGui["PlayerListTitle"]["BorderSizePixel"] = 0
KillGui["PlayerListTitle"]["TextScaled"] = true
KillGui["PlayerListTitle"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31)
KillGui["PlayerListTitle"]["TextColor3"] = Color3.fromRGB(119, 0, 255)
KillGui["PlayerListTitle"]["Size"] = UDim2.new(0.9, 0, 0.1, 0)
KillGui["PlayerListTitle"]["Text"] = [[Player List]]
KillGui["PlayerListTitle"]["Position"] = UDim2.new(0.05, 0, 0.02, 0)

KillGui["PlayerListUICorner"] = Instance.new("UICorner", KillGui["PlayerListTitle"])

KillGui["PlayerListScrollingFrame"] = Instance.new("ScrollingFrame", KillGui["PlayerListFrame"])
KillGui["PlayerListScrollingFrame"]["BorderSizePixel"] = 0
KillGui["PlayerListScrollingFrame"]["BackgroundColor3"] = Color3.fromRGB(20, 20, 20)
KillGui["PlayerListScrollingFrame"]["Size"] = UDim2.new(0.9, 0, 0.8, 0)
KillGui["PlayerListScrollingFrame"]["Position"] = UDim2.new(0.05, 0, 0.15, 0)
KillGui["PlayerListScrollingFrame"]["ScrollBarThickness"] = 8

KillGui["PlayerListScrollingCorner"] = Instance.new("UICorner", KillGui["PlayerListScrollingFrame"])

KillGui["PlayerListLayout"] = Instance.new("UIListLayout", KillGui["PlayerListScrollingFrame"])
KillGui["PlayerListLayout"]["Padding"] = UDim.new(0, 5)

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
    local scrollingFrame = KillGui["PlayerListScrollingFrame"]
    
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
            KillGui["TextBox_d"].Text = player.Name
            if playerListVisible then
                KillGui["PlayerListFrame"].Visible = false
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

    local Player = gplr(KillGui["TextBox_d"].Text)[1]
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

KillGui["List_a"].MouseButton1Click:Connect(function()
    playerListVisible = not playerListVisible
    KillGui["PlayerListFrame"].Visible = playerListVisible
    if playerListVisible then
        updatePlayerList()
    end
end)

KillGui["Kill_6"].MouseButton1Click:Connect(function()
    if not killInProgress then
        performKill()
    end
end)

KillGui["Loop_10"].MouseButton1Click:Connect(function()
    loopKillEnabled = not loopKillEnabled
    if loopKillEnabled then
        targetPlayer = gplr(KillGui["TextBox_d"].Text)[1]
        if targetPlayer then
            KillGui["Loop_10"].Text = "Looped: On"
            KillGui["Loop_10"].BackgroundColor3 = Color3.fromRGB(80, 0, 160)
            notify("Loop kill activated")
            startLoopKill()
        else
            loopKillEnabled = false
            notify("Invalid target for loop")
        end
    else
        KillGui["Loop_10"].Text = "Looped: Off"
        KillGui["Loop_10"].BackgroundColor3 = Color3.fromRGB(31, 31, 31)
        notify("Loop kill deactivated")
    end
end)

Players.PlayerAdded:Connect(updatePlayerList)
Players.PlayerRemoving:Connect(updatePlayerList)

updatePlayerList()

return KillGui["ScreenGui_1"], require