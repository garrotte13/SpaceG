
data:extend({

  {
    type = "technology",
    name = "kr-sentinel",
    icon = "__SpaceG__/graphics/sentinel_tech.png",
    icon_size = 256,
    icon_mipmaps = 4,
    prerequisites = { "optics" },
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-sentinel",
      },
    },
    unit = {
      count = 100,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
      },
      time = 30,
    },
  },

  {
    type = "technology",
    name = "kr-sentinel2",
    icons =
    {
      {
        icon_size = 256, icon_mipmaps = 4,
        icon = "__SpaceG__/graphics/sentinel_tech.png",
      },
      { icon = "__TurretPod__/graphics/icons/tiers/2.png", icon_size = 64, scale = 2, shift = {62, -67} },
    },
    prerequisites = { "kr-sentinel", "chemical-science-pack" },
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-sentinel2",
      },
    },
    unit = {
      count = 200,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
      },
      time = 30,
    },
  },





  {
    type = "technology",
    name = "kr-quarry-minerals-extraction",
    icon = "__SpaceG__/graphics/quarry-drill_tech.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-quarry-drill",
      },
      {
        type = "unlock-recipe",
        recipe = "imersite-powder",
      },
      {
        type = "unlock-recipe",
        recipe = "imersite-crystal",
      },
    },
    prerequisites = { "utility-science-pack", "production-science-pack" },
    order = "g-e-d",
    unit = {
      count = 1000,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1}
      },
      time = 60,
    },
  },


  {
    type = "technology",
    name = "kr-imersium-processing",
    icon = "__SpaceG__/graphics/imersium-processing.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "imersium-plate",
      },

    },
    prerequisites = { "kr-quarry-minerals-extraction" },
    unit = {
      count = 1500,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1}
      },
      time = 60,
    },
  },


})