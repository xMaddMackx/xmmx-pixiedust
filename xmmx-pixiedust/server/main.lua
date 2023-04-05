local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("mythicalpouch", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("xmmx-pixiedust:client:openMythicPouch", source, item.name)
        local randomItem = {
            "pixiedust",
            "pixiedust2"
        }
        local randomIndex = math.random(1, #randomItem)
        Player.Functions.AddItem(randomItem[randomIndex], 2)
        Citizen.Wait(5000)
        --TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['mythicalpouch'], "remove") 
        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[(randomItem[randomIndex])], "add")
        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[(randomItem[randomIndex])], "add")          
    end
end)

QBCore.Functions.CreateUseableItem("pixiedust", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("xmmx-pixiedust:client:teleport", source, item.name)
end)

QBCore.Functions.CreateUseableItem("pixiedust2", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("xmmx-pixiedust:client:teleport2", source, item.name)
end)