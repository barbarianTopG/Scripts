local plr = game.Players.LocalPlayer
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local cleaning = true

local function destroyTools(c)
for _, v in ipairs(c:GetChildren()) do
if v:IsA("Tool") then v:Destroy() end
end
c.ChildAdded:Connect(function(child)
if child:IsA("Tool") and cleaning then
child:Destroy()
end
end)
end

plr.CharacterAdded:Connect(function(char)
RunService.RenderStepped:Connect(function()
if cleaning then
local hum = char:FindFirstChildOfClass("Humanoid")
if hum then hum:UnequipTools() end
end
end)
destroyTools(char)
end)

destroyTools(plr.Backpack)
if plr:FindFirstChild("StarterGear") then destroyTools(plr.StarterGear) end
if CoreGui:FindFirstChild("ToolCleanerToggle") then CoreGui.ToolCleanerToggle:Destroy() end

local screenGui = Instance.new("ScreenGui", CoreGui)
screenGui.Name = "ToolCleanerToggle"

local btn = Instance.new("TextButton")
btn.Size = UDim2.new(0, 160, 0, 40)
btn.Position = UDim2.new(0, 10, 0, 0)
btn.BackgroundColor3 = Color3.new(0, 0, 0)
btn.TextColor3 = Color3.new(1, 1, 1)
btn.Font = Enum.Font.GothamBold
btn.TextSize = 18
btn.Text = "Anti Tool-Kill: ON"
btn.BorderSizePixel = 2
btn.BorderColor3 = Color3.fromRGB(40, 40, 40)
btn.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = btn

btn.MouseButton1Click:Connect(function()
cleaning = not cleaning
if cleaning then
btn.Text = "Anti Tool-Kill: ON"
else
btn.Text = "Anti Tool-Kill: OFF"
game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("/e -rs ")
end
end)