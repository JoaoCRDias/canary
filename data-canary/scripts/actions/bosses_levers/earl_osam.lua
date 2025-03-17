local config = {
	boss = {
		name = "Earl Osam",
		position = Position(1844, 850, 15),
	},
	requiredLevel = 250,
	playerPositions = {
		{ pos = Position(1778, 901, 15), teleport = Position(1844, 841, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(1779, 901, 15), teleport = Position(1844, 841, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(1780, 901, 15), teleport = Position(1844, 841, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(1781, 901, 15), teleport = Position(1844, 841, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(1782, 901, 15), teleport = Position(1844, 841, 15), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(1832, 835, 15),
		to = Position(1855, 857, 15),
	},
	exit = Position(1873, 849, 15),
}

local lever = BossLever(config)
lever:position(Position(1873, 850, 15))
lever:register()
