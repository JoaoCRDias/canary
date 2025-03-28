local portalReward = MoveEvent()

function portalReward.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end

	local soulWarQuest = player:soulWarQuestKV()
	-- Checks if the boss has already been defeated
	if not soulWarQuest:get("goshnar's-megalomania-killed") then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Only warriors who defeated Goshnar's Megalomania can access this area.")
		player:teleportTo(fromPosition, true)
		return false
	end

	player:teleportTo(Position(816, 1405, 7))
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end

portalReward:position(Position(816, 1408, 7))
portalReward:register()
