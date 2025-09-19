--[[
   NovaLibrary
   Made by SuperNova
   Currently beta
]]--
local NovaLibrary = {}

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local StarterGui = game:GetService("StarterGui")

NovaLibrary.Theme = {
	Base = Color3.fromRGB(15, 15, 30),
	Accent = Color3.fromRGB(0, 170, 255),
	Text = Color3.fromRGB(255, 255, 255),
	Hover = Color3.fromRGB(35, 35, 55)
}

local function Tween(obj, props, time)
	local tween = TweenService:Create(obj, TweenInfo.new(time or 0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), props)
	tween:Play()
end

function NovaLibrary:CreateWindow(options)
	local Window = {}
	Window.Name = options.Name or "NovaLibrary"
	Window.Keybind = options.Keybind or Enum.KeyCode.RightControl
	Window.Tabs = {}

	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.Name = Window.Name
	ScreenGui.ResetOnSpawn = false
	ScreenGui.Parent = game:GetService("CoreGui")
	Window.Frame = ScreenGui

	local Main = Instance.new("Frame")
	Main.Size = UDim2.new(0, 550, 0, 400)
	Main.Position = UDim2.new(0.5, -275, 0.5, -200)
	Main.BackgroundColor3 = NovaLibrary.Theme.Base
	Main.BorderSizePixel = 0
	Main.Parent = ScreenGui
	Main.Name = "Main"
	Window.Main = Main

	local TopBar = Instance.new("Frame")
	TopBar.Size = UDim2.new(1, 0, 0, 30)
	TopBar.BackgroundColor3 = NovaLibrary.Theme.Accent
	TopBar.BorderSizePixel = 0
	TopBar.Parent = Main
	TopBar.Name = "TopBar"

	local Title = Instance.new("TextLabel")
	Title.Size = UDim2.new(1, -10, 1, 0)
	Title.Position = UDim2.new(0, 5, 0, 0)
	Title.BackgroundTransparency = 1
	Title.TextColor3 = NovaLibrary.Theme.Text
	Title.Text = Window.Name
	Title.Font = Enum.Font.GothamBold
	Title.TextSize = 18
	Title.TextXAlignment = Enum.TextXAlignment.Left
	Title.Parent = TopBar

	local dragging, dragInput, dragStart, startPos
	local function update(input)
		local delta = input.Position - dragStart
		Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
								  startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
	TopBar.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			dragStart = input.Position
			startPos = Main.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	TopBar.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement then
			dragInput = input
		end
	end)
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)

	local TabContainer = Instance.new("Frame")
	TabContainer.Size = UDim2.new(0, 120, 1, -30)
	TabContainer.Position = UDim2.new(0, 0, 0, 30)
	TabContainer.BackgroundColor3 = NovaLibrary.Theme.Base
	TabContainer.BorderSizePixel = 0
	TabContainer.Parent = Main

	local PagesContainer = Instance.new("Frame")
	PagesContainer.Size = UDim2.new(1, -120, 1, -30)
	PagesContainer.Position = UDim2.new(0, 120, 0, 30)
	PagesContainer.BackgroundColor3 = NovaLibrary.Theme.Base
	PagesContainer.BorderSizePixel = 0
	PagesContainer.Parent = Main

	local NotifContainer = Instance.new("Frame")
	NotifContainer.Size = UDim2.new(0, 300, 0, 100)
	NotifContainer.Position = UDim2.new(0.5, -150, 0, 20)
	NotifContainer.BackgroundTransparency = 1
	NotifContainer.Parent = ScreenGui

	local function AutoLayout(container)
		local UIList = Instance.new("UIListLayout")
		UIList.Padding = UDim.new(0,5)
		UIList.SortOrder = Enum.SortOrder.LayoutOrder
		UIList.Parent = container
	end

	function Window:CreateTab(Name)
		local Tab = {}
		Tab.Name = Name

		local Button = Instance.new("TextButton")
		Button.Size = UDim2.new(1, 0, 0, 40)
		Button.Position = UDim2.new(0, 0, #self.Tabs*40, 0)
		Button.BackgroundColor3 = NovaLibrary.Theme.Accent
		Button.BorderSizePixel = 0
		Button.TextColor3 = NovaLibrary.Theme.Text
		Button.Text = Name
		Button.Font = Enum.Font.GothamBold
		Button.TextSize = 16
		Button.Parent = TabContainer
		Tab.Button = Button

		local Page = Instance.new("Frame")
		Page.Size = UDim2.new(1, 0, 1, 0)
		Page.BackgroundTransparency = 1
		Page.Visible = false
		Page.Parent = PagesContainer
		Tab.Page = Page

		AutoLayout(Page)

		Button.MouseButton1Click:Connect(function()
			for _, t in pairs(self.Tabs) do
				t.Page.Visible = false
			end
			Page.Visible = true
		end)
		
		function Tab:CreateSection(Title)
			local Section = Instance.new("Frame")
			Section.Size = UDim2.new(1, -10, 0, 30)
			Section.BackgroundTransparency = 1
			Section.LayoutOrder = #Page:GetChildren() + 1
			Section.Parent = Page

			local Label = Instance.new("TextLabel")
			Label.Size = UDim2.new(1, 0, 1, 0)
			Label.BackgroundTransparency = 1
			Label.Text = Title
			Label.TextColor3 = NovaLibrary.Theme.Text
			Label.Font = Enum.Font.GothamBold
			Label.TextSize = 14
			Label.TextXAlignment = Enum.TextXAlignment.Left
			Label.Parent = Section

			AutoLayout(Section)

			return Section
		end

		function Tab:CreateButton(Name, Callback)
			local Button = Instance.new("TextButton")
			Button.Size = UDim2.new(1, 0, 0, 30)
			Button.BackgroundColor3 = NovaLibrary.Theme.Accent
			Button.BorderSizePixel = 0
			Button.Text = Name
			Button.TextColor3 = NovaLibrary.Theme.Text
			Button.Font = Enum.Font.Gotham
			Button.TextSize = 14
			Button.LayoutOrder = #Page:GetChildren() + 1
			Button.Parent = Page
			Button.MouseButton1Click:Connect(Callback)
			return Button
		end

		function Tab:CreateToggle(Name, Default, Callback)
			local Toggled = Default
			local Toggle = Instance.new("TextButton")
			Toggle.Size = UDim2.new(1, 0, 0, 30)
			Toggle.BackgroundColor3 = NovaLibrary.Theme.Accent
			Toggle.BorderSizePixel = 0
			Toggle.Text = Name.." | "..(Toggled and "ON" or "OFF")
			Toggle.TextColor3 = NovaLibrary.Theme.Text
			Toggle.Font = Enum.Font.Gotham
			Toggle.TextSize = 14
			Toggle.LayoutOrder = #Page:GetChildren() + 1
			Toggle.Parent = Page
			Toggle.MouseButton1Click:Connect(function()
				Toggled = not Toggled
				Toggle.Text = Name.." | "..(Toggled and "ON" or "OFF")
				Callback(Toggled)
			end)
			return Toggle
		end

		function Tab:CreateSlider(Name, Min, Max, Increment, Default, Callback)
			local SliderFrame = Instance.new("Frame")
			SliderFrame.Size = UDim2.new(1, 0, 0, 30)
			SliderFrame.BackgroundColor3 = NovaLibrary.Theme.Hover
			SliderFrame.BorderSizePixel = 0
			SliderFrame.LayoutOrder = #Page:GetChildren() + 1
			SliderFrame.Parent = Page

			local Label = Instance.new("TextLabel")
			Label.Size = UDim2.new(0.5, 0, 1, 0)
			Label.BackgroundTransparency = 1
			Label.Text = Name.." | "..Default
			Label.TextColor3 = NovaLibrary.Theme.Text
			Label.Font = Enum.Font.Gotham
			Label.TextSize = 14
			Label.TextXAlignment = Enum.TextXAlignment.Left
			Label.Parent = SliderFrame

			local SliderButton = Instance.new("TextButton")
			SliderButton.Size = UDim2.new(0, 20, 1, 0)
			SliderButton.Position = UDim2.new((Default-Min)/(Max-Min), 0, 0, 0)
			SliderButton.Text = ""
			SliderButton.BackgroundColor3 = NovaLibrary.Theme.Accent
			SliderButton.BorderSizePixel = 0
			SliderButton.Parent = SliderFrame

			local dragging = false
			SliderButton.MouseButton1Down:Connect(function()
				dragging = true
			end)
			UserInputService.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					dragging = false
				end
			end)
			UserInputService.InputChanged:Connect(function(input)
				if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
					local rel = math.clamp((input.Position.X - SliderFrame.AbsolutePosition.X)/SliderFrame.AbsoluteSize.X, 0, 1)
					local val = math.floor(rel*(Max-Min)/Increment + 0.5)*Increment + Min
					SliderButton.Position = UDim2.new(rel, -10, 0, 0)
					Label.Text = Name.." | "..val
					Callback(val)
				end
			end)
			return SliderFrame
		end

		function Tab:CreateParagraph(TitleText, ContentText)
			local ParagraphTitle = Instance.new("TextLabel")
			ParagraphTitle.Size = UDim2.new(1, 0, 0, 20)
			ParagraphTitle.BackgroundTransparency = 1
			ParagraphTitle.Text = TitleText
			ParagraphTitle.TextColor3 = NovaLibrary.Theme.Text
			ParagraphTitle.Font = Enum.Font.GothamBold
			ParagraphTitle.TextSize = 14
			ParagraphTitle.TextXAlignment = Enum.TextXAlignment.Left
			ParagraphTitle.LayoutOrder = #Page:GetChildren() + 1
			ParagraphTitle.Parent = Page

			local ParagraphContent = Instance.new("TextLabel")
			ParagraphContent.Size = UDim2.new(1, 0, 0, 40)
			ParagraphContent.BackgroundTransparency = 1
			ParagraphContent.Text = ContentText
			ParagraphContent.TextColor3 = NovaLibrary.Theme.Text
			ParagraphContent.Font = Enum.Font.Gotham
			ParagraphContent.TextSize = 14
			ParagraphContent.TextWrapped = true
			ParagraphContent.TextXAlignment = Enum.TextXAlignment.Left
			ParagraphContent.LayoutOrder = #Page:GetChildren() + 1
			ParagraphContent.Parent = Page
		end

		function Tab:CreateDivider()
			local Divider = Instance.new("Frame")
			Divider.Size = UDim2.new(1, 0, 0, 2)
			Divider.BackgroundColor3 = NovaLibrary.Theme.Accent
			Divider.BorderSizePixel = 0
			Divider.LayoutOrder = #Page:GetChildren() + 1
			Divider.Parent = Page
		end

		self.Tabs[#self.Tabs+1] = Tab
		return Tab
	end

	function Window:Notify(Title, Text, Duration)
		local Notif = Instance.new("Frame")
		Notif.Size = UDim2.new(0, 300, 0, 50)
		Notif.Position = UDim2.new(0.5, -150, 0, 0)
		Notif.BackgroundColor3 = NovaLibrary.Theme.Accent
		Notif.BorderSizePixel = 0
		Notif.Parent = NotifContainer

		local LabelTitle = Instance.new("TextLabel")
		LabelTitle.Size = UDim2.new(1, -10, 0, 20)
		LabelTitle.Position = UDim2.new(0, 5, 0, 0)
		LabelTitle.BackgroundTransparency = 1
		LabelTitle.Text = Title
		LabelTitle.TextColor3 = NovaLibrary.Theme.Text
		LabelTitle.Font = Enum.Font.GothamBold
		LabelTitle.TextSize = 14
		LabelTitle.TextXAlignment = Enum.TextXAlignment.Left
		LabelTitle.Parent = Notif

		local LabelText = Instance.new("TextLabel")
		LabelText.Size = UDim2.new(1, -10, 0, 30)
		LabelText.Position = UDim2.new(0, 5, 0, 20)
		LabelText.BackgroundTransparency = 1
		LabelText.Text = Text
		LabelText.TextColor3 = NovaLibrary.Theme.Text
		LabelText.Font = Enum.Font.Gotham
		LabelText.TextSize = 14
		LabelText.TextXAlignment = Enum.TextXAlignment.Left
		LabelText.TextWrapped = true
		LabelText.Parent = Notif

		Tween(Notif, {Position = UDim2.new(0.5, -150, 0, 20)}, 0.3)
		task.delay(Duration or 3, function()
			Tween(Notif, {Position = UDim2.new(0.5, -150, 0, -60)}, 0.3)
			task.wait(0.3)
			Notif:Destroy()
		end)
	end

	return Window
end

return NovaLibrary
