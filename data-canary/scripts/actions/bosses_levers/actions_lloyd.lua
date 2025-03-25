local config = {
	boss = {
		name = "Lloyd",
		position = Position(1378, 1040, 15),
	},
	requiredLevel = 250,
	monsters = {
		{ name = "cosmic energy prism a", pos = Position(1375, 1039, 15) },
		{ name = "cosmic energy prism b", pos = Position(1377, 1040, 15) },
		{ name = "cosmic energy prism c", pos = Position(1380, 1040, 15) },
		{ name = "cosmic energy prism d", pos = Position(1382, 1039, 15) },
	},
	playerPositions = {
		{ pos = Position(1376, 1064, 15), teleport = Position(1378, 1046, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(1376, 1065, 15), teleport = Position(1378, 1046, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(1376, 1066, 15), teleport = Position(1378, 1046, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(1376, 1067, 15), teleport = Position(1378, 1046, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(1376, 1068, 15), teleport = Position(1378, 1046, 15), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(1248, 1023, 15),
		to = Position(1270, 1046, 15),
	},
	exit = Position(1262, 1067, 15),
}

local lever = BossLever(config)
lever:position(Position(1376, 1063, 15))
lever:register()
