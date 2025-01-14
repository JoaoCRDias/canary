local internalNpcName = "Sigfried"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 1000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 57,
}

npcConfig.flags = {
	floorchange = false,
}

npcConfig.voices = {
	interval = 15000,
	chance = 50,
	{ text = "Feeling lost, my child? Ask me for hints or help!" },
	{ text = "Come to me if you need healing!" },
	{ text = "Welcome to the temple of Crownhaven!" },
	{ text = "Don't despair! Help is near!" },
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

local function greetCallback(npc, creature)
	local playerId = creature:getId()
	local player = Player(creature)
	local health = player:getHealth()
	local lowHealth = health < 65
	local poisoned = player:getCondition(CONDITION_POISON)
	if lowHealth or poisoned then
		npcHandler:setMessage(MESSAGE_GREET, "Hello, |PLAYERNAME|! You are looking really bad. Let me heal your wounds. It's my job after all.")
		if lowHealth then
			player:addHealth(65 - health)
		end
		if poisoned then
			player:removeCondition(CONDITION_POISON)
		end
		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
	else
		npcHandler:setMessage(MESSAGE_GREET, "Hello, |PLAYERNAME|! I'll {heal} you if you are injured or poisoned. Feel free to ask me for {help} or general {hints}.")
	end
	return true
end

-- Basic keywords
keywordHandler:addKeyword({ "hint" }, StdModule.rookgaardHints, { npcHandler = npcHandler })
keywordHandler:addKeyword({ "name" }, StdModule.say, { npcHandler = npcHandler, text = "My name is Cipfried." })

keywordHandler:addKeyword({ "heal" }, StdModule.say, { npcHandler = npcHandler, text = "You are poisoned. I will help you." }, function(player)
	return player:getCondition(CONDITION_POISON)
end, function(player)
	local health = player:getHealth()
	if health < 65 then
		player:addHealth(65 - health)
	end
	player:removeCondition(CONDITION_POISON)
	player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
end)
keywordHandler:addKeyword({ "heal" }, StdModule.say, { npcHandler = npcHandler, text = "Let me heal your wounds." }, function(player)
	return player:getHealth() < 185 and player:getHealth() < player:getBaseMaxHealth()
end, function(player)
	local health = player:getHealth()
	player:addHealth(185 - health)
	player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
end)
keywordHandler:addKeyword({ "heal" }, StdModule.say, { npcHandler = npcHandler, text = "You aren't looking really bad, |PLAYERNAME|. I can only help in cases of real emergencies. Raise your health simply by eating {food}." })

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setMessage(MESSAGE_WALKAWAY, "Well, bye then.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Farewell, |PLAYERNAME|!")
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

-- npcType registering the npcConfig table
npcType:register(npcConfig)
