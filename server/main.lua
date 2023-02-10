local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("edit_names", function(source, item)
	local src = source
	TriggerClientEvent('qb-names:changeNumber', src)
end)

RegisterServerEvent('qb-names:useSimCard', function(firstname, lastname)
	local src = source
	TriggerClientEvent('qb-names:startNumChange', src, firstname, lastname)
end)

RegisterServerEvent('qb-names:savenames', function(firstname, lastname)
	local src = source
	local xPlayer = QBCore.Functions.GetPlayer(src)
	local Item = xPlayer.Functions.GetItemByName("edit_names")
	if Item then
		xPlayer.Functions.SetCharinfo("firstname", firstname)
		xPlayer.Functions.SetCharinfo("lastname", lastname)
		xPlayer.Functions.RemoveItem("edit_names", 1)
		TriggerClientEvent('QBCore:Notify', src, 'Name Change: | ' .. firstname .. ' ' .. lastname .. '')
	else
		TriggerClientEvent('QBCore:Notify', src, "don\'t try do that", 'error')
	end
end)
