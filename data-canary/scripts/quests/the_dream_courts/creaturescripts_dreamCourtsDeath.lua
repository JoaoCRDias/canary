local questlog = {
	[1] = {
		bossName = "Maxxenius",
		storageKilled = Storage.Quest.U12_00.TheDreamCourts.MaxxeniusKilled,
	},
	[2] = {
		bossName = "Alptramun",
		storageKilled = Storage.Quest.U12_00.TheDreamCourts.AlptramunKilled,
	},
	[3] = {
		bossName = "Izcandar the Banished",
		storageKilled = Storage.Quest.U12_00.TheDreamCourts.IzcandarKilled,
	},
	[4] = {
		bossName = "Plagueroot",
		storageKilled = Storage.Quest.U12_00.TheDreamCourts.PlagueRootKilled,
	},
	[5] = {
		bossName = "Malofur Mangrinder",
		storageKilled = Storage.Quest.U12_00.TheDreamCourts.MalofurKilled,
	},
	[6] = {
		bossName = "The Nightmare Beast",
		storageKilled = Storage.Quest.U12_00.TheDreamCourts.NightmareKilled,
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
					attackerPlayer:setStorageValue(k.storageKilled, 1)
				end
			end
		end
	end

	return true
end

creaturescripts_dreamCourtsDeath:register()
