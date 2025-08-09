--[[
	I don't own this, creds to the owner
]]
local plr=game.Players.LocalPlayer
local guiName="FullKB"

local function createKeyboard()
local gui=Instance.new("ScreenGui",plr:WaitForChild("PlayerGui"))
gui.Name=guiName
-- rest of your keyboard creation code here (the big cursed keyboard script from before)
local f=Instance.new("Frame",gui)f.Size=UDim2.new(0,200,0,170)f.Position=UDim2.new(0.5,-100,0.5,-85)f.BackgroundColor3=Color3.fromRGB(10,10,10)f.BorderSizePixel=4 f.Active=true f.Draggable=true
task.spawn(function()while true do for h=0,1,0.01 do f.BorderColor3=Color3.fromHSV(h,1,1)task.wait(0.05)end end end)
local t=Instance.new("TextLabel",f)t.Size=UDim2.new(1,0,0,20)t.Position=UDim2.new(0,0,0,0)t.Text="keyboard | gaming"t.BackgroundTransparency=1 t.TextColor3=Color3.fromRGB(255,255,255)t.TextScaled=true t.Font=Enum.Font.Code
local join=Instance.new("TextButton",f)join.Size=UDim2.new(1,0,0,20)join.Position=UDim2.new(0,0,0,20)join.Text="join invite server"join.BackgroundColor3=Color3.fromRGB(50,200,50)join.TextColor3=Color3.new(0,0,0)join.Font=Enum.Font.Code join.TextScaled=true join.MouseButton1Click:Connect(function()setclipboard("https://discord.gg/rgXxSN72n9")end)
local vim=game:GetService("VirtualInputManager")local function key(txt,x,y,w)local k=Instance.new("TextButton",f)k.Size=UDim2.new(0,w or 18,0,18)k.Position=UDim2.new(0,x,0,y)k.Text=txt k.BackgroundColor3=Color3.fromRGB(30,30,30)k.TextColor3=Color3.new(1,1,1)k.Font=Enum.Font.Code k.TextScaled=true k.BorderSizePixel=0 k.MouseButton1Click:Connect(function()vim:SendKeyEvent(true,txt,false,game)wait()vim:SendKeyEvent(false,txt,false,game)end)end
local row1={"Q","W","E","R","T","Y","U","I","O","P"}for i,v in ipairs(row1)do key(v,(i-1)*18+5,45)end
local row2={"A","S","D","F","G","H","J","K","L"}for i,v in ipairs(row2)do key(v,(i-1)*18+14,65)end
local row3={"Z","X","C","V","B","N","M"}for i,v in ipairs(row3)do key(v,(i-1)*18+28,85)end
local numrow={"1","2","3","4","5","6","7","8","9","0"}for i,v in ipairs(numrow)do key(v,(i-1)*18+5,105)end
key("Space",5,125,80)key("Backspace",90,125,50)key("Return",145,125,50)
return gui
end

local kb=createKeyboard()
plr.CharacterAdded:Connect(function()
    wait(1)
    if plr.PlayerGui:FindFirstChild(guiName) then return end
    kb= createKeyboard()
end)