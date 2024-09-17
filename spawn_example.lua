
--[[ Spawn Template, defaults to values shown if line not provided

mobs:spawn({

	name = "",

		- Name of mob, must be provided e.g. "mymod:my_mob"

	nodes = {"group:soil, "group:stone"},

		- Nodes to spawn on top of.

	neighbors = {"air"},

		- Nodes to spawn beside.

	min_light = 0,

		- Minimum light level.

	max_light = 15,

		- Maximum light level, 15 is sunlight only.

	interval = 30,

		- Spawn interval in seconds.

	chance = 5000,

		- Spawn chance, 1 in every 5000 nodes.

	active_object_count = 1,

		- Active mobs of this type in area.

	min_height = -31000,

		- Minimum height level.

	max_height = 31000,

		- Maximum height level.

	day_toggle = nil,

		- Daytime toggle, true to spawn during day, false for night, nil for both

	on_spawn = nil,

		- On spawn function to run when mob spawns in world

	on_map_load = nil,

		- On map load, when true mob only spawns in newly generated map areas
})
]]--

local random = math.random

mobs:spawn({
	name = "marinaramobs:jellyfish",
	nodes = {"default:water_source"},
	neighbors = {"marinara:sand_with_kelp", "default:sand_with_kelp"},
	min_light = 0,
	interval = 60,
	chance = 2,
	min_height = -30,
	max_height = 0,
})

mobs:spawn({
	name = "marinaramobs:nautilus",
	nodes = {"default:water_source"}, {"default:river_water_source"},
	neighbors = {"marinara:sand_with_kelp"},
	min_light = 0,
	interval = 60,
	chance = 2, -- 15000
	active_object_count = 3,
	min_height = -30,
	max_height = 0,
	day_toggle = true,

	on_spawn = function(self, pos)

		local nods = minetest.find_nodes_in_area_under_air(
			{x = pos.x - 4, y = pos.y - 3, z = pos.z - 4},
			{x = pos.x + 4, y = pos.y + 3, z = pos.z + 4},
			{"default:water_source", "default:river_water_source"})

		if nods and #nods > 0 then

			local iter = math.min(#nods, 3)

			for n = 1, iter do

				local pos2 = nods[random(#nods)]
				local kid = random(4) == 1 and true or nil

				pos2.y = pos2.y + 2

				if minetest.get_node(pos2).name == "air" then

					mobs:add_mob(pos2, {
						name = "marinaramobs:nautilus", child = kid})
				end
			end
		end
	end
})

mobs:spawn({
	name = "marinaramobs:octopus",
	nodes = {"default:water_source"},
	neighbors = {"marinara:bountychest", "marinara:bountychest2", "marinara:bountychest3", "marinara:bountychest4", "marinara:bountychest5", "marinara:bountychest6", "marinara:bountychest7", "marinara:bountychest8", "marinara:bountychest9", "marinara:bountychest10", "marinara:bountychest11"},
	min_light = 0,
	interval = 60,
	chance = 2,
	min_height = -30,
	max_height = 0,
})

mobs:spawn({
	name = "marinaramobs:parrotfish",
	nodes = {"default:water_source"},
	neighbors = {"marinara:hardcoral", "marinara:hardcoral_green"},
	min_light = 0,
	interval = 60,
	chance = 2,
	active_object_count = 3,
	min_height = -30,
	max_height = 0,
	day_toggle = true,

	on_spawn = function(self, pos)

		local nods = minetest.find_nodes_in_area_under_air(
			{x = pos.x - 4, y = pos.y - 3, z = pos.z - 4},
			{x = pos.x + 4, y = pos.y + 3, z = pos.z + 4},
			{"default:water_source"})

		if nods and #nods > 0 then

			local iter = math.min(#nods, 3)

			for n = 1, iter do

				local pos2 = nods[random(#nods)]
				local kid = random(4) == 1 and true or nil

				pos2.y = pos2.y + 2

				if minetest.get_node(pos2).name == "air" then

					mobs:add_mob(pos2, {
						name = "marinaramobs:parrotfish", child = kid})
				end
			end
		end
	end
})

mobs:spawn({
	name = "marinaramobs:seamouse",
	nodes = {"default:water_source"},
	neighbors = {"marinara:coastrock"},
	min_light = 0,
	interval = 60,
	chance = 2,
	active_object_count = 2,
	min_height = -30,
	max_height = 0,
})

mobs:spawn({
	name = "marinaramobs:seaslug",
	nodes = {"default:water_source"},
	neighbors = {"marinara:hardcoral_yellow", "marinara:hardcoral_red"},
	min_light = 0,
	interval = 60,
	chance = 2,
	active_object_count = 2,
	min_height = -30,
	max_height = 0,
})

mobs:spawn({
	name = "marinaramobs:seaurchin",
	nodes = {"default:water_source"},
	neighbors = {"marinara:coastrock_alage"},
	min_light = 0,
	interval = 60,
	chance = 2,
	active_object_count = 2,
	min_height = -30,
	max_height = 0,
})

mobs:spawn({
	name = "marinaramobs:starfish",
	nodes = {"default:water_source"},
	neighbors = {"marinara:coastrock"},
	min_light = 0,
	interval = 60,
	chance = 2,
	active_object_count = 3,
	min_height = -30,
	max_height = 0,
})
