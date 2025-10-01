local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local CollectionService = game:GetService("CollectionService")

local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")
local hrp = char:WaitForChild("HumanoidRootPart")
local cam = workspace.CurrentCamera

local walkSpeed = 16
local sprintSpeed = 24
local stamina = 100
local maxStamina = 100
local sprinting = false

player.CameraMode = Enum.CameraMode.LockFirstPerson

local blur = Instance.new("BlurEffect")
blur.Size = 0
blur.Parent = cam

local UI = {}

UI["ScreenGui_1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"))
UI["ScreenGui_1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling

CollectionService:AddTag(UI["ScreenGui_1"], "main")

UI["Sprint_2"] = Instance.new("ImageButton", UI["ScreenGui_1"])
UI["Sprint_2"]["BorderSizePixel"] = 0
UI["Sprint_2"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["Sprint_2"]["Image"] = "rbxassetid://101834665443157"
UI["Sprint_2"]["Size"] = UDim2.new(0.08419, 0, 0.19806, 0)
UI["Sprint_2"]["Name"] = "Sprint"
UI["Sprint_2"]["Position"] = UDim2.new(0.79141, 0, 0.70736, 0)

UI["UIStroke_3"] = Instance.new("UIStroke", UI["Sprint_2"])
UI["UIStroke_3"]["Color"] = Color3.fromRGB(255, 255, 255)

UI["UICorner_4"] = Instance.new("UICorner", UI["Sprint_2"])
UI["UICorner_4"]["CornerRadius"] = UDim.new(8, 8)

UI["UIAspectRatioConstraint_5"] = Instance.new("UIAspectRatioConstraint", UI["Sprint_2"])

UI["StaminaBG_6"] = Instance.new("Frame", UI["ScreenGui_1"])
UI["StaminaBG_6"]["BorderSizePixel"] = 0
UI["StaminaBG_6"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["StaminaBG_6"]["Size"] = UDim2.new(0.46186, 0, 0.04527, 0)
UI["StaminaBG_6"]["Position"] = UDim2.new(0.2622, 0, 0.89976, 0)
UI["StaminaBG_6"]["BorderColor3"] = Color3.fromRGB(255, 255, 255)
UI["StaminaBG_6"]["Name"] = "StaminaBG"

UI["UICorner_7"] = Instance.new("UICorner", UI["StaminaBG_6"])

UI["StaminaBar_8"] = Instance.new("Frame", UI["StaminaBG_6"])
UI["StaminaBar_8"]["BorderSizePixel"] = 0
UI["StaminaBar_8"]["BackgroundColor3"] = Color3.fromRGB(0, 193, 255)
UI["StaminaBar_8"]["Size"] = UDim2.new(0.97917, 0, 0.5, 0)
UI["StaminaBar_8"]["Position"] = UDim2.new(0.01042, 0, 0.25, 0)
UI["StaminaBar_8"]["Name"] = "StaminaBar"

UI["UICorner_9"] = Instance.new("UICorner", UI["StaminaBar_8"])
UI["UICorner_9"]["CornerRadius"] = UDim.new(8, 8)

UI["UIAspectRatioConstraint_a"] = Instance.new("UIAspectRatioConstraint", UI["StaminaBG_6"])
UI["UIAspectRatioConstraint_a"]["AspectRatio"] = 24

local gui = UI["ScreenGui_1"]
local sprintBtn = UI["Sprint_2"]
local staminaBar = UI["StaminaBar_8"]

local function setSprinting(state)
    if state and stamina > 0 then
        sprinting = true
        hum.WalkSpeed = sprintSpeed
        TweenService:Create(blur, TweenInfo.new(0.2), {Size = 5}):Play()
    else
        sprinting = false
        hum.WalkSpeed = walkSpeed
        TweenService:Create(blur, TweenInfo.new(0.2), {Size = 0}):Play()
    end
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.LeftShift then
        setSprinting(true)
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.LeftShift then
        setSprinting(false)
    end
end)

sprintBtn.MouseButton1Down:Connect(function() 
    setSprinting(true) 
end)

sprintBtn.MouseButton1Up:Connect(function() 
    setSprinting(false) 
end)

sprintBtn.TouchLongPress:Connect(function()
    setSprinting(true)
end)

sprintBtn.TouchEnded:Connect(function()
    setSprinting(false)
end)

local lastCFrame = cam.CFrame
local bobIntensity = 0.2
local shakeIntensity = 0.2

local rsConn
rsConn = RunService.RenderStepped:Connect(function(dt)
    if not hum or hum.Health <= 0 then return end
    
    if sprinting then
        stamina = math.max(0, stamina - 20 * dt)
        if stamina <= 0 then
            setSprinting(false)
        end
    else
        stamina = math.min(maxStamina, stamina + 10 * dt)
    end
    
    staminaBar.Size = UDim2.new(stamina/maxStamina, 0, 0.5, 0)
    
    if hum.MoveDirection.Magnitude > 0 then
        local bob = math.sin(tick() * 10) * bobIntensity
        cam.CFrame = cam.CFrame * CFrame.new(bob, 0, 0)
        
        if sprinting then
            cam.CFrame = cam.CFrame * CFrame.Angles(0, math.random(-shakeIntensity, shakeIntensity)/100, 0)
        end
    end
    lastCFrame = cam.CFrame
end)

hum.Died:Connect(function()
    if rsConn then 
        rsConn:Disconnect() 
    end
    if gui then 
        gui:Destroy() 
    end
    if blur then 
        blur:Destroy() 
    end
    player.CameraMode = Enum.CameraMode.Classic
end)

player.CharacterAdded:Connect(function(newChar)
    char = newChar
    hum = char:WaitForChild("Humanoid")
    hrp = char:WaitForChild("HumanoidRootPart")
    
    stamina = maxStamina
    sprinting = false
end)

return UI["ScreenGui_1"]