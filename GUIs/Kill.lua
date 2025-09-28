--[=[
 d888b  db    db d888888b      .d888b.      db      db    db  .d8b.  
88' Y8b 88    88   `88'        VP  `8D      88      88    88 d8' `8b 
88      88    88    88            odD'      88      88    88 88ooo88 
88  ooo 88    88    88          .88'        88      88    88 88~~~88 
88. ~8~ 88b  d88   .88.        j88.         88booo. 88b  d88 88   88    
 Y888P  ~Y8888P' Y888888P      888888D      Y88888P ~Y8888P' YP   YP  
]=]

local CollectionService = game:GetService("CollectionService");
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local lp = Players.LocalPlayer

local loopKillEnabled = false
local targetPlayer = nil
local killInProgress = false
local playerListVisible = false

local G2L = {};

G2L["ScreenGui_1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
G2L["ScreenGui_1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;
G2L["ScreenGui_1"]["ResetOnSpawn"] = false;

CollectionService:AddTag(G2L["ScreenGui_1"], [[main]]);

G2L["Frame_2"] = Instance.new("Frame", G2L["ScreenGui_1"]);
G2L["Frame_2"]["BorderSizePixel"] = 0;
G2L["Frame_2"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["Frame_2"]["Size"] = UDim2.new(0.3055, 0, 0.36783, 0);
G2L["Frame_2"]["Position"] = UDim2.new(0.36924, 0, 0.21221, 0);


G2L["FrameCorner_3"] = Instance.new("UICorner", G2L["Frame_2"]);
G2L["FrameCorner_3"]["Name"] = [[FrameCorner]];


G2L["Creator_4"] = Instance.new("TextLabel", G2L["Frame_2"]);
G2L["Creator_4"]["TextWrapped"] = true;
G2L["Creator_4"]["BorderSizePixel"] = 0;
G2L["Creator_4"]["TextScaled"] = true;
G2L["Creator_4"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
G2L["Creator_4"]["TextColor3"] = Color3.fromRGB(119, 0, 255);
G2L["Creator_4"]["Size"] = UDim2.new(0.58268, 0, 0.18462, 0);
G2L["Creator_4"]["Text"] = [[Made by StarFlow]];
G2L["Creator_4"]["Name"] = [[Creator]];
G2L["Creator_4"]["Position"] = UDim2.new(0.29921, 0, 0.01538, 0);


G2L["UICorner_5"] = Instance.new("UICorner", G2L["Creator_4"]);



G2L["Kill_6"] = Instance.new("TextButton", G2L["Frame_2"]);
G2L["Kill_6"]["TextWrapped"] = true;
G2L["Kill_6"]["BorderSizePixel"] = 0;
G2L["Kill_6"]["TextScaled"] = true;
G2L["Kill_6"]["TextColor3"] = Color3.fromRGB(119, 0, 255);
G2L["Kill_6"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
G2L["Kill_6"]["Size"] = UDim2.new(0.48819, 0, 0.29231, 0);
G2L["Kill_6"]["Text"] = [[Kill]];
G2L["Kill_6"]["Name"] = [[Kill]];
G2L["Kill_6"]["Position"] = UDim2.new(0.0315, 0, 0.63077, 0);


G2L["UICorner_7"] = Instance.new("UICorner", G2L["Kill_6"]);



G2L["ScriptName_8"] = Instance.new("TextLabel", G2L["Frame_2"]);
G2L["ScriptName_8"]["TextWrapped"] = true;
G2L["ScriptName_8"]["BorderSizePixel"] = 0;
G2L["ScriptName_8"]["TextScaled"] = true;
G2L["ScriptName_8"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
G2L["ScriptName_8"]["TextColor3"] = Color3.fromRGB(119, 0, 255);
G2L["ScriptName_8"]["Size"] = UDim2.new(0.28346, 0, 0.18462, 0);
G2L["ScriptName_8"]["Text"] = [[Kill Gui]];
G2L["ScriptName_8"]["Name"] = [[ScriptName]];
G2L["ScriptName_8"]["Position"] = UDim2.new(0.00787, 0, 0.01538, 0);


G2L["UICorner_9"] = Instance.new("UICorner", G2L["ScriptName_8"]);



G2L["List_a"] = Instance.new("TextButton", G2L["Frame_2"]);
G2L["List_a"]["TextWrapped"] = true;
G2L["List_a"]["BorderSizePixel"] = 0;
G2L["List_a"]["TextScaled"] = true;
G2L["List_a"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
G2L["List_a"]["Size"] = UDim2.new(0.17323, 0, 0.30769, 0);
G2L["List_a"]["Text"] = [[📋]];
G2L["List_a"]["Name"] = [[List]];
G2L["List_a"]["Position"] = UDim2.new(0.7874, 0, 0.26154, 0);


G2L["UICorner_b"] = Instance.new("UICorner", G2L["List_a"]);



G2L["FrameStroke_c"] = Instance.new("UIStroke", G2L["Frame_2"]);
G2L["FrameStroke_c"]["Name"] = [[FrameStroke]];
G2L["FrameStroke_c"]["Color"] = Color3.fromRGB(119, 0, 255);


G2L["Loop_d"] = Instance.new("TextButton", G2L["Frame_2"]);
G2L["Loop_d"]["TextWrapped"] = true;
G2L["Loop_d"]["BorderSizePixel"] = 0;
G2L["Loop_d"]["TextScaled"] = true;
G2L["Loop_d"]["TextColor3"] = Color3.fromRGB(119, 0, 255);
G2L["Loop_d"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
G2L["Loop_d"]["Size"] = UDim2.new(0.4252, 0, 0.30769, 0);
G2L["Loop_d"]["Text"] = [[Looped: false]];
G2L["Loop_d"]["Name"] = [[Loop]];
G2L["Loop_d"]["Position"] = UDim2.new(0.53543, 0, 0.63077, 0);


G2L["UICorner_e"] = Instance.new("UICorner", G2L["Loop_d"]);



G2L["TextBox_f"] = Instance.new("TextBox", G2L["Frame_2"]);
G2L["TextBox_f"]["CursorPosition"] = -1;
G2L["TextBox_f"]["BorderSizePixel"] = 0;
G2L["TextBox_f"]["TextWrapped"] = true;
G2L["TextBox_f"]["TextColor3"] = Color3.fromRGB(113, 113, 113);
G2L["TextBox_f"]["TextScaled"] = true;
G2L["TextBox_f"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
G2L["TextBox_f"]["PlaceholderText"] = [[DisplayName or Username]];
G2L["TextBox_f"]["Size"] = UDim2.new(0.74803, 0, 0.35385, 0);
G2L["TextBox_f"]["Position"] = UDim2.new(0.02362, 0, 0.23077, 0);
G2L["TextBox_f"]["Text"] = [[]];


G2L["UICorner_10"] = Instance.new("UICorner", G2L["TextBox_f"]);



G2L["UIDragDetector_11"] = Instance.new("UIDragDetector", G2L["Frame_2"]);
G2L["UIDragDetector_11"]["DragUDim2"] = UDim2.new(0, -35, 0, 28);


G2L["TextButton_12"] = Instance.new("TextButton", G2L["Frame_2"]);
G2L["TextButton_12"]["TextWrapped"] = true;
G2L["TextButton_12"]["BorderSizePixel"] = 0;
G2L["TextButton_12"]["TextScaled"] = true;
G2L["TextButton_12"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["TextButton_12"]["BackgroundColor3"] = Color3.fromRGB(119, 0, 255);
G2L["TextButton_12"]["Size"] = UDim2.new(0.10236, 0, 0.2, 0);
G2L["TextButton_12"]["Text"] = [[×]];
G2L["TextButton_12"]["Position"] = UDim2.new(0.88189, 0, 0.01538, 0);


G2L["UICorner_13"] = Instance.new("UICorner", G2L["TextButton_12"]);



G2L["UIAspectRatioConstraint_14"] = Instance.new("UIAspectRatioConstraint", G2L["Frame_2"]);
G2L["UIAspectRatioConstraint_14"]["AspectRatio"] = 1.95385;

G2L["PlayerListFrame"] = Instance.new("Frame", G2L["ScreenGui_1"]);
G2L["PlayerListFrame"]["BorderSizePixel"] = 0;
G2L["PlayerListFrame"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["PlayerListFrame"]["Size"] = UDim2.new(0.25, 0, 0.4, 0);
G2L["PlayerListFrame"]["Position"] = UDim2.new(0.65, 0, 0.26597, 0);
G2L["PlayerListFrame"]["Visible"] = false;

G2L["PlayerListCorner"] = Instance.new("UICorner", G2L["PlayerListFrame"]);

G2L["PlayerListStroke"] = Instance.new("UIStroke", G2L["PlayerListFrame"]);
G2L["PlayerListStroke"]["Color"] = Color3.fromRGB(119, 0, 255);

G2L["PlayerListTitle"] = Instance.new("TextLabel", G2L["PlayerListFrame"]);
G2L["PlayerListTitle"]["TextWrapped"] = true;
G2L["PlayerListTitle"]["BorderSizePixel"] = 0;
G2L["PlayerListTitle"]["TextScaled"] = true;
G2L["PlayerListTitle"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
G2L["PlayerListTitle"]["TextColor3"] = Color3.fromRGB(119, 0, 255);
G2L["PlayerListTitle"]["Size"] = UDim2.new(0.9, 0, 0.1, 0);
G2L["PlayerListTitle"]["Text"] = [[Player List]];
G2L["PlayerListTitle"]["Position"] = UDim2.new(0.05, 0, 0.02, 0);

G2L["PlayerListUICorner"] = Instance.new("UICorner", G2L["PlayerListTitle"]);

G2L["PlayerListScrollingFrame"] = Instance.new("ScrollingFrame", G2L["PlayerListFrame"]);
G2L["PlayerListScrollingFrame"]["BorderSizePixel"] = 0;
G2L["PlayerListScrollingFrame"]["BackgroundColor3"] = Color3.fromRGB(20, 20, 20);
G2L["PlayerListScrollingFrame"]["Size"] = UDim2.new(0.9, 0, 0.8, 0);
G2L["PlayerListScrollingFrame"]["Position"] = UDim2.new(0.05, 0, 0.15, 0);
G2L["PlayerListScrollingFrame"]["ScrollBarThickness"] = 8;

G2L["PlayerListScrollingCorner"] = Instance.new("UICorner", G2L["PlayerListScrollingFrame"]);

G2L["PlayerListLayout"] = Instance.new("UIListLayout", G2L["PlayerListScrollingFrame"]);
G2L["PlayerListLayout"]["Padding"] = UDim.new(0, 5);

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
    local scrollingFrame = G2L["PlayerListScrollingFrame"]
    
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
            G2L["TextBox_f"].Text = player.Name
            if playerListVisible then
                G2L["PlayerListFrame"].Visible = false
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

    local Player = gplr(G2L["TextBox_f"].Text)[1]
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

G2L["List_a"].MouseButton1Click:Connect(function()
    playerListVisible = not playerListVisible
    G2L["PlayerListFrame"].Visible = playerListVisible
    if playerListVisible then
        updatePlayerList()
    end
end)

G2L["Kill_6"].MouseButton1Click:Connect(function()
    if not killInProgress then
        performKill()
    end
end)

G2L["Loop_d"].MouseButton1Click:Connect(function()
    loopKillEnabled = not loopKillEnabled
    if loopKillEnabled then
        targetPlayer = gplr(G2L["TextBox_f"].Text)[1]
        if targetPlayer then
            G2L["Loop_d"].Text = "Looped: true"
            G2L["Loop_d"].BackgroundColor3 = Color3.fromRGB(80, 0, 160)
            notify("Loop kill activated")
            startLoopKill()
        else
            loopKillEnabled = false
            notify("Invalid target for loop")
        end
    else
        G2L["Loop_d"].Text = "Looped: false"
        G2L["Loop_d"].BackgroundColor3 = Color3.fromRGB(31, 31, 31)
        notify("Loop kill deactivated")
    end
end)

G2L["TextButton_12"].MouseButton1Click:Connect(function()
    G2L["ScreenGui_1"]:Destroy()
end)

Players.PlayerAdded:Connect(updatePlayerList)
Players.PlayerRemoving:Connect(updatePlayerList)

updatePlayerList()

return G2L["ScreenGui_1"], require