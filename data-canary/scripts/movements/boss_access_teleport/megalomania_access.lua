local accessBlood = MoveEvent()
function accessBlood.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end

	local access = player:kv():scoped("soul-war-quest") or 0

	if access == 0 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need to kill all soul war mini bosses first.")

		return false
	end

	local accessBosses = { "Goshnar's Malice", "Goshnar's Hatred", "Goshnar's Spite", "Goshnar's Cruelty", "Goshnar's Greed" }
	for i, name in ipairs(accessBosses) do
		local killed = access:scoped(name):get("killed")
		if not killed then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need to kill all soul war mini bosses first.")
			player:teleportTo(fromPosition, true)
			return false
		end
	end
	player:teleportTo(Position(966, 1355, 15), true)
	return true
end

accessBlood:type("stepin")
accessBlood:aid(54022)
accessBlood:register()
