local imbuement = Action()

function imbuement.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if not target or type(target) ~= "userdata" or not target:isItem() then
		return player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You can only use the shrine on an valid item.")
	end

	player:openImbuementWindow(target)
	return true
end

-- imbuement:position({ x = 1943, y = 1340, z = 7 }, 25061)

imbuement:id(25060, 25061, 25103, 25104, 25202, 25174, 25175, 25182, 25183, 62672, 62673)
imbuement:register()
