local function loadMapActionsAndUniques()
	loadLuaMapUnique(ChestUnique)
end

local function loadMapAttributes()
	logger.debug("Loading map attributes")


	loadMapActionsAndUniques()
	logger.debug("Loaded all actions and uniques in the map")
end

local function resetGlobalStorages()
	for i = 1, #startupGlobalStorages do
		Game.setStorageValue(startupGlobalStorages[i], 0)
	end
end

local function resetFerumbrasAscendantQuestHabitats()
	for i = 1, #Storage.Quest.U10_90.FerumbrasAscension.Habitats do
		Game.setStorageValue(Storage.Quest.U10_90.FerumbrasAscension.Habitats[i], 0)
	end
end

local mapAttributesLoader = GlobalEvent("Map Attributes Loader")

function mapAttributesLoader.onStartup()
	loadMapAttributes()
	resetGlobalStorages()
	resetFerumbrasAscendantQuestHabitats()
end

mapAttributesLoader:register()
