
local mapTexts = GlobalEvent("MapTexts")

local effects = {
	{position = Position(1000, 1000, 7), text = 'Bem vindo ao Turbo Baiak!', effect = CONST_ME_TUTORIALSQUARE},
	{position = Position(1020, 991, 8), text = 'Easy'},
	{position = Position(1022, 991, 8), text = 'Medium'},
	{position = Position(1024, 991, 8), text = 'Hard'},
	{position = Position(1026, 991, 8), text = 'Epic'},
	{position = Position(1007, 1003, 7), text = 'Clean BP'},
	{position = Position(1007, 999, 7), text = 'Free Bless'},
	{position = Position(1023, 996, 8), text = 'Tasks', effect = 264},
	{position = Position(997, 1002, 6), text = 'Castle', effect = 18},

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


