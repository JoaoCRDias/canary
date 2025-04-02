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
	--POI
	[6037] = {
		itemId = 2481,
		itemPos = Position(958, 1178, 10),
		reward = { { 3253, 1 } },
		storage = Storage.Quest.U7_9.ThePitsOfInferno.RewardChestBP,
	},
	[6038] = {
		itemId = 2481,
		itemPos = Position(958, 1179, 10),
		reward = { { 6529, 1 } },
		storage = Storage.Quest.U7_9.ThePitsOfInferno.RewardChestSoftBoots,
	},
	--Canivetes
	[6039] = {
		itemId = 2472,
		itemPos = Position(707, 1225, 8),
		reward = { { 9598, 1 } },
		storage = Storage.Canivetes,
	},
	[6040] = {
		itemId = 2472,
		itemPos = Position(708, 1225, 8),
		reward = { { 9596, 1 } },
		storage = Storage.Canivetes,
	},
	[6041] = {
		itemId = 2472,
		itemPos = Position(709, 1225, 8),
		reward = { { 9594, 1 } },
		storage = Storage.Canivetes,
	},
	--Custom Inq
	[6042] = {
		itemId = 2472,
		itemPos = Position(238, 1558, 12),
		reward = { { 25779, 1 } },
		storage = Storage.CustomInqui,
	},
	[6043] = {
		itemId = 2472,
		itemPos = Position(240, 1558, 12),
		reward = { { 8090, 1 } },
		storage = Storage.CustomInqui,
	},
	[6044] = {
		itemId = 2472,
		itemPos = Position(242, 1558, 12),
		reward = { { 8060, 1 } },
		storage = Storage.CustomInqui,
	},
	[6045] = {
		itemId = 2472,
		itemPos = Position(244, 1558, 12),
		reward = { { 8062, 1 } },
		storage = Storage.CustomInqui,
	},
	[6046] = {
		itemId = 2472,
		itemPos = Position(246, 1558, 12),
		reward = { { 8054, 1 } },
		storage = Storage.CustomInqui,
	},
	[6047] = {
		itemId = 2472,
		itemPos = Position(248, 1558, 12),
		reward = { { 8053, 1 } },
		storage = Storage.CustomInqui,
	},
	[6048] = {
		itemId = 2472,
		itemPos = Position(250, 1558, 12),
		reward = { { 8055, 1 } },
		storage = Storage.CustomInqui,
	},
	--Custom Wote
	[6049] = {
		itemId = 2472,
		itemPos = Position(755, 1496, 11),
		reward = { { 11687, 1 } },
		storage = Storage.CustomWote,
	},
	[6050] = {
		itemId = 2472,
		itemPos = Position(757, 1496, 11),
		reward = { { 11686, 1 } },
		storage = Storage.CustomWote,
	},
	[6051] = {
		itemId = 2472,
		itemPos = Position(759, 1496, 11),
		reward = { { 11689, 1 } },
		storage = Storage.CustomWote,
	},
	-- Destruction quest
	[6052] = {
		itemId = 2472,
		itemPos = Position(268, 1358, 8),
		reward = { { 27458, 1 } },
		storage = Storage.DestructionQuest,
	},
	[6053] = {
		itemId = 2472,
		itemPos = Position(269, 1358, 8),
		reward = { { 27457, 1 } },
		storage = Storage.DestructionQuest,
	},
	[6054] = {
		itemId = 2472,
		itemPos = Position(270, 1358, 8),
		reward = { { 27449, 1 }, { 27450, 1 } },
		storage = Storage.DestructionQuest,
	},
	[6055] = {
		itemId = 2472,
		itemPos = Position(271, 1358, 8),
		reward = { { 27453, 1 }, { 27454, 1 } },
		storage = Storage.DestructionQuest,
	},
	[6056] = {
		itemId = 2472,
		itemPos = Position(272, 1358, 8),
		reward = { { 27451, 1 }, { 27452, 1 } },
		storage = Storage.DestructionQuest,
	},
	[6057] = {
		itemId = 2472,
		itemPos = Position(273, 1358, 8),
		reward = { { 27455, 1 }, { 27456, 1 } },
		storage = Storage.DestructionQuest,
	},



}
