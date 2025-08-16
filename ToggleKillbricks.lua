local player = game:GetService("Players").LocalPlayer
local toggleEnabled = false

stuffTab:CreateToggle({
    Name = "Disable killbricks",
    CurrentValue = false,
    Flag = "DisableKillbricks",
    Callback = function(Value)
        toggleEnabled = Value
    end
})

task.spawn(function()
    while true do
        task.wait(0.1)
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local parts = workspace:GetPartBoundsInRadius(player.Character.HumanoidRootPart.Position, 10)
            for _, part in ipairs(parts) do
                part.CanTouch = toggleEnabled
            end
        end
    end
end)
