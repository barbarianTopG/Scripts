local lp = game:GetService("Players").LocalPlayer
local textChatEnabled = true

local function gplr(String)
	local Found = {}
	local strl = String:lower()
	for i, v in pairs(game:GetService("Players"):GetPlayers()) do
		if strl == "all" or (strl == "others" and v.Name ~= lp.Name) or (strl == "me" and v.Name == lp.Name) or v.Name:lower():sub(1, #strl) == strl then
			table.insert(Found, v)
		end
	end
	return Found
end

local function notify()
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Failed",
		Text = "Couldn't dupe item to player. Possible reasons: Reanimation, Just failed.",
		Duration = 3
	})
end

local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local ui = Instance.new("Frame")
ui.Name = "ui"
ui.Parent = ScreenGui
ui.Active = true
ui.BackgroundColor3 = Color3.fromRGB(62, 0, 238)
ui.BorderSizePixel = 0
ui.Position = UDim2.new(0.254, 0, 0.419, 0)
ui.Size = UDim2.new(0, 278, 0, 220)
ui.Draggable = true
Instance.new("UICorner", ui).CornerRadius = UDim.new(0.1, 0)

local title = Instance.new("TextLabel", ui)
title.BackgroundTransparency = 1
title.Position = UDim2.new(0, 0, 0.02, 0)
title.Size = UDim2.new(1, 0, 0, 50)
title.Font = Enum.Font.SourceSans
title.Text = "+ Dupe GUI V1 +"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextScaled = true
title.TextWrapped = true

local Frame = Instance.new("Frame", title)
Frame.BackgroundColor3 = Color3.fromRGB(80, 40, 255)
Frame.Position = UDim2.new(0.07, 0, 0.86, 0)
Frame.Size = UDim2.new(0.85, 0, 0, 6)

local Username = Instance.new("TextBox", ui)
Username.Name = "Username"
Username.BackgroundColor3 = Color3.new(1, 1, 1)
Username.Position = UDim2.new(0.1, 0, 0.3, 0)
Username.Size = UDim2.new(0.6, 0, 0, 50)
Username.Font = Enum.Font.SourceSans
Username.PlaceholderText = "Username"
Username.Text = ""
Username.TextColor3 = Color3.new(0, 0, 0)
Username.TextScaled = true
Username.TextWrapped = true

local ShowListBtn = Instance.new("TextButton", ui)
ShowListBtn.Name = "ShowListBtn"
ShowListBtn.BackgroundColor3 = Color3.fromRGB(90, 60, 255)
ShowListBtn.Position = UDim2.new(0.72, 0, 0.3, 0)
ShowListBtn.Size = UDim2.new(0, 50, 0, 50)
ShowListBtn.Text = "List"
ShowListBtn.TextColor3 = Color3.new(1, 1, 1)
ShowListBtn.TextScaled = true
ShowListBtn.TextWrapped = true
Instance.new("UICorner", ShowListBtn).CornerRadius = UDim.new(0, 6)

local PlayerListBG = Instance.new("Frame", ui)
PlayerListBG.BackgroundColor3 = Color3.fromRGB(0, 0, 100)
PlayerListBG.Position = UDim2.new(1, 10, 0.05, 0)
PlayerListBG.Size = UDim2.new(0, 130, 0, 150)
PlayerListBG.BorderSizePixel = 0
PlayerListBG.Visible = false
PlayerListBG.ClipsDescendants = true
Instance.new("UICorner", PlayerListBG).CornerRadius = UDim.new(0, 6)

local PlayerListTitle = Instance.new("TextLabel", PlayerListBG)
PlayerListTitle.BackgroundTransparency = 1
PlayerListTitle.Size = UDim2.new(1, 0, 0, 25)
PlayerListTitle.Font = Enum.Font.SourceSans
PlayerListTitle.Text = "Player List"
PlayerListTitle.TextColor3 = Color3.new(1, 1, 1)
PlayerListTitle.TextScaled = true
PlayerListTitle.TextWrapped = true

local ScrollingFrame = Instance.new("ScrollingFrame", PlayerListBG)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.Position = UDim2.new(0, 0, 0, 25)
ScrollingFrame.Size = UDim2.new(1, 0, 1, -25)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingFrame.ScrollBarThickness = 5

local UIListLayout = Instance.new("UIListLayout", ScrollingFrame)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 2)

local Dupe = Instance.new("TextButton", ui)
Dupe.Name = "Dupe"
Dupe.BackgroundColor3 = Color3.fromRGB(90, 60, 255)
Dupe.Position = UDim2.new(0.25, 0, 0.62, 0)
Dupe.Size = UDim2.new(0.5, 0, 0, 45)
Dupe.Font = Enum.Font.Gotham
Dupe.Text = "Dupe"
Dupe.TextColor3 = Color3.new(1, 1, 1)
Dupe.TextScaled = true
Dupe.TextWrapped = true

local ToggleChat = Instance.new("TextButton", ui)
ToggleChat.Name = "ToggleChat"
ToggleChat.BackgroundColor3 = Color3.fromRGB(90, 60, 255)
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
	ToggleChat.BackgroundColor3 = textChatEnabled and Color3.fromRGB(90, 60, 255) or Color3.fromRGB(60, 60, 60)
end)

local function updatePlayerList()
	for _, child in ipairs(ScrollingFrame:GetChildren()) do
		if child:IsA("TextButton") then child:Destroy() end
	end
	local height = 0
	for _, player in ipairs(game.Players:GetPlayers()) do
		if player ~= lp then
			local btn = Instance.new("TextButton", ScrollingFrame)
			btn.Size = UDim2.new(1, 0, 0, 25)
			btn.BackgroundColor3 = Color3.fromRGB(90, 60, 255)
			btn.TextColor3 = Color3.new(1, 1, 1)
			btn.Font = Enum.Font.SourceSans
			btn.TextSize = 14
			btn.Text = player.Name
			Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
			btn.MouseButton1Click:Connect(function()
				Username.Text = player.Name
				PlayerListBG.Visible = false
			end)
			height += 27
		end
	end
	ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, height)
end

game.Players.PlayerAdded:Connect(updatePlayerList)
game.Players.PlayerRemoving:Connect(updatePlayerList)
updatePlayerList()

ShowListBtn.MouseButton1Click:Connect(function()
	PlayerListBG.Visible = not PlayerListBG.Visible
end)

Dupe.MouseButton1Click:Connect(function()
	local Player = gplr(Username.Text)[1]
	if not Player then return notify() end
	if textChatEnabled then
		game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Duping item to " .. Player.Name .. "...")
		task.wait(0.1)
	end

	local LocalPlayer = lp
	local Char = LocalPlayer.Character
	if Char and Char.PrimaryPart and Player.Character and Player.Character.PrimaryPart then
		local prev = Char.PrimaryPart.CFrame
		Char.Archivable = true
		local Clone = Char:Clone()
		LocalPlayer.Character = Clone
		task.wait(0.5)
		LocalPlayer.Character = Char
		task.wait(0.2)

		if Char:FindFirstChildOfClass("Humanoid") then Char:FindFirstChildOfClass("Humanoid"):Destroy() end
		local Humanoid = Instance.new("Humanoid", Char)
		local Tool = Char:FindFirstChildOfClass("Tool") or LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
		if Tool then
			Tool.Parent = LocalPlayer.Backpack
			Player.Character.HumanoidRootPart.Anchored = true
			local Arm = Char["Right Arm"].CFrame * CFrame.new(0, -1, 0)
			Tool.Grip = Arm:ToObjectSpace(Player.Character.PrimaryPart.CFrame):Inverse()
			Tool.Parent = Char
			workspace.CurrentCamera.CameraSubject = Tool:FindFirstChild("Handle")
			repeat task.wait() until not Tool or Tool.Parent == workspace or Tool.Parent == Player.Character
			Player.Character.HumanoidRootPart.Anchored = false
			task.wait(0.1)
			Humanoid.Health = 0
			LocalPlayer.Character = nil
			spawn(function()
				LocalPlayer.CharacterAdded:Wait()
				Player.Character.HumanoidRootPart.Anchored = false
				if Player.Character:FindFirstChildOfClass("Humanoid").Health <= 15 then
					repeat task.wait() until LocalPlayer.Character and LocalPlayer.Character.PrimaryPart
					task.wait(0.4)
					LocalPlayer.Character:SetPrimaryPartCFrame(prev)
				else
					notify()
				end
			end)
		else
			notify()
		end
	else
		notify()
	end
end)