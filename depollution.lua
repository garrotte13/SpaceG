local depollution = {}

function depollution.populate_chunks()
    game.print ("Populating chunks queue. Please wait...")
    local surface = global.subsurf
    local r = 1
    for chunk in surface.get_chunks() do
        if surface.is_chunk_generated(chunk) then
            global.subchunks.queue[r] = {
                x = chunk.x*32,
                y = chunk.y*32,
                clean_tick = 0
            }
            r = r + 1
        end
    end
    global.subchunks.last_id = r
    global.subchunks.counter = r - 1
    game.print ("Done! Chunks quantity: " .. r-1)
end

function depollution.init()
    global.subchunks = {
        counter = 0,
        last_id = 1,
        id = 1,
        queue = {},
    }

    global.subsurf = game.get_surface("nauvis")
    --local subsurface = global.subsurf
    --populate_chunks()
end

function depollution.onload()
    --local subsurface = global.subsurf
end

function depollution.migrate(ChangedModData)
    if ChangedModData.mod_changes["SpaceG"] and ChangedModData.mod_changes["SpaceG"].old_version:match("0%.3%.%d") then
        depollution.init()
        --global.subsurf = game.get_surface("nauvis")
        --local subsurface = global.subsurf
        --populate_chunks()
    end
end

function depollution.process()
    local found_chunk = false
    local r = global.subchunks.id
    for ids_num = 1, global.subchunks.last_id do
        if global.subchunks.queue[r] then
            found_chunk = true
            break
        end
        if r < global.subchunks.last_id then r = r + 1 else r = 1 end
    end
    if not found_chunk then return end
    if r < global.subchunks.last_id then global.subchunks.id = r + 1 else global.subchunks.id = 1 end
    local surface = global.subsurf
    local chunk = global.subchunks.queue[r]
    local chunk_pollution = surface.get_pollution({x = chunk.x, y = chunk.y})
    if chunk_pollution > 25 and (game.ticks_played - chunk.clean_tick) > 300 then
        surface.pollute({x = chunk.x, y = chunk.y}, -20)
        global.subchunks.queue[r].clean_tick = game.ticks_played
        game.print ("Polluted chunk! X: " ..  chunk.x .. ", Y: " .. chunk.y)
    end
    --log("a new chunk: " .. serpent.line(chunk.area))
end

function depollution.on_chunk_generated(chunk, surface)
    local r = global.subchunks.last_id
    global.subchunks.queue[r] = {
        x = chunk.x*32,
        y = chunk.y*32,
        clean_tick = 0
    }

    global.subchunks.last_id = r + 1
    global.subchunks.counter = r
    game.print ("A chunk has been generated [gps=" .. chunk.x*32 .. "," .. chunk.y*32 .."]. Chunks quantity incremented: " .. r)
end

return depollution