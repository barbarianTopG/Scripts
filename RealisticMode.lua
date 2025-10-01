if not game:IsLoaded() then
    game.Loaded:Wait()
end

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local character = player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local camera = workspace.CurrentCamera


local walkSpeed = 16
local sprintSpeed = 24
local stamina = 100
local maxStamina = 100
local sprinting = false


local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SprintSystem"
screenGui.Parent = player:WaitForChild("PlayerGui")
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.IgnoreGuiInset = true


local sprintButton = Instance.new("TextButton")
sprintButton.Name = "SprintButton"
sprintButton.Size = UDim2.new(0, 80, 0, 80)
sprintButton.Position = UDim2.new(0.85, 0, 0.7, 0)
sprintButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
sprintButton.Text = "RUN"
sprintButton.TextColor3 = Color3.fromRGB(200, 200, 200)
sprintButton.TextScaled = true
sprintButton.Font = Enum.Font.GothamBold
sprintButton.BorderSizePixel = 0
sprintButton.Parent = screenGui

local buttonStroke = Instance.new("UIStroke")
buttonStroke.Color = Color3.fromRGB(100, 100, 100)
buttonStroke.Thickness = 2
buttonStroke.Parent = sprintButton

local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0.3, 0)
buttonCorner.Parent = sprintButton


local staminaContainer = Instance.new("Frame")
staminaContainer.Name = "StaminaContainer"
staminaContainer.Size = UDim2.new(0.4, 0, 0.05, 0)
staminaContainer.Position = UDim2.new(0.3, 0, 0.9, 0)
staminaContainer.BackgroundTransparency = 1
staminaContainer.Parent = screenGui

local staminaText = Instance.new("TextLabel")
staminaText.Name = "StaminaText"
staminaText.Size = UDim2.new(1, 0, 0.4, 0)
staminaText.BackgroundTransparency = 1
staminaText.Text = "STAMINA"
staminaText.TextColor3 = Color3.fromRGB(200, 200, 200)
staminaText.TextScaled = true
staminaText.Font = Enum.Font.GothamSemibold
staminaText.TextXAlignment = Enum.TextXAlignment.Center
staminaText.Parent = staminaContainer

local staminaBackground = Instance.new("Frame")
staminaBackground.Name = "StaminaBG"
staminaBackground.Size = UDim2.new(1, 0, 0.6, 0)
staminaBackground.Position = UDim2.new(0, 0, 0.2, 0)
staminaBackground.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
staminaBackground.BorderSizePixel = 0
staminaBackground.Parent = staminaContainer

local bgCorner = Instance.new("UICorner")
bgCorner.CornerRadius = UDim.new(1, 0)
bgCorner.Parent = staminaBackground

local staminaBar = Instance.new("Frame")
staminaBar.Name = "StaminaBar"
staminaBar.Size = UDim2.new(1, 0, 1, 0)
staminaBar.BackgroundColor3 = Color3.fromRGB(0, 193, 255)
staminaBar.BorderSizePixel = 0
staminaBar.AnchorPoint = Vector2.new(0, 0)
staminaBar.Parent = staminaBackground

local barCorner = Instance.new("UICorner")
barCorner.CornerRadius = UDim.new(1, 0)
barCorner.Parent = staminaBar


local blur = Instance.new("BlurEffect")
blur.Size = 0
blur.Parent = camera


local function updateStaminaBar()
    local targetSize = stamina / maxStamina
    
    local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local tween = TweenService:Create(staminaBar, tweenInfo, {
        Size = UDim2.new(targetSize, 0, 1, 0)
    })
    tween:Play()
    
    if stamina < 30 then
        staminaBar.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
        staminaText.TextColor3 = Color3.fromRGB(255, 100, 100)
    elseif stamina < 60 then
        staminaBar.BackgroundColor3 = Color3.fromRGB(255, 180, 0)
        staminaText.TextColor3 = Color3.fromRGB(255, 200, 100)
    else
        staminaBar.BackgroundColor3 = Color3.fromRGB(0, 193, 255)
        staminaText.TextColor3 = Color3.fromRGB(200, 200, 200)
    end
end

local function setSprinting(state)
    if state and stamina > 0 then
        sprinting = true
        humanoid.WalkSpeed = sprintSpeed
        TweenService:Create(blur, TweenInfo.new(0.2), {Size = 5}):Play()
        TweenService:Create(sprintButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 100, 200)}):Play()
        TweenService:Create(buttonStroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(0, 150, 255)}):Play()
    else
        sprinting = false
        humanoid.WalkSpeed = walkSpeed
        TweenService:Create(blur, TweenInfo.new(0.2), {Size = 0}):Play()
        TweenService:Create(sprintButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}):Play()
        TweenService:Create(buttonStroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(100, 100, 100)}):Play()
    end
end


UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.LeftShift then
        setSprinting(true)
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.LeftShift then
        setSprinting(false)
    end
end)


local touchActive = false

sprintButton.MouseButton1Down:Connect(function()
    touchActive = true
    setSprinting(true)
end)

sprintButton.MouseButton1Up:Connect(function()
    touchActive = false
    setSprinting(false)
end)

sprintButton.MouseLeave:Connect(function()
    if touchActive then
        touchActive = false
        setSprinting(false)
    end
end)


local bobTime = 0
local baseCamOffset = Vector3.new()

local renderConnection
renderConnection = RunService.RenderStepped:Connect(function(deltaTime)
    if not humanoid or humanoid.Health <= 0 then
        return
    end
    
    
    if sprinting then
        stamina = math.max(0, stamina - 20 * deltaTime)
        if stamina <= 0 then
            setSprinting(false)
        end
    else
        stamina = math.min(maxStamina, stamina + 10 * deltaTime)
    end
    
    updateStaminaBar()
    
    
    local moveDirection = humanoid.MoveDirection
    local isMoving = moveDirection.Magnitude > 0
    
    if isMoving then
        bobTime = bobTime + deltaTime * (sprinting and 12 or 8)
        
        local bobIntensity = sprinting and 0.8 or 0.4
        local verticalIntensity = sprinting and 0.3 or 0.15
        
        local bobOffsetX = math.sin(bobTime) * bobIntensity
        local bobOffsetY = math.abs(math.sin(bobTime * 2)) * verticalIntensity
        
        baseCamOffset = Vector3.new(bobOffsetX, bobOffsetY, 0)
        
        
        if sprinting then
            local shakeOffset = Vector3.new(
                math.random(-5, 5) * 0.01,
                math.random(-3, 3) * 0.01,
                0
            )
            baseCamOffset = baseCamOffset + shakeOffset
        end
    else
        baseCamOffset = baseCamOffset:Lerp(Vector3.new(), 0.2)
        bobTime = 0
    end
    
    
    local headPosition = humanoidRootPart.Position + Vector3.new(0, 1.5, 0)
    local currentCameraCFrame = camera.CFrame
    
    local targetCFrame = CFrame.new(headPosition) * CFrame.Angles(0, currentCameraCFrame.Rotation.Y, 0)
    targetCFrame = targetCFrame + currentCameraCFrame.LookVector * 0.5
    
    camera.CFrame = targetCFrame + baseCamOffset
end)


humanoid.Died:Connect(function()
    if renderConnection then
        renderConnection:Disconnect()
    end
    screenGui:Destroy()
    blur:Destroy()
end)

player.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    humanoid = newCharacter:WaitForChild("Humanoid")
    humanoidRootPart = newCharacter:WaitForChild("HumanoidRootPart")
    
    stamina = maxStamina
    sprinting = false
    updateStaminaBar()
    baseCamOffset = Vector3.new()
end)


updateStaminaBar()