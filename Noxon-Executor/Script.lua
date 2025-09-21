local player = game:GetService("Players").LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "NoxonExecutor"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true

local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local DataStoreService = game:GetService("DataStoreService")

local blur = Instance.new("BlurEffect")
blur.Size = 18
blur.Name = "NoxonExecutorBlur"
blur.Parent = Lighting

local function applyCorner(parent, radius)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, radius)
    c.Parent = parent
    return c
end

local function applySquircle(parent, radius)
    local uiCorner = Instance.new("UICorner")
    uiCorner.CornerRadius = UDim.new(0, radius)
    uiCorner.Parent = parent
    
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 40, 40)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 25, 25))
    }
    gradient.Rotation = 90
    gradient.Parent = parent
    
    return uiCorner
end

local function applyStroke(inst, thickness, color, transparency)
    local stroke = Instance.new("UIStroke")
    stroke.Thickness = thickness or 2
    stroke.Transparency = transparency or 0.25
    stroke.Color = color or Color3.fromRGB(80, 80, 80)
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke.Parent = inst
    return stroke
end

local favoritesData = {}
local favoritesStore
local dataStoreEnabled = pcall(function()
    favoritesStore = DataStoreService:GetDataStore("NoxonExecutorFavorites")
end)

local function loadFavorites()
    if not dataStoreEnabled then return {} end
    local success, data = pcall(function()
        return favoritesStore:GetAsync(player.UserId) or {}
    end)
    return success and data or {}
end

local function saveFavorites(data)
    if not dataStoreEnabled then return end
    pcall(function()
        favoritesStore:SetAsync(player.UserId, data)
    end)
end

favoritesData = loadFavorites()

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 600, 0, 400)
main.Position = UDim2.new(0.5, -300, 0.5, -200)
main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
main.Active = false
main.Draggable = false
applyCorner(main, 10)
applyStroke(main, 2, Color3.fromRGB(60, 60, 60))

local mainGradient = Instance.new("UIGradient")
mainGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(18, 18, 18)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(12, 12, 12))
}
mainGradient.Rotation = 90
mainGradient.Parent = main

local minimizeBtn = Instance.new("TextButton", main)
minimizeBtn.Size = UDim2.new(0, 30, 0, 30)
minimizeBtn.Position = UDim2.new(1, -35, 0, 5)
minimizeBtn.Text = "-"
minimizeBtn.TextColor3 = Color3.new(1, 1, 1)
minimizeBtn.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.TextSize = 20
applyCorner(minimizeBtn, 6)
applyStroke(minimizeBtn, 1, Color3.fromRGB(120, 0, 0))

local minimizer = Instance.new("TextButton", gui)
minimizer.Size = UDim2.new(0, 50, 0, 50)
minimizer.Position = UDim2.new(0, 15, 0.5, -25)
minimizer.Text = "N"
minimizer.TextColor3 = Color3.new(1, 1, 1)
minimizer.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
minimizer.Visible = false
minimizer.Font = Enum.Font.GothamBlack
minimizer.TextSize = 24
minimizer.Active = true
minimizer.Draggable = true
applySquircle(minimizer, 12)
applyStroke(minimizer, 2, Color3.fromRGB(120, 0, 0))

minimizeBtn.MouseButton1Click:Connect(function()
    main.Visible = false
    blur.Enabled = false
    minimizer.Visible = true
end)

minimizer.MouseButton1Click:Connect(function()
    main.Visible = true
    blur.Enabled = true
    minimizer.Visible = false
end)

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, -100, 0, 30)
title.Position = UDim2.new(0, 15, 0, 10)
title.Text = "Noxon Executor"
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBlack
title.TextSize = 18
title.TextXAlignment = Enum.TextXAlignment.Left

local titleStroke = Instance.new("UIStroke")
titleStroke.Thickness = 1.5
titleStroke.Color = Color3.fromRGB(180, 0, 0)
titleStroke.Transparency = 0.5
titleStroke.Parent = title

local content = Instance.new("Frame", main)
content.Position = UDim2.new(0, 15, 0, 45)
content.Size = UDim2.new(0, 430, 1, -60)
content.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
applyCorner(content, 8)
applyStroke(content, 1, Color3.fromRGB(50, 50, 50))

local rightMenu = Instance.new("Frame", main)
rightMenu.Size = UDim2.new(0, 50, 1, -60)
rightMenu.Position = UDim2.new(1, -70, 0, 45)
rightMenu.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
applyCorner(rightMenu, 8)
applyStroke(rightMenu, 1, Color3.fromRGB(50, 50, 50))

local tabs = {}
local tabButtons = {}

local tabIcons = {
    Executor = ">_",
    Favorites = "★",
    Settings = "⚙️"
}

local tabOrder = {"Executor", "Favorites", "Settings"}

for i, name in ipairs(tabOrder) do
    local btn = Instance.new("TextButton", rightMenu)
    btn.Size = UDim2.new(1, -10, 0, 40)
    btn.Position = UDim2.new(0, 5, 0, 10 + (i - 1) * 50)
    btn.Text = tabIcons[name]
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 18
    applyCorner(btn, 6)
    applyStroke(btn, 1, Color3.fromRGB(60, 60, 60))
    
    btn.MouseEnter:Connect(function()
        TweenService:Create(
            btn, 
            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), 
            {BackgroundColor3 = Color3.fromRGB(180, 0, 0)}
        ):Play()
    end)
    
    btn.MouseLeave:Connect(function()
        if tabs[name].Visible then return end
        TweenService:Create(
            btn, 
            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), 
            {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}
        ):Play()
    end)
    
    local tab = Instance.new("Frame", content)
    tab.Size = UDim2.new(1, 0, 1, 0)
    tab.Visible = false
    tab.BackgroundTransparency = 1
    tabs[name] = tab
    tabButtons[name] = btn
    
    btn.MouseButton1Click:Connect(function()
        for _, tab in pairs(tabs) do tab.Visible = false end
        for _, button in pairs(tabButtons) do 
            TweenService:Create(
                button, 
                TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), 
                {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}
            ):Play()
        end
        tab.Visible = true
        TweenService:Create(
            btn, 
            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), 
            {BackgroundColor3 = Color3.fromRGB(180, 0, 0)}
        ):Play()
    end)
end

tabs.Executor.Visible = true
tabButtons.Executor.BackgroundColor3 = Color3.fromRGB(180, 0, 0)

local input = Instance.new("TextBox", tabs.Executor)
input.Size = UDim2.new(1, -20, 1, -70)
input.Position = UDim2.new(0, 10, 0, 10)
input.PlaceholderText = "Type your script here..."
input.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
input.TextXAlignment = Enum.TextXAlignment.Left
input.TextYAlignment = Enum.TextYAlignment.Top
input.MultiLine = true
input.ClearTextOnFocus = false
input.Text = ""
input.TextWrapped = true
input.Font = Enum.Font.Code
input.TextSize = 14
input.TextColor3 = Color3.new(1, 1, 1)
input.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
applyCorner(input, 6)
applyStroke(input, 1, Color3.fromRGB(60, 60, 60))

local buttonContainer = Instance.new("Frame", tabs.Executor)
buttonContainer.Size = UDim2.new(1, -20, 0, 30)
buttonContainer.Position = UDim2.new(0, 10, 1, -40)
buttonContainer.BackgroundTransparency = 1

local execBtn = Instance.new("TextButton", buttonContainer)
execBtn.Size = UDim2.new(0, 80, 1, 0)
execBtn.Position = UDim2.new(0, 0, 0, 0)
execBtn.Text = "Execute"
execBtn.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
execBtn.TextColor3 = Color3.new(1, 1, 1)
execBtn.Font = Enum.Font.GothamBold
applyCorner(execBtn, 6)
applyStroke(execBtn, 1, Color3.fromRGB(120, 0, 0))

local clearBtn = Instance.new("TextButton", buttonContainer)
clearBtn.Size = UDim2.new(0, 80, 1, 0)
clearBtn.Position = UDim2.new(0, 90, 0, 0)
clearBtn.Text = "Clear"
clearBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
clearBtn.TextColor3 = Color3.new(1, 1, 1)
clearBtn.Font = Enum.Font.GothamBold
applyCorner(clearBtn, 6)
applyStroke(clearBtn, 1, Color3.fromRGB(70, 70, 70))

local favBtn = Instance.new("TextButton", buttonContainer)
favBtn.Size = UDim2.new(0, 120, 1, 0)
favBtn.Position = UDim2.new(1, -120, 0, 0)
favBtn.Text = "Add to Favorites"
favBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
favBtn.TextColor3 = Color3.new(1, 1, 1)
favBtn.Font = Enum.Font.GothamBold
applyCorner(favBtn, 6)
applyStroke(favBtn, 1, Color3.fromRGB(70, 70, 70))

local function setupButtonHover(btn, hoverColor, normalColor)
    btn.MouseEnter:Connect(function()
        TweenService:Create(
            btn, 
            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), 
            {BackgroundColor3 = hoverColor}
        ):Play()
    end)
    
    btn.MouseLeave:Connect(function()
        TweenService:Create(
            btn, 
            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), 
            {BackgroundColor3 = normalColor}
        ):Play()
    end)
end

setupButtonHover(execBtn, Color3.fromRGB(200, 20, 20), Color3.fromRGB(180, 0, 0))
setupButtonHover(clearBtn, Color3.fromRGB(70, 70, 70), Color3.fromRGB(50, 50, 50))
setupButtonHover(favBtn, Color3.fromRGB(70, 70, 70), Color3.fromRGB(50, 50, 50))

execBtn.MouseButton1Click:Connect(function()
    local s = input.Text
    if s ~= "" then
        local success, err = pcall(function()
            loadstring(s)()
        end)
        if not success then
            warn("Script Error: " .. err)
        end
    end
end)

clearBtn.MouseButton1Click:Connect(function()
    input.Text = ""
end)

favBtn.MouseButton1Click:Connect(function()
    if input.Text ~= "" then
        local popup = Instance.new("Frame", gui)
        popup.Size = UDim2.new(0, 300, 0, 150)
        popup.Position = UDim2.new(0.5, -150, 0.5, -75)
        popup.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        popup.ZIndex = 10
        applyCorner(popup, 8)
        applyStroke(popup, 2, Color3.fromRGB(60, 60, 60))
        
        local popupGradient = Instance.new("UIGradient")
        popupGradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 30, 30)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 20))
        }
        popupGradient.Rotation = 90
        popupGradient.Parent = popup
        
        local title = Instance.new("TextLabel", popup)
        title.Size = UDim2.new(1, 0, 0, 30)
        title.Position = UDim2.new(0, 0, 0, 10)
        title.Text = "Name Your Favorite"
        title.TextColor3 = Color3.new(1, 1, 1)
        title.BackgroundTransparency = 1
        title.Font = Enum.Font.GothamBold
        title.TextSize = 16
        
        local nameInput = Instance.new("TextBox", popup)
        nameInput.Size = UDim2.new(1, -40, 0, 30)
        nameInput.Position = UDim2.new(0, 20, 0, 50)
        nameInput.PlaceholderText = "Favorite Name"
        nameInput.Text = "Script " .. tostring(#favoritesData + 1)
        nameInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        nameInput.TextColor3 = Color3.new(1, 1, 1)
        nameInput.Font = Enum.Font.Gotham
        applyCorner(nameInput, 6)
        applyStroke(nameInput, 1, Color3.fromRGB(60, 60, 60))
        
        local buttonContainer = Instance.new("Frame", popup)
        buttonContainer.Size = UDim2.new(1, -40, 0, 30)
        buttonContainer.Position = UDim2.new(0, 20, 1, -40)
        buttonContainer.BackgroundTransparency = 1
        
        local cancelBtn = Instance.new("TextButton", buttonContainer)
        cancelBtn.Size = UDim2.new(0, 100, 1, 0)
        cancelBtn.Position = UDim2.new(0, 0, 0, 0)
        cancelBtn.Text = "Cancel"
        cancelBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
        cancelBtn.TextColor3 = Color3.new(1, 1, 1)
        cancelBtn.Font = Enum.Font.GothamBold
        applyCorner(cancelBtn, 6)
        applyStroke(cancelBtn, 1, Color3.fromRGB(100, 100, 100))
        
      
        local saveBtn = Instance.new("TextButton", buttonContainer)
        saveBtn.Size = UDim2.new(0, 100, 1, 0)
        saveBtn.Position = UDim2.new(1, -100, 0, 0)
        saveBtn.Text = "Save"
        saveBtn.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
        saveBtn.TextColor3 = Color3.new(1, 1, 1)
        saveBtn.Font = Enum.Font.GothamBold
        applyCorner(saveBtn, 6)
        applyStroke(saveBtn, 1, Color3.fromRGB(120, 0, 0))
        
        setupButtonHover(cancelBtn, Color3.fromRGB(100, 100, 100), Color3.fromRGB(80, 80, 80))
        setupButtonHover(saveBtn, Color3.fromRGB(200, 20, 20), Color3.fromRGB(180, 0, 0))
        
        cancelBtn.MouseButton1Click:Connect(function()
            TweenService:Create(
                popup,
                TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Size = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0.5, 0, 0.5, 0)}
            ):Play()
            wait(0.2)
            popup:Destroy()
        end)
        
        saveBtn.MouseButton1Click:Connect(function()
            local name = nameInput.Text
            if name ~= "" then
                favoritesData[name] = input.Text
                saveFavorites(favoritesData)
                refreshFavorites()
                TweenService:Create(
                    popup,
                    TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Size = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0.5, 0, 0.5, 0)}
                ):Play()
                wait(0.2)
                popup:Destroy()
            end
        end)
        
        popup.Size = UDim2.new(0, 0, 0, 0)
        popup.Position = UDim2.new(0.5, 0, 0.5, 0)
        TweenService:Create(
            popup,
            TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
            {Size = UDim2.new(0, 300, 0, 150), Position = UDim2.new(0.5, -150, 0.5, -75)}
        ):Play()
    end
end)

local favList = Instance.new("ScrollingFrame", tabs.Favorites)
favList.Size = UDim2.new(1, -20, 1, -20)
favList.Position = UDim2.new(0, 10, 0, 10)
favList.BackgroundTransparency = 1
favList.ScrollBarThickness = 6
favList.CanvasSize = UDim2.new()
favList.ScrollBarImageColor3 = Color3.fromRGB(180, 0, 0)

local function refreshFavorites()
    favList:ClearAllChildren()
    local y = 0
    
    if next(favoritesData) == nil then
        local emptyLabel = Instance.new("TextLabel", favList)
        emptyLabel.Size = UDim2.new(1, 0, 0, 30)
        emptyLabel.Position = UDim2.new(0, 0, 0, 10)
        emptyLabel.Text = "No favorites yet. Add scripts from the Executor tab."
        emptyLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
        emptyLabel.BackgroundTransparency = 1
        emptyLabel.Font = Enum.Font.Gotham
        emptyLabel.TextSize = 14
        y = 50
    else
        for name, code in pairs(favoritesData) do
            local frame = Instance.new("Frame", favList)
            frame.Size = UDim2.new(1, -10, 0, 60)
            frame.Position = UDim2.new(0, 0, 0, y)
            frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            applyCorner(frame, 6)
            applyStroke(frame, 1, Color3.fromRGB(60, 60, 60))
            
            local lbl = Instance.new("TextLabel", frame)
            lbl.Size = UDim2.new(1, -160, 0, 25)
            lbl.Position = UDim2.new(0, 5, 0, 5)
            lbl.Text = name
            lbl.TextColor3 = Color3.new(1, 1, 1)
            lbl.BackgroundTransparency = 1
            lbl.Font = Enum.Font.GothamBold
            lbl.TextXAlignment = Enum.TextXAlignment.Left
            lbl.TextSize = 14
            
            local codePreview = Instance.new("TextLabel", frame)
            codePreview.Size = UDim2.new(1, -160, 0, 25)
            codePreview.Position = UDim2.new(0, 5, 0, 30)
            codePreview.Text = string.sub(code, 1, 40) .. (string.len(code) > 40 and "..." or "")
            codePreview.TextColor3 = Color3.fromRGB(180, 180, 180)
            codePreview.BackgroundTransparency = 1
            codePreview.Font = Enum.Font.Code
            codePreview.TextXAlignment = Enum.TextXAlignment.Left
            codePreview.TextSize = 12
            
            local run = Instance.new("TextButton", frame)
            run.Size = UDim2.new(0, 70, 0, 25)
            run.Position = UDim2.new(1, -150, 0, 5)
            run.Text = "Execute"
            run.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
            run.TextColor3 = Color3.new(1, 1, 1)
            run.Font = Enum.Font.GothamBold
            applyCorner(run, 6)
            applyStroke(run, 1, Color3.fromRGB(120, 0, 0))
            
            setupButtonHover(run, Color3.fromRGB(200, 20, 20), Color3.fromRGB(180, 0, 0))
            
            run.MouseButton1Click:Connect(function()
                loadstring(code)()
            end)
            
            local del = Instance.new("TextButton", frame)
            del.Size = UDim2.new(0, 70, 0, 25)
            del.Position = UDim2.new(1, -75, 0, 5)
            del.Text = "Delete"
            del.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            del.TextColor3 = Color3.new(1, 1, 1)
            del.Font = Enum.Font.GothamBold
            applyCorner(del, 6)
            applyStroke(del, 1, Color3.fromRGB(70, 70, 70))
            
            setupButtonHover(del, Color3.fromRGB(70, 70, 70), Color3.fromRGB(50, 50, 50))
            
            del.MouseButton1Click:Connect(function()
                favoritesData[name] = nil
                saveFavorites(favoritesData)
                refreshFavorites()
            end)
            
            y += 70
        end
    end
    favList.CanvasSize = UDim2.new(0, 0, 0, y)
end

refreshFavorites()

local destroyBtn = Instance.new("TextButton", tabs.Settings)
destroyBtn.Size = UDim2.new(0, 130, 0, 35)
destroyBtn.Position = UDim2.new(0, 10, 0, 10)
destroyBtn.Text = "Delete GUI"
destroyBtn.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
destroyBtn.TextColor3 = Color3.new(1, 1, 1)
destroyBtn.Font = Enum.Font.GothamBold
applyCorner(destroyBtn, 6)
applyStroke(destroyBtn, 1, Color3.fromRGB(120, 0, 0))

setupButtonHover(destroyBtn, Color3.fromRGB(200, 20, 20), Color3.fromRGB(180, 0, 0))

destroyBtn.MouseButton1Click:Connect(function()
    TweenService:Create(
        main,
        TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In),
        {Size = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0.5, 0, 0.5, 0)}
    ):Play()
    wait(0.3)
    gui:Destroy()
    blur:Destroy()
end)