local player = game:GetService("Players").LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "NoxonExecutor"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true

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
end

local function applyStroke(inst)
    local stroke = Instance.new("UIStroke")
    stroke.Thickness = 2
    stroke.Transparency = 0.25
    stroke.Color = Color3.fromRGB(80, 80, 80)
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
main.Size = UDim2.new(0, 600, 0, 360)
main.Position = UDim2.new(0.5, -300, 0.5, -180)
main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
main.Active = true
main.Draggable = true
applyCorner(main, 8)
applyStroke(main)

local minimizer = Instance.new("TextButton", gui)
minimizer.Size = UDim2.new(0, 150, 0, 40)
minimizer.Position = UDim2.new(0, 15, 1, -50)
minimizer.Text = "Noxon Executor"
minimizer.TextColor3 = Color3.new(1, 1, 1)
minimizer.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
minimizer.Visible = false
minimizer.Font = Enum.Font.GothamBold
minimizer.TextSize = 18
applyCorner(minimizer, 6)
applyStroke(minimizer)

minimizer.MouseButton1Click:Connect(function()
    main.Visible = true
    blur.Enabled = true
    minimizer.Visible = false
end)

local close = Instance.new("TextButton", main)
close.Size = UDim2.new(0, 30, 0, 30)
close.Position = UDim2.new(1, -35, 0, 5)
close.Text = "×"
close.TextColor3 = Color3.new(1, 1, 1)
close.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
close.Font = Enum.Font.GothamBold
applyCorner(close, 6)

close.MouseButton1Click:Connect(function()
    main.Visible = false
    blur.Enabled = false
    minimizer.Visible = true
end)

local content = Instance.new("Frame", main)
content.Position = UDim2.new(0, 10, 0, 10)
content.Size = UDim2.new(1, -70, 1, -20) 
content.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
applyCorner(content, 8)

local rightMenu = Instance.new("Frame", main)
rightMenu.Size = UDim2.new(0, 50, 1, -20)
rightMenu.Position = UDim2.new(1, -60, 0, 10)
rightMenu.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
applyCorner(rightMenu, 8)
applyStroke(rightMenu)

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
    
    btn.MouseEnter:Connect(function()
        game:GetService("TweenService"):Create(
            btn, 
            TweenInfo.new(0.2), 
            {BackgroundColor3 = Color3.fromRGB(180, 0, 0)}
        ):Play()
    end)
    
    btn.MouseLeave:Connect(function()
        game:GetService("TweenService"):Create(
            btn, 
            TweenInfo.new(0.2), 
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
            button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        end
        tab.Visible = true
        btn.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
    end)
end

tabs.Executor.Visible = true
tabButtons.Executor.BackgroundColor3 = Color3.fromRGB(180, 0, 0)

local input = Instance.new("TextBox", tabs.Executor)
input.Size = UDim2.new(1, -20, 1, -70)
input.Position = UDim2.new(0, 10, 0, 10)
input.PlaceholderText = "Type your script here..."
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
applyStroke(input)

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

local clearBtn = Instance.new("TextButton", buttonContainer)
clearBtn.Size = UDim2.new(0, 80, 1, 0)
clearBtn.Position = UDim2.new(0, 90, 0, 0)
clearBtn.Text = "Clear"
clearBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
clearBtn.TextColor3 = Color3.new(1, 1, 1)
clearBtn.Font = Enum.Font.GothamBold
applyCorner(clearBtn, 6)

local favBtn = Instance.new("TextButton", buttonContainer)
favBtn.Size = UDim2.new(0, 120, 1, 0)
favBtn.Position = UDim2.new(1, -120, 0, 0)
favBtn.Text = "Add to Favorites"
favBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
favBtn.TextColor3 = Color3.new(1, 1, 1)
favBtn.Font = Enum.Font.GothamBold
applyCorner(favBtn, 6)

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
        local name = "Script " .. tostring(#favoritesData + 1)
        favoritesData[name] = input.Text
        saveFavorites(favoritesData)
        refreshFavorites()
    end
end)

local favList = Instance.new("ScrollingFrame", tabs.Favorites)
favList.Size = UDim2.new(1, -20, 1, -20)
favList.Position = UDim2.new(0, 10, 0, 10)
favList.BackgroundTransparency = 1
favList.ScrollBarThickness = 6
favList.CanvasSize = UDim2.new()

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
            applyStroke(frame)
            
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
destroyBtn.Text = "Destroy GUI"
destroyBtn.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
destroyBtn.TextColor3 = Color3.new(1, 1, 1)
destroyBtn.Font = Enum.Font.GothamBold
applyCorner(destroyBtn, 6)

destroyBtn.MouseButton1Click:Connect(function()
    gui:Destroy()
    blur:Destroy()
end)

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, -100, 0, 30)
title.Position = UDim2.new(0, 10, 0, 5)
title.Text = "Noxon Executor"
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextXAlignment = Enum.TextXAlignment.Left