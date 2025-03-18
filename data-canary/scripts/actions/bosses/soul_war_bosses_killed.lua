local bossesGraveDanger = CreatureEvent("GraveDangerBossDeath")
function bossesGraveDanger.onDeath(creature)
	local bossName = creature:getName()
	if not table.contains({ "Goshnar's Malice", "Goshnar's Hatred", "Goshnar's Spite", "Goshnar's Cruelty", "Goshnar's Greed" }, bossName) then
		return false
	end

	onDeathForDamagingPlayers(creature, function(creature, player)
		local kv = player:kv():scoped("soul-war-quest")
		local killed = kv:scoped(bossName):get("killed") or 0
		if killed == 0 then
			kv:scoped(bossName):set("killed", 1)
		end

	end)

	return true
end

bossesGraveDanger:register()
