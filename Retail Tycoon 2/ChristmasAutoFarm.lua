local Functions = loadstring(game:HttpGet("https://raw.githubusercontent.com/LynXzl/Tools/main/Functions.lua"))()

for i,v in ipairs(game:GetService("Workspace").Map.Holiday.Items:GetChildren()) do
game.Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
wait()
Functions:Touch(v) 
wait()
end
