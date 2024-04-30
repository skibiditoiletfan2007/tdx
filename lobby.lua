local args = {
    [1] = {
        [1] = "Grenadier",
        [2] = "Armored Factory",
        [3] = "John",
        [4] = "Artillery",
        [5] = "Railgunner",
        [6] = ""
    }
}
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("UpdateLoadout"):FireServer(unpack(args))
queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
local found = false
local tpCheck = false 
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Loaded T.A.S Lobby Script", -- Required
	Text = "Starting script..", -- Required
	Icon = "rbxassetid://16373172159", -- Optional
})
spawn(function()
    while task.wait(5) do
        if found == false then
            game:GetService("StarterGui"):SetCore("SendNotification",{
                Title = "T.A.S Lobby Script", -- Required
                Text = "Finding Singularity", -- Required
                Icon = "rbxassetid://16373172159", -- Optional
            })
        end
    end
end)
while task.wait(1) do
    for i,v in pairs(workspace.APCs:GetChildren()) do
        if found == false then
            if v.mapdisplay.screen.displayscreen.map.Text == "SINGULARITY" then
                print("found singularity")
                found = true
                    game:GetService("StarterGui"):SetCore("SendNotification",{
                        Title = "T.A.S Lobby Script", -- Required
                        Text = "Found Singularity", -- Required
                        Icon = "rbxassetid://16373172159", -- Optional
                    })
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.APC.Detector.CFrame
                game.Players.LocalPlayer.OnTeleport:Connect(function(State)
	            if (not tpCheck) and queueteleport then
		       tpCheck = true
		       queueteleport([[
			   getgenv().TeleportBackToLobby = teleportbacktolobby
                           loadstring(game:HttpGet("https://raw.githubusercontent.com/skibiditoiletfan2007/tdx/main/ingame.lua"))()
                       ]])
	            end
                end)
            end
        end
    end
end
