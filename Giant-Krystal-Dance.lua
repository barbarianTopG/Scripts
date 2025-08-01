local TweenService = game:GetService("TweenService")
local player = game.Players.LocalPlayer

local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "WelcomeGui"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Global

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 450, 0, 300)
frame.Position = UDim2.new(0, -500, 0.5, -150)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.BorderSizePixel = 0
frame.ClipsDescendants = true
frame.AnchorPoint = Vector2.new(0, 0)
frame.ZIndex = 10
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)

TweenService:Create(frame, TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
    Position = UDim2.new(0.5, -225, 0.5, -150)
}):Play()

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 50)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Welcome"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBlack
title.TextScaled = true
title.ZIndex = 11

local disclaimer = Instance.new("TextLabel", frame)
disclaimer.Size = UDim2.new(1, -20, 0, 180)
disclaimer.Position = UDim2.new(0, 10, 0, 60)
disclaimer.BackgroundTransparency = 1
disclaimer.TextColor3 = Color3.fromRGB(230, 230, 230)
disclaimer.Font = Enum.Font.Gotham
disclaimer.TextWrapped = true
disclaimer.TextScaled = true
disclaimer.TextYAlignment = Enum.TextYAlignment.Top
disclaimer.Text = "‼️‼️ Disclaimer ‼️‼️\nI do not own the loadstrings inside this script, credits to Sonixery for EKDV1, Crimson and hemi for original Krystal dance.\nAlso credits to mzha for Huge Giant"
disclaimer.ZIndex = 11

local executeButton = Instance.new("TextButton", frame)
executeButton.Size = UDim2.new(0, 200, 0, 40)
executeButton.Position = UDim2.new(0.5, -210, 1, -50)
executeButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
executeButton.BorderSizePixel = 0
executeButton.Text = "Execute script"
executeButton.Font = Enum.Font.GothamBold
executeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
executeButton.TextScaled = true
executeButton.ZIndex = 11
Instance.new("UICorner", executeButton).CornerRadius = UDim.new(0, 8)

local noButton = Instance.new("TextButton", frame)
noButton.Size = UDim2.new(0, 200, 0, 40)
noButton.Position = UDim2.new(0.5, 10, 1, -50)
noButton.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
noButton.BorderSizePixel = 0
noButton.Text = "No"
noButton.Font = Enum.Font.GothamBold
noButton.TextColor3 = Color3.fromRGB(255, 255, 255)
noButton.TextScaled = true
noButton.ZIndex = 11
Instance.new("UICorner", noButton).CornerRadius = UDim.new(0, 8)

local function showEnjoyMessage(callback)
    local enjoyGui = Instance.new("ScreenGui", player.PlayerGui)
    enjoyGui.Name = "EnjoyGui"
    local enjoyFrame = Instance.new("Frame", enjoyGui)
    enjoyFrame.Size = UDim2.new(0, 200, 0, 50)
    enjoyFrame.Position = UDim2.new(0.5, -100, 0, -50)
    enjoyFrame.BackgroundColor3 = Color3.fromRGB(50, 150, 255)
    enjoyFrame.BorderSizePixel = 0
    Instance.new("UICorner", enjoyFrame).CornerRadius = UDim.new(0, 12)
    local enjoyText = Instance.new("TextLabel", enjoyFrame)
    enjoyText.Size = UDim2.new(1, 0, 1, 0)
    enjoyText.BackgroundTransparency = 1
    enjoyText.Text = "Enjoy!"
    enjoyText.TextColor3 = Color3.new(1, 1, 1)
    enjoyText.Font = Enum.Font.SourceSansBold
    enjoyText.TextSize = 30
    local slideInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local slideDown = TweenService:Create(enjoyFrame, slideInfo, {Position = UDim2.new(0.5, -100, 0, 0)})
    slideDown:Play()
    slideDown.Completed:Wait()
    wait(4)
    local slideUp = TweenService:Create(enjoyFrame, slideInfo, {Position = UDim2.new(0.5, -100, 0, -50)})
    slideUp:Play()
    slideUp.Completed:Wait()
    enjoyGui:Destroy()
    if callback then callback() end
end

local function spawnMysteryGlitch()
    local ui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
    ui.Name = "MysteryGlitchGui"
    ui.ResetOnSpawn = false

    local glitchArea = Instance.new("TextButton")
    glitchArea.Size = UDim2.new(0, 60, 0, 60)
    glitchArea.Position = UDim2.new(0.88, 0, 0.2, 0)
    glitchArea.BackgroundColor3 = Color3.new(1, 1, 1)
    glitchArea.BackgroundTransparency = 0.7
    glitchArea.Text = ""
    glitchArea.ZIndex = 9999
    glitchArea.AutoButtonColor = false
    glitchArea.AnchorPoint = Vector2.new(0.5, 0.5)
    glitchArea.Parent = ui
    Instance.new("UICorner", glitchArea).CornerRadius = UDim.new(0, 8)

    spawn(function()
        while glitchArea.Parent do
            local offsetX = math.random(-5, 5)
            local offsetY = math.random(-5, 5)
            glitchArea.Position = UDim2.new(0.88, offsetX, 0.2, offsetY)
            wait(0.05)
        end
    end)

    local SoundService = game:GetService("SoundService")
    local sound = Instance.new("Sound", SoundService)
    sound.SoundId = "rbxassetid://6754147732"
    sound.Volume = 7

    glitchArea.MouseButton1Click:Connect(function()
        local fullScreenBg = Instance.new("Frame", ui)
        fullScreenBg.Size = UDim2.new(1, 0, 1, 0)
        fullScreenBg.Position = UDim2.new(0, 0, 0, 0)
        fullScreenBg.BackgroundColor3 = Color3.new(0, 0, 0)
        fullScreenBg.ZIndex = 1000

        local msg = Instance.new("TextLabel", fullScreenBg)
        msg.Size = UDim2.new(1, 0, 1, 0)
        msg.BackgroundTransparency = 1
        msg.TextColor3 = Color3.fromRGB(255, 0, 0)
        msg.Text = "JUMPSCARED LOL! >:D"
        msg.Font = Enum.Font.GothamBlack
        msg.TextScaled = true
        msg.ZIndex = 1001
        msg.Position = UDim2.new(0, 0, 0, 0)

        local function shakeLabel(label)
            spawn(function()
                while label.Parent do
                    local offsetX = math.random(-10, 10)
                    local offsetY = math.random(-10, 10)
                    label.Position = UDim2.new(0, offsetX, 0, offsetY)
                    wait(0.05)
                    label.Position = UDim2.new(0, 0, 0, 0)
                    wait(0.05)
                end
            end)
        end

        shakeLabel(msg)
        sound.Looped = true
        sound:Play()
        wait(1)
        player:Kick("I'm watching you :)")
    end)
end

spawnMysteryGlitch()

executeButton.MouseButton1Click:Connect(function()
    TweenService:Create(frame, TweenInfo.new(0.8, Enum.EasingStyle.Quart), {
        Position = UDim2.new(1, 100, 0.5, -150)
    }):Play()
    task.wait(1)
    game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-r6")
    task.wait(2)
    game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
    task.wait(2)
    loadstring(game:HttpGet("https://scriptblox.com/raw/Just-a-baseplate.-Just-A-Baseplate-Huge-Giant-39127"))()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/Billboard-GUI/refs/heads/main/Billboard.lua"))()
    task.delay(8, function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/sparezirt/Script/refs/heads/main/.github/workflows/JustABaseplate.txt"))()
        task.wait(0.9)
        game.StarterGui:SetCore("SendNotification", {
            Title = "Credits",
            Text = "Credits to SonixDev, Giant Krystal Dance by CatbyteHD",
            Duration = 5
        })
    end)
    showEnjoyMessage(function()
        task.delay(10, spawnMysteryGlitch)
    end)
end)

noButton.MouseButton1Click:Connect(function()
    player:Kick("GET OUTT!!!")
end)