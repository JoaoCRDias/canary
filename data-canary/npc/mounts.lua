local internalNpcName = "Mounts"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 792,
	lookHead = 168,
	lookBody = 89,
	lookLegs = 99,
	lookFeet = 230,
	lookAddons = 3,
}

npcConfig.flags = {
	floorchange = false
}

npcConfig.voices = {
	interval = 15000,
	chance = 50,
	{
		text = 'Come see my Mounts Sir!'
	}
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

addoninfo = {
	["widow queen"] = {
		cost = 0,
		items = { { 21948, 50 } },
		mount = 1,
	},
	["racing bird"] = {
		cost = 0,
		items = { { 21948, 50 } },
		mount = 2,
	},
	["war bear"] = {
		cost = 0,
		items = { { 21948, 50 } },
		mount = 3,
	},
	["black sheep"] = {
		cost = 0,
		items = { { 21948, 50 } },
		mount = 4,
	},
	["midnight panther"] = {
		cost = 0,
		items = { { 21948, 50 } },
		mount = 5,
	},
	["draptor"] = {
		cost = 0,
		items = { { 21948, 50 } },
		mount = 6,
	},
	["titanica"] = {
		cost = 0,
		items = { { 21948, 50 } },
		mount = 7,
	},
	["tin lizzard"] = {
		cost = 0,
		items = { { 21948, 50 } },
		mount = 8,
	},
	["blazebringer"] = {
		cost = 0,
		items = { { 21948, 50 } },
		mount = 9,
	},
	["rapid boar"] = {
		cost = 0,
		items = { { 21948, 50 } },
		mount = 10,
	},
	["stampor"] = {
		cost = 0,
		items = { { 21948, 50 } },
		mount = 11,
	},
	["undead cavebear"] = {
		cost = 0,
		items = { { 21948, 50 } },
		mount = 12,
	},
	["donkey"] = {
		cost = 0,
		items = { { 21948, 50 } },
		mount = 13,
	},
	["tiger slug"] = {
		cost = 0,
		items = { { 21948, 50 } },
		mount = 14,
	},
	["uniwheel"] = {
		cost = 0,
		items = { { 21948, 50 } },
		mount = 15,
	},
	["crystal wolf"] = {
		cost = 0,
		items = { { 21948, 50 } },
		mount = 16,
	},
	["war horse"] = {
		cost = 0,
		items = { { 21948, 50 } },
		mount = 17,
	},
	["kingly deer"] = {
		cost = 0,
		items = { { 21948, 50 } },
		mount = 18,
	},
	["tamed panda"] = {
		cost = 0,
		items = { { 21948, 50 } },
		mount = 19,
	},
	["dromedary"] = {
		cost = 0,
		items = { { 21948, 50 } },
		mount = 20,
	},
	["scorpion king"] = {
		cost = 0,
		items = { { 21948, 50 } },
		mount = 21,
	},
	["rented horse"] = {
		cost = 0,
		items = { { 21948, 50 } },
		mount = 22,
	},
	["rented horse (gray)"] = {
		cost = 0,
		items = { { 21948, 50 } },
		mount = 25,
	},
	["rented horse (brown)"] = {
		cost = 0,
		items = { { 21948, 50 } },
		mount = 26,
	},
	["lady bug"] = {
		cost = 0,
		items = { { 21948, 50 } },
		mount = 27,
	},
	["manta ray"] = {
		cost = 0,
		items = { { 21948, 50 } },
		mount = 28,
	},
	["ironblight"] = {
		cost = 0,
		items = { { 21948, 50 } },
		mount = 29,
	},
	["magma crawler"] = {
		cost = 0,
		items = { { 21948, 50 } },
		mount = 30,
	},
	["dragonling"] = {
		cost = 0,
		items = { { 21948, 50 } },
		mount = 31,
	},
	["gnarlhound"] = {
		cost = 0,
		items = { { 21948, 50 } },
		mount = 32,
	},
}
local o = { 'widow queen', 'racing bird', 'war bear', 'black sheep', 'midnight panther', 'draptor', 'titanica', 'tin lizzard', 'blazebringer', 'rapid boar', 'stampor', 'undead cavebear', 'donkey', 'tiger slug', 'uniwheel', 'crystal wolf', 'war horse', 'kingly deer', 'tamed panda', 'dromedary', 'scorpion king', 'rented horse', 'rented horse (gray)', 'rented horse (brown)', 'lady bug', 'manta ray',
	'ironblight', 'magma crawler', 'dragonling', 'gnarlhound'
}
local rtnt = {}
local function creatureSayCallback(npc, creature, type, message)
	local talkUser = creature
	local player = Player(creature)
	local playerId = player:getId()
	local addonInfo = addoninfo[message]

	local talkState = {}
	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	if addonInfo ~= nil then
		local itemsTable = addonInfo.items
		local items_list = ''

		if (player:hasMount(addonInfo.mount)) then
			npcHandler:say('You already have this mount!', npc, creature)
			npcHandler:resetNpc(creature)
			return true
		elseif table.maxn(itemsTable) > 0 then
			for i = 1, table.maxn(itemsTable) do
				local item = itemsTable[i]
				items_list = items_list .. item[2] .. ' ' .. ItemType(item[1]):getName()
				if i ~= table.maxn(itemsTable) then
					items_list = items_list .. ', '
				end
			end
		end
		local text = ''
		if (addonInfo.cost > 0) then
			text = addonInfo.cost .. ' gp'
		elseif table.maxn(addonInfo.items) then
			text = items_list
		elseif (addonInfo.cost > 0) and table.maxn(addonInfo.items) then
			text = items_list .. ' and ' .. addonInfo.cost .. ' gp'
		end
		npcHandler:say('For ' .. message .. ' you will need ' .. text .. '. Do you have it all with you?', npc, creature)
		rtnt = message
		npcHandler:setTopic(playerId, 2)
		return true
	elseif npcHandler:getTopic(playerId) == 2 then
		if MsgContains(message, "yes") then
			local items_number = 0
			if table.maxn(addoninfo[rtnt].items) > 0 then
				for i = 1, table.maxn(addoninfo[rtnt].items) do
					local item = addoninfo[rtnt].items[i]
					if (getPlayerItemCount(creature, item[1]) >= item[2]) then
						items_number = items_number + 1
					end
				end
			end
			if (getPlayerMoney(creature) >= addoninfo[rtnt].cost) and
					(items_number == table.maxn(addoninfo[rtnt].items)) then
				doPlayerRemoveMoney(creature, addoninfo[rtnt].cost)
				if table.maxn(addoninfo[rtnt].items) > 0 then
					for i = 1, table.maxn(addoninfo[rtnt].items) do
						local item = addoninfo[rtnt].items[i]
						doPlayerRemoveItem(creature, item[1], item[2])
					end
				end
				player:addMount(addoninfo[rtnt].mount)
				npcHandler:say('Here you are.', npc, creature)
			else
				npcHandler:say('You do not have needed items!', npc, creature)
			end
			rtnt = nil
			talkState[talkUser] = 0
			npcHandler:resetNpc(creature)
			return true
		end
	elseif MsgContains(message, "mount") then
		npcHandler:say('I can give you that mounts {' .. table.concat(o, "}, {") .. '}.', npc, creature)
		rtnt = nil
		talkState[talkUser] = 0
		npcHandler:resetNpc(creature)
		return true
	elseif MsgContains(message, "help") then
		npcHandler:say('You must say \'NAME\', for the mount', npc, creature)
		rtnt = nil
		talkState[talkUser] = 0
		npcHandler:resetNpc(creature)
		return true
	else
		if talkState[talkUser] ~= nil then
			if talkState[talkUser] > 0 then
				npcHandler:say('Come back when you get these items.', npc, creature)
				rtnt = nil
				talkState[talkUser] = 0
				npcHandler:resetNpc(creature)
				return true
			end
		end
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET,
	'Welcome |PLAYERNAME|! If you want some mount, just ask me! Do you want to see my {mounts}, or are you decided? If you are decided, just ask me like this: {donkey}')
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)
npcType:register(npcConfig)
