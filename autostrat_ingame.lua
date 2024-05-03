local ReturnedTable = {}

local CashValue = game.Players.LocalPlayer.leaderstats.Cash
local RemoteFolder = game.ReplicatedStorage.Remotes

ReturnedTable.StartConfiguration = function(fpsboost, invisenemies)
    if fpsboost == true then
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
		    if v:IsA("Part") or v:IsA("UnionOperation") or v:IsA("MeshPart") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") or v:IsA("Union")  then
		    	v.Material = "SmoothPlastic"
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
    	setscriptable(game.Lighting, "Technology", true)
	    sethiddenproperty(game.Lighting, "Technology", "Compatibility")
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
    end
    if invisenemies == true then
	      workspace.Enemies.DescendantAdded:Connect(function(v)
		        task.spawn(function()
		            if v:IsA("Part") or v:IsA("UnionOperation") or v:IsA("MeshPart") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") or v:IsA("Union")  then
                    v.Transparency = 1
			          end
		        end)
	     end)
    end
end

ReturnedTable.StartDifficulty = function(difficulty, speedup)
    local args = {
        [1] = difficulty
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("DifficultyVoteCast"):FireServer(unpack(args))
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("DifficultyVoteReady"):FireServer()
    if speedup == true then
        local args = {
            [1] = true
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ToggleSpeedupTier1"):FireServer(unpack(args))
    end
end

ReturnedTable.SkipWave = function()
    local args = {
        [1] = true
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("SkipWaveVoteCast"):FireServer(unpack(args))
end

ReturnedTable.PlaceTower = function(tower, cframe)
   local args = {
        [1] = 0,
        [2] = tower,
        [3] = cframe,
        [4] = 0,
    }
    RemeoteFolder:WaitForChild("PlaceTower"):InvokeServer(unpack(args))
end

ReturnedTable.UpgradeTower = function(placementcount, path, cashcount)
    repeat wait() until CashValue.Value == cashcount
    local args = {
        [1] = placementcount,
        [2] = path,
    }
    RemoteFolder:WaitForChild("TowerUpgradeRequest"):FireServer(unpack(args))
end

ReturnedTable.ChangeTargetting = function(placementcount, targetting)
    local args = {
        [1] = placementcount,
        [2] = targetting
    }
    RemoteFolder:WaitForChild("ChangeQueryType"):FireServer(unpack(args))
end

return ReturnedTable
