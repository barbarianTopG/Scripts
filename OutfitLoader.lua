local TweenService = game:GetService("TweenService")
local Player = game.Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local function Send(message)
    game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(message)
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = PlayerGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 300, 0, 150)
Frame.Position = UDim2.new(0.5, -150, -1, 0)
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui

local FrameCorner = Instance.new("UICorner")
FrameCorner.CornerRadius = UDim.new(0, 10)
FrameCorner.Parent = Frame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundTransparency = 1
Title.Text = "Outfit Loader"
Title.TextColor3 = Color3.fromRGB(170, 0, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 20
Title.Parent = Frame

local function styleButton(button, text)
	button.Size = UDim2.new(0.5, -5, 0, 50)
	button.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
	button.Text = text
	button.Font = Enum.Font.Gotham
	button.TextSize = 18
	button.TextColor3 = Color3.new(1, 1, 1)

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 8)
	corner.Parent = button
end

local Button1 = Instance.new("TextButton")
Button1.Position = UDim2.new(0, 0, 1, -50)
Button1.Parent = Frame
styleButton(Button1, "Guest")

local Button2 = Instance.new("TextButton")
Button2.Position = UDim2.new(0.5, 5, 1, -50)
Button2.Parent = Frame
styleButton(Button2, "Femboy & Rig2")

local tweenIn = TweenService:Create(Frame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, -150, 0.3, 0)})
local tweenOut = TweenService:Create(Frame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = UDim2.new(0.5, -150, -1, 0)})

tweenIn:Play()

local function closeGui()
	tweenOut:Play()
	tweenOut.Completed:Connect(function()
		ScreenGui:Destroy()
	end)
end

Button1.MouseButton1Click:Connect(function()
	Send("/e -gh 417457461, 5316539421, 108224319902592, 82404150383568 100856932339214 ")
	closeGui()
end)

Button2.MouseButton1Click:Connect(function()
	Send("/e -gh 15535076528, 18833520599, 14069764985, 87776845004507, 95039184904088, 18347819042 ")
	closeGui()
end)