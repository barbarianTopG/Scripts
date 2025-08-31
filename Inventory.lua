local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

pcall(function() game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false) end)

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CustomHotbar"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

local hotbarBG = Instance.new("Frame")
hotbarBG.Name = "HotbarBG"
hotbarBG.AnchorPoint = Vector2.new(0.5, 1)
hotbarBG.Position = UDim2.new(0.5, 0, 1, -10)
hotbarBG.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
hotbarBG.BorderSizePixel = 0
hotbarBG.Parent = screenGui

local hotbarCorner = Instance.new("UICorner", hotbarBG)
hotbarCorner.CornerRadius = UDim.new(0, 8)

local hotbarPadding = Instance.new("UIPadding", hotbarBG)
hotbarPadding.PaddingLeft = UDim.new(0, 8)
hotbarPadding.PaddingRight = UDim.new(0, 8)
hotbarPadding.PaddingTop = UDim.new(0, 8)
hotbarPadding.PaddingBottom = UDim.new(0, 8)

local hotbarList = Instance.new("UIListLayout", hotbarBG)
hotbarList.FillDirection = Enum.FillDirection.Horizontal
hotbarList.Padding = UDim.new(0, 8)
hotbarList.HorizontalAlignment = Enum.HorizontalAlignment.Center
hotbarList.SortOrder = Enum.SortOrder.LayoutOrder

local function resizeHotbarBg()
	local contentSize = hotbarList.AbsoluteContentSize
	local width = contentSize.X + hotbarPadding.PaddingLeft.Offset + hotbarPadding.PaddingRight.Offset
	local height = contentSize.Y + hotbarPadding.PaddingTop.Offset + hotbarPadding.PaddingBottom.Offset
	if width < 100 then width = 100 end
	if height < 48 then height = 48 end
	hotbarBG.Size = UDim2.new(0, width, 0, height)
end
hotbarList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(resizeHotbarBg)

local SLOTS_COUNT = 4
local SLOT_SIZE = 56
local slots = {}

for i = 1, SLOTS_COUNT do
	local slot = Instance.new("TextButton")
	slot.Name = "Slot"..i
	slot.Size = UDim2.new(0, SLOT_SIZE, 0, SLOT_SIZE)
	slot.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	slot.BorderSizePixel = 0
	slot.AutoButtonColor = true
	slot.Text = ""
	slot.Parent = hotbarBG

	local slotCorner = Instance.new("UICorner", slot)
	slotCorner.CornerRadius = UDim.new(0, 6)

	local slotStroke = Instance.new("UIStroke", slot)
	slotStroke.Color = Color3.fromRGB(90, 90, 90)
	slotStroke.Thickness = 2

	local icon = Instance.new("ImageLabel", slot)
	icon.Name = "Icon"
	icon.Size = UDim2.new(0, 36, 0, 36)
	icon.Position = UDim2.new(0.5, -18, 0, 6)
	icon.BackgroundTransparency = 1
	icon.Image = ""

	local nameLabel = Instance.new("TextLabel", slot)
	nameLabel.Name = "Name"
	nameLabel.Size = UDim2.new(1, -6, 0, 14)
	nameLabel.Position = UDim2.new(0, 3, 1, -18)
	nameLabel.BackgroundTransparency = 1
	nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	nameLabel.Font = Enum.Font.Gotham
	nameLabel.TextSize = 12
	nameLabel.Text = ""
	nameLabel.TextTruncate = Enum.TextTruncate.AtEnd

	slots[i] = slot
end

local invButton = Instance.new("TextButton")
invButton.Name = "InventoryButton"
invButton.AnchorPoint = Vector2.new(0.5, 1)
invButton.Position = UDim2.new(0.5, 0, 1, -90)
invButton.Size = UDim2.new(0, 120, 0, 36)
invButton.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
invButton.BorderSizePixel = 0
invButton.Text = "Inventory"
invButton.Font = Enum.Font.GothamBold
invButton.TextSize = 14
invButton.TextColor3 = Color3.fromRGB(255, 255, 255)
invButton.Parent = screenGui

local invStroke = Instance.new("UIStroke", invButton)
invStroke.Color = Color3.fromRGB(200, 200, 200)
invStroke.Thickness = 2

local invCorner = Instance.new("UICorner", invButton)
invCorner.CornerRadius = UDim.new(0, 8)

local inventoryFrame = Instance.new("Frame")
inventoryFrame.Name = "InventoryFrame"
inventoryFrame.AnchorPoint = Vector2.new(0.5, 0.5)
inventoryFrame.Position = UDim2.new(0.5, 0, 0.25, 0)
inventoryFrame.Size = UDim2.new(0, 360, 0, 220)
inventoryFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
inventoryFrame.BorderSizePixel = 0
inventoryFrame.Visible = false
inventoryFrame.Parent = screenGui

local invCorner2 = Instance.new("UICorner", inventoryFrame)
invCorner2.CornerRadius = UDim.new(0, 10)

local invPadding = Instance.new("UIPadding", inventoryFrame)
invPadding.PaddingLeft = UDim.new(0, 8)
invPadding.PaddingTop = UDim.new(0, 8)
invPadding.PaddingRight = UDim.new(0, 8)
invPadding.PaddingBottom = UDim.new(0, 8)

local searchBox = Instance.new("TextBox", inventoryFrame)
searchBox.Name = "Search"
searchBox.Size = UDim2.new(1, -16, 0, 34)
searchBox.Position = UDim2.new(0, 8, 0, 8)
searchBox.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
searchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
searchBox.PlaceholderText = "Search..."
searchBox.Text = ""
searchBox.ClearTextOnFocus = false
searchBox.Font = Enum.Font.Gotham
searchBox.TextSize = 14

local grid = Instance.new("ScrollingFrame", inventoryFrame)
grid.Name = "Grid"
grid.Size = UDim2.new(1, 0, 1, -56)
grid.Position = UDim2.new(0, 0, 0, 50)
grid.CanvasSize = UDim2.new(0, 0, 0, 0)
grid.BackgroundTransparency = 1
grid.ScrollBarThickness = 6

local gridLayout = Instance.new("UIGridLayout", grid)
gridLayout.CellSize = UDim2.new(0, 80, 0, 60)
gridLayout.CellPadding = UDim2.new(0, 6, 0, 6)
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

local DEFAULT_BG = Color3.fromRGB(40,40,40)
local HIGHLIGHT_BG = Color3.fromRGB(0,170,255)

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
			if stroke then stroke.Color = Color3.fromRGB(90,90,90) end
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
			btn.Size = UDim2.new(0, 80, 0, 60)
			btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
			btn.BorderSizePixel = 0
			btn.Font = Enum.Font.Gotham
			btn.TextSize = 14
			btn.TextColor3 = Color3.fromRGB(255, 255, 255)
			btn.Text = name
			btn.Parent = grid

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