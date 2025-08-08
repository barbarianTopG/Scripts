local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

local connection = nil

local function setupPrevention(character)
    if connection then
        connection:Disconnect()
    end
    
    local humanoid = character:WaitForChild("Humanoid")
    connection = humanoid:GetPropertyChangedSignal("EquippedTool"):Connect(function()
        if humanoid.EquippedTool then
            humanoid:UnequipTools()
        end
    end)
end

localPlayer.CharacterAdded:Connect(setupPrevention)
if localPlayer.Character then
    setupPrevention(localPlayer.Character)
end

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Prevent Tools",
    Text = "On.",
    Icon = "rbxassetid://84736703480482",
    Duration = 3
})