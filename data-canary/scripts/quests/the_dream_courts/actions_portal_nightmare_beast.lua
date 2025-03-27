local storagesTable = {
	{ storage = Storage.Quest.U12_00.TheDreamCourts.AlptramunKilled, bossName = "Alptramun" },
	{ storage = Storage.Quest.U12_00.TheDreamCourts.IzcandarKilled, bossName = "Izcandar the Banished" },
	{ storage = Storage.Quest.U12_00.TheDreamCourts.PlagueRootKilled, bossName = "Plagueroot" },
	{ storage = Storage.Quest.U12_00.TheDreamCourts.MalofurKilled, bossName = "Malofur Mangrinder" },
	{ storage = Storage.Quest.U12_00.TheDreamCourts.MaxxeniusKilled	, bossName = "Maxxenius" },
}

local portalPaleWorm = MoveEvent()
function portalPaleWorm.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end
	local text = ""
	for value in pairs(storagesTable) do
		if player:getStorageValue(storagesTable[value].storage) < 0 then
			text = text .. "\n" .. storagesTable[value].bossName
		end
	end
	if text == "" then
		return true
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You still need to defeat:" .. text)
		player:teleportTo(fromPosition, true)
		return false
	end
end

portalPaleWorm:type("stepin")
portalPaleWorm:position(Position(878, 1433, 7))
portalPaleWorm:register()
