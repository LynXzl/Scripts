local Functions = loadstring(game:HttpGet("https://raw.githubusercontent.com/LynXzl/Tools/main/Functions.lua"))()
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/LynXzl/UI-Libraries/main/SolarisUI.lua"))()

Library:Notification("🎅 LynXzl", "AutoFarm Started!")

for i,v in ipairs(game:GetService("Workspace").Map.Holiday.Items:GetChildren()) do
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
wait()
game.Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
wait(0.08)
Functions:Touch(v) 
wait()
end

Library:Notification("🎅 LynXzl", "AutoFarm Ended!")
