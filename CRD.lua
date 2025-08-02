-- Configure Render Distance (CRD)

local TweenService = game:GetService("TweenService")
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")

local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "RenderBoosterGUI"

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 220, 0, 100)
frame.Position = UDim2.new(0, -250, 0, 20)
frame.BackgroundColor3 = Color3.fromRGB(80, 70, 120)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.ClipsDescendants = true
frame.Parent = gui

Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)
TweenService:Create(frame, TweenInfo.new(0.4), { Position = UDim2.new(0, 20, 0, 20) }):Play()

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, -20, 0, 28)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.Text = "🌌 Render Config"
title.TextColor3 = Color3.fromRGB(230, 230, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 15
title.TextXAlignment = Enum.TextXAlignment.Left

local infoBtn = Instance.new("TextButton", frame)
infoBtn.Size = UDim2.new(0, 24, 0, 24)
infoBtn.Position = UDim2.new(1, -28, 0, 2)
infoBtn.Text = "ⓘ"
infoBtn.TextColor3 = Color3.fromRGB(230, 230, 255)
infoBtn.BackgroundTransparency = 1
infoBtn.Font = Enum.Font.GothamBold
infoBtn.TextSize = 16
infoBtn.ZIndex = 2

local input = Instance.new("TextBox", frame)
input.Size = UDim2.new(1, -20, 0, 28)
input.Position = UDim2.new(0, 10, 0, 35)
input.PlaceholderText = "Type distance like 200"
input.Text = ""
input.TextColor3 = Color3.fromRGB(240, 240, 255)
input.BackgroundColor3 = Color3.fromRGB(60, 50, 90)
input.BorderSizePixel = 0
input.Font = Enum.Font.Gotham
input.TextSize = 15
input.ClearTextOnFocus = false

local button = Instance.new("TextButton", frame)
button.Size = UDim2.new(1, -20, 0, 25)
button.Position = UDim2.new(0, 10, 0, 70)
button.Text = "Apply"
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.BackgroundColor3 = Color3.fromRGB(100, 90, 150)
button.BorderSizePixel = 0
button.Font = Enum.Font.GothamSemibold
button.TextSize = 15
Instance.new("UICorner", button).CornerRadius = UDim.new(0, 6)

local infoFrame = Instance.new("Frame")
infoFrame.Size = UDim2.new(0, 220, 0, 110)
infoFrame.Position = UDim2.new(0.5, 0, 1, 100)
infoFrame.AnchorPoint = Vector2.new(0.5, 0.5)
infoFrame.BackgroundColor3 = Color3.fromRGB(60, 50, 90)
infoFrame.BorderSizePixel = 0
infoFrame.Visible = false
infoFrame.ClipsDescendants = true
infoFrame.Parent = gui

Instance.new("UICorner", infoFrame).CornerRadius = UDim.new(0, 8)

local infoLabel = Instance.new("TextLabel", infoFrame)
infoLabel.Size = UDim2.new(1, -10, 1, -10)
infoLabel.Position = UDim2.new(0, 5, 0, 5)
infoLabel.BackgroundTransparency = 1
infoLabel.TextColor3 = Color3.fromRGB(220, 220, 250)
infoLabel.Font = Enum.Font.Gotham
infoLabel.TextSize = 14
infoLabel.TextXAlignment = Enum.TextXAlignment.Left
infoLabel.TextYAlignment = Enum.TextYAlignment.Top
infoLabel.TextWrapped = true
infoLabel.Text = [[💡 Examples:
800 - 4x render distance
400 - 2x render distance
200 - Normal render distance
100 - Half render distance
50 - 1/4 render distance]]

local closeBtn = Instance.new("TextButton", infoFrame)
closeBtn.Size = UDim2.new(0, 24, 0, 24)
closeBtn.Position = UDim2.new(1, -28, 0, 4)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(240, 240, 255)
closeBtn.BackgroundTransparency = 1
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 16

infoBtn.MouseButton1Click:Connect(function()
	if not infoFrame.Visible then
		infoFrame.Visible = true
		infoFrame.Position = UDim2.new(0.5, 0, 1, 100)
		TweenService:Create(infoFrame, TweenInfo.new(0.35), {
			Position = UDim2.new(0.5, 0, 0.5, 0)
		}):Play()
	end
end)

closeBtn.MouseButton1Click:Connect(function()
	local tweenOut = TweenService:Create(infoFrame, TweenInfo.new(0.35), {
		Position = UDim2.new(0.5, 0, 1, 100)
	})
	tweenOut:Play()
	tweenOut.Completed:Wait()
	infoFrame.Visible = false
end)

local function createNotify(text)
	local notify = Instance.new("Frame")
	notify.Size = UDim2.new(0, 180, 0, 35)
	notify.Position = UDim2.new(0, 20, 0, -50)
	notify.BackgroundColor3 = Color3.fromRGB(100, 90, 150)
	notify.BorderSizePixel = 0
	notify.Parent = gui

	Instance.new("UICorner", notify).CornerRadius = UDim.new(0, 8)

	local label = Instance.new("TextLabel", notify)
	label.Size = UDim2.new(1, -10, 1, 0)
	label.Position = UDim2.new(0, 5, 0, 0)
	label.BackgroundTransparency = 1
	label.Text = text
	label.TextColor3 = Color3.fromRGB(240, 240, 255)
	label.Font = Enum.Font.GothamMedium
	label.TextSize = 14
	label.TextXAlignment = Enum.TextXAlignment.Left

	local tweenIn = TweenService:Create(notify, TweenInfo.new(0.4), { Position = UDim2.new(0, 20, 0, 20) })
	local tweenOut = TweenService:Create(notify, TweenInfo.new(0.4), { Position = UDim2.new(0, 20, 0, -50) })

	tweenIn:Play()
	task.delay(2.5, function()
		tweenOut:Play()
		tweenOut.Completed:Wait()
		notify:Destroy()
	end)
end

local hidden = {}
local function applyDistance(dist)
	for _, v in ipairs(workspace:GetDescendants()) do
		if v:IsA("BasePart") and not v:IsDescendantOf(player.Character) then
			local mag = (v.Position - hrp.Position).Magnitude
			if mag > dist then
				if not hidden[v] and (v.Transparency ~= 1 or v.CanCollide) then
					hidden[v] = { v.Transparency, v.CanCollide }
					v.Transparency = 1
					v.CanCollide = false
				end
			else
				if hidden[v] then
					v.Transparency = hidden[v][1]
					v.CanCollide = hidden[v][2]
					hidden[v] = nil
				end
			end
		end
	end
end

button.MouseButton1Click:Connect(function()
	local dist = tonumber(input.Text)
	if not dist then return end
	applyDistance(dist)
	createNotify("Applied render distance: " .. dist)
	input.Text = ""
end)