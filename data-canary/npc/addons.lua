local internalNpcName = "Addons"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
    lookType = 130,
    lookHead = 115,
    lookBody = 39,
    lookLegs = 96,
    lookFeet = 118,
    lookAddons = 3
}

npcConfig.flags = {
    floorchange = false
}

npcConfig.voices = {
    interval = 15000,
    chance = 50,
    {
        text = 'Come see my Addons bro!'
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
    ['citizen addons'] = {
        cost = 0,
        items = {{8778, 50}},
        outfit_female = 136,
        outfit_male = 128
    },
    ['hunter addons'] = {
        cost = 0,
        items = {{8778, 50}},
        outfit_female = 137,
        outfit_male = 129
    },
    ['knight addons'] = {
        cost = 0,
        items = {{8778, 50}},
        outfit_female = 139,
        outfit_male = 131
    },
    ['mage addons'] = {
        cost = 0,
        items = {{8778, 50}},
        outfit_female = 138,
        outfit_male = 130
    },
    ['summoner addons'] = {
        cost = 0,
        items = {{8778, 50}},
        outfit_female = 141,
        outfit_male = 133
    },
    ['barbarian addons'] = {
        cost = 0,
        items = {{8778, 50}},
        outfit_female = 147,
        outfit_male = 143
    },
    ['druid addons'] = {
        cost = 0,
        items = {{8778, 50}},
        outfit_female = 148,
        outfit_male = 144
    },
    ['nobleman addons'] = {
        cost = 0,
        items = {{8778, 50}},
        outfit_female = 140,
        outfit_male = 132
    },
    ['oriental addons'] = {
        cost = 0,
        items = {{8778, 50}},
        outfit_female = 150,
        outfit_male = 146
    },
    ['warrior addons'] = {
        cost = 0,
        items = {{8778, 50}},
        outfit_female = 142,
        outfit_male = 134
    },
    ['wizard addons'] = {
        cost = 0,
        items = {{8778, 50}},
        outfit_female = 149,
        outfit_male = 145
    },
    ['assassin addons'] = {
        cost = 0,
        items = {{8778, 50}},
        outfit_female = 156,
        outfit_male = 152
    },
    ['beggar addons'] = {
        cost = 0,
        items = {{8778, 50}},
        outfit_female = 157,
        outfit_male = 153
    },
    ['pirate addons'] = {
        cost = 0,
        items = {{8778, 50}},
        outfit_female = 155,
        outfit_male = 151
    },
    ['shaman addons'] = {
        cost = 0,
        items = {{8778, 50}},
        outfit_female = 158,
        outfit_male = 154
    },
    ['norseman addons'] = {
        cost = 0,
        items = {{8778, 50}},
        outfit_female = 252,
        outfit_male = 251
    },
    ['nightmare addons'] = {
        cost = 0,
        items = {{8778, 50}},
        outfit_female = 269,
        outfit_male = 268
    },
    ['jester addons'] = {
        cost = 0,
        items = {{8778, 50}},
        outfit_female = 270,
        outfit_male = 273
    },
    ['brotherhood addons'] = {
        cost = 0,
        items = {{8778, 50}},
        outfit_female = 279,
        outfit_male = 278
    },
    ['demon hunter addons'] = {
        cost = 0,
        items = {{8778, 50}},
        outfit_female = 288,
        outfit_male = 289
    },
    ['yalaharian addons'] = {
        cost = 0,
        items = {{8778, 50}},
        outfit_female = 324,
        outfit_male = 325
    },
    ['warmaster addons'] = {
        cost = 0,
        items = {{8778, 50}},
        outfit_female = 336,
        outfit_male = 335
    },
    ['wayfarer addons'] = {
        cost = 0,
        items = {{8778, 50}},
        outfit_female = 366,
        outfit_male = 367
    },
    ['afflicted addons'] = {
        cost = 0,
        items = {{8778, 50}},
        outfit_female = 431,
        outfit_male = 430
    },
    ['elementalist addons'] = {
        cost = 0,
        items = {{8778, 50}},
        outfit_female = 433,
        outfit_male = 432
    },
    ['deepling addons'] = {
        cost = 0,
        items = {{8778, 50}},
        outfit_female = 464,
        outfit_male = 463
    },
    ['insectoid addons'] = {
        cost = 0,
        items = {{8778, 50}},
        outfit_female = 466,
        outfit_male = 465
    },
    ['crystal warlord addons'] = {
        cost = 0,
        items = {{8778, 50}},
        outfit_female = 513,
        outfit_male = 512
    },
    ['soil guardian addons'] = {
        cost = 0,
        items = {{8778, 50}},
        outfit_female = 514,
        outfit_male = 516
    },
    ['demon addons'] = {
        cost = 0,
        items = {{8778, 50}},
        outfit_female = 542,
        outfit_male = 541
    },
    ['cave explorer addons'] = {
        cost = 0,
        items = {{8778, 50}},
        outfit_female = 575,
        outfit_male = 574
    },
    ['dream warden addons'] = {
        cost = 0,
        items = {{8778, 50}},
        outfit_female = 578,
        outfit_male = 577
    },
    ['glooth engineer addons'] = {
        cost = 0,
        items = {{8778, 50}},
        outfit_female = 618,
        outfit_male = 610
    },
    ['jersey addons'] = {
        cost = 0,
        items = {{8778, 50}},
        outfit_female = 620,
        outfit_male = 619
    },
    ['recruiter addons'] = {
        cost = 0,
        items = {{8778, 50}},
        outfit_female = 745,
        outfit_male = 746
    },
    ['rift warrior addons'] = {
        cost = 0,
        items = {{8778, 50}},
        outfit_female = 845,
        outfit_male = 846
    },
    ['festive addons'] = {
        cost = 0,
        items = {{8778, 50}},
        outfit_female = 929,
        outfit_male = 931
    },
    ['makeshift warrior addons'] = {
        cost = 0,
        items = {{8778, 50}},
        outfit_female = 1043,
        outfit_male = 1042
    },
    ['battle mage addons'] = {
        cost = 0,
        items = {{8778, 50}},
        outfit_female = 1070,
        outfit_male = 1069
    },
    ['discoverer addons'] = {
        cost = 0,
        items = {{8778, 50}},
        outfit_female = 1095,
        outfit_male = 1094
    },
    ['dream warrior addons'] = {
        cost = 0,
        items = {{8778, 50}},
        outfit_female = 1147,
        outfit_male = 1146
    },
    ['percht raider addons'] = {
        cost = 0,
        items = {{8778, 50}},
        outfit_female = 1162,
        outfit_male = 1161
    },
    ['hand of the inquisition addons'] = {
        cost = 0,
        items = {{8778, 50}},
        outfit_female = 1244,
        outfit_male = 1243
    },
    ['orcsoberfest garb addons'] = {
        cost = 0,
        items = {{8778, 50}},
        outfit_female = 1252,
        outfit_male = 1251
    },
    ['poltergeist addons'] = {
        cost = 0,
        items = {{8778, 50}},
        outfit_female = 1271,
        outfit_male = 1270
    },
    ['falconer addons'] = {
        cost = 0,
        items = {{8778, 50}},
        outfit_female = 1283,
        outfit_male = 1282
    },
    ['revenant addons'] = {
        cost = 0,
        items = {{8778, 50}},
        outfit_female = 1323,
        outfit_male = 1322
    },
    ['rascoohan addons'] = {
        cost = 0,
        items = {{8778, 50}},
        outfit_female = 1372,
        outfit_male = 1371
    },
    ['citizen of issavi addons'] = {
        cost = 0,
        items = {{8778, 50}},
        outfit_female = 1387,
        outfit_male = 1386
    },
    ['royal bounacean advisor addons'] = {
        cost = 0,
        items = {{8778, 50}},
        outfit_female = 1437,
        outfit_male = 1436
    },
    ['fire-fighter addons'] = {
        cost = 0,
        items = {{8778, 50}},
        outfit_female = 1569,
        outfit_male = 1568
    },
    ['ancient aucar addons'] = {
        cost = 0,
        items = {{8778, 50}},
        outfit_female = 1598,
        outfit_male = 1597
    },
    ['decaying defender addons'] = {
        cost = 0,
        items = {{8778, 50}},
        outfit_female = 1663,
        outfit_male = 1662
    },
    ['draccoon herald addons'] = {
        cost = 0,
        items = {{8778, 50}},
        outfit_female = 1723,
        outfit_male = 1722
    },
    ['rootwalker addons'] = {
        cost = 0,
        items = {{8778, 50}},
        outfit_female = 1775,
        outfit_male = 1774
    },
    ['golden addons'] = {
        cost = 10000000000,
        items = {},
        outfit_female = 1211,
        outfit_male = 1210
    },
    ['royal costume addons'] = {
        cost = 0,
        items = {{22721, 20000}, {22516, 20000}},
        outfit_female = 1456,
        outfit_male = 1457
    }
}
local o = {'citizen', 'hunter', 'knight', 'mage', 'nobleman', 'summoner', 'warrior', 'barbarian', 'druid', 'wizard',
           'oriental', 'pirate', 'assassin', 'beggar', 'shaman', 'norseman', 'nightmare', 'jester', 'brotherhood',
           'demon hunter', 'yalaharian', 'warmaster', 'wayfarer', 'afflicted', 'elementalist', 'deepling', 'insectoid',
           'crystal warlord', 'soil guardian', 'demon', 'cave explorer', 'dream warden', 'glooth engineer', 'jersey',
           'recruiter', 'rift warrior', 'festive', 'makeshift warrior', 'battle mage', 'discoverer', 'dream warrior',
           'percht raider', 'hand of the inquisition', 'orcsoberfest garb', 'poltergeist', 'falconer', 'revenant',
           'rascoohan', 'citizen of issavi', 'royal bounacean advisor', 'fire-fighter', 'ancient aucar',
           'decaying defender', 'draccoon herald', 'rootwalker', 'golden', 'royal costume'}
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

        if (player:hasOutfit(addonInfo.outfit_female, 3) or player:hasOutfit(addonInfo.outfit_male, 3)) then
            npcHandler:say('You already have this addon!', npc, creature)
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
                doPlayerAddOutfit(creature, addoninfo[rtnt].outfit_male, 3)
                doPlayerAddOutfit(creature, addoninfo[rtnt].outfit_female, 3)
                npcHandler:say('Here you are.', npc, creature)
            else
                npcHandler:say('You do not have needed items!', npc, creature)
            end
            rtnt = nil
            talkState[talkUser] = 0
            npcHandler:resetNpc(creature)
            return true
        end
    elseif MsgContains(message, "addon") then
        npcHandler:say('I can give you full addons for {' .. table.concat(o, "}, {") .. '} outfits.', npc, creature)
        rtnt = nil
        talkState[talkUser] = 0
        npcHandler:resetNpc(creature)
        return true
    elseif MsgContains(message, "help") then
        npcHandler:say('You must say \'NAME addons\', for the full addon', npc, creature)
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
    'Welcome |PLAYERNAME|! If you want some addons, just ask me! Do you want to see my {addons}, or are you decided? If you are decided, just ask me like this: {citizen addons}')
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)
npcType:register(npcConfig)
