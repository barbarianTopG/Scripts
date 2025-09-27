--[[
 d888b  db    db d888888b      .d888b.      db      db    db  .d8b.  
88' Y8b 88    88   `88'        VP  `8D      88      88    88 d8' `8b 
88      88    88    88            odD'      88      88    88 88ooo88 
88  ooo 88    88    88          .88'        88      88    88 88~~~88 
88. ~8~ 88b  d88   .88.        j88.         88booo. 88b  d88 88   88    
 Y888P  ~Y8888P' Y888888P      888888D      Y88888P ~Y8888P'  
]]--
--[[ Note - for now its a placeholder as im importing the gui ]]

local CollectionService = game:GetService("CollectionService")
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
G2L["ContentScrollFrame_6"]["CanvasPosition"] = Vector2.new(1.71429, 0)
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


if G2L["ButtonExample"] then G2L["ButtonExample"]:Destroy() end
if G2L["TabExample"] then G2L["TabExample"]:Destroy() end



local LunarHub = {}
LunarHub.Tabs = {}
LunarHub.CurrentTab = nil
LunarHub.TabCount = 0

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
        Order = order or (#LunarHub.Tabs + 1),
        Elements = {},
        ElementCount = 0
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
    G2L["ContentScrollFrame_6"]:ClearAllChildren()
    
    for _, element in ipairs(tab.Elements) do
        element.Parent = G2L["ContentScrollFrame_6"]
    end
    
    LunarHub.CurrentTab = tab
end

function LunarHub:CreateButton(tab, name, callback)
    local button = Instance.new("TextButton")
    button.Name = name .. "Button"
    button.Text = name
    button.TextColor3 = Color3.fromRGB(119, 0, 255)
    button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    button.BorderColor3 = Color3.fromRGB(119, 0, 255)
    button.Size = UDim2.new(0, 404, 0, 30)
    button.TextScaled = true
    
    tab.ElementCount = tab.ElementCount + 1
    button.LayoutOrder = tab.ElementCount
    
    button.MouseButton1Click:Connect(callback)
    
    table.insert(tab.Elements, button)
    
    if LunarHub.CurrentTab == tab then
        button.Parent = G2L["ContentScrollFrame_6"]
    end
    
    return button
end

function LunarHub:CreateToggle(tab, name, callback)
    local toggleFrame = Instance.new("Frame")
    toggleFrame.Name = name .. "Toggle"
    toggleFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    toggleFrame.BorderColor3 = Color3.fromRGB(119, 0, 255)
    toggleFrame.Size = UDim2.new(0, 404, 0, 30)
    
    local toggleButton = Instance.new("TextButton")
    toggleButton.Name = "ToggleButton"
    toggleButton.Text = name .. " [OFF]"
    toggleButton.TextColor3 = Color3.fromRGB(119, 0, 255)
    toggleButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    toggleButton.BorderColor3 = Color3.fromRGB(119, 0, 255)
    toggleButton.Size = UDim2.new(1, 0, 1, 0)
    toggleButton.TextScaled = true
    toggleButton.Parent = toggleFrame
    
    local toggleState = false
    
    tab.ElementCount = tab.ElementCount + 1
    toggleFrame.LayoutOrder = tab.ElementCount
    
    toggleButton.MouseButton1Click:Connect(function()
        toggleState = not toggleState
        if toggleState then
            toggleButton.Text = name .. " [ON]"
            toggleButton.TextColor3 = Color3.fromRGB(0, 255, 0)
        else
            toggleButton.Text = name .. " [OFF]"
            toggleButton.TextColor3 = Color3.fromRGB(119, 0, 255)
        end
        callback(toggleState)
    end)
    
    table.insert(tab.Elements, toggleFrame)
    
    if LunarHub.CurrentTab == tab then
        toggleFrame.Parent = G2L["ContentScrollFrame_6"]
    end
    
    return toggleFrame
end

Window = {
    AddTab = function(name, order)
        return LunarHub:AddTab(name, order)
    end
}



local tabMetaTable = {}
tabMetaTable.__index = function(self, key)
    if key == "CreateButton" then
        return function(name, callback)
            return LunarHub:CreateButton(self, name, callback)
        end
    elseif key == "CreateToggle" then
        return function(name, callback)
            return LunarHub:CreateToggle(self, name, callback)
        end
    end
end

for _, tab in ipairs(LunarHub.Tabs) do
    setmetatable(tab, tabMetaTable)
end

local originalAddTab = LunarHub.AddTab
function LunarHub:AddTab(name, order)
    local tab = originalAddTab(self, name, order)
    setmetatable(tab, tabMetaTable)
    return tab
end

-- Script build:
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")

local Wait = task.wait


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

pcall(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/DevTools/main/Tag"))()
end)

local player = Players.LocalPlayer
local preventToolsEnabled = false
local toolFriend = nil
local charFriend = nil

function setupToolListener(char)
    if toolFriend then
        toolFriend:Disconnect()
    end
    toolFriend = char.ChildAdded:Connect(function(child)
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

charFriend = player.CharacterAdded:Connect(onCharacterAdded)

local Place = game.PlaceId

local ReadTab = Window:AddTab("READ", 1)
if Place ~= 88308889239232 and Place ~= 17574618959 then
  ReadTab:CreateButton("Click me!", function()
    notify("❗︱Game Not Supported", "Some features from this hub are removed.")
    end
end)

  ReadTab:CreateButton("Click me! (2)", function()
    notify("Meaning of emojis", "🎮 - Only supported games\n🔗 - Any game")
    end
end)

if Place == 88308889239232 or Place == 17574618959 then
  ReadTab:CreateButton("Click me! (3)", function()
    notify("How to use this hub? 🤔", "If you're gonna use genesis, go to the Genesis rigs tab, once your done loading the hats and rigs, head to the Genesis tab and execute the scripts there!!1!")
    end
end)

  ReadTab:CreateButton("Click me! (4)", function()
    notify("‼️ Notice ‼️", "Credits to Theo for the idea of adding genesis, he's a cool guy make sure to check out his hub too! :)")
    end
end)

return G2L["ScreenGui_1"], LunarHub