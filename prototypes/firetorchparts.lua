data:extend(
{

    {
		type = "item",
		name = "fire-torch-parts",
		icon_size = 600, icon =  "__SpaceG__/graphics/FireBlow_600.png",
--		group = "productivity",
		subgroup = "raw-material",
--		order = "c1",
		stack_size = 50,
	},

	{
		type = "recipe",
		name = "fire-torch-parts",
		enabled = false,
        category = "advanced-crafting",
		ingredients =
		{
			{"pipe", 5},
		},
		result = "fire-torch-parts"
	},

})