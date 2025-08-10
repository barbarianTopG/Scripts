-- Enjoy!

local Players = game:GetService("Players")
local VirtualInputManager = game:GetService("VirtualInputManager")
local TweenService = game:GetService("TweenService")

local plr = Players.LocalPlayer
local playerGui = plr:WaitForChild("PlayerGui")

local gui = Instance.new("ScreenGui")
gui.Name = "ByteKeyboard"
gui.Parent = playerGui
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local SCALE_KEYS = 0.683
local SCALE_OVERALL = 1 / 1.37

local BASE_KEYBOARD_WIDTH = 540
local BASE_TITLE_HEIGHT = 40
local BASE_BODY_HEIGHT = 235
local BASE_KEY_HEIGHT = 40
local BASE_KEY_SPACING = 6

local KEYBOARD_WIDTH = BASE_KEYBOARD_WIDTH * SCALE_OVERALL * 1.2
local TITLE_HEIGHT = BASE_TITLE_HEIGHT * SCALE_OVERALL
local BODY_HEIGHT = BASE_BODY_HEIGHT * SCALE_OVERALL
local KEY_HEIGHT = BASE_KEY_HEIGHT * SCALE_KEYS
local KEY_SPACING = BASE_KEY_SPACING * SCALE_KEYS

-- Base purple: 122, 70, 234
local basePurple = Color3.fromRGB(122, 70, 234)

-- Helper to make color darker
local function darkenColor(color, factor)
    return Color3.new(
        math.clamp(color.R * factor, 0, 1),
        math.clamp(color.G * factor, 0, 1),
        math.clamp(color.B * factor, 0, 1)
    )
end

-- Colors adjusted
local BACKGROUND_COLOR = darkenColor(basePurple, 0.6) -- darker background
local KEY_BG_COLOR = basePurple                       -- keys original purple (122,70,234)
local KEY_OUTLINE_COLOR = Color3.fromRGB(90, 44, 132) -- keep current key outline (darker purple)

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, KEYBOARD_WIDTH, 0, TITLE_HEIGHT + BODY_HEIGHT - 5)
mainFrame.Position = UDim2.new(0.5, -KEYBOARD_WIDTH / 2, 0.4, -(TITLE_HEIGHT + BODY_HEIGHT) / 2)
mainFrame.BackgroundColor3 = BACKGROUND_COLOR
mainFrame.BorderSizePixel = 0
mainFrame.Parent = gui
mainFrame.Active = true
mainFrame.Draggable = true

local mainRound = Instance.new("UICorner")
mainRound.CornerRadius = UDim.new(0, 20 * SCALE_OVERALL)
mainRound.Parent = mainFrame

local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, TITLE_HEIGHT)
titleBar.BackgroundTransparency = 1
titleBar.Parent = mainFrame
titleBar.ClipsDescendants = true

local titleText = Instance.new("TextLabel")
titleText.Size = UDim2.new(1, -60, 1, 0)
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

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30 * SCALE_OVERALL, 1, 0)
closeBtn.Position = UDim2.new(1, -30 * SCALE_OVERALL, 0, 0)
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

local body = Instance.new("Frame")
body.Size = UDim2.new(1, 0, 0, BODY_HEIGHT)
body.Position = UDim2.new(0, 0, 0, TITLE_HEIGHT)
body.BackgroundTransparency = 1
body.Parent = mainFrame

local keyMap = {
    {"1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "-", "=", "Backspace"},
    {"Tab", "Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P", "[", "]", "\\"},
    {"Caps", "A", "S", "D", "F", "G", "H", "J", "K", "L", ";", "'", "Enter"},
    {"Shift", "Z", "X", "C", "V", "B", "N", "M", ",", ".", "/", "Shift"},
    {"Ctrl", "Win", "Alt", "Space", "Alt", "Fn", "Ctrl"},
}

local keyNameToEnum = {
    ["1"] = "One", ["2"] = "Two", ["3"] = "Three", ["4"] = "Four",
    ["5"] = "Five", ["6"] = "Six", ["7"] = "Seven", ["8"] = "Eight",
    ["9"] = "Nine", ["0"] = "Zero", ["-"] = "Minus", ["="] = "Equals",
    ["Backspace"] = "Backspace", ["Tab"] = "Tab", ["Q"] = "Q", ["W"] = "W",
    ["E"] = "E", ["R"] = "R", ["T"] = "T", ["Y"] = "Y", ["U"] = "U",
    ["I"] = "I", ["O"] = "O", ["P"] = "P", ["["] = "LeftBracket",
    ["]"] = "RightBracket", ["\\"] = "BackSlash", ["Caps"] = "CapsLock",
    ["A"] = "A", ["S"] = "S", ["D"] = "D", ["F"] = "F", ["G"] = "G",
    ["H"] = "H", ["J"] = "J", ["K"] = "K", ["L"] = "L", [";"] = "Semicolon",
    ["'"] = "Quote", ["Enter"] = "Return", ["Shift"] = "LeftShift",
    ["Ctrl"] = "LeftControl", ["Alt"] = "LeftAlt", ["Win"] = "LeftSuper",
    ["Space"] = "Space", ["Fn"] = "Unknown",
}

local function getKeyWidth(key)
    local baseWidth = 40 * SCALE_KEYS
    local wideKeys = {
        Backspace = baseWidth * 2.5,
        Tab = baseWidth * 1.6,
        Caps = baseWidth * 1.8,
        Enter = baseWidth * 2.5,
        Shift = baseWidth * 2.5,
        Space = baseWidth * 6.5,
        Ctrl = baseWidth * 1.5,
        Alt = baseWidth * 1.5,
        Win = baseWidth * 1.5,
        Fn = baseWidth * 1.5,
    }
    return wideKeys[key] or baseWidth
end

local startY = KEY_SPACING

for rowIndex, row in ipairs(keyMap) do
    local x = KEY_SPACING
    for _, keyText in ipairs(row) do
        local width = getKeyWidth(keyText)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0, width, 0, KEY_HEIGHT)
        btn.Position = UDim2.new(0, x, 0, startY + (rowIndex - 1) * (KEY_HEIGHT + KEY_SPACING))
        btn.Text = keyText
        btn.Font = Enum.Font.GothamBold
        btn.TextScaled = true
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.BackgroundColor3 = KEY_BG_COLOR
        btn.BorderSizePixel = 0

        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 6 * SCALE_KEYS)
        corner.Parent = btn

        local outline = Instance.new("UIStroke")
        outline.Color = KEY_OUTLINE_COLOR
        outline.Thickness = 1
        outline.Parent = btn

        local textOutline = Instance.new("UIStroke")
        textOutline.Color = BACKGROUND_COLOR
        textOutline.Thickness = 1
        textOutline.Parent = btn

        btn.Parent = body

        btn.MouseButton1Click:Connect(function()
            local enumName = keyNameToEnum[keyText]
            if enumName and enumName ~= "Unknown" then
                local keyCode = Enum.KeyCode[enumName]
                if keyCode then
                    VirtualInputManager:SendKeyEvent(true, keyCode, false, game)
                    VirtualInputManager:SendKeyEvent(false, keyCode, false, game)
                end
            end
        end)

        x = x + width + KEY_SPACING
    end
end

local function lightenColor(color, amount)
    return Color3.new(
        math.min(color.R + amount, 1),
        math.min(color.G + amount, 1),
        math.min(color.B + amount, 1)
    )
end

local minimizeBtn = Instance.new("TextButton")
local scaleFactor = 1.8
local baseSize = 24
local btnSize = baseSize * scaleFactor

minimizeBtn.Size = UDim2.new(0, btnSize, 0, btnSize)
minimizeBtn.Position = UDim2.new(0.006, 10, 0, 7)
minimizeBtn.BackgroundColor3 = darkenColor(basePurple, 0.6) -- darker purple for minimizer background
minimizeBtn.Text = "B"
minimizeBtn.TextColor3 = Color3.new(1, 1, 1)
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.TextScaled = true
minimizeBtn.Parent = gui
minimizeBtn.AutoButtonColor = false
minimizeBtn.Active = false
minimizeBtn.Draggable = false
minimizeBtn.BorderSizePixel = 0
minimizeBtn.ZIndex = 1000

local minimizeRound = Instance.new("UICorner")
minimizeRound.CornerRadius = UDim.new(0, btnSize / 4) -- squircle shape
minimizeRound.Parent = minimizeBtn

local minimizeStroke = Instance.new("UIStroke")
minimizeStroke.Color = KEY_BG_COLOR -- outline same color as keys (original purple)
minimizeStroke.Thickness = 2
minimizeStroke.Parent = minimizeBtn

local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

local function tweenToCenter()
    gui.Enabled = true
    local targetPos = UDim2.new(0.5, -KEYBOARD_WIDTH / 2, 0.4, -(TITLE_HEIGHT + BODY_HEIGHT) / 2)
    TweenService:Create(mainFrame, tweenInfo, {Position = targetPos}):Play()
    body.Visible = true
end

local function tweenToLeftAndHide()
    local offscreenPos = UDim2.new(-1, 0, mainFrame.Position.Y.Scale, mainFrame.Position.Y.Offset)
    local tween = TweenService:Create(mainFrame, tweenInfo, {Position = offscreenPos})
    tween:Play()
    tween.Completed:Wait()
    body.Visible = false
end

mainFrame.Position = UDim2.new(-1, 0, 0.4, -(TITLE_HEIGHT + BODY_HEIGHT) / 2)
tweenToCenter()

local minimized = false

minimizeBtn.MouseButton1Click:Connect(function()
    if minimized then
        tweenToCenter()
        minimized = false
    else
        tweenToLeftAndHide()
        minimized = true
    end
end)

closeBtn.MouseButton1Click:Connect(function()
    gui:Destroy()
end)
