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
