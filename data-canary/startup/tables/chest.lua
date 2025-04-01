--[[
	Look README.md for see the reserved action/unique numbers
	From range 5000 to 6000 is reserved for keys chest
	From range 6001 to 472 is reserved for script reward
	Path: data\scripts\actions\system\quest_reward_common.lua

	From range 473 to 15000 is reserved for others scripts (varied rewards)

	There is no need to tamper with the chests scripts, just register a new table and configure correctly
	So the quest will work in-game

	Example:
	[xxxx] = {
		-- For use of the map
		itemId = xxxx,
		itemPos = {x = xxxxx, y = xxxxx, z = x},
		-- For use of the script
		container = xxxx (it's for use reward in a container, only put the id of the container here)
		keyAction = xxxx, (it's for use one key in the chest and is reward in container, only put the key in reward and action here)
		reward = {{xxxx, x}},
		storage = xxxxx
	},

		Example using KV:
		[xxxx] = {
			useKV = true,
			itemId = xxxx,
			itemPos = {x = xxxxx, y = xxxxx, z = x},
			container = xxxx, (it's for use reward in a container, only put the id of the container here)
			reward = {{xxxx, x}},
			questName = "testkv",
		}

	Note:
	The "for use of the map" variables are only used to create the action or unique on the map during startup
	If the reward is an key, do not need to use "keyAction", only set the storage as same action id

	The "for use of the script" variables are used by the scripts
	To allow a single script to manage all rewards
]]

ChestUnique = {
	-- Demon helmet quest
	-- Steel boots
	[6029] = {
		itemId = 2472,
		itemPos = Position(707, 1280, 9),
		reward = { { 3554, 1 } },
		storage = Storage.Quest.U6_4.DemonHelmet.Rewards.SteelBoots,
	},
	-- Demon helmet
	[6030] = {
		itemId = 2472,
		itemPos = Position(707, 1281, 9),
		reward = { { 3387, 1 } },
		storage = Storage.Quest.U6_4.DemonHelmet.Rewards.DemonHelmet,
	},
	-- Demon shield
	[6031] = {
		itemId = 2472,
		itemPos = Position(707, 1282, 9),
		reward = { { 3420, 1 } },
		storage = Storage.Quest.U6_4.DemonHelmet.Rewards.DemonShield,
	},
	--Annihilator
	[6032] = {
		itemId = 2472,
		itemPos = Position(718, 1304, 9),
		reward = { { 8026, 1 } },
		storage = Storage.Quest.U7_24.TheAnnihilator.Reward,
	},
	[6033] = {
		itemId = 2472,
		itemPos = Position(720, 1304, 9),
		reward = { { 3288, 1 } },
		storage = Storage.Quest.U7_24.TheAnnihilator.Reward,
	},
	[6034] = {
		itemId = 2472,
		itemPos = Position(722, 1304, 9),
		reward = { { 3319, 1 } },
		storage = Storage.Quest.U7_24.TheAnnihilator.Reward,
	},
	[6035] = {
		itemId = 2472,
		itemPos = Position(724, 1304, 9),
		reward = { { 3309, 1 } },
		storage = Storage.Quest.U7_24.TheAnnihilator.Reward,
	},
	[6036] = {
		itemId = 2472,
		itemPos = Position(726, 1304, 9),
		reward = { { 25700, 1 } },
		storage = Storage.Quest.U7_24.TheAnnihilator.Reward,
	},

}
