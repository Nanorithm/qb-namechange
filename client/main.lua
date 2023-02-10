local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('qb-names:changeNumber', function()
	local drawer = exports['qb-input']:ShowInput({
			header = 'Change Name',
			submitText = 'Confirm',
			inputs = {
				{
					text = 'First Name',
					name = 'firstname',
					type = 'text',
					isRequired = true
				},
				{
					text = 'Last Name',
					name = 'lastname',
					type = 'text',
					isRequired = true
				}
			}
		})
	if drawer then
		if not drawer.firstname or not drawer.lastname then return end
		TriggerServerEvent('qb-names:useSimCard', drawer.firstname, drawer.lastname)
	end
end)

RegisterNetEvent('qb-names:startNumChange', function(firstname, lastname)
	QBCore.Functions.Progressbar('number_change', 'change name ...', 5500, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = true,
		disableCombat = true,
	}, {
		animDict = 'anim@amb@business@bgen@bgen_no_work@',
		anim = 'sit_phone_idle_01_nowork',
		flags = 16,
	}, {}, {}, function() -- Done
		StopAnimTask(PlayerPedId(), 'anim@amb@business@bgen@bgen_no_work@', 'sit_phone_idle_01_nowork', 1.0)
		TriggerServerEvent('qb-names:savenames', firstname, lastname)
	end, function() -- Cancel
		StopAnimTask(PlayerPedId(), 'anim@amb@business@bgen@bgen_no_work@', 'sit_phone_idle_01_nowork', 1.0)
		QBCore.Functions.Notify('Failed!', 'error')
	end)
end)
