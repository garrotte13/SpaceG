local event = require("__flib__.event")

local test = require("test")

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