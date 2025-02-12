local npcName = "Quests"

local npcType = Game.createNpcType(npcName)
local npcConfig = {}

npcConfig.name = npcName
npcConfig.description = npcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 0

npcConfig.outfit = {
	lookTypeEx = 61093,
}

npcConfig.flags = {
	floorchange = false,
}

-- Register npc
npcType:register(npcConfig)
