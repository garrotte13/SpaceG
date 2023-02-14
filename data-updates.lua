
local water_barrel = data.raw.item["mineral-water-barrel"]
water_barrel.burnt_result = "empty-barrel"
water_barrel.fuel_value = "0.9GJ"
water_barrel.fuel_category = "fusion"

if mods["bzzirconium"] then
    for _, e in pairs(data.raw["simple-entity"]) do
        if (e.subgroup == "grass" or e.subgroup == "wrecks") and e.name:match("rock%-") then
            local adjusted_max = e.name:match("huge") and 6 or 3
            local adjusted_min = e.name:match("huge") and 2 or 1
            if data.raw["simple-entity"] and data.raw["simple-entity"][e.name] and data.raw["simple-entity"][e.name].minable then
                if data.raw["simple-entity"][e.name].minable.results then
                    for i, component in pairs(data.raw["simple-entity"][e.name].minable.results) do
                        for _, value in pairs(component) do
                         if value == "zircon" then
                            data.raw["simple-entity"][e.name].minable.results[i] = {name="zircon", amount_min=adjusted_min, amount_max=adjusted_max}
                            break
                         end
                        end
                    end
                end
            end
        end
    end

end

--[[
if mods["SchallSuit"] then

    table.insert( dataextendlist, SUpt.SU_item(spec) )
    table.insert( dataextendlist, SUpt.SU_grid(spec) )
    table.insert( dataextendlist, SUpt.SU_recipe(spec) )
    if spec.tech then table.insert( dataextendlist, SUpt.SU_tech(spec) ) end
    SUpt.SU_character_adjust(spec)

    

    function SUpt.SU_grid(spec)
        local gridname = "Schall-engineering-mk3-equipment-grid"
        local setgrid = {}
        if spec.grid.base and dr["equipment-grid"][spec.grid.base] then
          local basegrid = dr["equipment-grid"][spec.grid.base]
          setgrid.width = basegrid.width + spec.grid.width_add
          setgrid.height = basegrid.height + spec.grid.height_add
        end
        return
        {
          type = "equipment-grid",
          name = gridname,
          width = setgrid.width or spec.grid.width,
          height = setgrid.height or spec.grid.height,
          equipment_categories = spec.grid.equipment_categories
        }
      end
      
      function SUpt.SU_recipe(spec)
        local rcp = table.deepcopy(spec.recipe)
        local itemname = SUpt.SU_item_name(spec)
        rcp.type = "recipe"
        rcp.name = itemname
        if rcp.normal then
          rcp.normal.enabled = rcp.normal.enabled or false
          rcp.normal.result = itemname
          rcp.expensive.enabled = rcp.expensive.enabled or false
          rcp.expensive.result = itemname
        else
          rcp.enabled = rcp.enabled or false
          rcp.result = itemname
        end
        return rcp
      end
      
      function SUpt.SU_tech(spec)
        local tech = table.deepcopy(spec.tech)
        local techname = "Schall-engineering-suit-3"
        local itemname = SUpt.SU_item_name(spec)
        tech.type = "technology"
        tech.name = techname
        tech.icon_size = 256
        tech.icon_mipmaps = 4
        tech.icon = "__SchallSuit__/graphics/technology/engineering-suit.png"
        tech.effects = { {type = "unlock-recipe", recipe = itemname} }
        tech.upgrade = true
        tech.order = "g-s"
        for k, v in pairs(tech.prerequisites) do
            if v:match("^__SU__") then
              local tier = tonumber(v:match("^__SU__(%d+)__"))
              tech.prerequisites[k] = SUpt.SU_tech_name(tier)
            end
          end
        return tech
      end
      
      function SUpt.SU_character_adjust(spec)
        local itemname = SUpt.SU_item_name(spec)
        data.raw["character-corpse"]["character-corpse"].armor_picture_mapping[itemname] = spec.armor_picture_mapping
        for _, animation in pairs(data.raw.character.character.animations) do
          if animation.armors then
            for _, armor in pairs(animation.armors) do
              if armor == spec.character_armor_group then
                table.insert(animation.armors, itemname)
                break
              end
            end
          end
        end
      end

    data:extend(
        {
            type = "armor",
            name = itemname,
            icons =
            {icon = "__SchallSuit__/graphics/icons/engineering-suit.png", icon_size = 64},
            {icon = "__SchallSuit__/graphics/icons/engineering-suit-to-tint.png", icon_size = 64, tint = {r=0.75, g=0, b=0.75, a=1}},
            resistances =
            {
              { type = "physical",  decrease =  0,  percent = 10 },
              { type = "fire",      decrease =  0,  percent = 10 },
              { type = "electric",  decrease =  0,  percent = 80 }
            },
            subgroup = "armor",
            order = "s[engineering-suit]-mk3",
            stack_size = 1,
            infinite = true,
            equipment_grid = gridname,
            inventory_size_bonus = spec.item.inventory_size_bonus
          },
          
    )

tier_suffix = "-mk3",
tint = {r=0.75, g=0, b=0.75, a=1},
subcat = "b[grid]-3",
armor_picture_mapping = 3,
character_armor_group = "modular-armor",
item = {
  inventory_size_bonus = 150,
},
grid = {
  base = "armor-mk3-equipment-grid",
  width_add = 6,
  height_add = 4,
  width = 18,
  height = 18,
  equipment_categories = {cfg1.category_suit}
},
recipe = {
  energy_required = 20, --30,
  ingredients =
  {
    {"Schall-engineering-suit-mk2", 1}, -- 1
    {"alien-artifact", 500},        -- 500
    {"low-density-structure", 25},  -- 50
    {"space-science-pack", 50}      -- 50
  },
},
tech = {
  prerequisites = {"__SU__2__", "alien-technology", "rocket-silo"},
  unit =
  {
    count = 200, --800,
    ingredients =
    {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"chemical-science-pack", 1},
      {"utility-science-pack", 1},
      {"space-science-pack", 1},
      {"alien-science-pack", 1}
    },
    time = 30
  },
}
end

]]