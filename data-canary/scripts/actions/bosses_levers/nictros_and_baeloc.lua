local nictrosPosition = Position(1783, 836, 15)
local baelocPosition = Position(1778, 836, 15)

local config = {
	boss = {
		name = "Sir Nictros",
		createFunction = function()
			local nictros = Game.createMonster("Sir Nictros", nictrosPosition, true, true)
			local baeloc = Game.createMonster("Sir Baeloc", baelocPosition, true, true)
			return nictros and baeloc
		end,
	},
	requiredLevel = 250,
	playerPositions = {
		{ pos = Position(1780, 821, 15), teleport = Position(1780, 855, 15) },
		{ pos = Position(1781, 821, 15), teleport = Position(1780, 855, 15) },
		{ pos = Position(1782, 821, 15), teleport = Position(1780, 855, 15) },
		{ pos = Position(1783, 821, 15), teleport = Position(1780, 855, 15) },
		{ pos = Position(1784, 821, 15), teleport = Position(1780, 855, 15) },
	},
	specPos = {
		from = Position(1768, 833, 15),
		to = Position(1792, 860, 15),
	},
	onUseExtra = function(player)
		addEvent(function()
			local baeloc = Creature("Sir Baeloc")
			local nictros = Creature("Sir Nictros")

			if baeloc then
				baeloc:say("Ah look my Brother! Challengers! After all this time finally a chance to prove our skills!")
				addEvent(function()
					local nictros = Creature("Sir Nictros")
					if nictros then
						nictros:say("Indeed! It has been a while! As the elder one I request the right of the first battle!")
					end
				end, 6 * 1000)
			end

			addEvent(function()
				local baeloc = Creature("Sir Baeloc")
				local nictros = Creature("Sir Nictros")
				if baeloc then
					baeloc:say("Oh, man! You always get the fun!")
					if nictros then
						nictros:setMoveLocked(false)
					end
				end
			end, 12 * 1000)
		end, 4 * 1000)
	end,
	exit = Position(1781, 819, 15),
}

local lever = BossLever(config)
lever:position(Position(1779, 821, 15))
lever:register()
