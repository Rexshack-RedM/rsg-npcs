# rsg-npcs – Developer Docs

## Overview
Client-side, config-driven ambient NPC spawner. No database, no server events, no ox_lib.

## Files
| File | Purpose |
|---|---|
| `fxmanifest.lua` | Manifest; depends on `rsg-core` only |
| `shared/config.lua` | `Config.Debug`, `Config.DistanceSpawn`, `Config.FadeIn`, `Config.PedList` |
| `client/client.lua` | Distance loop, spawn/despawn with fade, scenarios, blips, xsound audio, cleanup on stop |
| `server/versionchecker.lua` | GitHub version check |
| `sounds/` | Local audio (`nui://rsg-npcs/sounds/<file>`) |

## Framework usage
- `exports['rsg-core']:GetCoreObject()` – core object
- `RSGCore.Functions.RequestModel(model)` – model loading (replaces `lib.requestModel`)
- `PlayerPedId()` – replaces `cache.ped`

## ox_lib migration (v3.0.1)
| Before | After |
|---|---|
| `@ox_lib/init.lua` in shared_scripts | removed |
| `dependencies { 'ox_lib' }` | `dependencies { 'rsg-core' }` |
| `lib.requestModel(model, 10000)` | `RSGCore.Functions.RequestModel(model)` |
| `cache.ped` | `PlayerPedId()` |

No locales are used (no player-facing text), so `@rsg-core/shared/locale.lua` is not needed.

## Optional
- `xsound` – proximity audio; detected via `GetResourceState('xsound')`, skipped silently if missing.

<!-- BEGIN AUTO-REFERENCE (generated from the code; re-run the generator instead of editing by hand) -->

## Technical reference

Generated from the source of **rsg-npcs 3.0.1**. Names, arguments and defaults below are read straight from the code.

### Dependencies

`rsg-core`

### Configuration

| Option | Default | Notes |
|---|---|---|
| `Config.Debug` | `false` |  |
| `Config.DistanceSpawn` | `20.0` | Distance before spawning/despawning the ped. (GTA Units.) |
| `Config.FadeIn` | `true` |  |
| `Config.PedList` | `table` |  |

<!-- END AUTO-REFERENCE -->
