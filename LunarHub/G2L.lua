

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

local LunarHub = {}
LunarHub.Tabs = {}
LunarHub.CurrentTab = nil

function notify(title, text, duration)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = duration or 5
    })
end

local function Chat(message)
    game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(message)
end

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
        
        CreateToggle = function(self, toggleName, callback)
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
            
            local toggleState = false
            
            self.ElementCount = self.ElementCount + 1
            toggleFrame.LayoutOrder = self.ElementCount
            
            toggleButton.MouseButton1Click:Connect(function()
                toggleState = not toggleState
                if toggleState then
                    toggleButton.Text = toggleName .. " [ON]"
                    toggleButton.TextColor3 = Color3.fromRGB(0, 255, 0)
                else
                    toggleButton.Text = toggleName .. " [OFF]"
                    toggleButton.TextColor3 = Color3.fromRGB(119, 0, 255)
                end
                callback(toggleState)
            end)
            
            table.insert(self.Elements, toggleFrame)
            
            if LunarHub.CurrentTab == self then
                toggleFrame.Parent = G2L["ContentScrollFrame_6"]
            end
            
            return toggleFrame
        end,
        
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
    for _, child in pairs(G2L["ContentScrollFrame_6"]:GetChildren()) do
        if not child:IsA("UIListLayout") then
            child:Destroy()
        end
    end
    
    for _, element in ipairs(tab.Elements) do
        element.Parent = G2L["ContentScrollFrame_6"]
    end
    
    LunarHub.CurrentTab = tab
end

Window = {
    AddTab = function(name, order)
        return LunarHub:AddTab(name, order)
    end
}





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

local ReadTab = Window:AddTab("(📄) READ", 1)
local HomeTab = Window:AddTab("(🔗) Home", 2)
local MainTab = Window:AddTab("(🔗) Main", 3)
local MyTab = Window:AddTab("(🔗) By Owner", 4)
local KeyTab = Window:AddTab("(🔗) Keyboards", 5)

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

if Place == 17574618959 or Place == 88308889239232 then
    HomeTab:CreateButton("Sit", function() Chat("-sit ") end)
    HomeTab:CreateButton("Spawn Dummy", function() Chat("-dummy ") end)
    HomeTab:CreateButton("Respawn", function() Chat("-re ") end)
    HomeTab:CreateButton("Remove Hats", function() Chat("-ch ") end)
    HomeTab:CreateButton("Save hats", function() Chat("-sh ") end)
    HomeTab:CreateButton("PermaDeath", function() Chat("-pd ") end)
end

HomeTab:CreateToggle("Prevent tools", function(Value)
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

HomeTab:CreateNote("Themes", "Theme changing functionality not available in this version")

MainTab:CreateButton("Nameless Admin", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/Nameless-Admin/main/Source.lua"))()
end)

MainTab:CreateButton("Infinite Yield", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

MainTab:CreateButton("Rochips Panel", function()
    loadstring(game:HttpGet("https://glot.io/snippets/gzrux646yj/raw/main.ts"))()
    notify("Rochips Panel", "Loading... (Wait 2-30 seconds)", 5)
end)

MainTab:CreateButton("Hub by Theo", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/JustABaseplateHub.lua"))()
end)

MainTab:CreateButton("Cloud hub", function()
    loadstring(game:HttpGet("https://pastefy.app/X6fuVyEZ/raw"))()
end)

MainTab:CreateButton("Pilots hub", function()
    loadstring(game:HttpGet("https://pastefy.app/U1o71wOq/raw"))()
end)

MainTab:CreateButton("KaterHub V3", function()
    loadstring(game:HttpGet("https://katerhub-inc.github.io/KaterHub/main.lua"))()
end)

MyTab:CreateNote("Item-Related", "")
MyTab:CreateButton("(🎮) Kill GUI", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/Scripts/refs/heads/main/GUIs/Tool-GUI.lua"))()
end)

MyTab:CreateButton("(🎮) Dupe GUI", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/Scripts/refs/heads/main/GUIs/Item-GUI.lua"))()
end)

MyTab:CreateNote("Reanimation", "")
MyTab:CreateButton("(🎮) Giant Dance", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/Scripts/main/Dance.lua"))()
end)

MyTab:CreateNote("Visuals", "")
MyTab:CreateButton("Realistic Mode (1st Person)", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/Scripts/refs/heads/main/RealisticMode.lua"))()
end)

KeyTab:CreateButton("Delta Keyboard", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/Scripts/main/Keyboards/Delta.lua"))()
end)

KeyTab:CreateButton("Virtual Keyboard", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/Scripts/main/Keyboards/Virtual.lua"))()
end)

KeyTab:CreateButton("Byte Keyboard", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/Scripts/main/Keyboards/Byte.lua"))()
end)

KeyTab:CreateButton("Kilobyte Keyboard", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/Scripts/main/Keyboards/KiloByte.lua"))()
end)

KeyTab:CreateButton("Mob Keyboard", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
end)

if Place == 88308889239232 or Place == 17574618959 then
    local PdTab = Window:AddTab("(🎮) PermaDeath", 6)
    local GenTab = Window:AddTab("(🎮) Genesis", 7)
    local HatsTab = Window:AddTab("(🎮) Genesis rigs", 8)
    
    PdTab:CreateButton("KDV3 By Theo", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Choose.lua"))()
    end)
    
    PdTab:CreateNote("Credits", "To the owners of the scripts :D")
    PdTab:CreateNote("Reanimation", "")
    
    PdTab:CreateButton("Just a Baseplate reanimation", function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Just-a-baseplate.-Just-A-Baseplate-Working-Reanimation-39126"))()
    end)
    
    PdTab:CreateButton("Currentangle V2", function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-CurrentAngle-V2-Old-46018"))()
    end)
    
    PdTab:CreateButton("Gelatek Reanimation", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/DevTools/refs/heads/main/Reanimate"))()
    end)
    
    GenTab:CreateButton("Krystal Dance", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Krystal%20Dance"))()
    end)
    GenTab:CreateNote("Keybinds", "Q, E, R, T, Y, U, P, F, G, H, J, K, L")
    
    GenTab:CreateButton("Neptunian V", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Neptunian%20V"))()
    end)
    GenTab:CreateNote("Keybinds", "F, Z, X, R")
    
    GenTab:CreateButton("Sin Dragon", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Sin%20Dragon"))()
    end)
    GenTab:CreateNote("Keybinds", "G, Z, X, C")
    
    GenTab:CreateButton("Lightning Cannon", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Lightning%20Cannon"))()
    end)
    GenTab:CreateNote("Keybinds", "E, Z, X, C, V, B, M")
    
    GenTab:CreateButton("Goner", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Goner"))()
    end)
    GenTab:CreateNote("Keybinds", "Q")
    
    GenTab:CreateButton("Ban Hammer", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Ban%20Hammer"))()
    end)
    GenTab:CreateNote("Keybinds", "E, R")
    
    GenTab:CreateButton("Motorcycle", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Motorcycle"))()
    end)
    GenTab:CreateNote("Keybinds", "Z (While driving)")
    
    HatsTab:CreateNote("IMPORTANT", "Always load PermaDeath before reanimating.")
    HatsTab:CreateButton("PermaDeath", function() Chat("-pd ") end)
    HatsTab:CreateButton("Remove Hats", function() Chat("-ch ") end)
    HatsTab:CreateButton("Respawn", function() Chat("-re ") end)
    HatsTab:CreateButton("Save hats", function() Chat("-sh ") end)
    
    HatsTab:CreateNote("IMPORTANT!", "It's important to always load the rigs so everyone can see you!")
    HatsTab:CreateButton("Genesis Rigs", function() Chat("-gh 138364679836274 82942681251131 140395948277978 102599402682100 90960046381276 13058406993 ") end)
    HatsTab:CreateButton("Genesis Rigs [Black]", function() Chat("-gh 131385506535381 85392395166623 129462518582032 138364679836274 12850150835 106249329428811 ") end)
    
    HatsTab:CreateNote("Custom Rigs", "")
    HatsTab:CreateButton("Genesis Rigs [Noob]", function() Chat("-gh 95290698984301, 84451219120140, 72292903231768, 108186273151388, 139904067056008 ") end)
    HatsTab:CreateButton("Genesis Rigs [Guest]", function() Chat("-gh 13058406993 138364679836274 131385506535381 85392395166623 129462518582032 106249329428811 108224319902592 82404150383568 100856932339214") end)
    HatsTab:CreateButton("Genesis Rigs [1x1x1x1]", function() Chat("-gh 131385506535381 85392395166623 129462518582032 12850150835 106249329428811 17681457649 17532925923 16296624548") end)
    
    HatsTab:CreateButton("Neptunian V", function() Chat("-gh 5316479641") end)
    HatsTab:CreateButton("Sin Dragon", function() Chat("-gh 117186631495734 99965319383570 132770514241770 3756389957 14864581977 150381051 4504231783") end)
    HatsTab:CreateButton("Lightning Cannon", function() Chat("-gh 111672581230926 126145101810389 136055191177936 4504231783") end)
    HatsTab:CreateButton("Goner", function() Chat("-gh 17770317484 17822722698 17822749561 17772174303 17835236579") end)
    HatsTab:CreateButton("Ban Hammer", function() Chat("-gh 15548314241") end)
    HatsTab:CreateButton("Motorcycle", function() Chat("-gh 4504231783, 11354413365, 191101707, 18209672127 ") end)
end




return G2L["ScreenGui_1"]