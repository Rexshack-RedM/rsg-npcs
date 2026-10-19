<img width="2948" height="497" alt="rsg_framework" src="https://github.com/user-attachments/assets/638791d8-296d-4817-a596-785325c1b83a" />

# 👥 rsg-npcs
**Lightweight, distance-based ambient NPC spawner with optional blips, scenarios and proximity audio for RedM.**

![Platform](https://img.shields.io/badge/platform-RedM-darkred)
![Version](https://img.shields.io/badge/version-3.0.0-blue)
![License](https://img.shields.io/badge/license-GPL--3.0-green)

> Fill towns and custom map areas with static NPCs that only exist when a player is nearby.
> Fully client-side and config-driven: no database, no server events, no framework calls.

---

## 🛠️ Dependencies
| Resource | Required | Purpose |
|---|---|---|
| [ox_lib](https://github.com/overextended/ox_lib) | ✅ Yes | Model loading and the cached player ped |
| [xsound](https://github.com/Xogy/xsound) | ⚪ Optional | Proximity audio. If xsound is not running, audio is skipped silently and everything else still works |

---

## ✨ Features
- 🧍 **Distance-based spawning:** NPCs are created only when a player is within `Config.DistanceSpawn` and deleted when they leave.
- 🌫️ **Fade in/out:** smooth alpha fade on spawn and despawn (`Config.FadeIn`).
- 🛡️ **Ambient-safe peds:** invincible, frozen, can't be targeted, and ignore world events, so they never panic, flee or get killed.
- 🎨 **Random outfit variation** for every spawn.
- 🎬 **Scenario support:** NPCs can play any world scenario (writing, leaning, smoking and so on).
- 🗺️ **Optional blips** per NPC with custom sprite, scale and name.
- 🔊 **Proximity audio (xsound):** plays a random clip from a list when a player walks up, stops when they walk away, with optional max duration and volume.
- ⚡ **Optimised loop:** sleeps 1000 ms when no NPC is near, 500 ms near silent NPCs and 100 ms near NPCs with audio. Spawning and fading run in separate threads, so one NPC never stalls the others.
- 🧹 **Clean shutdown:** peds, blips and audio are removed on resource stop or restart.
- 🐞 **Debug mode:** console logging for spawns, despawns, audio and invalid models.

---

## 📂 Installation
1. Download and place `rsg-npcs` in your resources folder (for example `resources/[rsg]/rsg-npcs`).
2. (Optional) Install **xsound** if you want NPC audio.
3. Add to your `server.cfg` **after** its dependencies:
   ```cfg
   ensure ox_lib
   ensure xsound    # optional, only for NPC audio
   ensure rsg-npcs
   ```
4. Add your NPCs in `shared/config.lua`.
5. Restart the server, or run `ensure rsg-npcs`.

---

## ⚙️ Configuration (`shared/config.lua`)

### Global settings
| Option | Type | Default | Description |
|---|---|---|---|
| `Config.Debug` | boolean | `false` | Prints spawn, despawn and audio events to the F8 console |
| `Config.DistanceSpawn` | number | `20.0` | Distance at which NPCs spawn and despawn |
| `Config.FadeIn` | boolean | `true` | Fade NPCs in when spawning and out when despawning |

### `Config.PedList` entry options
| Key | Type | Required | Default | Description |
|---|---|---|---|---|
| `model` | hash / string | ✅ | n/a | Ped model, as a backtick hash (`` `s_m_m_barber_01` ``) or a string (`'s_m_m_barber_01'`) |
| `coords` | vector4 | ✅ | n/a | Position and heading (`x, y, z, w`). Use ground-level coords; the ped is placed 1.0 below `z` |
| `scenario` | string | ❌ | none | World scenario name, e.g. `'WORLD_HUMAN_WRITE_NOTEBOOK'` |
| `showblip` | boolean | ❌ | `false` | Show a map blip for this NPC |
| `blipName` | string | ❌ | `'NPC'` | Blip label |
| `blipSprite` | string | ❌ | `'blip_ambient_npc'` | Blip sprite name |
| `blipScale` | number | ❌ | `0.2` | Blip scale |
| `audio` | table of strings | ❌ | none | List of audio URLs; one is picked at random each time |
| `audioDistance` | number | ❌ | `5.0` | Distance at which audio starts |
| `audioStopDistance` | number | ❌ | `15.0` | Distance at which audio stops (also xsound's max hearing distance) |
| `audioDuration` | number (ms) | ❌ | none | Stop audio automatically after this many milliseconds |
| `audioVolume` | number | ❌ | `1.0` | Volume, `0.0` to `1.0` |

### Example
```lua
Config.PedList = {
    {   -- Barber, Valentine
        model = `s_m_m_barber_01`,
        coords = vector4(-307.96, 814.16, 118.99, 190.93),
        scenario = 'WORLD_HUMAN_WRITE_NOTEBOOK',

        showblip = true,
        blipName = 'Barber Valentine',
        blipSprite = 'blip_shop_barber',
        blipScale = 0.2,

        audio = {
            'nui://rsg-npcs/sounds/doctor_exemple.ogg', -- local file
            'https://youtu.be/RZEPIvX5G10',             -- YouTube URL
        },
        audioDistance = 4.0,
        audioStopDistance = 10.0,
        audioDuration = 10000,
        audioVolume = 0.8,
    },
}
```

> Add as many entries as you like. Only NPCs within range of a player are ever spawned, so large lists stay cheap.

---

## 🔊 Audio Tips
- Local files go in the `sounds/` folder (`.ogg`, `.mp3` or `.wav`) and are referenced as `nui://rsg-npcs/sounds/<file>`.
- YouTube links are generally the most reliable option with xsound.
- For local files, add **0.1 to 0.2 seconds of silence** at the start to avoid the first syllable being cut off.
- Audio plays once per approach. Walk more than 2.0 units outside `audioDistance` and come back to trigger it again.

---

## 🔁 How It Works
1. A client thread checks the player's distance to every configured NPC.
2. Inside `DistanceSpawn`, the ped is created (and fades in), then starts its scenario.
3. Inside `audioDistance`, xsound plays a random clip at the NPC's position.
4. Beyond `audioStopDistance`, or after `audioDuration`, the audio stops.
5. Outside `DistanceSpawn`, the ped fades out and is deleted.

---

## 🧪 Troubleshooting
| Problem | Fix |
|---|---|
| NPC doesn't appear | Enable `Config.Debug` and check F8 for `invalid model`. Check the model name and coords |
| NPC floating or underground | Use ground-level `z` coords (the script subtracts 1.0) |
| NPC stands still instead of playing the scenario | Check the scenario name is valid for that ped model |
| No audio | Make sure xsound is started **before** rsg-npcs and the URL or file path is correct |

---

## 💎 Credits
- **RexshackGaming**: original author, https://github.com/Rexshack-RedM
- **Suu**: NPC audio support via xsound, https://github.com/suu-yoshida
- **Community contributors and translators**

## 📜 License
GPL-3.0. See [LICENSE](LICENSE).
