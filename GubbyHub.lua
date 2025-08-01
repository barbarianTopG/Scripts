local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
local Window = Rayfield:CreateWindow({
        Name = "Gubby Hub | Official",
        LoadingTitle = "Gubby hub | Official",
        LoadingSubtitle = "By CatbyteHD",
        Theme = "Ocean",
        ToggleUIKeybind = Enum.KeyCode.B,
        DisableRayfieldPrompts = false,
        DisableBuildWarnings = false,
        ConfigurationSaving = {
                Enabled = true,
                FolderName = "GubbyHubOfficial",
                FileName = "Settings"
        },
        Discord = {
                Enabled = false
        },
        KeySystem = false
})

Rayfield:Notify({
        Title = "Credits to:",
        Content = "Friedpotato, SonixDev, GhostPlayer, EdgeIY, ltseverydayyou, Ata, 611v.",
        Duration = 10
})

local universalTab = Window:CreateTab("Universal")

universalTab:CreateButton({Name = "Nameless Admin", Callback = function()
        return loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/Nameless-Admin/main/Source.lua"))()
end})

universalTab:CreateButton({Name = "Infinite Yield", Callback = function()
        return loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end})

universalTab:CreateButton({Name = "Rochips Panel", Callback = function()
        loadstring(game:HttpGet("https://glot.io/snippets/gzrux646yj/raw/main.ts"))()
        Rayfield:Notify({Title = "Rochips Panel", Content = "Loading... (Wait 2-30 seconds, depends on executor & device)", Duration = 5})
end})

universalTab:CreateButton({Name = "Ghost Hub", Callback = function()
        return loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub"))()
end})

universalTab:CreateButton({Name = "Crypton", Callback = function()
        return loadstring(game:HttpGet("https://raw.githubusercontent.com/thesigmacorex/Crypton/main/Free"))()
end})

universalTab:CreateButton({Name = "EKDV1", Callback = function()
        return loadstring(game:HttpGet("https://raw.githubusercontent.com/sparezirt/Script/refs/heads/main/.github/workflows/JustABaseplate.txt"))()
end})

universalTab:CreateButton({Name = "Delta Keyboard", Callback = function()
        return loadstring(game:HttpGet("https://raw.githubusercontent.com/Xxtan31/Ata/main/deltakeyboardcrack.txt"))()
end})

local mm2Tab = Window:CreateTab("MM2")

mm2Tab:CreateToggle({
        Name = "RoleESP (By CatbyteHD)",
        CurrentValue = false,
        Flag = "RoleEspToggle",
        Callback = function(value)
                if value then
                        return loadstring(game:HttpGet("https://pastefy.app/qozdsQ5i/raw"))()
                else
                        Rayfield:Notify({Title = "RoleESP", Content = "Toggle off: reload script to fully disable.", Duration = 3})
                end
        end
})

local myScriptsTab = Window:CreateTab("My Scripts")

myScriptsTab:CreateButton({Name = "Giant Krystal Dance (Only JAB)", Callback = function()
        return loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/Giant-Krystal-Dance/refs/heads/main/Giant-Krystal-Dance.lua"))()
end})

myScriptsTab:CreateButton({Name = "Epik R6 Dancezz Modded", Callback = function()
        return loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/EpikR6DancezzReworked/refs/heads/main/EpikCode.txt"))()
end})

myScriptsTab:CreateButton({Name = "Dupe GUI V1", Callback = function()
        return 
loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/MyScripts/refs/heads/main/Dupe-Gui-v1.lua"))()
end})

myScriptsTab:CreateButton({Name = "Kill GUI v2", Callback = function()
        return loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/MyScripts/refs/heads/main/Kill-GUI-V2.lua"))()
end})

myScriptsTab:CreateButton({Name = "Anti Tool-Kill", Callback = function()
        return
loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/MyScripts/refs/heads/main/Anti-Tool-Kill.lua"))()
end})

myScriptsTab:CreateButton({Name = "Tool-Spam", Callback = function()
        return
loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/MyScripts/refs/heads/main/Tool-Spam.lua"))()
end})

if game.PlaceId == 10449761463 then
        local friedTab = Window:CreateTab("FriedPotato's (TSB)")

        friedTab:CreateButton({Name = "Trashcan Man (Any Hero)", Callback = function()
                return loadstring(game:HttpGet("https://raw.githubusercontent.com/yes1nt/yes/refs/heads/main/Trashcan%20Man", true))()
        end})

        friedTab:CreateButton({Name = "Teleport Guy (Garou)", Callback = function()
                return loadstring(game:HttpGet("https://raw.githubusercontent.com/yes1nt/yes/refs/heads/main/Teleport%20Guy.txt", true))()
        end})

        friedTab:CreateButton({Name = "Flight Tool (Any Hero)", Callback = function()
                return loadstring(game:HttpGet("https://raw.githubusercontent.com/yes1nt/yes/refs/heads/main/Flight%20Tool%20Obfuscated.txt", true))()
        end})

        friedTab:CreateButton({Name = "Void Reaper (Garou)", Callback = function()
                return loadstring(game:HttpGet("https://raw.githubusercontent.com/yes1nt/yes/refs/heads/main/Void%20Reaper%20Obfuscated.txt"))()
        end})

        friedTab:CreateButton({Name = "Chainsaw Man (Garou)", Callback = function()
                getgenv().RunSpeed = 100
                getgenv().RunJump = 100
                getgenv().InstaKill = true
                getgenv().RevivePercent = 100
                getgenv().ChangeWalk = true
                getgenv().ChangeIdle = true
                getgenv().Night = false
                getgenv().DashNoCooldown = true
                getgenv().ExtraSkills = true
                return loadstring(game:HttpGet("https://raw.githubusercontent.com/yes1nt/yes/refs/heads/main/CHAINSAW%20MAN/Chainsaw%20Man%20(Obfuscated).txt"))()
        end})
end

task.spawn(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/MyScripts/refs/heads/main/DevTag.lua"))()
end)