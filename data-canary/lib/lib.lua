-- Core API functions implemented in Lua
dofile(DATA_DIRECTORY .. "/lib/core/load.lua")

dofile(DATA_DIRECTORY .. "/lib/quests/quest.lua")

dofile(DATA_DIRECTORY .. '/lib/events/castle_war.lua')

-- Task Custom
dofile(DATA_DIRECTORY .. '/scripts/custom/task_system/load.lua')
dofile(DATA_DIRECTORY .. '/scripts/magic_roulette/roulette.lua')
