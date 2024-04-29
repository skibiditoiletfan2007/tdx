repeat wait() until game:IsLoaded()
	local Terrain = workspace:FindFirstChildOfClass('Terrain')
	local Lighting = game:GetService("Lighting")
	Terrain.WaterWaveSize = 0
	Terrain.WaterWaveSpeed = 0
	Terrain.WaterReflectance = 0
	Terrain.WaterTransparency = 0
	Lighting.GlobalShadows = falseA
	Lighting.FogEnd = 9e9
	settings().Rendering.QualityLevel = 1
	for i,v in pairs(game:GetDescendants()) do
		if v:IsA("Part") or v:IsA("UnionOperation") or v:IsA("MeshPart") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
			v.Material = "Plastic"
			v.Reflectance = 0
		elseif v:IsA("Decal") then
			v.Transparency = 1
		elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
			v.Lifetime = NumberRange.new(0)
		elseif v:IsA("Explosion") then
			v.BlastPressure = 1
			v.BlastRadius = 1
		end
	end
	for i,v in pairs(Lighting:GetDescendants()) do
		if v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("BloomEffect") or v:IsA("DepthOfFieldEffect") then
			v.Enabled = false
		end
	end
	workspace.DescendantAdded:Connect(function(child)
		task.spawn(function()
			if child:IsA('ForceField') then
				RunService.Heartbeat:Wait()
				child:Destroy()
			elseif child:IsA('Sparkles') then
				RunService.Heartbeat:Wait()
				child:Destroy()
			elseif child:IsA('Smoke') or child:IsA('Fire') then
				RunService.Heartbeat:Wait()
				child:Destroy()
			end
		end)
	end)
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Loading TDX.Automaton.Strategizer", -- Required
	Text = "This will take 5 seconds.", -- Required
	Icon = "rbxassetid://16373172159", -- Optional
        Duration = 9
})
wait(5)
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "TDX.Automaton.Strategizer has loaded", -- Required
	Text = "Please enjoy Singularity Solo Strat", -- Required
	Icon = "rbxassetid://16373172159", -- Optional
})
local towerplacementtables = {
    ["ArmoredFactories"] = {
        ["AF1"] = Vector3.new(398.5396423339844, -127.22732543945312, -63.33705139160156), -- 1st af
        ["AF2"] = Vector3.new(398.95770263671875, -127.00090026855469, -70.62784576416016), -- 2nd af
        ["AF3"] = Vector3.new(405.97552490234375, -127.22732543945312, -63.28693389892578), -- 3rd af
        ["AF4"] = Vector3.new(406.5561828613281, -127.1180648803711, -71.4917221069336), -- 4th af
        ["AF5"] = Vector3.new(413.2443542480469, -127.22732543945312, -63.43455123901367),-- 5th af
        ["AF6"] = Vector3.new(414.32012939453125, -127.22732543945312, -72.27180480957031) -- 6th af
    },
    ["Artilleries"] = {
        ["Artillery1"] = {
            ["Position"] = Vector3.new(370.0838623046875, -127.27825927734375, -85.47673797607422),
            ["AimPosition"] = Vector3.new(369.0572814941406, -126.97100830078125, -80.68899536132812),
            ["Name"] = "Artillery1",
            ["HasBeenPlaced"] = false
        },
        ["Artillery2"] = {
            ["Position"] = Vector3.new(375.8262939453125, -126.94573974609375, -85.47905731201172),
            ["AimPosition"] = Vector3.new(376.2490539550781, -126.97100830078125, -80.68899536132812),
            ["Name"] = "Artillery2",
            ["HasBeenPlaced"] = false
        },
        ["Artillery3"] = {
            ["Position"] = Vector3.new(380.99200439453125, -126.94607543945312, -85.33231353759766),
            ["AimPosition"] = Vector3.new(379.3341369628906, -126.97100830078125, -80.68899536132812),
            ["Name"] = "Artillery3",
            ["HasBeenPlaced"] = false
        },
        ["Artillery4"] = {
            ["Position"] = Vector3.new(386.21282958984375, -126.94630432128906, -85.32252502441406),
            ["AimPosition"] = Vector3.new(382.77655029296875, -126.97100830078125, -80.68899536132812),
            ["Name"] = "Artillery4",
            ["HasBeenPlaced"] = false
        },
        ["Artillery5"] = {
            ["Position"] = Vector3.new(391.2452697753906, -126.94929504394531, -85.7546615600586),
            ["AimPosition"] = Vector3.new(392.595947265625, -126.97100830078125, -80.68899536132812),
            ["Name"] = "Artillery5",
            ["HasBeenPlaced"] = false
        },
        ["Artillery6"] = {
            ["Position"] = Vector3.new(391.9332275390625, -126.95043182373047, -91.09562683105469),
            ["AimPosition"] = Vector3.new(390.91302490234375, -126.97100830078125, -80.68899536132812),
            ["Name"] = "Artillery6",
            ["HasBeenPlaced"] = false
        },
        ["Artillery7"] = {
            ["Position"] = Vector3.new(386.8272705078125, -126.94775390625, -90.85816192626953),
            ["AimPosition"] = Vector3.new(388.7606506347656, -126.97100830078125, -80.68899536132812),
            ["Name"] = "Artillery7",
            ["HasBeenPlaced"] = false
        },
        ["Artillery8"] = {
            ["Position"] = Vector3.new(381.2405700683594, -126.94175720214844, -90.76663970947266),
            ["AimPosition"] = Vector3.new(390.5616760253906, -126.97100830078125, -80.68899536132812),
            ["Name"] = "Artillery8",
            ["HasBeenPlaced"] = false
        },
        ["Artillery9"] = {
            ["Position"] = Vector3.new(375.9569091796875, -126.94159698486328, -90.68143463134766),
            ["AimPosition"] = Vector3.new(387.0509948730469, -126.97100830078125, -80.68899536132812),
            ["Name"] = "Artillery9",
            ["HasBeenPlaced"] = false
        },
        ["Artillery10"] = {
            ["Position"] = Vector3.new(370.3656311035156, -127.27825164794922, -90.657470703125),
            ["AimPosition"] = Vector3.new(380.7113342285156, -126.97100830078125, -80.68899536132812),
            ["Name"] = "Artillery10",
            ["HasBeenPlaced"] = false
        },
        ["Artillery11"] = {
            ["Position"] = Vector3.new(391.9324035644531, -126.95243072509766, -96.26283264160156),
            ["AimPosition"] = Vector3.new(393.9903564453125, -126.97100830078125, -80.68899536132812),
            ["Name"] = "Artillery11",
            ["HasBeenPlaced"] = false
        },
        ["Artillery12"] = {
            ["Position"] = Vector3.new(386.9351806640625, -126.9499282836914, -95.98860168457031),
            ["AimPosition"] = Vector3.new(392.096923828125, -126.97100830078125, -102.40711212158203),
            ["Name"] = "Artillery12",
            ["HasBeenPlaced"] = false
        },
        ["Artillery13"] = {
            ["Position"] = Vector3.new(381.9022521972656, -126.94111633300781, -95.84105682373047),
            ["AimPosition"] = Vector3.new(389.01336669921875, -126.97100830078125, -103.19760131835938),
            ["Name"] = "Artillery13",
            ["HasBeenPlaced"] = false
        },
        ["Artillery14"] = {
            ["Position"] = Vector3.new(376.34906005859375, -126.9375991821289, -95.71903991699219),
            ["AimPosition"] = Vector3.new(384.9753112792969, -126.97100830078125, -104.2327880859375),
            ["Name"] = "Artillery14",
            ["HasBeenPlaced"] = false
        },
        ["Artillery15"] = {
            ["Position"] = Vector3.new(370.9622802734375, -127.27825164794922, -96.61361694335938),
            ["AimPosition"] = Vector3.new(380.9340515136719, -126.97100830078125, -105.26879119873047),
            ["Name"] = "Artillery15",
            ["HasBeenPlaced"] = false
        },
    },
    ["Railgunners"] = {
        ["RG1"] = {
            ["Position"] = Vector3.new(372.39031982421875, -127.27825927734375, -48.79142761230469),
        },
        ["RG2"] = {
            ["Position"] = Vector3.new(391.2031555175781, -127.22732543945312, -59.27954864501953),
        },
        ["RG3"] = {
            ["Position"] = Vector3.new(388.5686950683594, -127.27825164794922, -55.61369705200195),
        },
        ["RG4"] = {
            ["Position"] = Vector3.new(385.38873291015625, -127.27825927734375, -52.06122589111328),
        },
        ["RG5"] = {
            ["Position"] = Vector3.new(381.8244323730469, -127.27825164794922, -49.4122200012207),
        },
        ["RG6"] = {
            ["Position"] = Vector3.new(377.13330078125, -127.27825164794922, -48.41914367675781),
        },
    }
}
local equippedtowers = {
"John",
"Grenadier",
"Armored Factory",
"Artillery",
"Railgunner",
}
local wavecount = game.Players.LocalPlayer.PlayerGui.Interface.GameInfoBar.Wave.WaveText
local timer = game.Players.LocalPlayer.PlayerGui.Interface.GameInfoBar.TimeLeft.TimeLeftText
local cashcount = game.Players.LocalPlayer.leaderstats.Cash
local towercount = 0
local function skipWave()
    local args = {
        [1] = true
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("SkipWaveVoteCast"):FireServer(unpack(args))
end

local function changeTargetting(placementcount, targetting)
    local args = {
        [1] = placementcount,
        [2] = targetting
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ChangeQueryType"):FireServer(unpack(args))
end

local function placeTower(number, tower, cframe, fuckinartillerything)
    local args = {
        [1] = number,
        [2] = tower,
        [3] = cframe,
        [4] = 0,
        [5] = fuckinartillerything
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PlaceTower"):InvokeServer(unpack(args))
end

local function upgradeTower(placementcount, path)
    local args = {
        [1] = placementcount,
        [2] = path,
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("TowerUpgradeRequest"):FireServer(unpack(args))
end

local towerpartsfolder = Instance.new("Folder", workspace)
towerpartsfolder.Name = "TowerPartsFolder"

for i,v in pairs(towerplacementtables["Artilleries"]) do
    local NewInstance = Instance.new("Part", towerpartsfolder)
    NewInstance.Size = Vector3.new(2,2,2)
    NewInstance.Transparency = 0.2
    NewInstance.Anchored = true
    NewInstance.CanCollide = false
    NewInstance.Position = v["Position"]
    NewInstance.Name = v["Name"]
end
local args = {
    [1] = "Expert"
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("DifficultyVoteCast"):FireServer(unpack(args))
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("DifficultyVoteReady"):FireServer()
local args = {
    [1] = true
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ToggleSpeedupTier1"):FireServer(unpack(args))
spawn(function()
    while task.wait() do
        local wave = tonumber(wavecount.Text:match("%d+"))
         if wave ~= 30 then
            if timer.Text == "00:44" or timer.Text == "01:44" then
                skipWave() --the auto skip
            end
         end
         if wave == 30 then
            if timer.Text == "03:25" then
                skipWave() --the auto skip
            end
        end
    end
end)
---------------------------------------------------------------- 1st Grenadier and John
repeat wait() until cashcount.Value > 1
    placeTower(231704.361675041, "Grenadier", Vector3.new(378.68121337890625, -127.27825164794922, -64.45991516113281)) --1st Grenadier
    towercount = towercount + 1 -- NOTE: tc is 1
    upgradeTower(1, 2)
wait(0.3)
repeat wait() until cashcount.Value >= 150 
    upgradeTower(1, 1)
wait(0.3)
changeTargetting(1, 1)
repeat wait() until cashcount.Value > 300
    placeTower(232685.71528394602, "John", Vector3.new(375.6283264160156, -127.27825927734375, -64.65860748291016)) --1st John
    towercount = towercount + 1 -- NOTE: tc is 2
wait(0.3)
repeat wait() until cashcount.Value >= 125 
    upgradeTower(2, 1)
wait(0.3)
repeat wait() until cashcount.Value >= 450
    upgradeTower(2, 1)
wait(0.3)
repeat wait() until cashcount.Value >= 1400
    upgradeTower(2, 1)
wait(0.3)
repeat wait() until cashcount.Value >= 100
    upgradeTower(2, 2)
wait(0.3)
repeat wait() until cashcount.Value >= 275
    upgradeTower(2, 2)
wait(0.3)
repeat wait() until cashcount.Value >= 750
    upgradeTower(1, 2)
wait(0.3)
repeat wait() until cashcount.Value >= 450
    upgradeTower(1, 1)
wait(0.3)
---------------------------------------------------------------- Bottom Armored Factory
repeat wait() until cashcount.Value >= 800
    placeTower(203002.55554140703, "Armored Factory", towerplacementtables["ArmoredFactories"]["AF1"])
    towercount = towercount + 1 -- NOTE: tc is 3
wait(0.3)
repeat wait() until cashcount.Value >= 700
    upgradeTower(3, 1)
wait(0.3)
repeat wait() until cashcount.Value >= 300
    upgradeTower(3, 2)
wait(0.3)
repeat wait() until cashcount.Value >= 400
    upgradeTower(3, 2)
wait(0.3)
repeat wait() until cashcount.Value >= 6000
    upgradeTower(3, 2)
wait(0.3)
repeat wait() until cashcount.Value >= 1500
    upgradeTower(3, 1)
wait(0.3)
repeat wait() until cashcount.Value >= 800
    placeTower(203022.429217485, "Armored Factory", towerplacementtables["ArmoredFactories"]["AF2"])
    towercount = towercount + 1 -- NOTE: tc is 4
wait(0.3)
repeat wait() until cashcount.Value >= 700
    upgradeTower(4, 1)
wait(0.3)
repeat wait() until cashcount.Value >= 300
    upgradeTower(4, 2)
wait(0.3)
repeat wait() until cashcount.Value >= 400
    upgradeTower(4, 2)
wait(0.3)
repeat wait() until cashcount.Value >= 6000
    upgradeTower(4, 2)
wait(0.3)
repeat wait() until cashcount.Value >= 1500
    upgradeTower(4, 1)
wait(0.3)
repeat wait() until cashcount.Value >= 800
    placeTower(203039.920298948, "Armored Factory", towerplacementtables["ArmoredFactories"]["AF3"])
    towercount = towercount + 1 -- NOTE: tc is 5
wait(0.3)
repeat wait() until cashcount.Value >= 700
    upgradeTower(5, 1)
wait(0.3)
repeat wait() until cashcount.Value >= 300
    upgradeTower(5, 2)
wait(0.3)
repeat wait() until cashcount.Value >= 400
    upgradeTower(5, 2)
wait(0.3)
repeat wait() until cashcount.Value >= 6000
    upgradeTower(5, 2)
wait(0.3)
repeat wait() until cashcount.Value >= 1500
    upgradeTower(5, 1)
wait(0.3)
---------------------------------------------------------------- Top Armored Factory
repeat wait() until cashcount.Value >= 800
    placeTower(206307.60729229602, "Armored Factory", towerplacementtables["ArmoredFactories"]["AF4"])
    towercount = towercount + 1 -- NOTE: tc is 6
wait(0.3)
repeat wait() until cashcount.Value >= 700
    upgradeTower(6, 1)
wait(0.3)
repeat wait() until cashcount.Value >= 1500
    upgradeTower(6, 1)
wait(0.3)
repeat wait() until cashcount.Value >= 3250
    upgradeTower(6, 1)
wait(0.3)
repeat wait() until cashcount.Value >= 8000
    upgradeTower(6, 1)
wait(0.3)
repeat wait() until cashcount.Value >= 300
    upgradeTower(6, 2)
wait(0.3)
repeat wait() until cashcount.Value >= 400
    upgradeTower(6, 2)
wait(0.3)
repeat wait() until cashcount.Value >= 800
    placeTower(206316.309207912, "Armored Factory", towerplacementtables["ArmoredFactories"]["AF5"])
    towercount = towercount + 1 -- NOTE: tc is 7
wait(0.3)
repeat wait() until cashcount.Value >= 700
    upgradeTower(7, 1)
wait(0.3)
repeat wait() until cashcount.Value >= 1500
    upgradeTower(7, 1)
wait(0.3)
repeat wait() until cashcount.Value >= 3250
    upgradeTower(7, 1)
wait(0.3)
repeat wait() until cashcount.Value >= 8000
    upgradeTower(7, 1)
wait(0.3)
repeat wait() until cashcount.Value >= 300
    upgradeTower(7, 2)
wait(0.3)
repeat wait() until cashcount.Value >= 400
    upgradeTower(7, 2)
wait(0.3)
repeat wait() until cashcount.Value >= 800
    placeTower(206908.694369486, "Armored Factory", towerplacementtables["ArmoredFactories"]["AF6"])
    towercount = towercount + 1 -- NOTE: tc is 8
wait(0.3)
repeat wait() until cashcount.Value >= 700
    upgradeTower(8, 1)
wait(0.3)
repeat wait() until cashcount.Value >= 1500
    upgradeTower(8, 1)
wait(0.3)
repeat wait() until cashcount.Value >= 3250
    upgradeTower(8, 1)
wait(0.3)
repeat wait() until cashcount.Value >= 8000
    upgradeTower(8, 1)
wait(0.3)
repeat wait() until cashcount.Value >= 300
    upgradeTower(8, 2)
wait(0.3)
repeat wait() until cashcount.Value >= 400
    upgradeTower(8, 2)
wait(0.3)
---------------------------------------------------------------- Upgarding Armored Factory
repeat wait() until cashcount.Value >= 35000
    upgradeTower(6, 1)
wait(0.3)
repeat wait() until cashcount.Value >= 35000
    upgradeTower(7, 1)
wait(0.3)
repeat wait() until cashcount.Value >= 35000
    upgradeTower(8, 1)
wait(0.3)
local args = {
    [1] = 1
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("SellTower"):FireServer(unpack(args)) wait(0.3)
local args = {
    [1] = 2
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("SellTower"):FireServer(unpack(args)) wait(0.3)
local args = {
    [1] = 3
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("SellTower"):FireServer(unpack(args))
wait(0.3)
---------------------------------------------------------------- Placing New Top Armored Factory
repeat wait() until cashcount.Value >= 800
    placeTower(203002.55554140703, "Armored Factory", towerplacementtables["ArmoredFactories"]["AF1"])
wait(0.3)
repeat wait() until cashcount.Value >= 700
    upgradeTower(3, 1) wait(0.3)
repeat wait() until cashcount.Value >= 1500
    upgradeTower(3, 1) wait(0.3)
repeat wait() until cashcount.Value >= 3250
    upgradeTower(3, 1) wait(0.3)
repeat wait() until cashcount.Value >= 8000
    upgradeTower(3, 1) wait(0.3)
repeat wait() until cashcount.Value >= 35000
    upgradeTower(3, 1) wait(0.3)
repeat wait() until cashcount.Value >= 300
    upgradeTower(3, 2) wait(0.3)
repeat wait() until cashcount.Value >= 400
    upgradeTower(3, 2) wait(0.3)
repeat wait() until cashcount.Value >= 800
local args = {
    [1] = 4
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("SellTower"):FireServer(unpack(args))
wait(0.3)
    placeTower(203022.429217485, "Armored Factory", towerplacementtables["ArmoredFactories"]["AF2"])
wait(0.3)
repeat wait() until cashcount.Value >= 700
    upgradeTower(4, 1)
wait(0.3)
repeat wait() until cashcount.Value >= 1500
    upgradeTower(4, 1)
wait(0.3)
repeat wait() until cashcount.Value >= 3250
    upgradeTower(4, 1)
wait(0.3)
repeat wait() until cashcount.Value >= 8000
    upgradeTower(4, 1)
wait(0.3)
repeat wait() until cashcount.Value >= 35000
    upgradeTower(4, 1)
wait(0.3)
repeat wait() until cashcount.Value >= 300
    upgradeTower(4, 2)
wait(0.3)
repeat wait() until cashcount.Value >= 400
    upgradeTower(4, 2)
wait(0.3)
local args = {
    [1] = 5
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("SellTower"):FireServer(unpack(args))
wait(0.3)
repeat wait() until cashcount.Value >= 800
    placeTower(203039.920298948, "Armored Factory", towerplacementtables["ArmoredFactories"]["AF3"])
wait(0.3)
repeat wait() until cashcount.Value >= 700
    upgradeTower(5, 1)
wait(0.3)
repeat wait() until cashcount.Value >= 1500
    upgradeTower(5, 1)
wait(0.3)
repeat wait() until cashcount.Value >= 3250
    upgradeTower(5, 1)
wait(0.3)
repeat wait() until cashcount.Value >= 8000
    upgradeTower(5, 1)
wait(0.3)
repeat wait() until cashcount.Value >= 35000
    upgradeTower(5, 1)
wait(0.3)
repeat wait() until cashcount.Value >= 300
    upgradeTower(5, 2)
wait(0.3)
repeat wait() until cashcount.Value >= 400
    upgradeTower(5, 2)
wait(0.3)
---------------------------------------------------------------- Artilleries
repeat wait() until cashcount.Value >= 34600
    placeTower(255544.471411, "Artillery", towerplacementtables["Artilleries"]["Artillery1"]["Position"], towerplacementtables["Artilleries"]["Artillery1"]["AimPosition"])
    towerplacementtables["Artilleries"]["Artillery1"]["HasBeenPlaced"] = true
    wait(0.3)
    upgradeTower(2, 1) wait(0.3)
    upgradeTower(2, 1) wait(0.3)
    upgradeTower(2, 1) wait(0.3)
    upgradeTower(2, 1) wait(0.3)
    upgradeTower(2, 1) wait(0.3)
    upgradeTower(2, 2) wait(0.3)
    upgradeTower(2, 2) wait(0.3)
    changeTargetting(2, 2) wait(0.3)
repeat wait() until cashcount.Value >= 34600
    placeTower(255564.62569400202, "Artillery", towerplacementtables["Artilleries"]["Artillery2"]["Position"], towerplacementtables["Artilleries"]["Artillery2"]["AimPosition"])
    towerplacementtables["Artilleries"]["Artillery2"]["HasBeenPlaced"] = true
    print(towerplacementtables["Artilleries"]["Artillery2"]["HasBeenPlaced"])
    wait(0.3)
    upgradeTower(1, 1) wait(0.3)
    upgradeTower(1, 1) wait(0.3)
    upgradeTower(1, 1) wait(0.3)
    upgradeTower(1, 1) wait(0.3)
    upgradeTower(1, 1) wait(0.3)
    upgradeTower(1, 2) wait(0.3)
    upgradeTower(1, 2) wait(0.3)
    changeTargetting(1, 2) wait(0.3)
repeat wait() until cashcount.Value >= 34600
    placeTower(255573.68295215603, "Artillery", towerplacementtables["Artilleries"]["Artillery3"]["Position"], towerplacementtables["Artilleries"]["Artillery3"]["AimPosition"])
    towerplacementtables["Artilleries"]["Artillery3"]["HasBeenPlaced"] = true
    print(towerplacementtables["Artilleries"]["Artillery3"]["HasBeenPlaced"])
    wait(0.3)
    upgradeTower(9, 1) wait(0.3)
    upgradeTower(9, 1) wait(0.3)
    upgradeTower(9, 1) wait(0.3)
    upgradeTower(9, 1) wait(0.3)
    upgradeTower(9, 1) wait(0.3)
    upgradeTower(9, 2) wait(0.3)
    upgradeTower(9, 2) wait(0.3)
    changeTargetting(9, 2) wait(0.3)
    for i,v in pairs(workspace.Towers:GetChildren()) do
        if i == 8 and v.Name == "Artillery" then
           v:SetAttribute("ScriptPlacement", 9)
        end
    end
    workspace.DescendantRemoving:Connect(function(des)
        if des:GetAttribute("ScriptPlacement") == 9 then
           game:GetService("StarterGui"):SetCore("SendNotification",{
                Title = "T.A.S", -- Required
                Text = "Replacing Art. 3", -- Required
                Icon = "rbxassetid://16373172159", -- Optional
           })
        end
    end)
repeat wait() until cashcount.Value >= 34600
    placeTower(255584.83169746402, "Artillery", towerplacementtables["Artilleries"]["Artillery4"]["Position"], towerplacementtables["Artilleries"]["Artillery4"]["AimPosition"])
    towerplacementtables["Artilleries"]["Artillery4"]["HasBeenPlaced"] = true
    print(towerplacementtables["Artilleries"]["Artillery4"]["HasBeenPlaced"])
    wait(0.3)
    upgradeTower(10, 1) wait(0.3)
    upgradeTower(10, 1) wait(0.3)
    upgradeTower(10, 1) wait(0.3)
    upgradeTower(10, 1) wait(0.3)
    upgradeTower(10, 1) wait(0.3)
    upgradeTower(10, 2) wait(0.3)
    upgradeTower(10, 2) wait(0.3)
    changeTargetting(10, 2) wait(0.3)
    for i,v in pairs(workspace.Towers:GetChildren()) do
        if i == 9 and v.Name == "Artillery" then
           v:SetAttribute("ScriptPlacement", 10)
        end
    end
    workspace.DescendantRemoving:Connect(function(des)
        if des:GetAttribute("ScriptPlacement") == 10 then
           game:GetService("StarterGui"):SetCore("SendNotification",{
                Title = "T.A.S", -- Required
                Text = "Replacing Art. 4", -- Required
                Icon = "rbxassetid://16373172159", -- Optional
           })
        end
    end)
repeat wait() until cashcount.Value >= 34600
    placeTower(256669.66677699002, "Artillery", towerplacementtables["Artilleries"]["Artillery5"]["Position"], towerplacementtables["Artilleries"]["Artillery5"]["AimPosition"])
    towerplacementtables["Artilleries"]["Artillery5"]["HasBeenPlaced"] = true
    print(towerplacementtables["Artilleries"]["Artillery5"]["HasBeenPlaced"])
    wait(0.3)
    upgradeTower(11, 1) wait(0.3)
    upgradeTower(11, 1) wait(0.3)
    upgradeTower(11, 1) wait(0.3)
    upgradeTower(11, 1) wait(0.3)
    upgradeTower(11, 1) wait(0.3)
    upgradeTower(11, 2) wait(0.3)
    upgradeTower(11, 2) wait(0.3)
local args = {
    [1] = 2
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("SellTower"):FireServer(unpack(args)) wait(0.3)
repeat wait() until cashcount.Value >= 34600
    placeTower(255544.471411, "Artillery", towerplacementtables["Artilleries"]["Artillery1"]["Position"], towerplacementtables["Artilleries"]["Artillery1"]["AimPosition"])
    towerplacementtables["Artilleries"]["Artillery1"]["HasBeenPlaced"] = true
    wait(0.1)
    upgradeTower(2, 1) wait(0.1)
    upgradeTower(2, 1) wait(0.1)
    upgradeTower(2, 1) wait(0.1)
    upgradeTower(2, 1) wait(0.1)
    upgradeTower(2, 1) wait(0.1)
    upgradeTower(2, 2) wait(0.1)
    upgradeTower(2, 2) wait(0.1)
    changeTargetting(2, 2) wait(0.3)
repeat wait() until cashcount.Value >= 34600
    placeTower(256676.72352014502, "Artillery", towerplacementtables["Artilleries"]["Artillery6"]["Position"], towerplacementtables["Artilleries"]["Artillery6"]["AimPosition"])
    towerplacementtables["Artilleries"]["Artillery6"]["HasBeenPlaced"] = true
    print(towerplacementtables["Artilleries"]["Artillery6"]["HasBeenPlaced"])
    wait(0.3)
    upgradeTower(12, 1) wait(0.3)
    upgradeTower(12, 1) wait(0.3)
    upgradeTower(12, 1) wait(0.3)
    upgradeTower(12, 1) wait(0.3)
    upgradeTower(12, 1) wait(0.3)
    upgradeTower(12, 2) wait(0.3)
    upgradeTower(12, 2) wait(0.3)
    changeTargetting(12, 2) wait(0.3)
    for i,v in pairs(workspace.Towers:GetChildren()) do
        if i == 11 and v.Name == "Artillery" then
           v:SetAttribute("ScriptPlacement", 12)
        end
    end
    workspace.DescendantRemoving:Connect(function(des)
        if des:GetAttribute("ScriptPlacement") == 12 then
           game:GetService("StarterGui"):SetCore("SendNotification",{
                Title = "T.A.S", -- Required
                Text = "Replacing Art. 6", -- Required
                Icon = "rbxassetid://16373172159", -- Optional
           })
        end
    end)
repeat wait() until cashcount.Value >= 34600
    placeTower(256679.905401683, "Artillery", towerplacementtables["Artilleries"]["Artillery7"]["Position"], towerplacementtables["Artilleries"]["Artillery7"]["AimPosition"])
    towerplacementtables["Artilleries"]["Artillery7"]["HasBeenPlaced"] = true
    print(towerplacementtables["Artilleries"]["Artillery7"]["HasBeenPlaced"])
    wait(0.3)
    upgradeTower(13, 1) wait(0.3)
    upgradeTower(13, 1) wait(0.3)
    upgradeTower(13, 1) wait(0.3)
    upgradeTower(13, 1) wait(0.3)
    upgradeTower(13, 1) wait(0.3)
    upgradeTower(13, 2) wait(0.3)
    upgradeTower(13, 2) wait(0.3)
    changeTargetting(13, 2) wait(0.3)
repeat wait() until cashcount.Value >= 34600
    placeTower(256690.37766937603, "Artillery", towerplacementtables["Artilleries"]["Artillery8"]["Position"], towerplacementtables["Artilleries"]["Artillery8"]["AimPosition"])
    towerplacementtables["Artilleries"]["Artillery8"]["HasBeenPlaced"] = true
    print(towerplacementtables["Artilleries"]["Artillery8"]["HasBeenPlaced"])
    wait(0.3)
    upgradeTower(14, 1) wait(0.3)
    upgradeTower(14, 1) wait(0.3)
    upgradeTower(14, 1) wait(0.3)
    upgradeTower(14, 1) wait(0.3)
    upgradeTower(14, 1) wait(0.3)
    upgradeTower(14, 2) wait(0.3)
    upgradeTower(14, 2) wait(0.3)
    changeTargetting(14, 2) wait(0.3)
repeat wait() until cashcount.Value >= 34600
    placeTower(256697.235104454, "Artillery", towerplacementtables["Artilleries"]["Artillery9"]["Position"], towerplacementtables["Artilleries"]["Artillery9"]["AimPosition"])
    towerplacementtables["Artilleries"]["Artillery9"]["HasBeenPlaced"] = true
    print(towerplacementtables["Artilleries"]["Artillery9"]["HasBeenPlaced"])
    wait(0.3)
    upgradeTower(15, 1) wait(0.3)
    upgradeTower(15, 1) wait(0.3)
    upgradeTower(15, 1) wait(0.3)
    upgradeTower(15, 1) wait(0.3)
    upgradeTower(15, 1) wait(0.3)
    upgradeTower(15, 2) wait(0.3)
    upgradeTower(15, 2) wait(0.3)
    changeTargetting(15, 2) wait(0.3)
repeat wait() until cashcount.Value >= 34600
    placeTower(256703.91865676202, "Artillery", towerplacementtables["Artilleries"]["Artillery10"]["Position"], towerplacementtables["Artilleries"]["Artillery10"]["AimPosition"])
    towerplacementtables["Artilleries"]["Artillery10"]["HasBeenPlaced"] = true
    print(towerplacementtables["Artilleries"]["Artillery10"]["HasBeenPlaced"])
    wait(0.3)
    upgradeTower(16, 1) wait(0.3)
    upgradeTower(16, 1) wait(0.3)
    upgradeTower(16, 1) wait(0.3)
    upgradeTower(16, 1) wait(0.3)
    upgradeTower(16, 1) wait(0.3)
    upgradeTower(16, 2) wait(0.3)
    upgradeTower(16, 2) wait(0.3)
    changeTargetting(16, 2) wait(0.3)
repeat wait() until cashcount.Value >= 34600
    placeTower(256708.82091553102, "Artillery", towerplacementtables["Artilleries"]["Artillery11"]["Position"], towerplacementtables["Artilleries"]["Artillery11"]["AimPosition"])
    towerplacementtables["Artilleries"]["Artillery11"]["HasBeenPlaced"] = true
    print(towerplacementtables["Artilleries"]["Artillery11"]["HasBeenPlaced"])
    wait(0.3)
    upgradeTower(17, 1) wait(0.3)
    upgradeTower(17, 1) wait(0.3)
    upgradeTower(17, 1) wait(0.3)
    upgradeTower(17, 1) wait(0.3)
    upgradeTower(17, 1) wait(0.3)
    upgradeTower(17, 2) wait(0.3)
    upgradeTower(17, 2) wait(0.3)
    changeTargetting(17, 2) wait(0.3)
repeat wait() until cashcount.Value >= 34600
    placeTower(256708.82091553102, "Artillery", towerplacementtables["Artilleries"]["Artillery12"]["Position"], towerplacementtables["Artilleries"]["Artillery12"]["AimPosition"])
    towerplacementtables["Artilleries"]["Artillery12"]["HasBeenPlaced"] = true
    print(towerplacementtables["Artilleries"]["Artillery12"]["HasBeenPlaced"])
    wait(0.3)
    upgradeTower(18, 1) wait(0.3)
    upgradeTower(18, 1) wait(0.3)
    upgradeTower(18, 1) wait(0.3)
    upgradeTower(18, 1) wait(0.3)
    upgradeTower(18, 1) wait(0.3)
    upgradeTower(18, 2) wait(0.3)
    upgradeTower(18, 2) wait(0.3)
    changeTargetting(18, 2) wait(0.3)
repeat wait() until cashcount.Value >= 34600
    placeTower(256708.82091553102, "Artillery", towerplacementtables["Artilleries"]["Artillery13"]["Position"], towerplacementtables["Artilleries"]["Artillery13"]["AimPosition"])
    towerplacementtables["Artilleries"]["Artillery13"]["HasBeenPlaced"] = true
    print(towerplacementtables["Artilleries"]["Artillery13"]["HasBeenPlaced"])
    wait(0.3)
    upgradeTower(19, 1) wait(0.3)
    upgradeTower(19, 1) wait(0.3)
    upgradeTower(19, 1) wait(0.3)
    upgradeTower(19, 1) wait(0.3)
    upgradeTower(19, 1) wait(0.3)
    upgradeTower(19, 2) wait(0.3)
    upgradeTower(19, 2) wait(0.3)
    changeTargetting(19, 2) wait(0.3)
repeat wait() until cashcount.Value >= 34600
    placeTower(256708.82091553102, "Artillery", towerplacementtables["Artilleries"]["Artillery14"]["Position"], towerplacementtables["Artilleries"]["Artillery14"]["AimPosition"])
    towerplacementtables["Artilleries"]["Artillery14"]["HasBeenPlaced"] = true
    print(towerplacementtables["Artilleries"]["Artillery14"]["HasBeenPlaced"])
    wait(0.3)
    upgradeTower(20, 1) wait(0.3)
    upgradeTower(20, 1) wait(0.3)
    upgradeTower(20, 1) wait(0.3)
    upgradeTower(20, 1) wait(0.3)
    upgradeTower(20, 1) wait(0.3)
    upgradeTower(20, 2) wait(0.3)
    upgradeTower(20, 2) wait(0.3)
    changeTargetting(20, 2) wait(0.3)
repeat wait() until cashcount.Value >= 34600
    placeTower(256708.82091553102, "Artillery", towerplacementtables["Artilleries"]["Artillery15"]["Position"], towerplacementtables["Artilleries"]["Artillery15"]["AimPosition"])
    towerplacementtables["Artilleries"]["Artillery15"]["HasBeenPlaced"] = true
    print(towerplacementtables["Artilleries"]["Artillery15"]["HasBeenPlaced"])
    wait(0.3)
    upgradeTower(21, 1) wait(0.3)
    upgradeTower(21, 1) wait(0.3)
    upgradeTower(21, 1) wait(0.3)
    upgradeTower(21, 1) wait(0.3)
    upgradeTower(21, 1) wait(0.3)
    upgradeTower(21, 2) wait(0.3)
    upgradeTower(21, 2) wait(0.3)
    changeTargetting(21, 2) wait(0.3)
---------------------------------------------------------------- Railgunners
repeat wait() until cashcount.Value >= 106850
    placeTower(256708.82091553102, "Railgunner", towerplacementtables["Railgunners"]["RG1"]["Position"])
    wait(0.3)
    upgradeTower(22, 2) wait(0.3)
    upgradeTower(22, 2) wait(0.3)
    upgradeTower(22, 2) wait(0.3)
    upgradeTower(22, 2) wait(0.3)
    upgradeTower(22, 2) wait(0.3)
    upgradeTower(22, 1) wait(0.3)
    upgradeTower(22, 1) wait(0.3)
    changeTargetting(22, 2) wait(0.3)
repeat wait() until cashcount.Value >= 106850
    placeTower(256708.82091553102, "Railgunner", towerplacementtables["Railgunners"]["RG2"]["Position"])
    wait(0.3)
    upgradeTower(23, 2) wait(0.3)
    upgradeTower(23, 2) wait(0.3)
    upgradeTower(23, 2) wait(0.3)
    upgradeTower(23, 2) wait(0.3)
    upgradeTower(23, 2) wait(0.3)
    upgradeTower(23, 1) wait(0.3)
    upgradeTower(23, 1) wait(0.3)
    changeTargetting(23, 2) wait(0.3)
repeat wait() until cashcount.Value >= 106850
    placeTower(256708.82091553102, "Railgunner", towerplacementtables["Railgunners"]["RG3"]["Position"])
    wait(0.3)
    upgradeTower(24, 2) wait(0.3)
    upgradeTower(24, 2) wait(0.3)
    upgradeTower(24, 2) wait(0.3)
    upgradeTower(24, 2) wait(0.3)
    upgradeTower(24, 2) wait(0.3)
    upgradeTower(24, 1) wait(0.3)
    upgradeTower(24, 1) wait(0.3)
    changeTargetting(24, 2) wait(0.3)
    changeTargetting(23, 2) wait(0.3)
repeat wait() until cashcount.Value >= 106850
    placeTower(256708.82091553102, "Railgunner", towerplacementtables["Railgunners"]["RG4"]["Position"])
    wait(0.3)
    upgradeTower(25, 2) wait(0.3)
    upgradeTower(25, 2) wait(0.3)
    upgradeTower(25, 2) wait(0.3)
    upgradeTower(25, 2) wait(0.3)
    upgradeTower(25, 2) wait(0.3)
    upgradeTower(25, 1) wait(0.3)
    upgradeTower(25, 1) wait(0.3)
    changeTargetting(25, 2) wait(0.3)
    changeTargetting(23, 2) wait(0.3)
repeat wait() until cashcount.Value >= 106850
    placeTower(256708.82091553102, "Railgunner", towerplacementtables["Railgunners"]["RG5"]["Position"])
    wait(0.3)
    upgradeTower(26, 2) wait(0.3)
    upgradeTower(26, 2) wait(0.3)
    upgradeTower(26, 2) wait(0.3)
    upgradeTower(26, 2) wait(0.3)
    upgradeTower(26, 2) wait(0.3)
    upgradeTower(26, 1) wait(0.3)
    upgradeTower(26, 1) wait(0.3)
    changeTargetting(26, 2) wait(0.3)
repeat wait() until cashcount.Value >= 106850
    placeTower(256708.82091553102, "Railgunner", towerplacementtables["Railgunners"]["RG6"]["Position"])
    wait(0.3)
    upgradeTower(27, 2) wait(0.3)
    upgradeTower(27, 2) wait(0.3)
    upgradeTower(27, 2) wait(0.3)
    upgradeTower(27, 2) wait(0.3)
    upgradeTower(27, 2) wait(0.3)
    upgradeTower(27, 1) wait(0.3)
    upgradeTower(27, 1) wait(0.3)
    changeTargetting(27, 2) wait(0.3)
repeat wait() until game.Players.LocalPlayer.PlayerGui.Interface.GameOverScreen.Visible == true
    game.ReplicatedStorage.Remotes.RequestTeleportToLobby:FireServer()
