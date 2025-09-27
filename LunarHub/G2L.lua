local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local G2L = {}

G2L["ScreenGui_1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"))
G2L["ScreenGui_1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling
CollectionService:AddTag(G2L["ScreenGui_1"], "main")

G2L["MainFrame_2"] = Instance.new("Frame", G2L["ScreenGui_1"])
G2L["MainFrame_2"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
G2L["MainFrame_2"]["Size"] = UDim2.new(0.53402, 0, 0.75829, 0)
G2L["MainFrame_2"]["Position"] = UDim2.new(0.2189, 0, 0.07922, 0)
G2L["MainFrame_2"]["BorderColor3"] = Color3.fromRGB(119, 0, 255)
G2L["MainFrame_2"]["Name"] = "MainFrame"

G2L["TextLabel_3"] = Instance.new("TextLabel", G2L["MainFrame_2"])
G2L["TextLabel_3"]["TextWrapped"] = true
G2L["TextLabel_3"]["TextXAlignment"] = Enum.TextXAlignment.Left
G2L["TextLabel_3"]["TextScaled"] = true
G2L["TextLabel_3"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
G2L["TextLabel_3"]["TextColor3"] = Color3.fromRGB(119, 0, 255)
G2L["TextLabel_3"]["Size"] = UDim2.new(0.75225, 0, 0.09701, 0)
G2L["TextLabel_3"]["BorderColor3"] = Color3.fromRGB(119, 0, 255)
G2L["TextLabel_3"]["Text"] = "Lunar Hub"
G2L["TextLabel_3"]["Position"] = UDim2.new(0.01351, 0, 0.02239, 0)

G2L["TabScrollFrame_4"] = Instance.new("ScrollingFrame", G2L["MainFrame_2"])
G2L["TabScrollFrame_4"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
G2L["TabScrollFrame_4"]["Name"] = "TabScrollFrame"
G2L["TabScrollFrame_4"]["Size"] = UDim2.new(0.96847, 0, 0.08209, 0)
G2L["TabScrollFrame_4"]["ScrollBarImageColor3"] = Color3.fromRGB(119, 0, 255)
G2L["TabScrollFrame_4"]["Position"] = UDim2.new(0.01351, 0, 0.14179, 0)
G2L["TabScrollFrame_4"]["BorderColor3"] = Color3.fromRGB(119, 0, 255)
G2L["TabScrollFrame_4"]["ScrollBarThickness"] = 5
G2L["TabScrollFrame_4"]["CanvasSize"] = UDim2.new(2, 0, 0, 0)
G2L["TabScrollFrame_4"]["AutomaticCanvasSize"] = Enum.AutomaticSize.X

G2L["TabLayout_5"] = Instance.new("UIListLayout", G2L["TabScrollFrame_4"])
G2L["TabLayout_5"]["FillDirection"] = Enum.FillDirection.Horizontal
G2L["TabLayout_5"]["Padding"] = UDim.new(0, 5)

G2L["ContentScrollFrame_6"] = Instance.new("ScrollingFrame", G2L["MainFrame_2"])
G2L["ContentScrollFrame_6"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
G2L["ContentScrollFrame_6"]["Name"] = "ContentScrollFrame"
G2L["ContentScrollFrame_6"]["Size"] = UDim2.new(0.96847, 0, 0.72388, 0)
G2L["ContentScrollFrame_6"]["ScrollBarImageColor3"] = Color3.fromRGB(119, 0, 255)
G2L["ContentScrollFrame_6"]["Position"] = UDim2.new(0.01802, 0, 0.26119, 0)
G2L["ContentScrollFrame_6"]["BorderColor3"] = Color3.fromRGB(119, 0, 255)
G2L["ContentScrollFrame_6"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y

G2L["ContentLayout_7"] = Instance.new("UIListLayout", G2L["ContentScrollFrame_6"])
G2L["ContentLayout_7"]["FillDirection"] = Enum.FillDirection.Vertical
G2L["ContentLayout_7"]["Padding"] = UDim.new(0, 5)

G2L["UIAspectRatioConstraint_8"] = Instance.new("UIAspectRatioConstraint", G2L["MainFrame_2"])
G2L["UIAspectRatioConstraint_8"]["AspectRatio"] = 1.65672

-- Add Minimize Button
G2L["MinBtn_9"] = Instance.new("TextButton", G2L["MainFrame_2"])
G2L["MinBtn_9"]["TextWrapped"] = true
G2L["MinBtn_9"]["BorderSizePixel"] = 0
G2L["MinBtn_9"]["TextScaled"] = true
G2L["MinBtn_9"]["TextColor3"] = Color3.fromRGB(119, 0, 255)
G2L["MinBtn_9"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
G2L["MinBtn_9"]["Size"] = UDim2.new(0.07658, 0, 0.12687, 0)
G2L["MinBtn_9"]["BorderColor3"] = Color3.fromRGB(119, 0, 255)
G2L["MinBtn_9"]["Text"] = [[-]]
G2L["MinBtn_9"]["Name"] = [[MinBtn]]
G2L["MinBtn_9"]["Position"] = UDim2.new(0.90541, 0, 0.01493, 0)

-- Lunar Hub System
local LunarHub = {}
LunarHub.Tabs = {}
LunarHub.CurrentTab = nil

-- Notification function
function notify(title, text, duration)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = duration or 5
    })
end

-- Chat function
local function Chat(message)
    game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(message)
end

-- Enhanced Tab System
function LunarHub:AddTab(name, order)
    local tabButton = Instance.new("TextButton")
    tabButton.Name = name .. "Tab"
    tabButton.Text = name
    tabButton.TextColor3 = Color3.fromRGB(119, 0, 255)
    tabButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    tabButton.BorderColor3 = Color3.fromRGB(119, 0, 255)
    tabButton.Size = UDim2.new(0, 80, 0, 30)
    tabButton.TextScaled = true
    tabButton.Parent = G2L["TabScrollFrame_4"]
    
    local tab = {
        Name = name,
        Button = tabButton,
        Elements = {},
        ElementCount = 0,
        
        -- Button with callback
        CreateButton = function(self, buttonName, callback)
            local button = Instance.new("TextButton")
            button.Name = buttonName .. "Button"
            button.Text = buttonName
            button.TextColor3 = Color3.fromRGB(119, 0, 255)
            button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            button.BorderColor3 = Color3.fromRGB(119, 0, 255)
            button.Size = UDim2.new(0, 404, 0, 30)
            button.TextScaled = true
            
            self.ElementCount = self.ElementCount + 1
            button.LayoutOrder = self.ElementCount
            
            button.MouseButton1Click:Connect(callback)
            
            table.insert(self.Elements, button)
            
            if LunarHub.CurrentTab == self then
                button.Parent = G2L["ContentScrollFrame_6"]
            end
            
            return button
        end,
        
        -- Toggle with state management
        CreateToggle = function(self, toggleName, default, callback)
            local toggleFrame = Instance.new("Frame")
            toggleFrame.Name = toggleName .. "Toggle"
            toggleFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            toggleFrame.BorderColor3 = Color3.fromRGB(119, 0, 255)
            toggleFrame.Size = UDim2.new(0, 404, 0, 30)
            
            local toggleButton = Instance.new("TextButton")
            toggleButton.Name = "ToggleButton"
            toggleButton.Text = toggleName .. " [OFF]"
            toggleButton.TextColor3 = Color3.fromRGB(119, 0, 255)
            toggleButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            toggleButton.BorderColor3 = Color3.fromRGB(119, 0, 255)
            toggleButton.Size = UDim2.new(1, 0, 1, 0)
            toggleButton.TextScaled = true
            toggleButton.Parent = toggleFrame
            
            local toggleState = default or false
            
            self.ElementCount = self.ElementCount + 1
            toggleFrame.LayoutOrder = self.ElementCount
            
            -- Update initial state
            if toggleState then
                toggleButton.Text = toggleName .. " [ON]"
                toggleButton.TextColor3 = Color3.fromRGB(0, 255, 0)
            end
            
            toggleButton.MouseButton1Click:Connect(function()
                toggleState = not toggleState
                if toggleState then
                    toggleButton.Text = toggleName .. " [ON]"
                    toggleButton.TextColor3 = Color3.fromRGB(0, 255, 0)
                else
                    toggleButton.Text = toggleName .. " [OFF]"
                    toggleButton.TextColor3 = Color3.fromRGB(119, 0, 255)
                end
                if callback then
                    callback(toggleState)
                end
            end)
            
            table.insert(self.Elements, toggleFrame)
            
            if LunarHub.CurrentTab == self then
                toggleFrame.Parent = G2L["ContentScrollFrame_6"]
            end
            
            return toggleFrame
        end,
        
        -- Note/Label display
        CreateNote = function(self, title, text)
            local noteFrame = Instance.new("Frame")
            noteFrame.Name = title .. "Note"
            noteFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            noteFrame.BorderColor3 = Color3.fromRGB(119, 0, 255)
            noteFrame.Size = UDim2.new(0, 404, 0, 0)
            noteFrame.AutomaticSize = Enum.AutomaticSize.Y
            
            local titleLabel = Instance.new("TextLabel")
            titleLabel.Name = "Title"
            titleLabel.Text = title
            titleLabel.TextColor3 = Color3.fromRGB(119, 0, 255)
            titleLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            titleLabel.BorderColor3 = Color3.fromRGB(119, 0, 255)
            titleLabel.Size = UDim2.new(1, 0, 0, 25)
            titleLabel.TextScaled = true
            titleLabel.TextXAlignment = Enum.TextXAlignment.Left
            titleLabel.Parent = noteFrame
            
            local textLabel = Instance.new("TextLabel")
            textLabel.Name = "Text"
            textLabel.Text = text
            textLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
            textLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            textLabel.BorderSizePixel = 0
            textLabel.Size = UDim2.new(1, -10, 0, 0)
            textLabel.Position = UDim2.new(0, 5, 0, 30)
            textLabel.TextWrapped = true
            textLabel.TextXAlignment = Enum.TextXAlignment.Left
            textLabel.TextYAlignment = Enum.TextYAlignment.Top
            textLabel.AutomaticSize = Enum.AutomaticSize.Y
            textLabel.Parent = noteFrame
            
            titleLabel.Active = false
            titleLabel.Selectable = false
            textLabel.Active = false
            textLabel.Selectable = false
            noteFrame.Active = false
            
            self.ElementCount = self.ElementCount + 1
            noteFrame.LayoutOrder = self.ElementCount
            
            table.insert(self.Elements, noteFrame)
            
            if LunarHub.CurrentTab == self then
                noteFrame.Parent = G2L["ContentScrollFrame_6"]
            end
            
            return noteFrame
        end,
        
        -- New: Create Label (simple text)
        CreateLabel = function(self, text)
            local label = Instance.new("TextLabel")
            label.Name = "Label"
            label.Text = text
            label.TextColor3 = Color3.fromRGB(119, 0, 255)
            label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            label.BorderColor3 = Color3.fromRGB(119, 0, 255)
            label.Size = UDim2.new(0, 404, 0, 25)
            label.TextScaled = true
            label.TextXAlignment = Enum.TextXAlignment.Left
            
            self.ElementCount = self.ElementCount + 1
            label.LayoutOrder = self.ElementCount
            
            table.insert(self.Elements, label)
            
            if LunarHub.CurrentTab == self then
                label.Parent = G2L["ContentScrollFrame_6"]
            end
            
            return label
        end,
        
        -- New: Create TextBox (input field)
        CreateTextBox = function(self, placeholder, callback)
            local textBoxFrame = Instance.new("Frame")
            textBoxFrame.Name = "TextBoxFrame"
            textBoxFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            textBoxFrame.BorderColor3 = Color3.fromRGB(119, 0, 255)
            textBoxFrame.Size = UDim2.new(0, 404, 0, 30)
            
            local textBox = Instance.new("TextBox")
            textBox.Name = "TextBox"
            textBox.PlaceholderText = placeholder
            textBox.Text = ""
            textBox.TextColor3 = Color3.fromRGB(119, 0, 255)
            textBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            textBox.BorderSizePixel = 0
            textBox.Size = UDim2.new(0.9, 0, 0.8, 0)
            textBox.Position = UDim2.new(0.05, 0, 0.1, 0)
            textBox.TextScaled = true
            textBox.Parent = textBoxFrame
            
            self.ElementCount = self.ElementCount + 1
            textBoxFrame.LayoutOrder = self.ElementCount
            
            if callback then
                textBox.FocusLost:Connect(function(enterPressed)
                    if enterPressed then
                        callback(textBox.Text)
                        textBox.Text = ""
                    end
                end)
            end
            
            table.insert(self.Elements, textBoxFrame)
            
            if LunarHub.CurrentTab == self then
                textBoxFrame.Parent = G2L["ContentScrollFrame_6"]
            end
            
            return textBoxFrame
        end,
        
        -- New: Create Slider
        CreateSlider = function(self, sliderName, min, max, default, callback)
            local sliderFrame = Instance.new("Frame")
            sliderFrame.Name = sliderName .. "Slider"
            sliderFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            sliderFrame.BorderColor3 = Color3.fromRGB(119, 0, 255)
            sliderFrame.Size = UDim2.new(0, 404, 0, 50)
            
            local nameLabel = Instance.new("TextLabel")
            nameLabel.Name = "NameLabel"
            nameLabel.Text = sliderName .. ": " .. (default or min)
            nameLabel.TextColor3 = Color3.fromRGB(119, 0, 255)
            nameLabel.BackgroundTransparency = 1
            nameLabel.Size = UDim2.new(1, 0, 0.4, 0)
            nameLabel.TextXAlignment = Enum.TextXAlignment.Left
            nameLabel.Parent = sliderFrame
            
            local slider = Instance.new("TextButton")
            slider.Name = "Slider"
            slider.Text = ""
            slider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            slider.BorderColor3 = Color3.fromRGB(119, 0, 255)
            slider.Size = UDim2.new(0.9, 0, 0.3, 0)
            slider.Position = UDim2.new(0.05, 0, 0.5, 0)
            slider.Parent = sliderFrame
            
            local fill = Instance.new("Frame")
            fill.Name = "Fill"
            fill.BackgroundColor3 = Color3.fromRGB(119, 0, 255)
            fill.BorderSizePixel = 0
            fill.Size = UDim2.new((default or min) / max, 0, 1, 0)
            fill.Parent = slider
            
            local currentValue = default or min
            
            slider.MouseButton1Down:Connect(function()
                local connection
                connection = game:GetService("RunService").RenderStepped:Connect(function()
                    local mouse = game:GetService("Players").LocalPlayer:GetMouse()
                    local relativeX = math.clamp(mouse.X - slider.AbsolutePosition.X, 0, slider.AbsoluteSize.X)
                    local percentage = relativeX / slider.AbsoluteSize.X
                    currentValue = math.floor(min + (max - min) * percentage)
                    
                    fill.Size = UDim2.new(percentage, 0, 1, 0)
                    nameLabel.Text = sliderName .. ": " .. currentValue
                    
                    if callback then
                        callback(currentValue)
                    end
                end)
                
                local function disconnect()
                    connection:Disconnect()
                end
                
                game:GetService("UserInputService").InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        disconnect()
                    end
                end)
            end)
            
            self.ElementCount = self.ElementCount + 1
            sliderFrame.LayoutOrder = self.ElementCount
            
            table.insert(self.Elements, sliderFrame)
            
            if LunarHub.CurrentTab == self then
                sliderFrame.Parent = G2L["ContentScrollFrame_6"]
            end
            
            return sliderFrame
        end
    }
    
    table.insert(LunarHub.Tabs, tab)
    
    if #LunarHub.Tabs == 1 then
        LunarHub:SelectTab(tab)
    end
    
    tabButton.MouseButton1Click:Connect(function()
        LunarHub:SelectTab(tab)
    end)
    
    return tab
end

function LunarHub:SelectTab(tab)
    -- Clear current content
    for _, child in pairs(G2L["ContentScrollFrame_6"]:GetChildren()) do
        if not child:IsA("UIListLayout") then
            child:Destroy()
        end
    end
    
    -- Add tab elements
    for _, element in ipairs(tab.Elements) do
        element.Parent = G2L["ContentScrollFrame_6"]
    end
    
    -- Update tab button colors
    for _, otherTab in ipairs(self.Tabs) do
        if otherTab == tab then
            otherTab.Button.BackgroundColor3 = Color3.fromRGB(50, 0, 100) -- Active color
        else
            otherTab.Button.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Inactive color
        end
    end
    
    LunarHub.CurrentTab = tab
end

-- Window interface
Window = {
    AddTab = function(name, order)
        return LunarHub:AddTab(name, order)
    end
}

-- Tool prevention system
local player = Players.LocalPlayer
local preventToolsEnabled = false
local Place = game.PlaceId

function setupToolListener(char)
    char.ChildAdded:Connect(function(child)
        if preventToolsEnabled and child:IsA("Tool") then
            local humanoid = char:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:UnequipTools()
            end
        end
    end)
end

function onCharacterAdded(char)
    setupToolListener(char)
end

if player.Character then
    onCharacterAdded(player.Character)
end
player.CharacterAdded:Connect(onCharacterAdded)

-- Initialize tabs
local ReadTab = Window:AddTab("(📄) READ", 1)
local HomeTab = Window:AddTab("(🔗) Home", 2)
local MainTab = Window:AddTab("(🔗) Main", 3)
local MyTab = Window:AddTab("(🔗) By Owner", 4)
local KeyTab = Window:AddTab("(🔗) Keyboards", 5)

-- Add minimize functionality
G2L["MinBtn_9"].MouseButton1Click:Connect(function()
    local mainFrame = G2L["MainFrame_2"]
    if mainFrame.Size.Y.Scale > 0.1 then
        mainFrame.Size = UDim2.new(mainFrame.Size.X.Scale, 0, 0.1, 0)
        G2L["MinBtn_9"].Text = "+"
    else
        mainFrame.Size = UDim2.new(0.53402, 0, 0.75829, 0)
        G2L["MinBtn_9"].Text = "-"
    end
end)

-- Your existing content
if Place ~= 88308889239232 and Place ~= 17574618959 then
    ReadTab:CreateNote("❗︱Game Not Supported", "Some features from this hub are removed.")
end

ReadTab:CreateNote("‼️ PLEASE READ THIS ‼️", "I DO NOT OWN THE SCRIPTS IN THIS SCRIPT!!! ALL CREDIT GOES TO RESPECTIVE OWNERS OF THE SCRIPTS!!")
ReadTab:CreateNote("Meaning of emojis", "🎮 - Only supported games\n🔗 - Any game")

if Place == 88308889239232 or Place == 17574618959 then
    ReadTab:CreateNote("How to use this hub? 🤔", "If you're gonna use genesis, go to the Genesis rigs tab, once your done loading the hats and rigs, head to the Genesis tab and execute the scripts there!!1!")
    ReadTab:CreateNote("‼️ Notice ‼️", "Credits to Theo for the idea of adding genesis, he's a cool guy make sure to check out his hub too! :)")
end

ReadTab:CreateNote("🌌︱Theme credits", "Theme made by Theo.")

-- Example of using the new button types:
HomeTab:CreateLabel("Welcome to Lunar Hub!")
HomeTab:CreateTextBox("Enter command...", function(text)
    notify("Command", "You entered: " .. text, 3)
end)

HomeTab:CreateSlider("WalkSpeed", 16, 100, 16, function(value)
    if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
        player.Character.Humanoid.WalkSpeed = value
    end
end)

-- Rest of your existing code...
if Place == 17574618959 or Place == 88308889239232 then
    HomeTab:CreateButton("Sit", function() Chat("-sit ") end)
    HomeTab:CreateButton("Spawn Dummy", function() Chat("-dummy ") end)
    HomeTab:CreateButton("Respawn", function() Chat("-re ") end)
    HomeTab:CreateButton("Remove Hats", function() Chat("-ch ") end)
    HomeTab:CreateButton("Save hats", function() Chat("-sh ") end)
    HomeTab:CreateButton("PermaDeath", function() Chat("-pd ") end)
end

HomeTab:CreateToggle("Prevent tools", false, function(Value)
    preventToolsEnabled = Value
    local char = player.Character
    if char then
        local tool = char:FindFirstChildOfClass("Tool")
        if tool and preventToolsEnabled then
            local humanoid = char:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:UnequipTools()
            end
        end
    end
end)

HomeTab:CreateNote("Walkspeed/JumpPower", "Use these to modify your character's movement:")

HomeTab:CreateButton("Set WalkSpeed to 50", function()
    if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
        player.Character.Humanoid.WalkSpeed = 50
        notify("WalkSpeed", "Set to 50", 3)
    end
end)

HomeTab:CreateButton("Set JumpPower to 100", function()
    if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
        player.Character.Humanoid.JumpPower = 100
        notify("JumpPower", "Set to 100", 3)
    end
end)

HomeTab:CreateButton("Reset Movement", function()
    if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
        player.Character.Humanoid.WalkSpeed = 16
        player.Character.Humanoid.JumpPower = 50
        notify("Movement", "Reset to default", 3)
    end
end)

-- Continue with the rest of your existing tabs and buttons...

return G2L["ScreenGui_1"]