if Config == nil then
  local Config = {
    minRank = 1, -- Minimum possible rank in group
    classicNotifications = false, -- Sends classic roblox notifications
    sendOutputInfo = true -- OutputInfo
  }
end

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/LynXzl/UI-Libraries/main/SolarisUI.lua"))()
local Info = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId,Enum.InfoType.Asset)

if Info then
	if Info.Creator.CreatorType == "Group" then
		function Scan(player:Player)
			if player:IsInGroup(Info.Creator.CreatorTargetId) then
                if player:GetRankInGroup(Info.Creator.CreatorTargetId) >= Config.minRank then
                    return player:GetRankInGroup(Info.Creator.CreatorTargetId)
				else
					if Config.sendOutputInfo then
						warn("LynX: "..player.Name.."'s rank is lower then Minimum rank")
					end
                end
			end
		end
		
		for _,player in ipairs(game:GetService("Players"):GetPlayers()) do
			if Scan(player) then
				if Config.classicNotifications then
					game:GetService("StarterGui"):SetCore("SendNotification",{
						Title = "LynX",
						Text = player.Name.."'s rank is "..player:GetRoleInGroup(Info.Creator.CreatorTargetId).."! Group Rank: "..player:GetRankInGroup(Info.Creator.CreatorTargetId),
					})
				else
                	Library:Notification("LynX", player.Name.."'s rank is "..player:GetRoleInGroup(Info.Creator.CreatorTargetId).."! Group Rank: "..player:GetRankInGroup(Info.Creator.CreatorTargetId))
				end
			end
		end

		game.Players.PlayerAdded:Connect(function(player)
			if Scan(player) then
				if Config.classicNotifications then
					game:GetService("StarterGui"):SetCore("SendNotification",{
						Title = "LynX",
						Text = player.Name.." join and he is "..player:GetRoleInGroup(Info.Creator.CreatorTargetId).."! Group Rank: "..player:GetRankInGroup(Info.Creator.CreatorTargetId)
					})
				else
                	Library:Notification("LynX", player.Name.." joined and he is "..player:GetRoleInGroup(Info.Creator.CreatorTargetId).."! Group Rank: "..player:GetRankInGroup(Info.Creator.CreatorTargetId))
				end
			end
		end)
	elseif Info.Creator.CreatorType == "User" then
		for _,player in ipairs(game:GetService("Players"):GetPlayers()) do
			if player.UserId == Info.Creator.Id then
				if Config.classicNotifications then
					game:GetService("StarterGui"):SetCore("SendNotification",{
						Title = "LynX",
						Text = player.Name.." is game Creator",
					})
				else
                	Library:Notification("LynX", player.Name.." is game Creator")
				end
			end
		end

		game.Players.PlayerAdded:Connect(function(player)
			if player.UserId == Info.Creator.Id then
				if Config.classicNotifications then
					game:GetService("StarterGui"):SetCore("SendNotification",{
						Title = "LynX",
						Text = player.Name.." join and he is game Owner",
					})
				else
                	Library:Notification("LynX", player.Name.." joined and he is game Owner")
				end
			end
		end)
	end
end
