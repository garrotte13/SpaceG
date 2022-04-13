data:extend({

	{
		type = "recipe",
		name = "y_crusher",
		icon_size = 128, icon =  "__SpaceG__/graphics/apm_crusher_machine_2.png",
		enabled = "false",
		ingredients = {
      {"steel-plate", 2},
      {"iron-gear-wheel", 5},
      {"electronic-circuit", 4},
      {"stone-brick", 3},
    },
		results=
		{
			{type="item", name="y_crusher", amount=1, }
		},
		-- subgroup = "y_line1",
	},

	{
		type = "item",
		name = "y_crusher",
		icon_size = 128, icon =  "__SpaceG__/graphics/apm_crusher_machine_2.png",
--		group = "productivity",
		subgroup = "production-machine",
		order = "c1",
		place_result = "y_crusher",
		stack_size = 50,
	},

--[[
	{
		type = "assembling-machine",
		name = "y_crusher",
		icon_size = 32, icon =  "__SpaceG__/graphics/crusher33_icon.png",
		flags = {"placeable-neutral","player-creation"},
		minable = {hardness = 0.5, mining_time = 1, result = "y_crusher"},
		max_health = 200,
		resistances = {{type = "physical",percent = 50}},
		collision_box = {{-1.2,-1.2},{1.2,1.2}},
		selection_box = {{-1.5,-1.5},{1.5,1.5}},
		animation = {
			filename = "__SpaceG__/graphics/crusher33_sheet.png",
			priority = "medium", width = 128, height = 128, frame_count = 12, shift = {0.5, 0}, animation_speed=0.5,
		},
        working_sound = {
            sound = {
                filename = "__SpaceG__/sounds/crusher.ogg",
                volume = 0.8,
            },
            idle_sound = { filename = "__base__/sound/idle1.ogg" },
            max_sounds_per_type = 2,
        },

		crafting_categories = {"crushing"},
		crafting_speed = 1.5,
		energy_source = {type = "electric", input_priority = "secondary", usage_priority = "secondary-input", emissions_per_minute = 3.0, },
		energy_usage = "250kW",
		ingredient_count = 1,
		module_specification =
		{
			module_slots = 2
		},
		allowed_effects = {"consumption", "speed", "productivity", "pollution"},
	},
--]]

	{
		type = "assembling-machine",
		name = "y_crusher",
		icon_size = 128, icon =  "__SpaceG__/graphics/apm_crusher_machine_2.png",
		flags = {"placeable-neutral","player-creation"},
		minable = {hardness = 0.5, mining_time = 0.5, result = "y_crusher"},
		max_health = 300,
        light = nil,
        collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
        selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
        entity_info_icon_shift = {0, 0.4},
        working_sound = {
            sound = {
            filename = "__SpaceG__/sounds/crusher.ogg",
            volume = 0.8,
        },
        idle_sound = { filename = "__base__/sound/idle1.ogg" },
        max_sounds_per_type = 2,
        },
    crafting_categories = {"crushing"},
    crafting_speed = 2,
    energy_source = {type = "electric", input_priority = "secondary", usage_priority = "secondary-input", emissions_per_minute = 3.0, },
    energy_usage = "250kW",
    ingredient_count = 1,
    module_specification =
    {
        module_slots = 2
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    animation =
    {
        layers =
        {
          {
            filename = "__SpaceG__/graphics/crusher_apm/crusher_2.png",
            priority = "high",
            width = 160,
            height = 128,
            frame_count = 32,
            line_length = 8,
            shift = {0.4375, -0.28125},
            animation_speed = 1.0666667,
            hr_version =
            {
              filename = "__SpaceG__/graphics/crusher_apm/hr_crusher_2.png",
              priority = "high",
              width = 320,
              height = 256,
              frame_count = 32,
              line_length = 8,
              shift = {0.4375, -0.28125},
              animation_speed = 1.0666667,
              scale = 0.5
            }
          },
        },
        {
            {
              filename = "__SpaceG__/graphics/crusher_apm/crusher_shadow_electric.png",
              priority = "high",
              draw_as_shadow = true,
              width = 160,
              height = 128,
              frame_count = 32,
              line_length = 8,
              shift = {0.4375, -0.28125},
              animation_speed = 1.0666667,
              hr_version =
              {
                filename = "__SpaceG__/graphics/crusher_apm/hr_crusher_shadow_electric.png",
                priority = "high",
                draw_as_shadow = true,
                width = 320,
                height = 256,
                frame_count = 32,
                line_length = 8,
                shift = {0.4375, -0.28125},
                animation_speed = 1.0666667,
                scale = 0.5
              }
            },
          },
      },


    },

})