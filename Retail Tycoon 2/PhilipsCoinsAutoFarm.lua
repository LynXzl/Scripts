local Functions = loadstring(game:HttpGet("https://raw.githubusercontent.com/LynXzl/Tools/main/Functions.lua"))()

if game:GetService("Workspace").Map:FindFirstChild("Holiday") then
    Functions:Notify("LynXz","Autofarm Started","10")
    for i,v in pairs(game:GetService("Workspace").Map.Holiday.Items:GetChildren()) do
          game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = v.CFrame
          game.Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
          wait(0.1)
    end
    Functions:Notify("LynXz","Autofarm Ended","5")
end
