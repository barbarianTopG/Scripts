local lp = game:GetService("Players").LocalPlayer
local textChatEnabled = true
local currentPhrase = "Duping item to target"

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
            if v.Name:lower():sub(1, #String) == String:lower() then
                table.insert(Found,v)
            end
        end
    end
    return Found
end

local function notify(text)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "• Dupe GUI •";
        Text = text;
        Duration = 3;
    })
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local ui = Instance.new("Frame")
ui.Name = "ui"
ui.Parent = ScreenGui
ui.Active = true
ui.BackgroundColor3 = Color3.fromRGB(33, 0, 84)
ui.BackgroundTransparency = 0
ui.BorderSizePixel = 2
ui.BorderColor3 = Color3.fromRGB(150, 0, 255)
ui.Position = UDim2.new(0.254, 0, 0.419, 0)
ui.Size = UDim2.new(0, 278, 0, 220)
ui.Draggable = true

local UICorner = Instance.new("UICorner")
UICorner.Parent = ui
UICorner.CornerRadius = UDim.new(0.1, 0)

local title = Instance.new("TextLabel")
title.Name = "title"
title.Parent = ui
title.BackgroundTransparency = 1
title.Position = UDim2.new(0, 0, 0.02, 0)
title.Size = UDim2.new(1, 0, 0, 50)
title.Font = Enum.Font.SourceSans
title.Text = "• Dupe GUI •"
title.TextColor3 = Color3.fromRGB(150, 0, 255)
title.TextScaled = true
title.TextWrapped = true

local Frame = Instance.new("Frame")
Frame.Parent = title
Frame.BackgroundColor3 = Color3.fromRGB(150, 0, 255)
Frame.Position = UDim2.new(0.07, 0, 0.86, 0)
Frame.Size = UDim2.new(0.85, 0, 0, 6)

local Username = Instance.new("TextBox")
Username.Name = "Username"
Username.Parent = ui
Username.BackgroundColor3 = Color3.new(1, 1, 1)
Username.Position = UDim2.new(0.1, 0, 0.3, 0)
Username.Size = UDim2.new(0.6, 0, 0, 50)
Username.Font = Enum.Font.SourceSans
Username.PlaceholderText = "Username"
Username.Text = ""
Username.TextColor3 = Color3.new(0, 0, 0)
Username.TextScaled = true
Username.TextWrapped = true

local ShowListBtn = Instance.new("TextButton")
ShowListBtn.Name = "ShowListBtn"
ShowListBtn.Parent = ui
ShowListBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 255)
ShowListBtn.Position = UDim2.new(0.72, 0, 0.3, 0)
ShowListBtn.Size = UDim2.new(0, 50, 0, 50)
ShowListBtn.Text = "List"
ShowListBtn.TextColor3 = Color3.new(1,1,1)
ShowListBtn.TextScaled = true
ShowListBtn.TextWrapped = true

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 6)
btnCorner.Parent = ShowListBtn

local PlayerListBG = Instance.new("Frame")
PlayerListBG.Parent = ui
PlayerListBG.BackgroundColor3 = Color3.fromRGB(33, 0, 84)
PlayerListBG.Position = UDim2.new(1.05, 0, 0, 0)
PlayerListBG.Size = UDim2.new(0, 270, 0, 200)
PlayerListBG.BorderSizePixel = 2
PlayerListBG.BorderColor3 = Color3.fromRGB(150, 0, 255)
PlayerListBG.Visible = false
PlayerListBG.ClipsDescendants = true

local playerListCorner = Instance.new("UICorner")
playerListCorner.CornerRadius = UDim.new(0, 6)
playerListCorner.Parent = PlayerListBG

local PlayerListTitle = Instance.new("TextLabel")
PlayerListTitle.Parent = PlayerListBG
PlayerListTitle.BackgroundTransparency = 1
PlayerListTitle.Position = UDim2.new(0, 0, 0, 0)
PlayerListTitle.Size = UDim2.new(1, 0, 0, 25)
PlayerListTitle.Font = Enum.Font.SourceSans
PlayerListTitle.Text = "Player List"
PlayerListTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
PlayerListTitle.TextScaled = true
PlayerListTitle.TextWrapped = true

local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Parent = PlayerListBG
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.Position = UDim2.new(0, 0, 0, 25)
ScrollingFrame.Size = UDim2.new(1, 0, 1, -25)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingFrame.ScrollBarThickness = 5

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = ScrollingFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 2)

local Kill = Instance.new("TextButton")
Kill.Name = "Kill"
Kill.Parent = ui
Kill.BackgroundColor3 = Color3.fromRGB(150, 0, 255)
Kill.Position = UDim2.new(0.25, 0, 0.62, 0)
Kill.Size = UDim2.new(0.5, 0, 0, 45)
Kill.Font = Enum.Font.Gotham
Kill.Text = "Dupe"
Kill.TextColor3 = Color3.new(1, 1, 1)
Kill.TextScaled = true
Kill.TextWrapped = true

local ToggleChat = Instance.new("TextButton")
ToggleChat.Name = "ToggleChat"
ToggleChat.Parent = ui
ToggleChat.BackgroundColor3 = Color3.fromRGB(100, 0, 200)
ToggleChat.Position = UDim2.new(0.25, 0, 0.82, 0)
ToggleChat.Size = UDim2.new(0.5, 0, 0, 30)
ToggleChat.Font = Enum.Font.Gotham
ToggleChat.Text = "Send Text: ON"
ToggleChat.TextColor3 = Color3.new(1, 1, 1)
ToggleChat.TextScaled = true
ToggleChat.TextWrapped = true
ToggleChat.MouseButton1Click:Connect(function()
    textChatEnabled = not textChatEnabled
    ToggleChat.Text = textChatEnabled and "Send Text: ON" or "Send Text: OFF"
    ToggleChat.BackgroundColor3 = textChatEnabled and Color3.fromRGB(100, 0, 200) or Color3.fromRGB(50, 50, 50)
end)

local function updatePlayerList()
    for _, child in pairs(ScrollingFrame:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end
    local totalHeight = 0
    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
        if player ~= lp then
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1, 0, 0, 25)
            btn.BackgroundColor3 = Color3.fromRGB(150, 0, 255)
            btn.TextColor3 = Color3.fromRGB(255, 255, 255)
            btn.Font = Enum.Font.SourceSans
            btn.TextSize = 14
            btn.Text = player.DisplayName.." ("..player.Name..")"
            local btnCorner = Instance.new("UICorner")
            btnCorner.CornerRadius = UDim.new(0, 6)
            btnCorner.Parent = btn
            btn.Parent = ScrollingFrame
            btn.MouseButton1Click:Connect(function()
                Username.Text = player.Name
                PlayerListBG.Visible = false
            end)
            totalHeight = totalHeight + 27
        end
    end
    ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, totalHeight)
end

local function highlightMatches()
    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
        if player.Character and player.Character.PrimaryPart then
            if player.Character:FindFirstChild("Highlight") then
                player.Character.Highlight:Destroy()
            end
            if Username.Text ~= "" and string.find(player.Name:lower(), Username.Text:lower()) then
                local highlight = Instance.new("Highlight")
                highlight.Name = "Highlight"
                highlight.Adornee = player.Character
                highlight.FillColor = Color3.fromRGB(255, 0, 0)
                highlight.FillTransparency = 0.5
                highlight.OutlineColor = Color3.fromRGB(150, 0, 255)
                highlight.OutlineTransparency = 0
                highlight.Parent = player.Character
            end
        end
    end
end

Username:GetPropertyChangedSignal("Text"):Connect(highlightMatches)
game:GetService("Players").PlayerAdded:Connect(function() updatePlayerList(); highlightMatches() end)
game:GetService("Players").PlayerRemoving:Connect(function() updatePlayerList(); highlightMatches() end)
updatePlayerList()

ShowListBtn.MouseButton1Click:Connect(function()
    PlayerListBG.Visible = not PlayerListBG.Visible
end)

Kill.MouseButton1Click:Connect(function()
    local Player = gplr(Username.Text)[1]
    if Player then
        local LocalPlayer = game.Players.LocalPlayer
        if textChatEnabled then
            game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(currentPhrase)
            task.wait(0.1)
        end
        if LocalPlayer.Character and LocalPlayer.Character.PrimaryPart then
            local Character = LocalPlayer.Character
            local previous = LocalPlayer.Character.PrimaryPart.CFrame
            Character.Archivable = true
            local Clone = Character:Clone()
            LocalPlayer.Character = Clone
            wait(0.5)
            LocalPlayer.Character = Character
            wait(0.2)
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
                    repeat wait() until not Tool or (Tool.Parent == workspace or Tool.Parent == Player.Character)
                    Player.Character.HumanoidRootPart.Anchored = false
                    wait(0.1)
                    Humanoid.Health = 50
                    LocalPlayer.Character = nil
                    spawn(function()
                        LocalPlayer.CharacterAdded:Wait()
                        Player.Character.HumanoidRootPart.Anchored = false
                        if Player.Character.Humanoid.Health <= 15 then
                            notify("Successfully duped item!")
                            repeat wait() until LocalPlayer.Character and LocalPlayer.Character.PrimaryPart
                            wait(0.4)
                            LocalPlayer.Character:SetPrimaryPartCFrame(previous)
                        else
                            notify("Error: Error, possible reasons: Reanimation/Just failed.")
                        end
                    end)
                else
                    notify("Error: Error, possible reasons: Reanimation/Just failed.")
                end
            else
                notify("Error: Error, possible reasons: Reanimation/Just failed.")
            end
        else
            notify("Error: Error, possible reasons: Reanimation/Just failed.")
        end
    else
        notify("Player is not in the server.")
    end
end)