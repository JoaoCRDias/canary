local positions = {
	Position(1028, 913, 15),
	Position(1034, 917, 15),
	Position(1029, 924, 15),
	Position(1028, 920, 15),
	Position(1025, 914, 15),
	Position(1038, 920, 15),
	Position(1037, 915, 15),
	Position(1028, 924, 15),
	Position(1032, 920, 15),
	Position(1036, 921, 15),
	Position(1025, 919, 15),
}

local function createVortex()
	local tile = Tile(positions[math.random(#positions)])
	if tile then
		local ground = tile:getGround()
		if ground then
			ground:transform(22894)
			addEvent(function(positionInAddEvent)
				local tile = Tile(positionInAddEvent)
				if tile then
					local ground = tile:getGround()
					if ground then
						ground:transform(23049)
					end
				end
			end, 10 * 1000, tile:getPosition()) -- 10 seconds
		end
	end
end

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	createVortex()
end

spell:name("charge vortex")
spell:words("###451")
spell:blockWalls(true)
spell:needLearn(true)
spell:register()
