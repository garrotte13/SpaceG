local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds      = require("__base__/prototypes/entity/sounds")

data:extend(
{

---------------------------------------------------------------------------

	{
		type = "item",
		name = "kr-sentinel",
		icon = "__SpaceG__/graphics/sentinel_icon.png",
		icon_size = 64, icon_mipmaps = 4,
		subgroup = "defensive-structure",
		order = "k[turret]-z[sentinel]",
		place_result = "kr-sentinel",
		stack_size = 50
	},
	
	{
		type = "item",
		name = "kr-sentinel2",
		icons = {
			{ icon = "__SpaceG__/graphics/sentinel_icon.png", icon_size = 64, icon_mipmaps = 4},
			{ icon = "__TurretPod__/graphics/icons/tiers/2.png", icon_size = 64, scale = 0.5 },
		},
		icon_size = 64,
		subgroup = "defensive-structure",
		order = "k[turret]-z[sentinel]",
		place_result = "kr-sentinel2",
		stack_size = 50
	},
---------------------------------------------------------------------------

	{
		type = "radar",
		name = "kr-sentinel",
		icon = "__SpaceG__/graphics/sentinel_icon.png",
		icon_size = 64,
		flags = {"placeable-player", "player-creation"},
		minable = {mining_time = 0.5, result = "kr-sentinel"},
		damaged_trigger_effect = hit_effects.entity(),
		max_health = 75,
		corpse = "small-remnants",
		resistances =
		{
			{
				type = "fire",
				percent = 50
			},
			{
				type = "impact",
				percent = 20
			}
		},
		collision_box = {{-0.8, -0.8}, {0.8, 0.8}},
		selection_box = {{-1.0, -1.0}, {1.0, 1.0}},
		energy_per_sector = "1YJ",
		energy_per_nearby_scan = "220kJ",
		max_distance_of_sector_revealed = 0,
		max_distance_of_nearby_sector_revealed = 2,
		energy_source =
		{
			type = "electric",
			usage_priority = "secondary-input"
		},
		energy_usage = "110kW",
		pictures =
		{
			layers =
			{
				{
					filename = "__SpaceG__/graphics/sentinel.png",
					priority = "low",
					width = 64,
					height = 64,
					apply_projection = false,
					direction_count = 120,
					line_length = 12,
					shift = {0.41, -0.5},
					scale = 1.0,
					hr_version =
					{
						filename = "__SpaceG__/graphics/hr-sentinel.png",
						priority = "low",
						width = 128,
						height = 128,
						apply_projection = false,
						direction_count = 120,
						line_length = 12,
						-- shift = {0.21, -0.2},
						shift = {0.41, -0.5},
						scale = 0.7
					}
				}
			}
		},
		vehicle_impact_sound = sounds.generic_impact,
		working_sound =
		{
			sound = { filename = "__SpaceG__/sounds/sentinel.ogg" },
			apparent_volume = 1
		},
		radius_minimap_visualisation_color = { r = 0.059, g = 0.092, b = 0.235, a = 0.275 },
		rotation_speed = 0.0015
	},
	
	
	{
		type = "radar",
		name = "kr-sentinel2",
		icon = "__SpaceG__/graphics/sentinel_icon.png",
		icon_size = 64,
		flags = {"placeable-player", "player-creation"},
		minable = {mining_time = 0.5, result = "kr-sentinel2"},
		damaged_trigger_effect = hit_effects.entity(),
		max_health = 200,
		corpse = "medium-remnants",
		resistances =
		{
			{
				type = "fire",
				percent = 70
			},
			{
				type = "impact",
				percent = 40
			}
		},
		collision_box = {{-1.3, -1.3}, {1.3, 1.3}},
		selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
		energy_per_sector = "1YJ",
		energy_per_nearby_scan = "280kJ",
		max_distance_of_sector_revealed = 0,
		max_distance_of_nearby_sector_revealed = 3,
		energy_source =
		{
			type = "electric",
			usage_priority = "secondary-input"
		},
		energy_usage = "140kW",
		pictures =
		{
			layers =
			{
				{
					filename = "__SpaceG__/graphics/sentinel.png",
					priority = "low",
					width = 64,
					height = 64,
					apply_projection = false,
					direction_count = 120,
					line_length = 12,
					shift = {0.41, -0.5},
					scale = 1.5,
					hr_version =
					{
						filename = "__SpaceG__/graphics/hr-sentinel.png",
						priority = "low",
						width = 128,
						height = 128,
						apply_projection = false,
						direction_count = 120,
						line_length = 12,
						-- shift = {0.21, -0.2},
						shift = {0.41, -0.5},
						scale = 1.0
					}
				}
			}
		},
		vehicle_impact_sound = sounds.generic_impact,
		working_sound =
		{
			sound = { filename = "__SpaceG__/sounds/sentinel.ogg" },
			apparent_volume = 1
		},
		radius_minimap_visualisation_color = { r = 0.059, g = 0.092, b = 0.235, a = 0.275 },
		rotation_speed = 0.0012
	},
---------------------------------------------------------------------------
	
	{
		type = "recipe",
		name = "kr-sentinel",
		enabled = false,
		ingredients =
		{
			{"iron-gear-wheel", 2},
			{"electronic-circuit", 2},
			{"iron-plate", 6}
		},
		result = "kr-sentinel"
	},
	{
		type = "recipe",
		name = "kr-sentinel2",
		enabled = false,
		ingredients =
		{
			(mods["SpaceG"] and settings.startup["bzsilicon-more-intermediates"].value == "more" ) and {"gyro", 2} or {"tungsten-plate", 2},
			{"kr-sentinel", 2},
			{"advanced-circuit", 5},
			{"zirconium-plate", 5}
		},
		result = "kr-sentinel2"
	},
---------------------------------------------------------------------------
	
})