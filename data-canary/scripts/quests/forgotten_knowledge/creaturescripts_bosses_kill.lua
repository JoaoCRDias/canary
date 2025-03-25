local bosses = {
	["lady tenebris"] = { storage = Storage.Quest.U11_02.ForgottenKnowledge.LadyTenebrisKilled },
	["the enraged thorn knight"] = { storage = Storage.Quest.U11_02.ForgottenKnowledge.ThornKnightKilled },
	["lloyd"] = { storage = Storage.Quest.U11_02.ForgottenKnowledge.LloydKilled },
	["soul of dragonking zyrtarch"] = { storage = Storage.Quest.U11_02.ForgottenKnowledge.DragonkingKilled },
	["melting frozen horror"] = { storage = Storage.Quest.U11_02.ForgottenKnowledge.HorrorKilled },
	["the time guardian"] = { storage = Storage.Quest.U11_02.ForgottenKnowledge.TimeGuardianKilled },
	["the blazing time guardian"] = { storage = Storage.Quest.U11_02.ForgottenKnowledge.TimeGuardianKilled },
	["the freezing time guardian"] = { storage = Storage.Quest.U11_02.ForgottenKnowledge.TimeGuardianKilled },
	["the last lore keeper"] = { storage = Storage.Quest.U11_02.ForgottenKnowledge.LastLoreKilled },
}

local bossesForgottenKill = CreatureEvent("ForgottenKnowledgeBossDeath")

function bossesForgottenKill.onDeath(creature)
	local bossConfig = bosses[creature:getName():lower()]
	if not bossConfig then
		return true
	end

	onDeathForDamagingPlayers(creature, function(creature, player)
		if bossConfig.storage then
			if creature:getName():lower() == "the last lore keeper" then
				player:setStorageValue(bossConfig.storage, os.time() + (13 * 24 * 3600) + (20 * 3600))
			else
				player:setStorageValue(bossConfig.storage, os.time() + 20 * 3600)
			end
		end
	end)
	return true
end

bossesForgottenKill:register()
