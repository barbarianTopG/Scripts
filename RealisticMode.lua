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

local G2L = {}

G2L["ScreenGui_1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"))
G2L["ScreenGui_1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling

CollectionService:AddTag(G2L["ScreenGui_1"], "main")

G2L["Sprint_2"] = Instance.new("TextButton", G2L["ScreenGui_1"])
G2L["Sprint_2"]["BorderSizePixel"] = 0
G2L["Sprint_2"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
G2L["Sprint_2"]["Size"] = UDim2.new(0.08419, 0, 0.19806, 0)
G2L["Sprint_2"]["Name"] = "Sprint"
G2L["Sprint_2"]["Position"] = UDim2.new(0.79141, 0, 0.70736, 0)
G2L["Sprint_2"]["Text"] = "Run"
G2L["Sprint_2"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["Sprint_2"]["TextScaled"] = true
G2L["Sprint_2"]["Font"] = Enum.Font.GothamBold

G2L["UIStroke_3"] = Instance.new("UIStroke", G2L["Sprint_2"])
G2L["UIStroke_3"]["Color"] = Color3.fromRGB(255, 255, 255)

G2L["UICorner_4"] = Instance.new("UICorner", G2L["Sprint_2"])
G2L["UICorner_4"]["CornerRadius"] = UDim.new(8, 8)

G2L["UIAspectRatioConstraint_5"] = Instance.new("UIAspectRatioConstraint", G2L["Sprint_2"])

G2L["StaminaBG_6"] = Instance.new("Frame", G2L["ScreenGui_1"])
G2L["StaminaBG_6"]["BorderSizePixel"] = 0
G2L["StaminaBG_6"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
G2L["StaminaBG_6"]["Size"] = UDim2.new(0.46186, 0, 0.04527, 0)
G2L["StaminaBG_6"]["Position"] = UDim2.new(0.2622, 0, 0.89976, 0)
G2L["StaminaBG_6"]["BorderColor3"] = Color3.fromRGB(255, 255, 255)
G2L["StaminaBG_6"]["Name"] = "StaminaBG"

G2L["UICorner_7"] = Instance.new("UICorner", G2L["StaminaBG_6"])

G2L["StaminaBar_8"] = Instance.new("Frame", G2L["StaminaBG_6"])
G2L["StaminaBar_8"]["BorderSizePixel"] = 0
G2L["StaminaBar_8"]["BackgroundColor3"] = Color3.fromRGB(0, 193, 255)
G2L["StaminaBar_8"]["Size"] = UDim2.new(0.97917, 0, 0.5, 0)
G2L["StaminaBar_8"]["Position"] = UDim2.new(0.01042, 0, 0.25, 0)
G2L["StaminaBar_8"]["Name"] = "StaminaBar"

G2L["UICorner_9"] = Instance.new("UICorner", G2L["StaminaBar_8"])
G2L["UICorner_9"]["CornerRadius"] = UDim.new(8, 8)

G2L["UIAspectRatioConstraint_a"] = Instance.new("UIAspectRatioConstraint", G2L["StaminaBG_6"])
G2L["UIAspectRatioConstraint_a"]["AspectRatio"] = 24

local gui = G2L["ScreenGui_1"]
local sprintBtn = G2L["Sprint_2"]
local staminaBar = G2L["StaminaBar_8"]

local currentStaminaBarSize = stamina / maxStamina
local staminaTween

local function updateStaminaBar()
    local targetSize = stamina / maxStamina
    
    if staminaTween then
        staminaTween:Cancel()
    end
    
    staminaTween = TweenService:Create(
        staminaBar,
        TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {Size = UDim2.new(targetSize, 0, 0.5, 0)}
    )
    staminaTween:Play()
    
    local colorTween
    if stamina < 30 then
        colorTween = TweenService:Create(
            staminaBar,
            TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundColor3 = Color3.fromRGB(255, 50, 50)}
        )
    else
        colorTween = TweenService:Create(
            staminaBar,
            TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundColor3 = Color3.fromRGB(0, 193, 255)}
        )
    end
    colorTween:Play()
end

local function setSprinting(state)
    if state and stamina > 0 then
        sprinting = true
        hum.WalkSpeed = sprintSpeed
        TweenService:Create(blur, TweenInfo.new(0.2), {Size = 5}):Play()
        TweenService:Create(sprintBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 100, 255)}):Play()
    else
        sprinting = false
        hum.WalkSpeed = walkSpeed
        TweenService:Create(blur, TweenInfo.new(0.2), {Size = 0}):Play()
        TweenService:Create(sprintBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 0, 0)}):Play()
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

local bobTime = 0
local originalCamCFrame = cam.CFrame
local bobIntensity = 0.5
local shakeIntensity = 0.3

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
    
    updateStaminaBar()
    
    local moveDirection = hum.MoveDirection
    if moveDirection.Magnitude > 0 then
        bobTime = bobTime + dt
        
        local bobOffset = math.sin(bobTime * 8) * bobIntensity
        
        local shakeOffset = Vector3.new(
            math.random(-shakeIntensity, shakeIntensity),
            math.random(-shakeIntensity * 0.5, shakeIntensity * 0.5),
            math.random(-shakeIntensity, shakeIntensity)
        ) * (sprinting and 0.1 or 0)
        
        local rightVector = cam.CFrame.RightVector
        local bobVector = rightVector * bobOffset
        
        cam.CFrame = originalCamCFrame + bobVector + shakeOffset
    else
        bobTime = 0
        cam.CFrame = cam.CFrame:Lerp(originalCamCFrame, 0.1)
    end
    
    originalCamCFrame = cam.CFrame
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
    updateStaminaBar()
end)

return G2L["ScreenGui_1"]