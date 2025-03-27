local crystalDuration = 2

local function createCrystal(player)
	local chance = math.random(10)
	local itemId = chance <= 2 and 20131 or 27509

	local item = Game.createItem(itemId, 1)
	local ret = player:addItemEx(item)
	if ret ~= RETURNVALUE_NOERROR then
		player:sendCancelMessage(Game.getReturnMessage(ret))
		return false
	end

	return true
end

local dangerousDepthWarzoneCrystals = Action()
function dangerousDepthWarzoneCrystals.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local crystalTimer = crystals[item:getActionId()]
	if not crystalTimer or crystalTimer > os.time() then
		return true
	end

	local crystal = createCrystal(player)
	if crystal then
		player:setStorageValue(crystalTimer, os.time() + crystalDuration)
	end

	return true
end


dangerousDepthWarzoneCrystals:aid(57358)

dangerousDepthWarzoneCrystals:register()
