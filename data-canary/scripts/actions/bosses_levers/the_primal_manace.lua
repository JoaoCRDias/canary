local config = {
	boss = {
		name = "The Primal Menace",
		position = Position(1003, 1447, 15),
	},
	requiredLevel = 500,
	playerPositions = {
		{ pos = Position(989, 1486, 15), teleport = Position(1012, 1447, 15) },
		{ pos = Position(990, 1486, 15), teleport = Position(1012, 1447, 15) },
		{ pos = Position(991, 1486, 15), teleport = Position(1012, 1447, 15) },
		{ pos = Position(992, 1486, 15), teleport = Position(1012, 1447, 15) },
		{ pos = Position(993, 1486, 15), teleport = Position(1012, 1447, 15) },
	},
	specPos = {
		from = Position(993, 1437, 15),
		to = Position(1019, 1459, 15),
	},
	exit = Position(995, 1486, 15),
}

lever = BossLever(config)
lever:position(Position(988, 1486, 15))
lever:register()
