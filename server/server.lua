-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------

-- ND_Framework export.
NDCore = exports["ND_Core"]:GetCoreObject()

lib.callback.register('ws_sellshop:sellItem', function(source, data)
	local src = source
	print(src)
    local xPlayer = NDCore.Functions.GetPlayer(source)
	print(data.item)
    local xItem = exports.ox_inventory:GetItem(src, data.item, nil, false)
	print(dump(xItem))
    if xItem.count < data.quantity then
		print("xItem is less than data.quantity.")
        return false
    else
        local profit = math.floor(data.price * data.quantity)
		exports.ox_inventory:RemoveItem(src, data.item, data.quantity)
		exports.ox_inventory:AddItem(src, 'money', profit)
        return profit
    end
end)

--Used only for debugging purpsoses
function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

-- lib.callback.register('ws_sellshop:invCheck', function(source)
	-- local src = source
	-- local inv = exports.ox_inventory:Search(src, 'slots', {'meth', 'cocaine', 'drug_blue', 'drug_red', 'drug_white', 'WEAPON_PISTOL', 'WEAPON_MACHINEPISTOL', 'WEAPON_MINISMG', 'WEAPON_PISTOL_MK2', 'WEAPON_PISTOL50', 'WEAPON_REVOLVER', 'WEAPON_REVOLVER_MK2', 'WEAPON_SMG', 'WEAPON_SMG_MK2', 'WEAPON_SMOKEGRENADE', 'WEAPON_SNSPISTOL', 'WEAPON_SNSPISTOL_MK2', 'WEAPON_STUNGUN', 'WEAPON_SWITCHBLADE', 'WEAPON_COMBATPISTOL', 'diamond', 'gold'}, nil)
	
	-- return inv
-- end)