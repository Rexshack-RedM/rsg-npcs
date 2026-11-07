fx_version 'cerulean'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game 'rdr3'
lua54 'yes'

description 'rsg-npcs'
version '3.0.1'

shared_scripts {
    'shared/config.lua'
}

client_script 'client/client.lua'
server_script 'server/versionchecker.lua'

files {
    'sounds/*.ogg',
    'sounds/*.mp3',
    'sounds/*.wav'
}

dependencies {
    'rsg-core'
}
