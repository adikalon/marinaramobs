mobs:register_mob("marinaramobs:nautilus", {
stepheight = 0.0,
	type = "animal",
	passive = true,
        attack_type = "dogfight",
	attack_animals = false,
	reach = 1,
        damage = 1,
	hp_min = 5,
	hp_max = 25,
	armor = 100,
	collisionbox = {-0.2, -0.01, -0.2, 0.2, 0.5, 0.2},
	visual = "mesh",
	visual_size = {x = 2.0, y = 2.0},
	mesh = "Nautilus.b3d",
	textures = {
		{"texturenautilus.png"},
	},
	sounds = {},
	makes_footstep_sound = false,
	walk_velocity = 1,
	run_velocity = 1,
	fly = true,
	fly_in = "default:water_source", "default:river_water_source", "default:water_flowing", "default:river_water_flowing",
	fall_speed = 0,
	runaway = true,
        runaway_from = {"animalworld:bear", "animalworld:crocodile", "animalworld:tiger", "animalworld:spider", "animalworld:spidermale", "animalworld:shark", "animalworld:hyena", "animalworld:kobra", "animalworld:monitor", "animalworld:snowleopard", "animalworld:volverine", "livingfloatlands:deinotherium", "livingfloatlands:carnotaurus", "livingfloatlands:lycaenops", "livingfloatlands:smilodon", "livingfloatlands:tyrannosaurus", "livingfloatlands:velociraptor", "animalworld:divingbeetle", "animalworld:divingbeetle", "animalworld:scorpion", "animalworld:polarbear", "animalworld:leopardseal", "animalworld:stellerseagle", "player", "animalworld:wolf", "animalworld:panda", "animalworld:stingray", "marinaramobs:jellyfish", "marinaramobs:octopus", "livingcavesmobs:biter", "livingcavesmobs:flesheatingbacteria"},
	jump = false,
	stepheight = 0.0,
	drops = {
		{name = "marinaramobs:nautilushell", chance = 1, min = 0, max = 1},
	},
	water_damage = 0,
        air_damage = 1,
	lava_damage = 4,
	light_damage = 0,
	animation = {
		speed_normal = 50,
		stand_start = 0,
		stand_end = 100,
		fly_start = 100, -- swim animation
		fly_end = 200,
		-- 50-70 is slide/water idle
	},
	fly_in = {"default:water_source", "default:river_water_source", "default:water_flowing", "default:river_water_flowing"},
	floats = 0,
	follow = {
		"fishing:bait_worm",
		"animalworld:raw_athropod", "animalworld:rawfish", "ethereal:fish_raw", "animalworld:fishfood", "mobs_fish:tropical", "water_life:meat_raw", "marinaramobs:octopus_raw", "marinaramobs:raw_exotic_fish"
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
})
end

mobs:register_egg("marinaramobs:nautilus", ("Nautilus"), "anautilus.png")

minetest.register_node("marinaramobs:nautilushell", {
    description = "Nautilusshell",
    visual_scale = 0.6,
    mesh = "Nautilusshell.b3d",
    tiles = {"marinaramobs_nautilusshell.png"},
    inventory_image = "marinaramobs_nautilusshellinv.png",
    paramtype = "light",
    paramtype2 = "facedir",
    groups = {choppy = 3},
    drawtype = "mesh",
    collision_box = {
        type = "fixed",
        fixed = {
            {-0.4, -0.45, -0.4, 0.4, 0.15, 0.4},
            --[[{-0.4, -0.45, -0.4, 0.4, 0.15, 0.4},
            {-0.4, -0.45, -0.4, 0.4, 0.15, 0.4}]]
        }
    },
    selection_box = {
        type = "fixed",
        fixed = {
            {-0.4, -0.45, -0.4, 0.4, 0.15, 0.4}
        }
    },
    sounds = default.node_sound_wood_defaults()
})
