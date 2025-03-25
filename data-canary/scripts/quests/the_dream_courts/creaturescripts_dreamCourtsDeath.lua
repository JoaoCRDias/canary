local questlog = {
	[1] = {
		bossName = "Maxxenius",
		storageTimer = Storage.Quest.U12_00.TheDreamCourts.DreamScarGlobal.MaxxeniusTimer,
		storageKilled = Storage.Quest.U12_00.TheDreamCourts.DreamScarGlobal.MaxxeniusKilled,
	},
	[2] = {
		bossName = "Alptramun",
		storageTimer = Storage.Quest.U12_00.TheDreamCourts.DreamScarGlobal.AlptramunTimer,
		storageKilled = Storage.Quest.U12_00.TheDreamCourts.DreamScarGlobal.AlptramunKilled,
	},
	[3] = {
		bossName = "Izcandar the Banished",
		storageTimer = Storage.Quest.U12_00.TheDreamCourts.DreamScarGlobal.IzcandarTimer,
		storageKilled = Storage.Quest.U12_00.TheDreamCourts.DreamScarGlobal.IzcandarKilled,
	},
	[4] = {
		bossName = "Plagueroot",
		storageTimer = Storage.Quest.U12_00.TheDreamCourts.DreamScarGlobal.PlagueRootTimer,
		storageKilled = Storage.Quest.U12_00.TheDreamCourts.DreamScarGlobal.PlagueRootKilled,
	},
	[5] = {
		bossName = "Malofur Mangrinder",
		storageTimer = Storage.Quest.U12_00.TheDreamCourts.DreamScarGlobal.MalofurTimer,
		storageKilled = Storage.Quest.U12_00.TheDreamCourts.DreamScarGlobal.MalofurKilled,
	},
	[6] = {
		bossName = "The Nightmare Beast",
		storageTimer = Storage.Quest.U12_00.TheDreamCourts.DreamScarGlobal.NightmareTimer,
		storageKilled = Storage.Quest.U12_00.TheDreamCourts.DreamScarGlobal.NightmareKilled,
	},
}

local creaturescripts_dreamCourtsDeath = CreatureEvent("dreamCourtsDeath")

function creaturescripts_dreamCourtsDeath.onDeath(creature, corpse, killer, mostDamageKiller, lastHitUnjustified)
	if not creature:isMonster() or creature:getMaster() then
		return true
	end

	local cName = creature:getName()

	for _, k in pairs(questlog) do
		if cName == k.bossName then
			for pid, _ in pairs(creature:getDamageMap()) do
				local attackerPlayer = Player(pid)

				if attackerPlayer then
					attackerPlayer:setStorageValue(k.storageTimer, os.time() + 20 * 60 * 60)
					attackerPlayer:setStorageValue(k.storageKilled, 1)
				end
			end
		end
	end

	return true
end

creaturescripts_dreamCourtsDeath:register()
