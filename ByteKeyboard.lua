local Players = game:GetService("Players")
local VirtualInputManager = game:GetService("VirtualInputManager")
local UserInputService = game:GetService("UserInputService")

local plr = Players.LocalPlayer
local playerGui = plr:WaitForChild("PlayerGui")

local gui = Instance.new("ScreenGui")
gui.Name = "Byte Keyboard"
gui.ResetOnSpawn = false
gui.Parent = playerGui
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local SCALE_KEYS = 0.683
local SCALE_OVERALL = (1/1.37) * 1.1 -- 10% bigger

local BASE_KEYBOARD_WIDTH = 540
local BASE_TITLE_HEIGHT = 40
local BASE_BODY_HEIGHT = 235
local BASE_KEY_HEIGHT = 40
local BASE_KEY_SPACING = 6

local KEYBOARD_WIDTH = BASE_KEYBOARD_WIDTH * SCALE_OVERALL * 1.2
local TITLE_HEIGHT = BASE_TITLE_HEIGHT * SCALE_OVERALL
local BODY_HEIGHT = BASE_BODY_HEIGHT * SCALE_OVERALL
local KEY_HEIGHT = BASE_KEY_HEIGHT * SCALE_KEYS * 1.1
local KEY_SPACING = BASE_KEY_SPACING * SCALE_KEYS * 1.1

local basePurple = Color3.fromRGB(122, 70, 234)

local function darkenColor(color, factor)
return Color3.new(
math.clamp(color.R * factor, 0, 1),
math.clamp(color.G * factor, 0, 1),
math.clamp(color.B * factor, 0, 1)
)
end

local BACKGROUND_COLOR = darkenColor(basePurple, 0.6)
local KEY_BG_COLOR = basePurple
local KEY_OUTLINE_COLOR = Color3.fromRGB(80, 46, 153)

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, KEYBOARD_WIDTH, 0, TITLE_HEIGHT + BODY_HEIGHT - 5)
mainFrame.Position = UDim2.new(0.5, -KEYBOARD_WIDTH/2, 0.5, -(TITLE_HEIGHT + BODY_HEIGHT)/2)
mainFrame.BackgroundColor3 = BACKGROUND_COLOR
mainFrame.BorderSizePixel = 0
mainFrame.Parent = gui

local dragging = false
local dragStart, startPos
mainFrame.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 then
dragging = true
dragStart = input.Position
startPos = mainFrame.Position
input.Changed:Connect(function()
if input.UserInputState == Enum.UserInputState.End then
dragging = false
end
end)
end
end)
UserInputService.InputChanged:Connect(function(input)
if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
local delta = input.Position - dragStart
mainFrame.Position = UDim2.new(
startPos.X.Scale,
startPos.X.Offset + delta.X,
startPos.Y.Scale,
startPos.Y.Offset + delta.Y
)
end
end)

local mainRound = Instance.new("UICorner")
mainRound.CornerRadius = UDim.new(0, 20 * SCALE_OVERALL)
mainRound.Parent = mainFrame

local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, TITLE_HEIGHT)
titleBar.BackgroundTransparency = 1
titleBar.Parent = mainFrame
titleBar.ClipsDescendants = true

local titleText = Instance.new("TextLabel")
titleText.Size = UDim2.new(1, -100, 1, 0)
titleText.Position = UDim2.new(0, 10 * SCALE_OVERALL, 0, 0)
titleText.BackgroundTransparency = 1
titleText.Text = "Byte Keyboard"
titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
titleText.Font = Enum.Font.GothamBold
titleText.TextSize = 24 * SCALE_OVERALL
titleText.TextXAlignment = Enum.TextXAlignment.Left
titleText.Parent = titleBar

local titleOutline = Instance.new("UIStroke")
titleOutline.Color = BACKGROUND_COLOR
titleOutline.Thickness = 1
titleOutline.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
titleOutline.Parent = titleText

local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Size = UDim2.new(0, 30 * SCALE_OVERALL, 1, 0)
minimizeBtn.Position = UDim2.new(1, -90 * SCALE_OVERALL, 0, 0)
minimizeBtn.BackgroundColor3 = KEY_BG_COLOR
minimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.TextSize = 24 * SCALE_OVERALL
minimizeBtn.Text = "-"
minimizeBtn.Parent = titleBar

local minimizeRound = Instance.new("UICorner")
minimizeRound.CornerRadius = UDim.new(0, 6 * SCALE_OVERALL)
minimizeRound.Parent = minimizeBtn

minimizeBtn.MouseEnter:Connect(function()
minimizeBtn.BackgroundColor3 = darkenColor(basePurple, 0.8)
end)
minimizeBtn.MouseLeave:Connect(function()
minimizeBtn.BackgroundColor3 = KEY_BG_COLOR
end)

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30 * SCALE_OVERALL, 1, 0)
closeBtn.Position = UDim2.new(1, -50 * SCALE_OVERALL, 0, 0)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeBtn.TextColor3 = Color3.new(1, 1, 1)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 18 * SCALE_OVERALL
closeBtn.Text = "X"
closeBtn.Parent = titleBar

local closeRound = Instance.new("UICorner")
closeRound.CornerRadius = UDim.new(0, 6 * SCALE_OVERALL)
closeRound.Parent = closeBtn

closeBtn.MouseEnter:Connect(function()
closeBtn.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
end)
closeBtn.MouseLeave:Connect(function()
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
end)
closeBtn.MouseButton1Click:Connect(function()
gui:Destroy()
end)

local body = Instance.new("Frame")
body.Size = UDim2.new(1, 0, 0, BODY_HEIGHT)
body.Position = UDim2.new(0, 0, 0, TITLE_HEIGHT)
body.BackgroundTransparency = 1
body.Parent = mainFrame

local keyMap = {
{"1","2","3","4","5","6","7","8","9","0","-","=","Backspace"},
{"Tab","Q","W","E","R","T","Y","U","I","O","P","[","]","\\"},
{"Caps","A","S","D","F","G","H","J","K","L",";","'","Enter"},
{"Shift","Z","X","C","V","B","N","M",",",".","/","Shift"},
{"Ctrl","Win","Alt","Space","Alt","Fn","Ctrl"},
}

local function createKey(text)
local key = Instance.new("TextButton")
key.Text = text
key.Size = UDim2.new(0, KEY_HEIGHT * 1.5, 0, KEY_HEIGHT)
key.BackgroundColor3 = KEY_BG_COLOR
key.TextColor3 = Color3.fromRGB(255, 255, 255)
key.Font = Enum.Font.Gotham
key.TextSize = 16 * SCALE_OVERALL
key.AutoButtonColor = false

local round = Instance.new("UICorner")
round.CornerRadius = UDim.new(0, 6 * SCALE_KEYS)
round.Parent = key

local stroke = Instance.new("UIStroke")
stroke.Color = KEY_OUTLINE_COLOR
stroke.Thickness = 1
stroke.Parent = key

key.MouseButton1Click:Connect(function()
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode[text:upper()] or Enum.KeyCode.Unknown, false, game)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode[text:upper()] or Enum.KeyCode.Unknown, false, game)
end)

return key
end

local yPos = 0
for _, row in ipairs(keyMap) do
local xPos = 0
for _, keyName in ipairs(row) do
local key = createKey(keyName)
key.Position = UDim2.new(0, xPos, 0, yPos)
key.Parent = body
xPos = xPos + key.Size.X.Offset + KEY_SPACING
end
yPos = yPos + KEY_HEIGHT + KEY_SPACING
end
