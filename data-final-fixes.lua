local repair_c_recipe
local resource_autoplace = require('resource-autoplace');

if mods["bztungsten"] then
  repair_c_recipe = data.raw.recipe["laser-turret"]
  for i, component in pairs(repair_c_recipe.ingredients) do
   for _, value in pairs(component) do
    if value == "steel-plate" then
     repair_c_recipe.ingredients[i] = {type="item", name="steel-plate", amount=15}
     break
    end
   end
  end
  table.insert(repair_c_recipe.ingredients, {type="item", name="tungsten-carbide", amount=2})

  repair_c_recipe = data.raw.recipe["electric-furnace"]
  for i, component in pairs(repair_c_recipe.ingredients) do
    for _, value in pairs(component) do
     if value == "tungsten-carbide" then
      repair_c_recipe.ingredients[i] = {type="item", name="tungsten-carbide", amount=3}
      break
     end
    end
   end
   for i, component in pairs(repair_c_recipe.ingredients) do
    for _, value in pairs(component) do
     if value == "tungsten-plate" then
      table.remove(repair_c_recipe.ingredients, i)
      break
     end
    end
   end

   repair_c_recipe = data.raw.recipe["chemical-plant"]
   for i, component in pairs(repair_c_recipe.ingredients) do
     for _, value in pairs(component) do
      if value == "tungsten-plate" then
       repair_c_recipe.ingredients[i] = {type="item", name="tungsten-plate", amount=6}
       break
      end
     end
    end
    for i, component in pairs(repair_c_recipe.ingredients) do
     for _, value in pairs(component) do
      if value == "tungsten-carbide" then
       table.remove(repair_c_recipe.ingredients, i)
       break
      end
     end
    end

end

if mods["bzzirconium"] then

  table.insert(data.raw.recipe["substation"].ingredients, {type="item", name="cermet", amount=5})

  
  data.raw.resource["zircon"].autoplace = resource_autoplace.resource_autoplace_settings{
    name = "zircon",
    order = "b-z",
    base_density = 4,
    has_starting_area_placement = false,
    regular_rq_factor_multiplier = 1.1,
    starting_rq_factor_multiplier = 1.2,
  }

  
  --data.raw.recipe["sort-stone-zircon"].enabled = "false"
  --data.raw.recipe["sort-zircon-stone"].enabled = "false"


--  table.insert(data.raw.recipe["rocket"].ingredients, {type="item", name="zirconium-plate", amount=1})
--  table.insert(data.raw.recipe["land-mine"].ingredients, {type="item", name="zirconium-plate", amount=2})
--  table.insert(data.raw.recipe["explosive-rocket"].ingredients, {type="item", name="zirconium-plate", amount=1})
--  table.insert(data.raw.recipe["cannon-shell"].normal.ingredients, {type="item", name="zirconium-plate", amount=1})
--  table.insert(data.raw.recipe["explosive-cannon-shell"].normal.ingredients, {type="item", name="zirconium-plate", amount=2})

--  table.insert(data.raw.recipe["creep-miner1-radar"].ingredients, {type="item", name="cermet", amount=2})

  repair_c_recipe = data.raw.recipe["repair-capsule-rampant-arsenal"]
  for i, component in pairs(repair_c_recipe.normal.ingredients) do
   for _, value in pairs(component) do
    if value == "steel-plate" then
     repair_c_recipe.normal.ingredients[i] = {type="item", name="zirconia", amount=6}
     break
    end
   end
  end
  repair_c_recipe = data.raw.recipe["gun-item-rampant-arsenal"]
  for i, component in pairs(repair_c_recipe.normal.ingredients) do
   for _, value in pairs(component) do
    if value == "steel-plate" then
     repair_c_recipe.normal.ingredients[i] = {type="item", name="steel-plate", amount=12}
     break
    end
   end
  end
  table.insert(repair_c_recipe.normal.ingredients, {type="item", name="zirconium-plate", amount=10})

  repair_c_recipe = data.raw.recipe["advanced-beam-item-rampant-arsenal"]
  for i, component in pairs(repair_c_recipe.normal.ingredients) do
    for _, value in pairs(component) do
     if value == "steel-plate" then
      repair_c_recipe.normal.ingredients[i] = {type="item", name="titanium-plate", amount=10}
      break
     end
    end
  end
  table.insert(repair_c_recipe.normal.ingredients, {type="item", name="zirconium-plate", amount=10})

  

  repair_c_recipe = data.raw.recipe["flamethrower-turret"]
  for i, component in pairs(repair_c_recipe.ingredients) do
    for _, value in pairs(component) do
     if value == "steel-plate" then
      repair_c_recipe.ingredients[i] = {type="item", name="steel-plate", amount=25}
      break
     end
    end
  end
  table.insert(repair_c_recipe.ingredients, {type="item", name="zirconia", amount=40})

  --[[
  if mods["bztitanium"] then
   local low_density_s_recipe = data.raw.recipe["low-density-structure"]
   for i, component in pairs(low_density_s_recipe.normal.ingredients) do
    for _, value in pairs(component) do
      if value == "titanium-plate" then
        low_density_s_recipe.normal.ingredients[i] = {type="item", name="titanium-plate", amount=1}
        break
      end
    end
   end
  end
  --]]

  if mods["bzsilicon"] then
    local sil = data.raw.recipe["silica"]
    sil.category = "crushing"
    sil.normal.ingredients[1] = {type="item", name="stone", amount=2}
    sil.normal.result_count = nil
    sil.normal.result = nil
    sil.normal.results = {
      { type = "item", name = "silica", amount_min = 4, amount_max = 6 },
    }
    data.raw.recipe["stone-brick"].ingredients = {{type="item", name="silica", amount=5}}
    table.insert(data.raw.recipe["red-wire"].ingredients, {type="item", name="electronic-circuit", amount=1})
    table.insert(data.raw.recipe["green-wire"].ingredients, {type="item", name="electronic-circuit", amount=1})
    --data.raw.technology["silica-processing"].prerequisites = {"crusher"}
  end

end

