local npcName = "Hunts"

local npcType = Game.createNpcType(npcName)
local npcConfig = {}

npcConfig.name = npcName
npcConfig.description = npcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 0

npcConfig.outfit = {
	lookTypeEx = 1819,
}

npcConfig.flags = {
	floorchange = false,
}

-- Register npc
npcType:register(npcConfig)
