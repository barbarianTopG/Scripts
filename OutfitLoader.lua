local TweenService = game:GetService("TweenService")
local Player = game.Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local function Send(message)
    game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(message)
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = PlayerGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 340, 0, 200)
Frame.Position = UDim2.new(0.5, -170, -200, 0)
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui

local FrameCorner = Instance.new("UICorner")
FrameCorner.CornerRadius = UDim.new(0, 12)
FrameCorner.Parent = Frame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 60)
Title.BackgroundTransparency = 1
Title.Text = "Outfit Loader"
Title.TextColor3 = Color3.fromRGB(170, 0, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 24
Title.Parent = Frame

local function styleButton(button, text)
    button.Size = UDim2.new(0.5, -15, 0, 55)
    button.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
    button.Text = text
    button.Font = Enum.Font.Gotham
    button.TextSize = 20
    button.TextColor3 = Color3.new(1, 1, 1)

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = button

    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(140, 0, 220)}):Play()
    end)
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(170, 0, 255)}):Play()
    end)
end

local Button1 = Instance.new("TextButton")
Button1.Position = UDim2.new(0, 10, 1, -70)
Button1.Parent = Frame
styleButton(Button1, "Guest")

local Button2 = Instance.new("TextButton")
Button2.Position = UDim2.new(0.5, 5, 1, -70)
Button2.Parent = Frame
styleButton(Button2, "Rig 2")

local tweenIn = TweenService:Create(Frame, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, -170, 0.3, 0)})

local function closeGui()
    local tweenOut = TweenService:Create(Frame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = UDim2.new(0.5, -170, -200, 0)})
    tweenOut:Play()
    tweenOut.Completed:Connect(function()
        ScreenGui:Destroy()
    end)
end

tweenIn:Play()

Button1.MouseButton1Click:Connect(function()
    Send("/e -gh 417457461, 5316539421, 108224319902592, 82404150383568 100856932339214 ")
    Send("/e -sh")
    closeGui()
end)

Button2.MouseButton1Click:Connect(function()
    Send("/e -gh 15535076528, 18833520599, 14069764985, 87776845004507, 95039184904088, 18347819042 ")
    Send("/e -sh")
    closeGui()
end)