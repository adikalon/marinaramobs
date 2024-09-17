--This creates the marinaramobs object.
marinaramobs = {}

--This creates the marinaramobs.settings object, and fills it with either the menu selected choices as defined in settingtypes.txt, or default values, (In this case, false).
marinaramobs.settings = {
	clear_biomes			= minetest.settings:get_bool("marinaramobs.clear_biomes") or false,
	clear_decos			= minetest.settings:get_bool("marinaramobs.clear_decos") or false,
	clear_ores			= minetest.settings:get_bool("marinaramobs.clear_ores") or false,
}

if marinaramobs.settings.clear_biomes then
	minetest.clear_registered_biomes()
end
if marinaramobs.settings.clear_decos then
	minetest.clear_registered_decorations()
end
if marinaramobs.settings.clear_ores then
	minetest.clear_registered_ores()
end

-- Load support for intllib.
local path = minetest.get_modpath(minetest.get_current_modname()) .. "/"

marinaramobs.custom_spawn = false
local input = io.open(path .. "spawn.lua", "r")

if input then
	marinaramobs.custom_spawn = true
	input:close()
	input = nil
end

local S = minetest.get_translator and minetest.get_translator(minetest.get_current_modname()) or
		dofile(path .. "intllib.lua")

marinaramobs.S = S

-- plants
dofile(path .. "parrotfish.lua") --
dofile(path .. "jellyfish.lua") --
dofile(path .. "nautilus.lua") --
dofile(path .. "octopus.lua") --
dofile(path .. "seamouse.lua") --
dofile(path .. "seaslug.lua") --
dofile(path .. "seaurchin.lua") --
dofile(path .. "starfish.lua") --
dofile(path .. "hunger.lua") --

if marinaramobs.custom_spawn then
	dofile(path .. "spawn.lua")
end

print (S("[MOD] Caves loaded"))
