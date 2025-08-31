function notify(title, text, duration)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = duration or 5
    })
end

local function Send(message)
    game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(message)
end

notify("Local Hub", "Itz epik time")

loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/ScriptLoader/refs/heads/main/Reanimate.lua"))()
task.delay(6, function()
    Send("-net")
end)
task.wait(10)
loadstring(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/KDV3-Fixed/refs/heads/main/KrystalDance3"))()
task.wait(2)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/ScriptLoader/refs/heads/main/SelectKeyboard.lua"))()