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

function Notify(message,title,time,type)
    if Config.Notif == -1 then
    elseif Config.Notif == 'okok' then
        exports['okokNotify']:Alert(title, message, time, type)
    elseif Config.Notif == 'esx' then
        ESX.ShowNotification(message, false,false, 140)
    elseif Config.Notif == 'qb' then
        QBCore.Functions.Notify(message, type, time)
    end
end

function SendDispatch(type)
    if Config.dispatch == "cd" then
        local data = exports['cd_dispatch']:GetPlayerInfo()
        TriggerServerEvent('cd_dispatch:AddNotification', {
            job_table = Config.Policejobs, 
            coords = data.coords,
            title = lang.dispatch_msg_blip,
            message = lang.dispatch_msg..type,
            flash = 0,
            unique_id = data.unique_id,
            sound = 1,
            blip = {
                sprite = Config.DisBlipId , 
                scale = 1.2, 
                colour = Config.DisBlipColor,
                flashes = false, 
                text = lang.dispatch_msg_blip,
                time = 5,
                radius = 0,
            }})
    elseif Config.dispatch ==  "custom" then
    
    --elseif Config.dispatch ==  "" then
    end
end