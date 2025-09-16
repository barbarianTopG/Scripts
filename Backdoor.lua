local G2L = {}

-- Main ScreenGui
G2L["1"] = Instance.new("ScreenGui", game:GetService("CoreGui"):WaitForChild("RobloxGui"))
G2L["1"].Name = "BloxBackdoor"
G2L["1"].ZIndexBehavior = Enum.ZIndexBehavior.Sibling
G2L["1"].ResetOnSpawn = false

-- Main Frame
G2L["2"] = Instance.new("Frame", G2L["1"])
G2L["2"].BackgroundColor3 = Color3.fromRGB(18, 18, 18)
G2L["2"].Size = UDim2.new(0, 500, 0, 300)
G2L["2"].Position = UDim2.new(0.5, -250, 0.3, 0)

-- Frame Border Gradient
G2L["3"] = Instance.new("UIStroke", G2L["2"])
G2L["3"].Color = Color3.fromRGB(255, 255, 255)
G2L["4"] = Instance.new("UIGradient", G2L["3"])
G2L["4"].Rotation = 45
G2L["4"].Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 255))
}

-- Rounded corners
G2L["5"] = Instance.new("UICorner", G2L["2"])
G2L["5"].CornerRadius = UDim.new(0, 12)

-- Title
G2L["title"] = Instance.new("TextLabel", G2L["2"])
G2L["title"].Text = "Blox Backdoor"
G2L["title"].TextColor3 = Color3.fromRGB(255, 255, 255)
G2L["title"].BackgroundTransparency = 1
G2L["title"].Font = Enum.Font.GothamBold
G2L["title"].TextSize = 32
G2L["title"].Size = UDim2.new(1, -20, 0, 40)
G2L["title"].Position = UDim2.new(0, 10, 0, 10)
G2L["title"].TextXAlignment = Enum.TextXAlignment.Left
