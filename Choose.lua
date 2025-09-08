-- SimpleEmotes with External Emote Loading
if not game:IsLoaded() then
    game.Loaded:Wait()
end

repeat wait() until game.Players.LocalPlayer

local Player = game.Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- Custom wait function
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
UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
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
        return loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/ScriptLoader/refs/heads/main/Emotes.lua"))()
    end)
    
    if success and type(result) == "table" then
        return result
    else
        notify("Failed to load emotes, using defaults")

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