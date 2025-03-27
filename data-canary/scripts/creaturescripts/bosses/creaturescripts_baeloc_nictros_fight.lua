local config = {
	nictrosPos = Position(1783, 836, 15),
}

local sir_nictros_health = CreatureEvent("sir_nictros_health")

function sir_nictros_health.onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType)


	if primaryType == COMBAT_HEALING then
		return primaryDamage, primaryType, -secondaryDamage, secondaryType
	end

	local health = creature:getMaxHealth() * 0.60
	local brother_diff = (creature:getHealth() / creature:getMaxHealth()) * 100
	local brother = Creature("Sir Baeloc")

	if brother then
		if brother_diff < 55 then
			local brother_percent = (brother:getHealth() / brother:getMaxHealth()) * 100
			if (brother_percent - brother_diff) > 5 then
				creature:addHealth(28000)
			end
		end
	end

	creature:setStorageValue(1, creature:getStorageValue(1) + primaryDamage + secondaryDamage)
	if creature:getStorageValue(2) < 1 and creature:getStorageValue(1) >= health then
		creature:setStorageValue(2, 1)
		creature:say("Now it's your chance for entertaiment, dear brother!")
		creature:teleportTo(config.nictrosPos)
		creature:setMoveLocked(true)
		local baeloc = Creature("Sir Baeloc")
		if baeloc then
			baeloc:teleportTo(Position(1780, 839, 15))
			baeloc:setMoveLocked(false)
		end
	end

	return primaryDamage, primaryType, -secondaryDamage, secondaryType
end

sir_nictros_health:register()

local sir_baeloc_health = CreatureEvent("sir_baeloc_health")

function sir_baeloc_health.onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType)
	if primaryType == COMBAT_HEALING then
		return primaryDamage, primaryType, -secondaryDamage, secondaryType
	end

	local health = creature:getMaxHealth() * 0.60
	local brother_diff = (creature:getHealth() / creature:getMaxHealth()) * 100
	local brother = Creature("Sir Nictros")

	if brother then
		if brother_diff < 55 then
			local brother_percent = (brother:getHealth() / brother:getMaxHealth()) * 100
			if (brother_percent - brother_diff) > 5 then
				creature:addHealth(28000)
			end
		end
	end

	creature:setStorageValue(1, creature:getStorageValue(1) + primaryDamage + secondaryDamage)

	if creature:getStorageValue(2) < 1 and creature:getStorageValue(1) >= health then
		creature:setStorageValue(2, 1)
		creature:say("Join me in battle my brother. Let's share the fun!")
		local nictros = Creature("Sir Nictros")
		if nictros then
			nictros:teleportTo(Position(1780, 845, 15))
			nictros:setMoveLocked(false)
		end
	end

	return primaryDamage, primaryType, -secondaryDamage, secondaryType
end

sir_baeloc_health:register()
