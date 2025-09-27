local G2L = {}

G2L["ScreenGui"] = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))
G2L["ScreenGui"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling

G2L["MainFrame"] = Instance.new("Frame", G2L["ScreenGui"])
G2L["MainFrame"]["BackgroundColor3"] = Color3.fromRGB(40, 40, 40)
G2L["MainFrame"]["BorderSizePixel"] = 0
G2L["MainFrame"]["Position"] = UDim2.new(0.5, -150, 0.5, -80)
G2L["MainFrame"]["Size"] = UDim2.new(0, 300, 0, 160)
G2L["MainFrame"]["Active"] = true
G2L["MainFrame"]["Draggable"] = true

G2L["UICorner"] = Instance.new("UICorner", G2L["MainFrame"])
G2L["UICorner"]["CornerRadius"] = UDim.new(0, 6)

G2L["Title"] = Instance.new("TextLabel", G2L["MainFrame"])
G2L["Title"]["BackgroundColor3"] = Color3.fromRGB(30, 30, 30)
G2L["Title"]["BorderSizePixel"] = 0
G2L["Title"]["Size"] = UDim2.new(1, 0, 0, 30)
G2L["Title"]["Font"] = Enum.Font.GothamBold
G2L["Title"]["Text"] = "Select Version"
G2L["Title"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["Title"]["TextSize"] = 16

G2L["WelcomeText"] = Instance.new("TextLabel", G2L["MainFrame"])
G2L["WelcomeText"]["BackgroundTransparency"] = 1
G2L["WelcomeText"]["Position"] = UDim2.new(0, 0, 0.25, 0)
G2L["WelcomeText"]["Size"] = UDim2.new(1, 0, 0, 30)
G2L["WelcomeText"]["Font"] = Enum.Font.Gotham
G2L["WelcomeText"]["Text"] = "Welcome! Please choose version:"
G2L["WelcomeText"]["TextColor3"] = Color3.fromRGB(200, 200, 200)
G2L["WelcomeText"]["TextSize"] = 14

G2L["V1"] = Instance.new("TextButton", G2L["MainFrame"])
G2L["V1"]["BackgroundColor3"] = Color3.fromRGB(60, 120, 200)
G2L["V1"]["BorderSizePixel"] = 0
G2L["V1"]["Position"] = UDim2.new(0.1, 0, 0.5, 0)
G2L["V1"]["Size"] = UDim2.new(0.8, 0, 0, 30)
G2L["V1"]["Font"] = Enum.Font.GothamBold
G2L["V1"]["Text"] = "Rayfield UI"
G2L["V1"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["V1"]["TextSize"] = 14

G2L["Button1Corner"] = Instance.new("UICorner", G2L["V1"])
G2L["Button1Corner"]["CornerRadius"] = UDim.new(0, 4)

G2L["V2"] = Instance.new("TextButton", G2L["MainFrame"])
G2L["V2"]["BackgroundColor3"] = Color3.fromRGB(200, 80, 60)
G2L["V2"]["BorderSizePixel"] = 0
G2L["V2"]["Position"] = UDim2.new(0.1, 0, 0.75, 0)
G2L["V2"]["Size"] = UDim2.new(0.8, 0, 0, 30)
G2L["V2"]["Font"] = Enum.Font.GothamBold
G2L["V2"]["Text"] = "Custom UI"
G2L["V2"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["V2"]["TextSize"] = 14

G2L["Button2Corner"] = Instance.new("UICorner", G2L["V2"])
G2L["Button2Corner"]["CornerRadius"] = UDim.new(0, 4)

G2L["V1"].MouseButton1Click:Connect(function()
    G2L["WelcomeText"].Text = "Loading Version 1..."
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/Scripts/refs/heads/main/LunarHub/Rayfield-UI.lua"))()
    wait(0.5)
    G2L["ScreenGui"]:Destroy()
end)

G2L["V2"].MouseButton1Click:Connect(function()
    G2L["WelcomeText"].Text = "Loading Version 2..."
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/Scripts/refs/heads/main/LunarHub/G2L.lua"))()
    wait(0.5)
    G2L["ScreenGui"]:Destroy()
end)

return G2L["ScreenGui"]