local RunService = game:GetService("RunService")
local TextChatService = game:GetService("TextChatService")

local GXL = {
    ["ExperienceChat"] = Instance.new("ScreenGui"),
    ["CaretPadding"] = Instance.new("UIPadding"),
    ["Layout"] = Instance.new("UIListLayout"),
    ["CaretPadding_2"] = Instance.new("UIPadding"),
    ["Layout_2"] = Instance.new("UIListLayout"),
    ["CaretPadding_3"] = Instance.new("UIPadding"),
    ["Layout_3"] = Instance.new("UIListLayout"),
    ["appLayout"] = Instance.new("Frame"),
    ["chatInputBar"] = Instance.new("Frame"),
    ["Background"] = Instance.new("Frame"),
    ["Corner"] = Instance.new("UICorner"),
    ["Border"] = Instance.new("UIStroke"),
    ["Container"] = Instance.new("Frame"),
    ["TextContainer"] = Instance.new("Frame"),
    ["UIPadding"] = Instance.new("UIPadding"),
    ["TextBoxContainer"] = Instance.new("Frame"),
    ["TextBox"] = Instance.new("TextBox"),
    ["TargetChannelChip"] = Instance.new("TextButton"),
    ["SendButton"] = Instance.new("TextButton"),
    ["SendIcon"] = Instance.new("ImageLabel"),
    ["Layout_4"] = Instance.new("UIListLayout"),
    ["AutocompleteDropdown"] = Instance.new("Frame"),
    ["UISizeConstraint"] = Instance.new("UISizeConstraint"),
    ["ScrollBarFrame"] = Instance.new("Frame"),
    ["Corner_2"] = Instance.new("UICorner"),
    ["Border_2"] = Instance.new("UIStroke"),
    ["ScrollViewFrame"] = Instance.new("Frame"),
    ["ScrollView"] = Instance.new("ScrollingFrame"),
    ["OffsetFrame"] = Instance.new("Frame"),
    ["_layout"] = Instance.new("UIListLayout"),
    ["UISizeConstraint_2"] = Instance.new("UISizeConstraint"),
    ["UIPadding_2"] = Instance.new("UIPadding"),
    ["topBorder"] = Instance.new("ImageLabel"),
    ["uiSizeConstraint"] = Instance.new("UISizeConstraint"),
    ["chatWindow"] = Instance.new("Frame"),
    ["uiSizeConstraint_2"] = Instance.new("UISizeConstraint"),
    ["scrollingView"] = Instance.new("ImageButton"),
    ["bottomLockedScrollView"] = Instance.new("Frame"),
    ["RCTScrollView"] = Instance.new("ScrollingFrame"),
    ["RCTScrollContentView"] = Instance.new("Frame"),
    ["VerticalLayout"] = Instance.new("UIListLayout"),
    ["ContentDisplayLayout"] = Instance.new("UIListLayout"),
    ["TextLabel"] = Instance.new("Frame"),
    ["TextMessage"] = Instance.new("TextLabel"),
    ["_layout_2"] = Instance.new("UIListLayout"),
    ["ContentDisplayer"] = Instance.new("Frame"),
    ["TextLabel_2"] = Instance.new("Frame"),
    ["TextMessage_2"] = Instance.new("TextLabel"),
    ["padding"] = Instance.new("UIPadding"),
    ["bottomBorder"] = Instance.new("ImageLabel"),
    ["uiSizeConstraint_3"] = Instance.new("UISizeConstraint"),
    ["channelBar"] = Instance.new("Frame"),
    ["HorizontalBar"] = Instance.new("Frame"),
    ["Background_2"] = Instance.new("Frame"),
    ["BottomBorder"] = Instance.new("Frame"),
    ["ContentContainer"] = Instance.new("Frame"),
    ["_layout_3"] = Instance.new("UIListLayout"),
    ["TopCorner"] = Instance.new("ImageLabel"),
    ["layout"] = Instance.new("UIListLayout"),
    ["uiSizeConstraint_4"] = Instance.new("UISizeConstraint"),
    ["topPadding"] = Instance.new("Frame")
}

GXL["ExperienceChat"].Parent = game:GetService("CoreGui")
GXL["ExperienceChat"].Name = 'ExperienceChat'
GXL["ExperienceChat"].DisplayOrder = -1

-- Chat input bar setup
GXL["appLayout"].Parent = GXL["ExperienceChat"]
GXL["appLayout"].Name = 'appLayout'
GXL["appLayout"].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
GXL["appLayout"].BackgroundTransparency = 1
GXL["appLayout"].Position = UDim2.new(0, 8, 0, 4)
GXL["appLayout"].Size = UDim2.new(0.4, 0, 0.16875, 0)

GXL["chatInputBar"].Parent = GXL["appLayout"]
GXL["chatInputBar"].Name = 'chatInputBar'
GXL["chatInputBar"].AutomaticSize = Enum.AutomaticSize.Y
GXL["chatInputBar"].BackgroundColor3 = Color3.fromRGB(25, 27, 29)
GXL["chatInputBar"].BackgroundTransparency = 0.3
GXL["chatInputBar"].BorderSizePixel = 0
GXL["chatInputBar"].LayoutOrder = 3
GXL["chatInputBar"].Size = UDim2.new(1, 0, 0, 0)

-- Background
GXL["Background"].Parent = GXL["chatInputBar"]
GXL["Background"].Name = 'Background'
GXL["Background"].AutomaticSize = Enum.AutomaticSize.XY
GXL["Background"].BackgroundColor3 = Color3.fromRGB(25, 27, 29)
GXL["Background"].BackgroundTransparency = 1
GXL["Background"].Size = UDim2.new(1, 0, 0, 0)

GXL["Corner"].Parent = GXL["Background"]
GXL["Corner"].CornerRadius = UDim.new(0, 3)

GXL["Border"].Parent = GXL["Background"]
GXL["Border"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
GXL["Border"].Color = Color3.fromRGB(255, 255, 255)

-- Container & Text container
GXL["Container"].Parent = GXL["Background"]
GXL["Container"].Name = 'Container'
GXL["Container"].AutomaticSize = Enum.AutomaticSize.Y
GXL["Container"].BackgroundTransparency = 1
GXL["Container"].Size = UDim2.new(1, 0, 0, 0)

GXL["TextContainer"].Parent = GXL["Container"]
GXL["TextContainer"].Name = 'TextContainer'
GXL["TextContainer"].AutomaticSize = Enum.AutomaticSize.Y
GXL["TextContainer"].BackgroundTransparency = 1
GXL["TextContainer"].Size = UDim2.new(1, -30, 0, 0)

GXL["UIPadding"].Parent = GXL["TextContainer"]
GXL["UIPadding"].PaddingBottom = UDim.new(0, 10)
GXL["UIPadding"].PaddingLeft = UDim.new(0, 10)
GXL["UIPadding"].PaddingRight = UDim.new(0, 10)
GXL["UIPadding"].PaddingTop = UDim.new(0, 10)

-- TextBox
GXL["TextBoxContainer"].Parent = GXL["TextContainer"]
GXL["TextBoxContainer"].Name = 'TextBoxContainer'
GXL["TextBoxContainer"].AnchorPoint = Vector2.new(1, 0)
GXL["TextBoxContainer"].AutomaticSize = Enum.AutomaticSize.Y
GXL["TextBoxContainer"].BackgroundTransparency = 1
GXL["TextBoxContainer"].Position = UDim2.new(1, 0, 0, 0)
GXL["TextBoxContainer"].Size = UDim2.new(1, -8, 0, 0)

GXL["TextBox"].Parent = GXL["TextBoxContainer"]
GXL["TextBox"].Name = 'TextBox'
GXL["TextBox"].ClearTextOnFocus = false
GXL["TextBox"].FontFace = Font.new("rbxassetid://16658221428", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
GXL["TextBox"].FontSize = Enum.FontSize.Size18
GXL["TextBox"].OverlayNativeInput = true
GXL["TextBox"].PlaceholderColor3 = Color3.fromRGB(204, 204, 204)
GXL["TextBox"].PlaceholderText = 'To chat click here or press / key'
GXL["TextBox"].Text = ''
GXL["TextBox"].TextColor3 = Color3.fromRGB(255, 255, 255)
GXL["TextBox"].TextSize = 16
GXL["TextBox"].TextStrokeTransparency = 0.5
GXL["TextBox"].TextTransparency = 0.5
GXL["TextBox"].TextWrap = true
GXL["TextBox"].TextWrapped = true
GXL["TextBox"].TextXAlignment = Enum.TextXAlignment.Left
GXL["TextBox"].TextYAlignment = Enum.TextYAlignment.Top
GXL["TextBox"].AutomaticSize = Enum.AutomaticSize.XY
GXL["TextBox"].BackgroundTransparency = 1
GXL["TextBox"].Size = UDim2.new(1, 0, 0, 0)

-- Focus lost event
function focuslost(e)
    if e == false then return end
    local function dance()
        if GXL["TextBox"].Text:sub(1, 8) == "/e dance" then
            local dance = {
                [""] = "http://www.roblox.com/asset/?id=507772104",
                ["1"] = "http://www.roblox.com/asset/?id=507772104",
                ["2"] = "http://www.roblox.com/asset/?id=507776879",
                ["3"] = "http://www.roblox.com/asset/?id=507777623"
            }
            if dance[GXL["TextBox"].Text:sub(9, 9)] then
                local char = game:GetService("Players").LocalPlayer.Character
                if char and char:FindFirstChildOfClass("Humanoid") then
                    local anim = Instance.new("Animation")
                    anim.AnimationId = dance[GXL["TextBox"].Text:sub(9, 9)]
                    local loaded = char:FindFirstChildOfClass("Humanoid"):LoadAnimation(anim)
                    loaded:Play()
                    char:FindFirstChild("Humanoid").Changed:Connect(function(a)
                        if a == 'MoveDirection' or a == 'Sit' or a == 'Jump' then loaded:Stop() end
                    end)
                    GXL["TextBox"].Text = ''
                end
            end
        end
    end
    dance()
    if GXL["TextBox"].Text == '' then return end
    if TextChatService.ChatVersion == Enum.ChatVersion.LegacyChatService then
        local Stuff = game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents")
        if not Stuff then error("Failed to obtain DefaultChatSystemChatEvents folder.", 1) end
        local Stuff2 = Stuff:FindFirstChild("SayMessageRequest")
        if not Stuff2 then error("Failed to obtain SayMessageRequest event.", 1) end
        Stuff2:FireServer(GXL["TextBox"].Text, "All")
    else
        for _, v in next, TextChatService.TextChannels:GetChildren() do
            if v:FindFirstChild(game:GetService("Players").LocalPlayer.Name) and v.Name ~= 'RBXSystem' then
                v:SendAsync(GXL["TextBox"].Text)
                break
            end
        end
    end
    GXL["TextBox"].Text = ''
end

GXL["TextBox"].FocusLost:Connect(focuslost)