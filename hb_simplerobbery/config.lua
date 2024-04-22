Config = {}



Config.NewESX = true

Config.dispatch = "cd"  -- editable in "editable.lua"
Config.Delay = 15 -- is seconds
Config.Notif = 2 --okok / esx / qb / -1

Config.DisBlipId = 431
Config.DisBlipColor = 3


-- Ox skill check config
Config.RegisterDiffuculty = {'easy', 'easy', 'easy', 'easy', 'easy','easy', 'easy', 'easy', 'easy', 'easy' } -- The skillcheck difficulty, can be 'easy', 'medium' or 'hard' in any order and any quantity
Config.RegisterInput = {'W', 'A', 'S', 'D' } -- The keys that are used for the skillcheck minigame, can be any keys

Config.AtmNeedItem = false -- If true player will need item to start robbering / if false player does not need item to start robbery
Config.AtmItem = 'lockpick' -- Item Required for robbering ATM
Config.AtmLoseItem = true -- After Robbery will lose the item

Config.Target = {
    regicon = 'fa-solid fa-mask',
    reglabel = 'Vykradnúť pokladňu',
    atmicon = 'fa-solid fa-mask',
    atmlabel = 'Vykradnúť automat'
}

Config.atmtime = 10


Config.atmmoneyMin = 9000
Config.atmmoneyMax = 11000

Config.moneyitem = 'black_money'

Config.ATMModels = {
    'prop_atm_02',
    'prop_atm_03',
    'prop_fleeca_atm',
    'prop_atm_01',
}

Config.Policejobs = {
    'police',
    --'sheriff',
    --'fbi',
    --'dea',
    --'tas',
    --'gov',
}

Config.Logs = true -- true enable logs / false disable logs
--------------------------WEBHOOKS--------------------------------

Config.atmWebhook = 'https://discord.com/api/webhooks/1150079638241030165/oB_cUOFzUSPMJwN7Zw7fFuqOrtb1H85P7gPQiYK3dRCQjIvmIPQikyxQ87ZDBySwWEPr'

Config.IconURL = 'https://cdn.discordapp.com/attachments/1064184979166343220/1147918367966109838/PROJECT_Santos_-_Fivem_logo-01.png'  -- Logo must have 71px61p but screen must be 95x83
Config.BotName = '123456' 
Config.ServerName = '123456'

Config.DateFormat = '%d/%m/%Y [%X]'  -- To change the date format check this website - https://www.lua.org/pil/22.1.html

-- https://www.mathsisfun.com/hexadecimal-decimal-colors.html
Config.atmColor = '16691712'