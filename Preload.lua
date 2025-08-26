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
76,111,99,97,108,45,72,117,98,95,75,101,121,95,33,88,50,109,36,65,56,112,42,90,55,114,64,81,49,118,36,76,52,116,94,75,50,117,38,70,53,109,43,83,57,118,61,89,51,110,126,68,50,99,63,74,54,119,58,86,49,101,59,82,56,113,124,72,53,111,60,70,52,115,36,71,57,116,64,72,54,117,35,73,50,118,94,74,57,119,38,75,56,120,42,76,49,121,40,77,48,122,41,65,53,66,33,67,50,68,35,69,51,70,36,71,52,72,37,73,53,74,38,75,54,76,42,77,55,78,40,79,56,80,41,81,57,82,64,83,48,84,33,85,49,86,35,87,50,88,36,89,51,90,37,97,52,98,38,99,53,100,42,101,54,102,40,103,55,104,41,105,56,106,64,107,57,108,33,109,48,110,35,111,49,112,36,113,50,114,37,115,51,116,42,117,52,118,40,119,53,120,41,121,54,122,64 }

local function decodeKey(t)
    local s = ""
    for i=1,#t do s = s..string.char(t[i]) end
    return s
end
local realKey = decodeKey(hiddenKey)

local keyEntered = false
EnterButton.MouseButton1Click:Connect(function()
    if TextBox.Text == realKey then
        Frame:Destroy()
        keyEntered = true
        notif("Local Hub", "Valid key!")
    else
        notif("Local Hub", "Invalid Key!")
    end
end)

TweenService:Create(Frame, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, 0, 0.5, 0)}):Play()

while not keyEntered do task.wait() end
notif("Local Hub", "Now loading main script...")