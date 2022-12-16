local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/LynXzl/UI-Libraries/main/SolarisUI.lua"))()
local Functions = loadstring(game:HttpGet("https://raw.githubusercontent.com/LynXzl/Tools/main/Functions.lua"))()
local Data = loadstring(game:HttpGet("https://raw.githubusercontent.com/LynXzl/Tools/main/GetData.lua"))()

local Window = Library:New({
    Name = "LynX's AutoBuy",
    FolderToSave = "PlzDeleteMe"
})

local Settings = {
    Enabled = false,
    Amount = 1,
    Thing = "Christmas Tree",
    Cooldown = 0,
    InstantDelivery = true
}

local MainTab = Window:Tab("Home")

local HomeSection = MainTab:Section("Home")

local AutoBuyEnabled = HomeSection:Toggle("AutoBuy Enabled", false,"Toggle", function(val)
    Settings.Enabled = val
    if val then
        Library:Notification("LynX", "AutoBuy Enabled!")
        while wait(Settings.Cooldown) do
            game:GetService("ReplicatedStorage").Remotes.BuyStorage:InvokeServer(Settings.Thing, Settings.Amount, Settings.InstantDelivery)
            if Settings.Enabled == false then
                break
            end
        end
    end
end)

local Status = HomeSection:Label("Status: Buying 1 Thing (Christmas Tree) per 0,1 Seconds")

function updatestatus()
    Status:Set("Status: Buying "..Settings.Amount.." Things ("..Settings.Thing..") per "..Settings.Cooldown.." Seconds")
end

local AmountofBuy = HomeSection:Slider("Amount of Buy", 1,100,0,1,"Slider", function(val)
    if val ~= 0 then
        Settings.Amount = val
        updatestatus()
    end
end)

local BuyCooldown = HomeSection:Slider("Cooldown of Purchases", 0,100,0,1,"Slider", function(val)
    Settings.Cooldown = val/10
    updatestatus()
end)

local ThingtoBuy = HomeSection:Dropdown("Thing to Buy", {"Christmas Tree","Toys","Clothing","Shoes","Hats","Candy","Snacks","Canned Food","Boxed Food","Cold Food","Baked Goods","Fruit","Vegetables","Condiments","Beverages","Small Electronics","PC Electronics","PC Peripherals","Office Electronics","Game Consoles","Videogames","Small Appliances","Large Appliances","Kitchenware","Luggage","Vacuum Cleaners","Personal Care","School Supplies","Brass Instruments","String Instruments","Pianos","Small Outdoor Equipment","Large Outdoor Equipment","Garden Tools","Paint Supplies","Lumber","Small Furniture","Large Furniture","Exercise Equipment","Game Tables","Personal Transport","Car Parts","Economy Cars","Jewelry","Guns","Ammo","Military Vehicles","Armored Vehicles"},"Toys","Dropdown", function(val)
    Settings.Thing = val
    updatestatus()
end)

local InstantDelivery = HomeSection:Toggle("Instant Delivery", true,"Toggle", function(val)
    Settings.InstantDelivery = val
end)

local Credits = HomeSection:Label("Script Made by "..Data.Devs.LynX)

local AutoJoinDiscord = HomeSection:Button("AutoJoin Discord", function()
    Functions:AutoJoinDiscord()
end)

Library:Notification("LynX", "Script Loaded!")
