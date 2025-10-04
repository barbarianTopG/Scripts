local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local Wait = task.wait;
function notify(title, text, duration)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = duration or 5
    })
end;
local function Chat(message)
    pcall(function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(message)
    end)
    pcall(function()
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
    end)
end;
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
local Window = Rayfield:CreateWindow({
    Name = "Lunar Hub",
    LoadingTitle = "Lunar Hub",
    LoadingSubtitle = "By StarFlow",
    Theme = {
        TextColor = Color3.fromRGB(255, 255, 255),
        Background = Color3.fromRGB(0, 0, 0),
        Topbar = Color3.fromRGB(0, 0, 0),
        Shadow = Color3.fromRGB(0, 0, 0),
        NotificationBackground = Color3.fromRGB(0, 0, 0),
        NotificationActionsBackground = Color3.fromRGB(100, 0, 255),
        TabBackground = Color3.fromRGB(0, 0, 0),
        TabStroke = Color3.fromRGB(100, 0, 255),
        TabBackgroundSelected = Color3.fromRGB(50, 0, 133),
        TabTextColor = Color3.fromRGB(255, 255, 255),
        SelectedTabTextColor = Color3.fromRGB(255, 255, 255),
        ElementBackground = Color3.fromRGB(15, 15, 15),
        ElementBackgroundHover = Color3.fromRGB(40, 40, 40),
        SecondaryElementBackground = Color3.fromRGB(0, 0, 0),
        ElementStroke = Color3.fromRGB(150, 150, 150),
        SecondaryElementStroke = Color3.fromRGB(255, 255, 255),
        SliderBackground = Color3.fromRGB(75, 0, 200),
        SliderProgress = Color3.fromRGB(50, 0, 255),
        SliderStroke = Color3.fromRGB(75, 0, 255),
        ToggleBackground = Color3.fromRGB(100, 0, 255),
        ToggleEnabled = Color3.fromRGB(255, 255, 255),
        ToggleDisabled = Color3.fromRGB(255, 255, 255),
        ToggleEnabledStroke = Color3.fromRGB(0, 0, 0),
        ToggleDisabledStroke = Color3.fromRGB(0, 0, 0),
        ToggleEnabledOuterStroke = Color3.fromRGB(0, 0, 0),
        ToggleDisabledOuterStroke = Color3.fromRGB(0, 0, 0),
        DropdownSelected = Color3.fromRGB(100, 0, 255),
        DropdownUnselected = Color3.fromRGB(0, 0, 0),
        InputBackground = Color3.fromRGB(0, 0, 0),
        InputStroke = Color3.fromRGB(100, 0, 255),
        PlaceholderColor = Color3.fromRGB(100, 0, 255)
    },
    ToggleUIKeybind = Enum.KeyCode.B,
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "LunarHub",
        FileName = "Settings"
    },
    Discord = {
        Enabled = false
    },
    KeySystem = false
})
local player = Players.LocalPlayer;
local preventToolsEnabled = false;
local toolFriend = nil;
local charFriend = nil;
function setupToolListener(char)
    if toolFriend then
        toolFriend:Disconnect()
    end;
    toolFriend = char.ChildAdded:Connect(function(child)
        if preventToolsEnabled and child:IsA("Tool") then
            local humanoid = char:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:UnequipTools()
            end
        end
    end)
end;
function onCharacterAdded(char)
    setupToolListener(char)
end;
if player.Character then
    onCharacterAdded(player.Character)
end;
charFriend = player.CharacterAdded:Connect(onCharacterAdded)
local Place = game.PlaceId;
local ReadTab = Window:CreateTab("(📄) READ")
if Place ~= 88308889239232 and Place ~= 17574618959 then
    ReadTab:CreateParagraph({
        Title = "❗︱Game Not Supported",
        Content = "Some features from this hub are removed."
    })
    ReadTab:CreateDivider()
end;
ReadTab:CreateParagraph({
    Title = "‼️ PLEASE READ THIS ‼️",
    Content = "I DO NOT OWN THE SCRIPTS IN THIS SCRIPT!!! ALL CREDIT GOES TO RESPECTIVE OWNERS OF THE SCRIPTS!!"
})
ReadTab:CreateParagraph({
    Title = "Meaning of emojis",
    Content = "🎮 - Only supported games\n🔗 - Any game"
})
if Place == 88308889239232 or Place == 17574618959 then
    ReadTab:CreateParagraph({
        Title = "How to use this hub? 🤔",
        Content = "If you're gonna use genesis, go to the Genesis rigs tab, once your done loading the hats and rigs, head to the Genesis tab and execute the scripts there!!1!"
    })
    ReadTab:CreateSection("Other")
    ReadTab:CreateParagraph({
        Title = "‼️ Notice ‼️",
        Content = "Credits to Theo for the idea of adding genesis, he's a cool guy make sure to check out his hub too! :)"
    })
end;
ReadTab:CreateParagraph({
    Title = "🌌︱Theme credits",
    Content = "Theme made by Theo."
})
local HomeTab = Window:CreateTab("(🔗) Home")
if Place == 17574618959 or Place == 88308889239232 then
    HomeTab:CreateButton({
        Name = "Sit",
        Callback = function()
            Chat("-sit ")
        end
    })
    HomeTab:CreateButton({
        Name = "Spawn Dummy",
        Callback = function()
            Chat("-dummy ")
        end
    })
    HomeTab:CreateButton({
        Name = "Respawn",
        Callback = function()
            Chat("-re ")
        end
    })
    HomeTab:CreateButton({
        Name = "Remove Hats",
        Callback = function()
            Chat("-ch ")
        end
    })
    HomeTab:CreateButton({
        Name = "Save hats",
        Callback = function()
            Chat("-sh ")
        end
    })
    HomeTab:CreateButton({
        Name = "PermaDeath",
        Callback = function()
            Chat("-pd ")
        end
    })
end;
local Toggle = HomeTab:CreateToggle({
    Name = "Prevent tools",
    CurrentValue = false,
    Flag = "PreventToolsToggle",
    Callback = function(Value)
        preventToolsEnabled = Value;
        local char = player.Character;
        if char then
            local tool = char:FindFirstChildOfClass("Tool")
            if tool and preventToolsEnabled then
                local humanoid = char:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid:UnequipTools()
                end
            end
        end
    end
})
local Slider = HomeTab:CreateSlider({
    Name = "WalkSpeed Slider",
    Range = {
        16,
        350
    },
    Increment = 1,
    Suffix = "Walkspeed",
    CurrentValue = 16,
    Flag = "sliderws",
    Callback = function(Value)
        player.Character.Humanoid.WalkSpeed = Value
    end
})
local Slider2 = HomeTab:CreateSlider({
    Name = "JumpPower Slider",
    Range = {
        50,
        400
    },
    Increment = 1,
    Suffix = "Jump Power",
    CurrentValue = 50,
    Flag = "sliderjp",
    Callback = function(Value)
        player.Character.Humanoid.JumpPower = Value
    end
})
local Input = HomeTab:CreateInput({
    Name = "Walkspeed",
    PlaceholderText = "1-500",
    RemoveTextAfterFocusLost = true,
    Callback = function(Text)
        player.Character.Humanoid.WalkSpeed = tonumber(Text) or 16
    end
})
local ThemesSection = HomeTab:CreateSection("Themes Section")
HomeTab:CreateButton({
    Name = "Ocean",
    Callback = function()
        Window.ModifyTheme('Ocean')
    end
})
HomeTab:CreateButton({
    Name = "Bloom",
    Callback = function()
        Window.ModifyTheme('Bloom')
    end
})
HomeTab:CreateButton({
    Name = "Dark Blue",
    Callback = function()
        Window.ModifyTheme('DarkBlue')
    end
})
HomeTab:CreateButton({
    Name = "Amethyst",
    Callback = function()
        Window.ModifyTheme('Amethyst')
    end
})
HomeTab:CreateButton({
    Name = "Serenity",
    Callback = function()
        Window.ModifyTheme('Serenity')
    end
})
local CustomThemesSection = HomeTab:CreateSection("Custom Themes Section")
HomeTab:CreateButton({
    Name = "Outer Space",
    Callback = function()
        Window.ModifyTheme{
            TextColor = Color3.fromRGB(255, 255, 255),
            Background = Color3.fromRGB(0, 0, 0),
            Topbar = Color3.fromRGB(0, 0, 0),
            Shadow = Color3.fromRGB(0, 0, 0),
            NotificationBackground = Color3.fromRGB(0, 0, 0),
            NotificationActionsBackground = Color3.fromRGB(100, 0, 255),
            TabBackground = Color3.fromRGB(0, 0, 0),
            TabStroke = Color3.fromRGB(100, 0, 255),
            TabBackgroundSelected = Color3.fromRGB(50, 0, 133),
            TabTextColor = Color3.fromRGB(255, 255, 255),
            SelectedTabTextColor = Color3.fromRGB(255, 255, 255),
            ElementBackground = Color3.fromRGB(15, 15, 15),
            ElementBackgroundHover = Color3.fromRGB(40, 40, 40),
            SecondaryElementBackground = Color3.fromRGB(0, 0, 0),
            ElementStroke = Color3.fromRGB(150, 150, 150),
            SecondaryElementStroke = Color3.fromRGB(255, 255, 255),
            SliderBackground = Color3.fromRGB(75, 0, 200),
            SliderProgress = Color3.fromRGB(50, 0, 255),
            SliderStroke = Color3.fromRGB(75, 0, 255),
            ToggleBackground = Color3.fromRGB(100, 0, 255),
            ToggleEnabled = Color3.fromRGB(255, 255, 255),
            ToggleDisabled = Color3.fromRGB(255, 255, 255),
            ToggleEnabledStroke = Color3.fromRGB(0, 0, 0),
            ToggleDisabledStroke = Color3.fromRGB(0, 0, 0),
            ToggleEnabledOuterStroke = Color3.fromRGB(0, 0, 0),
            ToggleDisabledOuterStroke = Color3.fromRGB(0, 0, 0),
            DropdownSelected = Color3.fromRGB(100, 0, 255),
            DropdownUnselected = Color3.fromRGB(0, 0, 0),
            InputBackground = Color3.fromRGB(0, 0, 0),
            InputStroke = Color3.fromRGB(100, 0, 255),
            PlaceholderColor = Color3.fromRGB(100, 0, 255)
        }
    end
})
HomeTab:CreateButton({
    Name = "Outer Space [Blue]",
    Callback = function()
        Window.ModifyTheme{
            TextColor = Color3.fromRGB(255, 255, 255),
            Background = Color3.fromRGB(0, 0, 0),
            Topbar = Color3.fromRGB(0, 0, 0),
            Shadow = Color3.fromRGB(0, 0, 0),
            NotificationBackground = Color3.fromRGB(0, 0, 0),
            NotificationActionsBackground = Color3.fromRGB(0, 0, 125),
            TabBackground = Color3.fromRGB(0, 0, 0),
            TabStroke = Color3.fromRGB(0, 0, 255),
            TabBackgroundSelected = Color3.fromRGB(0, 0, 133),
            TabTextColor = Color3.fromRGB(255, 255, 255),
            SelectedTabTextColor = Color3.fromRGB(255, 255, 255),
            ElementBackground = Color3.fromRGB(15, 15, 15),
            ElementBackgroundHover = Color3.fromRGB(40, 40, 40),
            SecondaryElementBackground = Color3.fromRGB(0, 0, 0),
            ElementStroke = Color3.fromRGB(0, 0, 150),
            SecondaryElementStroke = Color3.fromRGB(0, 0, 255),
            SliderBackground = Color3.fromRGB(0, 0, 0),
            SliderProgress = Color3.fromRGB(0, 0, 255),
            SliderStroke = Color3.fromRGB(0, 0, 255),
            ToggleBackground = Color3.fromRGB(0, 0, 130),
            ToggleEnabled = Color3.fromRGB(0, 0, 255),
            ToggleDisabled = Color3.fromRGB(0, 0, 120),
            ToggleEnabledStroke = Color3.fromRGB(0, 0, 140),
            ToggleDisabledStroke = Color3.fromRGB(0, 0, 120),
            ToggleEnabledOuterStroke = Color3.fromRGB(0, 0, 120),
            ToggleDisabledOuterStroke = Color3.fromRGB(0, 0, 90),
            DropdownSelected = Color3.fromRGB(0, 0, 255),
            DropdownUnselected = Color3.fromRGB(0, 0, 0),
            InputBackground = Color3.fromRGB(0, 0, 0),
            InputStroke = Color3.fromRGB(0, 0, 255),
            PlaceholderColor = Color3.fromRGB(0, 0, 255)
        }
    end
})
HomeTab:CreateButton({
    Name = "Outer Space [Red]",
    Callback = function()
        Window.ModifyTheme{
            TextColor = Color3.fromRGB(255, 255, 255),
            Background = Color3.fromRGB(0, 0, 0),
            Topbar = Color3.fromRGB(0, 0, 0),
            Shadow = Color3.fromRGB(0, 0, 0),
            NotificationBackground = Color3.fromRGB(0, 0, 0),
            NotificationActionsBackground = Color3.fromRGB(100, 0, 255),
            TabBackground = Color3.fromRGB(0, 0, 0),
            TabStroke = Color3.fromRGB(255, 0, 0),
            TabBackgroundSelected = Color3.fromRGB(136, 0, 0),
            TabTextColor = Color3.fromRGB(255, 255, 255),
            SelectedTabTextColor = Color3.fromRGB(255, 255, 255),
            ElementBackground = Color3.fromRGB(15, 15, 15),
            ElementBackgroundHover = Color3.fromRGB(40, 40, 40),
            SecondaryElementBackground = Color3.fromRGB(0, 0, 0),
            ElementStroke = Color3.fromRGB(150, 0, 0),
            SecondaryElementStroke = Color3.fromRGB(255, 0, 0),
            SliderBackground = Color3.fromRGB(0, 0, 0),
            SliderProgress = Color3.fromRGB(255, 0, 0),
            SliderStroke = Color3.fromRGB(255, 0, 0),
            ToggleBackground = Color3.fromRGB(130, 0, 0),
            ToggleEnabled = Color3.fromRGB(130, 0, 0),
            ToggleDisabled = Color3.fromRGB(120, 0, 0),
            ToggleEnabledStroke = Color3.fromRGB(140, 0, 0),
            ToggleDisabledStroke = Color3.fromRGB(70, 0, 0),
            ToggleEnabledOuterStroke = Color3.fromRGB(70, 0, 0),
            ToggleDisabledOuterStroke = Color3.fromRGB(40, 0, 0),
            DropdownSelected = Color3.fromRGB(255, 0, 0),
            DropdownUnselected = Color3.fromRGB(0, 0, 0),
            InputBackground = Color3.fromRGB(0, 0, 0),
            InputStroke = Color3.fromRGB(255, 0, 0),
            PlaceholderColor = Color3.fromRGB(255, 0, 0)
        }
    end
})
local MainTab = Window:CreateTab("(🔗) Main")
MainTab:CreateButton({
    Name = "Nameless Admin",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/Nameless-Admin/main/Source.lua"))()
    end
})
MainTab:CreateButton({
    Name = "Infinite Yield",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end
})
MainTab:CreateButton({
    Name = "Rochips Panel",
    Callback = function()
        loadstring(game:HttpGet("https://glot.io/snippets/gzrux646yj/raw/main.ts"))()
        Rayfield:Notify({
            Title = "Rochips Panel",
            Content = "Loading... (Wait 2-30 seconds)",
            Duration = 5
        })
    end
})
MainTab:CreateButton({
    Name = "Hub by Theo",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/JustABaseplateHub.lua"))()
    end
})
MainTab:CreateButton({
    Name = "Cloud hub",
    Callback = function()
        local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
        local versionCloud = "2.0.2"
        local Players = game:GetService("Players")
        local localPlayer = Players.LocalPlayer
        
        local age = localPlayer.AccountAge
        
        local executor = "Failed to get executor name"
        
        if syn then
            executor = "Synapse Z"
        elseif Krnl then
            executor = "Krnl"
        elseif Fluxus then
            executor = "Fluxus"
        elseif getexecutorname then
            executor = (getexecutorname() or getexecutor() or identifyexecutor() or "Cannot Detect Executor")
        end
        
        local Players = game:GetService("Players")
        
        local username = "Failed to get nickname"
        if Players.LocalPlayer then
            username = Players.LocalPlayer.Name
        end
        local Library = loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
        local Window = Library:NewWindow("CloudHub [BETA]")
         
        local MadeWithLove = Window:NewSection("❤️ | Made with love")
        local UpdatesLog = Window:NewSection("⚙️ | Update logs")
        local Credits = Window:NewSection("🤝 | Credits")
        local UserInfo = Window:NewSection("📄 | User info")
        local Tab = Window:NewSection("👍 | Useful")
        local Tab0 = Window:NewSection("🤣 | Fun")
        local Tab02 = Window:NewSection("Notes")
        local Tab04 = Window:NewSection("Fly Scripts")
        local Tab01 = Window:NewSection("UNC/Identity testers")
        local Tab2 = Window:NewSection("Fake IP Grabbers")
        local Tab3 = Window:NewSection("Fake WallHop")
        local Tab4 = Window:NewSection("Other hubs")
        local Tab03 = Window:NewSection("Download exploits")
        local Tab5 = Window:NewSection("Auto clickers")
        Tab04:CreateButton("Invinicible Fly (R6 ONLY)", function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/396abc/Script/refs/heads/main/Fly.lua'))()
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Executed!",
                SubContent = "By BadScriptsMaker",
                Duration = 6
            })
        end)
        Tab04:CreateButton("Fly GUI v4", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/linhmcfake/Script/refs/heads/main/BetterFlyGUI.lua"))()
        
        
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Executed!",
                SubContent = "By BadScriptsMaker",
                Duration = 6
            })
        end)
        
        Tab04:CreateButton("Fly GUI v3", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
        
        
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Executed!",
                SubContent = "By BadScriptsMaker",
                Duration = 6
            })
        end)
        
        UserInfo:CreateButton("Executor: " .. executor, function()
        end)
        
        UserInfo:CreateButton("Username: " .. username, function()
        end)
        
        UserInfo:CreateButton("Account Age: " .. age .. " day(s)", function()
        end)
        
        UserInfo:CreateButton("User profile: Beta tester", function()
        end)
        
        Tab03:CreateButton("Nucleus", function()
        setclipboard("https:/nucleus.rip/")
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Website is copied!\nPaste on your browser.\nKey system: no\nPaid: no",
                SubContent = "https:/nucleus.rip/",
                Duration = 6
            })
        end)
        Tab03:CreateButton("Velocity", function()
        setclipboard("https://getvelocity.live/")
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Website is copied!\nPaste on your browser.\nKey system: no\nPaid: no",
                SubContent = "https://getvelocity.live/",
                Duration = 6
            })
        end)
        Tab03:CreateButton("Solara", function()
        setclipboard("https://getsolara.dev/")
        
        
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Website is copied!\nPaste on your browser.\nKey system: no\nPaid: no",
                SubContent = "https://getsolara.dev/",
                Duration = 6
            })
        end)
        
        Tab03:CreateButton("Xeno", function()
        setclipboard("https://www.xeno.onl/")
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Website is copied!\nPaste on your browser.\nKey system: no\nPaid: no",
                SubContent = "https://www.xeno.onl/",
                Duration = 6
            })
        end)
        
        Tab03:CreateButton("LX63", function()
        setclipboard("https://lx63.xyz/")
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Website is copied!\nPaste on your browser.\nKey system: no\nPaid: no",
                SubContent = "https://lx63.xyz/",
                Duration = 6
            })
        end)
        Tab03:CreateButton("Valex", function()
        setclipboard("https://valex.io/")
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Website is copied!\nPaste on your browser.\nKey system: no\nPaid: no",
                SubContent = "https://valex.io/",
                Duration = 6
            })
        end)
        
        Tab03:CreateButton("Swift", function()
        setclipboard("https://getswift.gg/")
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Website is copied!\nPaste on your browser.\nKey system: yes\nPaid: no",
                SubContent = "https://getswift.gg/",
                Duration = 6
            })
        end)
        
        Tab03:CreateButton("Volcano", function()
        setclipboard("https://volcano.best/")
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Website is copied!\nPaste on your browser.\nKey system: yes\nPaid: no",
                SubContent = "https://volcano.best/",
                Duration = 6
            })
        end)
        
        Tab03:CreateButton("Delta", function()
        setclipboard("https://deltaexploits.gg/")
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Website is copied!\nPaste on your browser.\nKey system: yes\nPaid: no",
                SubContent = "https://deltaexploits.gg/",
                Duration = 6
            })
        end)
        
        Tab03:CreateButton("Codex", function()
        setclipboard("https://codex.lol/")
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Website is copied!\nPaste on your browser.\nKey system: yes\nPaid: no",
                SubContent = "https://codex.lol/",
                Duration = 6
            })
        end)
        
        Tab03:CreateButton("Cryptic", function()
        setclipboard("https://getcryptic.net/")
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Website is copied!\nPaste on your browser.\nKey system: yes\nPaid: no",
                SubContent = "https://getcryptic.net/",
                Duration = 6
            })
        end)
        
        Tab03:CreateButton("Wave", function()
        setclipboard("https://getwave.gg/")
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Website is copied!\nPaste on your browser.\nKey system: yes\nPaid: yes",
                SubContent = "https://getwave.gg/",
                Duration = 6
            })
        end)
        
        Tab03:CreateButton("Zenith", function()
        setclipboard("https://zenith.win/")
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Website is copied!\nPaste on your browser.\nKey system: no\nPaid: yes",
                SubContent = "https://zenith.win/",
                Duration = 6
            })
        end)
        
        Tab03:CreateButton("AWP.GG", function()
        setclipboard("https://buyawp.gg/")
        
        
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Website is copied!\nPaste on your browser.\nKey system: no\nPaid: yes",
                SubContent = "https://buyawp.gg/",
                Duration = 6
            })
        end)
        
        Tab03:CreateButton("DX9WARE", function()
        setclipboard("https://cultofintellect.com/")
        
        
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Website is copied!\nPaste on your browser.\nKey system: no\nPaid: yes",
                SubContent = "https://cultofintellect.com/",
                Duration = 6
            })
        end)
        
        Tab03:CreateButton("Ronin", function()
        setclipboard("https://getronin.xyz/")
        
        
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Website is copied!\nPaste on your browser.\nKey system: no\nPaid: yes",
                SubContent = "https://getronin.xyz/",
                Duration = 6
            })
        end)
        
        Tab03:CreateButton("Sirhurt", function()
        setclipboard("https://sirhurt.net/")
        
        
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Website is copied!\nPaste on your browser.\nKey system: no\nPaid: yes",
                SubContent = "https://sirhurt.net/",
                Duration = 6
            })
        end)
        
        Tab03:CreateButton("Seliware", function()
        setclipboard("https://seliware.com/")
        
        
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Website is copied!\nPaste on your browser.\nKey system: no\nPaid: yes",
                SubContent = "https://seliware.com/",
                Duration = 6
            })
        end)
        
        
        Tab02:CreateButton("Note 1", function()
        
        
        Fluent:Notify({
                Title = "CloudHub",
                Content = "If your executor: Solara, Xeno or other low executors and scripts is not working: NOT dislike a script!\nTry nucleus executor (TESTED) cuz all scripts is working on Nucleus.\nClick 'X' to close a window.",
                SubContent = "Note 1",
                Duration = 1000000000000000000000000
            })
        end)
        
        Tab02:CreateButton("Note 2", function()
        
        
        Fluent:Notify({
                Title = "CloudHub",
                Content = "If your executor: Solara, Xeno or other low executors and some scripts is working: Tell me on script, then im give a message like 'Solara: supported' on scripts.\nClick 'X' to close a window.",
                SubContent = "Note 2",
                Duration = 1000000000000000000000000
            })
        end)
        
        Tab02:CreateButton("Note 3", function()
        
        
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Cloudhub is have scripts: 32 (SOON MORE)!\n\nCloudHub code is have 1000 lines!\n(stupid info frfr)\nClick 'X' to close a window.",
                SubContent = "Note 3",
                Duration = 1000000000000000000000000
            })
        end)
        
        Tab02:CreateButton("Note 4", function()
        
        
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Go to 'Fun' and find funny website with cats :3\nClick 'X' to close a window.",
                SubContent = "Note 3",
                Duration = 1000000000000000000000000
            })
        end)
        
        Tab01:CreateButton("Require Checker", function()
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        
        local executor = getgenv().identifyexecutor and getgenv().identifyexecutor() or "RobloxClientApp"
        
        local function checkRequireSupport()
            local success, result = pcall(function()
                local reqTest = require(game:GetService("ReplicatedStorage"))
            end)
        
            if success then
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "Require Checker",
                    Text = executor .. " supports 'require'",
                    Duration = 8
                })
            else
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "Require Checker",
                    Text = executor .. " does not support 'require'",
                    Duration = 8
                })
            end
        end
        
        checkRequireSupport()
        
        
        
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Executed! Check a message.",
                SubContent = "By BadScriptsMaker",
                Duration = 2
            })
        end)
        
        Tab01:CreateButton("Identity Test (1)", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/InfernusScripts/Executor-Tests/main/Identity/Test.lua"))()
        
        
        
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Executed! Check a developer console.",
                SubContent = "By BadScriptsMaker",
                Duration = 5
            })
        end)
        
        Tab01:CreateButton("Identity Test (2)", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/vvult/HIdentity/refs/heads/main/HIdentity"))()
        
        
        
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Executed! Check a developer console.",
                SubContent = "By BadScriptsMaker",
                Duration = 5
            })
        end)
        
        Tab01:CreateButton("Cherry's Environment Test", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/InfernusScripts/Executor-Tests/refs/heads/main/Environment/Test.lua"))()
        
        
        
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Executed!",
                SubContent = "By BadScriptsMaker",
                Duration = 5
            })
        end)
        
        Tab01:CreateButton("Executor Checker Panel", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RealBatu20/AI-Scripts-2025/refs/heads/main/ExecutorTestsPanel.lua"))()
        
        
        
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Executed! When clicked a button: Open a developer console to see: UNC, sUNC and more.",
                SubContent = "By BadScriptsMaker",
                Duration = 12
            })
        end)
        
        Tab0:CreateButton("Funny cats website :3", function()
        setclipboard("https://www.funnycatpix.com/")
        
        
        
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Copied!\nPaste on your browser.",
                SubContent = "https://www.funnycatpix.com/",
                Duration = 5
            })
        end)
        
        Tab0:CreateButton("Play with cats website :3", function()
        setclipboard("https://cat-bounce.com/")
        
        
        
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Copied!\nPaste on your browser.",
                SubContent = "https://cat-bounce.com/",
                Duration = 5
            })
        end)
        
        Tab0:CreateButton("Play with cats website (2) :3", function()
        setclipboard("https://catleidoscope.sergethew.com/")
        
        
        
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Copied!\nPaste on your browser.",
                SubContent = "https://catleidoscope.sergethew.com/",
                Duration = 5
            })
        end)
        
        Tab0:CreateButton("FE Yeet Gui", function()
        loadstring(game:HttpGet('https://pastebin.com/raw/uFa7Wdq5'))()
        
        
        
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Executed!",
                SubContent = "By BadScriptsMaker",
                Duration = 5
            })
        end)
        
        Tab0:CreateButton("Fake chat (NO FE)", function()
            
        
            Fluent:Notify({
                Title = "CloudHub",
                Content = "Closed script to use a script.\nOn defaultchatsystem it won't show in chat but will show, over the players head.\n(wait 13 sec to auto close a message)",
                SubContent = "Bye bye, " .. username .. "!",
                Duration = 13
            })
        
        local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
        local Window = Library:NewWindow("Fake Chat UI")
        local Section = Window:NewSection("Command Bar")
        
        local Players = game:GetService("Players")
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local TextChatService = game:GetService("TextChatService")
        local ChatService = game:GetService("Chat")
        local LocalPlayer = Players.LocalPlayer
        
        local setthreadlevel = syn and syn.set_thread_identity or set_thread_identity or setidentity or setthreadidentity
        local getthreadlevel = syn and syn.get_thread_identity or get_thread_identity or getidentity or getthreadidentity
        
        local NAME_COLORS = {
            Color3.fromRGB(253, 41, 67),
            Color3.fromRGB(1, 162, 255),
            Color3.fromRGB(2, 184, 87),
            BrickColor.new("Bright violet").Color,
            BrickColor.new("Bright orange").Color,
            BrickColor.new("Bright yellow").Color,
            BrickColor.new("Light reddish violet").Color,
            BrickColor.new("Brick yellow").Color
        }
        
        local function GetNameValue(pName)
            local value = 0
            for i = 1, #pName do
                local c = string.byte(pName:sub(i, i))
                local r = #pName - i + 1
                if #pName % 2 == 1 then r = r - 1 end
                if r % 4 >= 2 then c = -c end
                value += c
            end
            return value
        end
        
        local function nameColor(name)
            return NAME_COLORS[(GetNameValue(name) % #NAME_COLORS) + 1]
        end
        
        local selectedPlayer = "all"
        local dropdownObject
        
        local function getDropdownList()
            local names = { "me", "others", "all" }
            for _, plr in ipairs(Players:GetPlayers()) do
                table.insert(names, plr.Name)
            end
            return names
        end
        
        local function getPlayers(str)
            str = str:lower()
            if str == "me" then return { LocalPlayer }
            elseif str == "others" then
                local t = {}
                for _, v in ipairs(Players:GetPlayers()) do
                    if v ~= LocalPlayer then table.insert(t, v) end
                end
                return t
            elseif str == "all" then
                return Players:GetPlayers()
            else
                for _, p in ipairs(Players:GetPlayers()) do
                    if p.Name:lower():sub(1, #str) == str then
                        return { p }
                    end
                end
            end
            return {}
        end
        
        local function supportsLegacy()
            local s = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
            return s and s:FindFirstChild("OnMessageDoneFiltering")
        end
        
        local function fireLegacyChat(plr, msg)
            local ChatEvents = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
            if not ChatEvents then return end
            local OnMessageDoneFiltering = ChatEvents:FindFirstChild("OnMessageDoneFiltering")
            if not OnMessageDoneFiltering then return end
        
            local old = getthreadlevel()
            setthreadlevel(4)
        
            local data = {
                ID = math.random(),
                FromSpeaker = plr.DisplayName,
                SpeakerUserId = plr.UserId,
                OriginalChannel = "All",
                IsFiltered = true,
                MessageLength = #msg,
                Message = msg,
                MessageType = "Message",
                Time = os.time() + 10,
                ExtraData = {
                    NameColor = nameColor(plr.Name),
                }
            }
        
            firesignal(OnMessageDoneFiltering.OnClientEvent, data)
            setthreadlevel(old)
        
            if plr.Character and plr.Character:FindFirstChild("Head") then
                ChatService:Chat(plr.Character.Head, msg, Enum.ChatColor.White)
            end
        end
        
        local function fireModernChat(plr, msg)
            if plr.Character and plr.Character:FindFirstChild("Head") then
                ChatService:Chat(plr.Character.Head, msg, Enum.ChatColor.White)
            end
        
            local channel = TextChatService:FindFirstChild("TextChannels")
            if channel and channel:FindFirstChild("RBXGeneral") then
                channel.RBXGeneral:DisplaySystemMessage("["..plr.Name.."]: "..msg)
            elseif TextChatService:FindFirstChild("ChatInputBarConfiguration") then
                local inputConfig = TextChatService.ChatInputBarConfiguration
                local targetChannel = inputConfig.TargetTextChannel
                if targetChannel then
                    targetChannel:DisplaySystemMessage("["..plr.Name.."]: "..msg)
                end
            end
        end
        
        local function fakeChat(plr, msg)
            if supportsLegacy() then
                fireLegacyChat(plr, msg)
            else
                fireModernChat(plr, msg)
            end
        end
        
        dropdownObject = Section:CreateDropdown("Select Player", getDropdownList(), 3, function(text)
            selectedPlayer = text
        end)
        
        Players.PlayerAdded:Connect(function()
            dropdownObject:UpdateList(getDropdownList())
        end)
        
        Players.PlayerRemoving:Connect(function()
            dropdownObject:UpdateList(getDropdownList())
        end)
        
        local latestInput = ""
        
        Section:CreateTextbox("Enter Message", function(text)
            latestInput = text
        end)
        
        Section:CreateButton("Send Client", function()
            if latestInput ~= "" then
                for _, p in ipairs(getPlayers(selectedPlayer)) do
                    fakeChat(p, latestInput)
                end
            end
        end)
        
        end)
        
        MadeWithLove:CreateButton("🥚", function()
            
        
            Fluent:Notify({
                Title = "CloudHub",
                Content = "egg?\nand what does it do?",
                SubContent = "secret :)",
                Duration = 7
            })
        
            print("something happened...")
        end)
        
        UpdatesLog:CreateButton("Support me by click a button!", function()
        local TextChatService = game:GetService("TextChatService")
        
        wait(1)
        
        local success, errorMessage = pcall(function()
            TextChatService.TextChannels.RBXGeneral:SendAsync(username .. " uses CloudHub (scriptbl0x)! Use it too!")
        end)
        
        if not success then
            
        
            Fluent:Notify({
                Title = "CloudHub",
                Content = "Failed to type a message!",
                SubContent = "ERROR CODE: MessageNotSended",
                Duration = 7
            })
        else
        
        
        
            Fluent:Notify({
                Title = "CloudHub",
                Content = "Typed message!\nThank you to support me!\n(If tagged, click again)",
                SubContent = "By BadScriptsMaker",
                Duration = 7
            })
        end
        end)
        
        UpdatesLog:CreateButton("1.0.0 (Click for more info)", function()
            
        
            Fluent:Notify({
                Title = "CloudHub",
                Content = "|========= 1.0.0 =========|\n\n(🚀) 1. Released beta version '1.0.0'!\nClick 'X' to close a window.",
                SubContent = "By BadScriptsMaker",
                Duration = 10000000000000000000
            })
        end)
        
        UpdatesLog:CreateButton("2.0.0 (Click for more info)", function()
            
        
            Fluent:Notify({
                Title = "CloudHub",
                Content = "|========= 2.0.0 =========|\n\n(✅) 1. Added:\nDelta keyboard (for mobile)\nSimple Spy\nSimple Spy (SUPPORT SOLARA) AND MORE!\n=-----=\n(✅) 2. Added 3 new exploits:\n=-----=\n(✅) 3. Fixed silly typos and MORE! :3\nClick 'X' to close a window.",
                SubContent = "By BadScriptsMaker",
                Duration = 10000000000000000000
            })
        end)
        
        UpdatesLog:CreateButton("2.0.1 (Click for more info)", function()
            
        
            Fluent:Notify({
                Title = "CloudHub",
                Content = "|========= 2.0.1 =========|\n\n(✅) 1. Fixed a error:\n:1381: attempt to index nil with 'Notify'. Click 'X' to close a window.",
                SubContent = "By BadScriptsMaker",
                Duration = 10000000000000000000
            })
        end)
        
        UpdatesLog:CreateButton("2.0.2 (Click for more info)", function()
            
        
            Fluent:Notify({
                Title = "CloudHub",
                Content = "|========= 2.0.2 =========|\n\n(✅) 1. Fixed silly typos like:\nVersion: 2.0.0 but version is 2.0.1 imao.(✅) 2. Closed reexecute cloudhub: loads old version, not a newest. idk how to fix, can be removed.\nClick 'X' to close a window.",
                SubContent = "By BadScriptsMaker",
                Duration = 10000000000000000000
            })
        end)
        
        Credits:CreateButton("Scriptblox profile", function()
        setclipboard("https://scriptblox.com/u/BadScriptsMaker")
        
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Copied!",
                SubContent = "By BadScriptsMaker",
                Duration = 5
            })
        end)
        
        Credits:CreateButton("Emojis (click)", function()
        
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Emojis is copied on: https://emojicopy.com/",
                SubContent = "https://emojicopy.com/",
                Duration = 5
            })
        end)
        
        Credits:CreateButton("Check a description script", function()
        end)
        
        Tab:CreateButton("CloudHub-Games (click me)", function()
        
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Soon!\nCloudHub-Games = like CloudHub, but creating games tab (like: Brainrot Clicker) and allowing execute a script.\nClick 'X' to close a window.",
                SubContent = "By BadScriptsMaker",
                Duration = 1000000000000000000000000000000000
            })
        end)
        
        Tab:CreateButton("Reexecute 'CloudHub' (FIXING)", function()
        
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Fixing.",
                SubContent = "By BadScriptsMaker",
                Duration = 5
            })
        end)
        
        Tab:CreateButton("Chat Spy", function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Dan41/Roblox-Scripts/refs/heads/main/CHAT%20SPY%20-%202025/ChatSpy2025.lua', true))()
        
        
        
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Executed!",
                SubContent = "By BadScriptsMaker",
                Duration = 5
            })
        end)
        
        Tab:CreateButton("Youtube Player", function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Dan41/Roblox-Scripts/refs/heads/main/Youtube%20Play/1%20YoutubePlay.lua', true))()
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Executed!\nEnjoy a youtube videos!",
                SubContent = "By BadScriptsMaker",
                Duration = 5
            })
        end)
        
        Tab:CreateButton("Infinite Yield", function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Executed!",
                SubContent = "By BadScriptsMaker",
                Duration = 5
            })
        end)
        
        Tab:CreateButton("Delta keyboard", function()
        
        
        
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Executed!\nWait to load.",
                SubContent = "By BadScriptsMaker",
                Duration = 5
            })
        
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Xxtan31/Ata/main/deltakeyboardcrack.txt"))()
        end)
        
        Tab:CreateButton("Simple Spy", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/SimpleSpyV3/main.lua"))()
        
        
        
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Executed!",
                SubContent = "By BadScriptsMaker",
                Duration = 5
            })
        end)
        
        Tab:CreateButton("Simple Spy (FOR SOLARA)\n(NEW)", function()
        local settings = {
            SaveDecompileLogs = true,
            SaveScanLogs = true,
            ScanForNewInstance = true,
            InterceptUntilRan = true,
            CursorOffset = -15,
            PathToDump = {game.Players.LocalPlayer, game:GetService('ReplicatedStorage')}
        
        }
        _G.data = settings
        loadstring(game:HttpGet('https://raw.githubusercontent.com/ScriptSkiddie69/RemoteHook/refs/heads/main/SimpleSpyLite.lua'))()
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Executed!",
                SubContent = "By BadScriptsMaker",
                Duration = 5
            })
        end)
        
        Tab:CreateButton("Sigma Spy", function()
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Executed!\nMay take 10-30 sec to load.\nThis does not work on low end executors such as Solara and Xeno.",
                SubContent = "By BadScriptsMaker",
                Duration = 8
            })
        
        loadstring(game:HttpGet("https://raw.githubusercontent.com/depthso/Sigma-Spy/refs/heads/main/Main.lua"))()
        
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Executed!",
                SubContent = "By BadScriptsMaker",
                Duration = 5
            })
        end)
        
        Tab:CreateButton("Rejoin (Not work on private)", function()
        local player = game.Players.LocalPlayer
        local gamePlaceId = game.PlaceId
        local teleportService = game:GetService("TeleportService")
        teleportService:Teleport(gamePlaceId, player)
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Executed!\nWait to rejoin.",
                SubContent = "By BadScriptsMaker",
                Duration = 5
            })
        end)
        
        Tab:CreateButton("Aimbot", function()
        loadstring(game:HttpGet("https://pastefy.app/LX0Rw3fI/raw"))()
        
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Executed!\nClick 'Rushex OFF'  to on it.\nClick 'Rushex ON'  to off it.",
                SubContent = "By BadScriptsMaker",
                Duration = 5
            })
        end)
        
        Tab:CreateButton("Open developer console", function()
        
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Opened!\n(P.S: if already opened, it does nothing)",
                SubContent = "By BadScriptsMaker",
                Duration = 5
            })
        
        game:GetService("StarterGui"):SetCore("DevConsoleVisible", true)
        end)
        
        Tab:CreateButton("Close developer console", function()
        
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Closed!\n(P.S: if already closed, it does nothing)",
                SubContent = "By BadScriptsMaker",
                Duration = 5
            })
        
        game:GetService("StarterGui"):SetCore("DevConsoleVisible", false)
        end)
        
        Tab:CreateButton("Check safe executor", function()
        
        warn("============ Checker Safe ============")
        if executor == "Nucleus" then
        print("safe executor: likely yes")
        warn("============ Checker Safe ============")
        elseif executor == "KRNL" then
        print("safe executor: yes")
        warn("============ Checker Safe ============")
        elseif executor == "LX63" or executor == "LX.63" then
        print("safe executor: UNKNOWN")
        warn("============ Checker Safe ============")
        elseif executor == "Solara" then
        print("safe executor: yes")
        warn("============ Checker Safe ============")
        elseif executor == "Swift" then
        print("safe executor: likely yes")
        warn("============ Checker Safe ============")
        elseif executor == "Velocity" then
        print("safe executor: yes")
        warn("============ Checker Safe ============")
        elseif executor == "Seliware" then
        print("safe executor: yes")
        warn("============ Checker Safe ============")
        elseif executor == "Potassium" then
        print("safe executor: likely no\nvoxlis.NET has flagged this executor as potentially suspicious and does not recommend its use")
        warn("============ Checker Safe ============")
        elseif executor == "Xeno" then
        print("safe executor: yes")
        warn("============ Checker Safe ============")
        elseif executor == "Wave" then
        print("safe executor: likely yes")
        warn("============ Checker Safe ============")
        elseif executor == "Zenith" then
        print("safe executor: yes")
        warn("============ Checker Safe ============")
        elseif executor == "Volcano" then
        print("safe executor: likely yes")
        warn("============ Checker Safe ============")
        elseif executor == "Valex" then
        print("safe executor: UNKNOWN")
        warn("============ Checker Safe ============")
        elseif executor == "Delta" then
        print("safe executor: yes")
        warn("============ Checker Safe ============")
        elseif executor == "bunni.lol" or executor == "bunni" or executor == "bunnilol" then
        print("safe executor: UNKNOWN")
        warn("============ Checker Safe ============")
        elseif executor == "Crypitc" then
        print("safe executor: yes")
        warn("============ Checker Safe ============")
        elseif executor == "CodeX" then
        print("safe executor: yes")
        elseif executor == "Codex" then
        print("safe executor: yes")
        warn("============ Checker Safe ============")
        elseif executor == "Hydrogen" then
        print("safe executor: yes")
        warn("============ Checker Safe ============")
        elseif executor == "DX9WARE" then
        print("safe executor: yes")
        warn("============ Checker Safe ============")
        elseif executor == "Severe" then
        print("safe executor: yes")
        warn("============ Checker Safe ============")
        elseif executor == "ArceusX" then
        warn("safe executor: no (ratting ppl + scam exit)\n(INFO BY voxlis.net!)\nReleased in 2019, ArceusX was one of the first mobile Roblox executors. In March 2022, @lxnny — owner of Delta — reposted a community warning on WeAreDevs, exposing ArceusX for ratting users and scamming developers. Despite this, it remains widely used. In April 2024, SPDMTeam launched Wave, a Windows executor combining ArceusX and CodeX with an improved UI. While trusted, it’s still owned by the same team involved in past data issues. ArceusX continues to receive regular updates.")
        warn("============ Checker Safe ============")
        elseif executor == "Macsploit" then
        print("safe executor: yes")
        warn("============ Checker Safe ============")
        elseif executor == "Assembly" then
        print("safe executor: yes")
        warn("============ Checker Safe ============")
        elseif executor == "SirHurt" then
        print("safe executor: yes")
        warn("============ Checker Safe ============")
        elseif executor == "Celery" then
        print("safe executor: likely yes")
        warn("============ Checker Safe ============")
        elseif executor == "VegaX" then
        print("safe executor: likely yes")
        warn("============ Checker Safe ============")
        elseif executor == "Zorara" then
        print("safe executor: likely yes")
        warn("============ Checker Safe ============")
        elseif executor == "Aimmy" then
        print("safe executor: yes")
        warn("============ Checker Safe ============")
        elseif executor == "Codex" then
        print("safe executor: yes")
        warn("============ Checker Safe ============")
        elseif executor == "Synapse X" then
        print("safe executor: likely no, reason: if your executor: synapse x is patched how do you using? so safe executor is changed to 'likely no'.")
        elseif executor == "Synapse Z" then
        print("safe executor: yes")
        warn("============ Checker Safe ============")
        elseif executor == "Codex" then
        print("safe executor: yes")
        warn("============ Checker Safe ============")
        elseif executor == "Ronix" then
        print("safe executor: likely no\nThe owner of Ronix—formerly known as Nexam—has a documented history of community warnings and prior involvement in exit scams.")
        warn("============ Checker Safe ============")
        elseif executor == "Evon" then
        warn("safe executor: no\nThe owner of Evon have a installer. all good? no. When evon installer is complete, it paste on auto load. why evon installer need it? okay, let installer on auto load paste on virustotal. and we see a popular stealer token. so, it is malware + stealer. please delete a evon if u want be a save!! (If u think false report, check a video youtube with proof.)")
        warn("============ Checker Safe ============")
        elseif executor == "Atlantis" then
        warn("safe executor: no\nThe owner of atlanits have a rat/malware, but it atlantis is hided a rat/malware so Microsoft's antivirus is not detecting it. im dont know more info on atlantis. check a videos for more info.")
        warn("============ Checker Safe ============")
        elseif executor == "Mooze" then
        warn("safe executor: no\nThe owner of mooze have a malware. im dont know more info on atlantis. check a videos for more info.")
        warn("============ Checker Safe ============")
        
        -- so here started joke exploit checker
        
        elseif executor == "Lovreware" then
        print("safe executor: 💀 (unknown)")
        warn("============ Checker Safe ============")
        elseif executor == "Synapse Mac" then
        print("safe executor: 💀 (unknown)")
        warn("============ Checker Safe ============")
        elseif executor == "Ratware" then
        print("safe executor: 💀 (unknown)")
        warn("============ Checker Safe ============")
        elseif executor == "Skibidi" then
        print("safe executor: 💀 (unknown)")
        warn("============ Checker Safe ============")
        elseif executor == "Luau//CSVM" then
        print("safe executor: 💀 (exploit in-game, yes it safe.)")
        warn("============ Checker Safe ============")
        elseif executor == "Kernel" then
        print("safe executor: 💀 (exploit in-game, yes it safe.)")
        warn("============ Checker Safe ============")
        elseif executor == "c00lkidd" or executor == "c00lkid" then
        print("safe executor: 💀 (unknown)")
        warn("============ Checker Safe ============")
        elseif executor == "NotAVirus" or executor == "NotaVirus" or executor == "Notavirus" or executor == "notaVirus" or executor == "notAvirus" or executor == "NOTAVIRUS" then
        print("safe executor: 💀 (unknown)")
        warn("============ Checker Safe ============")
        elseif executor == "uwu" or executor == "Uwu" or executor == "UwU" or executor == "uWu" or executor == "UWU" then
        print("safe executor: 💀 (unknown)")
        warn("============ Checker Safe ============")
        elseif executor == "sussy baka" or executor == "baka" or "sussy" then
        print("safe executor: 💀 (unknown)")
        warn("============ Checker Safe ============")
        elseif executor == "nigga" or executor == "niggas" or executor == "nigger" or executor == "niggers" then
        print("safe executor: 💀 (unknown)")
        warn("============ Checker Safe ============")
        elseif executor == "UNKNOWN" or executor == "Unknown" or executor == "unknown" or executor == "nan" or executor == "Nan" or executor == "NaN" or executor == "NAN" or executor == " " or executor == "???" or executor == "??" or executor == "?" or executor == "Failed" or executor == "FAILED" or executor == "failed" or executor == "error" or executor == "Error" or executor == "ERROR" or executor == "nil" or executor == "Nil" or executor == "NIL" then
        print("safe executor: ??? (Your exploit/executor is: " .. executor .. ". If do you see 'unknown' or smth, it mean your executor is broken.\ntry reinstall or ignore it.\nbut if typed like: Solara, Celery or your name executor it mean bug. Ignore it.")
        warn("============ Checker Safe ============")
        else
        print("safe executor: error\nreason: no executor detected on checker safe.\nno worry, is that ok")
        warn("============ Checker Safe ============")
        end
        
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Printed. Check a developer console.",
                SubContent = "By BadScriptsMaker",
                Duration = 5
            })
        end)
        
        
        Tab3:CreateButton("WallHop V2", function()
        loadstring(game:HttpGet("https://pastebin.com/raw/am6WTtTU"))()
        
        Fluent:Notify({
                Title = "CloudHub",
                Content = "By BadScriptsMaker\nWorks best in this game:\nhttps://www.roblox.com/games/114292969759085/Utlimate-WallHop-Obby",
                SubContent = "By BadScriptsMaker",
                Duration = 5
            })
        end)
        
        Tab3:CreateButton("WallHop V4", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ScpGuest666/Random-Roblox-script/refs/heads/main/Roblox%20WallHop%20V4%20script"))()
        
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Executed!",
                SubContent = "By BadScriptsMaker",
                Duration = 5
            })
        end)
        
        Tab2:CreateButton("Fake IP Grabber (1)", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/blueEa1532/ipgra/refs/heads/main/fakeipgrab"))()
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Executed!\nRejoin to destroy it.\n(Tagging messages, use auto bypasser if helping.)\n(Use 'Useful' tab to faster rejoin.)",
                SubContent = "By BadScriptsMaker",
                Duration = 5
            })
        end)
        
        Tab2:CreateButton("Fake IP Grabber (2)", function()
        loadstring(game:HttpGet("https://pastebin.com/raw/KcjWBuY6"))()
        
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Executed!\nRejoin to destroy it.\n(Use 'Useful' tab to faster rejoin.)",
                SubContent = "By BadScriptsMaker",
                Duration = 5
            })
        end)
        
        Tab2:CreateButton("Fake IP Grabber (3) (NO FE)\n(NEW)", function()
        loadstring(game:HttpGet("https://pastebin.com/raw/aziWwaw2"))()
        
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Executed!\nRejoin to destroy it.\n(Use 'Useful' tab to faster rejoin.)",
                SubContent = "By BadScriptsMaker",
                Duration = 5
            })
        end)
        
        Tab3:CreateButton("DAVITROLLZ's Fake WallHop", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Davidfhdgfyyfytyttry/DAVITROLLZ-BRASIL/refs/heads/main/Fake%20Wall%20hop"))()
        
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Executed!\nClick 'WallHop (Beta) [Desligado] to on.'",
                SubContent = "By BadScriptsMaker",
                Duration = 5
            })
        end)
        
        Tab4:CreateButton("Fluxus Hub", function()
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Executed!\nKey: bilsr123.\nKeyless: no, ad-free\nEnjoy the other hub!\nWhen entered correct key, click 'X' to close a window.",
                SubContent = "By BadScriptsMaker",
                Duration = 10000000
            })
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Bilsurrr/Fluxus/refs/heads/main/fluxus", true))()
        end)
        
        Tab4:CreateButton("Skibidi Hub", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/aemos2/Skibidihub/refs/heads/main/SkibidiHUB.txt"))()
        
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Executed!\nKeyless: yes\nEnjoy the other hub!",
                SubContent = "By BadScriptsMaker",
                Duration = 8
            })
        end)
        
        Tab4:CreateButton("Idiot Hub", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/IdiotHub/Scripts/main/Loader"))()
        
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Executed!\nKeyless: yes\nEnjoy the other hub!\n(if nothing happening, check a console developer.)",
                SubContent = "By BadScriptsMaker",
                Duration = 8
            })
        end)
        
        Tab4:CreateButton("YARHM Hub", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Joystickplays/psychic-octo-invention/main/yarhm.lua", false))()
        
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Executed!\nKeyless: yes\nEnjoy the other hub!",
                SubContent = "By BadScriptsMaker",
                Duration = 8
            })
        end)
        
        Tab4:CreateButton("Ez Hub", function()
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/debug42O/Ez-Industries-Launcher-Data/master/Launcher.lua'),true))()
        
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Executed!\nKeyless: yes\nEnjoy the other hub!",
                SubContent = "By BadScriptsMaker",
                Duration = 8
            })
        end)
        
        Tab4:CreateButton("Solara Hub (🔑)", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/samuraa1/Solara-Hub/refs/heads/main/Solara%20Hub.lua"))()
        
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Executed!\nKeyless: no\nEnjoy the other hub!",
                SubContent = "By BadScriptsMaker",
                Duration = 8
            })
        end)
        
        Tab4:CreateButton("Cat Hub (🔑)", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ko-res/mino/refs/heads/main/F11"))()
        
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Executed!\nKeyless: no\nEnjoy the other hub!",
                SubContent = "By BadScriptsMaker",
                Duration = 8
            })
        end)
        
        Tab5:CreateButton("Auto clicker (1)", function()
        loadstring(game:HttpGetAsync('https://pastebin.com/raw/WgkcDYUs'))()
        
        
        
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Executed!",
                SubContent = "By BadScriptsMaker",
                Duration = 5
            })
        end)
        
        
        
        print("============ CloudHub ============")
        
        print("complete loaded = true")
        print("not detected errors when loaded = true")
        
        Fluent:Notify({
                Title = "CloudHub",
                Content = "Welcome, " .. username .. "!\nCloudHub made with love!",
                SubContent = "Version: 2.0.0",
                Duration = 7
            })
        
            Fluent:Notify({
                Title = "CloudHub",
                Content = "Executor detected: " .. executor .. "!",
                SubContent = "W executor",
                Duration = 7
            })
        
        warn("============ Checker Safe ============")
        if executor == "Nucleus" then
        print("safe executor: likely yes")
        warn("============ Checker Safe ============")
        elseif executor == "KRNL" then
        print("safe executor: yes")
        warn("============ Checker Safe ============")
        elseif executor == "LX63" or executor == "LX.63" then
        print("safe executor: UNKNOWN")
        warn("============ Checker Safe ============")
        elseif executor == "Solara" then
        print("safe executor: yes")
        warn("============ Checker Safe ============")
        elseif executor == "Swift" then
        print("safe executor: likely yes")
        warn("============ Checker Safe ============")
        elseif executor == "Velocity" then
        print("safe executor: yes")
        warn("============ Checker Safe ============")
        elseif executor == "Seliware" then
        print("safe executor: yes")
        warn("============ Checker Safe ============")
        elseif executor == "Potassium" then
        print("safe executor: likely no\nvoxlis.NET has flagged this executor as potentially suspicious and does not recommend its use")
        warn("============ Checker Safe ============")
        elseif executor == "Xeno" then
        print("safe executor: yes")
        warn("============ Checker Safe ============")
        elseif executor == "Wave" then
        print("safe executor: likely yes")
        warn("============ Checker Safe ============")
        elseif executor == "Zenith" then
        print("safe executor: yes")
        warn("============ Checker Safe ============")
        elseif executor == "Volcano" then
        print("safe executor: likely yes")
        warn("============ Checker Safe ============")
        elseif executor == "Valex" then
        print("safe executor: UNKNOWN")
        warn("============ Checker Safe ============")
        elseif executor == "Delta" then
        print("safe executor: yes")
        warn("============ Checker Safe ============")
        elseif executor == "bunni.lol" or executor == "bunni" or executor == "bunnilol" then
        print("safe executor: UNKNOWN")
        warn("============ Checker Safe ============")
        elseif executor == "Crypitc" then
        print("safe executor: yes")
        warn("============ Checker Safe ============")
        elseif executor == "CodeX" then
        print("safe executor: yes")
        warn("============ Checker Safe ============")
        elseif executor == "Hydrogen" then
        print("safe executor: yes")
        warn("============ Checker Safe ============")
        elseif executor == "DX9WARE" then
        print("safe executor: yes")
        warn("============ Checker Safe ============")
        elseif executor == "Severe" then
        print("safe executor: yes")
        warn("============ Checker Safe ============")
        elseif executor == "ArceusX" then
        warn("safe executor: no (ratting ppl + scam exit)\n(INFO BY voxlis.net!)\nReleased in 2019, ArceusX was one of the first mobile Roblox executors. In March 2022, @lxnny — owner of Delta — reposted a community warning on WeAreDevs, exposing ArceusX for ratting users and scamming developers. Despite this, it remains widely used. In April 2024, SPDMTeam launched Wave, a Windows executor combining ArceusX and CodeX with an improved UI. While trusted, it’s still owned by the same team involved in past data issues. ArceusX continues to receive regular updates.")
        warn("============ Checker Safe ============")
        elseif executor == "Macsploit" then
        print("safe executor: yes")
        warn("============ Checker Safe ============")
        elseif executor == "Assembly" then
        print("safe executor: yes")
        warn("============ Checker Safe ============")
        elseif executor == "SirHurt" then
        print("safe executor: yes")
        warn("============ Checker Safe ============")
        elseif executor == "Celery" then
        print("safe executor: likely yes")
        warn("============ Checker Safe ============")
        elseif executor == "VegaX" then
        print("safe executor: likely yes")
        warn("============ Checker Safe ============")
        elseif executor == "Zorara" then
        print("safe executor: likely yes")
        warn("============ Checker Safe ============")
        elseif executor == "Aimmy" then
        print("safe executor: yes")
        warn("============ Checker Safe ============")
        elseif executor == "Codex" then
        print("safe executor: yes")
        warn("============ Checker Safe ============")
        elseif executor == "Synapse X" then
        print("safe executor: likely no, reason: if your executor: synapse x is patched how do you using? so safe executor is changed to 'likely no'.")
        elseif executor == "Synapse Z" then
        print("safe executor: yes")
        warn("============ Checker Safe ============")
        elseif executor == "Codex" then
        print("safe executor: yes")
        warn("============ Checker Safe ============")
        elseif executor == "Ronix" then
        print("safe executor: likely no\nThe owner of Ronix—formerly known as Nexam—has a documented history of community warnings and prior involvement in exit scams.")
        warn("============ Checker Safe ============")
        elseif executor == "Evon" then
        warn("safe executor: no\nThe owner of Evon have a installer. all good? no. When evon installer is complete, it paste on auto load. why evon installer need it? okay, let installer on auto load paste on virustotal. and we see a popular stealer token. so, it is malware + stealer. please delete a evon if u want be a save!! (If u think false report, check a video youtube with proof.)")
        warn("============ Checker Safe ============")
        elseif executor == "Atlantis" then
        warn("safe executor: no\nThe owner of atlanits have a rat/malware, but it atlantis is hided a rat/malware so Microsoft's antivirus is not detecting it. im dont know more info on atlantis. check a videos for more info.")
        warn("============ Checker Safe ============")
        elseif executor == "Mooze" then
        warn("safe executor: no\nThe owner of mooze have a malware. im dont know more info on atlantis. check a videos for more info.")
        warn("============ Checker Safe ============")
        elseif executor == "Lovreware" then
        print("safe executor: 💀 (unknown)")
        warn("============ Checker Safe ============")
        elseif executor == "Synapse Mac" then
        print("safe executor: 💀 (unknown)")
        warn("============ Checker Safe ============")
        elseif executor == "Ratware" then
        print("safe executor: 💀 (unknown)")
        warn("============ Checker Safe ============")
        elseif executor == "Skibidi" then
        print("safe executor: 💀 (unknown)")
        warn("============ Checker Safe ============")
        elseif executor == "Luau//CSVM" then
        print("safe executor: 💀 (exploit in-game, yes it safe.)")
        warn("============ Checker Safe ============")
        elseif executor == "Kernel" then
        print("safe executor: 💀 (exploit in-game, yes it safe.)")
        warn("============ Checker Safe ============")
        elseif executor == "c00lkidd" or executor == "c00lkid" then
        print("safe executor: 💀 (unknown)")
        warn("============ Checker Safe ============")
        elseif executor == "NotAVirus" or executor == "NotaVirus" or executor == "Notavirus" or executor == "notaVirus" or executor == "notAvirus" or executor == "NOTAVIRUS" then
        print("safe executor: 💀 (unknown)")
        warn("============ Checker Safe ============")
        elseif executor == "uwu" or executor == "Uwu" or executor == "UwU" or executor == "uWu" or executor == "UWU" then
        print("safe executor: 💀 (unknown)")
        warn("============ Checker Safe ============")
        elseif executor == "sussy baka" or executor == "baka" or "sussy" then
        print("safe executor: 💀 (unknown)")
        warn("============ Checker Safe ============")
        elseif executor == "nigga" or executor == "niggas" or executor == "nigger" or executor == "niggers" then
        print("safe executor: 💀 (unknown)")
        warn("============ Checker Safe ============")
        elseif executor == "UNKNOWN" or executor == "Unknown" or executor == "unknown" or executor == "nan" or executor == "Nan" or executor == "NaN" or executor == "NAN" or executor == " " or executor == "???" or executor == "??" or executor == "?" or executor == "Failed" or executor == "FAILED" or executor == "failed" or executor == "error" or executor == "Error" or executor == "ERROR" or executor == "nil" or executor == "Nil" or executor == "NIL" then
        print("safe executor: ??? (Your exploit/executor is: " .. executor .. ". If do you see 'unknown' or smth, it mean your executor is broken.\ntry reinstall or ignore it.\nbut if typed like: Solara, Celery or your name executor it mean bug. Ignore it.")
        warn("============ Checker Safe ============")
        else
        print("safe executor: error\nreason: no executor detected on checker safe.\nno worry, is that ok")
        warn("============ Checker Safe ============")
        end
        
        local TextChatService = game:GetService("TextChatService")
        --/ end code \--
    end
})
MainTab:CreateButton({
    Name = "Pilots hub",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/U1o71wOq/raw"))()
    end
})
MainTab:CreateButton({
    Name = "KaterHub V3",
    Callback = function()
        loadstring(game:HttpGet("https://katerhub-inc.github.io/KaterHub/main.lua"))()
    end
})
local MyTab = Window:CreateTab("(🔗) By Owner")
MyTab:CreateSection("Item-Related")
MyTab:CreateButton({
    Name = "(🎮) Kill GUI",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/Scripts/refs/heads/main/GUIs/Kill.lua"))()
    end
})
MyTab:CreateButton({
    Name = "(🎮) Dupe GUI",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/Scripts/refs/heads/main/GUIs/Dupe.lua"))()
    end
})
MyTab:CreateSection("Reanimation")
MyTab:CreateButton({
    Name = "(🎮) Giant Dance",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/Scripts/main/Dance.lua"))()
    end
})
MyTab:CreateSection("Visuals")
MyTab:CreateButton({
    Name = "Realistic Mode (1st Person)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/Scripts/refs/heads/main/RealisticMode.lua"))()
    end
})
local KeyTab = Window:CreateTab("(🔗) Keyboards")
KeyTab:CreateButton({
    Name = "Delta Keyboard",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/Scripts/main/Keyboards/Delta.lua"))()
    end
})
KeyTab:CreateButton({
    Name = "Virtual Keyboard",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/Scripts/main/Keyboards/Virtual.lua"))()
    end
})
KeyTab:CreateButton({
    Name = "Byte Keyboard",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/Scripts/main/Keyboards/Byte.lua"))()
    end
})
KeyTab:CreateButton({
    Name = "Kilobyte Keyboard",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/Scripts/main/Keyboards/KiloByte.lua"))()
    end
})
KeyTab:CreateButton({
    Name = "Mob Keyboard",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
    end
})
if Place == 88308889239232 or Place == 17574618959 then
    local PdTab = Window:CreateTab("(🎮) PermaDeath")
    PdTab:CreateButton({
        Name = "KDV3 By Theo",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Choose.lua"))()
        end
    })
    PdTab:CreateParagraph({
        Title = "Credits",
        Content = "To the owners of the scripts :D"
    })
    PdTab:CreateSection("Reanimation")
    PdTab:CreateButton({
        Name = "Just a Baseplate reanimation",
        Callback = function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Just-a-baseplate.-Just-A-Baseplate-Working-Reanimation-39126"))()
        end
    })
    PdTab:CreateButton({
        Name = "Currentangle V2",
        Callback = function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-CurrentAngle-V2-Old-46018"))()
        end
    })
    PdTab:CreateButton({
        Name = "Gelatek Reanimation",
        Callback = function()
            local Global = (getgenv and getgenv()) or shared
            Global.GelatekHubConfig = {
                ["Permanent Death"] = true,
                ["Torso Fling"] = false,
                ["Bullet Enabled"] = false,
                ["Enable Collisions"] = false,
                ["Keep Hats On Head"] = true,
                ["Headless On Perma"] = false,
                ["Anti Void"] = false,
                ["Anti Void Offset"] = 75
            }
            
            local function Send(message)
                game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(message)
            end
            
            local Global = (getgenv and getgenv()) or shared;
            local getsynasset = getsynasset or getcustomasset or function()
                warn("no getcustomasset/getsynasset")
            end;
            Global.Notification = function(Title, Text, Duration)
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = Title or "",
                    Text = Text or "",
                    Duration = Duration or 3
                })
            end;
            Global.AntiScript = function()
                local part = Instance.new("Part")
                part.Transparency = 1;
                part.Anchored = true;
                part.CanCollide = false;
                part.Name = "ScriptCheck"
                part.Parent = game:FindFirstChildOfClass("TestService")
            end;
            Global.AlignPart = function(Part0, Part1, Position, Orientation)
                Part0:BreakJoints()
                local Attachment0 = Instance.new("Attachment")
                do
                    Attachment0.Name = "Att0"
                    Attachment0.Position = Position or Vector3.new()
                    Attachment0.Orientation = Orientation or Vector3.new()
                    Attachment0.Parent = Part0
                end;
                local Attachment1 = Instance.new("Attachment")
                do
                    Attachment1.Name = "Att1"
                    Attachment1.Parent = Part1
                end;
                local AlignPosition = Instance.new("AlignPosition")
                do
                    AlignPosition.MaxForce = math.huge;
                    AlignPosition.Responsiveness = 200;
                    AlignPosition.Attachment0 = Attachment0;
                    AlignPosition.Attachment1 = Attachment1;
                    AlignPosition.Parent = Part0
                end;
                local AlignOrientation = Instance.new("AlignOrientation")
                do
                    AlignOrientation.MaxTorque = 387420489;
                    AlignOrientation.Responsiveness = 200;
                    AlignOrientation.Attachment0 = Attachment0;
                    AlignOrientation.Attachment1 = Attachment1;
                    AlignOrientation.Parent = Part0
                end
            end;
            Global.GetLoadLibrary = function()
                function LoadLibrary(a)
                local t = {}
                local string = string
                local math = math
                local table = table
                local error = error
                local tonumber = tonumber
                local tostring = tostring
                local type = type
                local setmetatable = setmetatable
                local pairs = pairs
                local ipairs = ipairs
                local assert = assert
                
                local StringBuilder = {
                    buffer = {}
                }
                 
                function StringBuilder:New()
                    local o = {}
                    setmetatable(o, self)
                    self.__index = self
                    o.buffer = {}
                    return o
                end
                 
                function StringBuilder:Append(s)
                    self.buffer[#self.buffer+1] = s
                end
                 
                function StringBuilder:ToString()
                    return table.concat(self.buffer)
                end
               local JsonWriter = {
                   backslashes = {
                       ['\b'] = "\b",
                       ['\t'] = "\t",
                       ['\n'] = "\n",
                       ['\f'] = "\f",
                       ['\r'] = "\r",
                       ['"']  = "\"",
                       ['\'] = "\",
                       ['/']  = "/"
                   }
               }
                
            
                function JsonWriter:New()
                    local o = {}
                    o.writer = StringBuilder:New()
                    setmetatable(o, self)
                    self.__index = self
                    return o
                end
                 
                function JsonWriter:Append(s)
                    self.writer:Append(s)
                end
                 
                function JsonWriter:ToString()
                    return self.writer:ToString()
                end
                 
                function JsonWriter:Write(o)
                    local t = type(o)
                
                    if t == "nil" then
                        self:WriteNil()
                    elseif t == "boolean" then
                        self:WriteString(o)
                    elseif t == "number" then
                        self:WriteString(o)
                    elseif t == "string" then
                        self:ParseString(o)
                    elseif t == "table" then
                        self:WriteTable(o)
                    elseif t == "function" then
                        self:WriteFunction(o)
                    elseif t == "thread" then
                        self:WriteError(o)
                    elseif t == "userdata" then
                        self:WriteError(o)
                    end
                end
                 
                function JsonWriter:WriteNil()
                    self:Append("null")
                end
                 
                function JsonWriter:WriteString(o)
                    self:Append(tostring(o))
                end
                 
                function JsonWriter:ParseString(s)
                    self:Append('"')
                
                   self:Append(string.gsub(s, "[%z%c\\"/]", function(n)
                       local c = self.backslashes[n]
                   
                       if c then 
                           return c 
                       end
                   
                       return string.format("\u%04X", string.byte(n))
                   end))
                   
                
                    self:Append('"')
                end
                 
                function JsonWriter:IsArray(t)
                    local count = 0
                    local isindex = function(k)
                        if type(k) == "number" and k > 0 then
                            if math.floor(k) == k then
                                return true
                            end
                        end
                
                        return false
                    end
                
                    for k,v in pairs(t) do
                        if not isindex(k) then
                            return false, '{', '}'
                        else
                            count = math.max(count, k)
                        end
                    end
                
                    return true, '[', ']', count
                end
                 
                function JsonWriter:WriteTable(t)
                    local ba, st, et, n = self:IsArray(t)
                    self:Append(st)
                
                    if ba then
                        for i = 1, n do
                            self:Write(t[i])
                
                            if i < n then
                                self:Append(',')
                            end
                        end
                    else
                        local first = true;
                
                        for k, v in pairs(t) do
                            if not first then
                                self:Append(',')
                            end
                
                            first = false;
                
                            self:ParseString(k)
                            self:Append(':')
                            self:Write(v)
                        end
                    end
                
                    self:Append(et)
                end
                 
                function JsonWriter:WriteError(o)
                    error(string.format("Encoding of %s unsupported", tostring(o)))
                end
                
                function JsonWriter:WriteFunction(o)
                    if o == Null then
                        self:WriteNil()
                    else
                        self:WriteError(o)
                    end
                end
                 
                local StringReader = {
                    s = "",
                    i = 0
                }
                 
                function StringReader:New(s)
                    local o = {}
                    setmetatable(o, self)
                    self.__index = self
                    o.s = s or o.s
                    return o
                end
                 
                function StringReader:Peek()
                    local i = self.i + 1
                
                    if i <= #self.s then
                        return string.sub(self.s, i, i)
                    end
                
                    return nil
                end
                 
                function StringReader:Next()
                    self.i = self.i + 1
                
                    if self.i <= #self.s then
                        return string.sub(self.s, self.i, self.i)
                    end
                
                    return nil
                end
                 
                function StringReader:All()
                    return self.s
                end
                 
                local JsonReader = {
                    escapes = {
                        ['t'] = '\t',
                        ['n'] = '\n',
                        ['f'] = '\f',
                        ['r'] = '\r',
                        ['b'] = '\b',
                    }
                }
                 
                function JsonReader:New(s)
                    local o = {}
                    o.reader = StringReader:New(s)
                    setmetatable(o, self)
                    self.__index = self
                    return o;
                end
                 
                function JsonReader:Read()
                    self:SkipWhiteSpace()
                    local peek = self:Peek()
                
                    if peek == nil then
                        error(string.format("Nil string: '%s'", self:All()))
                    elseif peek == '{' then
                        return self:ReadObject()
                    elseif peek == '[' then
                        return self:ReadArray()
                    elseif peek == '"' then
                        return self:ReadString()
                    elseif string.find(peek, "[%+%-%d]") then
                        return self:ReadNumber()
                    elseif peek == 't' then
                        return self:ReadTrue()
                    elseif peek == 'f' then
                        return self:ReadFalse()
                    elseif peek == 'n' then
                        return self:ReadNull()
                    elseif peek == '/' then
                        self:ReadComment()
                        return self:Read()
                    else
                        return nil
                    end
                end
                 
                function JsonReader:ReadTrue()
                    self:TestReservedWord{'t', 'r', 'u', 'e'}
                    return true
                end
                 
                function JsonReader:ReadFalse()
                    self:TestReservedWord{'f', 'a', 'l', 's', 'e'}
                    return false
                end
                 
                function JsonReader:ReadNull()
                    self:TestReservedWord{'n', 'u', 'l', 'l'}
                    return nil
                end
                 
                function JsonReader:TestReservedWord(t)
                    for i, v in ipairs(t) do
                        if self:Next() ~= v then
                            error(string.format("Error reading '%s': %s", table.concat(t), self:All()))
                        end
                    end
                end
                 
                function JsonReader:ReadNumber()
                    local result = self:Next()
                    local peek = self:Peek()
                
                    while peek ~= nil and string.find(peek, "[%+%-%d%.eE]") do
                        result = result .. self:Next()
                        peek = self:Peek()
                    end
                
                    result = tonumber(result)
                
                    if result == nil then
                        error(string.format("Invalid number: '%s'", result))
                    else
                        return result
                    end
                end
                 
                function JsonReader:ReadString()
                    local result = ""
                    assert(self:Next() == '"')
                
                    while self:Peek() ~= '"' do
                        local ch = self:Next()
                
                        if ch == '\' then
                            ch = self:Next()
                
                            if self.escapes[ch] then
                                ch = self.escapes[ch]
                            end
                        end
                
                        result = result .. ch
                    end
                
                    assert(self:Next() == '"')
                
                    local fromunicode = function(m)
                        return string.char(tonumber(m, 16))
                    end
                
                    return string.gsub(result, "u%x%x(%x%x)", fromunicode)
                end
                 
                function JsonReader:ReadComment()
                    assert(self:Next() == '/')
                    local second = self:Next()
                
                    if second == '/' then
                        self:ReadSingleLineComment()
                    elseif second == '*' then
                        self:ReadBlockComment()
                    else
                        error(string.format("Invalid comment: %s", self:All()))
                    end
                end
                 
                function JsonReader:ReadBlockComment()
                    local done = false
                
                    while not done do
                        local ch = self:Next()
                
                        if ch == '*' and self:Peek() == '/' then
                            done = true
                        end
                
                        if not done and ch == '/' and self:Peek() == "*" then
                            error(string.format("Invalid comment: %s, '/*' illegal.", self:All()))
                        end
                    end
                
                    self:Next()
                end
                 
                function JsonReader:ReadSingleLineComment()
                    local ch = self:Next()
                
                    while ch ~= '\r' and ch ~= '\n' do
                        ch = self:Next()
                    end
                end
                 
                function JsonReader:ReadArray()
                    local result = {}
                    assert(self:Next() == '[')
                
                    local done = false
                
                    if self:Peek() == ']' then
                        done = true;
                    end
                
                    while not done do
                        local item = self:Read()
                        result[#result+1] = item
                        self:SkipWhiteSpace()
                
                        if self:Peek() == ']' then
                            done = true
                        end
                
                        if not done then
                            local ch = self:Next()
                
                            if ch ~= ',' then
                                error(string.format("Invalid array: '%s' due to: '%s'", self:All(), ch))
                            end
                        end
                    end
                
                    assert(']' == self:Next())
                    return result
                end
                 
                function JsonReader:ReadObject()
                    local result = {}
                    assert(self:Next() == '{')
                
                    local done = false
                
                    if self:Peek() == '}' then
                        done = true
                    end
                
                    while not done do
                        local key = self:Read()
                
                        if type(key) ~= "string" then
                            error(string.format("Invalid non-string object key: %s", key))
                        end
                
                        self:SkipWhiteSpace()
                        local ch = self:Next()
                
                        if ch ~= ':' then
                            error(string.format("Invalid object: '%s' due to: '%s'", self:All(), ch))
                        end
                
                        self:SkipWhiteSpace()
                
                        local val = self:Read()
                        result[key] = val
                
                        self:SkipWhiteSpace()
                
                        if self:Peek() == '}' then
                            done = true
                        end
                
                        if not done then
                            ch = self:Next()
                
                            if ch ~= ',' then
                                error(string.format("Invalid array: '%s' near: '%s'", self:All(), ch))
                            end
                        end
                    end
                
                    assert(self:Next() == "}")
                    return result
                end
                 
                function JsonReader:SkipWhiteSpace()
                    local p = self:Peek()
                    while p ~= nil and string.find(p, "[%s/]") do
                        if p == '/' then
                            self:ReadComment()
                        else
                            self:Next()
                        end
                
                        p = self:Peek()
                    end
                end
                function JsonReader:Peek()
                    return self.reader:Peek()
                end
                function JsonReader:Next()
                    return self.reader:Next()
                end
                function JsonReader:All()
                    return self.reader:All()
                end
                function Encode(o)
                    local writer = JsonWriter:New()
                    writer:Write(o)
                    return writer:ToString()
                end
                function Decode(s)
                    local reader = JsonReader:New(s)
                    return reader:Read()
                end
                function Null()
                    return Null
                end
                t.DecodeJSON = function(jsonString)
                pcall(function() warn("RbxUtility.DecodeJSON is deprecated, please use Game:GetService('HttpService'):JSONDecode() instead.") end)
                if type(jsonString) == "string" then
                    return Decode(jsonString)
                end
                print("RbxUtil.DecodeJSON expects string argument!")
                return nil
                end
                t.EncodeJSON = function(jsonTable)
                    pcall(function() warn("RbxUtility.EncodeJSON is deprecated, please use Game:GetService('HttpService'):JSONEncode() instead.") end)
                    return Encode(jsonTable)
                end
                t.MakeWedge = function(x, y, z, defaultmaterial)
                    return game:GetService("Terrain"):AutoWedgeCell(x, y, z)
                end
                t.SelectTerrainRegion = function(regionToSelect, color, selectEmptyCells, selectionParent)
                    local terrain = game:GetService("Workspace"):FindFirstChild("Terrain")
                    if not terrain then return end
                    assert(regionToSelect)
                    assert(color)
                    if not type(regionToSelect) == "Region3" then
                        error("regionToSelect (first arg), should be of type Region3, but is type", type(regionToSelect))
                    end
                    if not type(color) == "BrickColor" then
                        error("color (second arg), should be of type BrickColor, but is type", type(color))
                    end
                    local GetCell = terrain.GetCell
                    local WorldToCellPreferSolid = terrain.WorldToCellPreferSolid
                    local CellCenterToWorld = terrain.CellCenterToWorld
                    local emptyMaterial = Enum.CellMaterial.Empty
                    local selectionContainer = Instance.new("Model")
                    selectionContainer.Name = "SelectionContainer"
                    selectionContainer.Archivable = false
                    if selectionParent then
                        selectionContainer.Parent = selectionParent
                    else
                        selectionContainer.Parent = game:GetService("Workspace")
                    end
                    local updateSelection = nil -- function we return to allow user to update selection
                    local currentKeepAliveTag = nil -- a tag that determines whether adorns should be destroyed
                    local aliveCounter = 0 -- helper for currentKeepAliveTag
                    local lastRegion = nil -- used to stop updates that do nothing
                    local adornments = {} -- contains all adornments
                    local reusableAdorns = {}
                    local selectionPart = Instance.new("Part")
                    selectionPart.Name = "SelectionPart"
                    selectionPart.Transparency = 1
                    selectionPart.Anchored = true
                    selectionPart.Locked = true
                    selectionPart.CanCollide = false
                    selectionPart.Size = Vector3.new(4.2, 4.2, 4.2)
                    local selectionBox = Instance.new("SelectionBox")
                    local function Region3ToRegion3int16(region3)
                        local theLowVec = region3.CFrame.p - (region3.Size/2) + Vector3.new(2, 2, 2)
                        local lowCell = WorldToCellPreferSolid(terrain,theLowVec)
                        local theHighVec = region3.CFrame.p + (region3.Size/2) - Vector3.new(2, 2, 2)
                        local highCell = WorldToCellPreferSolid(terrain, theHighVec)
                        local highIntVec = Vector3int16.new(highCell.x, highCell.y, highCell.z)
                        local lowIntVec = Vector3int16.new(lowCell.x, lowCell.y, lowCell.z)
                        return Region3int16.new(lowIntVec, highIntVec)
                    end
                    function createAdornment(theColor)
                        local selectionPartClone = nil
                        local selectionBoxClone = nil
                        if #reusableAdorns > 0 then
                            selectionPartClone = reusableAdorns[1]["part"]
                            selectionBoxClone = reusableAdorns[1]["box"]
                            table.remove(reusableAdorns,1)
                             
                            selectionBoxClone.Visible = true
                        else
                            selectionPartClone = selectionPart:Clone()
                            selectionPartClone.Archivable = false
                             
                            selectionBoxClone = selectionBox:Clone()
                            selectionBoxClone.Archivable = false
                             
                            selectionBoxClone.Adornee = selectionPartClone
                            selectionBoxClone.Parent = selectionContainer
                             
                            selectionBoxClone.Adornee = selectionPartClone
                             
                            selectionBoxClone.Parent = selectionContainer
                        end
                        if theColor then
                            selectionBoxClone.Color = theColor
                        end
                        return selectionPartClone, selectionBoxClone
                    end
                    function cleanUpAdornments()
                        for cellPos, adornTable in pairs(adornments) do
                            if adornTable.KeepAlive ~= currentKeepAliveTag then -- old news, we should get rid of this
                                adornTable.SelectionBox.Visible = false
                                table.insert(reusableAdorns, {part = adornTable.SelectionPart, box = adornTable.SelectionBox})
                                adornments[cellPos] = nil
                            end
                        end
                    end
                    function incrementAliveCounter()
                        aliveCounter = aliveCounter + 1
                        if aliveCounter > 1000000 then
                            aliveCounter = 0
                        end
                        return aliveCounter
                    end
                    function adornFullCellsInRegion(region, color)
                        local regionBegin = region.CFrame.p - (region.Size/2) + Vector3.new(2, 2, 2)
                        local regionEnd = region.CFrame.p + (region.Size/2) - Vector3.new(2, 2, 2)
                        local cellPosBegin = WorldToCellPreferSolid(terrain, regionBegin)
                        local cellPosEnd = WorldToCellPreferSolid(terrain, regionEnd)
                        currentKeepAliveTag = incrementAliveCounter()
                        for y = cellPosBegin.y, cellPosEnd.y do
                            for z = cellPosBegin.z, cellPosEnd.z do
                                for x = cellPosBegin.x, cellPosEnd.x do
                                    local cellMaterial = GetCell(terrain, x, y, z)
                                    if cellMaterial ~= emptyMaterial then
                                        local cframePos = CellCenterToWorld(terrain, x, y, z)
                                        local cellPos = Vector3int16.new(x,y,z)
                                        local updated = false
                                        for cellPosAdorn, adornTable in pairs(adornments) do
                                            if cellPosAdorn == cellPos then
                                                adornTable.KeepAlive = currentKeepAliveTag
                                            if color then
                                                adornTable.SelectionBox.Color = color
                                            end
                                            updated = true
                                            break
                                        end
                                    end
                                    if not updated then
                                        local selectionPart, selectionBox = createAdornment(color)
                                        selectionPart.Size = Vector3.new(4, 4, 4)
                                        selectionPart.CFrame = CFrame.new(cframePos)
                                        local adornTable = {SelectionPart = selectionPart, SelectionBox = selectionBox, KeepAlive = currentKeepAliveTag}
                                        adornments[cellPos] = adornTable
                                    end
                                end
                            end
                        end
                    end
                cleanUpAdornments()
                end
                lastRegion = regionToSelect
                if selectEmptyCells then
                    local selectionPart, selectionBox = createAdornment(color)
                    selectionPart.Size = regionToSelect.Size
                    selectionPart.CFrame = regionToSelect.CFrame
                    adornments.SelectionPart = selectionPart
                    adornments.SelectionBox = selectionBox
                    updateSelection = function (newRegion, color)
                        if newRegion and newRegion ~= lastRegion then
                            lastRegion = newRegion
                            selectionPart.Size = newRegion.Size
                            selectionPart.CFrame = newRegion.CFrame
                        end
                
                        if color then
                            selectionBox.Color = color
                        end
                    end
                else
                    adornFullCellsInRegion(regionToSelect, color)
                    updateSelection = function (newRegion, color)
                        if newRegion and newRegion ~= lastRegion then
                            lastRegion = newRegion
                            adornFullCellsInRegion(newRegion, color)
                        end
                    end
                end
                local destroyFunc = function()
                    updateSelection = nil
                    if selectionContainer then selectionContainer:Destroy() end
                        adornments = nil
                    end
                    return updateSelection, destroyFunc
                end
                function t.CreateSignal()
                    local this = {}
                    local mBindableEvent = Instance.new('BindableEvent')
                    local mAllCns = {}
                    function this:Connect(func)
                        if self ~= this then error("connect must be called with `:`, not `.`", 2) end
                        if type(func) ~= 'function' then
                            error("Argument #1 of connect must be a function, got a "..type(func), 2)
                        end
                        local cn = mBindableEvent.Event:Connect(func)
                        mAllCns[cn] = true
                        local pubCn = {}
                        function pubCn:Disconnect()
                            cn:Disconnect()
                            mAllCns[cn] = nil
                        end
                        pubCn.Disconnect = pubCn.disconnect
                        return pubCn
                    end
                    function this:Disconnect()
                        if self ~= this then error("disconnect must be called with `:`, not `.`", 2) end
                        for cn, _ in pairs(mAllCns) do
                            cn:Disconnect()
                            mAllCns[cn] = nil
                        end
                    end
                    function this:wait()
                        if self ~= this then error("wait must be called with `:`, not `.`", 2) end
                        return mBindableEvent.Event:Wait()
                    end
                    function this:fire(...)
                        if self ~= this then error("fire must be called with `:`, not `.`", 2) end
                        mBindableEvent:Fire(...)
                    end
                    this.Connect = this.connect
                    this.Disconnect = this.disconnect
                    this.Wait = this.wait
                    this.Fire = this.fire
                    return this
                end
                local function Create_PrivImpl(objectType)
                    if type(objectType) ~= 'string' then
                        error("Argument of Create must be a string", 2)
                    end
                    return function(dat)
                        dat = dat or {}
                        local obj = Instance.new(objectType)
                        local parent = nil
                        local ctor = nil
                        for k, v in pairs(dat) do
                            if type(k) == 'string' then
                                if k == 'Parent' then
                                    parent = v
                                else
                                    obj[k] = v
                                end
                            elseif type(k) == 'number' then
                                if type(v) ~= 'userdata' then
                                    error("Bad entry in Create body: Numeric keys must be paired with children, got a: "..type(v), 2)
                                end
                                v.Parent = obj
                            elseif type(k) == 'table' and k.__eventname then
                                if type(v) ~= 'function' then
                                    error("Bad entry in Create body: Key `[Create.E\'"..k.__eventname.."\']` must have a function value\
                                        got: "..tostring(v), 2)
                                end
                                obj[k.__eventname]:Connect(v)
                            elseif k == t.Create then
                                if type(v) ~= 'function' then
                                    error("Bad entry in Create body: Key `[Create]` should be paired with a constructor function, \
                                        got: "..tostring(v), 2)
                                elseif ctor then
                                    error("Bad entry in Create body: Only one constructor function is allowed", 2)
                                end
                
                                ctor = v
                            else
                                error("Bad entry ("..tostring(k).." => "..tostring(v)..") in Create body", 2)
                            end
                        end
                        if ctor then
                            ctor(obj)
                        end
                
                        if parent then
                            obj.Parent = parent
                        end
                        return obj
                    end
                end
                t.Create = setmetatable({}, {__call = function(tb, ...) return Create_PrivImpl(...) end})
                t.Create.E = function(eventName)
                    return {__eventname = eventName}
                end
                t.Help =
                function(funcNameOrFunc)
                if funcNameOrFunc == "DecodeJSON" or funcNameOrFunc == t.DecodeJSON then
                return "Function DecodeJSON. "
                end
                if funcNameOrFunc == "EncodeJSON" or funcNameOrFunc == t.EncodeJSON then
                return "Function EncodeJSON. "
                end
                if funcNameOrFunc == "MakeWedge" or funcNameOrFunc == t.MakeWedge then
                return "Function MakeWedge. " 
                end
                if funcNameOrFunc == "SelectTerrainRegion" or funcNameOrFunc == t.SelectTerrainRegion then
                return "Function SelectTerrainRegion. " 
                end
                if funcNameOrFunc == "CreateSignal" or funcNameOrFunc == t.CreateSignal then
                return "Function CreateSignal. "
                end
                if funcNameOrFunc == "Signal:connect" then
                return "Method Signal:connect. "
                end
                if funcNameOrFunc == "Signal:wait" then
                return "Method Signal:wait. "
                end
                if funcNameOrFunc == "Signal:fire" then
                return "Method Signal:fire. "
                end
                if funcNameOrFunc == "Signal:disconnect" then
                return "Method Signal:disconnect. "
                end
                if funcNameOrFunc == "Create" then
                return "Function Create. "
                end
                end
                return t
                end
                
            end;
            Global.StopScript = function()
                if game:GetService("Players").LocalPlayer.Character.Name ~= "GelatekReanimate" then
                    Notification("Not Reanimated")
                    error("Not Reanimated")
                end;
                local Global = (getgenv and getgenv()) or shared;
                Global.PartDisconnected = false;
                local function CreateJoint(Name, Part0, Part1, C0, C1)
                    local Joint = Instance.new("Motor6D")
                    Joint.Parent = Part0;
                    Joint.Name = Name;
                    Joint.Part0 = Part0;
                    Joint.Part1 = Part1;
                    Joint.C0 = C0;
                    Joint.C1 = C1
                end;
                Global.Stopped = true;
                for i, v in pairs(Global.TableOfEvents) do
                    v:Disconnect()
                end;
                local Figure = workspace:WaitForChild("GelatekReanimate")
                local Character = Figure:FindFirstChild(game:FindFirstChildOfClass("Players").LocalPlayer.Name)
                local TestServ = game:GetService("TestService")
                local Humanoid = Figure:FindFirstChildOfClass("Humanoid")
                for _, v in pairs(Humanoid:GetChildren()) do
                    if v:IsA("Animator") then
                        v:Destroy()
                    end;
                    local NewAnimator = Instance.new("Animator", Humanoid)
                end;
                if not Figure:FindFirstChild("Animate") then
                    local Script = Instance.new("LocalScript")
                    Script.Name = "Animate"
                    Script.Parent = Figure
                end;
                Humanoid.Name = "Humanoid"
                Humanoid.WalkSpeed = 16;
                Humanoid.JumpPower = 50;
                Humanoid.AutoRotate = true;
                Humanoid.HipHeight = 0;
                Humanoid.MaxHealth = 100;
                Humanoid.Health = 100;
                Humanoid.CameraOffset = Vector3.new()
                workspace.CurrentCamera.FieldOfView = 70;
                for _, v in pairs(Figure:GetChildren()) do
                    if v.ClassName ~= "Accessory" and v.Name ~= game.Players.LocalPlayer.Name and v.Name ~= "Head" and v.Name ~= "Torso" and v.Name ~= "Right Arm" and v.Name ~= "Left Arm" and v.Name ~= "Right Leg" and v.Name ~= "Left Leg" and v.Name ~= "HumanoidRootPart" and v.Name ~= "Humanoid" and v.Name ~= "BodyColors" and v.Name ~= "Pants" and v.Name ~= "Shirt" and v.Name ~= "Animate" then
                        v:Destroy()
                    end
                end;
                local Head, Torso, Root = Figure.Head, Figure.Torso, Figure.HumanoidRootPart;
                local RA, LA, RL, LL = Figure["Right Arm"], Figure["Left Arm"], Figure["Right Leg"], Figure["Left Leg"]
                Root.Anchored = true;
                for _, v in pairs(Head:GetDescendants()) do
                    if v:IsA("BillboardGui") then
                        v:Destroy()
                    end
                end;
                for _, v in pairs(Torso:GetDescendants()) do
                    if v:IsA("Motor6D") then
                        v:Destroy()
                    end;
                    if v:IsA("PointLight") then
                        v:Destroy()
                    end;
                    if v:IsA("Weld") then
                        v:Destroy()
                    end;
                    if v:IsA("ManualWeld") then
                        v:Destroy()
                    end;
                    if v:IsA("Sound") then
                        v:Destroy()
                    end
                end;
                for _, v in pairs(Head:GetDescendants()) do
                    if v:IsA("Motor6D") then
                        v:Destroy()
                    end;
                    if v:IsA("PointLight") then
                        v:Destroy()
                    end;
                    if v:IsA("Weld") then
                        v:Destroy()
                    end;
                    if v:IsA("ManualWeld") then
                        v:Destroy()
                    end;
                    if v:IsA("Sound") then
                        v:Destroy()
                    end
                end;
                Root:BreakJoints()
                CreateJoint("Neck", Torso, Head, CFrame.new(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, 0), CFrame.new(0, -0.5, 0, -1, 0, 0, 0, 0, 1, 0, 1, 0))
                CreateJoint("RootJoint", Root, Torso, CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, 0), CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, 0))
                CreateJoint("Right Shoulder", Torso, RA, CFrame.new(1, 0.5, 0, 0, 0, 1, 0, 1, 0, -1, 0, 0), CFrame.new(-0.5, 0.5, 0, 0, 0, 1, 0, 1, 0, -1, 0, 0))
                CreateJoint("Left Shoulder", Torso, LA, CFrame.new(-1, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0), CFrame.new(0.5, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0))
                CreateJoint("Right Hip", Torso, RL, CFrame.new(1, -1, 0, 0, 0, 1, 0, 1, 0, -1, 0, 0), CFrame.new(0.5, 1, 0, 0, 0, 1, 0, 1, 0, -1, 0, 0))
                CreateJoint("Left Hip", Torso, LL, CFrame.new(-1, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0), CFrame.new(-0.5, 1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0))
                for i, v in pairs(Figure:GetChildren()) do
                    if v:IsA("Accessory") then
                        if v.Handle:FindFirstChildOfClass("Weld") then
                            v.Handle:FindFirstChildOfClass("Weld"):Destroy()
                        end;
                        for i2, v2 in pairs(v.Handle:GetDescendants()) do
                            if v2:IsA("AlignPosition") or v2:IsA("AlignOrientation") or v2.Name == "Att0" then
                                v2:Destroy()
                            end
                        end
                    end
                end;
                local Hats = TestServ:FindFirstChild("FakeHats")
                for i, v in pairs(Hats:GetChildren()) do
                    local FakeWeld = v.Handle:FindFirstChild("AccessoryWeld"):Clone()
                    FakeWeld.Part0 = Figure:FindFirstChild(v.Name).Handle;
                    FakeWeld.Part1 = Figure:FindFirstChild(FakeWeld.Part1.Name)
                    FakeWeld.Parent = Figure:FindFirstChild(v.Name).Handle
                end;
                if game:FindFirstChildOfClass("TestService"):FindFirstChild("ScriptCheck") then
                    game:FindFirstChildOfClass("TestService"):FindFirstChild("ScriptCheck"):Destroy()
                end;
                if Character:FindFirstChild("Bullet") then
                    local blt = Character:FindFirstChild("Bullet")
                    if blt:FindFirstChild("Flinger") then
                        blt:FindFirstChild("Flinger"):Destroy()
                    end;
                    if blt:FindFirstChild("Movement") then
                        blt:FindFirstChild("Movement"):Destroy()
                    end
                end;
                task.wait(0.125)
                Global.Stopped = false;
                Root.Anchored = false;
                Root.CFrame = Root.CFrame * CFrame.new(0, 5, 0)
            end;
            Global.PlayAnimation = function(ID, AudioPath)
                if game:GetService("Players").LocalPlayer.Character.Name ~= "GelatekReanimate" then
                    Notification("Not Reanimated")
                    error("Not Reanimated")
                end;
                if game:FindFirstChildOfClass("TestService"):FindFirstChild("ScriptCheck") then
                    StopScript()
                end;
                local Character = game.Players.LocalPlayer.Character;
                Character["Humanoid"].WalkSpeed = 8;
                local CurrentID = ID;
                local Sexys = game:GetObjects("rbxassetid://" .. tostring(CurrentID))[1]
                local sexy = Sexys;
                sexy.Name = "AnimPlayer"
                sexy.Parent = Character;
                Global.AntiScript()
                task.wait(1)
                local Torso = Character:WaitForChild("Torso")
                local N, RJ = Torso["Neck"], Character["HumanoidRootPart"]["RootJoint"]
                local RS, LS = Torso["Right Shoulder"], Torso["Left Shoulder"]
                local RH, LH = Torso["Right Hip"], Torso["Left Hip"]
                local Frames = {}
                local Positions = {}
                local Sound = Instance.new("Sound")
                Sound.Parent = Character.Torso;
                Sound.Looped = true;
                Sound.Name = "Music"
                Sound.Volume = 1;
                if AudioPath then
                    pcall(function()
                        Sound.SoundId = getsynasset(AudioPath)
                    end)
                    Sound:Play()
                end;
                for i, v in pairs(sexy:GetChildren()) do
                    table.insert(Frames, v.Time)
                    Positions[v.Time] = {}
                    for _, g in pairs(v:GetDescendants()) do
                        g.Parent = v;
                        table.insert(Positions[v.Time], g)
                    end
                end;
                if Character.Humanoid:FindFirstChild("Animator") then
                    Character.Humanoid.Animator:Destroy()
                end;
                while true do
                    if Global.Stopped == true then
                        break
                    end;
                    for i, v in pairs(Frames) do
                        task.spawn(function()
                            if Global.Stopped == true then
                                return
                            end;
                            if Frames[i - 1] then
                                task.wait(Frames[i - 1])
                            end;
                            for i2, v2 in pairs(Positions[v]) do
                                if v2.Name == "Right Arm" then
                                    RS.Transform = v2.CFrame
                                end;
                                if v2.Name == "Left Arm" then
                                    LS.Transform = v2.CFrame
                                end;
                                if v2.Name == "Right Leg" then
                                    RH.Transform = v2.CFrame
                                end;
                                if v2.Name == "Left Leg" then
                                    LH.Transform = v2.CFrame
                                end;
                                if v2.Name == "Torso" then
                                    RJ.Transform = v2.CFrame
                                end;
                                if v2.Name == "Head" then
                                    N.Transform = v2.CFrame
                                end
                            end
                        end)
                    end;
                    task.wait(Frames[#Frames])
                end;
                Sound:Destroy()
                Sexys:Destroy()
            end
            local RunService = Game:GetService("RunService")
            local StartGui = Game:GetService("StarterGui")
            local TestService = Game:GetService("TestService")
            local Workspace = Game:GetService("Workspace")
            local Players = Game:GetService("Players")
            local PreSim = RunService.PreSimulation;
            local PostSim = RunService.PostSimulation;
            local CurrentCam = Workspace.CurrentCamera;
            local Speed = tick()
            local Infinite = math.huge;
            local V3new = Vector3.new;
            local INew = Instance.new;
            local CFNew = CFrame.new;
            local CFAngles = CFrame.Angles;
            local MathRandom = math.random;
            local Insert = table.insert;
            local Clear = table.clear;
            local Type = type;
            local Global = (getgenv and getgenv()) or shared;
            if not Global.GelatekHubConfig then
                Global.GelatekHubConfig = {}
            end;
            local PermanentDeath = Global.GelatekHubConfig["Permanent Death"] or false;
            local CollideFling = Global.GelatekHubConfig["Torso Fling"] or false;
            local BulletEnabled = Global.GelatekHubConfig["Bullet Enabled"] or false;
            local KeepHairWelds = Global.GelatekHubConfig["Keep Hats On Head"] or false;
            local HeadlessPerma = Global.GelatekHubConfig["Headless On Perma"] or false;
            local DisableAnimations = Global.GelatekHubConfig["Disable Anims"] or false;
            local Collisions = Global.GelatekHubConfig["Enable Collisions"] or false;
            local AntiVoid = Global.GelatekHubConfig["Anti Void"] or false;
            if CollideFling and BulletEnabled then
                CollideFling = false
            end;
            if not Global.TableOfEvents then
                Global.TableOfEvents = {}
            end;
            local Player = Players.LocalPlayer;
            local Character = Player.Character;
            if Character.Name == "GelatekReanimate" then
                error("Reanimation Already Working")
            end;
            if (not Character:FindFirstChildOfClass("Humanoid")) or Character:FindFirstChildOfClass("Humanoid").Health == 0 then
                error("Player Is Dead.")
            end;
            local PlayerDied = false;
            local IGNORETORSOCHECK = "Torso"
            local Is_NetworkOwner = isnetworkowner or function(Part)
                return Part.ReceiveAge == 0
            end;
            local HiddenProps = sethiddenproperty or function()
            end;
            local SpawnPoint = Workspace:FindFirstChildOfClass("SpawnLocation", true) and Workspace:FindFirstChildOfClass("SpawnLocation", true) or CFrame.new(0, 20, 0)
            local PostSimEvent;
            local PreSimEvent;
            local TorsoFlingEvent;
            local DeathEvent;
            local ResetEvent;
            local BulletInfo = nil;
            local HatData = nil;
            local CF0 = CFNew(0, 0, 0)
            local Velocity = V3new(0, -26, 0)
            Global.PartDisconnected = false;
            local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
            if not Humanoid then
                return
            end;
            local RootPart = Character:FindFirstChild("HumanoidRootPart")
            local R15 = Humanoid.RigType.Name == "R15" and true or false;
            local Sin, Cos, Inf, Clamp, Clock = math.sin, math.cos, math.huge, math.clamp, os.clock;
            local FakeHats = INew("Folder")
            do
                FakeHats.Name = "FakeHats"
                FakeHats.Parent = TestService
            end;
            Character.Archivable = true;
            Humanoid:ChangeState(16)
            for Index, RagdollStuff in pairs(Character:GetDescendants()) do
                if RagdollStuff:IsA("BallSocketConstraint") or RagdollStuff:IsA("HingeConstraint") then
                    RagdollStuff:Destroy()
                end
            end;
            local HatsNames = {}
            for Index, Accessory in pairs(Character:GetDescendants()) do
                if Accessory:IsA("Accessory") then
                    if HatsNames[Accessory.Name] then
                        if HatsNames[Accessory.Name] == "Unknown" then
                            HatsNames[Accessory.Name] = {}
                        end;
                        Insert(HatsNames[Accessory.Name], Accessory)
                    else
                        HatsNames[Accessory.Name] = "Unknown"
                    end
                end
            end;
            for Index, Tables in pairs(HatsNames) do
                if Type(Tables) == "table" then
                    local Number = 1;
                    for Index2, Names in ipairs(Tables) do
                        Names.Name = Names.Name .. Number;
                        Number = Number + 1
                    end
                end
            end;
            Clear(HatsNames)
            local Figure = INew("Model")
            do
                local Limbs = {}
                local Attachments = {}
                local function CreateJoint(Name, Part0, Part1, C0, C1)
                    local Joint = INew("Motor6D")
                    Joint.Name = Name;
                    Joint.Part0 = Part0;
                    Joint.Part1 = Part1;
                    Joint.C0 = C0;
                    Joint.C1 = C1;
                    Joint.Parent = Part0
                end;
                for i = 0, 18 do
                    local Attachment = INew("Attachment")
                    Attachment.Axis, Attachment.SecondaryAxis = V3new(1, 0, 0), V3new(0, 1, 0)
                    Insert(Attachments, Attachment)
                end;
                for i = 0, 3 do
                    local Limb = INew("Part")
                    Limb.Size = V3new(1, 2, 1)
                    Limb.CanCollide = false;
                    Limb.Parent = Figure;
                    Insert(Limbs, Limb)
                end;
                Limbs[1].Name = "Right Arm"
                Limbs[2].Name = "Left Arm"
                Limbs[3].Name = "Right Leg"
                Limbs[4].Name = "Left Leg"
                local Head = INew("Part")
                Head.Size = V3new(2, 1, 1)
                Head.Locked = true;
                Head.CanCollide = false;
                Head.Name = "Head"
                Head.Parent = Figure;
                local Torso = INew("Part")
                Torso.Size = V3new(2, 2, 1)
                Torso.Locked = true;
                Torso.CanCollide = false;
                Torso.Name = "Torso"
                Torso.Parent = Figure;
                local Root = Torso:Clone()
                Root.Transparency = 1;
                Root.Name = "HumanoidRootPart"
                Root.Parent = Figure;
                CreateJoint("Neck", Torso, Head, CFNew(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, 0), CFNew(0, -0.5, 0, -1, 0, 0, 0, 0, 1, 0, 1, 0))
                CreateJoint("RootJoint", Root, Torso, CFNew(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, 0), CFNew(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, 0))
                CreateJoint("Right Shoulder", Torso, Limbs[1], CFNew(1, 0.5, 0, 0, 0, 1, 0, 1, 0, -1, 0, 0), CFNew(-0.5, 0.5, 0, 0, 0, 1, 0, 1, 0, -1, 0, 0))
                CreateJoint("Left Shoulder", Torso, Limbs[2], CFNew(-1, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0), CFNew(0.5, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0))
                CreateJoint("Right Hip", Torso, Limbs[3], CFNew(1, -1, 0, 0, 0, 1, 0, 1, 0, -1, 0, 0), CFNew(0.5, 1, 0, 0, 0, 1, 0, 1, 0, -1, 0, 0))
                CreateJoint("Left Hip", Torso, Limbs[4], CFNew(-1, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0), CFNew(-0.5, 1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0))
                local Humanoid = INew("Humanoid")
                Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
                Humanoid.Parent = Figure;
                local Animator = INew("Animator", Humanoid)
                local HumanoidDescription = INew("HumanoidDescription", Humanoid)
                local HeadMesh = INew("SpecialMesh")
                HeadMesh.Scale = V3new(1.25, 1.25, 1.25)
                HeadMesh.Parent = Head;
                local Face = INew("Decal")
                Face.Name = "face"
                Face.Texture = "http://www.roblox.com/asset/?id=158044781"
                Face.Parent = Head;
                local Animate = INew("LocalScript")
                Animate.Name = "Animate"
                Animate.Parent = Figure;
                local Health = INew("Script")
                Health.Name = "Health"
                Health.Parent = Figure;
                Attachments[1].Name = "FaceCenterAttachment"
                Attachments[1].Position = V3new(0, 0, 0)
                Attachments[2].Name = "FaceFrontAttachment"
                Attachments[2].Position = V3new(0, 0, -0.6)
                Attachments[3].Name = "HairAttachment"
                Attachments[3].Position = V3new(0, 0.6, 0)
                Attachments[4].Name = "HatAttachment"
                Attachments[4].Position = V3new(0, 0.6, 0)
                Attachments[5].Name = "RootAttachment"
                Attachments[5].Position = V3new(0, 0, 0)
                Attachments[6].Name = "RightGripAttachment"
                Attachments[6].Position = V3new(0, -1, 0)
                Attachments[7].Name = "RightShoulderAttachment"
                Attachments[7].Position = V3new(0, 1, 0)
                Attachments[8].Name = "LeftGripAttachment"
                Attachments[8].Position = V3new(0, -1, 0)
                Attachments[9].Name = "LeftShoulderAttachment"
                Attachments[9].Position = V3new(0, 1, 0)
                Attachments[10].Name = "RightFootAttachment"
                Attachments[10].Position = V3new(0, -1, 0)
                Attachments[11].Name = "LeftFootAttachment"
                Attachments[11].Position = V3new(0, -1, 0)
                Attachments[12].Name = "BodyBackAttachment"
                Attachments[12].Position = V3new(0, 0, 0.5)
                Attachments[13].Name = "BodyFrontAttachment"
                Attachments[13].Position = V3new(0, 0, -0.5)
                Attachments[14].Name = "LeftCollarAttachment"
                Attachments[14].Position = V3new(-1, 1, 0)
                Attachments[15].Name = "NeckAttachment"
                Attachments[15].Position = V3new(0, 1, 0)
                Attachments[16].Name = "RightCollarAttachment"
                Attachments[16].Position = V3new(1, 1, 0)
                Attachments[17].Name = "WaistBackAttachment"
                Attachments[17].Position = V3new(0, -1, 0.5)
                Attachments[18].Name = "WaistCenterAttachment"
                Attachments[18].Position = V3new(0, -1, 0)
                Attachments[19].Name = "WaistFrontAttachment"
                Attachments[19].Position = V3new(0, -1, -0.5)
                Attachments[1].Parent = Head;
                Attachments[2].Parent = Head;
                Attachments[3].Parent = Head;
                Attachments[4].Parent = Head;
                Attachments[5].Parent = Root;
                Attachments[6].Parent = Limbs[1]
                Attachments[7].Parent = Limbs[1]
                Attachments[8].Parent = Limbs[2]
                Attachments[9].Parent = Limbs[2]
                Attachments[10].Parent = Limbs[3]
                Attachments[11].Parent = Limbs[4]
                for i = 0, 7 do
                    Attachments[12 + i].Parent = Torso
                end;
                Figure.Name = "GelatekReanimate"
                Figure.PrimaryPart = Head;
                Figure.Archivable = true;
                Figure.Parent = Workspace;
                Figure:MoveTo(RootPart.Position)
            end;
            local FigureHum = Figure:FindFirstChildWhichIsA("Humanoid")
            Figure:MoveTo(Character.Head.Position + V3new(0, 2.5, 0))
            for i, v in pairs(Figure:GetDescendants()) do
                if v:IsA("BasePart") or v:IsA("Decal") then
                    v.Transparency = 1
                end
            end;
            local FigureDescendants = Figure:GetDescendants()
            local CharacterChildren = Character:GetChildren()
            local function VoidEvent()
                if AntiVoid == true then
                    Figure:MoveTo(SpawnPoint.Position)
                else
                    if PostSimEvent then
                        PostSimEvent:Disconnect()
                    end;
                    if PreSimEvent then
                        PreSimEvent:Disconnect()
                    end;
                    if DeathEvent then
                        DeathEvent:Disconnect()
                    end;
                    if TorsoFlingEvent then
                        TorsoFlingEvent:Disconnect()
                    end;
                    if ResetEvent then
                        ResetEvent:Disconnect()
                    end;
                    if FakeHats then
                        FakeHats:Destroy()
                    end;
                    pcall(function()
                        CurrentCam.FieldOfView = 70;
                        Global.Stopped = true;
                        for i, v in pairs(Global.TableOfEvents) do
                            v:Disconnect()
                        end;
                        Character.Parent = Workspace;
                        Player.Character = Workspace[Character.Name]
                        Humanoid:ChangeState(15)
                        if Figure then
                            Figure:Destroy()
                        end;
                        if TestService:FindFirstChild("ScriptCheck") then
                            TestService:FindFirstChild("ScriptCheck"):Destroy()
                        end;
                        task.wait(0.125)
                        Global.RealChar = nil;
                        Global.Stopped = false
                    end)
                end
            end;
            for i, v in pairs(Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.RootPriority = 127;
                    local ClaimInfo = INew("SelectionBox")
                    do
                        ClaimInfo.Adornee = v;
                        ClaimInfo.Name = "ClaimCheck"
                        ClaimInfo.Transparency = 1;
                        ClaimInfo.Parent = v
                    end
                end;
                if v:IsA("Motor6D") and v.Name ~= "Neck" then
                    v:Destroy()
                end;
                if v:IsA("Script") then
                    v.Disabled = true
                end;
                if v:IsA("Accessory") then
                    local FakeAccessory = v:Clone()
                    local Handle = FakeAccessory:FindFirstChild("Handle")
                    pcall(function()
                        Handle:FindFirstChildWhichIsA("Weld"):Destroy()
                    end)
                    local Weld = INew("Weld")
                    do
                        Weld.Name = "AccessoryWeld"
                        Weld.Part0 = Handle
                    end;
                    local Attachment = Handle:FindFirstChildOfClass("Attachment")
                    if Attachment then
                        Weld.C0 = Attachment.CFrame;
                        Weld.C1 = Figure:FindFirstChild(tostring(Attachment), true).CFrame;
                        Weld.Part1 = Figure:FindFirstChild(tostring(Attachment), true).Parent
                    else
                        Weld.Part1 = Figure:FindFirstChild("Head")
                        Weld.C1 = CFNew(0, Figure:FindFirstChild("Head").Size.Y / 2, 0) * FakeAccessory.AttachmentPoint:Inverse()
                    end;
                    Handle.CFrame = Weld.Part1.CFrame * Weld.C1 * Weld.C0:Inverse()
                    Handle.Transparency = 1;
                    Weld.Parent = Handle;
                    FakeAccessory.Parent = Figure;
                    local FakeAccessory2 = FakeAccessory:Clone()
                    FakeAccessory2.Parent = FakeHats
                end
            end;
            for i, v in next, Humanoid:GetPlayingAnimationTracks() do
                v:Stop()
            end;
            if BulletEnabled == true then
                if R15 == false then
                    if PermanentDeath == true then
                        Character:FindFirstChild("HumanoidRootPart").Name = "Bullet"
                        BulletInfo = {
                            Character:FindFirstChild("Bullet"),
                            Figure:FindFirstChild("HumanoidRootPart"),
                            CF0
                        }
                        HatData = nil
                    else
                        Character:FindFirstChild("Right Leg").Name = "Bullet"
                        BulletInfo = {
                            Character:FindFirstChild("Bullet"),
                            Figure:FindFirstChild("Right Leg"),
                            CF0
                        }
                        if Character:FindFirstChild("Robloxclassicred") then
                            HatData = {
                                Character:FindFirstChild("Robloxclassicred"),
                                Figure:FindFirstChild("Right Leg"),
                                CFAngles(math.rad(90), 0, 0)
                            }
                            Character:FindFirstChild("Robloxclassicred").Handle:FindFirstChild("Mesh"):Destroy()
                        else
                            HatData = nil
                        end
                    end
                else
                    Character:FindFirstChild("LeftUpperArm").Name = "Bullet"
                    BulletInfo = {
                        Character:FindFirstChild("Bullet"),
                        Figure:FindFirstChild("Left Arm"),
                        CFNew(0, 0.4085, 0)
                    }
                    if Character:FindFirstChild("SniperShoulderL") then
                        HatData = {
                            Character:FindFirstChild("SniperShoulderL"),
                            Figure:FindFirstChild("Left Arm"),
                            CFNew(0, 0.5, 0)
                        }
                    else
                        HatData = nil
                    end
                end;
                if HatData then
                    HatData[1].Handle:BreakJoints()
                end;
                local Bullet = Character:FindFirstChild("Bullet")
                local Highlight = INew("SelectionBox")
                do
                    local Extra;
                    Highlight.Adornee = Bullet;
                    Highlight.Name = "Highlight"
                    Highlight.Color3 = Color3.fromRGB(0, 223, 37)
                    Highlight.Parent = Bullet;
                    Extra = PreSim:Connect(function()
                        if not Figure and Figure.Parent then
                            Extra:Disconnect()
                        end;
                        if (not TestService:FindFirstChild("ScriptCheck")) or Figure:FindFirstChild("AnimPlayer") then
                            Highlight.Transparency = 1
                        else
                            Highlight.Transparency = 0
                        end
                    end)
                end
            end;
            if CollideFling == true then
                if R15 == false then
                    local Torso = Character:FindFirstChild("Torso")
                    if PermanentDeath == true then
                        IGNORETORSOCHECK = "adfasdkogpasdfjopghsfdjofipsdjghsfopgjospadgjsaj"
                        task.spawn(function()
                            task.wait(1)
                            local BodyAngularVelocity = INew("BodyAngularVelocity")
                            BodyAngularVelocity.MaxTorque = V3new(1, 1, 1) * Infinite;
                            BodyAngularVelocity.P = math.huge;
                            BodyAngularVelocity.AngularVelocity = V3new(1950, 1950, 1950)
                            BodyAngularVelocity.Name = "TorsoFlinger"
                            BodyAngularVelocity.Parent = Character:FindFirstChild("HumanoidRootPart")
                        end)
                    else
                        TorsoFlingEvent = PostSim:Connect(function()
                            if FigureHum.MoveDirection.Magnitude < 0.1 then
                                Torso.Velocity = Velocity
                            elseif FigureHum.MoveDirection.Magnitude > 0.1 then
                                Torso.Velocity = V3new(1250, 1250, 1250) + Velocity
                            end
                        end)
                    end
                else
                    local Torso = Character:FindFirstChild("UpperTorso")
                    TorsoFlingEvent = PostSim:Connect(function()
                        if FigureHum.MoveDirection.Magnitude < 0.1 then
                            Torso.RotVelocity = V3new()
                        elseif FigureHum.MoveDirection.Magnitude > 0.1 then
                            Torso.RotVelocity = V3new(2500, 2500, 2500)
                        end
                    end)
                end
            end;
            if not TestService:FindFirstChild("OwnershipBoost") then
                local Part = INew("Part")
                Part.Name = "OwnershipBoost"
                Part.Parent = TestService;
                PreSim:Connect(function()
                    HiddenProps(Player, "MaximumSimulationRadius", 100000)
                    HiddenProps(Player, "SimulationRadius", Player.MaximumSimulationRadius)
                end)
            end;
            local FallHeight = Workspace.FallenPartsDestroyHeight;
            local function MiniRandom()
                return "0." .. MathRandom(6, 8) .. MathRandom(1, 9) .. MathRandom(1, 9)
            end;
            PreSimEvent = PreSim:Connect(function()
                local AntiVoidOffset = Global.GelatekHubConfig["Anti Void Offset"] or 75;
                if Figure.HumanoidRootPart.Position.Y <= FallHeight + AntiVoidOffset then
                    VoidEvent()
                end;
                for _, v in pairs(CharacterChildren) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end;
                if not Collisions then
                    for _, v in pairs(FigureDescendants) do
                        if v:IsA("BasePart") then
                            v.CanCollide = false
                        end
                    end
                end
            end)
            for i, v in pairs(Character:GetDescendants()) do
                if v:IsA("Motor6D") and v.Name ~= "Neck" then
                    v:Destroy()
                end
            end;
            for i, v in pairs(Character:GetChildren()) do
                if v:IsA("Accessory") then
                    local Attachment = v.Handle:FindFirstChildWhichIsA("Attachment")
                    if KeepHairWelds == true and Attachment.Name ~= "HatAttachment" and Attachment.Name ~= "FaceFrontAttachment" and Attachment.Name ~= "HairAttachment" and Attachment.Name ~= "FaceCenterAttachment" then
                        v.Handle:BreakJoints()
                    end;
                    if KeepHairWelds == false or PermanentDeath == true then
                        v.Handle:BreakJoints()
                    end
                end
            end;
            local function Align(Part0, Part1, Offset)
                local CFOffset = Offset or CF0;
                local OwnerShip = Part0:FindFirstChild("ClaimCheck")
                if Is_NetworkOwner(Part0) == true then
                    if OwnerShip then
                        OwnerShip.Transparency = 1
                    end;
                    if (CollideFling and Part0.Name ~= IGNORETORSOCHECK) or not CollideFling then
                        Part0.AssemblyLinearVelocity = V3new(MathRandom(-2, 2), -30 - MiniRandom(), MathRandom(-2, 2)) + FigureHum.MoveDirection * (Part0.Mass * 10)
                    end;
                    if (CollideFling and Part0.Name ~= "HumanoidRootPart") or not CollideFling then
                        Part0.RotVelocity = Part1.RotVelocity
                    end;
                    Part0.CFrame = Part1.CFrame * CFOffset * CFNew(0.0085 * Cos(Clock() * 10), 0.0085 * Sin(Clock() * 10), 0)
                else
                    if OwnerShip then
                        OwnerShip.Transparency = 0
                    end
                end
            end;
            local Offsets;
            if not R15 then
                Offsets = {
                    ["HumanoidRootPart"] = {
                        Figure:FindFirstChild("HumanoidRootPart"),
                        CF0
                    },
                    ["Torso"] = {
                        Figure:FindFirstChild("Torso"),
                        CF0
                    },
                    ["Right Arm"] = {
                        Figure:FindFirstChild("Right Arm"),
                        CF0
                    },
                    ["Left Arm"] = {
                        Figure:FindFirstChild("Left Arm"),
                        CF0
                    },
                    ["Right Leg"] = {
                        Figure:FindFirstChild("Right Leg"),
                        CF0
                    },
                    ["Left Leg"] = {
                        Figure:FindFirstChild("Left Leg"),
                        CF0
                    }
                }
            else
                Offsets = {
                    ["UpperTorso"] = {
                        Figure:FindFirstChild("Torso"),
                        CFNew(0, 0.194, 0)
                    },
                    ["LowerTorso"] = {
                        Figure:FindFirstChild("Torso"),
                        CFNew(0, -0.79, 0)
                    },
                    ["HumanoidRootPart"] = {
                        Character:FindFirstChild("UpperTorso"),
                        CF0
                    },
                    ["RightUpperArm"] = {
                        Figure:FindFirstChild("Right Arm"),
                        CFNew(0, 0.4085, 0)
                    },
                    ["RightLowerArm"] = {
                        Figure:FindFirstChild("Right Arm"),
                        CFNew(0, -0.184, 0)
                    },
                    ["RightHand"] = {
                        Figure:FindFirstChild("Right Arm"),
                        CFNew(0, -0.83, 0)
                    },
                    ["LeftUpperArm"] = {
                        Figure:FindFirstChild("Left Arm"),
                        CFNew(0, 0.4085, 0)
                    },
                    ["LeftLowerArm"] = {
                        Figure:FindFirstChild("Left Arm"),
                        CFNew(0, -0.184, 0)
                    },
                    ["LeftHand"] = {
                        Figure:FindFirstChild("Left Arm"),
                        CFNew(0, -0.83, 0)
                    },
                    ["RightUpperLeg"] = {
                        Figure:FindFirstChild("Right Leg"),
                        CFNew(0, 0.575, 0)
                    },
                    ["RightLowerLeg"] = {
                        Figure:FindFirstChild("Right Leg"),
                        CFNew(0, -0.199, 0)
                    },
                    ["RightFoot"] = {
                        Figure:FindFirstChild("Right Leg"),
                        CFNew(0, -0.849, 0)
                    },
                    ["LeftUpperLeg"] = {
                        Figure:FindFirstChild("Left Leg"),
                        CFNew(0, 0.575, 0)
                    },
                    ["LeftLowerLeg"] = {
                        Figure:FindFirstChild("Left Leg"),
                        CFNew(0, -0.199, 0)
                    },
                    ["LeftFoot"] = {
                        Figure:FindFirstChild("Left Leg"),
                        CFNew(0, -0.849, 0)
                    }
                }
            end;
            local PostSimEvent = PostSim:Connect(function()
                for i, v in pairs(Offsets) do
                    if Character:FindFirstChild(i) then
                        Align(Character:FindFirstChild(i), v[1], v[2])
                    end
                end;
                for i, v in pairs(CharacterChildren) do
                    if v:IsA("Accessory") then
                        if (HatData and v.Name ~= HatData[1].Name) or not HatData then
                            Align(v.Handle, Figure[v.Name].Handle)
                        end
                    end
                end;
                if HatData then
                    Align(HatData[1].Handle, HatData[2], HatData[3])
                end;
                if BulletInfo then
                    BulletInfo[1].Velocity = Velocity;
                    if Global.PartDisconnected == false then
                        Align(BulletInfo[1], BulletInfo[2], BulletInfo[3])
                    end
                end
            end)
            if PermanentDeath then
                task.spawn(function()
                    task.wait(game:FindFirstChildWhichIsA("Players").RespawnTime + 0.5)
                    if HeadlessPerma == true then
                        Character:FindFirstChild("Head"):Remove()
                    else
                        Character:FindFirstChild("Head"):BreakJoints()
                        Offsets["Head"] = {
                            Figure:FindFirstChild("Head"),
                            CF0
                        }
                    end
                end)
            end;
            Global.RealChar = Character;
            Character.Parent = Figure;
            Player.Character = Figure;
            CurrentCam.CameraSubject = FigureHum;
            DeathEvent = FigureHum.Died:Connect(function()
                if PostSimEvent then
                    PostSimEvent:Disconnect()
                end;
                if PreSimEvent then
                    PreSimEvent:Disconnect()
                end;
                if DeathEvent then
                    DeathEvent:Disconnect()
                end;
                if TorsoFlingEvent then
                    TorsoFlingEvent:Disconnect()
                end;
                if ResetEvent then
                    ResetEvent:Disconnect()
                end;
                if FakeHats then
                    FakeHats:Destroy()
                end;
                for i, v in pairs(Global.TableOfEvents) do
                    v:Disconnect()
                end;
                pcall(function()
                    CurrentCam.FieldOfView = 70;
                    Global.Stopped = true;
                    Character.Parent = Workspace;
                    Player.Character = Workspace[Character.Name]
                    Humanoid:ChangeState(15)
                    if Figure then
                        Figure:Destroy()
                    end;
                    if TestService:FindFirstChild("ScriptCheck") then
                        TestService:FindFirstChild("ScriptCheck"):Destroy()
                    end;
                    task.wait(0.125)
                    Global.RealChar = nil;
                    Global.Stopped = false
                end)
            end)
            ResetEvent = Character:GetPropertyChangedSignal("Parent"):Connect(function(Parent)
                if Parent == nil then
                    if PostSimEvent then
                        PostSimEvent:Disconnect()
                    end;
                    if PreSimEvent then
                        PreSimEvent:Disconnect()
                    end;
                    if DeathEvent then
                        DeathEvent:Disconnect()
                    end;
                    if TorsoFlingEvent then
                        TorsoFlingEvent:Disconnect()
                    end;
                    if ResetEvent then
                        ResetEvent:Disconnect()
                    end;
                    if FakeHats then
                        FakeHats:Destroy()
                    end;
                    for i, v in pairs(Global.TableOfEvents) do
                        v:Disconnect()
                    end;
                    pcall(function()
                        if Figure then
                            Figure:Destroy()
                        end;
                        CurrentCam.FieldOfView = 70;
                        Global.RealChar = nil;
                        Global.Stopped = true;
                        if TestService:FindFirstChild("ScriptCheck") then
                            TestService:FindFirstChild("ScriptCheck"):Destroy()
                        end;
                        task.wait(0.125)
                        Global.Stopped = false
                    end)
                end
            end)
            warn("Reanimated in " .. string.sub(tostring(tick() - Speed), 1, string.find(tostring(tick() - Speed), ".") + 5))
            if not DisableAnimations then
                loadstring([=[local Figure = game.Players.LocalPlayer.Character;
                local Torso = Figure:WaitForChild("Torso")
                local RightShoulder = Torso:WaitForChild("Right Shoulder")
                local LeftShoulder = Torso:WaitForChild("Left Shoulder")
                local RightHip = Torso:WaitForChild("Right Hip")
                local LeftHip = Torso:WaitForChild("Left Hip")
                local Neck = Torso:WaitForChild("Neck")
                local Humanoid = Figure:WaitForChild("Humanoid")
                local pose = "Standing"
                local currentAnim = ""
                local currentAnimInstance = nil;
                local currentAnimTrack = nil;
                local currentAnimKeyframeHandler = nil;
                local currentAnimSpeed = 1.0;
                local animTable = {}
                local animNames = {
                    idle = {
                        {
                            id = "http://www.roblox.com/asset/?id=180435571",
                            weight = 9
                        },
                        {
                            id = "http://www.roblox.com/asset/?id=180435792",
                            weight = 1
                        }
                    },
                    walk = {
                        {
                            id = "http://www.roblox.com/asset/?id=180426354",
                            weight = 10
                        }
                    },
                    run = {
                        {
                            id = "run.xml",
                            weight = 10
                        }
                    },
                    jump = {
                        {
                            id = "http://www.roblox.com/asset/?id=125750702",
                            weight = 10
                        }
                    },
                    fall = {
                        {
                            id = "http://www.roblox.com/asset/?id=180436148",
                            weight = 10
                        }
                    },
                    climb = {
                        {
                            id = "http://www.roblox.com/asset/?id=180436334",
                            weight = 10
                        }
                    },
                    sit = {
                        {
                            id = "http://www.roblox.com/asset/?id=178130996",
                            weight = 10
                        }
                    },
                    toolnone = {
                        {
                            id = "http://www.roblox.com/asset/?id=182393478",
                            weight = 10
                        }
                    },
                    toolslash = {
                        {
                            id = "http://www.roblox.com/asset/?id=129967390",
                            weight = 10
                        }
                    },
                    toollunge = {
                        {
                            id = "http://www.roblox.com/asset/?id=129967478",
                            weight = 10
                        }
                    },
                    wave = {
                        {
                            id = "http://www.roblox.com/asset/?id=128777973",
                            weight = 10
                        }
                    },
                    point = {
                        {
                            id = "http://www.roblox.com/asset/?id=128853357",
                            weight = 10
                        }
                    },
                    dance1 = {
                        {
                            id = "http://www.roblox.com/asset/?id=182435998",
                            weight = 10
                        },
                        {
                            id = "http://www.roblox.com/asset/?id=182491037",
                            weight = 10
                        },
                        {
                            id = "http://www.roblox.com/asset/?id=182491065",
                            weight = 10
                        }
                    },
                    dance2 = {
                        {
                            id = "http://www.roblox.com/asset/?id=182436842",
                            weight = 10
                        },
                        {
                            id = "http://www.roblox.com/asset/?id=182491248",
                            weight = 10
                        },
                        {
                            id = "http://www.roblox.com/asset/?id=182491277",
                            weight = 10
                        }
                    },
                    dance3 = {
                        {
                            id = "http://www.roblox.com/asset/?id=182436935",
                            weight = 10
                        },
                        {
                            id = "http://www.roblox.com/asset/?id=182491368",
                            weight = 10
                        },
                        {
                            id = "http://www.roblox.com/asset/?id=182491423",
                            weight = 10
                        }
                    },
                    laugh = {
                        {
                            id = "http://www.roblox.com/asset/?id=129423131",
                            weight = 10
                        }
                    },
                    cheer = {
                        {
                            id = "http://www.roblox.com/asset/?id=129423030",
                            weight = 10
                        }
                    }
                }
                local dances = {
                    "dance1",
                    "dance2",
                    "dance3"
                }
                local emoteNames = {
                    wave = false,
                    point = false,
                    dance1 = true,
                    dance2 = true,
                    dance3 = true,
                    laugh = false,
                    cheer = false
                }
                function configureAnimationSet(name, fileList)
                    if (animTable[name] ~= nil) then
                        for _, connection in pairs(animTable[name].connections) do
                            connection:Disconnect()
                        end
                    end;
                    animTable[name] = {}
                    animTable[name].count = 0;
                    animTable[name].totalWeight = 0;
                    animTable[name].connections = {}
                    local config = script:FindFirstChild(name)
                    if (config ~= nil) then
                        table.insert(animTable[name].connections, config.ChildAdded:Connect(function(child)
                            configureAnimationSet(name, fileList)
                        end))
                        table.insert(animTable[name].connections, config.ChildRemoved:Connect(function(child)
                            configureAnimationSet(name, fileList)
                        end))
                        local idx = 1;
                        for _, childPart in pairs(config:GetChildren()) do
                            if (childPart:IsA("Animation")) then
                                table.insert(animTable[name].connections, childPart.Changed:Connect(function(property)
                                    configureAnimationSet(name, fileList)
                                end))
                                animTable[name][idx] = {}
                                animTable[name][idx].anim = childPart;
                                local weightObject = childPart:FindFirstChild("Weight")
                                if (weightObject == nil) then
                                    animTable[name][idx].weight = 1
                                else
                                    animTable[name][idx].weight = weightObject.Value
                                end;
                                animTable[name].count = animTable[name].count + 1;
                                animTable[name].totalWeight = animTable[name].totalWeight + animTable[name][idx].weight;
                                idx = idx + 1
                            end
                        end
                    end;
                    if (animTable[name].count <= 0) then
                        for idx, anim in pairs(fileList) do
                            animTable[name][idx] = {}
                            animTable[name][idx].anim = Instance.new("Animation")
                            animTable[name][idx].anim.Name = name;
                            animTable[name][idx].anim.AnimationId = anim.id;
                            animTable[name][idx].weight = anim.weight;
                            animTable[name].count = animTable[name].count + 1;
                            animTable[name].totalWeight = animTable[name].totalWeight + anim.weight
                        end
                    end
                end;
                function scriptChildModified(child)
                    local fileList = animNames[child.Name]
                    if (fileList ~= nil) then
                        configureAnimationSet(child.Name, fileList)
                    end
                end;
                script.ChildAdded:Connect(scriptChildModified)
                script.ChildRemoved:Connect(scriptChildModified)
                for name, fileList in pairs(animNames) do
                    configureAnimationSet(name, fileList)
                end;
                local toolAnim = "None"
                local toolAnimTime = 0;
                local jumpAnimTime = 0;
                local jumpAnimDuration = 0.3;
                local toolTransitionTime = 0.1;
                local fallTransitionTime = 0.3;
                local jumpMaxLimbVelocity = 0.75;
                function stopAllAnimations()
                    local oldAnim = currentAnim;
                    if (emoteNames[oldAnim] ~= nil and emoteNames[oldAnim] == false) then
                        oldAnim = "idle"
                    end;
                    currentAnim = ""
                    currentAnimInstance = nil;
                    if (currentAnimKeyframeHandler ~= nil) then
                        currentAnimKeyframeHandler:Disconnect()
                    end;
                    if (currentAnimTrack ~= nil) then
                        currentAnimTrack:Stop()
                        currentAnimTrack:Destroy()
                        currentAnimTrack = nil
                    end;
                    return oldAnim
                end;
                function setAnimationSpeed(speed)
                    if speed ~= currentAnimSpeed then
                        currentAnimSpeed = speed;
                        currentAnimTrack:AdjustSpeed(currentAnimSpeed)
                    end
                end;
                function keyFrameReachedFunc(frameName)
                    if (frameName == "End") then
                        local repeatAnim = currentAnim;
                        if (emoteNames[repeatAnim] ~= nil and emoteNames[repeatAnim] == false) then
                            repeatAnim = "idle"
                        end;
                        local animSpeed = currentAnimSpeed;
                        playAnimation(repeatAnim, 0.0, Humanoid)
                        setAnimationSpeed(animSpeed)
                    end
                end;
                function playAnimation(animName, transitionTime, humanoid)
                    pcall(function()
                        local roll = math.random(1, animTable[animName].totalWeight)
                        local origRoll = roll;
                        local idx = 1;
                        while (roll > animTable[animName][idx].weight) do
                            roll = roll - animTable[animName][idx].weight;
                            idx = idx + 1
                        end;
                        local anim = animTable[animName][idx].anim;
                        if (anim ~= currentAnimInstance) then
                            if (currentAnimTrack ~= nil) then
                                currentAnimTrack:Stop(transitionTime)
                                currentAnimTrack:Destroy()
                            end;
                            currentAnimSpeed = 1.0;
                            currentAnimTrack = humanoid:LoadAnimation(anim)
                            currentAnimTrack.Priority = Enum.AnimationPriority.Core;
                            currentAnimTrack:Play(transitionTime)
                            currentAnim = animName;
                            currentAnimInstance = anim;
                            if (currentAnimKeyframeHandler ~= nil) then
                                currentAnimKeyframeHandler:Disconnect()
                            end;
                            currentAnimKeyframeHandler = currentAnimTrack.KeyframeReached:Connect(keyFrameReachedFunc)
                        end
                    end)
                end;
                local toolAnimName = ""
                local toolAnimTrack = nil;
                local toolAnimInstance = nil;
                local currentToolAnimKeyframeHandler = nil;
                function toolKeyFrameReachedFunc(frameName)
                    if (frameName == "End") then
                        playToolAnimation(toolAnimName, 0.0, Humanoid)
                    end
                end;
                function playToolAnimation(animName, transitionTime, humanoid, priority)
                    local roll = math.random(1, animTable[animName].totalWeight)
                    local origRoll = roll;
                    local idx = 1;
                    while (roll > animTable[animName][idx].weight) do
                        roll = roll - animTable[animName][idx].weight;
                        idx = idx + 1
                    end;
                    local anim = animTable[animName][idx].anim;
                    if (toolAnimInstance ~= anim) then
                        if (toolAnimTrack ~= nil) then
                            toolAnimTrack:Stop()
                            toolAnimTrack:Destroy()
                            transitionTime = 0
                        end;
                        toolAnimTrack = humanoid:LoadAnimation(anim)
                        if priority then
                            toolAnimTrack.Priority = priority
                        end;
                        toolAnimTrack:Play(transitionTime)
                        toolAnimName = animName;
                        toolAnimInstance = anim;
                        currentToolAnimKeyframeHandler = toolAnimTrack.KeyframeReached:Connect(toolKeyFrameReachedFunc)
                    end
                end;
                function stopToolAnimations()
                    local oldAnim = toolAnimName;
                    if (currentToolAnimKeyframeHandler ~= nil) then
                        currentToolAnimKeyframeHandler:Disconnect()
                    end;
                    toolAnimName = ""
                    toolAnimInstance = nil;
                    if (toolAnimTrack ~= nil) then
                        toolAnimTrack:Stop()
                        toolAnimTrack:Destroy()
                        toolAnimTrack = nil
                    end;
                    return oldAnim
                end;
                function onRunning(speed)
                    pcall(function()
                        if speed > 0.01 then
                            playAnimation("walk", 0.1, Humanoid)
                            if currentAnimInstance and currentAnimInstance.AnimationId == "http://www.roblox.com/asset/?id=180426354" then
                                setAnimationSpeed(speed / 14.5)
                            end;
                            pose = "Running"
                        else
                            if emoteNames[currentAnim] == nil then
                                playAnimation("idle", 0.1, Humanoid)
                                pose = "Standing"
                            end
                        end
                    end)
                end;
                function onDied()
                    pose = "Dead"
                end;
                function onJumping()
                    playAnimation("jump", 0.1, Humanoid)
                    jumpAnimTime = jumpAnimDuration;
                    pose = "Jumping"
                end;
                function onClimbing(speed)
                    playAnimation("climb", 0.1, Humanoid)
                    setAnimationSpeed(speed / 12.0)
                    pose = "Climbing"
                end;
                function onGettingUp()
                    pose = "GettingUp"
                end;
                function onFreeFall()
                    if (jumpAnimTime <= 0) then
                        playAnimation("fall", fallTransitionTime, Humanoid)
                    end;
                    pose = "FreeFall"
                end;
                function onFallingDown()
                    pose = "FallingDown"
                end;
                function onSeated()
                    pose = "Seated"
                end;
                function onPlatformStanding()
                    pose = "PlatformStanding"
                end;
                function onSwimming(speed)
                    if speed > 0 then
                        pose = "Running"
                    else
                        pose = "Standing"
                    end
                end;
                function getTool()
                    for _, kid in ipairs(Figure:GetChildren()) do
                        if kid.className == "Tool" then
                            return kid
                        end
                    end;
                    return nil
                end;
                function getToolAnim(tool)
                    for _, c in ipairs(tool:GetChildren()) do
                        if c.Name == "toolanim" and c.className == "StringValue" then
                            return c
                        end
                    end;
                    return nil
                end;
                function animateTool()
                    if (toolAnim == "None") then
                        playToolAnimation("toolnone", toolTransitionTime, Humanoid, Enum.AnimationPriority.Idle)
                        return
                    end;
                    if (toolAnim == "Slash") then
                        playToolAnimation("toolslash", 0, Humanoid, Enum.AnimationPriority.Action)
                        return
                    end;
                    if (toolAnim == "Lunge") then
                        playToolAnimation("toollunge", 0, Humanoid, Enum.AnimationPriority.Action)
                        return
                    end
                end;
                function moveSit()
                    RightShoulder.MaxVelocity = 0.15;
                    LeftShoulder.MaxVelocity = 0.15;
                    RightShoulder:SetDesiredAngle(3.14 / 2)
                    LeftShoulder:SetDesiredAngle(-3.14 / 2)
                    RightHip:SetDesiredAngle(3.14 / 2)
                    LeftHip:SetDesiredAngle(-3.14 / 2)
                end;
                local lastTick = 0;
                function move(time)
                    local amplitude = 1;
                    local frequency = 1;
                    local deltaTime = time - lastTick;
                    lastTick = time;
                    local climbFudge = 0;
                    local setAngles = false;
                    if (jumpAnimTime > 0) then
                        jumpAnimTime = jumpAnimTime - deltaTime
                    end;
                    if (pose == "FreeFall" and jumpAnimTime <= 0) then
                        playAnimation("fall", fallTransitionTime, Humanoid)
                    elseif (pose == "Seated") then
                        playAnimation("sit", 0.5, Humanoid)
                        return
                    elseif (pose == "Running") then
                        playAnimation("walk", 0.1, Humanoid)
                    elseif (pose == "Dead" or pose == "GettingUp" or pose == "FallingDown" or pose == "Seated" or pose == "PlatformStanding") then
                        stopAllAnimations()
                        amplitude = 0.1;
                        frequency = 1;
                        setAngles = true
                    end;
                    if (setAngles) then
                        local desiredAngle = amplitude * math.sin(time * frequency)
                        RightShoulder:SetDesiredAngle(desiredAngle + climbFudge)
                        LeftShoulder:SetDesiredAngle(desiredAngle - climbFudge)
                        RightHip:SetDesiredAngle(-desiredAngle)
                        LeftHip:SetDesiredAngle(-desiredAngle)
                    end;
                    local tool = getTool()
                    if tool and tool:FindFirstChild("Handle") then
                        local animStringValueObject = getToolAnim(tool)
                        if animStringValueObject then
                            toolAnim = animStringValueObject.Value;
                            animStringValueObject.Parent = nil;
                            toolAnimTime = time + .3
                        end;
                        if time > toolAnimTime then
                            toolAnimTime = 0;
                            toolAnim = "None"
                        end;
                        animateTool()
                    else
                        stopToolAnimations()
                        toolAnim = "None"
                        toolAnimInstance = nil;
                        toolAnimTime = 0
                    end
                end;
                Humanoid.Died:Connect(onDied)
                Humanoid.Running:Connect(onRunning)
                Humanoid.Jumping:Connect(onJumping)
                Humanoid.Climbing:Connect(onClimbing)
                Humanoid.GettingUp:Connect(onGettingUp)
                Humanoid.FreeFalling:Connect(onFreeFall)
                Humanoid.FallingDown:Connect(onFallingDown)
                Humanoid.Seated:Connect(onSeated)
                Humanoid.PlatformStanding:Connect(onPlatformStanding)
                Humanoid.Swimming:Connect(onSwimming)
                game:GetService("Players").LocalPlayer.Chatted:Connect(function(msg)
                    local emote = ""
                    if msg == "/e dance" then
                        emote = dances[math.random(1, #dances)]
                    elseif (string.sub(msg, 1, 3) == "/e ") then
                        emote = string.sub(msg, 4)
                    elseif (string.sub(msg, 1, 7) == "/emote ") then
                        emote = string.sub(msg, 8)
                    end;
                    if (pose == "Standing" and emoteNames[emote] ~= nil) then
                        playAnimation(emote, 0.1, Humanoid)
                    end
                end)
                local events = {}
                local dead = false;
                table.insert(events, game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function()
                    dead = true;
                    for i, v in pairs(events) do
                        v:Disconnect()
                    end
                end))
                playAnimation("idle", 0.1, Humanoid)
                pose = "Standing"
                table.insert(events, game:GetService("RunService").Stepped:Connect(function()
                    if dead == true then
                        return
                    end;
                    local _, time = task.wait(0.1)
                    move(time)
                end))]=])()
            end
            
            task.delay(6.25, function()
                Send("-net")
            end)
        end
    })
    local GenTab = Window:CreateTab("(🎮) Genesis")
    GenTab:CreateButton({
        Name = "Krystal Dance",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Krystal%20Dance"))()
        end
    })
    GenTab:CreateParagraph({
        Title = "Keybinds",
        Content = "Q, E, R, T, Y, U, P, F, G, H, J, K, L"
    })
    GenTab:CreateDivider()
    GenTab:CreateButton({
        Name = "Neptunian V",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Neptunian%20V"))()
        end
    })
    GenTab:CreateParagraph({
        Title = "Keybinds",
        Content = "F, Z, X, R"
    })
    GenTab:CreateDivider()
    GenTab:CreateButton({
        Name = "Sin Dragon",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Sin%20Dragon"))()
        end
    })
    GenTab:CreateParagraph({
        Title = "Keybinds",
        Content = "G, Z, X, C"
    })
    GenTab:CreateDivider()
    GenTab:CreateButton({
        Name = "Lightning Cannon",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Lightning%20Cannon"))()
        end
    })
    GenTab:CreateParagraph({
        Title = "Keybinds",
        Content = "E, Z, X, C, V, B, M"
    })
    GenTab:CreateDivider()
    GenTab:CreateButton({
        Name = "Goner",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Goner"))()
        end
    })
    GenTab:CreateParagraph({
        Title = "Keybinds",
        Content = "Q"
    })
    GenTab:CreateDivider()
    GenTab:CreateButton({
        Name = "Ban Hammer",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Ban%20Hammer"))()
        end
    })
    GenTab:CreateParagraph({
        Title = "Keybinds",
        Content = "E, R"
    })
    GenTab:CreateDivider()
    GenTab:CreateButton({
        Name = "Motorcycle",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Motorcycle"))()
        end
    })
    GenTab:CreateParagraph({
        Title = "Keybinds",
        Content = "Z (While driving)"
    })
    local HatsTab = Window:CreateTab("(🎮) Genesis rigs")
    HatsTab:CreateParagraph({
        Title = "IMPORTANT",
        Content = "Always load PermaDeath before reanimating."
    })
    HatsTab:CreateButton({
        Name = "PermaDeath",
        Callback = function()
            Chat("-pd ")
        end
    })
    HatsTab:CreateButton({
        Name = "Remove Hats",
        Callback = function()
            Chat("-ch ")
        end
    })
    HatsTab:CreateButton({
        Name = "Respawn",
        Callback = function()
            Chat("-re ")
        end
    })
    HatsTab:CreateButton({
        Name = "Save hats",
        Callback = function()
            Chat("-sh ")
        end
    })
    HatsTab:CreateDivider()
    HatsTab:CreateParagraph({
        Title = "IMPORTANT!",
        Content = "It's important to always load the rigs so everyone can see you!"
    })
    HatsTab:CreateButton({
        Name = "Genesis Rigs",
        Callback = function()
            Chat("-gh 138364679836274 82942681251131 140395948277978 102599402682100 90960046381276 13058406993 ")
        end
    })
    HatsTab:CreateButton({
        Name = "Genesis Rigs [Black]",
        Callback = function()
            Chat("-gh 131385506535381 85392395166623 129462518582032 138364679836274 12850150835 106249329428811 ")
        end
    })
    HatsTab:CreateSection("Custom Rigs")
    HatsTab:CreateButton({
        Name = "Genesis Rigs [Noob]",
        Callback = function()
            Chat("-gh 95290698984301, 84451219120140, 72292903231768, 108186273151388, 139904067056008 ")
        end
    })
    HatsTab:CreateButton({
        Name = "Genesis Rigs [Guest]",
        Callback = function()
            Chat("-gh 13058406993 138364679836274 131385506535381 85392395166623 129462518582032 106249329428811 108224319902592 82404150383568 100856932339214")
        end
    })
    HatsTab:CreateButton({
        Name = "Genesis Rigs [1x1x1x1]",
        Callback = function()
            Chat("-gh 131385506535381 85392395166623 129462518582032 12850150835 106249329428811 17681457649 17532925923 16296624548")
        end
    })
    HatsTab:CreateDivider()
    HatsTab:CreateButton({
        Name = "Neptunian V",
        Callback = function()
            Chat("-gh 5316479641")
        end
    })
    HatsTab:CreateButton({
        Name = "Sin Dragon",
        Callback = function()
            Chat("-gh 117186631495734 99965319383570 132770514241770 3756389957 14864581977 150381051 4504231783")
        end
    })
    HatsTab:CreateButton({
        Name = "Lightning Cannon",
        Callback = function()
            Chat("-gh 111672581230926 126145101810389 136055191177936 4504231783")
        end
    })
    HatsTab:CreateButton({
        Name = "Goner",
        Callback = function()
            Chat("-gh 17770317484 17822722698 17822749561 17772174303 17835236579")
        end
    })
    HatsTab:CreateButton({
        Name = "Ban Hammer",
        Callback = function()
            Chat("-gh 15548314241")
        end
    })
    HatsTab:CreateButton({
        Name = "Motorcycle",
        Callback = function()
            Chat("-gh 4504231783, 11354413365, 191101707, 18209672127 ")
        end
    })
end
