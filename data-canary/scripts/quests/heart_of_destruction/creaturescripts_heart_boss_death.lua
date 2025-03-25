

local function setStorage(fromPos, toPos, storage)
	local upConer = fromPos -- upLeftCorner
	local downConer = toPos -- downRightCorner

	for i = upConer.x, downConer.x do
		for j = upConer.y, downConer.y do
			for k = upConer.z, downConer.z do
				local room = { x = i, y = j, z = k }
				local tile = Tile(room)
				if tile then
					local creatures = tile:getCreatures()
					if creatures and #creatures > 0 then
						for _, creature in pairs(creatures) do
							if creature:isPlayer() and creature:getStorageValue(storage) < 1 then
								creature:setStorageValue(storage, 1) -- Access to boss Anomaly
							end
						end
					end
				end
			end
		end
	end
end

local bosses = {
	["anomaly"] = {
		tile = Position(1021, 919, 15),
		actionId = 14325,
		fromPos = Position(1020, 907, 15),
		toPos = Position(1044, 929, 15),
		storage = 14326,
	},
	["rupture"] = {
		tile = Position(1017, 995, 15),
		actionId = 14325,
		fromPos = Position(1015, 985, 15),
		toPos = Position(1038, 1006, 15),
		storage = 14327,
	},
	["realityquake"] = {
		tile = Position(959, 922, 15),
		actionId = 14325,
		fromPos = Position(957, 911, 15),
		toPos = Position(981, 933, 15),
		storage = 14328,
	},
	["eradicator"] = {
		tile = Position(1008, 955, 15),
		actionId = 14325,
		fromPos = Position(988, 943, 15),
		toPos = Position(1010, 965, 15),
		storage = 14330,
	},
	["outburst"] = {
		tile = Position(952, 958, 15),
		actionId = 14325,
		fromPos = Position(950, 947, 15),
		toPos = Position(972, 968, 15),
		storage = 14332,
	},
}

local heartBossDeath = CreatureEvent("HeartBossDeath")

function heartBossDeath.onDeath(creature)
	if not creature or not creature:getMonster() then
		return true
	end

	local monsterName = creature:getName():lower()
	local bossName = bosses[monsterName]
	if bossName then
		local vortex = Tile(bossName.tile):getItemById(23483)
		if vortex then
			vortex:transform(23482)
			vortex:setActionId(bossName.actionId)
		end
		setStorage(bossName.fromPos, bossName.toPos, bossName.storage)
	elseif monsterName == "world devourer" then
		local vortex = Tile(Position(957, 999, 15)):getItemById(23483)
		if vortex then
			vortex:transform(23482)
			vortex:setActionId(14354)
		end
	end
	return true
end

heartBossDeath:register()
