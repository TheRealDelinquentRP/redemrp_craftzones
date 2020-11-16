----Everything for spawning a cauldron and cooking fire--From Mr. Lupo-ml_camping----
local cauldron = 0
RegisterNetEvent('cookfirecauldron')
AddEventHandler('cookfirecauldron', function() 
    if cauldron ~= 0 then
        SetEntityAsMissionEntity(cauldron)
        DeleteObject(cauldron)
        cauldron = 0
    end
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 10000, true, false, false, false)
    exports['progressBars']:startUI(10000, "Building Cooking Cauldron")
    Citizen.Wait(10000)
    ClearPedTasksImmediately(PlayerPedId())
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))
    local prop = CreateObject(GetHashKey("S_CAMPFIRECOMBINED01X"), x, y, z, true, false, true)
    SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
    PlaceObjectOnGroundProperly(prop)
    cauldron = prop
end, false)

RegisterCommand('delcauldron', function(source, args, rawCommand)
    if cauldron == 0 then
        print("Can not delete what isn't there")
    else
        SetEntityAsMissionEntity(cauldron)
        DeleteObject(cauldron)
        local pos = GetEntityCoords(PlayerPedId()), true
        local craftObject = GetClosestObjectOfType(pos, 2.0, GetHashKey("S_CAMPFIRECOMBINED01X"), false, false, false)
        local objectPos = GetEntityCoords(craftObject)
        TriggerServerEvent("removecraftingzone",'cauldron', objectPos.x, objectPos.y, objectPos.z,'cooking','empty')
        cauldron = 0
    end
end, false)

local campfire = 0
RegisterNetEvent('cookfiregrill')
AddEventHandler('cookfiregrill', function() 
    if campfire ~= 0 then
        SetEntityAsMissionEntity(campfire)
        DeleteObject(campfire)
        SetEntityAsMissionEntity(cookgrill)
        DeleteObject(cookgrill)
        campfire = 0
    end
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 10000, true, false, false, false)
    exports['progressBars']:startUI(10000, "Making a cooking fire with a grill")
    Citizen.Wait(10000)
    ClearPedTasksImmediately(PlayerPedId())
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.75, -1.55))
    local prop = CreateObject(GetHashKey("p_campfire05x"), x, y, z, true, false, true)
    local prop2 = CreateObject(GetHashKey("p_cookgrate01x"), x, y, z, true, false, true)
    SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
    SetEntityHeading(prop2, GetEntityHeading(PlayerPedId()))
    PlaceObjectOnGroundProperly(prop)
    PlaceObjectOnGroundProperly(prop2)
    campfire = prop
    cookgrill = prop2
end, false)

RegisterNetEvent('cookfirespit')
AddEventHandler('cookfirespit', function() 
    if campfire ~= 0 then
        SetEntityAsMissionEntity(campfire)
        DeleteObject(campfire)
        SetEntityAsMissionEntity(cookspit)
        DeleteObject(cookspit)
        campfire = 0
    end
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 10000, true, false, false, false)
    exports['progressBars']:startUI(10000, "Making a cooking fire with a spit")
    Citizen.Wait(10000)
    ClearPedTasksImmediately(PlayerPedId())
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.75, -1.55))
    local prop = CreateObject(GetHashKey("p_campfire05x"), x, y, z, true, false, true)
    local prop2 = CreateObject(GetHashKey("p_campfirecook01x"), x, y, z, true, false, true)
    SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
    SetEntityHeading(prop2, GetEntityHeading(PlayerPedId()))
    PlaceObjectOnGroundProperly(prop)
    PlaceObjectOnGroundProperly(prop2)
    campfire = prop
    cookspit = prop2
end, false)

RegisterCommand('delfire', function(source, args, rawCommand)
    if campfire == 0 then
        print("Can not delete what isn't there")
    else
        SetEntityAsMissionEntity(campfire)
        DeleteObject(campfire)
        SetEntityAsMissionEntity(cookspit)
        DeleteObject(cookspit)
        SetEntityAsMissionEntity(cookgrill)
        DeleteObject(cookgrill)
        local pos = GetEntityCoords(PlayerPedId()), true
        local craftObject = GetClosestObjectOfType(pos, 2.0, GetHashKey("p_campfire05x"), false, false, false)
        local objectPos = GetEntityCoords(craftObject)
        TriggerServerEvent("removecraftingzone",'fire', objectPos.x, objectPos.y, objectPos.z,'grill','empty')
        campfire = 0
    end
end, false)

----Everything for spawning a tent--From Mr. Lupo-ml_camping----
local tent = 0
RegisterNetEvent('lockertent')
AddEventHandler('lockertent', function() 
    if tent ~= 0 then
        SetEntityAsMissionEntity(tent)
        DeleteObject(tent)
        SetEntityAsMissionEntity(bed)
        DeleteObject(bed)
        tent = 0
    end
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 20000, true, false, false, false)
    exports['progressBars']:startUI(20000, "Setting up a tent")
    Citizen.Wait(20000)
    ClearPedTasksImmediately(PlayerPedId())
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))
    local prop = CreateObject(GetHashKey("p_gangtentlemoyne01x"), x, y, z, true, false, true)
    local prop2 = CreateObject(GetHashKey("s_bedrollopen01x"), x, y, z, true, false, true)
    SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
    PlaceObjectOnGroundProperly(prop)
    SetEntityHeading(prop2, GetEntityHeading(PlayerPedId()))
    PlaceObjectOnGroundProperly(prop2)
    tent = prop
    bed = prop2
end, false)

RegisterCommand('deltent', function(source, args, rawCommand)
    if tent == 0 then
        print("Can not delete what isn't there")
    else
        SetEntityAsMissionEntity(tent)
        DeleteObject(tent)
        SetEntityAsMissionEntity(bed)
        DeleteObject(bed)
        local pos = GetEntityCoords(PlayerPedId()), true
        local craftObject = GetClosestObjectOfType(pos, 2.0, GetHashKey("p_campfire05x"), false, false, false)
        local objectPos = GetEntityCoords(craftObject)
        TriggerServerEvent("removelockerzone",'private', objectPos.x, objectPos.y, objectPos.z, 'empty')
        tent = 0
    end
end, false)

local hitch = 0

RegisterCommand('post', function(source, args, rawCommand)
    if hitch ~= 0 then
        SetEntityAsMissionEntity(hitch)
        DeleteObject(hitch)
        hitch = 0
    end
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 5000, true, false, false, false)
    exports['progressBars']:startUI(5000, "Building hitching post")
    Citizen.Wait(5000)
    ClearPedTasksImmediately(PlayerPedId())
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))
    local prop = CreateObject(GetHashKey("P_HITCHINGPOST05X"), x, y, z, true, false, true)
    SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
    PlaceObjectOnGroundProperly(prop)
    hitch = prop
end, false)

RegisterCommand('delpost', function(source, args, rawCommand)
    if hitch == 0 then
        print("Post tore down")
    else
        SetEntityAsMissionEntity(hitch)
        DeleteObject(hitch)
        hitch = 0
    end
end, false)

----Makes a crafting zone based off the cauldron and the fire--Based on MrBohannon-moonshiner----
Citizen.CreateThread(function()
    while true do
        Wait(0)
        local pos = GetEntityCoords(PlayerPedId()), true
        local craftObject = GetClosestObjectOfType(pos, 2.0, GetHashKey("S_CAMPFIRECOMBINED01X"), false, false, false)
        if craftObject ~= 0 then
            local objectPos = GetEntityCoords(craftObject)
            if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, objectPos.x, objectPos.y, objectPos.z, true) < 2.5 then

                TriggerServerEvent("updatecraftingzone",'cauldron', objectPos.x, objectPos.y, objectPos.z,'cooking','empty')
                end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        local pos = GetEntityCoords(PlayerPedId()), true
        local craftObject = GetClosestObjectOfType(pos, 2.0, GetHashKey("p_campfire05x"), false, false, false)
        if craftObject ~= 0 then
            local objectPos = GetEntityCoords(craftObject)
            if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, objectPos.x, objectPos.y, objectPos.z, true) < 2.5 then

                TriggerServerEvent("updatecraftingzone",'fire', objectPos.x, objectPos.y, objectPos.z,'grill','empty')
                end
        end
    end
end)

----Can't seem to get lockers to work, if anyone can, please help out.----

----Makes a locker zone based off the tent--Based on MrBohannon-moonshiner----
--[[Citizen.CreateThread(function()
    while true do
        Wait(0)
        local pos = GetEntityCoords(PlayerPedId()), true
        local craftObject = GetClosestObjectOfType(pos, 2.0, GetHashKey("p_gangtentlemoyne01x"), false, false, false)
        if craftObject ~= 0 then
            local objectPos = GetEntityCoords(craftObject)
            if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, objectPos.x, objectPos.y, objectPos.z, true) < 2.5 then

                TriggerServerEvent("updatelockerzone",'private', objectPos.x, objectPos.y, objectPos.z, 'empty')
                end
        end
    end
end)]]--