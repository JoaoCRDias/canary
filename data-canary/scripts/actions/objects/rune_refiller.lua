local conf = {
	toggleLogger = true, -- if send terminal message when player use the item
	runeRefillerId = 60437, -- register the item
	exhaust = 300,
}



local itemsToSell = {
	{ itemName = "great health potion", clientId = 239, buy = 225 },
	{ itemName = "great mana potion", clientId = 238, buy = 158 },
	{ itemName = "great spirit potion", clientId = 7642, buy = 254 },
	{ itemName = "health potion", clientId = 266, buy = 50 },
	{ itemName = "mana potion", clientId = 268, buy = 56 },
	{ itemName = "magic shield potion", clientId = 35563, buy = 50000 },
	{ itemName = "strong health potion", clientId = 236, buy = 115 },
	{ itemName = "strong mana potion", clientId = 237, buy = 108 },
	{ itemName = "supreme health potion", clientId = 23375, buy = 650 },
	{ itemName = "ultimate health potion", clientId = 7643, buy = 379 },
	{ itemName = "ultimate mana potion", clientId = 23373, buy = 488 },
	{ itemName = "ultimate spirit potion", clientId = 23374, buy = 488 },
}

local itemSeller = Action()

function itemSeller.onUse(player, item, fromPosition, target, toPosition, isHotkey)

	return true
end

itemSeller:id(conf.runeRefillerId)
itemSeller:register()
