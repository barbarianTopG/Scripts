local CollectionService = game:GetService("CollectionService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local VirtualInputManager = game:GetService("VirtualInputManager")
local plr = Players.LocalPlayer
local playerGui = plr:WaitForChild("PlayerGui")

local G2L = {}

G2L["ScreenGui_1"] = Instance.new("ScreenGui", playerGui)
G2L["ScreenGui_1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling
G2L["ScreenGui_1"]["Name"] = "BetterKeyboardGUI"
G2L["ScreenGui_1"]["ResetOnSpawn"] = false

CollectionService:AddTag(G2L["ScreenGui_1"], "main")

G2L["Frame_2"] = Instance.new("Frame", G2L["ScreenGui_1"])
G2L["Frame_2"]["BorderSizePixel"] = 0
G2L["Frame_2"]["BackgroundColor3"] = Color3.fromRGB(35, 35, 35)
G2L["Frame_2"]["Size"] = UDim2.new(0.46186, 0, 0.59418, 0)
G2L["Frame_2"]["Position"] = UDim2.new(0.29107, 0, 0.11318, 0)
G2L["Frame_2"]["BackgroundTransparency"] = 0.4
G2L["Frame_2"]["Active"] = true
G2L["Frame_2"]["Selectable"] = true

G2L["UICorner_3"] = Instance.new("UICorner", G2L["Frame_2"])

G2L["Line1"] = Instance.new("Folder", G2L["Frame_2"])
G2L["Line1"]["Name"] = "Line1"

G2L["Line2"] = Instance.new("Folder", G2L["Frame_2"])
G2L["Line2"]["Name"] = "Line2"

G2L["Line3"] = Instance.new("Folder", G2L["Frame_2"])
G2L["Line3"]["Name"] = "Line3"

G2L["Line4"] = Instance.new("Folder", G2L["Frame_2"])
G2L["Line4"]["Name"] = "Line4"

G2L["Line5"] = Instance.new("Folder", G2L["Frame_2"])
G2L["Line5"]["Name"] = "Line5"

G2L["ESC"] = Instance.new("TextButton", G2L["Line1"])
G2L["ESC"]["BorderSizePixel"] = 0
G2L["ESC"]["TextSize"] = 12
G2L["ESC"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["ESC"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
G2L["ESC"]["BackgroundTransparency"] = 0.5
G2L["ESC"]["Size"] = UDim2.new(0.08854, 0, 0.15238, 0)
G2L["ESC"]["Text"] = "ESC"
G2L["ESC"]["Position"] = UDim2.new(0, 4, 0, 30)
G2L["UICorner_53"] = Instance.new("UICorner", G2L["ESC"])

G2L["F1"] = Instance.new("TextButton", G2L["Line1"])
G2L["F1"]["BorderSizePixel"] = 0
G2L["F1"]["TextSize"] = 12
G2L["F1"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["F1"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
G2L["F1"]["BackgroundTransparency"] = 0.5
G2L["F1"]["Size"] = UDim2.new(0.08854, 0, 0.15238, 0)
G2L["F1"]["Text"] = "F1"
G2L["F1"]["Position"] = UDim2.new(0, 42, 0, 30)
G2L["UICorner_55"] = Instance.new("UICorner", G2L["F1"])

G2L["F2"] = Instance.new("TextButton", G2L["Line1"])
G2L["F2"]["BorderSizePixel"] = 0
G2L["F2"]["TextSize"] = 12
G2L["F2"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["F2"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
G2L["F2"]["BackgroundTransparency"] = 0.5
G2L["F2"]["Size"] = UDim2.new(0.08854, 0, 0.15238, 0)
G2L["F2"]["Text"] = "F2"
G2L["F2"]["Position"] = UDim2.new(0, 80, 0, 30)
G2L["UICorner_57"] = Instance.new("UICorner", G2L["F2"])

G2L["F3"] = Instance.new("TextButton", G2L["Line1"])
G2L["F3"]["BorderSizePixel"] = 0
G2L["F3"]["TextSize"] = 12
G2L["F3"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["F3"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
G2L["F3"]["BackgroundTransparency"] = 0.5
G2L["F3"]["Size"] = UDim2.new(0.08854, 0, 0.15238, 0)
G2L["F3"]["Text"] = "F3"
G2L["F3"]["Position"] = UDim2.new(0, 118, 0, 30)
G2L["UICorner_59"] = Instance.new("UICorner", G2L["F3"])

G2L["F4"] = Instance.new("TextButton", G2L["Line1"])
G2L["F4"]["BorderSizePixel"] = 0
G2L["F4"]["TextSize"] = 12
G2L["F4"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["F4"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
G2L["F4"]["BackgroundTransparency"] = 0.5
G2L["F4"]["Size"] = UDim2.new(0.08854, 0, 0.15238, 0)
G2L["F4"]["Text"] = "F4"
G2L["F4"]["Position"] = UDim2.new(0, 156, 0, 30)
G2L["UICorner_4f"] = Instance.new("UICorner", G2L["F4"])

G2L["F5"] = Instance.new("TextButton", G2L["Line1"])
G2L["F5"]["BorderSizePixel"] = 0
G2L["F5"]["TextSize"] = 12
G2L["F5"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["F5"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
G2L["F5"]["BackgroundTransparency"] = 0.5
G2L["F5"]["Size"] = UDim2.new(0.08854, 0, 0.15238, 0)
G2L["F5"]["Text"] = "F5"
G2L["F5"]["Position"] = UDim2.new(0, 194, 0, 30)
G2L["UICorner_4d"] = Instance.new("UICorner", G2L["F5"])

G2L["F6"] = Instance.new("TextButton", G2L["Line1"])
G2L["F6"]["BorderSizePixel"] = 0
G2L["F6"]["TextSize"] = 12
G2L["F6"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["F6"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
G2L["F6"]["BackgroundTransparency"] = 0.5
G2L["F6"]["Size"] = UDim2.new(0.08854, 0, 0.15238, 0)
G2L["F6"]["Text"] = "F6"
G2L["F6"]["Position"] = UDim2.new(0, 232, 0, 30)
G2L["UICorner_49"] = Instance.new("UICorner", G2L["F6"])

G2L["F7"] = Instance.new("TextButton", G2L["Line1"])
G2L["F7"]["BorderSizePixel"] = 0
G2L["F7"]["TextSize"] = 12
G2L["F7"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["F7"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
G2L["F7"]["BackgroundTransparency"] = 0.5
G2L["F7"]["Size"] = UDim2.new(0.08854, 0, 0.15238, 0)
G2L["F7"]["Text"] = "F7"
G2L["F7"]["Position"] = UDim2.new(0, 270, 0, 30)
G2L["UICorner_51"] = Instance.new("UICorner", G2L["F7"])

G2L["F8"] = Instance.new("TextButton", G2L["Line1"])
G2L["F8"]["BorderSizePixel"] = 0
G2L["F8"]["TextSize"] = 12
G2L["F8"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["F8"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
G2L["F8"]["BackgroundTransparency"] = 0.5
G2L["F8"]["Size"] = UDim2.new(0.08854, 0, 0.15238, 0)
G2L["F8"]["Text"] = "F8"
G2L["F8"]["Position"] = UDim2.new(0, 308, 0, 30)
G2L["UICorner_47"] = Instance.new("UICorner", G2L["F8"])

G2L["F9"] = Instance.new("TextButton", G2L["Line1"])
G2L["F9"]["BorderSizePixel"] = 0
G2L["F9"]["TextSize"] = 12
G2L["F9"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["F9"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
G2L["F9"]["BackgroundTransparency"] = 0.5
G2L["F9"]["Size"] = UDim2.new(0.08854, 0, 0.15238, 0)
G2L["F9"]["Text"] = "F9"
G2L["F9"]["Position"] = UDim2.new(0, 346, 0, 30)
G2L["UICorner_4b"] = Instance.new("UICorner", G2L["F9"])

G2L["Q"] = Instance.new("TextButton", G2L["Line2"])
G2L["Q"]["BorderSizePixel"] = 0
G2L["Q"]["TextSize"] = 12
G2L["Q"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["Q"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
G2L["Q"]["BackgroundTransparency"] = 0.5
G2L["Q"]["Size"] = UDim2.new(0.08854, 0, 0.15238, 0)
G2L["Q"]["Text"] = "Q"
G2L["Q"]["Position"] = UDim2.new(0, 4, 0, 66)
G2L["UICorner_27"] = Instance.new("UICorner", G2L["Q"])

G2L["W"] = Instance.new("TextButton", G2L["Line2"])
G2L["W"]["BorderSizePixel"] = 0
G2L["W"]["TextSize"] = 12
G2L["W"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["W"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
G2L["W"]["BackgroundTransparency"] = 0.5
G2L["W"]["Size"] = UDim2.new(0.08854, 0, 0.15238, 0)
G2L["W"]["Text"] = "W"
G2L["W"]["Position"] = UDim2.new(0, 42, 0, 66)
G2L["UICorner_29"] = Instance.new("UICorner", G2L["W"])

G2L["E"] = Instance.new("TextButton", G2L["Line2"])
G2L["E"]["BorderSizePixel"] = 0
G2L["E"]["TextSize"] = 12
G2L["E"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["E"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
G2L["E"]["BackgroundTransparency"] = 0.5
G2L["E"]["Size"] = UDim2.new(0.08854, 0, 0.15238, 0)
G2L["E"]["Text"] = "E"
G2L["E"]["Position"] = UDim2.new(0, 80, 0, 66)
G2L["UICorner_2b"] = Instance.new("UICorner", G2L["E"])

G2L["R"] = Instance.new("TextButton", G2L["Line2"])
G2L["R"]["BorderSizePixel"] = 0
G2L["R"]["TextSize"] = 12
G2L["R"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["R"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
G2L["R"]["BackgroundTransparency"] = 0.5
G2L["R"]["Size"] = UDim2.new(0.08854, 0, 0.15238, 0)
G2L["R"]["Text"] = "R"
G2L["R"]["Position"] = UDim2.new(0, 118, 0, 66)
G2L["UICorner_2d"] = Instance.new("UICorner", G2L["R"])

G2L["T"] = Instance.new("TextButton", G2L["Line2"])
G2L["T"]["BorderSizePixel"] = 0
G2L["T"]["TextSize"] = 12
G2L["T"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["T"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
G2L["T"]["BackgroundTransparency"] = 0.5
G2L["T"]["Size"] = UDim2.new(0.08854, 0, 0.15238, 0)
G2L["T"]["Text"] = "T"
G2L["T"]["Position"] = UDim2.new(0, 156, 0, 66)
G2L["UICorner_23"] = Instance.new("UICorner", G2L["T"])

G2L["Y"] = Instance.new("TextButton", G2L["Line2"])
G2L["Y"]["BorderSizePixel"] = 0
G2L["Y"]["TextSize"] = 12
G2L["Y"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["Y"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
G2L["Y"]["BackgroundTransparency"] = 0.5
G2L["Y"]["Size"] = UDim2.new(0.08854, 0, 0.15238, 0)
G2L["Y"]["Text"] = "Y"
G2L["Y"]["Position"] = UDim2.new(0, 194, 0, 66)
G2L["UICorner_21"] = Instance.new("UICorner", G2L["Y"])

G2L["U"] = Instance.new("TextButton", G2L["Line2"])
G2L["U"]["BorderSizePixel"] = 0
G2L["U"]["TextSize"] = 12
G2L["U"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["U"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
G2L["U"]["BackgroundTransparency"] = 0.5
G2L["U"]["Size"] = UDim2.new(0.08854, 0, 0.15238, 0)
G2L["U"]["Text"] = "U"
G2L["U"]["Position"] = UDim2.new(0, 232, 0, 66)
G2L["UICorner_1d"] = Instance.new("UICorner", G2L["U"])

G2L["I"] = Instance.new("TextButton", G2L["Line2"])
G2L["I"]["BorderSizePixel"] = 0
G2L["I"]["TextSize"] = 12
G2L["I"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["I"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
G2L["I"]["BackgroundTransparency"] = 0.5
G2L["I"]["Size"] = UDim2.new(0.08854, 0, 0.15238, 0)
G2L["I"]["Text"] = "I"
G2L["I"]["Position"] = UDim2.new(0, 270, 0, 66)
G2L["UICorner_25"] = Instance.new("UICorner", G2L["I"])

G2L["O"] = Instance.new("TextButton", G2L["Line2"])
G2L["O"]["BorderSizePixel"] = 0
G2L["O"]["TextSize"] = 12
G2L["O"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["O"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
G2L["O"]["BackgroundTransparency"] = 0.5
G2L["O"]["Size"] = UDim2.new(0.08854, 0, 0.15238, 0)
G2L["O"]["Text"] = "O"
G2L["O"]["Position"] = UDim2.new(0, 308, 0, 66)
G2L["UICorner_1b"] = Instance.new("UICorner", G2L["O"])

G2L["P"] = Instance.new("TextButton", G2L["Line2"])
G2L["P"]["BorderSizePixel"] = 0
G2L["P"]["TextSize"] = 12
G2L["P"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["P"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
G2L["P"]["BackgroundTransparency"] = 0.5
G2L["P"]["Size"] = UDim2.new(0.08854, 0, 0.15238, 0)
G2L["P"]["Text"] = "P"
G2L["P"]["Position"] = UDim2.new(0, 346, 0, 66)
G2L["UICorner_1f"] = Instance.new("UICorner", G2L["P"])

G2L["A"] = Instance.new("TextButton", G2L["Line3"])
G2L["A"]["BorderSizePixel"] = 0
G2L["A"]["TextSize"] = 12
G2L["A"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["A"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
G2L["A"]["BackgroundTransparency"] = 0.5
G2L["A"]["Size"] = UDim2.new(0.08854, 0, 0.15238, 0)
G2L["A"]["Text"] = "A"
G2L["A"]["Position"] = UDim2.new(0, 4, 0, 102)
G2L["UICorner_12"] = Instance.new("UICorner", G2L["A"])

G2L["S"] = Instance.new("TextButton", G2L["Line3"])
G2L["S"]["BorderSizePixel"] = 0
G2L["S"]["TextSize"] = 12
G2L["S"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["S"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
G2L["S"]["BackgroundTransparency"] = 0.5
G2L["S"]["Size"] = UDim2.new(0.08854, 0, 0.15238, 0)
G2L["S"]["Text"] = "S"
G2L["S"]["Position"] = UDim2.new(0, 42, 0, 102)
G2L["UICorner_14"] = Instance.new("UICorner", G2L["S"])

G2L["D"] = Instance.new("TextButton", G2L["Line3"])
G2L["D"]["BorderSizePixel"] = 0
G2L["D"]["TextSize"] = 12
G2L["D"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["D"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
G2L["D"]["BackgroundTransparency"] = 0.5
G2L["D"]["Size"] = UDim2.new(0.08854, 0, 0.15238, 0)
G2L["D"]["Text"] = "D"
G2L["D"]["Position"] = UDim2.new(0, 80, 0, 102)
G2L["UICorner_16"] = Instance.new("UICorner", G2L["D"])

G2L["F"] = Instance.new("TextButton", G2L["Line3"])
G2L["F"]["BorderSizePixel"] = 0
G2L["F"]["TextSize"] = 12
G2L["F"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["F"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
G2L["F"]["BackgroundTransparency"] = 0.5
G2L["F"]["Size"] = UDim2.new(0.08854, 0, 0.15238, 0)
G2L["F"]["Text"] = "F"
G2L["F"]["Position"] = UDim2.new(0, 118, 0, 102)
G2L["UICorner_18"] = Instance.new("UICorner", G2L["F"])

G2L["G"] = Instance.new("TextButton", G2L["Line3"])
G2L["G"]["BorderSizePixel"] = 0
G2L["G"]["TextSize"] = 12
G2L["G"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["G"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
G2L["G"]["BackgroundTransparency"] = 0.5
G2L["G"]["Size"] = UDim2.new(0.08854, 0, 0.15238, 0)
G2L["G"]["Text"] = "G"
G2L["G"]["Position"] = UDim2.new(0, 156, 0, 102)
G2L["UICorner_e"] = Instance.new("UICorner", G2L["G"])

G2L["H"] = Instance.new("TextButton", G2L["Line3"])
G2L["H"]["BorderSizePixel"] = 0
G2L["H"]["TextSize"] = 12
G2L["H"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["H"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
G2L["H"]["BackgroundTransparency"] = 0.5
G2L["H"]["Size"] = UDim2.new(0.08854, 0, 0.15238, 0)
G2L["H"]["Text"] = "H"
G2L["H"]["Position"] = UDim2.new(0, 194, 0, 102)
G2L["UICorner_c"] = Instance.new("UICorner", G2L["H"])

G2L["J"] = Instance.new("TextButton", G2L["Line3"])
G2L["J"]["BorderSizePixel"] = 0
G2L["J"]["TextSize"] = 12
G2L["J"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["J"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
G2L["J"]["BackgroundTransparency"] = 0.5
G2L["J"]["Size"] = UDim2.new(0.08854, 0, 0.15238, 0)
G2L["J"]["Text"] = "J"
G2L["J"]["Position"] = UDim2.new(0, 232, 0, 102)
G2L["UICorner_8"] = Instance.new("UICorner", G2L["J"])

G2L["K"] = Instance.new("TextButton", G2L["Line3"])
G2L["K"]["BorderSizePixel"] = 0
G2L["K"]["TextSize"] = 12
G2L["K"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["K"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
G2L["K"]["BackgroundTransparency"] = 0.5
G2L["K"]["Size"] = UDim2.new(0.08854, 0, 0.15238, 0)
G2L["K"]["Text"] = "K"
G2L["K"]["Position"] = UDim2.new(0, 270, 0, 102)
G2L["UICorner_10"] = Instance.new("UICorner", G2L["K"])

G2L["L"] = Instance.new("TextButton", G2L["Line3"])
G2L["L"]["BorderSizePixel"] = 0
G2L["L"]["TextSize"] = 12
G2L["L"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["L"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
G2L["L"]["BackgroundTransparency"] = 0.5
G2L["L"]["Size"] = UDim2.new(0.08854, 0, 0.15238, 0)
G2L["L"]["Text"] = "L"
G2L["L"]["Position"] = UDim2.new(0, 308, 0, 102)
G2L["UICorner_6"] = Instance.new("UICorner", G2L["L"])

G2L["Semicolon"] = Instance.new("TextButton", G2L["Line3"])
G2L["Semicolon"]["BorderSizePixel"] = 0
G2L["Semicolon"]["TextSize"] = 12
G2L["Semicolon"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["Semicolon"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
G2L["Semicolon"]["BackgroundTransparency"] = 0.5
G2L["Semicolon"]["Size"] = UDim2.new(0.08854, 0, 0.15238, 0)
G2L["Semicolon"]["Text"] = ";"
G2L["Semicolon"]["Position"] = UDim2.new(0, 346, 0, 102)
G2L["UICorner_a"] = Instance.new("UICorner", G2L["Semicolon"])

G2L["Z"] = Instance.new("TextButton", G2L["Line4"])
G2L["Z"]["BorderSizePixel"] = 0
G2L["Z"]["TextSize"] = 12
G2L["Z"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["Z"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
G2L["Z"]["BackgroundTransparency"] = 0.5
G2L["Z"]["Size"] = UDim2.new(0.08854, 0, 0.15238, 0)
G2L["Z"]["Text"] = "Z"
G2L["Z"]["Position"] = UDim2.new(0, 4, 0, 138)
G2L["UICorner_3c"] = Instance.new("UICorner", G2L["Z"])

G2L["X"] = Instance.new("TextButton", G2L["Line4"])
G2L["X"]["BorderSizePixel"] = 0
G2L["X"]["TextSize"] = 12
G2L["X"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["X"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
G2L["X"]["BackgroundTransparency"] = 0.5
G2L["X"]["Size"] = UDim2.new(0.08854, 0, 0.15238, 0)
G2L["X"]["Text"] = "X"
G2L["X"]["Position"] = UDim2.new(0, 42, 0, 138)
G2L["UICorner_3e"] = Instance.new("UICorner", G2L["X"])

G2L["C"] = Instance.new("TextButton", G2L["Line4"])
G2L["C"]["BorderSizePixel"] = 0
G2L["C"]["TextSize"] = 12
G2L["C"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["C"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
G2L["C"]["BackgroundTransparency"] = 0.5
G2L["C"]["Size"] = UDim2.new(0.08854, 0, 0.15238, 0)
G2L["C"]["Text"] = "C"
G2L["C"]["Position"] = UDim2.new(0, 80, 0, 138)
G2L["UICorner_40"] = Instance.new("UICorner", G2L["C"])

G2L["V"] = Instance.new("TextButton", G2L["Line4"])
G2L["V"]["BorderSizePixel"] = 0
G2L["V"]["TextSize"] = 12
G2L["V"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["V"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
G2L["V"]["BackgroundTransparency"] = 0.5
G2L["V"]["Size"] = UDim2.new(0.08854, 0, 0.15238, 0)
G2L["V"]["Text"] = "V"
G2L["V"]["Position"] = UDim2.new(0, 118, 0, 138)
G2L["UICorner_42"] = Instance.new("UICorner", G2L["V"])

G2L["B"] = Instance.new("TextButton", G2L["Line4"])
G2L["B"]["BorderSizePixel"] = 0
G2L["B"]["TextSize"] = 12
G2L["B"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["B"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
G2L["B"]["BackgroundTransparency"] = 0.5
G2L["B"]["Size"] = UDim2.new(0.08854, 0, 0.15238, 0)
G2L["B"]["Text"] = "B"
G2L["B"]["Position"] = UDim2.new(0, 156, 0, 138)
G2L["UICorner_38"] = Instance.new("UICorner", G2L["B"])

G2L["N"] = Instance.new("TextButton", G2L["Line4"])
G2L["N"]["BorderSizePixel"] = 0
G2L["N"]["TextSize"] = 12
G2L["N"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["N"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
G2L["N"]["BackgroundTransparency"] = 0.5
G2L["N"]["Size"] = UDim2.new(0.08854, 0, 0.15238, 0)
G2L["N"]["Text"] = "N"
G2L["N"]["Position"] = UDim2.new(0, 194, 0, 138)
G2L["UICorner_36"] = Instance.new("UICorner", G2L["N"])

G2L["M"] = Instance.new("TextButton", G2L["Line4"])
G2L["M"]["BorderSizePixel"] = 0
G2L["M"]["TextSize"] = 12
G2L["M"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["M"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
G2L["M"]["BackgroundTransparency"] = 0.5
G2L["M"]["Size"] = UDim2.new(0.08854, 0, 0.15238, 0)
G2L["M"]["Text"] = "M"
G2L["M"]["Position"] = UDim2.new(0, 232, 0, 138)
G2L["UICorner_32"] = Instance.new("UICorner", G2L["M"])

G2L["Comma"] = Instance.new("TextButton", G2L["Line4"])
G2L["Comma"]["BorderSizePixel"] = 0
G2L["Comma"]["TextSize"] = 12
G2L["Comma"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["Comma"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
G2L["Comma"]["BackgroundTransparency"] = 0.5
G2L["Comma"]["Size"] = UDim2.new(0.08854, 0, 0.15238, 0)
G2L["Comma"]["Text"] = ","
G2L["Comma"]["Position"] = UDim2.new(0, 270, 0, 138)
G2L["UICorner_3a"] = Instance.new("UICorner", G2L["Comma"])

G2L["Period"] = Instance.new("TextButton", G2L["Line4"])
G2L["Period"]["BorderSizePixel"] = 0
G2L["Period"]["TextSize"] = 12
G2L["Period"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["Period"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
G2L["Period"]["BackgroundTransparency"] = 0.5
G2L["Period"]["Size"] = UDim2.new(0.08854, 0, 0.15238, 0)
G2L["Period"]["Text"] = "."
G2L["Period"]["Position"] = UDim2.new(0, 308, 0, 138)
G2L["UICorner_30"] = Instance.new("UICorner", G2L["Period"])

G2L["Slash"] = Instance.new("TextButton", G2L["Line4"])
G2L["Slash"]["BorderSizePixel"] = 0
G2L["Slash"]["TextSize"] = 12
G2L["Slash"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["Slash"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
G2L["Slash"]["BackgroundTransparency"] = 0.5
G2L["Slash"]["Size"] = UDim2.new(0.08854, 0, 0.15238, 0)
G2L["Slash"]["Text"] = "/"
G2L["Slash"]["Position"] = UDim2.new(0, 346, 0, 138)
G2L["UICorner_34"] = Instance.new("UICorner", G2L["Slash"])

G2L["LeftCtrl"] = Instance.new("TextButton", G2L["Line5"])
G2L["LeftCtrl"]["BorderSizePixel"] = 0
G2L["LeftCtrl"]["TextSize"] = 12
G2L["LeftCtrl"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["LeftCtrl"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
G2L["LeftCtrl"]["BackgroundTransparency"] = 0.5
G2L["LeftCtrl"]["Size"] = UDim2.new(0.19271, 0, 0.15238, 0)
G2L["LeftCtrl"]["Text"] = "CTRL"
G2L["LeftCtrl"]["Position"] = UDim2.new(0, 4, 0, 174)
G2L["UICorner_5d"] = Instance.new("UICorner", G2L["LeftCtrl"])

G2L["LeftAlt"] = Instance.new("TextButton", G2L["Line5"])
G2L["LeftAlt"]["BorderSizePixel"] = 0
G2L["LeftAlt"]["TextSize"] = 12
G2L["LeftAlt"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["LeftAlt"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
G2L["LeftAlt"]["BackgroundTransparency"] = 0.5
G2L["LeftAlt"]["Size"] = UDim2.new(0.14583, 0, 0.15238, 0)
G2L["LeftAlt"]["Text"] = "ALT"
G2L["LeftAlt"]["Position"] = UDim2.new(0, 82, 0, 174)
G2L["UICorner_61"] = Instance.new("UICorner", G2L["LeftAlt"])

G2L["Space"] = Instance.new("TextButton", G2L["Line5"])
G2L["Space"]["BorderSizePixel"] = 0
G2L["Space"]["TextSize"] = 12
G2L["Space"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["Space"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
G2L["Space"]["BackgroundTransparency"] = 0.5
G2L["Space"]["Size"] = UDim2.new(0.26563, 0, 0.15238, 0)
G2L["Space"]["Text"] = "SPACE"
G2L["Space"]["Position"] = UDim2.new(0, 142, 0, 174)
G2L["UICorner_65"] = Instance.new("UICorner", G2L["Space"])

G2L["RightAlt"] = Instance.new("TextButton", G2L["Line5"])
G2L["RightAlt"]["BorderSizePixel"] = 0
G2L["RightAlt"]["TextSize"] = 12
G2L["RightAlt"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["RightAlt"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
G2L["RightAlt"]["BackgroundTransparency"] = 0.5
G2L["RightAlt"]["Size"] = UDim2.new(0.14583, 0, 0.15238, 0)
G2L["RightAlt"]["Text"] = "ALT"
G2L["RightAlt"]["Position"] = UDim2.new(0, 248, 0, 174)
G2L["UICorner_63"] = Instance.new("UICorner", G2L["RightAlt"])

G2L["RightCtrl"] = Instance.new("TextButton", G2L["Line5"])
G2L["RightCtrl"]["BorderSizePixel"] = 0
G2L["RightCtrl"]["TextSize"] = 12
G2L["RightCtrl"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["RightCtrl"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
G2L["RightCtrl"]["BackgroundTransparency"] = 0.5
G2L["RightCtrl"]["Size"] = UDim2.new(0.1875, 0, 0.15238, 0)
G2L["RightCtrl"]["Text"] = "CTRL"
G2L["RightCtrl"]["Position"] = UDim2.new(0, 308, 0, 174)
G2L["UICorner_5f"] = Instance.new("UICorner", G2L["RightCtrl"])

G2L["TextLabel_43"] = Instance.new("TextLabel", G2L["Frame_2"])
G2L["TextLabel_43"]["TextWrapped"] = true
G2L["TextLabel_43"]["BorderSizePixel"] = 0
G2L["TextLabel_43"]["TextSize"] = 12
G2L["TextLabel_43"]["TextXAlignment"] = Enum.TextXAlignment.Left
G2L["TextLabel_43"]["BackgroundColor3"] = Color3.fromRGB(39, 39, 39)
G2L["TextLabel_43"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["TextLabel_43"]["BackgroundTransparency"] = 0.5
G2L["TextLabel_43"]["Size"] = UDim2.new(0.79167, 0, 0.13333, 0)
G2L["TextLabel_43"]["Text"] = "BetterKeyboard | Made by StarFlow"
G2L["UICorner_44"] = Instance.new("UICorner", G2L["TextLabel_43"])

G2L["Minimizer"] = Instance.new("TextButton", G2L["Frame_2"])
G2L["Minimizer"]["BorderSizePixel"] = 0
G2L["Minimizer"]["TextSize"] = 20
G2L["Minimizer"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["Minimizer"]["BackgroundColor3"] = Color3.fromRGB(39, 39, 39)
G2L["Minimizer"]["BackgroundTransparency"] = 0.5
G2L["Minimizer"]["Size"] = UDim2.new(0.08854, 0, 0.13333, 0)
G2L["Minimizer"]["Text"] = "-"
G2L["Minimizer"]["Position"] = UDim2.new(0.80208, 0, 0, 0)
G2L["UICorner_67"] = Instance.new("UICorner", G2L["Minimizer"])

G2L["Close"] = Instance.new("TextButton", G2L["Frame_2"])
G2L["Close"]["BorderSizePixel"] = 0
G2L["Close"]["TextSize"] = 20
G2L["Close"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["Close"]["BackgroundColor3"] = Color3.fromRGB(39, 39, 39)
G2L["Close"]["BackgroundTransparency"] = 0.5
G2L["Close"]["Size"] = UDim2.new(0.08854, 0, 0.13333, 0)
G2L["Close"]["Text"] = "×"
G2L["Close"]["Position"] = UDim2.new(0.90104, 0, 0, 0)
G2L["UICorner_69"] = Instance.new("UICorner", G2L["Close"])

G2L["ShowButton"] = Instance.new("TextButton", G2L["ScreenGui_1"])
G2L["ShowButton"]["BorderSizePixel"] = 0
G2L["ShowButton"]["TextSize"] = 20
G2L["ShowButton"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["ShowButton"]["BackgroundColor3"] = Color3.fromRGB(39, 39, 39)
G2L["ShowButton"]["BackgroundTransparency"] = 0.3
G2L["ShowButton"]["Size"] = UDim2.new(0, 40, 0, 40)
G2L["ShowButton"]["Text"] = "+"
G2L["ShowButton"]["Position"] = UDim2.new(0, 10, 0, 10)
G2L["ShowButton"]["Visible"] = false
G2L["UICorner_Show"] = Instance.new("UICorner", G2L["ShowButton"])

G2L["UIStroke_5a"] = Instance.new("UIStroke", G2L["Frame_2"])
G2L["UIAspectRatioConstraint_6a"] = Instance.new("UIAspectRatioConstraint", G2L["Frame_2"])
G2L["UIAspectRatioConstraint_6a"]["AspectRatio"] = 1.82857

local keyNameToEnum = {
    ["ESC"] = "Escape",
    ["F1"] = "F1", ["F2"] = "F2", ["F3"] = "F3", ["F4"] = "F4",
    ["F5"] = "F5", ["F6"] = "F6", ["F7"] = "F7", ["F8"] = "F8",
    ["F9"] = "F9",
    ["Q"] = "Q", ["W"] = "W", ["E"] = "E", ["R"] = "R", ["T"] = "T",
    ["Y"] = "Y", ["U"] = "U", ["I"] = "I", ["O"] = "O", ["P"] = "P",
    ["A"] = "A", ["S"] = "S", ["D"] = "D", ["F"] = "F", ["G"] = "G",
    ["H"] = "H", ["J"] = "J", ["K"] = "K", ["L"] = "L", 
    ["Semicolon"] = "Semicolon",
    ["Z"] = "Z", ["X"] = "X", ["C"] = "C", ["V"] = "V", ["B"] = "B",
    ["N"] = "N", ["M"] = "M", ["Comma"] = "Comma", ["Period"] = "Period", 
    ["Slash"] = "Slash", ["Space"] = "Space",
    ["LeftCtrl"] = "LeftControl", ["RightCtrl"] = "RightControl",
    ["LeftAlt"] = "LeftAlt", ["RightAlt"] = "RightAlt"
}

local tweenInfo = TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

local function tweenToCenter()
    G2L["Frame_2"].Visible = true
    local target = UDim2.new(0.29107, 0, 0.11318, 0)
    TweenService:Create(G2L["Frame_2"], tweenInfo, {Position = target}):Play()
end

local function tweenToLeftAndHide()
    local offscreen = UDim2.new(-1, 0, G2L["Frame_2"].Position.Y.Scale, G2L["Frame_2"].Position.Y.Offset)
    local tween = TweenService:Create(G2L["Frame_2"], tweenInfo, {Position = offscreen})
    tween:Play()
    tween.Completed:Wait()
    G2L["Frame_2"].Visible = false
    G2L["ShowButton"].Visible = true
    G2L["ShowButton"].Position = UDim2.new(0, 10, 0, 10)
end

local function pressKey(keyName)
    local enumName = keyNameToEnum[keyName]
    if enumName then
        local keyCode = Enum.KeyCode[enumName]
        VirtualInputManager:SendKeyEvent(true, keyCode, false, game)
        task.wait(0.05)
        VirtualInputManager:SendKeyEvent(false, keyCode, false, game)
    end
end

local function makeHover(btn, normal, hover)
    btn.MouseEnter:Connect(function() 
        local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local tween = TweenService:Create(btn, tweenInfo, {BackgroundColor3 = hover})
        tween:Play()
    end)
    
    btn.MouseLeave:Connect(function()
        local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local tween = TweenService:Create(btn, tweenInfo, {BackgroundColor3 = normal})
        tween:Play()
    end)
end

local function makePressGlow(btn)
    btn.MouseButton1Down:Connect(function()
        local originalColor = btn.BackgroundColor3
        btn.BackgroundColor3 = Color3.fromRGB(180, 180, 255)
        task.wait(0.1)
        btn.BackgroundColor3 = originalColor
    end)
end

local keyButtons = {
    "ESC", "F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9",
    "Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P",
    "A", "S", "D", "F", "G", "H", "J", "K", "L", "Semicolon",
    "Z", "X", "C", "V", "B", "N", "M", "Comma", "Period", "Slash",
    "Space", "LeftCtrl", "RightCtrl", "LeftAlt", "RightAlt"
}

for _, keyName in ipairs(keyButtons) do
    local button = G2L[keyName]
    if button then
        makeHover(button, button.BackgroundColor3, Color3.fromRGB(20, 20, 20))
        makePressGlow(button)
        
        button.MouseButton1Click:Connect(function()
            pressKey(keyName)
        end)
    end
end

makeHover(G2L["Minimizer"], G2L["Minimizer"].BackgroundColor3, Color3.fromRGB(60, 60, 60))
makeHover(G2L["Close"], G2L["Close"].BackgroundColor3, Color3.fromRGB(255, 100, 100))
makeHover(G2L["ShowButton"], G2L["ShowButton"].BackgroundColor3, Color3.fromRGB(60, 60, 60))

makePressGlow(G2L["Minimizer"])
makePressGlow(G2L["Close"])
makePressGlow(G2L["ShowButton"])

G2L["Minimizer"].MouseButton1Click:Connect(tweenToLeftAndHide)
G2L["ShowButton"].MouseButton1Click:Connect(function()
    G2L["ShowButton"].Visible = false
    tweenToCenter()
end)

G2L["Close"].MouseButton1Click:Connect(function()
    G2L["ScreenGui_1"]:Destroy()
end)

plr.CharacterAdded:Connect(function()
    local newGui = plr:WaitForChild("PlayerGui")
    G2L["ScreenGui_1"].Parent = newGui
end)

return G2L["ScreenGui_1"]