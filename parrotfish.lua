mobs:register_mob("marinaramobs:parrotfish", {
stepheight = 0.0,
	type = "animal",
	passive = true,
        attack_type = "dogfight",
	attack_animals = false,
	reach = 1,
        damage = 1,
	hp_min = 25,
	hp_max = 45,
	armor = 100,
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 0.5, 0.4},
	visual = "mesh",
	mesh = "Parrotfish.b3d",
	visual_size = {x = 1.0, y = 1.0},
	textures = {
		{"textureparrotfish.png"},
	},
	sounds = {},
	makes_footstep_sound = false,
	walk_velocity = 0.5,
	run_velocity = 1,
	fly = true,
	fly_in = "default:water_source", "default:river_water_source", "default:water_flowing", "default:river_water_flowing",
	fall_speed = 0,
	runaway = true,
        runaway_from = {"animalworld:bear", "animalworld:crocodile", "animalworld:tiger", "animalworld:spider", "animalworld:spidermale", "animalworld:shark", "animalworld:hyena", "animalworld:kobra", "animalworld:monitor", "animalworld:snowleopard", "animalworld:volverine", "livingfloatlands:deinotherium", "livingfloatlands:carnotaurus", "livingfloatlands:lycaenops", "livingfloatlands:smilodon", "livingfloatlands:tyrannosaurus", "livingfloatlands:velociraptor", "animalworld:divingbeetle", "animalworld:divingbeetle", "animalworld:scorpion", "animalworld:polarbear", "animalworld:leopardseal", "animalworld:stellerseagle", "player", "animalworld:wolf", "animalworld:panda", "animalworld:stingray", "marinaramobs:jellyfish", "marinaramobs:octopus", "livingcavesmobs:biter", "livingcavesmobs:flesheatingbacteria"},
	jump = false,
	stepheight = 0.0,
	drops = {
		{name = "marinaramobs:rawfish", chance = 1, min = 1, max = 1},
	},
	water_damage = 0,
        air_damage = 1,
	lava_damage = 4,
	light_damage = 0,
	animation = {
		speed_normal = 100,
		stand_speed = 50,
		stand_start = 0,
		stand_end = 100,
		stand2_speed = 50,
		stand2_start = 100,
		stand2_end = 200,
		fly_start = 200, 
		fly_end = 300,
	},
	fly_in = {"default:water_source", "default:river_water_source", "default:water_flowing", "default:river_water_flowing"},
	floats = 0,
	follow = {
		"marinara:seagrass", "marinara:seagrass2", "marinara:sand_with_seagrass",
		"marinara:sand_with_seagrass2", "marinara:alage", "marinara:sand_with_alage", "default:kelp", "default:sand_with_kelp"
	},
	view_range = 5,

	on_rightclick = function(self, clicker)

		-- feed or tame
		if mobs:feed_tame(self, clicker, 4, false, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 5, 50, 80, false, nil) then return end
	end,
})

if not mobs.custom_spawn_marinaramobs then
mobs:spawn({
	name = "marinaramobs:parrotfish",
	nodes = {"default:water_source"},
	neighbors = {"marinara:hardcoral", "marinara:hardcoral_green"},
	min_light = 0,
	interval = 60,
	chance = 2, -- 15000
	active_object_count = 3,
	min_height = -30,
	max_height = 0,
	day_toggle = true,
})


mobs:register_egg("marinaramobs:parrotfish", ("Parrotfish"), "aparrotfish.png")

-- raw fish
minetest.register_craftitem(":marinaramobs:raw_exotic_fish", {
	description = ("Raw Exotic Fish"),
	inventory_image = "marinaramobs_exotic_fish_raw.png",
	on_use = minetest.item_eat(3),
	groups = {food_meat_raw = 1, flammable = 2},
})

-- cooked fish
minetest.register_craftitem(":marinaramobs:cooked_exotic_fish", {
	description = ("Cooked Exotic Fish"),
	inventory_image = "marinaramobs_exotic_fish_cooked.png",
	on_use = minetest.item_eat(5),
	groups = {food_meat = 1, flammable = 2},
})

minetest.register_craft({
	type = "cooking",
	output = "marinaramobs:cooked_exotic_fish",
	recipe = "marinaramobs:raw_exotic_fish",
	cooktime = 5,
})
end
