
local mapTexts = GlobalEvent("MapTexts")

local effects = {
	{position = Position(1000, 1000, 7), text = 'Bem vindo ao Kingsman OT!', effect = CONST_ME_TUTORIALSQUARE},
	{position = Position(1000, 994, 7), text = 'TP Hub', effect = CONST_ME_TUTORIALSQUARE},
	{position = Position(1020, 991, 8), text = 'Easy', effect = CONST_ME_TUTORIALSQUARE},
	{position = Position(1023, 991, 8), text = 'Medium', effect = CONST_ME_TUTORIALSQUARE},
	{position = Position(1026, 991, 8), text = 'Hard', effect = CONST_ME_TUTORIALSQUARE},
	{position = Position(1028, 963, 8), text = 'Hunts', effect = CONST_ME_TUTORIALSQUARE},

}

function mapTexts.onThink(interval)
	for i = 1, #effects do
		local settings = effects[i]
		local spectators = Game.getSpectators(settings.position, false, true, 7, 7, 5, 5)
		if #spectators > 0 then
			if settings.text then
				for i = 1, #spectators do
						spectators[i]:say(settings.text, TALKTYPE_MONSTER_SAY, false, spectators[i], settings.position)
				end
			end
			if settings.effect then
					settings.position:sendMagicEffect(settings.effect)
			end
		end
	end
	return true
end

mapTexts:interval(5000)
mapTexts:register()


