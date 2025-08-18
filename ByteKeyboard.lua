--- // ==== Services ==== \ ---
local Players             = game:GetService("Players")
local VirtualInputManager = game:GetService("VirtualInputManager")
local TweenService        = game:GetService("TweenService")
local plr                 = Players.LocalPlayer
local playerGui           = plr:WaitForChild("PlayerGui")

--- // ==== ScreenGui ==== \ ---
local gui                 = Instance.new("ScreenGui")
gui.Name                  = "ByteKeyboard"
gui.ResetOnSpawn           = false
gui.Parent                 = playerGui
gui.ZIndexBehavior         = Enum.ZIndexBehavior.Sibling

--- // ==== Scaling ==== \ ---
local SCALE_KEYS           = 0.7
local SCALE_OVERALL        = 1 / 1.25
local BASE_KEYBOARD_WIDTH  = 560
local BASE_TITLE_HEIGHT    = 42
local BASE_BODY_HEIGHT     = 245
local BASE_KEY_HEIGHT      = 42
local BASE_KEY_SPACING     = 6

local KEYBOARD_WIDTH       = BASE_KEYBOARD_WIDTH * SCALE_OVERALL * 1.2
local TITLE_HEIGHT         = BASE_TITLE_HEIGHT * SCALE_OVERALL
local BODY_HEIGHT          = BASE_BODY_HEIGHT * SCALE_OVERALL
local KEY_HEIGHT           = BASE_KEY_HEIGHT * SCALE_KEYS
local KEY_SPACING          = BASE_KEY_SPACING * SCALE_KEYS

--- // ==== Colors ==== \ ---
local baseColor            = Color3.fromRGB(30, 30, 45)
local accentColor          = Color3.fromRGB(90, 50, 255)
local accentHover          = Color3.fromRGB(110, 70, 255)
local keyColor             = Color3.fromRGB(50, 50, 70)
local keyHover             = Color3.fromRGB(70, 70, 100)
local dangerColor          = Color3.fromRGB(220, 60, 60)
local dangerHover          = Color3.fromRGB(255, 90, 90)
local selectGreen          = Color3.fromRGB(40, 200, 100)

--- // ==== Utilities ==== \ ---
local function makeHover(btn, normal, hover)
    btn.MouseEnter:Connect(function()
        btn.BackgroundColor3 = hover
    end)
    btn.MouseLeave:Connect(function()
        btn.BackgroundColor3 = normal
    end)
end

local function makePressGlow(btn)
    btn.MouseButton1Down:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(180,180,255)
        task.wait(0.1)
        btn.BackgroundColor3 = btn:GetAttribute("NormalColor")
    end)
end

--- // ==== Main Frame ==== \ ---
local mainFrame           = Instance.new("Frame")
mainFrame.Size            = UDim2.new(0, KEYBOARD_WIDTH, 0, TITLE_HEIGHT + BODY_HEIGHT - 5)
mainFrame.Position        = UDim2.new(0.5, -KEYBOARD_WIDTH/2, 0.42, -(TITLE_HEIGHT+BODY_HEIGHT)/2)
mainFrame.BackgroundColor3= baseColor
mainFrame.BorderSizePixel = 0
mainFrame.Active          = true
mainFrame.Draggable       = true
mainFrame.Parent          = gui

local mainRound            = Instance.new("UICorner")
mainRound.CornerRadius     = UDim.new(0, 18 * SCALE_OVERALL)
mainRound.Parent            = mainFrame

local mainStroke           = Instance.new("UIStroke")
mainStroke.Color           = accentColor
mainStroke.Thickness       = 2
mainStroke.Parent          = mainFrame

--- // ==== Title Bar ==== \ ---
local titleBar             = Instance.new("Frame")
titleBar.Size              = UDim2.new(1,0,0,TITLE_HEIGHT)
titleBar.BackgroundTransparency = 1
titleBar.Parent            = mainFrame

local titleText            = Instance.new("TextLabel")
titleText.Size             = UDim2.new(1,-100,1,0)
titleText.Position         = UDim2.new(0,12,0,0)
titleText.BackgroundTransparency = 1
titleText.Text             = "Byte Keyboard"
titleText.TextColor3       = Color3.fromRGB(255,255,255)
titleText.Font             = Enum.Font.GothamBold
titleText.TextSize         = 24 * SCALE_OVERALL
titleText.TextXAlignment   = Enum.TextXAlignment.Left
titleText.Parent           = titleBar

--- // ==== Minimize Button (-) ==== \ ---
local minimizeBtn           = Instance.new("TextButton")
minimizeBtn.Size            = UDim2.new(0,32*SCALE_OVERALL,1,0)
minimizeBtn.Position        = UDim2.new(1,-90*SCALE_OVERALL,0,0)
minimizeBtn.BackgroundColor3= accentColor
minimizeBtn.TextColor3      = Color3.new(1,1,1)
minimizeBtn.Font            = Enum.Font.GothamBold
minimizeBtn.TextSize        = 22*SCALE_OVERALL
minimizeBtn.Text             = "-"
minimizeBtn.Parent          = titleBar
minimizeBtn:SetAttribute("NormalColor", accentColor)

local minimizeRound          = Instance.new("UICorner")
minimizeRound.CornerRadius   = UDim.new(0,6)
minimizeRound.Parent         = minimizeBtn

makeHover(minimizeBtn, accentColor, accentHover)
makePressGlow(minimizeBtn)

--- // ==== Close Button (X) ==== \ ---
local closeBtn             = Instance.new("TextButton")
closeBtn.Size              = UDim2.new(0,32*SCALE_OVERALL,1,0)
closeBtn.Position          = UDim2.new(1,-50*SCALE_OVERALL,0,0)
closeBtn.BackgroundColor3  = dangerColor
closeBtn.TextColor3        = Color3.new(1,1,1)
closeBtn.Font              = Enum.Font.GothamBold
closeBtn.TextSize          = 18*SCALE_OVERALL
closeBtn.Text              = "X"
closeBtn.Parent            = titleBar
closeBtn:SetAttribute("NormalColor", dangerColor)

local closeRound            = Instance.new("UICorner")
closeRound.CornerRadius     = UDim.new(0,6)
closeRound.Parent           = closeBtn

makeHover(closeBtn, dangerColor, dangerHover)
makePressGlow(closeBtn)

--- // ==== Body ==== \ ---
local body                 = Instance.new("Frame")
body.Size                  = UDim2.new(1,0,0,BODY_HEIGHT)
body.Position              = UDim2.new(0,0,0,TITLE_HEIGHT)
body.BackgroundTransparency = 1
body.Parent                = mainFrame

--- // ==== Key Map ==== \ ---
local keyMap = {
    {"1","2","3","4","5","6","7","8","9","0","-","=","Backspace"},
    {"Tab","Q","W","E","R","T","Y","U","I","O","P","[","]","\\"},
    {"Caps","A","S","D","F","G","H","J","K","L",";","'","Enter"},
    {"Shift","Z","X","C","V","B","N","M",",",".","/","Shift"},
    {"Ctrl","Win","Alt","Space","Alt","F9","Ctrl"},
}

local keyNameToEnum = {
    ["1"] = "One", ["2"] = "Two", ["3"] = "Three", ["4"] = "Four", ["5"] = "Five",
    ["6"] = "Six", ["7"] = "Seven", ["8"] = "Eight", ["9"] = "Nine", ["0"] = "Zero",
    ["-"] = "Minus", ["="] = "Equals", ["Backspace"] = "Backspace",
    ["Tab"] = "Tab", ["Q"] = "Q", ["W"] = "W", ["E"] = "E", ["R"] = "R", ["T"] = "T",
    ["Y"] = "Y", ["U"] = "U", ["I"] = "I", ["O"] = "O", ["P"] = "P",
    ["["] = "LeftBracket", ["]"] = "RightBracket", ["\\"] = "BackSlash",
    ["Caps"] = "CapsLock", ["A"] = "A", ["S"] = "S", ["D"] = "D", ["F"] = "F",
    ["G"] = "G", ["H"] = "H", ["J"] = "J", ["K"] = "K", ["L"] = "L",
    [";"] = "Semicolon", ["'"] = "Quote", ["Enter"] = "Return",
    ["Shift"] = "LeftShift", ["Ctrl"] = "LeftControl", ["Alt"] = "LeftAlt",
    ["Win"] = "LeftSuper", ["Space"] = "Space",
    ["Z"] = "Z", ["X"] = "X", ["C"] = "C", ["V"] = "V", ["B"] = "B",
    ["N"] = "N", ["M"] = "M", [","] = "Comma", ["."] = "Period", ["/"] = "Slash",
    ["F9"] = "F9"
}

--- // ==== Functons ==== \ ---
local selecting = false

local function createShortcut(keyText)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 60, 0, 40)
    btn.Position = UDim2.new(0.5,0,0.5,0)
    btn.BackgroundColor3 = keyColor
    btn.Text = keyText
    btn.Font = Enum.Font.GothamBold
    btn.TextScaled = true
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Parent = gui
    btn.Active = true
    btn.Draggable = true

    local round = Instance.new("UICorner")
    round.CornerRadius = UDim.new(0,8)
    round.Parent = btn

    local stroke = Instance.new("UIStroke")
    stroke.Color = accentColor
    stroke.Thickness = 2
    stroke.Parent = btn

    makeHover(btn,keyColor,keyHover)

    btn.MouseButton1Click:Connect(function()
        local enumName = keyNameToEnum[keyText]
        if enumName then
            local keyCode = Enum.KeyCode[enumName]
            VirtualInputManager:SendKeyEvent(true,keyCode,false,game)
            VirtualInputManager:SendKeyEvent(false,keyCode,false,game)
        end
    end)

    local closeCircle = Instance.new("TextButton")
    closeCircle.Size = UDim2.new(0,16,0,16)
    closeCircle.Position = UDim2.new(1,-10,0,-6)
    closeCircle.BackgroundColor3 = dangerColor
    closeCircle.Text = "X"
    closeCircle.TextColor3 = Color3.new(1,1,1)
    closeCircle.Font = Enum.Font.GothamBold
    closeCircle.TextScaled = true
    closeCircle.Parent = btn
    closeCircle.ZIndex = btn.ZIndex + 1

    local ccRound = Instance.new("UICorner")
    ccRound.CornerRadius = UDim.new(1,0)
    ccRound.Parent = closeCircle

    closeCircle.MouseButton1Click:Connect(function()
        btn:Destroy()
    end)
end

--- // ==== Create Keys ==== \ ---
local function getKeyWidth(key)
    local baseWidth = 42 * SCALE_KEYS
    local wide = {
        Backspace = baseWidth*2.5,
        Tab       = baseWidth*1.6,
        Caps      = baseWidth*1.8,
        Enter     = baseWidth*2.5,
        Shift     = baseWidth*2.5,
        Space     = baseWidth*6.5,
        Ctrl      = baseWidth*1.5,
        Alt       = baseWidth*1.5,
        Win       = baseWidth*1.5,
        F9        = baseWidth*1.5
    }
    return wide[key] or baseWidth
end

local startY = KEY_SPACING

for rowIndex,row in ipairs(keyMap) do
    local x = KEY_SPACING
    for _, keyText in ipairs(row) do
        local width = getKeyWidth(keyText)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0,width,0,KEY_HEIGHT)
        btn.Position = UDim2.new(0,x,0,startY+(rowIndex-1)*(KEY_HEIGHT+KEY_SPACING))
        btn.Text = keyText
        btn.Font = Enum.Font.GothamBold
        btn.TextScaled = true
        btn.TextColor3 = Color3.new(1,1,1)
        btn.BackgroundColor3 = keyColor
        btn.BorderSizePixel = 0
        btn.Parent = body

        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0,6)
        corner.Parent = btn

        local stroke = Instance.new("UIStroke")
        stroke.Color = accentColor
        stroke.Thickness = 1
        stroke.Parent = btn

        makeHover(btn,keyColor,keyHover)

        btn.MouseButton1Click:Connect(function()
            local enumName = keyNameToEnum[keyText]
            if enumName then
                local keyCode = Enum.KeyCode[enumName]
                VirtualInputManager:SendKeyEvent(true,keyCode,false,game)
                VirtualInputManager:SendKeyEvent(false,keyCode,false,game)
            end
            if selecting then
                createShortcut(keyText)
                selecting = false
            end
        end)

        x += width + KEY_SPACING
    end
end

--- // ==== Shortcut btn ==== \ ---
local plusBtn = Instance.new("TextButton")
plusBtn.Size = UDim2.new(0,32,0,32)
plusBtn.Position = UDim2.new(1,-40,1,-40)
plusBtn.BackgroundColor3 = baseColor
plusBtn.Text = "+"
plusBtn.TextColor3 = Color3.new(1,1,1)
plusBtn.Font = Enum.Font.GothamBold
plusBtn.TextScaled = true
plusBtn.Parent = mainFrame

local plusRound = Instance.new("UICorner")
plusRound.CornerRadius = UDim.new(0,8)
plusRound.Parent = plusBtn

local plusStroke = Instance.new("UIStroke")
plusStroke.Color = accentColor
plusStroke.Thickness = 2
plusStroke.Parent = plusBtn

plusBtn.MouseButton1Click:Connect(function()
    selecting = not selecting
    if selecting then
        plusStroke.Color = selectGreen
        titleText.Text = "Byte Keyboard (Selecting key)"
    else
        plusStroke.Color = accentColor
        titleText.Text = "Byte Keyboard"
    end
end)

--- // ==== Show Button ==== \ ---
local minimizerBtn = Instance.new("TextButton")
local minimizeSize = 36
minimizerBtn.Size = UDim2.new(0,minimizeSize,0,minimizeSize)
minimizerBtn.Position = UDim2.new(0.022,0,0,12)
minimizerBtn.BackgroundColor3 = accentColor
minimizerBtn.Text = "B"
minimizerBtn.TextColor3 = Color3.new(1,1,1)
minimizerBtn.Font = Enum.Font.GothamBold
minimizerBtn.TextScaled = true
minimizerBtn.Parent = gui
minimizerBtn.Visible = false
minimizerBtn.BorderSizePixel = 0
minimizerBtn.ZIndex = 2000
minimizerBtn:SetAttribute("NormalColor", accentColor)

local miniRound = Instance.new("UICorner")
miniRound.CornerRadius = UDim.new(0,8)
miniRound.Parent = minimizerBtn

makeHover(minimizerBtn, accentColor, accentHover)
makePressGlow(minimizerBtn)

--- // ==== Tweens ==== \ ---
local tweenInfo = TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

local function tweenToCenter()
    mainFrame.Visible = true
    minimizeBtn.Visible = true
    minimizerBtn.Visible = false
    local target = UDim2.new(0.5, -KEYBOARD_WIDTH/2, 0.42, -(TITLE_HEIGHT+BODY_HEIGHT)/2)
    TweenService:Create(mainFrame,tweenInfo,{Position = target}):Play()
    body.Visible = true
end

local function tweenToLeftAndHide()
    local offscreen = UDim2.new(-1,0,mainFrame.Position.Y.Scale,mainFrame.Position.Y.Offset)
    local tween = TweenService:Create(mainFrame,tweenInfo,{Position = offscreen})
    tween:Play()
    tween.Completed:Wait()
    mainFrame.Visible = false
    minimizeBtn.Visible = false
    minimizerBtn.Visible = true
    body.Visible = false
end

minimizeBtn.MouseButton1Click:Connect(tweenToLeftAndHide)
minimizerBtn.MouseButton1Click:Connect(tweenToCenter)
closeBtn.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

plr.CharacterAdded:Connect(function()
    local newGui = plr:WaitForChild("PlayerGui")
    gui.Parent = newGui
end)
