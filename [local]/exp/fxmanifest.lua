resource_manifest_version '05cfa83c-a124-4cfa-a768-c24a5811d8f9'

fx_version 'cerulean'
game 'gta5'

author 'masmix'
description 'exp'
version '1.0.0'

client_script 'client.lua'
exports {
    "notify",
    "chat"
}

server_script 'server.lua'
server_exports {
    "log"
}