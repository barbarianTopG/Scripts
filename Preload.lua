-- /// Blacklist
loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/ScriptLoader/refs/heads/main/Blacklist.lua"))()

-- /// DevTag
loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/ScriptLoader/main/DevTag.lua"))()

-- /// Key System
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")
local StarterGui = game:GetService("StarterGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = PlayerGui
ScreenGui.ResetOnSpawn = false

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 350, 0, 300)
Frame.Position = UDim2.new(0.5, -175, -1, 0)
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame.BorderSizePixel = 0
Frame.ClipsDescendants = true
Frame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 15)
UICorner.Parent = Frame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.Text = "Key System"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 20
Title.Parent = Frame

local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(0.8, 0, 0, 40)
TextBox.Position = UDim2.new(0.1, 0, 0.25, 0)
TextBox.PlaceholderText = "Enter Key..."
TextBox.Text = ""
TextBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Font = Enum.Font.Gotham
TextBox.TextSize = 16
TextBox.TextTruncate = Enum.TextTruncate.AtEnd
TextBox.ClipsDescendants = true
TextBox.Parent = Frame

local boxCorner = Instance.new("UICorner")
boxCorner.CornerRadius = UDim.new(0, 10)
boxCorner.Parent = TextBox

local EnterButton = Instance.new("TextButton")
EnterButton.Size = UDim2.new(0.5, 0, 0, 40)
EnterButton.Position = UDim2.new(0.25, 0, 0.45, 0)
EnterButton.Text = "Enter"
EnterButton.TextColor3 = Color3.fromRGB(255, 255, 255)
EnterButton.BackgroundColor3 = Color3.fromRGB(0, 122, 255)
EnterButton.Font = Enum.Font.GothamBold
EnterButton.TextSize = 18
EnterButton.Parent = Frame

local enterCorner = Instance.new("UICorner")
enterCorner.CornerRadius = UDim.new(0, 10)
enterCorner.Parent = EnterButton

local DiscordLink = Instance.new("TextButton")
DiscordLink.Size = UDim2.new(0.8, 0, 0, 30)
DiscordLink.Position = UDim2.new(0.1, 0, 0.65, 0)
DiscordLink.Text = "Join our Discord: discord.gg/XXtB3Vth53"
DiscordLink.TextColor3 = Color3.fromRGB(200, 200, 200)
DiscordLink.BackgroundTransparency = 0.3
DiscordLink.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
DiscordLink.Font = Enum.Font.Gotham
DiscordLink.TextSize = 14
DiscordLink.Parent = Frame

local dcCorner = Instance.new("UICorner")
dcCorner.CornerRadius = UDim.new(0, 6)
dcCorner.Parent = DiscordLink

local HowToGet = Instance.new("TextButton")
HowToGet.Size = UDim2.new(0.8, 0, 0, 30)
HowToGet.Position = UDim2.new(0.1, 0, 0.8, 0)
HowToGet.Text = "How to get key?"
HowToGet.TextColor3 = Color3.fromRGB(0, 122, 255)
HowToGet.BackgroundTransparency = 1
HowToGet.Font = Enum.Font.GothamBold
HowToGet.TextSize = 14
HowToGet.Parent = Frame

local function notif(title, text)
    StarterGui:SetCore("SendNotification", {Title = title, Text = text, Duration = 5})
end

local function flashTextLabel(label, duration)
    local originalColor = label.TextColor3
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    task.delay(duration, function() label.TextColor3 = originalColor end)
end

DiscordLink.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/XXtB3Vth53")
    flashTextLabel(DiscordLink, 0.2)
    notif("Local Hub", "Discord invite copied to clipboard!")
end)

HowToGet.MouseButton1Click:Connect(function()
    notif("Local Hub", "To get key:\n1. Join our discord\n2. Copy the key\n3. Enter it here!")
    flashTextLabel(HowToGet, 0.2)
end)

local hiddenKey = {
76,111,99,97,108,45,72,117,98,45,75,101,121,95,49,57,100,106,50,111,101,106,105,
119,107,115,107,104,57,107,49,49,57,107,100,105,113,108,115,107,57,49,108,122,
108,99,109,109,46,122,110,105,100,57,42,40,35,41,42,33,57,49,57,115,106,100,107,
48,49,115,107,107,48,113,111,122,107,99,108,116,112,51,48,50,105,119,108,103,108,
121,112,52,48,119,105,115,104,99,106,116,57,52,57,51,105,110,110,111,50,50,57,
97,107,108,102,112,116,57,51,117,119,106,102,107,116,48,52,57,51,110,107,103,112,
116,57,51,117,50,115,107,102,112,52,57,50,117,101,106,111,116,48,101,56,119,105,
119,120,107,107,103,112,51,106,113,103,122,120,121,117,102,57,51,50,98,115,103,
121,102,56,114,112,116,112,108,103,106,100,104,119,117,101,55,114,105,116,107,120,
110,115,104,119,105,116,111,116,107,100,104,117,119,105,114,111,49,117,105,115,
57,99,111,53,111,51,48,50,56,119,55,117,102,105,51,57,50,57,49,105,122,117,120,
106,109,102,48,50,57,122,106,110,99,105,51,51,56,50,54,50,55
}

local function decodeKey(t)
    local s = ""
    for i = 1, #t do
        s = s .. string.char(t[i])
    end
    return s
end

local realKey = decodeKey(hiddenKey)

local function checkKey()
    if TextBox.Text == realKey then
        Frame:Destroy()
        notif("Local Hub", "Valid key!")
        task.wait(0.5)
        notif("Local Hub", "Executing next script...")
    else
        notif("Local Hub", "Invalid Key!")
    end
end

EnterButton.MouseButton1Click:Connect(checkKey)

local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
local goal = {Position = UDim2.new(0.5, 0, 0.5, 0)}
local tween = TweenService:Create(Frame, tweenInfo, goal)
tween:Play()