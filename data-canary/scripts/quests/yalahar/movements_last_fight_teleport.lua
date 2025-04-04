local lastFightTeleport = MoveEvent()

function lastFightTeleport.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if item.uid == 7809 then
		if Game.getStorageValue(Storage.Quest.U8_4.InServiceOfYalahar.LastFight) ~= 1 then
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(Position(954, 961, 9))
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:say("The apparatus in the centre looks odd! You should inspect it.", TALKTYPE_MONSTER_SAY)
		end
	elseif item.uid == 7810 then
		if Game.getStorageValue(Storage.Quest.U8_4.InServiceOfYalahar.LastFight) ~= 1 then
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(Position(955, 965, 8))
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		else
			player:teleportTo(fromPosition)
		end
	end
	return true
end

lastFightTeleport:type("stepin")
lastFightTeleport:uid(7809, 7810)
lastFightTeleport:register()
