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
if mods["bztungsten"] then require("prototypes/firetorchparts") end

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