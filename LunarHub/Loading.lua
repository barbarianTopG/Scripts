local CollectionService = game:GetService("CollectionService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local LSpopup = {}

LSpopup["ScreenGui_1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"))
LSpopup["ScreenGui_1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling

CollectionService:AddTag(LSpopup["ScreenGui_1"], [[main]])

LSpopup["Popup_2"] = Instance.new("Frame", LSpopup["ScreenGui_1"])
LSpopup["Popup_2"]["BorderSizePixel"] = 0
LSpopup["Popup_2"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
LSpopup["Popup_2"]["Size"] = UDim2.new(0.22852, 0, 0.14713, 0)
LSpopup["Popup_2"]["Position"] = UDim2.new(0.38729, 0, 0.03961, 0)
LSpopup["Popup_2"]["Name"] = [[Popup]]

LSpopup["UICorner_3"] = Instance.new("UICorner", LSpopup["Popup_2"])

LSpopup["TextLabel_4"] = Instance.new("TextLabel", LSpopup["Popup_2"])
LSpopup["TextLabel_4"]["BorderSizePixel"] = 0
LSpopup["TextLabel_4"]["TextSize"] = 12
LSpopup["TextLabel_4"]["TextXAlignment"] = Enum.TextXAlignment.Left
LSpopup["TextLabel_4"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31)
LSpopup["TextLabel_4"]["TextColor3"] = Color3.fromRGB(119, 0, 255)
LSpopup["TextLabel_4"]["Size"] = UDim2.new(0.97895, 0, 0.92308, 0)
LSpopup["TextLabel_4"]["Text"] = [[Loading Sounds...]]
LSpopup["TextLabel_4"]["Position"] = UDim2.new(0.01053, 0, 0.03846, 0)

LSpopup["UICorner_5"] = Instance.new("UICorner", LSpopup["TextLabel_4"])

LSpopup["UIStroke_6"] = Instance.new("UIStroke", LSpopup["Popup_2"])
LSpopup["UIStroke_6"]["Color"] = Color3.fromRGB(119, 0, 255)

LSpopup["UIAspectRatioConstraint_7"] = Instance.new("UIAspectRatioConstraint", LSpopup["Popup_2"])
LSpopup["UIAspectRatioConstraint_7"]["AspectRatio"] = 3.65385

LSpopup["Title_8"] = Instance.new("Frame", LSpopup["ScreenGui_1"])
LSpopup["Title_8"]["BorderSizePixel"] = 0
LSpopup["Title_8"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
LSpopup["Title_8"]["Size"] = UDim2.new(0.44742, 0, 0.11884, 0)
LSpopup["Title_8"]["Position"] = UDim2.new(0.27423, 0, -0.11318, 0)
LSpopup["Title_8"]["BorderColor3"] = Color3.fromRGB(119, 0, 255)
LSpopup["Title_8"]["Name"] = [[Title]]

LSpopup["ScriptName_9"] = Instance.new("TextLabel", LSpopup["Title_8"])
LSpopup["ScriptName_9"]["TextWrapped"] = true
LSpopup["ScriptName_9"]["BorderSizePixel"] = 0
LSpopup["ScriptName_9"]["TextSize"] = 1
LSpopup["ScriptName_9"]["TextXAlignment"] = Enum.TextXAlignment.Left
LSpopup["ScriptName_9"]["TextScaled"] = true
LSpopup["ScriptName_9"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
LSpopup["ScriptName_9"]["TextColor3"] = Color3.fromRGB(119, 0, 255)
LSpopup["ScriptName_9"]["Size"] = UDim2.new(0.99462, 0, 0.80952, 0)
LSpopup["ScriptName_9"]["Text"] = "LunarHub・Welcome, " .. game.Players.LocalPlayer.Name .. "!"
LSpopup["ScriptName_9"]["Name"] = [[ScriptName]]
LSpopup["ScriptName_9"]["Position"] = UDim2.new(0, 0, 0.09524, 0)

LSpopup["UICorner_a"] = Instance.new("UICorner", LSpopup["ScriptName_9"])

LSpopup["UICorner_b"] = Instance.new("UICorner", LSpopup["Title_8"])

LSpopup["UIStroke_c"] = Instance.new("UIStroke", LSpopup["Title_8"])
LSpopup["UIStroke_c"]["Thickness"] = 2
LSpopup["UIStroke_c"]["Color"] = Color3.fromRGB(119, 0, 255)

LSpopup["UIAspectRatioConstraint_d"] = Instance.new("UIAspectRatioConstraint", LSpopup["Title_8"])
LSpopup["UIAspectRatioConstraint_d"]["AspectRatio"] = 8.85714

local function Animationz()
    local tweenInfo = TweenInfo.new(
        0.5,
        Enum.EasingStyle.Quad,
        Enum.EasingDirection.Out
    )
    
    local pulseTweenInfo = TweenInfo.new(
        0.8,
        Enum.EasingStyle.Quad,
        Enum.EasingDirection.InOut,
        -1,
        true
    )
    
    local titleSlideIn = TweenService:Create(
        LSpopup["Title_8"],
        tweenInfo,
        {Position = UDim2.new(0.27423, 0, 0.11318, 0)}
    )
    
    local strokePulse = TweenService:Create(
        LSpopup["UIStroke_c"],
        pulseTweenInfo,
        {Color = Color3.fromRGB(170, 85, 255)}
    )
    
    local textPulse = TweenService:Create(
        LSpopup["ScriptName_9"],
        pulseTweenInfo,
        {TextColor3 = Color3.fromRGB(170, 85, 255)}
    )
    
    local popupStrokePulse = TweenService:Create(
        LSpopup["UIStroke_6"],
        pulseTweenInfo,
        {Color = Color3.fromRGB(170, 85, 255)}
    )
    
    local popupTextPulse = TweenService:Create(
        LSpopup["TextLabel_4"],
        pulseTweenInfo,
        {TextColor3 = Color3.fromRGB(170, 85, 255)}
    )
    
    titleSlideIn:Play()
    strokePulse:Play()
    textPulse:Play()
    popupStrokePulse:Play()
    popupTextPulse:Play()
    
    local loadingMessages = {
        "Loading Sounds...",
        "Loading Scripts...", 
        "Loading UI...",
        "Loading Assets...",
        "Initializing...",
        "Executing LunarHub..."
    }
    
    local currentMessage = 1
    
    local function updateLoadingText()
        LSpopup["TextLabel_4"].Text = loadingMessages[currentMessage]
        currentMessage = currentMessage + 1
        
        if currentMessage > #loadingMessages then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/Scripts/main/LunarHub/Main.lua"))()
            
            wait(0.5)
            
            strokePulse:Cancel()
            textPulse:Cancel()
            popupStrokePulse:Cancel()
            popupTextPulse:Cancel()
            
            LSpopup["UIStroke_c"].Color = Color3.fromRGB(119, 0, 255)
            LSpopup["ScriptName_9"].TextColor3 = Color3.fromRGB(119, 0, 255)
            LSpopup["UIStroke_6"].Color = Color3.fromRGB(119, 0, 255)
            LSpopup["TextLabel_4"].TextColor3 = Color3.fromRGB(119, 0, 255)
            LSpopup["TextLabel_4"].Text = "LunarHub Loaded!"
            
            local fadeOutInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            
            local titleFadeOut = TweenService:Create(
                LSpopup["Title_8"],
                fadeOutInfo,
                {Position = UDim2.new(0.27423, 0, -0.11318, 0)}
            )
            
            local popupFadeOut = TweenService:Create(
                LSpopup["Popup_2"],
                fadeOutInfo,
                {Position = UDim2.new(0.38729, 0, -0.14713, 0)}
            )
            
            titleFadeOut:Play()
            popupFadeOut:Play()
            
            titleFadeOut.Completed:Connect(function()
                wait(0.2)
                LSpopup["ScreenGui_1"]:Destroy()
            end)
            
            return 
        end
    end
    
    local textChangeConnection
    textChangeConnection = RunService.Heartbeat:Connect(function()
        wait(0.8)
        if LSpopup["ScreenGui_1"].Parent then 
            updateLoadingText()
        else
            textChangeConnection:Disconnect()
        end
    end)
end

Animationz()

return LSpopup["ScreenGui_1"], require