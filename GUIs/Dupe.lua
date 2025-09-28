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
local TextChatService = game:GetService("TextChatService")
local StarterGui = game:GetService("StarterGui")

local lp = Players.LocalPlayer
local textChatEnabled = true

local DupeGUI = {};

DupeGUI["ScreenGui_1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
DupeGUI["ScreenGui_1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;
DupeGUI["ScreenGui_1"]["Name"] = "StarFlowDupeGUI"

CollectionService:AddTag(DupeGUI["ScreenGui_1"], [[main]]);

DupeGUI["Frame_2"] = Instance.new("Frame", DupeGUI["ScreenGui_1"]);
DupeGUI["Frame_2"]["BorderSizePixel"] = 0;
DupeGUI["Frame_2"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
DupeGUI["Frame_2"]["Size"] = UDim2.new(0.3055, 0, 0.36783, 0);
DupeGUI["Frame_2"]["Position"] = UDim2.new(0.34038, 0, 0.24616, 0);
DupeGUI["Frame_2"]["Active"] = true
DupeGUI["Frame_2"]["Draggable"] = true


DupeGUI["FrameCorner_3"] = Instance.new("UICorner", DupeGUI["Frame_2"]);
DupeGUI["FrameCorner_3"]["Name"] = [[FrameCorner]];


DupeGUI["Creator_4"] = Instance.new("TextLabel", DupeGUI["Frame_2"]);
DupeGUI["Creator_4"]["TextWrapped"] = true;
DupeGUI["Creator_4"]["BorderSizePixel"] = 0;
DupeGUI["Creator_4"]["TextScaled"] = true;
DupeGUI["Creator_4"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
DupeGUI["Creator_4"]["TextColor3"] = Color3.fromRGB(62, 255, 0);
DupeGUI["Creator_4"]["Size"] = UDim2.new(0.43307, 0, 0.16923, 0);
DupeGUI["Creator_4"]["Text"] = [[By StarFlow]];
DupeGUI["Creator_4"]["Name"] = [[Creator]];
DupeGUI["Creator_4"]["Position"] = UDim2.new(0.41732, 0, 0.03077, 0);


DupeGUI["UICorner_5"] = Instance.new("UICorner", DupeGUI["Creator_4"]);



DupeGUI["Dupe_6"] = Instance.new("TextButton", DupeGUI["Frame_2"]);
DupeGUI["Dupe_6"]["TextWrapped"] = true;
DupeGUI["Dupe_6"]["BorderSizePixel"] = 0;
DupeGUI["Dupe_6"]["TextScaled"] = true;
DupeGUI["Dupe_6"]["TextColor3"] = Color3.fromRGB(62, 255, 0);
DupeGUI["Dupe_6"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
DupeGUI["Dupe_6"]["Size"] = UDim2.new(0.49606, 0, 0.32308, 0);
DupeGUI["Dupe_6"]["Text"] = [[Dupe]];
DupeGUI["Dupe_6"]["Name"] = [[Dupe]];
DupeGUI["Dupe_6"]["Position"] = UDim2.new(0.0315, 0, 0.63077, 0);


DupeGUI["UICorner_7"] = Instance.new("UICorner", DupeGUI["Dupe_6"]);



DupeGUI["ScriptName_8"] = Instance.new("TextLabel", DupeGUI["Frame_2"]);
DupeGUI["ScriptName_8"]["TextWrapped"] = true;
DupeGUI["ScriptName_8"]["BorderSizePixel"] = 0;
DupeGUI["ScriptName_8"]["TextScaled"] = true;
DupeGUI["ScriptName_8"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
DupeGUI["ScriptName_8"]["TextColor3"] = Color3.fromRGB(62, 255, 0);
DupeGUI["ScriptName_8"]["Size"] = UDim2.new(0.38583, 0, 0.18462, 0);
DupeGUI["ScriptName_8"]["Text"] = [[Dupe GUI]];
DupeGUI["ScriptName_8"]["Name"] = [[ScriptName]];
DupeGUI["ScriptName_8"]["Position"] = UDim2.new(0.02362, 0, 0.01538, 0);


DupeGUI["UICorner_9"] = Instance.new("UICorner", DupeGUI["ScriptName_8"]);



DupeGUI["List_a"] = Instance.new("TextButton", DupeGUI["Frame_2"]);
DupeGUI["List_a"]["TextWrapped"] = true;
DupeGUI["List_a"]["BorderSizePixel"] = 0;
DupeGUI["List_a"]["TextScaled"] = true;
DupeGUI["List_a"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
DupeGUI["List_a"]["Size"] = UDim2.new(0.17323, 0, 0.30769, 0);
DupeGUI["List_a"]["Text"] = [[📋]];
DupeGUI["List_a"]["Name"] = [[List]];
DupeGUI["List_a"]["Position"] = UDim2.new(0.7874, 0, 0.26154, 0);


DupeGUI["UICorner_b"] = Instance.new("UICorner", DupeGUI["List_a"]);



DupeGUI["FrameStroke_c"] = Instance.new("UIStroke", DupeGUI["Frame_2"]);
DupeGUI["FrameStroke_c"]["Name"] = [[FrameStroke]];
DupeGUI["FrameStroke_c"]["Color"] = Color3.fromRGB(62, 255, 0);


DupeGUI["TextBox_d"] = Instance.new("TextBox", DupeGUI["Frame_2"]);
DupeGUI["TextBox_d"]["CursorPosition"] = -1;
DupeGUI["TextBox_d"]["BorderSizePixel"] = 0;
DupeGUI["TextBox_d"]["TextWrapped"] = true;
DupeGUI["TextBox_d"]["TextColor3"] = Color3.fromRGB(113, 113, 113);
DupeGUI["TextBox_d"]["TextScaled"] = true;
DupeGUI["TextBox_d"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
DupeGUI["TextBox_d"]["PlaceholderText"] = [[DisplayName or Username]];
DupeGUI["TextBox_d"]["Size"] = UDim2.new(0.74803, 0, 0.35385, 0);
DupeGUI["TextBox_d"]["Position"] = UDim2.new(0.02362, 0, 0.23077, 0);
DupeGUI["TextBox_d"]["Text"] = [[]];
DupeGUI["TextBox_d"]["ClearTextOnFocus"] = false


DupeGUI["UICorner_e"] = Instance.new("UICorner", DupeGUI["TextBox_d"]);



DupeGUI["UIDragDetector_f"] = Instance.new("UIDragDetector", DupeGUI["Frame_2"]);



DupeGUI["Close_10"] = Instance.new("TextButton", DupeGUI["Frame_2"]);
DupeGUI["Close_10"]["TextWrapped"] = true;
DupeGUI["Close_10"]["BorderSizePixel"] = 0;
DupeGUI["Close_10"]["TextScaled"] = true;
DupeGUI["Close_10"]["TextColor3"] = Color3.fromRGB(62, 255, 0);
DupeGUI["Close_10"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
DupeGUI["Close_10"]["Size"] = UDim2.new(0.09449, 0, 0.16923, 0);
DupeGUI["Close_10"]["Text"] = [[×]];
DupeGUI["Close_10"]["Name"] = [[Close]];
DupeGUI["Close_10"]["Position"] = UDim2.new(0.86614, 0, 0.03077, 0);


DupeGUI["UICorner_11"] = Instance.new("UICorner", DupeGUI["Close_10"]);



DupeGUI["Send_12"] = Instance.new("TextButton", DupeGUI["Frame_2"]);
DupeGUI["Send_12"]["TextWrapped"] = true;
DupeGUI["Send_12"]["BorderSizePixel"] = 0;
DupeGUI["Send_12"]["TextScaled"] = true;
DupeGUI["Send_12"]["TextColor3"] = Color3.fromRGB(62, 255, 0);
DupeGUI["Send_12"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
DupeGUI["Send_12"]["Size"] = UDim2.new(0.41732, 0, 0.32308, 0);
DupeGUI["Send_12"]["Text"] = [[Send: ON]];
DupeGUI["Send_12"]["Name"] = [[Send]];
DupeGUI["Send_12"]["Position"] = UDim2.new(0.54331, 0, 0.63077, 0);


DupeGUI["UICorner_13"] = Instance.new("UICorner", DupeGUI["Send_12"]);



DupeGUI["UIAspectRatioConstraint_14"] = Instance.new("UIAspectRatioConstraint", DupeGUI["Frame_2"]);
DupeGUI["UIAspectRatioConstraint_14"]["AspectRatio"] = 1.95385;

DupeGUI["PlayerListBG"] = Instance.new("Frame", DupeGUI["ScreenGui_1"])
DupeGUI["PlayerListBG"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
DupeGUI["PlayerListBG"]["Size"] = UDim2.new(0.25, 0, 0.4, 0)
DupeGUI["PlayerListBG"]["Position"] = UDim2.new(0.65, 0, 0.24616, 0)
DupeGUI["PlayerListBG"]["BorderSizePixel"] = 0
DupeGUI["PlayerListBG"]["Visible"] = false

DupeGUI["PlayerListCorner"] = Instance.new("UICorner", DupeGUI["PlayerListBG"])
DupeGUI["PlayerListStroke"] = Instance.new("UIStroke", DupeGUI["PlayerListBG"])
DupeGUI["PlayerListStroke"]["Color"] = Color3.fromRGB(62, 255, 0)

DupeGUI["PlayerListTitle"] = Instance.new("TextLabel", DupeGUI["PlayerListBG"])
DupeGUI["PlayerListTitle"]["TextWrapped"] = true
DupeGUI["PlayerListTitle"]["BorderSizePixel"] = 0
DupeGUI["PlayerListTitle"]["TextScaled"] = true
DupeGUI["PlayerListTitle"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31)
DupeGUI["PlayerListTitle"]["TextColor3"] = Color3.fromRGB(62, 255, 0)
DupeGUI["PlayerListTitle"]["Size"] = UDim2.new(1, 0, 0.1, 0)
DupeGUI["PlayerListTitle"]["Text"] = "Player List"
DupeGUI["PlayerListTitle"]["Name"] = "PlayerListTitle"

DupeGUI["PlayerListUICorner"] = Instance.new("UICorner", DupeGUI["PlayerListTitle"])

DupeGUI["ScrollingFrame"] = Instance.new("ScrollingFrame", DupeGUI["PlayerListBG"])
DupeGUI["ScrollingFrame"]["BackgroundTransparency"] = 1
DupeGUI["ScrollingFrame"]["Size"] = UDim2.new(1, 0, 0.9, 0)
DupeGUI["ScrollingFrame"]["Position"] = UDim2.new(0, 0, 0.1, 0)
DupeGUI["ScrollingFrame"]["ScrollBarThickness"] = 5
DupeGUI["ScrollingFrame"]["CanvasSize"] = UDim2.new(0, 0, 0, 0)

DupeGUI["UIListLayout"] = Instance.new("UIListLayout", DupeGUI["ScrollingFrame"])
DupeGUI["UIListLayout"]["SortOrder"] = Enum.SortOrder.LayoutOrder
DupeGUI["UIListLayout"]["Padding"] = UDim.new(0, 2)

local function gplr(String)
    local Found = {}
    local strl = String:lower()
    
    if strl == "all" then
        for i, v in pairs(Players:GetPlayers()) do
            table.insert(Found, v)
        end
    elseif strl == "others" then
        for i, v in pairs(Players:GetPlayers()) do
            if v.Name ~= lp.Name then
                table.insert(Found, v)
            end
        end
    elseif strl == "me" then
        for i, v in pairs(Players:GetPlayers()) do
            if v.Name == lp.Name then
                table.insert(Found, v)
            end
        end
    else
        for i, v in pairs(Players:GetPlayers()) do
            if v.Name:lower():sub(1, #String) == String:lower() or 
               (v.DisplayName and v.DisplayName:lower():sub(1, #String) == String:lower()) then
                table.insert(Found, v)
            end
        end
    end
    return Found
end

local function notify(text)
    StarterGui:SetCore("SendNotification", {
        Title = "• Dupe GUI •",
        Text = text,
        Duration = 3,
    })
end

local function highlightMatches()
    for _, player in pairs(Players:GetPlayers()) do
        if player.Character and player.Character.PrimaryPart then
            if player.Character:FindFirstChild("Highlight") then
                player.Character.Highlight:Destroy()
            end
            local text = DupeGUI["TextBox_d"].Text
            if text ~= "" and (string.find(player.Name:lower(), text:lower()) or 
                              (player.DisplayName and string.find(player.DisplayName:lower(), text:lower()))) then
                local highlight = Instance.new("Highlight")
                highlight.Name = "Highlight"
                highlight.Adornee = player.Character
                highlight.FillColor = Color3.fromRGB(255, 0, 0)
                highlight.FillTransparency = 0.5
                highlight.OutlineColor = Color3.fromRGB(62, 255, 0)
                highlight.OutlineTransparency = 0
                highlight.Parent = player.Character
            end
        end
    end
end

local function updatePlayerList()
    for _, child in pairs(DupeGUI["ScrollingFrame"]:GetChildren()) do
        if child:IsA("TextButton") then 
            child:Destroy() 
        end
    end
    
    local totalHeight = 0
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= lp then
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1, 0, 0, 30)
            btn.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
            btn.TextColor3 = Color3.fromRGB(62, 255, 0)
            btn.Font = Enum.Font.SourceSans
            btn.TextSize = 14
            btn.TextScaled = true
            btn.TextWrapped = true
            btn.Text = player.DisplayName .. " (@" .. player.Name .. ")"
            
            local btnCorner = Instance.new("UICorner")
            btnCorner.Parent = btn
            
            btn.Parent = DupeGUI["ScrollingFrame"]
            btn.MouseButton1Click:Connect(function()
                DupeGUI["TextBox_d"].Text = player.Name
                DupeGUI["PlayerListBG"].Visible = false
                highlightMatches()
            end)
            
            totalHeight = totalHeight + 32
        end
    end
    
    DupeGUI["ScrollingFrame"].CanvasSize = UDim2.new(0, 0, 0, totalHeight)
end

DupeGUI["TextBox_d"]:GetPropertyChangedSignal("Text"):Connect(highlightMatches)

Players.PlayerAdded:Connect(function()
    updatePlayerList()
    highlightMatches()
end)

Players.PlayerRemoving:Connect(function()
    updatePlayerList()
    highlightMatches()
end)

DupeGUI["List_a"].MouseButton1Click:Connect(function()
    DupeGUI["PlayerListBG"].Visible = not DupeGUI["PlayerListBG"].Visible
    if DupeGUI["PlayerListBG"].Visible then
        updatePlayerList()
    end
end)

DupeGUI["Send_12"].MouseButton1Click:Connect(function()
    textChatEnabled = not textChatEnabled
    DupeGUI["Send_12"].Text = textChatEnabled and "Send: ON" or "Send: OFF"
    DupeGUI["Send_12"].BackgroundColor3 = textChatEnabled and Color3.fromRGB(31, 31, 31) or Color3.fromRGB(50, 0, 0)
end)

DupeGUI["Dupe_6"].MouseButton1Click:Connect(function()
    local targetText = DupeGUI["TextBox_d"].Text
    if targetText == "" then
        notify("Enter a username or display name first!")
        return
    end
    
    local Player = gplr(targetText)[1]
    if Player then
        local currentPhrase = "Duping item to " .. Player.Name
        
        if textChatEnabled then
            local success, err = pcall(function()
                TextChatService.TextChannels.RBXGeneral:SendAsync(currentPhrase)
            end)
            if not success then
                notify("Chat not available, continuing without text...")
            end
            task.wait(0.1)
        end
        
        if lp.Character and lp.Character.PrimaryPart then
            local Character = lp.Character
            local previous = lp.Character.PrimaryPart.CFrame
            Character.Archivable = true
            local Clone = Character:Clone()
            lp.Character = Clone
            wait(0.5)
            lp.Character = Character
            wait(0.2)
            
            if lp.Character and Player.Character and Player.Character.PrimaryPart then
                if lp.Character:FindFirstChildOfClass("Humanoid") then
                    lp.Character:FindFirstChildOfClass("Humanoid"):Destroy()
                end
                local Humanoid = Instance.new("Humanoid")
                Humanoid.Parent = lp.Character
                
                local Tool = nil
                if lp.Character:FindFirstChildOfClass("Tool") then
                    Tool = lp.Character:FindFirstChildOfClass("Tool")
                elseif lp.Backpack and lp.Backpack:FindFirstChildOfClass("Tool") then
                    Tool = lp.Backpack:FindFirstChildOfClass("Tool")
                end
                
                if Tool ~= nil then
                    Tool.Parent = lp.Backpack
                    Player.Character.HumanoidRootPart.Anchored = true
                    
                    local Arm = lp.Character['Right Arm'].CFrame * CFrame.new(0, -1, 0, 1, 0, 0, 0, 0, 1, 0, -1, 0)
                    Tool.Grip = Arm:ToObjectSpace(Player.Character.PrimaryPart.CFrame):Inverse()
                    Tool.Parent = lp.Character
                    
                    workspace.CurrentCamera.CameraSubject = Tool.Handle
                    
                    repeat wait() until not Tool or (Tool.Parent == workspace or Tool.Parent == Player.Character)
                    Player.Character.HumanoidRootPart.Anchored = false
                    wait(0.1)
                    Humanoid.Health = 50
                    lp.Character = nil
                    
                    spawn(function()
                        lp.CharacterAdded:Wait()
                        Player.Character.HumanoidRootPart.Anchored = false
                        if Player.Character.Humanoid.Health <= 15 then
                            notify("Successfully duped item to " .. Player.Name .. "!")
                            repeat wait() until lp.Character and lp.Character.PrimaryPart
                            wait(0.4)
                            lp.Character:SetPrimaryPartCFrame(previous)
                        else
                            notify("Error: Dupe failed - player health too high")
                        end
                    end)
                else
                    notify("Error: No tool found to dupe")
                end
            else
                notify("Error: Character not found")
            end
        else
            notify("Error: Local character issue")
        end
    else
        notify("Player '" .. targetText .. "' not found")
    end
end)

DupeGUI["Close_10"].MouseButton1Click:Connect(function()
    DupeGUI["ScreenGui_1"]:Destroy()
end)

updatePlayerList()
highlightMatches()

return DupeGUI["ScreenGui_1"], require;