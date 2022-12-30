local spawnedPeds = {}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        for k,v in pairs(Config.PedList) do
            local playerCoords = GetEntityCoords(PlayerPedId())
            local distance = #(playerCoords - v.coords.xyz)

            if distance < Config.DistanceSpawn and not spawnedPeds[k] then
                local spawnedPed = NearPed(v.model, v.coords)
                spawnedPeds[k] = { spawnedPed = spawnedPed }
            end
            
            if distance >= Config.DistanceSpawn and spawnedPeds[k] then
                if Config.FadeIn then
                    for i = 255, 0, -51 do
                        Citizen.Wait(50)
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
    while not HasModelLoaded(model) do
        Citizen.Wait(50)
    end
    spawnedPed = CreatePed(model, coords.x, coords.y, coords.z - 1.0, coords.w, false, false, 0, 0)
    SetEntityAlpha(spawnedPed, 0, false)
    Citizen.InvokeNative(0x283978A15512B2FE, spawnedPed, true)
    SetEntityCanBeDamaged(spawnedPed, false)
    SetEntityInvincible(spawnedPed, true)
    FreezeEntityPosition(spawnedPed, true)
    SetBlockingOfNonTemporaryEvents(spawnedPed, true)
    if Config.FadeIn then
        for i = 0, 255, 51 do
            Citizen.Wait(50)
            SetEntityAlpha(spawnedPed, i, false)
        end
    end
    return spawnedPed
end