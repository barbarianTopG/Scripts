local Players = game:GetService("Players")
local G2L = {}

G2L["ScreenGui"] = Instance.new("ScreenGui", Players.LocalPlayer:WaitForChild("PlayerGui"))
G2L["ScreenGui"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling

G2L["MainFrame"] = Instance.new("Frame", G2L["ScreenGui"])
G2L["MainFrame"]["BackgroundColor3"] = Color3.fromRGB(30, 30, 40)
G2L["MainFrame"]["BorderSizePixel"] = 0
G2L["MainFrame"]["Position"] = UDim2.new(0.5, -150, 0.5, -120)
G2L["MainFrame"]["Size"] = UDim2.new(0, 300, 0, 240)
G2L["MainFrame"]["Active"] = true
G2L["MainFrame"]["Draggable"] = true

G2L["UICorner"] = Instance.new("UICorner", G2L["MainFrame"])
G2L["UICorner"]["CornerRadius"] = UDim.new(0, 8)

G2L["Title"] = Instance.new("TextLabel", G2L["MainFrame"])
G2L["Title"]["BackgroundColor3"] = Color3.fromRGB(45, 45, 55)
G2L["Title"]["BorderSizePixel"] = 0
G2L["Title"]["Size"] = UDim2.new(1, 0, 0, 40)
G2L["Title"]["Font"] = Enum.Font.GothamBold
G2L["Title"]["Text"] = "Version Selector"
G2L["Title"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["Title"]["TextSize"] = 18

G2L["TitleCorner"] = Instance.new("UICorner", G2L["Title"])
G2L["TitleCorner"]["CornerRadius"] = UDim.new(0, 8)

G2L["PfpContainer"] = Instance.new("Frame", G2L["MainFrame"])
G2L["PfpContainer"]["BackgroundColor3"] = Color3.fromRGB(40, 40, 50)
G2L["PfpContainer"]["BorderSizePixel"] = 0
G2L["PfpContainer"]["Position"] = UDim2.new(0.5, -30, 0.25, -30)
G2L["PfpContainer"]["Size"] = UDim2.new(0, 60, 0, 60)

G2L["PfpCorner"] = Instance.new("UICorner", G2L["PfpContainer"])
G2L["PfpCorner"]["CornerRadius"] = UDim.new(0, 30)

G2L["ProfilePicture"] = Instance.new("ImageLabel", G2L["PfpContainer"])
G2L["ProfilePicture"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
G2L["ProfilePicture"]["BackgroundTransparency"] = 1
G2L["ProfilePicture"]["Size"] = UDim2.new(1, 0, 1, 0)
G2L["ProfilePicture"]["Image"] = ""

G2L["PfpImageCorner"] = Instance.new("UICorner", G2L["ProfilePicture"])
G2L["PfpImageCorner"]["CornerRadius"] = UDim.new(0, 30)

G2L["WelcomeText"] = Instance.new("TextLabel", G2L["MainFrame"])
G2L["WelcomeText"]["BackgroundTransparency"] = 1
G2L["WelcomeText"]["Position"] = UDim2.new(0, 0, 0.45, 0)
G2L["WelcomeText"]["Size"] = UDim2.new(1, 0, 0, 40)
G2L["WelcomeText"]["Font"] = Enum.Font.Gotham
G2L["WelcomeText"]["Text"] = "Welcome! Please choose version:"
G2L["WelcomeText"]["TextColor3"] = Color3.fromRGB(200, 200, 200)
G2L["WelcomeText"]["TextSize"] = 14

G2L["Version1Button"] = Instance.new("TextButton", G2L["MainFrame"])
G2L["Version1Button"]["BackgroundColor3"] = Color3.fromRGB(70, 130, 200)
G2L["Version1Button"]["BorderSizePixel"] = 0
G2L["Version1Button"]["Position"] = UDim2.new(0.1, 0, 0.65, 0)
G2L["Version1Button"]["Size"] = UDim2.new(0.8, 0, 0, 35)
G2L["Version1Button"]["Font"] = Enum.Font.GothamBold
G2L["Version1Button"]["Text"] = "Version 1"
G2L["Version1Button"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["Version1Button"]["TextSize"] = 14

G2L["Button1Corner"] = Instance.new("UICorner", G2L["Version1Button"])
G2L["Button1Corner"]["CornerRadius"] = UDim.new(0, 6)

G2L["Version2Button"] = Instance.new("TextButton", G2L["MainFrame"])
G2L["Version2Button"]["BackgroundColor3"] = Color3.fromRGB(200, 100, 70)
G2L["Version2Button"]["BorderSizePixel"] = 0
G2L["Version2Button"]["Position"] = UDim2.new(0.1, 0, 0.8, 0)
G2L["Version2Button"]["Size"] = UDim2.new(0.8, 0, 0, 35)
G2L["Version2Button"]["Font"] = Enum.Font.GothamBold
G2L["Version2Button"]["Text"] = "Version 2"
G2L["Version2Button"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["Version2Button"]["TextSize"] = 14

G2L["Button2Corner"] = Instance.new("UICorner", G2L["Version2Button"])
G2L["Button2Corner"]["CornerRadius"] = UDim.new(0, 6)

local function loadProfilePicture()
    local player = Players.LocalPlayer
    local userId = player.UserId
    
    local thumbType = Enum.ThumbnailType.HeadShot
    local thumbSize = Enum.ThumbnailSize.Size420x420
    
    Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)
        :andThen(function(imageUrl)
            G2L["ProfilePicture"].Image = imageUrl
        end)
        :catch(function()
            G2L["ProfilePicture"].Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
        end)
end

G2L["Version1Button"].MouseButton1Click:Connect(function()
    G2L["WelcomeText"].Text = "Loading Version 1..."
    
    -- Placeholder
    
    wait(1)
    G2L["ScreenGui"]:Destroy()
end)

G2L["Version2Button"].MouseButton1Click:Connect(function()
    G2L["WelcomeText"].Text = "Loading Version 2..."
    
    -- Placeholder
    
    wait(1)
    G2L["ScreenGui"]:Destroy()
end)

loadProfilePicture()

return G2L["ScreenGui"]