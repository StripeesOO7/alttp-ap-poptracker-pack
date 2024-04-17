-- mm_entrance = alttp_location.new("")
local mm_main_room = alttp_location.new("mm_main_room")
local mm_big_chest_room = alttp_location.new("mm_big_chest_room")
local mm_map_room_top = alttp_location.new("mm_map_room_top")
local mm_map_room_bottom = alttp_location.new("mm_map_room_bottom")
local mm_conveyor_crystal_room = alttp_location.new("mm_conveyor_crystal_room")
local four_torches_tile_room = alttp_location.new("four_torches_tile_room")
local mm_compass_room = alttp_location.new("mm_compass_room")
local mm_block_push = alttp_location.new("mm_block_push")
local mm_cutscene_room = alttp_location.new("mm_cutscene_room")
local mm_big_key_chest = alttp_location.new("mm_big_key_chest")
local mm_spike_room = alttp_location.new("mm_spike_room")
local mm_fishbone_room = alttp_location.new("mm_fishbone_room")
local mm_bridge_right = alttp_location.new("mm_bridge_right")
local mm_bridge_middle = alttp_location.new("mm_bridge_middle")
local mm_big_key_door = alttp_location.new("mm_big_key_door")
local mm_hourlgas_room = alttp_location.new("mm_hourlgas_room")
local mm_teleporter_room = alttp_location.new("mm_teleporter_room")
local mm_boss_room = alttp_location.new("mm_boss_room")

mm_entrance:connect_two_ways(mm_main_room, function() 
    return all(
        any(
            has("hookshot"),
            has("boots")
        ),
        can_interact("dark", 1)
    )
end)
mm_main_room:connect_two_ways(mm_map_room_bottom)
mm_main_room:connect_two_ways(mm_conveyor_crystal_room,function(keys) return has("mm_smallkey", keys, 2, keys + 1, 5), KDSreturn(keys, keys + 1) end)
mm_main_room:connect_two_ways(mm_map_room_top, function(keys) return has("mm_smallkey", keys + 1, 2, keys + 1, 5), KDSreturn(keys + 1, keys + 1) end)
mm_main_room:connect_two_ways(mm_block_push)
mm_main_room:connect_one_way("MM - Main Lobby Chest", function() 
    return mm_conveyor_crystal_room:accessibility() end)

mm_map_room_bottom:connect_two_ways(mm_big_chest_room)

mm_big_chest_room:connect_one_way(mm_map_room_top)
mm_big_chest_room:connect_one_way("MM - Big Chest", function() return has("mm_bigkey") end)

mm_map_room_top:connect_one_way(mm_map_room_bottom)
mm_map_room_top:connect_two_ways(mm_spike_room, function() return mm_conveyor_crystal_room:accessibility() end)
mm_map_room_top:connect_one_way("MM - Map Chest", function() return mm_conveyor_crystal_room:accessibility() end)

mm_block_push:connect_two_ways(mm_bridge_right)
mm_block_push:connect_two_ways(mm_spike_room)

mm_bridge_right:connect_one_way("MM - Bridge Chest")

mm_spike_room:connect_two_ways(mm_big_key_door, function(keys) 
    return has("mm_smallkey", keys, 2, keys + 1, 5), KDSreturn(keys, keys + 1) 
end)

mm_spike_room:connect_two_ways(mm_fishbone_room, function(keys) 
    return has("mm_smallkey", keys, 2, keys + 1, 5), KDSreturn(keys, keys + 1) 
end)

mm_spike_room:connect_one_way("MM - Spike Chest", function() 
    return any(
        has("heartcontainerm", 1, 1),
        has("heartpieces", 4, 4),
        has("invincibility")
    ) 
end)
mm_spike_room:connect_one_way("MM - Spike Key Drop")

mm_fishbone_room:connect_one_way(mm_hourlgas_room, function(keys) return has("mm_smallkey", keys, 2, keys + 1, 5), KDSreturn(keys, keys + 1) end)
mm_fishbone_room:connect_one_way("MM - Fishbone Key Drop")

mm_hourlgas_room:connect_two_ways(mm_main_room)
mm_hourlgas_room:connect_two_ways(mm_teleporter_room)
mm_conveyor_crystal_room:connect_two_ways(four_torches_tile_room, function(keys) return has("mm_smallkey", keys, 2, keys + 1, 5), KDSreturn(keys, keys + 1) end)

four_torches_tile_room:connect_two_ways(mm_compass_room, function() return has("firesource") end)
four_torches_tile_room:connect_two_ways(mm_cutscene_room)

mm_conveyor_crystal_room:connect_one_way("MM - Conveyor Crystal Key Drop")

mm_compass_room:connect_one_way(mm_main_room)
mm_compass_room:connect_one_way("MM - Comapss Chest")

mm_cutscene_room:connect_one_way(mm_big_key_chest, function(keys) 
    return all(
        has("firesource"),
        has("mm_smallkey", keys, 2, keys + 1, 5)
    ), KDSreturn(keys, keys + 1) 
end)

mm_big_key_chest:connect_one_way(mm_hourlgas_room)
mm_big_key_chest:connect_one_way("MM - Big Key Chest")

mm_teleporter_room:connect_one_way(mm_big_key_door, function() return has("mm_bigkey") end)

mm_big_key_door:connect_two_ways(mm_bridge_middle, function() return has("mm_bigkey") end) 
mm_bridge_middle:connect_two_ways(mm_boss_room, function(keys) 
    return all(
        has("somaria"), 
        has("bombs"),
        darkRooms(),
        has("mm_smallkey", keys, 2, keys + 1, 5)--,
        -- has("mm_bigkey")
    ), KDSreturn(keys, keys + 1) 
end) 

mm_boss_room:connect_one_way("MM - Boss", function() return getBossRef("mm_boss") end)