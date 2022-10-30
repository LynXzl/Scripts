local Functions = loadstring(game:HttpGet("https://raw.githubusercontent.com/LynXzl/Tools/main/Functions.lua"))()

if game:GetService("Workspace").Map:FindFirstChild("Holiday") then
    Functions:Notify("LynXz","Autofarm Started","10")
    for i,v in pairs(game:GetService("Workspace").Map.Holiday.Items:GetChildren()) do
        if v.Pumpkin.Transparency == 0 then
            game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = v.Pumpkin.CFrame
            game.Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            wait(0.15)
            Functions:Touch(v.Pumpkin)
        end
    end
    Functions:Notify("LynXz","Autofarm Ended","5")
else
    Functions:Notify("LynXz","Event has ended","10")
end
