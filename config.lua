Config = {}

Config.Debug = false

-- settings
Config.DistanceSpawn = 20.0 -- Distance before spawning/despawning the ped. (GTA Units.)
Config.FadeIn = true

Config.PedList = {

--the ones below are for external scripts, but can use as a template.

    -- Trapper vendors
    -- {   -- trapper vendor Valentine 
    --     model = `U_M_M_SDTRAPPER_01`,
    --     coords = vector4(-333.9737, 773.49157, 116.22194, 111.8759),
    --     showblip = false,
    --     blipName = 'Trapper Vendor Valentine',
    --     blipSprite = 'blip_shop_animal_trapper',
    --     blipScale = 0.2,
    -- },
    -- {   -- trapper vendor Saint Denis 
    --     model = `U_M_M_SDTRAPPER_01`,
    --     coords = vector4(2832.3193, -1223.699, 47.654289, 190.36814),
    --     showblip = false,
    --     blipName = 'Trapper Vendor Saint Denis',
    --     blipSprite = 'blip_shop_animal_trapper',
    --     blipScale = 0.2,
    -- },
    -- {   -- trapper vendor Riggs Station 
    --     model = `U_M_M_SDTRAPPER_01`,
    --     coords = vector4(-1007.607, -549.5084, 99.39138, 282.4226),
    --     showblip = false,
    --     blipName = 'Trapper Vendor Riggs Station',
    --     blipSprite = 'blip_shop_animal_trapper',
    --     blipScale = 0.2,
    -- },
    -- {   -- trapper vendor West Elizabeth 
    --     model = `U_M_M_SDTRAPPER_01`,
    --     coords = vector4(-2844.197, 142.13876, 184.61907, 255.25524),
    --     showblip = false,
    --     blipName = 'Trapper Vendor West Elizabeth',
    --     blipSprite = 'blip_shop_animal_trapper',
    --     blipScale = 0.2,
    -- },
    -- {   -- trapper vendor Strawberry 
    --     model = `U_M_M_SDTRAPPER_01`,
    --     coords = vector4(-1745.992, -388.9831, 156.59568, 107.79673),
    --     showblip = false,
    --     blipName = 'Trapper Vendor Strawberry',
    --     blipSprite = 'blip_shop_animal_trapper',
    --     blipScale = 0.2,
    -- },
    -- {   -- trapper vendor Tumbleweed 
    --     model = `U_M_M_SDTRAPPER_01`,
    --     coords = vector4(-5511.721, -2951.048, -1.83548, 165.87483),
    --     showblip = false,
    --     blipName = 'Trapper Vendor Tumbleweed',
    --     blipSprite = 'blip_shop_animal_trapper',
    --     blipScale = 0.2,
    -- },

    -- Butcher vendors
    -- {   -- butcher Valentine 
    --     model = `U_M_M_VALBUTCHER_01`,
    --     coords = vector4(-339.26, 767.7, 116.57, 103.16),
    --     showblip = false,
    --     blipName = 'Butcher Vendor Valentine',
    --     blipSprite = 'blip_shop_butcher',
    --     blipScale = 0.2,
    -- },
    -- {   -- butcher Saint Denis
    --     model = `U_M_M_VALBUTCHER_01`,
    --     coords = vector4(2817.6848, -1323.25, 46.607814, 54.587085),
    --     showblip = false,
    --     blipName = 'Butcher Vendor Saint Denis',
    --     blipSprite = 'blip_shop_butcher',
    --     blipScale = 0.2,
    -- },
    -- {   -- butcher Rhodes
    --     model = `U_M_M_VALBUTCHER_01`,
    --     coords = vector4(1297.3735, -1277.661, 75.876304, 158.4201),
    --     showblip = false,
    --     blipName = 'Butcher Vendor Rhodes',
    --     blipSprite = 'blip_shop_butcher',
    --     blipScale = 0.2,
    -- },
    -- {   -- butcher Annesburg
    --     model = `U_M_M_VALBUTCHER_01`,
    --     coords = vector4(2934.1706, 1301.2891, 44.483638, 78.346809),
    --     showblip = false,
    --     blipName = 'Butcher Vendor Annesburg',
    --     blipSprite = 'blip_shop_butcher',
    --     blipScale = 0.2,
    -- },
    -- {   -- butcher Tumbleweed
    --     model = `U_M_M_VALBUTCHER_01`,
    --     coords = vector4(-5509.831, -2947.271, -1.89185, 256.48596),
    --     showblip = false,
    --     blipName = 'Butcher Vendor Tumbleweed',
    --     blipSprite = 'blip_shop_butcher',
    --     blipScale = 0.2,
    -- },

    -- Fish vendors
    -- {   -- fish vendor Valentine 
    --     model = `CS_FISHCOLLECTOR`,
    --     coords = vector4(-335.4444, 762.00537, 116.5845, 45.516292),
    --     showblip = false,
    --     blipName = 'Fish Vendor Valentine',
    --     blipSprite = 'blip_mg_fishing',
    --     blipScale = 0.2,
    -- },
    -- {   -- fish vendor Saint Denis 
    --     model = `CS_FISHCOLLECTOR`,
    --     coords = vector4(2661.7463, -1506.055, 45.968948, 321.56686),
    --     showblip = false,
    --     blipName = 'Fish Vendor Saint Denis',
    --     blipSprite = 'blip_mg_fishing',
    --     blipScale = 0.2,
    -- },
    -- {   -- fish vendor Rhodes
    --     model = `CS_FISHCOLLECTOR`,
    --     coords = vector4(1292.9885, -1273.963, 75.870391, 181.20063),
    --     showblip = false,
    --     blipName = 'Fish Vendor Rhodes',
    --     blipSprite = 'blip_mg_fishing',
    --     blipScale = 0.2,
    -- },
    -- {   -- fish vendor Annesburg
    --     model = `CS_FISHCOLLECTOR`,
    --     coords = vector4(3018.2368, 1352.096, 42.713443, 23.409223),
    --     showblip = false,
    --     blipName = 'Fish Vendor Annesburg',
    --     blipSprite = 'blip_mg_fishing',
    --     blipScale = 0.2,
    -- },
    -- {   -- fish vendor Van Horn
    --     model = `CS_FISHCOLLECTOR`,
    --     coords = vector4(2991.539, 558.93402, 44.357906, 4.9385623),
    --     showblip = false,
    --     blipName = 'Fish Vendor Van Horn',
    --     blipSprite = 'blip_mg_fishing',
    --     blipScale = 0.2,
    -- },

    -- Barber NPCs
    {   -- barber Valentine
        model = `s_m_m_barber_01`,
        coords = vector4(-307.96, 814.16, 118.99, 190.93),
        showblip = false,
        blipName = 'Barber Valentine',
        blipSprite = 'blip_shop_barber',
        blipScale = 0.2,
        scenario = "WORLD_HUMAN_WRITE_NOTEBOOK" -- Animation here
    },
    {   -- barber Saint Denis
        model = `s_m_m_barber_01`,
        coords = vector4(-238.6778, 681.152, 112.3342, 176.33),
        showblip = true,
        blipName = 'Barber Saint Denis',
        blipSprite = 'blip_shop_barber',
        blipScale = 0.2,
    },
    {   -- barber Blackwater
        model = `s_m_m_barber_01`,
        coords = vector4(-815.88, -1364.72, 43.75, 268.99),
        showblip = false,
        blipName = 'Barber Blackwater',
        blipSprite = 'blip_shop_barber',
        blipScale = 0.2,
    },
    {   -- barber Rhodes
        model = `s_m_m_barber_01`,
        coords = vector4(1301.88, -1284.16, 76.89, 179.78),
        showblip = false,
        blipName = 'Barber Rhodes',
        blipSprite = 'blip_shop_barber',
        blipScale = 0.2,
    },
    {   -- barber Strawberry
        model = `s_m_m_barber_01`,
        coords = vector4(-1840.97, -395.01, 157.12, 103.46),
        showblip = false,
        blipName = 'Barber Strawberry',
        blipSprite = 'blip_shop_barber',
        blipScale = 0.2,
    },

    -- -- Estate Agents
    -- {   -- estate agent New Hanover
    --     model = `A_M_O_SDUpperClass_01`,
    --     coords = vector4(-250.8893, 743.20239, 118.08129, 105.66469),
    --     showblip = true,
    --     blipName = 'Estate Agent New Hanover',
    --     blipSprite = 'blip_post_office',   
    --     blipScale = 0.2,
    -- },
    -- {   -- estate agent West Elizabeth
    --     model = `A_M_O_SDUpperClass_01`,
    --     coords = vector4(-792.3216, -1203.232, 43.645206, 184.15261),
    --     showblip = true,
    --     blipName = 'Estate Agent West Elizabeth',
    --     blipSprite = 'blip_post_office',   
    --     blipScale = 0.2,
    -- },
    -- {   -- estate agent New Austin
    --     model = `A_M_O_SDUpperClass_01`,
    --     coords = vector4(-3658.934, -2620.835, -13.3414, 8.4051847),
    --     showblip = true,
    --     blipName = 'Estate Agent New Austin',
    --     blipSprite = 'blip_post_office',   
    --     blipScale = 0.2,
    -- },
    -- {   -- estate agent Ambarino
    --     model = `A_M_O_SDUpperClass_01`,
    --     coords = vector4(-1347.746, 2405.7084, 307.06127, 296.02886),
    --     showblip = true,
    --     blipName = 'Estate Agent Ambarino',
    --     blipSprite = 'blip_post_office',   
    --     blipScale = 0.2,
    -- },
    -- {   -- estate agent Lemoyne
    --     model = `A_M_O_SDUpperClass_01`,
    --     coords = vector4(2596.5463, -1299.845, 52.817153, 304.04638),
    --     showblip = true,
    --     blipName = 'Estate Agent Lemoyne',
    --     blipSprite = 'blip_post_office',   
    --     blipScale = 0.2,
    -- },

    -- -- Delivery NPCs
    -- {   -- delivery Saint Denis
    --     model = `A_M_M_SDDockForeman_01`,
    --     coords = vector4(2904.1989, -1169.292, 46.112228, 96.722068),
    --     showblip = true,
    --     blipName = 'Delivery Saint Denis',
    --     blipSprite = 'blip_ambient_delivery',   
    --     blipScale = 0.2,
    -- },
    -- {   -- delivery Valentine
    --     model = `A_M_M_FOREMAN`,
    --     coords = vector4(-339.0577, 814.22424, 116.96039, 125.19566),
    --     showblip = true,
    --     blipName = 'Delivery Valentine',
    --     blipSprite = 'blip_ambient_delivery',   
    --     blipScale = 0.2,
    -- },
    -- {   -- delivery Blackwater
    --     model = `A_M_M_FOREMAN`,
    --     coords = vector4(-743.7046, -1218.822, 43.29129, 94.302909),
    --     showblip = true,
    --     blipName = 'Delivery Blackwater',
    --     blipSprite = 'blip_ambient_delivery',   
    --     blipScale = 0.2,
    -- },
    -- {   -- delivery Strawberry
    --     model = `U_M_M_BiVForeman_01`,
    --     coords = vector4(-1798.899, -425.6275, 156.37739, 352.46316),
    --     showblip = true,
    --     blipName = 'Delivery Strawberry',
    --     blipSprite = 'blip_ambient_delivery',   
    --     blipScale = 0.2,
    -- },
    -- {   -- delivery Mcfarlands Ranch
    --     model = `U_M_M_BiVForeman_01`,
    --     coords = vector4(-2357.585, -2367.583, 62.18066, 168.52516),
    --     showblip = true,
    --     blipName = 'Delivery Mcfarlands Ranch',
    --     blipSprite = 'blip_ambient_delivery',   
    --     blipScale = 0.2,
    -- },
    -- {   -- delivery Tumbleweed
    --     model = `A_M_M_SDDockForeman_01`,
    --     coords = vector4(-5529.143, -2932.52, -1.95342, 212.60365),
    --     showblip = true,
    --     blipName = 'Delivery Tumbleweed',
    --     blipSprite = 'blip_ambient_delivery',   
    --     blipScale = 0.2,
    -- },

    -- -- Blacksmith Shop Valentine
    -- {   -- blacksmith shop Valentine
    --     model = `cs_nils`,
    --     coords = vector4(-364.1691, 799.62487, 116.25514, 250.88192),
    --     showblip = true,
    --     blipName = 'Blacksmith Valentine',
    --     blipSprite = 'blip_shop_blacksmith',   
    --     blipScale = 0.2,
    -- },

    -- -- Travel Agent
    -- {   -- travel agent St Denis
    --     model = `u_m_o_rigtrainstationworker_01`,
    --     coords = vector4(2662.3156, -1541.951, 45.969783, 265.44274),
    --     showblip = true,
    --     blipName = 'Travel Agent St Denis',
    --     blipSprite = 'blip_mp_travelling_saleswoman',   
    --     blipScale = 0.2,
    -- },
    -- {   -- travel agent Guarma
    --     model = `u_m_o_rigtrainstationworker_01`,
    --     coords = vector4(1268.4835, -6850.459, 43.318496, 212.38269),
    --     showblip = true,
    --     blipName = 'Travel Agent Guarma',
    --     blipSprite = 'blip_mp_travelling_saleswoman',   
    --     blipScale = 0.2,
    -- },


    -- -- Misc
    -- {   -- Valentine townhall
    --     model = `CS_gavin`,
    --     coords = vector4(-262.87, 761.80, 118.16, 292.38),
    --     showblip = true,
    --     blipName = 'Valentine Townhall',
    --     blipSprite = 'blip_town',  
    --     blipScale = 0.2,
    -- },

}
