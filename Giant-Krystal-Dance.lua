local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "WelcomeGui"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Global
gui.Parent = player:WaitForChild("PlayerGui")

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
title.Text = "Hey..."
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
disclaimer.Text = "Thanks for all the support you guys provided to me and all, but Roblox has removed r6 dances so all KDV3s are useless and u cannot fix it.\nIt was good while it lasted. 🥲"
disclaimer.ZIndex = 11

local executeButton = Instance.new("TextButton", frame)
executeButton.Size = UDim2.new(1, -40, 0, 40)
executeButton.Position = UDim2.new(0.5, 0, 1, -50)
executeButton.AnchorPoint = Vector2.new(0.5, 0)
executeButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
executeButton.BorderSizePixel = 0
executeButton.Text = "I understand︱Close"
executeButton.Font = Enum.Font.GothamBold
executeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
executeButton.TextScaled = true
executeButton.ZIndex = 11

Instance.new("UICorner", executeButton).CornerRadius = UDim.new(0, 8)

executeButton.MouseButton1Click:Connect(function()
	TweenService:Create(frame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
		Position = UDim2.new(0, -500, 0.5, -150)
	}):Play()
	task.delay(0.6, function()
		gui:Destroy()
	end)

	pcall(function()
		StarterGui:SetCore("Notify", {
			Title = "From ChillbyteHD",
			Text = "I respect you if u used this, you're the best, have a good day.",
			Duration = 5
		})
	end)
end)