-- SimpleEmotes (Beta)

if not game:IsLoaded() then
    game.Loaded:Wait()
end

repeat wait() until game.Players.LocalPlayer

local Player = game.Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local Wait = task.wait

-- Color scheme
local MAIN_COLOR = Color3.fromRGB(100, 50, 200)
local ACCENT_COLOR = Color3.fromRGB(150, 80, 255)
local BACKGROUND_COLOR = Color3.fromRGB(30, 20, 50)
local TEXT_COLOR = Color3.fromRGB(255, 255, 255)
local GLOW_COLOR = Color3.fromRGB(200, 100, 255)

-- Notification function
local function notify(message, duration)
    duration = duration or 3
    
    local notification = Instance.new("Frame")
    notification.Size = UDim2.new(0, 300, 0, 60)
    notification.Position = UDim2.new(1, -320, 1, -80)
    notification.AnchorPoint = Vector2.new(1, 1)
    notification.BackgroundColor3 = BACKGROUND_COLOR
    notification.BorderSizePixel = 0
    notification.ZIndex = 10
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = notification
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = GLOW_COLOR
    stroke.Thickness = 2
    stroke.Parent = notification
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -20, 1, -20)
    label.Position = UDim2.new(0, 10, 0, 10)
    label.BackgroundTransparency = 1
    label.Text = message
    label.TextColor3 = TEXT_COLOR
    label.Font = Enum.Font.Arcade
    label.TextSize = 16
    label.TextWrapped = true
    label.TextStrokeTransparency = 0.7
    label.TextStrokeColor3 = GLOW_COLOR
    label.Parent = notification
    
    notification.Parent = PlayerGui
    
    -- Animation
    notification.Position = UDim2.new(1, 300, 1, -80)
    game:GetService("TweenService"):Create(
        notification, 
        TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {Position = UDim2.new(1, -320, 1, -80)}
    ):Play()
    
    Wait(duration)
    
    game:GetService("TweenService"):Create(
        notification, 
        TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {Position = UDim2.new(1, 300, 1, -80)}
    ):Play()
    
    Wait(0.5)
    notification:Destroy()
end

-- Reanimation selection GUI
local SelectorGui = Instance.new("ScreenGui")
SelectorGui.Name = "ReanimationSelector"
SelectorGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
SelectorGui.ResetOnSpawn = false

local SelectorFrame = Instance.new("Frame")
SelectorFrame.Size = UDim2.new(0, 300, 0, 200)
SelectorFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
SelectorFrame.AnchorPoint = Vector2.new(0.5, 0.5)
SelectorFrame.BackgroundColor3 = BACKGROUND_COLOR
SelectorFrame.BorderSizePixel = 0
SelectorFrame.Parent = SelectorGui

local SelectorCorner = Instance.new("UICorner")
SelectorCorner.CornerRadius = UDim.new(0, 12)
SelectorCorner.Parent = SelectorFrame

local SelectorStroke = Instance.new("UIStroke")
SelectorStroke.Color = GLOW_COLOR
SelectorStroke.Thickness = 3
SelectorStroke.Parent = SelectorFrame

local SelectorTitle = Instance.new("TextLabel")
SelectorTitle.Size = UDim2.new(1, 0, 0, 40)
SelectorTitle.Position = UDim2.new(0, 0, 0, 0)
SelectorTitle.BackgroundTransparency = 1
SelectorTitle.Text = "SELECT REANIMATION"
SelectorTitle.TextColor3 = ACCENT_COLOR
SelectorTitle.Font = Enum.Font.Arcade
SelectorTitle.TextSize = 20
SelectorTitle.TextStrokeTransparency = 0.8
SelectorTitle.TextStrokeColor3 = GLOW_COLOR
SelectorTitle.Parent = SelectorFrame

local SelectorDivider = Instance.new("Frame")
SelectorDivider.Size = UDim2.new(1, -20, 0, 2)
SelectorDivider.Position = UDim2.new(0, 10, 0, 40)
SelectorDivider.BackgroundColor3 = ACCENT_COLOR
SelectorDivider.BorderSizePixel = 0
SelectorDivider.Parent = SelectorFrame

local ButtonContainer = Instance.new("Frame")
ButtonContainer.Size = UDim2.new(1, -20, 0, 120)
ButtonContainer.Position = UDim2.new(0, 10, 0, 50)
ButtonContainer.BackgroundTransparency = 1
ButtonContainer.Parent = SelectorFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.FillDirection = Enum.FillDirection.Vertical
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.VerticalAlignment = Enum.VertualAlignment.Center
UIListLayout.Padding = UDim.new(0, 10)
UIListLayout.Parent = ButtonContainer

-- Reanimation options
local reanimOptions = {
    {
        Name = "GELATEK REANIM",
        Color = Color3.fromRGB(150, 80, 255),
        LoadFunction = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/DevTools/refs/heads/main/Reanimate.lua"))()
        end
    },
    {
        Name = "CURRENTANGLE REANIM",
        Color = Color3.fromRGB(180, 100, 255),
        LoadFunction = function()
            local settings = {
                ["Use default animations"] = true,
                ["Fake character transparency level"] = 1,
                ["Disable character scripts"] = true,
                ["Fake character should collide"] = true,
                ["Parent real character to fake character"] = false,
                ["Respawn character"] = true,
                ["Instant respawn"] = false,
                ["Hide HumanoidRootPart"] = false,
                ["PermaDeath fake character"] = false,
                ["R15 Reanimate"] = false,
                ["Click Fling"] = false,
                ["Hide RootPart Distance"] = CFrame.new(255, 255, 0),
                ["Names to exclude from transparency"] = {}
            }
            
            for k, v in pairs(settings) do
                _G[k] = v
            end
            
            loadstring(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV4/refs/heads/main/currentanglev2.5.lua"))()
        end
    }
}

local selectedReanim = nil

for _, option in ipairs(reanimOptions) do
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 0, 50)
    button.BackgroundColor3 = option.Color
    button.AutoButtonColor = false
    button.Text = option.Name
    button.TextColor3 = TEXT_COLOR
    button.Font = Enum.Font.Arcade
    button.TextSize = 16
    button.TextStrokeTransparency = 0.5
    button.TextStrokeColor3 = GLOW_COLOR
    
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 8)
    buttonCorner.Parent = button
    
    local buttonStroke = Instance.new("UIStroke")
    buttonStroke.Color = GLOW_COLOR
    buttonStroke.Thickness = 2
    buttonStroke.Parent = button
    
    button.MouseEnter:Connect(function()
        game:GetService("TweenService"):Create(button, TweenInfo.new(0.2), {BackgroundColor3 = option.Color:Lerp(Color3.new(1,1,1), 0.2)}):Play()
        game:GetService("TweenService"):Create(buttonStroke, TweenInfo.new(0.2), {Thickness = 3}):Play()
    end)
    
    button.MouseLeave:Connect(function()
        game:GetService("TweenService"):Create(button, TweenInfo.new(0.2), {BackgroundColor3 = option.Color}):Play()
        game:GetService("TweenService"):Create(buttonStroke, TweenInfo.new(0.2), {Thickness = 2}):Play()
    end)
    
    button.MouseButton1Click:Connect(function()
        selectedReanim = option
        SelectorGui.Enabled = false
        notify("Loading " .. option.Name .. "...")
        option.LoadFunction()
        Wait(5)
        loadEmotesGUI()
    end)
    
    button.Parent = ButtonContainer
end

SelectorGui.Parent = PlayerGui
notify("Please select a reanimation method")

-- Function to load emotes from external source
local function loadEmotesFromSource()
    local success, result = pcall(function()
        -- Replace this URL with your emote data loadstring
        return loadstring(game:HttpGet("YOUR_EMOTE_LOADSTRING_URL_HERE"))()
    end)
    
    if success and type(result) == "table" then
        return result
    else
        notify("Failed to load emotes, using defaults")
        -- Return empty table - we'll add default emotes in part 2
        return {}
    end
end

-- Animation state
local isAnimating = false
local currentAnimation = nil

-- Function to lerp between CFrame values
local function lerpCFrame(c0, c1, alpha)
    return c0:lerp(c1, alpha)
end

-- Function to play animation
local function playAnimation(animationName, animations)
    if isAnimating then return end
    isAnimating = true
    
    local char = game.Players.LocalPlayer.Character
    if not char then
        isAnimating = false
        return
    end
    
    local torso = char:FindFirstChild("UpperTorso") or char:FindFirstChild("Torso")
    if not torso then
        isAnimating = false
        return
    end
    
    -- Store original motor CFrame values
    local originalMotors = {}
    for _, motorName in ipairs({"Right Shoulder", "Left Shoulder", "Right Hip", "Left Hip", "Neck"}) do
        local motor = torso:FindFirstChild(motorName)
        if motor then
            originalMotors[motorName] = motor.C0
        end
    end
    
    local animationFrames = animations[animationName]
    if not animationFrames then
        notify("Animation not found: " .. animationName)
        isAnimating = false
        return
    end
    
    local currentFrame = 1
    local lerpSpeed = 0.2
    
    spawn(function()
        while isAnimating and char and char.Parent do
            local targetFrame = animationFrames[currentFrame]
            local nextFrame = animationFrames[currentFrame % #animationFrames + 1]
            
            -- Animate to the target frame
            for i = 0, 1, lerpSpeed do
                if not isAnimating or not char or not char.Parent then break end
                
                for _, motorData in ipairs(targetFrame) do
                    local motorName, targetCFrame = motorData[1], motorData[2]
                    local motor = torso:FindFirstChild(motorName)
                    
                    if motor then
                        local nextMotorData
                        for _, data in ipairs(nextFrame) do
                            if data[1] == motorName then
                                nextMotorData = data
                                break
                            end
                        end
                        
                        local nextCFrame = nextMotorData and nextMotorData[2] or targetCFrame
                        motor.C0 = lerpCFrame(targetCFrame, nextCFrame, i)
                    end
                end
                Wait()
            end
            
            currentFrame = currentFrame % #animationFrames + 1
        end
        
        -- Return to original position
        for motorName, originalCFrame in pairs(originalMotors) do
            local motor = torso:FindFirstChild(motorName)
            if motor then
                for i = 0, 1, 0.1 do
                    if not char or not char.Parent then break end
                    motor.C0 = lerpCFrame(motor.C0, originalCFrame, i)
                    Wait()
                end
                motor.C0 = originalCFrame
            end
        end
        
        isAnimating = false
    end)
end

-- Function to load the emotes GUI
function loadEmotesGUI()
    -- Load emotes from external source
    local loadedEmotes = loadEmotesFromSource()
    
    -- Create main GUI
    local SimpleEmotes = Instance.new("ScreenGui")
    SimpleEmotes.Name = "SimpleEmotes"
    SimpleEmotes.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    SimpleEmotes.ResetOnSpawn = false

    -- Main frame with neon glow effect
    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 250, 0, 180)
    MainFrame.Position = UDim2.new(0.5, -125, 0.5, -90)
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.BackgroundColor3 = BACKGROUND_COLOR
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = SimpleEmotes

    -- UI Corner
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 12)
    UICorner.Parent = MainFrame

    -- UI Stroke for glow effect
    local UIStroke = Instance.new("UIStroke")
    UIStroke.Color = GLOW_COLOR
    UIStroke.Thickness = 3
    UIStroke.Transparency = 0.7
    UIStroke.Parent = MainFrame

    -- Title with arcade font
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, 0, 0, 40)
    Title.Position = UDim2.new(0, 0, 0, 0)
    Title.BackgroundTransparency = 1
    Title.Text = "SIMPLE EMOTES"
    Title.TextColor3 = ACCENT_COLOR
    Title.Font = Enum.Font.Arcade
    Title.TextSize = 20
    Title.TextStrokeTransparency = 0.8
    Title.TextStrokeColor3 = GLOW_COLOR
    Title.Parent = MainFrame

    -- Divider
    local Divider = Instance.new("Frame")
    Divider.Size = UDim2.new(1, -20, 0, 2)
    Divider.Position = UDim2.new(0, 10, 0, 40)
    Divider.BackgroundColor3 = ACCENT_COLOR
    Divider.BorderSizePixel = 0
    Divider.Parent = MainFrame

    -- Buttons container
    local ButtonsContainer = Instance.new("Frame")
    ButtonsContainer.Size = UDim2.new(1, -20, 0, 120)
    ButtonsContainer.Position = UDim2.new(0, 10, 0, 50)
    ButtonsContainer.BackgroundTransparency = 1
    ButtonsContainer.Parent = MainFrame

    -- UI Grid Layout
    local UIGridLayout = Instance.new("UIGridLayout")
    UIGridLayout.CellSize = UDim2.new(0.45, 0, 0.45, 0)
    UIGridLayout.CellPadding = UDim2.new(0, 10, 0, 10)
    UIGridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIGridLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    UIGridLayout.Parent = ButtonsContainer

    -- Create emote buttons based on loaded emotes
    local emoteButtons = {}
    local emoteColors = {
        Color3.fromRGB(150, 80, 255),
        Color3.fromRGB(180, 100, 255),
        Color3.fromRGB(120, 60, 220),
        Color3.fromRGB(200, 120, 255),
        Color3.fromRGB(160, 90, 240),
        Color3.fromRGB(140, 70, 230)
    }

    local emoteIndex = 1
    for emoteName, _ in pairs(loadedEmotes) do
        if emoteIndex <= 6 then -- Limit to 6 emotes for UI space
            local button = Instance.new("TextButton")
            button.Size = UDim2.new(1, 0, 1, 0)
            button.BackgroundColor3 = emoteColors[emoteIndex]
            button.AutoButtonColor = false
            button.Text = string.sub(emoteName, 1, 1) -- First letter as button text
            button.TextColor3 = TEXT_COLOR
            button.Font = Enum.Font.Arcade
            button.TextSize = 18
            button.TextStrokeTransparency = 0.5
            button.TextStrokeColor3 = GLOW_COLOR
            
            local buttonCorner = Instance.new("UICorner")
            buttonCorner.CornerRadius = UDim.new(0, 8)
            buttonCorner.Parent = button
            
            local buttonStroke = Instance.new("UIStroke")
            buttonStroke.Color = GLOW_COLOR
            buttonStroke.Thickness = 2
            buttonStroke.Parent = button
            
            local emoteLabel = Instance.new("TextLabel")
            emoteLabel.Size = UDim2.new(1, 0, 0, 14)
            emoteLabel.Position = UDim2.new(0, 0, 0, -16)
            emoteLabel.BackgroundTransparency = 1
            emoteLabel.Text = emoteName:upper()
            emoteLabel.TextColor3 = TEXT_COLOR
            emoteLabel.Font = Enum.Font.Arcade
            emoteLabel.TextSize = 10
            emoteLabel.TextStrokeTransparency = 0.7
            emoteLabel.TextStrokeColor3 = GLOW_COLOR
            emoteLabel.Parent = button
            
            -- Hover effects
            button.MouseEnter:Connect(function()
                game:GetService("TweenService"):Create(button, TweenInfo.new(0.2), {BackgroundColor3 = emoteColors[emoteIndex]:Lerp(Color3.new(1,1,1), 0.2)}):Play()
                game:GetService("TweenService"):Create(buttonStroke, TweenInfo.new(0.2), {Thickness = 3}):Play()
            end)
            
            button.MouseLeave:Connect(function()
                game:GetService("TweenService"):Create(button, TweenInfo.new(0.2), {BackgroundColor3 = emoteColors[emoteIndex]}):Play()
                game:GetService("TweenService"):Create(buttonStroke, TweenInfo.new(0.2), {Thickness = 2}):Play()
            end)
            
            button.MouseButton1Click:Connect(function()
                playAnimation(emoteName, loadedEmotes)
            end)
            
            button.Parent = ButtonsContainer
            emoteButtons[emoteName] = button
            emoteIndex = emoteIndex + 1
        end
    end

    -- Minimizer button
    local Minimizer = Instance.new("TextButton")
    Minimizer.Size = UDim2.new(0, 30, 0, 30)
    Minimizer.Position = UDim2.new(1, -35, 0, 5)
    Minimizer.BackgroundColor3 = MAIN_COLOR
    Minimizer.AutoButtonColor = false
    Minimizer.Text = "-"
    Minimizer.TextColor3 = TEXT_COLOR
    Minimizer.Font = Enum.Font.Arcade
    Minimizer.TextSize = 20
    Minimizer.TextStrokeTransparency = 0.5
    Minimizer.TextStrokeColor3 = GLOW_COLOR
    Minimizer.Parent = MainFrame

    local MinimizerCorner = Instance.new("UICorner")
    MinimizerCorner.CornerRadius = UDim.new(0, 6)
    MinimizerCorner.Parent = Minimizer

    local MinimizerStroke = Instance.new("UIStroke")
    MinimizerStroke.Color = GLOW_COLOR
    MinimizerStroke.Thickness = 2
    MinimizerStroke.Parent = Minimizer

    -- Minimized version
    local MinimizedFrame = Instance.new("Frame")
    MinimizedFrame.Size = UDim2.new(0, 40, 0, 40)
    MinimizedFrame.Position = UDim2.new(0, 10, 0, 10)
    MinimizedFrame.BackgroundColor3 = BACKGROUND_COLOR
    MinimizedFrame.BorderSizePixel = 0
    MinimizedFrame.Visible = false
    MinimizedFrame.Parent = SimpleEmotes

    local MinimizedCorner = Instance.new("UICorner")
    MinimizedCorner.CornerRadius = UDim.new(0, 8)
    MinimizedCorner.Parent = MinimizedFrame

    local MinimizedStroke = Instance.new("UIStroke")
    MinimizedStroke.Color = GLOW_COLOR
    MinimizedStroke.Thickness = 2
    MinimizedStroke.Parent = MinimizedFrame

    local Maximizer = Instance.new("TextButton")
    Maximizer.Size = UDim2.new(1, 0, 1, 0)
    Maximizer.BackgroundColor3 = MAIN_COLOR
    Maximizer.AutoButtonColor = false
    Maximizer.Text = "+"
    Maximizer.TextColor3 = TEXT_COLOR
    Maximizer.Font = Enum.Font.Arcade
    Maximizer.TextSize = 20
    Maximizer.TextStrokeTransparency = 0.5
    Maximizer.TextStrokeColor3 = GLOW_COLOR
    Maximizer.Parent = MinimizedFrame

    local MaximizerCorner = Instance.new("UICorner")
    MaximizerCorner.CornerRadius = UDim.new(0, 8)
    MaximizerCorner.Parent = Maximizer

    -- Minimizer functionality
    local isMinimized = false

    Minimizer.MouseButton1Click:Connect(function()
        isMinimized = true
        MainFrame.Visible = false
        MinimizedFrame.Visible = true
        MinimizedFrame.Position = MainFrame.Position
    end)

    Maximizer.MouseButton1Click:Connect(function()
        isMinimized = false
        MainFrame.Visible = true
        MinimizedFrame.Visible = false
    end)

    -- Drag functionality
    local dragging = false
    local dragInput, dragStart, startPos

    local function update(input)
        local delta = input.Position - dragStart
        if isMinimized then
            MinimizedFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        else
            MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end

    MainFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = MainFrame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    MinimizedFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = MinimizedFrame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    MainFrame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    MinimizedFrame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)

    SimpleEmotes.Parent = PlayerGui
    notify("Emotes loaded successfully!")
end

-- Keyboard shortcuts
local UIS = game:GetService("UserInputService")

UIS.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    -- Add keyboard shortcuts here if needed
end)

notify("SimpleEmotes loaded! Select a reanimation method to begin")