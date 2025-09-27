--[=[
 d888b  db    db d888888b      .d888b.      db      db    db  .d8b.  
88' Y8b 88    88   `88'        VP  `8D      88      88    88 d8' `8b 
88      88    88    88            odD'      88      88    88 88ooo88 
88  ooo 88    88    88          .88'        88      88    88 88~~~88 
88. ~8~ 88b  d88   .88.        j88.         88booo. 88b  d88 88   88    
 Y888P  ~Y8888P' Y888888P      888888D      Y88888P ~Y8888P' YP   YP
]=]

local CollectionService = game:GetService("CollectionService");
local TweenService = game:GetService("TweenService");
local G2L = {};

G2L["ScreenGui_1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
G2L["ScreenGui_1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;

CollectionService:AddTag(G2L["ScreenGui_1"], [[main]]);

G2L["Frame_2"] = Instance.new("Frame", G2L["ScreenGui_1"]);
G2L["Frame_2"]["BorderSizePixel"] = 0;
G2L["Frame_2"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["Frame_2"]["Size"] = UDim2.new(0.5701, 0, 0.70736, 0);
G2L["Frame_2"]["Position"] = UDim2.new(0.20687, 0, 0.00566, 0);
G2L["Frame_2"]["BorderColor3"] = Color3.fromRGB(119, 0, 255);

G2L["UICorner_3"] = Instance.new("UICorner", G2L["Frame_2"]);

G2L["UIStroke_4"] = Instance.new("UIStroke", G2L["Frame_2"]);
G2L["UIStroke_4"]["Thickness"] = 2;
G2L["UIStroke_4"]["Color"] = Color3.fromRGB(119, 0, 255);

G2L["WelcomeTitle_5"] = Instance.new("TextLabel", G2L["Frame_2"]);
G2L["WelcomeTitle_5"]["TextWrapped"] = true;
G2L["WelcomeTitle_5"]["BorderSizePixel"] = 0;
G2L["WelcomeTitle_5"]["TextScaled"] = true;
G2L["WelcomeTitle_5"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
G2L["WelcomeTitle_5"]["TextColor3"] = Color3.fromRGB(119, 0, 255);
G2L["WelcomeTitle_5"]["Size"] = UDim2.new(0.32911, 0, 0.152, 0);
G2L["WelcomeTitle_5"]["Text"] = [[Welcome!]];
G2L["WelcomeTitle_5"]["Name"] = [[WelcomeTitle]];
G2L["WelcomeTitle_5"]["Position"] = UDim2.new(0.33755, 0, 0.192, 0);

G2L["UICorner_6"] = Instance.new("UICorner", G2L["WelcomeTitle_5"]);

G2L["ScriptName_7"] = Instance.new("TextLabel", G2L["Frame_2"]);
G2L["ScriptName_7"]["TextWrapped"] = true;
G2L["ScriptName_7"]["BorderSizePixel"] = 0;
G2L["ScriptName_7"]["TextScaled"] = true;
G2L["ScriptName_7"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["ScriptName_7"]["TextColor3"] = Color3.fromRGB(119, 0, 255);
G2L["ScriptName_7"]["Size"] = UDim2.new(0.36709, 0, 0.152, 0);
G2L["ScriptName_7"]["Text"] = [[Lunar Hub ]];
G2L["ScriptName_7"]["Name"] = [[ScriptName]];
G2L["ScriptName_7"]["Position"] = UDim2.new(0.00422, 0, 0.008, 0);

G2L["UICorner_8"] = Instance.new("UICorner", G2L["ScriptName_7"]);

G2L["Description_9"] = Instance.new("TextLabel", G2L["Frame_2"]);
G2L["Description_9"]["TextWrapped"] = true;
G2L["Description_9"]["BorderSizePixel"] = 0;
G2L["Description_9"]["TextScaled"] = true;
G2L["Description_9"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["Description_9"]["TextColor3"] = Color3.fromRGB(119, 0, 255);
G2L["Description_9"]["Size"] = UDim2.new(0.98312, 0, 0.544, 0);
G2L["Description_9"]["Text"] = [[Loading Lunar Hub...]];
G2L["Description_9"]["Name"] = [[Description]];
G2L["Description_9"]["Position"] = UDim2.new(0.00422, 0, 0.352, 0);

G2L["UICorner_a"] = Instance.new("UICorner", G2L["Description_9"]);

G2L["TopbarLine_b"] = Instance.new("Frame", G2L["Frame_2"]);
G2L["TopbarLine_b"]["BorderSizePixel"] = 0;
G2L["TopbarLine_b"]["BackgroundColor3"] = Color3.fromRGB(119, 0, 255);
G2L["TopbarLine_b"]["Size"] = UDim2.new(1.00422, 0, 0.008, 0);
G2L["TopbarLine_b"]["Position"] = UDim2.new(0, 0, 0.152, 0);
G2L["TopbarLine_b"]["Name"] = [[TopbarLine]];

G2L["Frame_c"] = Instance.new("Frame", G2L["Frame_2"]);
G2L["Frame_c"]["BorderSizePixel"] = 0;
G2L["Frame_c"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
G2L["Frame_c"]["Size"] = UDim2.new(0.98312, 0, 0.112, 0);
G2L["Frame_c"]["Position"] = UDim2.new(0.00844, 0, 0.872, 0);

G2L["UICorner_d"] = Instance.new("UICorner", G2L["Frame_c"]);

G2L["TimerLine"] = Instance.new("Frame", G2L["Frame_c"]);
G2L["TimerLine"]["BorderSizePixel"] = 0;
G2L["TimerLine"]["BackgroundColor3"] = Color3.fromRGB(119, 0, 255);
G2L["TimerLine"]["Size"] = UDim2.new(0, 0, 1, 0); 
G2L["TimerLine"]["Position"] = UDim2.new(0, 0, 0, 0);
G2L["TimerLine"]["Name"] = [[TimerLine]];

G2L["UICorner_timer"] = Instance.new("UICorner", G2L["TimerLine"]);

G2L["UIAspectRatioConstraint_e"] = Instance.new("UIAspectRatioConstraint", G2L["Frame_2"]);
G2L["UIAspectRatioConstraint_e"]["AspectRatio"] = 1.896;

local function startLoadingAnimation()
    local tweenInfo = TweenInfo.new(
        4, -- seconds
        Enum.EasingStyle.Linear,
        Enum.EasingDirection.InOut,
        0,
        false,
        0
    )
    
    local tween = TweenService:Create(
        G2L["TimerLine"],
        tweenInfo,
        {Size = UDim2.new(1, 0, 1, 0)} 
    )
    
    local loadingSteps = {
        "Initializing Lunar Hub...",
        "Loading modules...", 
        "Setting up interface...",
        "Almost ready..."
    }
    
    for i, text in ipairs(loadingSteps) do
        G2L["Description_9"].Text = text
        wait(1) 
    end
    
    tween:Play()
    
    tween.Completed:Connect(function()
        G2L["Description_9"].Text = "Loading complete!"
        wait(0.5)
        
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/Scripts/main/LunarHub/Main.lua"))()
        
        wait(1)
        G2L["ScreenGui_1"]:Destroy()
    end)
end

startLoadingAnimation()

return G2L["ScreenGui_1"], require;