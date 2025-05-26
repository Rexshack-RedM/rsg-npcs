local spawnedPeds = {}

CreateThread(function()
    while true do
        Wait(500)
        for k, v in pairs(Config.PedList) do
            local playerCoords = GetEntityCoords(PlayerPedId())
            local distance = #(playerCoords - v.coords.xyz)

            if distance < Config.DistanceSpawn and not spawnedPeds[k] then
                local spawnedPed = NearPed(v.model, v.coords)
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

function NearPed(model, coords)
    RequestModel(model)

    local timeout = 0
    while not HasModelLoaded(model) and timeout < 100 do
        Wait(50)
        timeout = timeout + 1
    end

    
    if not HasModelLoaded(model) then return end

    spawnedPed = CreatePed(model, coords.x, coords.y, coords.z - 1.0, coords.w, false, false, 0, 0)
    SetEntityAlpha(spawnedPed, 0, false)
    SetRandomOutfitVariation(spawnedPed, true)
    SetEntityCanBeDamaged(spawnedPed, false)
    SetEntityInvincible(spawnedPed, true)
    FreezeEntityPosition(spawnedPed, true)
    SetBlockingOfNonTemporaryEvents(spawnedPed, true)
    SetPedCanBeTargetted(spawnedPed, false)
    if Config.FadeIn then
        for i = 0, 255, 51 do
            Wait(50)
            SetEntityAlpha(spawnedPed, i, false)
        end
    end
    return spawnedPed
end

-- cleanup
AddEventHandler("onResourceStop", function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    for k, v in pairs(spawnedPeds) do
        DeletePed(spawnedPeds[k].spawnedPed)
        spawnedPeds[k] = nil
    end
end)
