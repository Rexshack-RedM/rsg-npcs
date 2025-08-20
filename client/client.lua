local spawnedPeds = {}
local blipEntries = {}
-- Audio management tables
local playingAudio = {}
local hasPlayedAudio = {}

CreateThread(function()
    while true do
        Wait(50) -- Reduced for precise audio detection
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
                -- Stop audio when NPC despawns
                if playingAudio[k] then
                    exports.xsound:Destroy(playingAudio[k])
                    playingAudio[k] = nil
                end
                hasPlayedAudio[k] = false
                DeletePed(spawnedPeds[k].spawnedPed)
                spawnedPeds[k] = nil
            end

            -- Audio management for spawned NPCs
            if spawnedPeds[k] and v.audio then
                local audioDistance = v.audioDistance or 5.0
                local audioStopDistance = v.audioStopDistance or 15.0

                -- Play audio once when entering trigger zone
                if distance <= audioDistance and not hasPlayedAudio[k] then
                    hasPlayedAudio[k] = true
                    
                    local audioUrl = v.audio[math.random(#v.audio)]
                    local audioName = "npc_audio_" .. tostring(k)
                    local volume = v.audioVolume or 1.0

                    exports.xsound:PlayUrlPos(audioName, audioUrl, volume, v.coords.xyz, false)
                    exports.xsound:Distance(audioName, audioStopDistance)
                    playingAudio[k] = audioName

                    if Config.Debug then
                        print("[RSG-NPCs] Audio started for NPC " .. k)
                    end

                    -- Auto-stop after specified duration
                    if v.audioDuration then
                        SetTimeout(v.audioDuration, function()
                            if playingAudio[k] == audioName then
                                exports.xsound:Destroy(audioName)
                                playingAudio[k] = nil
                            end
                        end)
                    end
                end

                -- Reset trigger when player exits zone
                if distance > (audioDistance + 2.0) and hasPlayedAudio[k] then
                    hasPlayedAudio[k] = false
                end

                -- Stop audio if too far away
                if distance > audioStopDistance and playingAudio[k] then
                    exports.xsound:Destroy(playingAudio[k])
                    playingAudio[k] = nil
                end
            else
                hasPlayedAudio[k] = false
            end
        end
    end
end)

function NearPed(model, coords, pedData)
    local model = joaat(model)
    lib.requestModel(model, 5000)
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

CreateThread(function()
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
    -- Stop all playing audio
    for k, audioName in pairs(playingAudio) do
        exports.xsound:Destroy(audioName)
    end
    playingAudio = {}
    hasPlayedAudio = {}
    for k,v in pairs(spawnedPeds) do
        DeletePed(spawnedPeds[k].spawnedPed)
        spawnedPeds[k] = nil
    end
    for i = 1, #blipEntries do
        RemoveBlip(blipEntries[i].PedBlip)
    end
end)
