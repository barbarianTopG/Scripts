local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

if connection then
    connection:Disconnect()
    connection = nil
end

if localPlayer.Character then
    local humanoid = localPlayer.Character:FindFirstChild("Humanoid")
    if humanoid then
        for _,v in ipairs(getconnections(humanoid:GetPropertyChangedSignal("EquippedTool"))) do
            v:Disconnect()
        end
    end
end

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Prevent Tools",
    Text = "Off.",
    Icon = "rbxassetid://84736703480482",
    Duration = 3
})