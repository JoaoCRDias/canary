--[[
	Description: This file is part of Roulette System (refactored)
	Author: Ly�
	Discord: Ly�#8767
	Adaptado para o Canary:  NvSo#4349
]]

local Slot = dofile(DATA_DIRECTORY .. '/scripts/magic_roulette/lib/classes/slot.lua')
local Animation = dofile(DATA_DIRECTORY .. '/scripts/magic_roulette/lib/animation.lua')
local DatabaseRoulettePlays = dofile(DATA_DIRECTORY .. '/scripts/magic_roulette/lib/database/roulette_plays.lua')
local Strings = dofile(DATA_DIRECTORY .. '/scripts/magic_roulette/lib/core/strings.lua')

slots = {
		[17320] = Slot {
			needItem = {id = 62564, count = 1},
			tilesPerSlot = 11,
			centerPosition = Position(991, 996, 9), --Centro da Roleta onde o pr�mio do item para

			items = {
				{id = 3043, count = 1, chance = 0.2, rare = true},
				{id = 3366, count = 1, chance = 0.3, rare = true},
				{id = 3278, count = 1, chance = 0.5, rare = true},
				{id = 3388, count = 1, chance = 9},
				{id = 3365, count = 1, chance = 9},
				{id = 6529, count = 1, chance = 9},
				{id = 14000, count = 1, chance = 9},
				{id = 3388, count = 1, chance = 9},
				{id = 3365, count = 1, chance = 9},
				{id = 6529, count = 1, chance = 9},
				{id = 14000, count = 1, chance = 9},
				{id = 3365, count = 1, chance = 9},
				{id = 6529, count = 1, chance = 9},
				{id = 14000, count = 1, chance = 9}
			},
		}
}

local Roulette = {}

function Roulette:startup()
	DatabaseRoulettePlays:updateAllRollingToPending()

	self.slots = slots
	for actionid, slot in pairs(self.slots) do
		slot:generatePositions()
		slot:loadChances(actionid)
	end
end

function Roulette:roll(player, slot)
	if slot:isRolling() then
		player:sendTextMessage(MESSAGE_STATUS, string.format(Strings.WAIT_TO_SPIN))
		return false
	end

	local reward = slot:generateReward()
	if not reward then
		player:sendTextMessage(MESSAGE_STATUS, string.format(Strings.GENERATE_REWARD_FAILURE))
		return false
	end

	local needItem = slot:getNeedItem()
	local needItemName = ItemType(needItem.id):getName()

	if not player:removeItem(needItem.id, needItem.count) then
		player:sendTextMessage(MESSAGE_STATUS, string.format(Strings.NEEDITEM_TO_SPIN:format(
			needItem.count,
			needItemName
		)))
		return false
	end

	local playerName = player:getName()

	slot.uuid = uuid()
	DatabaseRoulettePlays:create(slot.uuid, player:getGuid(), reward)

	slot:setRolling(true)
	slot:clearDummies()

	local onFinish = function()
		slot:deliverReward()
		slot:setRolling(false)

		if reward.rare then
			Game.broadcastMessage(string.format(Strings.GIVE_REWARD_FOUND_RARE:format(
				playerName,
				reward.count,
				ItemType(reward.id):getName()
			)), TALKTYPE_BROADCAST)
		end
	end

	Animation:start({
		slot = slot,
		reward = reward,
		onFinish = onFinish
	})
	return true
end

function Roulette:getSlot(actionid)
	self:startup()
	return self.slots[actionid]
end

return Roulette
