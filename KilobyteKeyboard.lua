--- // ==== Kilobyte Keyboard ==== \\ ---

-- // ==== Services ==== \ --
local Players             = game:GetService("Players")
local VirtualInputManager = game:GetService("VirtualInputManager")
local TweenService        = game:GetService("TweenService")

local plr = Players.LocalPlayer
local playerGui = plr:WaitForChild("PlayerGui")

-- // ==== GUI ==== \ --
local gui = Instance.new("ScreenGui")
gui.Name = "KilobyteKeyboard"
gui.ResetOnSpawn = false
gui.Parent = playerGui
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 280, 0, 200)
mainFrame.Position = UDim2.new(0.5, -140, 0.7, -90)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = gui
mainFrame.Active = true
mainFrame.Draggable = true

-- removed mainFrame UICorner here (no rounded corners)

local outline = Instance.new("UIStroke")
outline.Color = Color3.fromRGB(120, 60, 255)
outline.Thickness = 2
outline.Parent = mainFrame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -30, 0, 20)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Kilobyte keyboard"
title.TextColor3 = Color3.fromRGB(150, 80, 255)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = mainFrame

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 20, 0, 20)
closeBtn.Position = UDim2.new(0.82, -20, 0, 0)
closeBtn.BackgroundColor3 = Color3.fromRGB(220, 60, 60)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.new(1,1,1)
closeBtn.TextScaled = true
closeBtn.Font = Enum.Font.GothamBold
closeBtn.Parent = mainFrame

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0.3,0)
corner.Parent = closeBtn

closeBtn.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

-- // ==== Keys ==== \ --
local keysLayout = {
 {"Q","E","R","T","Y"},
 {"U","P","L","K","J"},
 {"H","G","F","M","N"},
 {"B","V","C","X","Z"},
}

local startY = 30
local keySize = 40
local spacing = 3

local totalRowWidth = (#keysLayout[1] * keySize) + ((#keysLayout[1]-1) * spacing)

for rowIndex, row in ipairs(keysLayout) do
 local rowWidth = (#row * keySize) + ((#row-1) * spacing)
 local startX = (mainFrame.AbsoluteSize.X - rowWidth) / 2

 for colIndex, keyName in ipairs(row) do
  local keyBtn = Instance.new("TextButton")
  keyBtn.Size = UDim2.new(0, keySize, 0, keySize)
  keyBtn.Position = UDim2.new(0, startX + (colIndex - 1) * (keySize + spacing), 0, startY + (rowIndex - 1) * (keySize + spacing))
  keyBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 40)
  keyBtn.Text = keyName
  keyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
  keyBtn.TextScaled = true
  keyBtn.Font = Enum.Font.GothamBold
  keyBtn.Parent = mainFrame

  local corner2 = Instance.new("UICorner")
  corner2.CornerRadius = UDim.new(0.25, 0)
  corner2.Parent = keyBtn

  local stroke = Instance.new("UIStroke")
  stroke.Color = Color3.fromRGB(120, 60, 255)
  stroke.Thickness = 1.5
  stroke.Parent = keyBtn

  keyBtn.MouseButton1Click:Connect(function()
   VirtualInputManager:SendKeyEvent(true, Enum.KeyCode[keyName], false, game)
   VirtualInputManager:SendKeyEvent(false, Enum.KeyCode[keyName], false, game)
   keyBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
   TweenService:Create(keyBtn, TweenInfo.new(0.25), {BackgroundColor3 = Color3.fromRGB(25, 25, 40)}):Play()
  end)
 end
end
