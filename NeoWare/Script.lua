local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "NeoWareExecutor"
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = player:WaitForChild("PlayerGui")

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 500, 0, 400)
mainFrame.Position = UDim2.new(0.5, -250, 0.5, -200)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(0, 15, 33)
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Parent = gui

local topBar = Instance.new("Frame")
topBar.Name = "TopBar"
topBar.Size = UDim2.new(1, 0, 0, 30)
topBar.Position = UDim2.new(0, 0, 0, 0)
topBar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
topBar.BorderSizePixel = 0
topBar.Parent = mainFrame

local title = Instance.new("TextLabel")
title.Name = "Title"
title.Size = UDim2.new(0, 100, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.Text = "NeoWare"
title.TextColor3 = Color3.fromRGB(0, 162, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 14
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = topBar

local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 30, 1, 0)
closeButton.Position = UDim2.new(1, -30, 0, 0)
closeButton.BackgroundTransparency = 1
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 14
closeButton.Parent = topBar

closeButton.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

local tabButtonsFrame = Instance.new("Frame")
tabButtonsFrame.Name = "TabButtons"
tabButtonsFrame.Size = UDim2.new(1, 0, 0, 40)
tabButtonsFrame.Position = UDim2.new(0, 0, 0, 30)
tabButtonsFrame.BackgroundColor3 = Color3.fromRGB(0, 30, 60)
tabButtonsFrame.BorderSizePixel = 0
tabButtonsFrame.Parent = mainFrame

local tabs = {"Executor", "Favorites", "Settings"}
local tabButtons = {}

for i, tabName in ipairs(tabs) do
    local tabButton = Instance.new("TextButton")
    tabButton.Name = tabName .. "Tab"
    tabButton.Size = UDim2.new(1/#tabs, 0, 1, 0)
    tabButton.Position = UDim2.new((i-1)/#tabs, 0, 0, 0)
    tabButton.BackgroundColor3 = Color3.fromRGB(0, 30, 60)
    tabButton.BorderSizePixel = 0
    tabButton.Text = tabName
    tabButton.TextColor3 = Color3.fromRGB(200, 200, 200)
    tabButton.Font = Enum.Font.Gotham
    tabButton.TextSize = 12
    tabButton.Parent = tabButtonsFrame
    
    tabButtons[tabName] = tabButton
end

local contentFrame = Instance.new("Frame")
contentFrame.Name = "Content"
contentFrame.Size = UDim2.new(1, 0, 1, -70)
contentFrame.Position = UDim2.new(0, 0, 0, 70)
contentFrame.BackgroundColor3 = Color3.fromRGB(0, 23, 50)
contentFrame.BorderSizePixel = 0
contentFrame.Parent = mainFrame

local executorTab = Instance.new("ScrollingFrame")
executorTab.Name = "ExecutorTab"
executorTab.Size = UDim2.new(1, 0, 1, 0)
executorTab.Position = UDim2.new(0, 0, 0, 0)
executorTab.BackgroundTransparency = 1
executorTab.BorderSizePixel = 0
executorTab.ScrollBarThickness = 5
executorTab.Visible = true
executorTab.Parent = contentFrame

local scriptBox = Instance.new("TextBox")
scriptBox.Name = "ScriptBox"
scriptBox.Size = UDim2.new(1, -20, 1, -50)
scriptBox.Position = UDim2.new(0, 10, 0, 10)
scriptBox.BackgroundColor3 = Color3.fromRGB(0, 30, 60)
scriptBox.BorderColor3 = Color3.fromRGB(0, 60, 120)
scriptBox.Text = ""
scriptBox.TextColor3 = Color3.fromRGB(255, 255, 255)
scriptBox.Font = Enum.Font.Code
scriptBox.TextSize = 12
scriptBox.TextXAlignment = Enum.TextXAlignment.Left
scriptBox.TextYAlignment = Enum.TextYAlignment.Top
scriptBox.ClearTextOnFocus = false
scriptBox.MultiLine = true
scriptBox.Parent = executorTab

local buttonsFrame = Instance.new("Frame")
buttonsFrame.Name = "ButtonsFrame"
buttonsFrame.Size = UDim2.new(1, -20, 0, 30)
buttonsFrame.Position = UDim2.new(0, 10, 1, -40)
buttonsFrame.BackgroundTransparency = 1
buttonsFrame.Parent = executorTab

local executeButton = Instance.new("TextButton")
executeButton.Name = "ExecuteButton"
executeButton.Size = UDim2.new(0.3, 0, 1, 0)
executeButton.Position = UDim2.new(0, 0, 0, 0)
executeButton.BackgroundColor3 = Color3.fromRGB(0, 80, 160)
executeButton.BorderSizePixel = 0
executeButton.Text = "Execute"
executeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
executeButton.Font = Enum.Font.GothamBold
executeButton.TextSize = 12
executeButton.Parent = buttonsFrame

local clearButton = Instance.new("TextButton")
clearButton.Name = "ClearButton"
clearButton.Size = UDim2.new(0.3, 0, 1, 0)
clearButton.Position = UDim2.new(0.35, 0, 0, 0)
clearButton.BackgroundColor3 = Color3.fromRGB(0, 80, 160)
clearButton.BorderSizePixel = 0
clearButton.Text = "Clear"
clearButton.TextColor3 = Color3.fromRGB(255, 255, 255)
clearButton.Font = Enum.Font.GothamBold
clearButton.TextSize = 12
clearButton.Parent = buttonsFrame

local saveButton = Instance.new("TextButton")
saveButton.Name = "SaveButton"
saveButton.Size = UDim2.new(0.3, 0, 1, 0)
saveButton.Position = UDim2.new(0.7, 0, 0, 0)
saveButton.BackgroundColor3 = Color3.fromRGB(0, 80, 160)
saveButton.BorderSizePixel = 0
saveButton.Text = "Save"
saveButton.TextColor3 = Color3.fromRGB(255, 255, 255)
saveButton.Font = Enum.Font.GothamBold
saveButton.TextSize = 12
saveButton.Parent = buttonsFrame

local favoritesTab = Instance.new("ScrollingFrame")
favoritesTab.Name = "FavoritesTab"
favoritesTab.Size = UDim2.new(1, 0, 1, 0)
favoritesTab.Position = UDim2.new(0, 0, 0, 0)
favoritesTab.BackgroundTransparency = 1
favoritesTab.BorderSizePixel = 0
favoritesTab.ScrollBarThickness = 5
favoritesTab.Visible = false
favoritesTab.Parent = contentFrame

local favoritesList = Instance.new("UIListLayout")
favoritesList.Name = "FavoritesList"
favoritesList.Padding = UDim.new(0, 5)
favoritesList.Parent = favoritesTab

local settingsTab = Instance.new("ScrollingFrame")
settingsTab.Name = "SettingsTab"
settingsTab.Size = UDim2.new(1, 0, 1, 0)
settingsTab.Position = UDim2.new(0, 0, 0, 0)
settingsTab.BackgroundTransparency = 1
settingsTab.BorderSizePixel = 0
settingsTab.ScrollBarThickness = 5
settingsTab.Visible = false
settingsTab.Parent = contentFrame

local settingsList = Instance.new("UIListLayout")
settingsList.Name = "SettingsList"
settingsList.Padding = UDim.new(0, 10)
settingsList.Parent = settingsTab

local rejoinButton = Instance.new("TextButton")
rejoinButton.Name = "RejoinButton"
rejoinButton.Size = UDim2.new(1, -20, 0, 40)
rejoinButton.Position = UDim2.new(0, 10, 0, 10)
rejoinButton.BackgroundColor3 = Color3.fromRGB(0, 80, 160)
rejoinButton.BorderSizePixel = 0
rejoinButton.Text = "Rejoin Server"
rejoinButton.TextColor3 = Color3.fromRGB(255, 255, 255)
rejoinButton.Font = Enum.Font.GothamBold
rejoinButton.TextSize = 14
rejoinButton.Parent = settingsTab

local deleteButton = Instance.new("TextButton")
deleteButton.Name = "DeleteButton"
deleteButton.Size = UDim2.new(1, -20, 0, 40)
deleteButton.Position = UDim2.new(0, 10, 0, 60)
deleteButton.BackgroundColor3 = Color3.fromRGB(160, 0, 0)
deleteButton.BorderSizePixel = 0
deleteButton.Text = "Delete GUI"
deleteButton.TextColor3 = Color3.fromRGB(255, 255, 255)
deleteButton.Font = Enum.Font.GothamBold
deleteButton.TextSize = 14
deleteButton.Parent = settingsTab

local savePopup = Instance.new("Frame")
savePopup.Name = "SavePopup"
savePopup.Size = UDim2.new(0, 300, 0, 200)
savePopup.Position = UDim2.new(0.5, -150, 0.5, -100)
savePopup.AnchorPoint = Vector2.new(0.5, 0.5)
savePopup.BackgroundColor3 = Color3.fromRGB(0, 23, 50)
savePopup.BorderColor3 = Color3.fromRGB(0, 60, 120)
savePopup.Visible = false
savePopup.ZIndex = 2
savePopup.Parent = mainFrame

local popupTitle = Instance.new("TextLabel")
popupTitle.Name = "PopupTitle"
popupTitle.Size = UDim2.new(1, 0, 0, 30)
popupTitle.Position = UDim2.new(0, 0, 0, 0)
popupTitle.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
popupTitle.BorderSizePixel = 0
popupTitle.Text = "Save Script"
popupTitle.TextColor3 = Color3.fromRGB(0, 162, 255)
popupTitle.Font = Enum.Font.GothamBold
popupTitle.TextSize = 14
popupTitle.ZIndex = 3
popupTitle.Parent = savePopup

local nameLabel = Instance.new("TextLabel")
nameLabel.Name = "NameLabel"
nameLabel.Size = UDim2.new(1, -20, 0, 20)
nameLabel.Position = UDim2.new(0, 10, 0, 40)
nameLabel.BackgroundTransparency = 1
nameLabel.Text = "Name:"
nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
nameLabel.Font = Enum.Font.Gotham
nameLabel.TextSize = 12
nameLabel.TextXAlignment = Enum.TextXAlignment.Left
nameLabel.ZIndex = 3
nameLabel.Parent = savePopup

local nameBox = Instance.new("TextBox")
nameBox.Name = "NameBox"
nameBox.Size = UDim2.new(1, -20, 0, 30)
nameBox.Position = UDim2.new(0, 10, 0, 60)
nameBox.BackgroundColor3 = Color3.fromRGB(0, 30, 60)
nameBox.BorderColor3 = Color3.fromRGB(0, 60, 120)
nameBox.Text = ""
nameBox.TextColor3 = Color3.fromRGB(255, 255, 255)
nameBox.Font = Enum.Font.Gotham
nameBox.TextSize = 12
nameBox.ZIndex = 3
nameBox.Parent = savePopup

local descLabel = Instance.new("TextLabel")
descLabel.Name = "DescLabel"
descLabel.Size = UDim2.new(1, -20, 0, 20)
descLabel.Position = UDim2.new(0, 10, 0, 100)
descLabel.BackgroundTransparency = 1
descLabel.Text = "Description (Optional):"
descLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
descLabel.Font = Enum.Font.Gotham
descLabel.TextSize = 12
descLabel.TextXAlignment = Enum.TextXAlignment.Left
descLabel.ZIndex = 3
descLabel.Parent = savePopup

local descBox = Instance.new("TextBox")
descBox.Name = "DescBox"
descBox.Size = UDim2.new(1, -20, 0, 30)
descBox.Position = UDim2.new(0, 10, 0, 120)
descBox.BackgroundColor3 = Color3.fromRGB(0, 30, 60)
descBox.BorderColor3 = Color3.fromRGB(0, 60, 120)
descBox.Text = ""
descBox.TextColor3 = Color3.fromRGB(255, 255, 255)
descBox.Font = Enum.Font.Gotham
descBox.TextSize = 12
descBox.ZIndex = 3
descBox.Parent = savePopup

local saveConfirmButton = Instance.new("TextButton")
saveConfirmButton.Name = "SaveConfirmButton"
saveConfirmButton.Size = UDim2.new(0.4, 0, 0, 30)
saveConfirmButton.Position = UDim2.new(0.1, 0, 1, -40)
saveConfirmButton.BackgroundColor3 = Color3.fromRGB(0, 80, 160)
saveConfirmButton.BorderSizePixel = 0
saveConfirmButton.Text = "Save"
saveConfirmButton.TextColor3 = Color3.fromRGB(255, 255, 255)
saveConfirmButton.Font = Enum.Font.GothamBold
saveConfirmButton.TextSize = 12
saveConfirmButton.ZIndex = 3
saveConfirmButton.Parent = savePopup

local saveCancelButton = Instance.new("TextButton")
saveCancelButton.Name = "SaveCancelButton"
saveCancelButton.Size = UDim2.new(0.4, 0, 0, 30)
saveCancelButton.Position = UDim2.new(0.5, 0, 1, -40)
saveCancelButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
saveCancelButton.BorderSizePixel = 0
saveCancelButton.Text = "Cancel"
saveCancelButton.TextColor3 = Color3.fromRGB(255, 255, 255)
saveCancelButton.Font = Enum.Font.GothamBold
saveCancelButton.TextSize = 12
saveCancelButton.ZIndex = 3
saveCancelButton.Parent = savePopup

local dragging = false
local dragInput, dragStart, startPos

local function update(input)
    local delta = input.Position - dragStart
    mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

topBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

topBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

local function switchTab(tabName)
    executorTab.Visible = (tabName == "Executor")
    favoritesTab.Visible = (tabName == "Favorites")
    settingsTab.Visible = (tabName == "Settings")
    
    for name, button in pairs(tabButtons) do
        if name == tabName then
            button.BackgroundColor3 = Color3.fromRGB(0, 50, 100)
        else
            button.BackgroundColor3 = Color3.fromRGB(0, 30, 60)
        end
    end
end

for name, button in pairs(tabButtons) do
    button.MouseButton1Click:Connect(function()
        switchTab(name)
    end)
end

executeButton.MouseButton1Click:Connect(function()
    local scriptText = scriptBox.Text
    if scriptText and scriptText ~= "" then
        local success, error = pcall(function()
            loadstring(scriptText)()
        end)
        if not success then
            warn("Execution error: " .. error)
        end
    end
end)

clearButton.MouseButton1Click:Connect(function()
    scriptBox.Text = ""
end)

saveButton.MouseButton1Click:Connect(function()
    savePopup.Visible = true
    nameBox.Text = ""
    descBox.Text = ""
end)

saveConfirmButton.MouseButton1Click:Connect(function()
    local name = nameBox.Text
    if name and name ~= "" then
        local scriptData = {
            Name = name,
            Description = descBox.Text,
            Script = scriptBox.Text,
            Timestamp = os.time()
        }
        
        if not _G.FavoritedScripts then
            _G.FavoritedScripts = {}
        end
        table.insert(_G.FavoritedScripts, scriptData)
        
        local jsonData = HttpService:JSONEncode(_G.FavoritedScripts)
        
        if isfolder then
            if not isfolder("FavoritedScripts") then
                makefolder("FavoritedScripts")
            end
            writefile("FavoritedScripts/scripts.json", jsonData)
        end
    end
    savePopup.Visible = false
end)

saveCancelButton.MouseButton1Click:Connect(function()
    savePopup.Visible = false
end)

rejoinButton.MouseButton1Click:Connect(function()
    TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, player)
end)

deleteButton.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

local function loadFavorites()
    if not _G.FavoritedScripts then
        if isfolder and isfile then
            if isfolder("FavoritedScripts") and isfile("FavoritedScripts/scripts.json") then
                local success, result = pcall(function()
                    local jsonData = readfile("FavoritedScripts/scripts.json")
                    _G.FavoritedScripts = HttpService:JSONDecode(jsonData)
                end)
                if not success then
                    _G.FavoritedScripts = {}
                end
            else
                _G.FavoritedScripts = {}
            end
        else
            _G.FavoritedScripts = {}
        end
    end
    
    for _, child in ipairs(favoritesTab:GetChildren()) do
        if child:IsA("Frame") then
            child:Destroy()
        end
    end
    
    if _G.FavoritedScripts and #_G.FavoritedScripts > 0 then
        for i, scriptData in ipairs(_G.FavoritedScripts) do
            local scriptFrame = Instance.new("Frame")
            scriptFrame.Name = "ScriptFrame" .. i
            scriptFrame.Size = UDim2.new(1, -20, 0, 80)
            scriptFrame.Position = UDim2.new(0, 10, 0, (i-1)*85)
            scriptFrame.BackgroundColor3 = Color3.fromRGB(0, 30, 60)
            scriptFrame.BorderColor3 = Color3.fromRGB(0, 60, 120)
            scriptFrame.Parent = favoritesTab
            
            local nameLabel = Instance.new("TextLabel")
            nameLabel.Name = "NameLabel"
            nameLabel.Size = UDim2.new(1, 0, 0, 20)
            nameLabel.Position = UDim2.new(0, 5, 0, 5)
            nameLabel.BackgroundTransparency = 1
            nameLabel.Text = "Name: " .. scriptData.Name
            nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            nameLabel.Font = Enum.Font.Gotham
            nameLabel.TextSize = 12
            nameLabel.TextXAlignment = Enum.TextXAlignment.Left
            nameLabel.Parent = scriptFrame
            
            local descLabel = Instance.new("TextLabel")
            descLabel.Name = "DescLabel"
            descLabel.Size = UDim2.new(1, 0, 0, 20)
            descLabel.Position = UDim2.new(0, 5, 0, 25)
            descLabel.BackgroundTransparency = 1
            descLabel.Text = "Desc: " .. (scriptData.Description ~= "" and scriptData.Description or "No description")
            descLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
            descLabel.Font = Enum.Font.Gotham
            descLabel.TextSize = 11
            descLabel.TextXAlignment = Enum.TextXAlignment.Left
            descLabel.Parent = scriptFrame
            
            local executeBtn = Instance.new("TextButton")
            executeBtn.Name = "ExecuteBtn"
            executeBtn.Size = UDim2.new(0.4, 0, 0, 25)
            executeBtn.Position = UDim2.new(0, 5, 1, -30)
            executeBtn.BackgroundColor3 = Color3.fromRGB(0, 80, 160)
            executeBtn.BorderSizePixel = 0
            executeBtn.Text = "Execute"
            executeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            executeBtn.Font = Enum.Font.GothamBold
            executeBtn.TextSize = 12
            executeBtn.Parent = scriptFrame
            
            executeBtn.MouseButton1Click:Connect(function()
                local success, error = pcall(function()
                    loadstring(scriptData.Script)()
                end)
                if not success then
                    warn("Execution error: " .. error)
                end
            end)
            
            local deleteBtn = Instance.new("TextButton")
            deleteBtn.Name = "DeleteBtn"
            deleteBtn.Size = UDim2.new(0.4, 0, 0, 25)
            deleteBtn.Position = UDim2.new(0.6, 0, 1, -30)
            deleteBtn.BackgroundColor3 = Color3.fromRGB(160, 0, 0)
            deleteBtn.BorderSizePixel = 0
            deleteBtn.Text = "Delete"
            deleteBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            deleteBtn.Font = Enum.Font.GothamBold
            deleteBtn.TextSize = 12
            deleteBtn.Parent = scriptFrame
            
            deleteBtn.MouseButton1Click:Connect(function()
                table.remove(_G.FavoritedScripts, i)
                if isfolder and writefile then
                    local jsonData = HttpService:JSONEncode(_G.FavoritedScripts)
                    writefile("FavoritedScripts/scripts.json", jsonData)
                end
                loadFavorites()
            end)
        end
    else
        local noScriptsLabel = Instance.new("TextLabel")
        noScriptsLabel.Name = "NoScriptsLabel"
        noScriptsLabel.Size = UDim2.new(1, 0, 0, 30)
        noScriptsLabel.Position = UDim2.new(0, 0, 0.5, -15)
        noScriptsLabel.BackgroundTransparency = 1
        noScriptsLabel.Text = "No saved scripts"
        noScriptsLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
        noScriptsLabel.Font = Enum.Font.Gotham
        noScriptsLabel.TextSize = 14
        noScriptsLabel.Parent = favoritesTab
    end
end

tabButtons["Favorites"].MouseButton1Click:Connect(function()
    switchTab("Favorites")
    loadFavorites()
end)

switchTab("Executor")