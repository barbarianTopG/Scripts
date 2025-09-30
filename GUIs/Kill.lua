local CollectionService = game:GetService("CollectionService");
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local lp = Players.LocalPlayer

local loopKillEnabled = false
local targetPlayer = nil
local killInProgress = false
local playerListVisible = false

local ToolKill = {};

ToolKill["ScreenGui_1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
ToolKill["ScreenGui_1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;
ToolKill["ScreenGui_1"]["ResetOnSpawn"] = false;

CollectionService:AddTag(ToolKill["ScreenGui_1"], [[main]]);

ToolKill["Frame_2"] = Instance.new("Frame", ToolKill["ScreenGui_1"]);
ToolKill["Frame_2"]["BorderSizePixel"] = 0;
ToolKill["Frame_2"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
ToolKill["Frame_2"]["Size"] = UDim2.new(0.3055, 0, 0.36783, 0);
ToolKill["Frame_2"]["Position"] = UDim2.new(0.38007, 0, 0.27162, 0);


ToolKill["FrameCorner_3"] = Instance.new("UICorner", ToolKill["Frame_2"]);
ToolKill["FrameCorner_3"]["Name"] = [[FrameCorner]];


ToolKill["Creator_4"] = Instance.new("TextLabel", ToolKill["Frame_2"]);
ToolKill["Creator_4"]["TextWrapped"] = true;
ToolKill["Creator_4"]["BorderSizePixel"] = 0;
ToolKill["Creator_4"]["TextScaled"] = true;
ToolKill["Creator_4"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
ToolKill["Creator_4"]["TextColor3"] = Color3.fromRGB(119, 0, 255);
ToolKill["Creator_4"]["Size"] = UDim2.new(0.35433, 0, 0.18462, 0);
ToolKill["Creator_4"]["Text"] = [[By StarFlow]];
ToolKill["Creator_4"]["Name"] = [[Creator]];
ToolKill["Creator_4"]["Position"] = UDim2.new(0.41732, 0, 0.01538, 0);


ToolKill["UICorner_5"] = Instance.new("UICorner", ToolKill["Creator_4"]);



ToolKill["Kill_6"] = Instance.new("TextButton", ToolKill["Frame_2"]);
ToolKill["Kill_6"]["TextWrapped"] = true;
ToolKill["Kill_6"]["BorderSizePixel"] = 0;
ToolKill["Kill_6"]["TextScaled"] = true;
ToolKill["Kill_6"]["TextColor3"] = Color3.fromRGB(119, 0, 255);
ToolKill["Kill_6"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
ToolKill["Kill_6"]["Size"] = UDim2.new(0.48819, 0, 0.29231, 0);
ToolKill["Kill_6"]["Text"] = [[Kill]];
ToolKill["Kill_6"]["Name"] = [[Kill]];
ToolKill["Kill_6"]["Position"] = UDim2.new(0.0315, 0, 0.63077, 0);


ToolKill["UICorner_7"] = Instance.new("UICorner", ToolKill["Kill_6"]);



ToolKill["ScriptName_8"] = Instance.new("TextLabel", ToolKill["Frame_2"]);
ToolKill["ScriptName_8"]["TextWrapped"] = true;
ToolKill["ScriptName_8"]["BorderSizePixel"] = 0;
ToolKill["ScriptName_8"]["TextScaled"] = true;
ToolKill["ScriptName_8"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
ToolKill["ScriptName_8"]["TextColor3"] = Color3.fromRGB(119, 0, 255);
ToolKill["ScriptName_8"]["Size"] = UDim2.new(0.37795, 0, 0.18462, 0);
ToolKill["ScriptName_8"]["Text"] = [[Kill Gui]];
ToolKill["ScriptName_8"]["Name"] = [[ScriptName]];
ToolKill["ScriptName_8"]["Position"] = UDim2.new(0.02362, 0, 0.01538, 0);


ToolKill["UICorner_9"] = Instance.new("UICorner", ToolKill["ScriptName_8"]);



ToolKill["List_a"] = Instance.new("TextButton", ToolKill["Frame_2"]);
ToolKill["List_a"]["TextWrapped"] = true;
ToolKill["List_a"]["BorderSizePixel"] = 0;
ToolKill["List_a"]["TextScaled"] = true;
ToolKill["List_a"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
ToolKill["List_a"]["Size"] = UDim2.new(0.17323, 0, 0.35385, 0);
ToolKill["List_a"]["Text"] = [[📋]];
ToolKill["List_a"]["Name"] = [[List]];
ToolKill["List_a"]["Position"] = UDim2.new(0.7874, 0, 0.23077, 0);


ToolKill["UICorner_b"] = Instance.new("UICorner", ToolKill["List_a"]);



ToolKill["FrameStroke_c"] = Instance.new("UIStroke", ToolKill["Frame_2"]);
ToolKill["FrameStroke_c"]["Name"] = [[FrameStroke]];
ToolKill["FrameStroke_c"]["Color"] = Color3.fromRGB(119, 0, 255);


ToolKill["Loop_d"] = Instance.new("TextButton", ToolKill["Frame_2"]);
ToolKill["Loop_d"]["TextWrapped"] = true;
ToolKill["Loop_d"]["BorderSizePixel"] = 0;
ToolKill["Loop_d"]["TextScaled"] = true;
ToolKill["Loop_d"]["TextColor3"] = Color3.fromRGB(119, 0, 255);
ToolKill["Loop_d"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
ToolKill["Loop_d"]["Size"] = UDim2.new(0.4252, 0, 0.29231, 0);
ToolKill["Loop_d"]["Text"] = [[Looped: false]];
ToolKill["Loop_d"]["Name"] = [[Loop]];
ToolKill["Loop_d"]["Position"] = UDim2.new(0.53543, 0, 0.63077, 0);


ToolKill["UICorner_e"] = Instance.new("UICorner", ToolKill["Loop_d"]);



ToolKill["TextBox_f"] = Instance.new("TextBox", ToolKill["Frame_2"]);
ToolKill["TextBox_f"]["CursorPosition"] = -1;
ToolKill["TextBox_f"]["BorderSizePixel"] = 0;
ToolKill["TextBox_f"]["TextWrapped"] = true;
ToolKill["TextBox_f"]["TextColor3"] = Color3.fromRGB(113, 113, 113);
ToolKill["TextBox_f"]["TextScaled"] = true;
ToolKill["TextBox_f"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
ToolKill["TextBox_f"]["PlaceholderText"] = [[DisplayName or Username]];
ToolKill["TextBox_f"]["Size"] = UDim2.new(0.74803, 0, 0.35385, 0);
ToolKill["TextBox_f"]["Position"] = UDim2.new(0.02362, 0, 0.23077, 0);
ToolKill["TextBox_f"]["Text"] = [[]];


ToolKill["UICorner_10"] = Instance.new("UICorner", ToolKill["TextBox_f"]);



ToolKill["UIDragDetector_11"] = Instance.new("UIDragDetector", ToolKill["Frame_2"]);
ToolKill["UIDragDetector_11"]["DragUDim2"] = UDim2.new(0, -1, 0, -26);


ToolKill["Close_12"] = Instance.new("TextButton", ToolKill["Frame_2"]);
ToolKill["Close_12"]["TextWrapped"] = true;
ToolKill["Close_12"]["BorderSizePixel"] = 0;
ToolKill["Close_12"]["TextScaled"] = true;
ToolKill["Close_12"]["TextColor3"] = Color3.fromRGB(119, 0, 255);
ToolKill["Close_12"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
ToolKill["Close_12"]["Size"] = UDim2.new(0.16535, 2, 0.18462, 0);
ToolKill["Close_12"]["Text"] = [[×]];
ToolKill["Close_12"]["Name"] = [[Close]];
ToolKill["Close_12"]["Position"] = UDim2.new(0.7874, 0, 0.01538, 0);


ToolKill["UICorner_13"] = Instance.new("UICorner", ToolKill["Close_12"]);



ToolKill["UIAspectRatioConstraint_14"] = Instance.new("UIAspectRatioConstraint", ToolKill["Frame_2"]);
ToolKill["UIAspectRatioConstraint_14"]["AspectRatio"] = 1.95385;

ToolKill["PlayerListFrame"] = Instance.new("Frame", ToolKill["ScreenGui_1"]);
ToolKill["PlayerListFrame"]["BorderSizePixel"] = 0;
ToolKill["PlayerListFrame"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
ToolKill["PlayerListFrame"]["Size"] = UDim2.new(0.25, 0, 0.4, 0);
ToolKill["PlayerListFrame"]["Visible"] = false;

ToolKill["PlayerListCorner"] = Instance.new("UICorner", ToolKill["PlayerListFrame"]);

ToolKill["PlayerListStroke"] = Instance.new("UIStroke", ToolKill["PlayerListFrame"]);
ToolKill["PlayerListStroke"]["Color"] = Color3.fromRGB(119, 0, 255);

ToolKill["PlayerListTitle"] = Instance.new("TextLabel", ToolKill["PlayerListFrame"]);
ToolKill["PlayerListTitle"]["TextWrapped"] = true;
ToolKill["PlayerListTitle"]["BorderSizePixel"] = 0;
ToolKill["PlayerListTitle"]["TextScaled"] = true;
ToolKill["PlayerListTitle"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
ToolKill["PlayerListTitle"]["TextColor3"] = Color3.fromRGB(119, 0, 255);
ToolKill["PlayerListTitle"]["Size"] = UDim2.new(0.9, 0, 0.1, 0);
ToolKill["PlayerListTitle"]["Text"] = [[Player List]];
ToolKill["PlayerListTitle"]["Position"] = UDim2.new(0.05, 0, 0.02, 0);

ToolKill["PlayerListUICorner"] = Instance.new("UICorner", ToolKill["PlayerListTitle"]);

ToolKill["PlayerListScrollingFrame"] = Instance.new("ScrollingFrame", ToolKill["PlayerListFrame"]);
ToolKill["PlayerListScrollingFrame"]["BorderSizePixel"] = 0;
ToolKill["PlayerListScrollingFrame"]["BackgroundColor3"] = Color3.fromRGB(20, 20, 20);
ToolKill["PlayerListScrollingFrame"]["Size"] = UDim2.new(0.9, 0, 0.8, 0);
ToolKill["PlayerListScrollingFrame"]["Position"] = UDim2.new(0.05, 0, 0.15, 0);
ToolKill["PlayerListScrollingFrame"]["ScrollBarThickness"] = 8;

ToolKill["PlayerListScrollingCorner"] = Instance.new("UICorner", ToolKill["PlayerListScrollingFrame"]);

ToolKill["PlayerListLayout"] = Instance.new("UIListLayout", ToolKill["PlayerListScrollingFrame"]);
ToolKill["PlayerListLayout"]["Padding"] = UDim.new(0, 5);

local function updatePlayerListPosition()
    local mainFrame = ToolKill["Frame_2"]
    local playerListFrame = ToolKill["PlayerListFrame"]
    
    local mainFrameRight = mainFrame.AbsolutePosition.X + mainFrame.AbsoluteSize.X
    local mainFrameTop = mainFrame.AbsolutePosition.Y
    
    playerListFrame.Position = UDim2.new(0, mainFrameRight + 10, 0, mainFrameTop)
end

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
    local scrollingFrame = ToolKill["PlayerListScrollingFrame"]
    
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
            ToolKill["TextBox_f"].Text = player.Name
            if playerListVisible then
                ToolKill["PlayerListFrame"].Visible = false
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

    local Player = gplr(ToolKill["TextBox_f"].Text)[1]
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

ToolKill["List_a"].MouseButton1Click:Connect(function()
    playerListVisible = not playerListVisible
    if playerListVisible then
        updatePlayerListPosition() 
        updatePlayerList()
        ToolKill["PlayerListFrame"].Visible = true
    else
        ToolKill["PlayerListFrame"].Visible = false
    end
end)

ToolKill["Kill_6"].MouseButton1Click:Connect(function()
    if not killInProgress then
        performKill()
    end
end)

ToolKill["Loop_d"].MouseButton1Click:Connect(function()
    loopKillEnabled = not loopKillEnabled
    if loopKillEnabled then
        targetPlayer = gplr(ToolKill["TextBox_f"].Text)[1]
        if targetPlayer then
            ToolKill["Loop_d"].Text = "Looped: true"
            ToolKill["Loop_d"].BackgroundColor3 = Color3.fromRGB(80, 0, 160)
            notify("Loop kill activated")
            startLoopKill()
        else
            loopKillEnabled = false
            notify("Invalid target for loop")
        end
    else
        ToolKill["Loop_d"].Text = "Looped: false"
        ToolKill["Loop_d"].BackgroundColor3 = Color3.fromRGB(31, 31, 31)
        notify("Loop kill deactivated")
    end
end)

ToolKill["Close_12"].MouseButton1Click:Connect(function()
    ToolKill["ScreenGui_1"]:Destroy()
end)

ToolKill["Frame_2"].Changed:Connect(function(property)
    if property == "Position" or property == "Size" then
        if playerListVisible then
            updatePlayerListPosition()
        end
    end
end)

Players.PlayerAdded:Connect(updatePlayerList)
Players.PlayerRemoving:Connect(updatePlayerList)

updatePlayerList()

return ToolKill["ScreenGui_1"], require