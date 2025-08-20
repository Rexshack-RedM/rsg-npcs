Config = {}

Config.Debug = false

-- settings
Config.DistanceSpawn = 20.0 -- Distance before spawning/despawning the ped. (GTA Units.)
Config.FadeIn = true

Config.PedList = {
	--[[
    {   -- Example Barber Valentine
        model = `s_m_m_barber_01`,
        coords = vector4(-307.96, 814.16, 118.99, 190.93),
        showblip = false,
        blipName = 'Barber Valentine',
        blipSprite = 'blip_shop_barber',
        blipScale = 0.2,
        scenario = "WORLD_HUMAN_WRITE_NOTEBOOK", -- Animation here
        audio = {
            -- 'nui://rsg-npcs/sounds/doctor_exemple.ogg',
            'https://youtu.be/RZEPIvX5G10', -- YouTube URL example
        },
        audioDistance = 4.0,      -- Distance to start playing audio
        audioStopDistance = 10.0, -- Distance to stop audio
        audioDuration = 10000,    -- Duration in milliseconds
        audioVolume = 0.8         -- Volume (0.0 to 1.0)
    },
    --]]
}
