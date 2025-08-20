fx_version 'cerulean'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game 'rdr3'

description 'rsg-npcs'
version '2.0.5'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

client_scripts {
    'client/client.lua'
}

server_scripts {
    'server/server.lua',
    'server/versionchecker.lua'
}

files {
    'sounds/*.ogg',
    'sounds/*.mp3',
    'sounds/*.wav'
}

dependencies {
    'rsg-core',
    'xsound' -- Audio dependency
}

lua54 'yes'
