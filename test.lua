local test = {}

function test.init()
    global.r_turrets = {}
    global.turret_id_counter = 0
    global.last_turret_id_counter = 0

end



function test.add(medic_turret)
    global.last_turret_id_counter = global.last_turret_id_counter + 1
    local id = global.last_turret_id_counter
    global.r_turrets[id] = {
        x = medic_turret.position.x,
        y = medic_turret.position.y,
        entity = medic_turret
    }
    global.turret_id_counter = global.turret_id_counter + 1
    game.print("Medic turret was added to array!")
end

function test.repair(entity)
if global.turret_id_counter == 0 then return end
    for i=1, global.last_turret_id_counter do
        if global.r_turrets[i] and global.r_turrets[i].x and global.r_turrets[i].entity.valid then
            if ((global.r_turrets[i].x - entity.position.x)^2 + (global.r_turrets[i].y - entity.position.y)^2) <= 100 then
                game.print("Do we start healing now?")
--                global.r_turrets[i].entity.shooting_target = entity
                --[[global.r_turrets[i].entity.shooting_state = {
                    state = defines.shooting.shooting_selected,
                    position = {x=entity.position.x, y=entity.position.y}
                } --]]
                local lurktest = entity.surface.create_entity{
                    name = "testingobj",
                    force = game.forces.enemy,
                    position = {x=entity.position.x, y=entity.position.y},

                }
                if lurktest then
                    global.r_turrets[i].entity.shooting_target = lurktest
                    --lurktest.destroy()
                    game.print("Test obj created and destroyed!")
                end
                
            end
        end
    end
end

return test