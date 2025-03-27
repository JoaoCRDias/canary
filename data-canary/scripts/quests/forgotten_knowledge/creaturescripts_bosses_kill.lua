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
			player:setStorageValue(bossConfig.storage, 1)
		end
	end)
	return true
end

bossesForgottenKill:register()
