--[[ I don't know this language I just copy pasted the caducus script, also please reanimate before using this ]]

loadstring(game:HttpGet("https://pastebin.com/raw/XJeBNe0s"))()-- Tambahan fungsi Kill (diambil dari Anti-Slap/Fling)
local LocalPlayer = game.Players.LocalPlayer

-- Cari glove + event
local function getGlove()
	for _,v in pairs(LocalPlayer.Backpack:GetChildren()) do
		if v:IsA("Tool") and v:FindFirstChild("Event") then
			return v, v.Event
		end
	end
	if LocalPlayer.Character then
		for _,v in pairs(LocalPlayer.Character:GetChildren()) do
			if v:IsA("Tool") and v:FindFirstChild("Event") then
				return v, v.Event
			end
		end
	end
end

-- Fungsi Kill target
local function KillTarget(targetPlr)
	local glove, event = getGlove()
	if not (glove and event) then return end
	if targetPlr and targetPlr.Character then
		local hum = targetPlr.Character:FindFirstChildOfClass("Humanoid")
		if hum and hum.Health > 0 then
			spawn(function()
				while hum.Parent and hum.Health > 0 do
					event:FireServer("slash", targetPlr.Character, Vector3.new(0,-math.huge,0))
					task.wait(0.3)
				end
			end)
		end
	end
end

-- Integrasi ke efek script XJeBNe0s
-- Misalnya ketika skill mengenai player lain, panggil KillTarget
function MagnitudeDamage(Part, Magnitude, MinimumDamage, MaximumDamage, KnockBack, Type, HitSound, HitPitch)
	for _, c in pairs(workspace:GetChildren()) do
		local hum = c:FindFirstChildOfClass("Humanoid")
		local plr = game.Players:GetPlayerFromCharacter(c)
		if hum and plr and plr ~= LocalPlayer then
			local head = c:FindFirstChild("Torso") or c:FindFirstChild("HumanoidRootPart")
			if head and (head.Position - Part.Position).magnitude <= Magnitude then
				-- Panggil kill di sini
				KillTarget(plr)
			end
		end
	end
end