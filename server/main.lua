ESX = nil

	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('Barwoz:buy')
AddEventHandler('Barwoz:buy', function(number, item, price)
	local _src = source
	local xPlayer = ESX.GetPlayerFromId(_src)
	local playerMoney = xPlayer.getMoney()

	if playerMoney >= price then
		xPlayer.addInventoryItem(item, number)
		xPlayer.removeMoney(price*number)
		TriggerClientEvent('esx:showNotification', _src, "Vous avez bien reçu votre ~b~"..item.." ~s~! ")
	else
		TriggerClientEvent('esx:showNotification', _src, "Vous n'avez assez ~r~d\'argent")	
	end	
end)