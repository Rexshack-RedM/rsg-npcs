local spawnedPeds = {}
local blipEntries = {}

CreateThread(function()
    while true do
        Wait(500)
        for k,v in pairs(Config.PedList) do
            local playerCoords = GetEntityCoords(PlayerPedId())
            local distance = #(playerCoords - v.coords.xyz)

            if distance < Config.DistanceSpawn and not spawnedPeds[k] then
                local spawnedPed = NearPed(v.model, v.coords, v)
                spawnedPeds[k] = { spawnedPed = spawnedPed }
            end
            
            if distance >= Config.DistanceSpawn and spawnedPeds[k] then
                if Config.FadeIn then
                    for i = 255, 0, -51 do
                        Wait(50)
                        SetEntityAlpha(spawnedPeds[k].spawnedPed, i, false)
                    end
                end
                DeletePed(spawnedPeds[k].spawnedPed)
                spawnedPeds[k] = nil
            end
        end
    end
end)

function NearPed(model, coords, pedData)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(50)
    end
    spawnedPed = CreatePed(model, coords.x, coords.y, coords.z - 1.0, coords.w, false, false, 0, 0)
    SetEntityAlpha(spawnedPed, 0, false)
    SetRandomOutfitVariation(spawnedPed, true)
    SetEntityCanBeDamaged(spawnedPed, false)
    SetEntityInvincible(spawnedPed, true)
    FreezeEntityPosition(spawnedPed, true)
    SetBlockingOfNonTemporaryEvents(spawnedPed, true)
    SetPedCanBeTargetted(spawnedPed, false)
    -- ADDED: Start scenario if defined
    if pedData and pedData.scenario then
        TaskStartScenarioInPlace(spawnedPed, pedData.scenario, 0, true)
    end
    
    if Config.FadeIn then
        for i = 0, 255, 51 do
            Wait(50)
            SetEntityAlpha(spawnedPed, i, false)
        end
    end
    
    return spawnedPed
end


Citizen.CreateThread(function()
    for k, PedList in pairs(Config.PedList) do
        if PedList.showblip == true then
            local PedBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, PedList.coords)
            SetBlipSprite(PedBlip, joaat(PedList.blipSprite), true)
            SetBlipScale(PedBlip, PedList.blipScale)
            Citizen.InvokeNative(0x9CB1A1623062F402, PedBlip, PedList.blipName)
            blipEntries[#blipEntries + 1] = {PedBlip = PedBlip }
        end
    end
end)


-- cleanup
AddEventHandler("onResourceStop", function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    for k,v in pairs(spawnedPeds) do
        DeletePed(spawnedPeds[k].spawnedPed)
        spawnedPeds[k] = nil
    end
    for i = 1, #blipEntries do
        RemoveBlip(blipEntries[i].PedBlip)
    end
end)
