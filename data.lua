require("prototypes/sentinel")
require("prototypes/resources/resource-categories")
--require("prototypes/quarry-drill")
require("prototypes/quarry-drill")
require("prototypes/crusher")
require("prototypes/resources/resources_items")
require("prototypes/resources/imersite")
require("prototypes/resources/mineral-water")
require("prototypes/resources/rare-metals")
require("prototypes/technologies")
require("prototypes/firetorchparts")

data.raw["spider-vehicle"]["spidertron"].energy_source = {
    type = "burner",
    emissions_per_minute = 12,
    effectivity = 0.85,
    render_no_power_icon = true,
    render_no_network_icon = false,
    fuel_inventory_size = 2,
    burnt_inventory_size = 2,
    fuel_category = "nuclear",
  }
  data.raw["spider-vehicle"]["spidertron"].movement_energy_consumption = "7MW"
  data.raw["spider-vehicle"]["spidertron"].weight = 7000
  data.raw["spider-vehicle"]["spidertron"].braking_force = 0.05
  data.raw["spider-vehicle"]["spidertron"].friction_force = 0.05

  data.raw.capsule["raw-fish"].capsule_action.attack_parameters.cooldown = 90


  local fusion_fuel_category = {
    name = "fusion",
    type = "fuel-category"
  }
  
  local reactor = table.deepcopy(data.raw["generator-equipment"]["fusion-reactor-equipment"])
  reactor.burner = {
    type = "burner",
    fuel_inventory_size = 1,
    burnt_inventory_size = 1,
    fuel_category = "fusion",
    effectivity = 0.75
  }
  
  
  data:extend{fusion_fuel_category,reactor}

  --[[
data:extend({
{
  type = "simple-entity-with-owner",
  name = "testingobj",
  max_health = 5,
  picture = {
    filename = "__core__/graphics/empty.png",
    priority = "low",
    width = 1,
    height = 1,
    line_length = 1,
  },
  flags = {"hidden", "not-flammable", "not-in-kill-statistics", "not-selectable-in-game", "not-on-map"},
  collision_mask = {},

}

  })
  --]]