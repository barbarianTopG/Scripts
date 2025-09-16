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

-- Executor Frame
G2L["executorFrame"] = Instance.new("Frame", G2L["2"])
G2L["executorFrame"].BackgroundColor3 = Color3.fromRGB(28, 28, 28)
G2L["executorFrame"].Size = UDim2.new(1, -20, 0, 180)
G2L["executorFrame"].Position = UDim2.new(0, 10, 0, 60)

-- Rounded corners for executor
G2L["executorCorner"] = Instance.new("UICorner", G2L["executorFrame"])
G2L["executorCorner"].CornerRadius = UDim.new(0, 10)

-- Executor TextBox
G2L["executorBox"] = Instance.new("TextBox", G2L["executorFrame"])
G2L["executorBox"].BackgroundTransparency = 1
G2L["executorBox"].TextColor3 = Color3.fromRGB(255, 255, 255)
G2L["executorBox"].Font = Enum.Font.Gotham
G2L["executorBox"].TextSize = 18
G2L["executorBox"].Size = UDim2.new(1, -10, 1, -10)
G2L["executorBox"].Position = UDim2.new(0, 5, 0, 5)
G2L["executorBox"].ClearTextOnFocus = false
G2L["executorBox"].Text = ""
G2L["executorBox"].TextWrapped = true
G2L["executorBox"].MultiLine = true
G2L["executorBox"].PlaceholderText = "Your script here..."

-- Buttons Frame
G2L["buttonsFrame"] = Instance.new("Frame", G2L["2"])
G2L["buttonsFrame"].BackgroundTransparency = 1
G2L["buttonsFrame"].Size = UDim2.new(1, -20, 0, 40)
G2L["buttonsFrame"].Position = UDim2.new(0, 10, 0, 250)

-- Execute Button
G2L["executeBtn"] = Instance.new("TextButton", G2L["buttonsFrame"])
G2L["executeBtn"].BackgroundColor3 = Color3.fromRGB(2, 30, 214)
G2L["executeBtn"].Text = "Execute"
G2L["executeBtn"].TextColor3 = Color3.fromRGB(255, 255, 255)
G2L["executeBtn"].Font = Enum.Font.GothamBold
G2L["executeBtn"].TextSize = 18
G2L["executeBtn"].Size = UDim2.new(0.3, 0, 1, 0)
G2L["executeBtn"].Position = UDim2.new(0, 0, 0, 0)

-- Clear Button
G2L["clearBtn"] = Instance.new("TextButton", G2L["buttonsFrame"])
G2L["clearBtn"].BackgroundColor3 = Color3.fromRGB(214, 2, 2)
G2L["clearBtn"].Text = "Clear"
G2L["clearBtn"].TextColor3 = Color3.fromRGB(255, 255, 255)
G2L["clearBtn"].Font = Enum.Font.GothamBold
G2L["clearBtn"].TextSize = 18
G2L["clearBtn"].Size = UDim2.new(0.3, 0, 1, 0)
G2L["clearBtn"].Position = UDim2.new(0.35, 5, 0, 0)

-- Save Button
G2L["saveBtn"] = Instance.new("TextButton", G2L["buttonsFrame"])
G2L["saveBtn"].BackgroundColor3 = Color3.fromRGB(2, 214, 2)
G2L["saveBtn"].Text = "Save"
G2L["saveBtn"].TextColor3 = Color3.fromRGB(255, 255, 255)
G2L["saveBtn"].Font = Enum.Font.GothamBold
G2L["saveBtn"].TextSize = 18
G2L["saveBtn"].Size = UDim2.new(0.3, 0, 1, 0)
G2L["saveBtn"].Position = UDim2.new(0.7, 5, 0, 0)

-- Button corner rounding
for _, btn in pairs({G2L["executeBtn"], G2L["clearBtn"], G2L["saveBtn"]}) do
    local corner = Instance.new("UICorner", btn)
    corner.CornerRadius = UDim.new(0, 8)
end

-- Button functionality
G2L["executeBtn"].MouseButton1Click:Connect(function()
    local scriptText = G2L["executorBox"].Text
    if scriptText ~= "" then
        loadstring(scriptText)()
    end
end)

G2L["clearBtn"].MouseButton1Click:Connect(function()
    G2L["executorBox"].Text = ""
end)

G2L["saveBtn"].MouseButton1Click:Connect(function()
    local content = G2L["executorBox"].Text
    if content ~= "" then
        -- implement saving logic (Favorites or local file)
        print("Script saved!")
    end
end)

-- Sidebar Frame
G2L["sidebar"] = Instance.new("Frame", G2L["main"])
G2L["sidebar"].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
G2L["sidebar"].Size = UDim2.new(0, 120, 1, 0)
G2L["sidebar"].Position = UDim2.new(0, 0, 0, 0)

-- Sidebar Buttons
local tabNames = {"Executor", "Favorites", "Settings"}
G2L["sidebarButtons"] = {}

for i, name in ipairs(tabNames) do
    local btn = Instance.new("TextButton", G2L["sidebar"])
    btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    btn.Size = UDim2.new(1, -10, 0, 50)
    btn.Position = UDim2.new(0, 5, 0, 10 + (i - 1) * 60)
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 18

    local corner = Instance.new("UICorner", btn)
    corner.CornerRadius = UDim.new(0, 8)

    G2L["sidebarButtons"][name] = btn
end

-- Tabs Frames (matching sidebar names)
G2L["tabs"] = {}
for _, name in ipairs(tabNames) do
    local frame = Instance.new("Frame", G2L["main"])
    frame.BackgroundTransparency = 1
    frame.Size = UDim2.new(1, -130, 1, -20)
    frame.Position = UDim2.new(0, 130, 0, 10)
    frame.Visible = false
    G2L["tabs"][name] = frame
end

-- Show Executor tab by default
G2L["tabs"]["Executor"].Visible = true
