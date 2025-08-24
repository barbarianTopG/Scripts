local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

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

local blur = Instance.new("BlurEffect")
blur.Size = 0
blur.Parent = cam

local shadowPart = Instance.new("Part")
shadowPart.Size = Vector3.new(4, 0.1, 4)
shadowPart.Anchored = false
shadowPart.CanCollide = false
shadowPart.Transparency = 0.7
shadowPart.Color = Color3.new(0, 0, 0)
shadowPart.Material = Enum.Material.SmoothPlastic
shadowPart.Parent = char

local shadowWeld = Instance.new("WeldConstraint")
shadowWeld.Part0 = shadowPart
shadowWeld.Part1 = hrp
shadowWeld.Parent = shadowPart

local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "SprintSystem"
gui.ResetOnSpawn = false

local byText = Instance.new("TextLabel", gui)
byText.Size = UDim2.new(0.5,0,0.05,0)
byText.Position = UDim2.new(0.25,0,0,10)
byText.BackgroundTransparency = 1
byText.TextColor3 = Color3.new(1,1,1)
byText.TextTransparency = 0.5
byText.TextScaled = true
byText.Text = "Made by ChillbyteHD"

local barBack = Instance.new("Frame", gui)
barBack.Size = UDim2.new(0.3,0,0,15)
barBack.Position = UDim2.new(0.35,0,1,-25)
barBack.BackgroundColor3 = Color3.fromRGB(50,50,50)

local barOutline = Instance.new("UIStroke", barBack)
barOutline.Color = Color3.fromRGB(100, 100, 100)
barOutline.Thickness = 2

local barFill = Instance.new("Frame", barBack)
barFill.Size = UDim2.new(1,0,1,0)
barFill.BackgroundColor3 = Color3.fromRGB(0,120,255)

local barCorner = Instance.new("UICorner", barBack)
barCorner.CornerRadius = UDim.new(0.5,0)

local fillCorner = Instance.new("UICorner", barFill)
fillCorner.CornerRadius = UDim.new(0.5,0)

local sprintBtn
if UserInputService.TouchEnabled then
    sprintBtn = Instance.new("TextButton", gui)
    sprintBtn.Size = UDim2.new(0,60,0,60)
    sprintBtn.Position = UDim2.new(0.7,88,1,-82)
    sprintBtn.RichText = true
    sprintBtn.Text = "<b><font size='24'>S</font></b>"
    sprintBtn.BackgroundColor3 = Color3.fromRGB(0,170,255)
    sprintBtn.TextColor3 = Color3.new(1,1,1)
    sprintBtn.AutoButtonColor = false
    sprintBtn.Visible = true

    local uicorner = Instance.new("UICorner", sprintBtn)
    uicorner.CornerRadius = UDim.new(1,0)

    local circleOutline = Instance.new("UIStroke", sprintBtn)
    circleOutline.Color = Color3.fromRGB(0, 100, 150)
    circleOutline.Thickness = 3
    circleOutline.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
end

player.CameraMode = Enum.CameraMode.LockFirstPerson

if not UserInputService.TouchEnabled then
    game.StarterGui:SetCore("SendNotification", {
        Title = "Controls";
        Text = "Hold SHIFT to sprint.";
        Duration = 5;
    })
end

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

if sprintBtn then
    sprintBtn.MouseButton1Down:Connect(function()
        setSprinting(true)
    end)
    sprintBtn.MouseButton1Up:Connect(function()
        setSprinting(false)
    end)
end

local lastCFrame = cam.CFrame
local bobIntensity = 0.2
local shakeIntensity = 0.2

RunService.RenderStepped:Connect(function(dt)
    if sprinting then
        stamina = math.max(0, stamina - 20 * dt)
        if stamina <= 0 then
            setSprinting(false)
        end
    else
        stamina = math.min(maxStamina, stamina + 10 * dt)
    end

    barFill.Size = UDim2.new(stamina/maxStamina,0,1,0)

    if hum.MoveDirection.Magnitude > 0 then
        local bob = math.sin(tick()*10) * bobIntensity
        cam.CFrame = cam.CFrame * CFrame.new(0,bob,0)
        if sprinting then
            cam.CFrame = cam.CFrame * CFrame.Angles(0, math.random(-shakeIntensity,shakeIntensity)/100,0)
        end
    end

    local deltaRot = (cam.CFrame.Position - lastCFrame.Position).Magnitude
    blur.Size = math.clamp(deltaRot*5, 0, 5)
    lastCFrame = cam.CFrame
end)
