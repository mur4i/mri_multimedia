--convertido por .mur4i (discord caso tenha dúvidas, suporte pago) QBCORE BRASIL https://discord.gg/uEfGD4mmVh
fx_version 'adamant'

game 'gta5'

author '0RESMON'
description '0R-CarControl.'

version '1.0.0'

shared_scripts {
	'config.lua',
	'functions.lua'
}

client_scripts {
	'@vrp/lib/utils.lua',	
	'client/*.lua'
}

server_scripts {
	'@vrp/lib/utils.lua',	
	"@mysql-async/lib/MySQL.lua",
	'server/*.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/*.js',
    'html/*.css',
	'html/images/*.png',
	'html/images/*.svg',
}

lua54 'yes'
