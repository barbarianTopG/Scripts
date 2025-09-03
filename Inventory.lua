local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

pcall(function() game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false) end)

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CustomHotbar"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

local notch = Instance.new("Frame")
notch.Name = "Notch"
notch.AnchorPoint = Vector2.new(0.5, 0)
notch.Position = UDim2.new(0.5, 0, 0, 0)
notch.Size = UDim2.new(0, 210, 0, 30)
notch.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
notch.BorderSizePixel = 0
notch.Parent = screenGui

local notchCorner = Instance.new("UICorner", notch)
notchCorner.CornerRadius = UDim.new(0, 12)

local hotbarBG = Instance.new("Frame")
hotbarBG.Name = "HotbarBG"
hotbarBG.AnchorPoint = Vector2.new(0.5, 1)
hotbarBG.Position = UDim2.new(0.5, 0, 1, -20) 
hotbarBG.BackgroundColor3 = Color3.fromRGB(45, 25, 65)
hotbarBG.BorderSizePixel = 0
hotbarBG.Parent = screenGui

local hotbarCorner = Instance.new("UICorner", hotbarBG)
hotbarCorner.CornerRadius = UDim.new(0, 20) 

local hotbarPadding = Instance.new("UIPadding", hotbarBG)
hotbarPadding.PaddingLeft = UDim.new(0, 12)
hotbarPadding.PaddingRight = UDim.new(0, 12)
hotbarPadding.PaddingTop = UDim.new(0, 12)
hotbarPadding.PaddingBottom = UDim.new(0, 12)

local hotbarList = Instance.new("UIListLayout", hotbarBG)
hotbarList.FillDirection = Enum.FillDirection.Horizontal
hotbarList.Padding = UDim.new(0, 12)
hotbarList.HorizontalAlignment = Enum.HorizontalAlignment.Center
hotbarList.SortOrder = Enum.SortOrder.LayoutOrder

local function resizeHotbarBg()
	local contentSize = hotbarList.AbsoluteContentSize
	local width = contentSize.X + hotbarPadding.PaddingLeft.Offset + hotbarPadding.PaddingRight.Offset
	local height = contentSize.Y + hotbarPadding.PaddingTop.Offset + hotbarPadding.PaddingBottom.Offset
	if width < 120 then width = 120 end
	if height < 60 then height = 60 end
	hotbarBG.Size = UDim2.new(0, width, 0, height)
end
hotbarList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(resizeHotbarBg)

local SLOTS_COUNT = 4
local SLOT_SIZE = 60
local slots = {}

for i = 1, SLOTS_COUNT do
	local slot = Instance.new("TextButton")
	slot.Name = "Slot"..i
	slot.Size = UDim2.new(0, SLOT_SIZE, 0, SLOT_SIZE)
	slot.BackgroundColor3 = Color3.fromRGB(80, 40, 120)
	slot.BorderSizePixel = 0
	slot.AutoButtonColor = true
	slot.Text = ""
	slot.Parent = hotbarBG

	local slotCorner = Instance.new("UICorner", slot)
	slotCorner.CornerRadius = UDim.new(0, 14)
	
	local slotStroke = Instance.new("UIStroke", slot)
	slotStroke.Color = Color3.fromRGB(140, 70, 200)
	slotStroke.Thickness = 2.5 

	local icon = Instance.new("ImageLabel", slot)
	icon.Name = "Icon"
	icon.Size = UDim2.new(0, 40, 0, 40) 
	icon.Position = UDim2.new(0.5, -20, 0, 6)
	icon.BackgroundTransparency = 1
	icon.Image = ""
	icon.ImageColor3 = Color3.fromRGB(255, 255, 255)
	
	local nameLabel = Instance.new("TextLabel", slot)
	nameLabel.Name = "Name"
	nameLabel.Size = UDim2.new(1, -6, 0, 14)
	nameLabel.Position = UDim2.new(0, 3, 1, -18)
	nameLabel.BackgroundTransparency = 1
	nameLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
	nameLabel.Font = Enum.Font.Gotham
	nameLabel.TextSize = 12
	nameLabel.Text = ""
	nameLabel.TextTruncate = Enum.TextTruncate.AtEnd

	slots[i] = slot
end

local invButton = Instance.new("TextButton")
invButton.Name = "InventoryButton"
invButton.AnchorPoint = Vector2.new(0.5, 1)
invButton.Position = UDim2.new(0.5, 0, 1, -100)
invButton.Size = UDim2.new(0, 140, 0, 40) 
invButton.BackgroundColor3 = Color3.fromRGB(90, 50, 130)
invButton.BorderSizePixel = 0
invButton.Text = "Inventory"
invButton.Font = Enum.Font.GothamBold
invButton.TextSize = 16 
invButton.TextColor3 = Color3.fromRGB(255, 255, 255)
invButton.Parent = screenGui

local invStroke = Instance.new("UIStroke", invButton)
invStroke.Color = Color3.fromRGB(160, 90, 220)
invStroke.Thickness = 2.5

local invCorner = Instance.new("UICorner", invButton)
invCorner.CornerRadius = UDim.new(0, 12) 

local inventoryFrame = Instance.new("Frame")
inventoryFrame.Name = "InventoryFrame"
inventoryFrame.AnchorPoint = Vector2.new(0.5, 0.5)
inventoryFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
inventoryFrame.Size = UDim2.new(0, 380, 0, 460)
inventoryFrame.BackgroundColor3 = Color3.fromRGB(45, 25, 65)
inventoryFrame.BorderSizePixel = 0
inventoryFrame.Visible = false
inventoryFrame.Parent = screenGui

local invCorner2 = Instance.new("UICorner", inventoryFrame)
invCorner2.CornerRadius = UDim.new(0, 20) 

local invPadding = Instance.new("UIPadding", inventoryFrame)
invPadding.PaddingLeft = UDim.new(0, 16)
invPadding.PaddingTop = UDim.new(0, 16)
invPadding.PaddingRight = UDim.new(0, 16)
invPadding.PaddingBottom = UDim.new(0, 16)

local titleBar = Instance.new("Frame", inventoryFrame)
titleBar.Name = "TitleBar"
titleBar.Size = UDim2.new(1, 0, 0, 40)
titleBar.Position = UDim2.new(0, 0, 0, 0)
titleBar.BackgroundTransparency = 1

local titleText = Instance.new("TextLabel", titleBar)
titleText.Size = UDim2.new(1, 0, 1, 0)
titleText.BackgroundTransparency = 1
titleText.Text = "Inventory"
titleText.Font = Enum.Font.GothamBold
titleText.TextSize = 20
titleText.TextColor3 = Color3.fromRGB(255, 255, 255)

local closeButton = Instance.new("TextButton", titleBar)
closeButton.Size = UDim2.new(0, 60, 1, 0)
closeButton.Position = UDim2.new(1, -60, 0, 0)
closeButton.BackgroundTransparency = 1
closeButton.Text = "Close"
closeButton.Font = Enum.Font.Gotham
closeButton.TextSize = 16
closeButton.TextColor3 = Color3.fromRGB(180, 120, 240) 

closeButton.MouseButton1Click:Connect(function()
	inventoryFrame.Visible = false
end)

local searchBox = Instance.new("TextBox", inventoryFrame)
searchBox.Name = "Search"
searchBox.Size = UDim2.new(1, 0, 0, 40)
searchBox.Position = UDim2.new(0, 0, 0, 50)
searchBox.BackgroundColor3 = Color3.fromRGB(60, 35, 85)
searchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
searchBox.PlaceholderText = "Search..."
searchBox.PlaceholderColor3 = Color3.fromRGB(180, 180, 180)
searchBox.Text = ""
searchBox.ClearTextOnFocus = false
searchBox.Font = Enum.Font.Gotham
searchBox.TextSize = 16

local searchCorner = Instance.new("UICorner", searchBox)
searchCorner.CornerRadius = UDim.new(0, 12)

local searchPadding = Instance.new("UIPadding", searchBox)
searchPadding.PaddingLeft = UDim.new(0, 12)
searchPadding.PaddingRight = UDim.new(0, 12)

local grid = Instance.new("ScrollingFrame", inventoryFrame)
grid.Name = "Grid"
grid.Size = UDim2.new(1, 0, 1, -140)
grid.Position = UDim2.new(0, 0, 0, 100)
grid.CanvasSize = UDim2.new(0, 0, 0, 0)
grid.BackgroundTransparency = 1
grid.ScrollBarThickness = 6
grid.ScrollBarImageColor3 = Color3.fromRGB(120, 70, 170) 

local gridLayout = Instance.new("UIGridLayout", grid)
gridLayout.CellSize = UDim2.new(0, 80, 0, 80)
gridLayout.CellPadding = UDim2.new(0, 10, 0, 10) 
gridLayout.SortOrder = Enum.SortOrder.LayoutOrder

local function getAllPlayerTools()
	local setOrder = {}
	for _, v in ipairs(player.Backpack:GetChildren()) do
		if v:IsA("Tool") then table.insert(setOrder, v) end
	end
	for _, v in ipairs((player.Character and player.Character:GetChildren()) or {}) do
		if v:IsA("Tool") then
			local found = false
			for _, t in ipairs(setOrder) do if t == v then found = true break end end
			if not found then table.insert(setOrder, v) end
		end
	end
	return setOrder
end

local function findToolByName(name)
	local t = player.Backpack:FindFirstChild(name) or (player.Character and player.Character:FindFirstChild(name))
	return t
end

local function tryGetIconFromTool(tool)
	if not tool then return nil end
	if type(tool.TextureId) == "string" and tool.TextureId ~= "" then return tool.TextureId end
	local handle = tool:FindFirstChild("Handle")
	if handle then
		for _, d in ipairs(handle:GetDescendants()) do
			if d:IsA("Decal") or d:IsA("Texture") then
				if type(d.Texture) == "string" and d.Texture ~= "" then return d.Texture end
			end
		end
	end
	return nil
end

local function setSlotVisual(slot, tool)
	local icon = slot:FindFirstChild("Icon")
	local label = slot:FindFirstChild("Name")
	if tool and tool:IsA("Tool") then
		label.Text = tool.Name
		slot:SetAttribute("ToolName", tool.Name)
		local iconImg = tryGetIconFromTool(tool)
		if iconImg and iconImg ~= "" then
			icon.Image = iconImg
		else
			icon.Image = "rbxassetid://6031068433"
		end
	else
		label.Text = ""
		slot:SetAttribute("ToolName", nil)
		icon.Image = ""
	end
end

local DEFAULT_BG = Color3.fromRGB(80, 40, 120) 
local HIGHLIGHT_BG = Color3.fromRGB(140, 70, 200) 

local function updateHighlights()
	for _, slot in ipairs(slots) do
		local sname = slot:GetAttribute("ToolName")
		if sname and player.Character and player.Character:FindFirstChild(sname) then
			slot.BackgroundColor3 = HIGHLIGHT_BG
			local stroke = slot:FindFirstChildOfClass("UIStroke")
			if stroke then stroke.Color = HIGHLIGHT_BG end
		else
			slot.BackgroundColor3 = DEFAULT_BG
			local stroke = slot:FindFirstChildOfClass("UIStroke")
			if stroke then stroke.Color = Color3.fromRGB(140, 70, 200) end 
		end
	end
end

local function reconcileSlots()
	local present = {}
	local order = {}
	for _, t in ipairs(player.Backpack:GetChildren()) do if t:IsA("Tool") then present[t.Name] = t table.insert(order, t) end end
	for _, t in ipairs((player.Character and player.Character:GetChildren()) or {}) do if t:IsA("Tool") then if not present[t.Name] then present[t.Name] = t table.insert(order, t) end end end

	for _, slot in ipairs(slots) do
		local tn = slot:GetAttribute("ToolName")
		if tn and not present[tn] then
			setSlotVisual(slot, nil)
		end
	end

	for _, tool in ipairs(order) do
		local alreadyAssigned = false
		for _, slot in ipairs(slots) do
			if slot:GetAttribute("ToolName") == tool.Name then alreadyAssigned = true break end
		end
		if not alreadyAssigned then
			for _, slot in ipairs(slots) do
				if not slot:GetAttribute("ToolName") then
					setSlotVisual(slot, tool)
					break
				end
			end
		end
	end

	resizeHotbarBg()
	updateHighlights()
end

local function toggleEquipByName(name)
	local tool = findToolByName(name)
	if not tool then return end
	local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
	if tool.Parent == player.Character then
		tool.Parent = player.Backpack
	else
		if humanoid and tool.Parent == player.Backpack then
			humanoid:EquipTool(tool)
		else
			tool.Parent = player.Character
		end
	end
	task.delay(0.06, function() reconcileSlots() end)
end

for idx, slot in ipairs(slots) do
	slot.MouseButton1Click:Connect(function()
		local tname = slot:GetAttribute("ToolName")
		if tname and tname ~= "" then
			toggleEquipByName(tname)
		end
	end)
end

UserInputService.InputBegan:Connect(function(input, gp)
	if gp then return end
	if input.KeyCode >= Enum.KeyCode.One and input.KeyCode <= Enum.KeyCode.Four then
		local idx = input.KeyCode.Value - Enum.KeyCode.One.Value + 1
		local slot = slots[idx]
		if slot then
			local tname = slot:GetAttribute("ToolName")
			if tname and tname ~= "" then
				toggleEquipByName(tname)
			end
		end
	elseif input.KeyCode == Enum.KeyCode.E then
		inventoryFrame.Visible = not inventoryFrame.Visible
		if inventoryFrame.Visible then
			task.defer(function() pcall(refreshInventory) end)
		end
	end
end)

local function refreshInventory()
	for _, child in ipairs(grid:GetChildren()) do
		if child:IsA("TextButton") then child:Destroy() end
	end

	local allTools = getAllPlayerTools()
	local query = (searchBox.Text or ""):lower()
	for _, tool in ipairs(allTools) do
		local name = tool.Name
		if query == "" or string.find(name:lower(), query, 1, true) then
			local btn = Instance.new("TextButton")
			btn.Size = UDim2.new(0, 80, 0, 80)
			btn.BackgroundColor3 = Color3.fromRGB(80, 40, 120) 
			btn.BorderSizePixel = 0
			btn.Font = Enum.Font.Gotham
			btn.TextSize = 14
			btn.TextColor3 = Color3.fromRGB(255, 255, 255)
			btn.Text = name
			btn.Parent = grid
			
			local btnCorner = Instance.new("UICorner", btn)
			btnCorner.CornerRadius = UDim.new(0, 12)
			
			local btnStroke = Instance.new("UIStroke", btn)
			btnStroke.Color = Color3.fromRGB(140, 70, 200)
			btnStroke.Thickness = 2

			btn.MouseButton1Click:Connect(function()
				local assignedSlot = nil
				for _, s in ipairs(slots) do if s:GetAttribute("ToolName") == name then assignedSlot = s break end end
				if not assignedSlot then
					for _, s in ipairs(slots) do
						if not s:GetAttribute("ToolName") then
							setSlotVisual(s, tool)
							assignedSlot = s
							break
						end
					end
				end
				local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
				if tool.Parent == player.Character then
					tool.Parent = player.Backpack
				else
					if humanoid and tool.Parent == player.Backpack then
						humanoid:EquipTool(tool)
					else
						tool.Parent = player.Character
					end
				end
				task.delay(0.06, function() reconcileSlots() end)
			end)
		end
	end

	task.defer(function()
		grid.CanvasSize = UDim2.new(0, 0, 0, gridLayout.AbsoluteContentSize.Y)
	end)
end

searchBox:GetPropertyChangedSignal("Text"):Connect(refreshInventory)

invButton.MouseButton1Click:Connect(function()
	inventoryFrame.Visible = not inventoryFrame.Visible
	if inventoryFrame.Visible then refreshInventory() end
end)

player.Backpack.ChildAdded:Connect(function() reconcileSlots() refreshInventory() end)
player.Backpack.ChildRemoved:Connect(function() reconcileSlots() refreshInventory() end)
player.CharacterAdded:Connect(function(char)
	char.ChildAdded:Connect(function() reconcileSlots() end)
	char.ChildRemoved:Connect(function() reconcileSlots() end)
	task.delay(0.1, reconcileSlots)
end)

task.defer(function()
	reconcileSlots()
	refreshInventory()
end)