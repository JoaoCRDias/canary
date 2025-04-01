local castlewar = MoveEvent()
function castlewar.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local actionId = item:getActionId()
	local playerId = player:getId()
	if actionId == 38131 then
		if not Castle.opened then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Castle is closed.")
			player:teleportTo(fromPosition, false)
			return true
		end

		local guild = player:getGuild()
		if not guild then
			player:teleportTo(fromPosition)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "How did you get in here? It wasn't even supposed to be here.")
			return false
		end

		Castle.throne(guild)

		local entrace = Castle:entraceCastle(playerId)
		if not entrace then
			player:teleportTo(fromPosition)
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
			return false
		end

		player:addHealth(player:getMaxHealth())
		player:addMana(player:getMaxMana())
	end

	return true
end
castlewar:type("stepin")
castlewar:aid(38131)
castlewar:register()

local movcastle = MoveEvent()
function movcastle.onStepIn(creature, item, position, fromPosition)
local player = creature:getPlayer()
	if not player then
		return true
	end

	if not Castle.opened then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Castle is closed.")
		player:teleportTo(fromPosition, false)
		return true
	end

	local guild = player:getGuild()
	if not guild then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are not from the Guild that dominates the Castle.")
		player:teleportTo(fromPosition)
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return true
	end

	local guildName = guild:getName()
	local dominant = Castle:getDominanteNameLogin()

	if guildName ~= dominant then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are not from the Guild that dominates the Castle.")
		player:teleportTo(fromPosition)
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return true
	end

	player:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)

	return true
end
movcastle:type("stepin")
movcastle:aid(38133)
movcastle:register()

local castleWar = MoveEvent()
function castleWar.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	player:teleportTo(Position(1000, 1000, 7))
	return true
end
castleWar:type("stepin")
castleWar:aid(38136)
castleWar:register()
