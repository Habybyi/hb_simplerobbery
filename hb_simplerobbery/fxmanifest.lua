fx_version 'cerulean'
game 'gta5'


author 'Habybyi'
version '0.1'
description 'This is my robbey script for ATM. If you have som suggestion let me know on my discord'

shared_scripts {
    'config.lua',
    'language.lua',
    '@mysql-async/lib/MySQL.lua',
    '@ox_lib/init.lua',
}

client_scripts {
    'client/main.lua',
    'client/editable.lua'
}

server_scripts {
    'server/main.lua',
}

escrow_ignore {
    'client/editable.lua',
    'config.lua',
	'language.lua',
}

lua54 'yes'