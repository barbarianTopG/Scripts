local TweenService = game:GetService("TweenService")
local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SlideDownGui"
screenGui.Parent = playerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 480, 0, 140)
frame.Position = UDim2.new(0.5, 0, -0.25, 0)
frame.AnchorPoint = Vector2.new(0.5, 0)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BackgroundTransparency = 0
frame.ClipsDescendants = true
frame.Parent = screenGui

local uicorner = Instance.new("UICorner")
uicorner.CornerRadius = UDim.new(0, 15)
uicorner.Parent = frame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -20, 0, 40)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Itz time!!!!1!"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextSize = 36
title.TextWrapped = true
title.Parent = frame

local text = Instance.new("TextLabel")
text.Size = UDim2.new(1, -20, 0, 40)
text.Position = UDim2.new(0, 10, 0, 40)
text.BackgroundTransparency = 1
text.Text = "Are you ready to use these epik r6 dancezz?"
text.TextColor3 = Color3.new(1, 1, 1)
text.Font = Enum.Font.Gotham
text.TextSize = 24
text.TextWrapped = true
text.Parent = frame

local buttonYes = Instance.new("TextButton")
buttonYes.Size = UDim2.new(0, 140, 0, 40)
buttonYes.Position = UDim2.new(0.15, 0, 0, 90)
buttonYes.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
buttonYes.Text = "Yes"
buttonYes.TextColor3 = Color3.new(1, 1, 1)
buttonYes.Font = Enum.Font.GothamBold
buttonYes.TextSize = 28
buttonYes.Parent = frame

local yesCorner = Instance.new("UICorner")
yesCorner.CornerRadius = UDim.new(0, 10)
yesCorner.Parent = buttonYes

local buttonNo = Instance.new("TextButton")
buttonNo.Size = UDim2.new(0, 140, 0, 40)
buttonNo.Position = UDim2.new(0.55, 0, 0, 90)
buttonNo.BackgroundColor3 = Color3.fromRGB(150, 50, 50)
buttonNo.Text = "No"
buttonNo.TextColor3 = Color3.new(1, 1, 1)
buttonNo.Font = Enum.Font.GothamBold
buttonNo.TextSize = 28
buttonNo.Parent = frame

local noCorner = Instance.new("UICorner")
noCorner.CornerRadius = UDim.new(0, 10)
noCorner.Parent = buttonNo

local tweenIn = TweenService:Create(frame, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Position = UDim2.new(0.5, 0, 0, 50)
})
tweenIn:Play()

local function closeGui()
        local tweenOut = TweenService:Create(frame, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Position = UDim2.new(0.5, 0, -0.25, 0)
        })
        tweenOut:Play()
        tweenOut.Completed:Wait()
        screenGui:Destroy()
end

buttonYes.MouseButton1Click:Connect(function()
        closeGui()
        StarterGui:SetCore("SendNotification", {
                Title = "Limb Reanim V2",
                Text = "ENJOY!",
                Icon = "rbxthumb://type=Asset&id=13775452736&w=150&h=150"
        })

        _G["Use default animations"] = true
        _G["Fake character transparency level"] = 1
        _G["Disable character scripts"] = true
        _G["Fake character should collide"] = true
        _G["Parent real character to fake character"] = false
        _G["Respawn character"] = true
        _G["Instant respawn"] = false
        _G["Hide HumanoidRootPart"] = false
        _G["PermaDeath fake character"] = false
        _G["Names to exclude from transparency"] = {}

        if getgenv then
                getgenv().fling = nil
        else
                _G.fling = nil
        end

        task.spawn(function()
                pcall(function()
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV2/main/v2"))()
                end)
                pcall(function()
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/MyScripts/refs/heads/main/DevTag.lua"))()
                        task.wait(0.1)
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/gObl00x/My-Scripts/main/Epik%20R6%20Dancezz"))()
                end)
        end)
end)

buttonNo.MouseButton1Click:Connect(function()
        player:Kick("U Noob")
end)