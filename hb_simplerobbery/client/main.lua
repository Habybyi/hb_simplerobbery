ESX = nil

if Config.NewESX then
    ESX = exports['es_extended']:getSharedObject()
else
    Citizen.CreateThread(function()
        while ESX == nil do
            TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
            Citizen.Wait(0)
        end
    end)
end


local id = GetPlayerServerId(NetworkGetPlayerIndexFromPed(PlayerPedId()))
local canrob = true 

while not HasAnimDictLoaded('oddjobs@shop_robbery@rob_till') do
    RequestAnimDict('oddjobs@shop_robbery@rob_till')
    Citizen.Wait(0)
end

for _,a in pairs(Config.ATMModels) do 
    exports.ox_target:addModel(a,{
    {
        label = lang.targer_label,
        name = 'atmrobbery',
        icon = lang.target_icon,
        distance = 2,
        onSelect = function()
            if canrob then
                local count = lib.callback.await('ox_inventory:getItemCount', false, Config.AtmItem)
                if Config.AtmNeedItem and count >= 1  then
                    if lib.skillCheck(Config.RegisterDiffuculty , Config.RegisterInput) then
                        Notif(lang.Robbery_inf_title,lang.robbery_succes_lockpick, 5*1000 ,'success')
                        TriggerServerEvent('hb_robberyV2:ATMrobbery',id)
                        Wait(Config.atmtime*1000-900)
                        canrob = false  
                        

                            while canrob == false do 
                                Wait(Config.Delay*1000)
                                canrob = true
                            end
                    else
                        Notif(lang.Robbery_inf_title,lang.robbery_error_lockpick, 5*1000 ,'error')
                    end                      
                elseif Config.AtmNeedItem == false then
                    if lib.skillCheck(Config.RegisterDiffuculty , Config.RegisterInput) then
                        Notif(lang.Robbery_inf_title,lang.robbery_succes_lockpick, 5*1000 ,'success')
                        SendDispatch(lang.dispatch_atm)
                        TriggerServerEvent('hb_robberyV2:ATMrobbery',id)
                        Wait(Config.atmtime*1000-900)
                        canrob = false  
                        

                            while canrob == false do 
                                Wait(Config.Delay*1000)
                                canrob = true
                            end
                    else
                        Notif(lang.Robbery_inf_title,lang.robbery_error_lockpick, 5*1000 ,'error')
                    end  
                else
                    Notif(lang.Robbery_inf_title,lang.robbery_error_msg_item, 5*1000 ,'error')
                end
            else
                Notif(lang.Robbery_inf_title,lang.robbery_error_msg, 5*1000 ,'error')
            end
        end
    }
    })
end

------------FUNCTIONS----------

function Notif(title ,text, time ,type)
    exports['okokNotify']:Alert(title, text, time, type)
  end
