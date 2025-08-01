local plr = game.Players.LocalPlayer
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local spamming = true

local function spamTools(c)
	c.ChildAdded:Connect(function(child)
		if child:IsA("Tool") and spamming then
			local clone = child:Clone()
			clone.Parent = plr.Backpack
			task.wait(0.1)
		end
	end)
end

plr.CharacterAdded:Connect(function(char)
	RunService.RenderStepped:Connect(function()
		if spamming then
			local hum = char:FindFirstChildOfClass("Humanoid")
			if hum then
				for _, tool in ipairs(plr.Backpack:GetChildren()) do
					if tool:IsA("Tool") then
						tool.Parent = char
					end
				end
			end
		end
	end)
	spamTools(char)
end)

spamTools(plr.Backpack)
if plr:FindFirstChild("StarterGear") then spamTools(plr.StarterGear) end

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
btn.Text = "Tool Spammer: ON"
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
		game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("/e -rs ")
	end
end)
