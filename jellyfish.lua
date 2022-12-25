mobs:register_mob("marinaramobs:jellyfish", {
stepheight = 0.0,
	type = "monster",
	passive = false,
        attack_type = "dogfight",
	attack_animals = true,
	reach = 2,
        damage = 4,
	hp_min = 30,
	hp_max = 95,
	armor = 100,
	collisionbox = {-0.3, -0.01, -0.3, 0.3, 0.95, 0.3},
	visual = "mesh",
	mesh = "Jellyfish.b3d",
	visual_size = {x = 4.0, y = 4.0},
	textures = {
		{"texturejellyfish.png"},
	},
	sounds = {},
	makes_footstep_sound = false,
	sounds = {
	},
	walk_velocity = 0.5,
	run_velocity = 0.8,
        fly = true,
	fly_in = "default:water_source", "default:river_water_source", "default:water_flowing", "default:river_water_flowing",
	fall_speed = 0,
	runaway = false,
	jump = false,
	stepheight = 0.0,
	drops = {
	},
	water_damage = 0,
        air_damage = 1,
	lava_damage = 4,
	light_damage = 0,
	animation = {
		speed_normal = 25,
		stand_start = 0,
		stand_end = 100,
		fly_start = 100, 
		fly_end = 200,
		punch_start = 0,
		punch_end = 100,
		
	},
	fly_in = {"default:water_source", "default:river_water_source", "default:water_flowing"},
	floats = 0,
	follow = {
		"mobs:meat_raw", "xocean:fish_edible", "ethereal:fish_raw", "mobs:clownfish_raw", "mobs:bluefish_raw", "fishing:bait_worm", "fishing:clownfish_raw", "fishing:bluewhite_raw", "fishing:exoticfish_raw", "fishing:fish_raw", "fishing:carp_raw", "fishing:perch_raw", "water_life:meat_raw", "fishing:jellyfish_raw", "fishing:pike_raw", "marinaramobs:octopus_raw", "marinaramobs:raw_exotic_fish"
	},
	view_range = 1,

	on_rightclick = function(self, clicker)

		-- feed or tame
		if mobs:feed_tame(self, clicker, 4, false, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 5, 50, 80, false, nil) then return end
	end,
})

if not mobs.custom_spawn_marinaramobs then
mobs:spawn({
	name = "marinaramobs:jellyfish",
	nodes = {"default:water_source"},
	neighbors = {"marinara:sand_with_kelp", "default:sand_with_kelp"},
	min_light = 0,
	interval = 60,
	chance = 2, -- 15000
	min_height = -30,
	max_height = 0,
})
end

mobs:register_egg("marinaramobs:jellyfish", ("Jellyfish"), "ajellyfish.png")
