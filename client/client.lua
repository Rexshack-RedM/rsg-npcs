local spawnedPeds   = {} -- [index] = { ped = entity, busy = bool }
local blips         = {}
local playingAudio  = {} -- [index] = soundName
local hasPlayedAudio = {}

local hasXsound = GetResourceState('xsound') ~= 'missing'
local FADE_STEP, FADE_WAIT = 51, 50

local function debugPrint(...)
    if Config.Debug then print('[rsg-npcs]', ...) end
end

local function toHash(model)
    return type(model) == 'number' and model or joaat(model)
end

local function fade(ped, from, to)
    local step = from < to and FADE_STEP or -FADE_STEP
    for alpha = from, to, step do
        if not DoesEntityExist(ped) then return end
        SetEntityAlpha(ped, alpha, false)
        Wait(FADE_WAIT)
    end
    if DoesEntityExist(ped) then
        if to >= 255 then ResetEntityAlpha(ped) else SetEntityAlpha(ped, to, false) end
    end
end

local function stopAudio(k)
    if playingAudio[k] then
        if hasXsound then exports.xsound:Destroy(playingAudio[k]) end
        playingAudio[k] = nil
    end
end

local function spawnPed(k, data)
    local model = toHash(data.model)
    if not IsModelValid(model) then
        print(('[rsg-npcs] invalid model for PedList entry %s'):format(k))
        return
    end

    spawnedPeds[k] = { busy = true }
    lib.requestModel(model, 10000)

    local c = data.coords
    local ped = CreatePed(model, c.x, c.y, c.z - 1.0, c.w, false, false, false, false)
    SetModelAsNoLongerNeeded(model)

    if not DoesEntityExist(ped) then
        spawnedPeds[k] = nil
        return
    end

    SetRandomOutfitVariation(ped, true)
    SetEntityCanBeDamaged(ped, false)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetPedCanBeTargetted(ped, false)

    if data.scenario then
        TaskStartScenarioInPlace(ped, joaat(data.scenario), 0, true, false, false, false)
    end

    spawnedPeds[k].ped = ped

    if Config.FadeIn then
        SetEntityAlpha(ped, 0, false)
        fade(ped, 0, 255)
    end

    spawnedPeds[k].busy = false
    debugPrint('spawned', k)
end

local function despawnPed(k)
    local entry = spawnedPeds[k]
    entry.busy = true
    stopAudio(k)
    hasPlayedAudio[k] = false

    if Config.FadeIn then fade(entry.ped, 255, 0) end
    if DoesEntityExist(entry.ped) then DeletePed(entry.ped) end

    spawnedPeds[k] = nil
    debugPrint('despawned', k)
end

local function handleAudio(k, data, distance)
    if not hasXsound or not data.audio or #data.audio == 0 then return end

    local startDist = data.audioDistance or 5.0
    local stopDist  = data.audioStopDistance or 15.0

    if distance <= startDist and not hasPlayedAudio[k] then
        hasPlayedAudio[k] = true
        stopAudio(k)

        local name = 'rsg_npcs_' .. k
        exports.xsound:PlayUrlPos(name, data.audio[math.random(#data.audio)], data.audioVolume or 1.0, data.coords.xyz, false)
        exports.xsound:Distance(name, stopDist)
        playingAudio[k] = name
        debugPrint('audio started', k)

        if data.audioDuration then
            SetTimeout(data.audioDuration, function()
                if playingAudio[k] == name then stopAudio(k) end
            end)
        end
    elseif distance > startDist + 2.0 then
        hasPlayedAudio[k] = false
    end

    if distance > stopDist then stopAudio(k) end
end

-- main loop: sleeps longer when nothing is near
CreateThread(function()
    while true do
        local sleep = 1000
        local playerCoords = GetEntityCoords(cache.ped)

        for k, data in ipairs(Config.PedList) do
            local distance = #(playerCoords - data.coords.xyz)
            local entry = spawnedPeds[k]

            if distance < Config.DistanceSpawn then
                if not entry then
                    CreateThread(function() spawnPed(k, data) end)
                elseif not entry.busy then
                    handleAudio(k, data, distance)
                end
                -- poll faster near peds that have audio, so the trigger feels instant
                sleep = math.min(sleep, data.audio and 100 or 500)
            elseif entry and not entry.busy then
                CreateThread(function() despawnPed(k) end)
            end
        end

        Wait(sleep)
    end
end)

-- blips
CreateThread(function()
    for _, data in ipairs(Config.PedList) do
        if data.showblip then
            local c = data.coords
            local blip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, c.x, c.y, c.z) -- BlipAddForCoords
            SetBlipSprite(blip, joaat(data.blipSprite or 'blip_ambient_npc'), true)
            SetBlipScale(blip, data.blipScale or 0.2)
            Citizen.InvokeNative(0x9CB1A1623062F402, blip, data.blipName or 'NPC') -- SetBlipName
            blips[#blips + 1] = blip
        end
    end
end)

AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    for k in pairs(playingAudio) do stopAudio(k) end
    for _, entry in pairs(spawnedPeds) do
        if entry.ped and DoesEntityExist(entry.ped) then DeletePed(entry.ped) end
    end
    for i = 1, #blips do RemoveBlip(blips[i]) end
end)
