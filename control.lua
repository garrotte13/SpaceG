--local event = require("__flib__.event")
--local test = require("test")
local depollution = require("depollution")

script.on_init(function()
    depollution.init()
end)

script.on_configuration_changed(function(ChangedModData)
    depollution.migrate(ChangedModData)
end)

script.on_load(function()
    depollution.onload()
end)


script.on_event(defines.events.on_tick, function()
    if global.subchunks.counter > 0 then depollution.process() else depollution.populate_chunks() end
end)

--[[
event.on_init(function()
    test.init()
end)

script.on_event(defines.events.on_built_entity, function(e)
    if e.created_entity.valid and (e.created_entity.name == "gun-turret") then
      test.add (e.created_entity)
    end
end)
--medic-item-rampant-arsenal
script.on_event(defines.events.on_entity_damaged, function(e)
    if e.entity.valid and e.entity.force.name == "player" then
        test.repair (e.entity)
    end
end)
--]]