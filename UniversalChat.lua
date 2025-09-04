local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local TextChatService = game:GetService("TextChatService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

-- Hide default Roblox chat safely
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)

--/// Send
local function Send(message)
    TextChatService.TextChannels.RBXGeneral:SendAsync(message)
end

-- ScreenGui
local ChatGui = Instance.new("ScreenGui")
ChatGui.Name = "ByteChat"
ChatGui.ResetOnSpawn = false
ChatGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ChatGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- Main Frame with rounded corners (reduced height)
local ChatFrame = Instance.new("Frame")
ChatFrame.Size = UDim2.new(0, 320, 0, 300)  -- Reduced height
ChatFrame.AnchorPoint = Vector2.new(0.5, 0.5)  -- Center anchor
ChatFrame.Position = UDim2.new(0.5, 0, 0.6, 0)  -- Centered position
ChatFrame.BackgroundColor3 = Color3.fromRGB(25, 5, 45)
ChatFrame.BorderSizePixel = 0
ChatFrame.Visible = false
ChatFrame.ClipsDescendants = true
ChatFrame.Parent = ChatGui

-- Rounded corners
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = ChatFrame

-- Glow effect
local Stroke = Instance.new("UIStroke")
Stroke.Thickness = 2
Stroke.Color = Color3.fromRGB(120, 0, 255)
Stroke.Transparency = 0.5
Stroke.Parent = ChatFrame

-- Header
local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 28)  -- Reduced height
Header.BackgroundColor3 = Color3.fromRGB(40, 10, 70)
Header.BorderSizePixel = 0
Header.Parent = ChatFrame

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 12)
HeaderCorner.Parent = Header

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 1, 0)
Title.BackgroundTransparency = 1
Title.Text = "ByteChat"
Title.TextColor3 = Color3.fromRGB(200, 150, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14  -- Smaller text size
Title.Parent = Header

-- Close button
local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 28, 0, 28)  -- Smaller button
CloseButton.Position = UDim2.new(1, -28, 0, 0)
CloseButton.BackgroundTransparency = 1
CloseButton.Text = "×"
CloseButton.TextColor3 = Color3.fromRGB(200, 150, 255)
CloseButton.TextSize = 20  -- Smaller text
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Parent = Header

-- Scrolling frame for messages
local MsgScroll = Instance.new("ScrollingFrame")
MsgScroll.Size = UDim2.new(1, -10, 1, -70)  -- Adjusted size
MsgScroll.Position = UDim2.new(0, 5, 0, 33)  -- Adjusted position
MsgScroll.BackgroundTransparency = 1
MsgScroll.ScrollBarThickness = 6
MsgScroll.ScrollBarImageColor3 = Color3.fromRGB(80, 30, 120)
MsgScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
MsgScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
MsgScroll.VerticalScrollBarInset = Enum.ScrollBarInset.Always
MsgScroll.Parent = ChatFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 6)  -- Reduced padding
UIListLayout.Parent = MsgScroll

-- Input area
local InputFrame = Instance.new("Frame")
InputFrame.Size = UDim2.new(1, -10, 0, 32)  -- Reduced height
InputFrame.Position = UDim2.new(0, 5, 1, -37)  -- Adjusted position
InputFrame.BackgroundColor3 = Color3.fromRGB(35, 15, 60)
InputFrame.BorderSizePixel = 0
InputFrame.Parent = ChatFrame

local InputCorner = Instance.new("UICorner")
InputCorner.CornerRadius = UDim.new(0, 16)
InputCorner.Parent = InputFrame

-- TextBox for input
local MsgBox = Instance.new("TextBox")
MsgBox.Size = UDim2.new(1, -10, 1, -6)  -- Adjusted size
MsgBox.Position = UDim2.new(0, 5, 0, 3)  -- Adjusted position
MsgBox.BackgroundTransparency = 1
MsgBox.TextColor3 = Color3.fromRGB(255, 255, 255)
MsgBox.PlaceholderText = "Type a message..."
MsgBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
MsgBox.Text = ""
MsgBox.ClearTextOnFocus = false
MsgBox.TextXAlignment = Enum.TextXAlignment.Left
MsgBox.Font = Enum.Font.Gotham
MsgBox.TextSize = 14
MsgBox.Parent = InputFrame

-- Toggle button (moved higher up)
local Toggle = Instance.new("ImageButton")
Toggle.Size = UDim2.new(0, 40, 0, 40)  -- Smaller button
Toggle.Position = UDim2.new(0.5, -20, 0, 5)  -- Moved higher up
Toggle.BackgroundColor3 = Color3.fromRGB(50, 0, 80)
Toggle.Image = "rbxassetid://3926305904"
Toggle.ImageRectOffset = Vector2.new(964, 324)
Toggle.ImageRectSize = Vector2.new(36, 36)
Toggle.ImageColor3 = Color3.fromRGB(200, 150, 255)
Toggle.Parent = ChatGui

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 20)
ToggleCorner.Parent = Toggle

local ToggleStroke = Instance.new("UIStroke")
ToggleStroke.Thickness = 2
ToggleStroke.Color = Color3.fromRGB(120, 0, 255)
ToggleStroke.Parent = Toggle

-- Animation variables
local isOpen = false
local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

-- Toggle animation function
local function toggleChat()
    isOpen = not isOpen
    
    if isOpen then
        ChatFrame.Visible = true
        local tween = TweenService:Create(
            ChatFrame,
            tweenInfo,
            {Position = UDim2.new(0.5, 0, 0.6, 0)}  -- Centered position
        )
        tween:Play()
        MsgBox:CaptureFocus()
    else
        local tween = TweenService:Create(
            ChatFrame,
            tweenInfo,
            {Position = UDim2.new(0.5, 0, 1.5, 0)}  -- Move down off screen
        )
        tween:Play()
        tween.Completed:Connect(function()
            ChatFrame.Visible = false
        end)
    end
end

-- Toggle button click
Toggle.MouseButton1Click:Connect(toggleChat)

-- Close button click
CloseButton.MouseButton1Click:Connect(toggleChat)

-- Function to send message
local function sendMessage()
    if MsgBox.Text ~= "" then
        Send(MsgBox.Text)
        AddMessage(LocalPlayer.Name .. ": " .. MsgBox.Text, LocalPlayer)
        MsgBox.Text = ""
    end
end

-- Send on Enter (fixed for mobile)
MsgBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        sendMessage()
        -- Keep focus for mobile to allow continuous chatting
        if UserInputService.TouchEnabled then
            task.wait(0.1)
            MsgBox:CaptureFocus()
        end
    end
end)

-- Hover effects for buttons
local function setupButtonHover(button, normalColor, hoverColor)
    button.MouseEnter:Connect(function()
        local tween = TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = hoverColor})
        tween:Play()
    end)
    
    button.MouseLeave:Connect(function()
        local tween = TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = normalColor})
        tween:Play()
    end)
end

setupButtonHover(Toggle, Color3.fromRGB(50, 0, 80), Color3.fromRGB(70, 20, 100))

-- Add message function with improved UI
function AddMessage(msg, player)
    local isLocalPlayer = player == LocalPlayer
    
    local messageContainer = Instance.new("Frame")
    messageContainer.Size = UDim2.new(1, 0, 0, 0)
    messageContainer.BackgroundTransparency = 1
    messageContainer.AutomaticSize = Enum.AutomaticSize.Y
    messageContainer.LayoutOrder = #MsgScroll:GetChildren()
    messageContainer.Parent = MsgScroll
    
    local messageBubble = Instance.new("TextLabel")
    messageBubble.Size = UDim2.new(1, -10, 0, 0)
    messageBubble.AutomaticSize = Enum.AutomaticSize.Y
    messageBubble.BackgroundColor3 = isLocalPlayer and Color3.fromRGB(70, 30, 120) or Color3.fromRGB(45, 20, 75)
    messageBubble.TextColor3 = Color3.fromRGB(220, 200, 255)
    messageBubble.Text = msg
    messageBubble.TextXAlignment = Enum.TextXAlignment.Left
    messageBubble.TextYAlignment = Enum.TextYAlignment.Top
    messageBubble.Font = Enum.Font.Gotham
    messageBubble.TextSize = 14
    messageBubble.Padding = UDim.new(0, 8)
    messageBubble.Parent = messageContainer
    
    local bubbleCorner = Instance.new("UICorner")
    bubbleCorner.CornerRadius = UDim.new(0, 12)
    bubbleCorner.Parent = messageBubble
    
    -- Add player name for other players' messages
    if not isLocalPlayer then
        local nameLabel = Instance.new("TextLabel")
        nameLabel.Size = UDim2.new(1, 0, 0, 16)
        nameLabel.Position = UDim2.new(0, 0, 0, -18)
        nameLabel.BackgroundTransparency = 1
        nameLabel.Text = player.Name
        nameLabel.TextColor3 = Color3.fromRGB(170, 150, 220)
        nameLabel.Font = Enum.Font.GothamMedium
        nameLabel.TextSize = 12
        nameLabel.TextXAlignment = Enum.TextXAlignment.Left
        nameLabel.Parent = messageContainer
    end
    
    -- Animate new message appearance
    messageBubble.Size = UDim2.new(0, 0, 0, 0)
    local tween = TweenService:Create(
        messageBubble,
        TweenInfo.new(0.2),
        {Size = UDim2.new(1, -10, 0, 0)}
    )
    tween:Play()
    
    -- Auto-scroll to bottom
    local scrollTween = TweenService:Create(
        MsgScroll,
        TweenInfo.new(0.3),
        {CanvasPosition = Vector2.new(0, MsgScroll.AbsoluteCanvasSize.Y)}
    )
    scrollTween:Play()
end

-- Listen for messages from other players
TextChatService.TextChannels.RBXGeneral.OnIncomingMessage = function(message)
    local properties = message.TextChannel:GetMessageProperties(message)
    local player = Players:FindFirstChild(properties.Name or "Unknown")
    
    if player and player ~= LocalPlayer then
        AddMessage(properties.Message, player)
    end
end

-- Initial setup: hide chat off-screen
ChatFrame.Position = UDim2.new(0.5, 0, 1.5, 0)