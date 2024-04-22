CreateThread(function()
    Wait(30*1000) 

    print('^5==================^0^2[Script info]^0^5===================^0')
    print('Info: ^5If you found some bugs let me know on my discord^0')
    print('Discord: ^5https://discord.gg/ecJzNexyjt^0')
    print('^5==================================================^0')


end)

ESX = nil
canrob = true
if Config.NewESX then
    ESX = exports['es_extended']:getSharedObject()
else
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
end



RegisterNetEvent('hb_robberyV2:ATMrobbery')
AddEventHandler('hb_robberyV2:ATMrobbery', function(id)
	Wait(500)
		if Config.AtmLoseItem then exports.ox_inventory:RemoveItem(id, Config.AtmItem, 1) end
		TaskPlayAnim(GetPlayerPed(id), 'oddjobs@shop_robbery@rob_till', 'loop', 8.0, 8.0, -1, 1, 1, false, false, false)
		local money = math.random(Config.atmmoneyMin, Config.atmmoneyMax)
		Wait(Config.atmtime*1000)
		exports.ox_inventory:AddItem(id, Config.moneyitem, money)
		ClearPedTasks(GetPlayerPed(id))

		local information = {
			{
				["color"] = Config.atmColor,
				["author"] = {
					["icon_url"] = Config.IconURL,
					["name"] = Config.ServerName..' - Logs',
				},
				["title"] = 'ATM robbery',
				["description"] = '**'..getName(id)..'**'..' is robbing an ATM at '.."\n".."Money >> ".."**"..money.."**".."\n",
	
				["footer"] = {
					["text"] = os.date(Config.DateFormat).."\n".."Creator of script >> Habybyi#0612",
				}
			}
		}
		PerformHttpRequest(Config.atmWebhook, function(err, text, headers) end, 'POST', json.encode({username = Config.BotName, embeds = information}), {['Content-Type'] = 'application/json'})
end)




function getName(source)
	local name = nil
	local identifier = nil
	
	if Config.UseSteamNames then
		name = GetPlayerName(source)
	else
		if type(source) ~= "number" then
			identifier = source
		else
			local xPlayer = ESX.GetPlayerFromId(source)
			identifier = xPlayer.identifier
		end
		MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier', {
			['@identifier'] = identifier
		}, function(db_name)
			if db_name[1] ~= nil then
				name = db_name[1].firstname.." "..db_name[1].lastname
			else
				name = ""
			end
		end)
		while name == nil do
			Citizen.Wait(2)
		end
	end
	return name
end