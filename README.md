<img width="2948" height="497" alt="rsg_framework" src="https://github.com/user-attachments/assets/638791d8-296d-4817-a596-785325c1b83a" />

# 👥 rsg-npcs
**Dynamic NPC spawner and ambient sound system for RedM using RSG Core.**

![Platform](https://img.shields.io/badge/platform-RedM-darkred)
![License](https://img.shields.io/badge/license-GPL--3.0-green)

> Spawns NPCs dynamically based on player distance, plays local or remote audio, and supports optional blips and scenarios.  
> Designed for RSG Core servers to bring life to towns and custom map areas.

---

## 🛠️ Dependencies
- **rsg-core** (framework)  
- **xsound** (for positional audio playback)  
- **ox_lib** (optional for locale support)

**License:** GPL‑3.0

---

## ✨ Features
- 🧍‍♂️ **Distance-based NPC spawning** (controlled via `Config.DistanceSpawn`).  
- 🎧 **Proximity audio** — play `.ogg` files or YouTube URLs within a set distance.  
- 🌫️ **Fade‑in effect** when NPCs spawn (toggle with `Config.FadeIn`).  
- 🗺️ **Custom blips** for each NPC (icon, scale, and visibility).  
- 🎬 **Scenario support** (NPCs perform ambient actions like writing, leaning, etc.).  
- 🧩 **Fully configurable** through `config.lua`.  
- 🔊 **Adds sound support for NPCs via xsound** (YouTube links or local files).  
  - Recommended: Use **YouTube links** to avoid issues with audio playback.  
  - If you use **local audio files**, add **0.1–0.2 seconds of silence** at the start for best results.

---

## ⚙️ Configuration (`config.lua`)
```lua
Config = {}

Config.Debug = false
Config.DistanceSpawn = 20.0  -- distance at which NPCs appear/despawn
Config.FadeIn = true         -- fade-in effect when spawning

Config.PedList = {
    {
        model = `s_m_m_barber_01`,                -- NPC model
        coords = vector4(-307.96, 814.16, 118.99, 190.93),  -- spawn position
        showblip = false,                         -- display blip or not
        blipName = 'Barber Valentine',            -- blip label
        blipSprite = 'blip_shop_barber',          -- blip icon
        blipScale = 0.2,                          -- blip scale
        scenario = "WORLD_HUMAN_WRITE_NOTEBOOK",  -- animation or idle scenario
        audio = {
            -- 'nui://rsg-npcs/sounds/doctor_exemple.ogg',  -- local sound example
            'https://youtu.be/RZEPIvX5G10',                -- remote sound example
        },
        audioDistance = 4.0,     -- distance to start hearing audio
        audioStopDistance = 10.0,-- distance to stop hearing audio
        audioDuration = 10000,   -- playback time in ms
        audioVolume = 0.8        -- sound volume (0.0–1.0)
    },
}
```

> 📘 You can add more entries in `Config.PedList` to define your own NPCs, coordinates, scenarios, and sounds.

---

## 🔁 How It Works
1. The client checks nearby NPCs and spawns them dynamically when within `Config.DistanceSpawn`.  
2. If `FadeIn` is enabled, NPCs fade into visibility smoothly.  
3. When a player enters `audioDistance`, **xsound** plays the configured local/remote audio.  
4. The sound stops when the player leaves `audioStopDistance`.  
5. NPCs can perform looping scenarios defined in `Config.PedList`.  

> 🔊 **Sound Support Tips:**  
> • Use YouTube links for the best reliability.  
> • When using `.ogg` local files, include 0.1–0.2 seconds of silence at the start for smoother playback.

---

## 📂 Installation
1. Place `rsg-npcs` inside your `resources/[rsg]` folder.  
2. Install **xsound** for proximity audio support.  
3. Add to your `server.cfg`:
   ```cfg
   ensure ox_lib
   ensure rsg-core
   ensure xsound
   ensure rsg-npcs
   ```
4. (Optional) Edit `config.lua` to define new NPCs and audio behavior.  
5. Restart your server.

---

## 💡 Example
A single barber NPC in Valentine who writes in a notebook and plays an ambient sound nearby.

```lua
{
    model = `s_m_m_barber_01`,
    coords = vector4(-307.96, 814.16, 118.99, 190.93),
    showblip = true,
    blipName = 'Barber Valentine',
    blipSprite = 'blip_shop_barber',
    blipScale = 0.2,
    scenario = "WORLD_HUMAN_WRITE_NOTEBOOK",
    audio = { 'nui://rsg-npcs/sounds/doctor_exemple.ogg' },
    audioDistance = 4.0,
    audioStopDistance = 10.0,
    audioDuration = 10000,
    audioVolume = 0.8
}
```

---

## 💎 Credits
- **RexshackGaming** — Original author  
  🔗 https://github.com/Rexshack-RedM  
- **Suu** — NPC Audio Support via xsound  
  🔗 https://github.com/suu-yoshida  
- **RSG / Rexshack-RedM** — adaptation & maintenance  
- **Community contributors & translators**  
- License: GPL‑3.0
