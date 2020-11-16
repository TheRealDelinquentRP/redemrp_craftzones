data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
        data = call
end)

local moonshine_zones = {
    ----Moonshine still zones----
    {name= "Amborino Still", x=-1093.84 , y=714.48 , z=80.04, type="still"},
    {name= "Leymone Still", x=1792.93 , y=-819.19 , z=189.4, type="still"},
    {name= "New Austin Still", x=-2774.46 , y=-3041.76 , z=-10.9, type="still"},
    {name= "New Hanover Still", x=1634.11 , y=827.96 , z=120.74, type="still"},
    {name= "West Elizabeth Still", x=-1868.91 , y=-1726.81 , z=85.06, type="still"},
}
----This section makes the zones above into crafting zones----
Citizen.CreateThread(function()
    while true do
        for k,v in pairs(moonshine_zones) do ----Gets the zones
        data.CreateCraftingStation(v.name, v.x, v.y, v.z, v.type , "empty") ----Turns zones into crafting stations
        data.updateCraftings(-1) ----Sends the update to all players
        end
        break
    end
end)
----These calls are for the object based crafting/locker items----
RegisterNetEvent("updatecraftingzone")
AddEventHandler("updatecraftingzone", function(name,x,y,z,type,job)
    data.CreateCraftingStation(name,x,y,z,type,job) ----Makes the area around object a crafting zone
    data.updateCraftings(-1) ----Sends the update to all players
end)

RegisterNetEvent("removecraftingzone")
AddEventHandler("removecraftingzone", function(name,x,y,z,type,job)
    data.updateRemoveCraftings(name,x,y,z,type,job) ----Removes the zone that the object created
    data.updateCraftings(-1) ----Sends the update to all players
end)

----Can't seem to get lockers to work, if anyone can, please help out.----
--[[RegisterNetEvent("updatelockerzone")
AddEventHandler("updatelockerzone", function(type,x,y,z,job)
    data.createLocker(type,x,y,z,job) ----Makes the area around object a locker zone
    data.updateLockers(-1) ----Sends the update to all players
end)

RegisterNetEvent("removelockerzone")
AddEventHandler("removelockerzone", function(id,x,y,z,job)
    data.removeLocker(-1,id) ----Removes the zone that the object created
    data.updateLockers(-1) ----Sends the update to all players
end)]]--


----Usable items needed for crafting to work
RegisterServerEvent("RegisterUsableItem:cauldron")
AddEventHandler("RegisterUsableItem:cauldron", function(source)
    TriggerClientEvent("cookfirecauldron", source)    
end)

RegisterServerEvent("RegisterUsableItem:grill")
AddEventHandler("RegisterUsableItem:grill", function(source)
    TriggerClientEvent("cookfiregrill", source)    
end)

RegisterServerEvent("RegisterUsableItem:spit")
AddEventHandler("RegisterUsableItem:spit", function(source)
    TriggerClientEvent("cookfirespit", source)  
end)

----Meant to be used with the locker system
RegisterServerEvent("RegisterUsableItem:tent")
AddEventHandler("RegisterUsableItem:tent", function(source)
    TriggerClientEvent("lockertent", source)    
end)