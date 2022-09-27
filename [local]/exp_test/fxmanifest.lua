local cmdsDir = "cmds/"

fx_version 'cerulean'
game 'gta5'

author 'masmix'
description 'speedometer'
version '1.0.0'

client_script (cmdsDir .. [[client_test.lua]])

server_script (cmdsDir .. [[server_test.lua]])

dependencies {
    "exp"
}