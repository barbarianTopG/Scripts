local plr = game.Players.LocalPlayer
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local spamming = false

local equippedTool = nil

local function startToolSpam(char)
	RunService.RenderStepped:Connect(function()
		if spamming and equippedTool and equippedTool.Parent == char then
			equippedTool.Parent = plr.Backpack
			task.wait()
			equippedTool.Parent = char
		end
	end)

	char.ChildAdded:Connect(function(child)
		if child:IsA("Tool") then
			equippedTool = child
		end
	end)
end

if plr.Character then
	startToolSpam(plr.Character)
end

plr.CharacterAdded:Connect(startToolSpam)

if CoreGui:FindFirstChild("ToolSpammerToggle") then
	CoreGui.ToolSpammerToggle:Destroy()
end

local screenGui = Instance.new("ScreenGui", CoreGui)
screenGui.Name = "ToolSpammerToggle"

local btn = Instance.new("TextButton")
btn.Size = UDim2.new(0, 160, 0, 40)
btn.Position = UDim2.new(0, 10, 0, 0)
btn.BackgroundColor3 = Color3.new(0, 0, 0)
btn.TextColor3 = Color3.new(1, 1, 1)
btn.Font = Enum.Font.GothamBold
btn.TextSize = 18
btn.Text = "Tool Spammer: OFF"
btn.BorderSizePixel = 2
btn.BorderColor3 = Color3.fromRGB(40, 40, 40)
btn.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = btn

btn.MouseButton1Click:Connect(function()
	spamming = not spamming
	if spamming then
		btn.Text = "Tool Spammer: ON"
	else
		btn.Text = "Tool Spammer: OFF"
	end
end)
