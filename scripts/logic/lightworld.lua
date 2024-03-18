-- region names

-- kakariko village
-- south of village
-- cemetary
-- lost woods
-- dam-area
-- desert
-- lake hylia
-- light death mountain
-- eastern palace
-- zora river
-- hyrule castle/centre area

-- AccessibilityLevel.None
-- AccessibilityLevel.Partial
-- AccessibilityLevel.Inspect
-- AccessibilityLevel.SequenceBreak
-- AccessibilityLevel.Normal
-- AccessibilityLevel.Cleared




light_flute_map:connect_one_way(light_death_mountain_left_bottom)
light_flute_map:connect_one_way(witchhut)
light_flute_map:connect_one_way(kakariko_village)
light_flute_map:connect_one_way(links_house_area)
light_flute_map:connect_one_way(eastern_palace_area)
light_flute_map:connect_one_way(darkworld_teleport_desert_area)
light_flute_map:connect_one_way(dam_area)
light_flute_map:connect_one_way(light_lake_hylia)

-- 
lightworld_spawns:connect_one_way(light_spawn_sanctuary)
lightworld_spawns:connect_one_way(light_spawn_links_house_area)
lightworld_spawns:connect_one_way(light_spawn_old_man, function() return has() end) --rescued old man

light_spawn_sanctuary:connect_one_way(links_house)
light_spawn_links_house_area:connect_one_way(sanctuary)
light_spawn_old_man:connect_one_way(old_man_cave)

-- kakariko_village
kakariko_village:connect_one_way(south_of_village)
kakariko_village:connect_one_way(lost_woods)
kakariko_village:connect_one_way(light_flute_map, function() 
    return all(
        has("flute"),
        openOrStandard(),
        can_reach(light_activate_flute)
    ) 
end)







-- 
kakariko_village:connect_one_way_entrance("Kakariko Well Hole", kakariko_well_hole)
kakariko_village:connect_one_way_entrance("Kakariko Magic Bat Hole", magic_bat_hole, function() 
    return any(
        has("hammer"),
        all(
            has("mirror"),
            can_reach(purple_chest_pickup)
        )
    ) 
end)
kakariko_village:connect_two_ways_entrance("Kakariko Well Cave", kakariko_well_cave)
kakariko_village:connect_two_ways_entrance("Kakariko Blind's hideout", kakariko_blinds_hideout)
kakariko_village:connect_two_ways_entrance("Kakariko Hill House", kakariko_house_hill_top)
kakariko_village:connect_two_ways_entrance("Kakariko House Top Left", kakariko_house_top_left)
kakariko_village:connect_two_ways_entrance("Kakariko House Top Right", kakariko_house_right_top)
kakariko_village:connect_two_ways_entrance("Kakariko House Center Right", kakariko_house_right_center)
kakariko_village:connect_two_ways_entrance("Kakariko Sick Kid", kakariko_sick_kid)
kakariko_village:connect_two_ways_entrance("Kakariko Chickenhut", kakariko_chickenhut)
kakariko_village:connect_two_ways_entrance("Kakariko Bombhut", kakariko_bombhut, function() return has("bombs") end)
kakariko_village:connect_two_ways_entrance("Kakariko Backside Pub", kakariko_backside_pub)
kakariko_village:connect_two_ways_entrance("Kakariko Frontside Pub", kakariko_frontside_pub)
kakariko_village:connect_two_ways_entrance("Kakariko Shop", kakariko_shop)
kakariko_village:connect_two_ways_entrance("Kakariko Magic Bat Cave", magic_bat_cave)
kakariko_village:connect_two_ways_entrance("Kakariko Dwarf Smiths", darf_smiths)



kakariko_well_hole:connect_one_way(kakariko_well_item)
kakariko_well_hole:connect_one_way(kakariko_well_cave)
kakariko_well_item:connect_one_way("Kakariko Well - Top", function() return has("bombs") end)
kakariko_well_item:connect_one_way("Kakariko Well - Left")
kakariko_well_item:connect_one_way("Kakariko Well - Middle")
kakariko_well_item:connect_one_way("Kakariko Well - Right")
kakariko_well_item:connect_one_way("Kakariko Well - Bottom")





kakariko_blinds_hideout:connect_one_way("Blind's Hideout - Back", function() return has("bombs") end)
kakariko_blinds_hideout:connect_one_way("Blind's Hideout - Far Left")
kakariko_blinds_hideout:connect_one_way("Blind's Hideout - Left")
kakariko_blinds_hideout:connect_one_way("Blind's Hideout - Right")
kakariko_blinds_hideout:connect_one_way("Blind's Hideout - Far Right")






kakariko_chickenhut:connect_one_way("Chicken House", function() return has("bombs") end)


kakariko_sick_kid:connect_one_way("Sick Kid", function() return has("bottle") end)






kakariko_shop:connect_one_way("Kakariko Shop Left")
kakariko_shop:connect_one_way("Kakariko Shop Center")
kakariko_shop:connect_one_way("Kakariko Shop Right")


kakariko_backside_pub:connect_one_way("Backside Pub")




darf_smiths:connect_one_way("Rescue Dwarf")


-- kakariko_village:connect_one_way(magic_bat_hole, function() 
--     return any(
--         has("hammer"),
--         all(
--             can_reach(purple_chest_pickup),
--             has("mirror")
--         )
--     ) 
-- end)


magic_bat_item:connect_one_way("Magic Bat", function()
    return any(
        has("powder")--,
        -- all(
        --     checkGlitches(2),
        --     has("somaria"),
        --     has("mushroom")
        -- )
    )
end)

magic_bat_hole:connect_one_way(magic_bat_item)
magic_bat_hole:connect_one_way(magic_bat_cave)


kakariko_village:connect_one_way("Bottle Merchant")



kakariko_village:connect_two_ways(light_activate_flute, function() return has("flute") end)




-- south_of_village
south_of_village:connect_one_way(kakariko_village)
south_of_village:connect_one_way(links_house_area)
south_of_village:connect_one_way(light_flute_map, function() 
    return all(
        has("flute"),
        openOrStandard()
    ) 
end)


south_of_village:connect_two_ways_entrance("Library", library)
south_of_village:connect_two_ways_entrance("Light Archery Mini Game", archery_minigame)
south_of_village:connect_two_ways_entrance("Twin House Right", twin_house_right)
south_of_village:connect_two_ways_entrance()


library:connect_one_way("Library Item", function() 
    return any(
        has("boots"),
        AccessibilityLevel.Inspect
    ) 
end)



-- 


twin_house_right:connect_two_ways_entrance("Twin House Left", twin_house_left, function() 
    return any(
        has("bombs"), 
        has("boots")
    ) 
end)
twin_house_left:connect_two_ways_entrance("Race Ledge", race_ledge)
twin_house_left:connect_one_way(south_of_village)
race_ledge:connect_one_way(south_of_village)
race_ledge:connect_one_way("Race Minigame")


-- sanctuary_area
sanctuary_area:connect_one_way(lost_woods)
sanctuary_area:connect_one_way(eastern_palace_area)
sanctuary_area:connect_one_way(light_flute_map, function() 
    return all(
        has("flute"),
        openOrStandard(),
        can_reach(light_activate_flute)
    ) 
end)
sanctuary_area:connect_one_way(light_lake_hylia, function()
    return has("flippers")
end) --teleport

sanctuary_area:connect_two_ways(kings_tomb, function() return has("titans") end)

kings_tomb:connect_two_ways_entrance("King's_Tomb_Entrance", kings_tomb_inside, function() return has("boots") end)

kings_tomb_inside:connect_one_way("King's Tomb")



graveyard_ledge_inside:connect_one_way("Graveyard Ledge")


-- castle_escape_dropdown_room


sanctuary:connect_one_way("Sanctuary Chest")







-- lost_woods
lost_woods:connect_one_way(lumberjacks_area)
lost_woods:connect_one_way(kakariko_village)
lost_woods:connect_one_way(light_flute_map, function() 
    return all(
        has("flute"),
        openOrStandard(),
        can_reach(light_activate_flute)
    ) 
end)


lost_woods:connect_one_way_entrance("Lost Woods Hideout Hole", lost_woods_hideout_hole)
lost_woods:connect_two_ways_entrance("Lost Woods Hideout Cave", lost_woods_hideout_cave)
lost_woods:connect_two_ways_entrance("Lost Woods Top", lost_woods_top)
lost_woods:connect_two_ways_entrance("Pedestal", lost_woods_pedestal)


lost_woods_hideout_hole:connect_one_way(hideout_item)
lost_woods_hideout_item:connect_one_way("Lost Woods Hideout")
lost_woods_hideout_hole:connect_one_way(lost_woods_hideout_cave)



lost_woods_pedestal:connect_one_way("Pedestal", function() 
    return any(
        has("pendant", 3),
        canCheckWithBook()
    )
end)






-- dam_area
dam_area:connect_one_way(desert_area)
dam_area:connect_one_way(light_flute_map, function() 
    return all(
        has("flute"),
        openOrStandard(),
        can_reach(light_activate_flute)
    ) 
end)
dam_area:connect_one_way(links_house_area)
dam_area:connect_one_way(light_lake_hylia, function()
    return has("flippers")
end) --teleport


dam_area:connect_two_ways_entrance("Dam Inside", dam_inside)
dam_area:connect_two_ways_entrance("Dam Area Top Cave", dam_top_right_cave, function() return has("bombs") end)
dam_area:connect_two_ways_entrance("Dam Fairy", dam_desert_fairy)
dam_area:connect_two_ways_entrance("Dam 20 Rupee Cave", twenty_rupee_thief, function() return has("glove") end)
dam_area:connect_two_ways_entrance("Dam Sunken Treasure", sunken_treasure, function() return can_reach(dam_inside) end)
dam_area:connect_two_ways_entrance("Mini Moldorm Cave", mini_moldorm_cave, function() return has("bombs") end)

dam_inside:connect_one_way("Floodgate Chest")


sunken_treasure:connect_one_way("Sunken Treasure", function() return can_reach(dam_inside) end)


mini_moldorm_cave:connect_one_way("Mini Moldorm Cave - Far Left", function() return dealDamage() end)
mini_moldorm_cave:connect_one_way("Mini Moldorm Cave - Left", function() return dealDamage() end)
mini_moldorm_cave:connect_one_way("Mini Moldorm Cave - Generous Guy", function() return dealDamage() end)
mini_moldorm_cave:connect_one_way("Mini Moldorm Cave - Right", function() return dealDamage() end)
mini_moldorm_cave:connect_one_way("Mini Moldorm Cave - Far Right", function() return dealDamage() end)











-- desert_area
desert_area:connect_one_way(dam_area)
checkerboard_lege:connect_one_way(desert_area)
desert_area:connect_one_way_entrance("desert_palace_front_entrance", desert_palace_front, function() return has("book") end)
-- desert_area:connect_two_ways_entrance("aginah_cave_entrance", aginah_cave)
-- desert_area:connect_one_way_entrance("desert_palace_front_entrance", desert_palace_front, function() return has("book") end)
-- desert_area:connect_one_way_entrance("desert_palace_front_entrance", desert_palace_front, function() return has("book") end)
-- desert_area:connect_one_way(desert_palace_front, function() return has("book") end)
desert_area:connect_two_ways_entrance("Aginah Cave", aginah_cave)
desert_area:connect_one_way_entrance("Desert Palace Front", desert_palace_front, function() return has("book") end)
desert_area:connect_two_ways_entrance()
desert_area:connect_two_ways_entrance()
desert_area:connect_two_ways_entrance()

aginah_cave:connect_one_way("Aginah Item", function() return has("bombs") end)

checkerboard_lege:connect_two_ways_entrance("Checkerboard Cave", checkerboard_cave, function() return has("glove") end)
checkerboard_cave:connect_one_way("Checkerboard Cave")


desert_ledge:connect_one_way("Desert Ledge", function() 
    return any(
        can_reach(desert_ledge),
        all(
            can_reach(desert_area),
            AccessibilityLevel.Inspect
        )
    )
end)
desert_ledge:connect_one_way(desert_area)

desert_palace_back:connect_two_ways(desert_ledge)
desert_palace_left:connect_two_ways(desert_ledge)

desert_palace_right:connect_one_way(desert_area)

bombos_tablet:connect_one_way(desert_area)
bombos_tablet:connect_one_way("Bombos Tablet", function() return 
    any(
        all(
            has("book"), 
            canActivateTablets()
        ), 
        all(
            has("book"),
            AccessibilityLevel.Inspect
        )
    )
end)


-- lumberjacks_area
lumberjacks_area:connect_one_way(lost_woods)
lumberjacks_area:connect_one_way(light_flute_map, function() 
    return all(
        has("flute"),
        openOrStandard(),
        can_reach(light_activate_flute)
    ) 
end)
lumberjacks_area:connect_one_way(sanctuary_area)
lumberjacks_area:connect_one_way(light_lake_hylia, function()
    return has("flippers")
end) --teleport
-- lumberjacks_area:connect_one_way(light_death_mountain_left_bottom)

lumberjacks_area:connect_one_way_entrance("Tree Hole", lumberjacks_hole, function() return has("aga1") end)
lumberjacks_area:connect_two_ways_entrance("Lumberjacks Cave", lumberjacks_cave)
lumberjacks_area:connect_two_ways_entrance("Lumberjacks House", lumberjacks_house)
lumberjacks_area:connect_two_ways_entrance("Light Death Mountain Ascend", light_death_mountain_ascend, function() return has("glove") end)
 -- aga item cave


lumberjacks_hole:connect_one_way(lumberjacks_item, function() return has("aga1") end)
lumberjacks_hole:connect_one_way(lumberjacks_cave)
lumberjacks_item:connect_one_way("Lumberjacks Item")



 -- rescue old man



light_bumper_cave_ledge:connect_one_way(lumberjacks_area)
light_bumper_cave_ledge:connect_one_way("Bumper Ledge Item")

light_bumper_cave_ledge:connect_two_ways_entrance("Light Bumber Cave", light_bumper_cave)








-- light_lake_hylia
light_lake_hylia:connect_one_way(links_house_area)
light_lake_hylia:connect_one_way(dam_area)
light_lake_hylia:connect_one_way(light_flute_map, function() 
    return all(
        has("flute"),
        openOrStandard(),
        can_reach(light_activate_flute)
    ) 
end)
light_lake_hylia:connect_one_way(eastern_palace_area)
light_lake_hylia:connect_one_way(witchhut, function() 
    return canSwim()
end) --teleport
light_lake_hylia:connect_one_way(lumberjacks_area, function() 
    return canSwim()
end) --teleport
light_lake_hylia:connect_one_way(zora_river, function() 
    return canSwim()
end) --teleport
-- light_lake_hylia:connect_one_way()

light_lake_hylia:connect_two_ways_entrance("Light Lake Forune", light_lake_fortune)
light_lake_hylia:connect_two_ways_entrance("Light Lake Shop", light_lake_shop)
light_lake_hylia:connect_two_ways_entrance("Icerod Cave", icerod_cave)
light_lake_hylia:connect_two_ways_entrance("Icerod Fairy", icerod_fairy, function() return has("bombs") end)
light_lake_hylia:connect_two_ways_entrance("Icerod Stone", icerod_stone, function() return has("glove") end)

light_lake_shop:connect_one_way("Lake Hylia Shop - Left")
light_lake_shop:connect_one_way("Lake Hylia Shop - Center")
light_lake_shop:connect_one_way("Lake Hylia Shop - Right")


upgrade_fairy:connect_one_way("Capacity Upgrade Left")
upgrade_fairy:connect_one_way("Capacity Upgrade Center")
upgrade_fairy:connect_one_way("Capacity Upgrade Right")





icerod_cave_inside:connect_one_way("Icerod Chest")












-- links_house_area
links_house_area:connect_one_way(south_of_village)
links_house_area:connect_one_way(dam_area)
links_house_area:connect_one_way(light_lake_hylia)
links_house_area:connect_one_way(eastern_palace_area)
links_house_area:connect_one_way(hyrule_castle_area)
links_house_area:connect_one_way(light_flute_map, function() 
    return all(
        has("flute"),
        openOrStandard(),
        can_reach(light_activate_flute)
    ) 
end)


links_house_area:connect_two_ways_entrance("Link's House", links_house)
links_house_area:connect_two_ways_entrance("Links Fairy", links_fairy_fountain, function() return has("boots") end)

links_house:connect_one_way("Link's House Chest")

cave45_ledge:connect_two_ways_entrance("Cave 45", cave45)
cave45_ledge:connect_one_way(links_house_area, function() return openOrStandard() end)
cave45_ledge:connect_two_ways(links_house_area, function() return inverted() end)
cave45:connect_one_way("Cave 45")







-- eastern_palace_area
eastern_palace_area:connect_one_way(light_lake_hylia)
eastern_palace_area:connect_one_way(links_house_area)
eastern_palace_area:connect_one_way(light_lake_hylia)
eastern_palace_area:connect_one_way(witchhut)
eastern_palace_area:connect_one_way(links_house_area)
eastern_palace_area:connect_one_way(light_flute_map, function() 
    return all(
        has("flute"),
        openOrStandard(),
        can_reach(light_activate_flute)
    ) 
end)


eastern_palace_area:connect_two_ways_entrance("Eastern Teleporterr Cave", eastern_teleporter_cave)
eastern_palace_area:connect_two_ways_entrance("Easter Fairy", eastern_fairy, function() return has("bombs") end)
eastern_palace_area:connect_two_ways_entrance("Sahasrahla", sahasralahs_hut)
eastern_palace_area:connect_two_ways_entrance("Eastern Palace Entrance", eastern_palace)




sahasralahs_hut:connect_one_way("Sahasrahla", function() return has("greenpendant") end)
sahasralahs_hut:connect_two_ways(sahasralahs_hut_back, function() return has("bombs") end)
sahasralahs_hut_back:connect_one_way("Sahasrahla's Hut - Left")
sahasralahs_hut_back:connect_one_way("Sahasrahla's Hut - Center")
sahasralahs_hut_back:connect_one_way("Sahasrahla's Hut - Right")









-- zora_river
zora_river:connect_one_way(witchhut, function() 
    return any(
        has("glove"),
        has("flippers")
    )
end)
zora_river:connect_one_way(light_lake_hylia)
zora_river:connect_one_way("Zora")
zora_river:connect_one_way("Zora Ledge", function() 
    return any(
        has("flippers"),
        all(
            checkGlitches(2),
            has("boots")
        )
    )
end)

zora_river:connect_two_ways_entrance("Waterfall Fairy", waterfall_fairy_inside, function()
    return any(
        has("flippers"),
        all(
            canSwim(),
            has("pearl")
        )
    )
end)


waterfall_fairy_inside:connect_one_way("Waterfall Fairy - Left")
waterfall_fairy_inside:connect_one_way("Waterfall Fairy - Right")







-- hyrule_castle_area
hyrule_castle_area:connect_one_way(links_house_area)
hyrule_castle_area:connect_one_way(eastern_palace_area)
hyrule_castle_area:connect_one_way(lumberjacks_area)
hyrule_castle_area:connect_one_way(light_flute_map, function() 
    return all(
        has("flute"),
        openOrStandard(),
        can_reach(light_activate_flute)
    ) 
end)

hyrule_castle_top_outside:connect_two_ways_entrance("Castle Tower", at_entrance, function() 
    return any(
        all(
            checkGlitches(3),
            has("boots"),
            can_reach(sanctuary_area)
        ),
        canClearAgaTowerBarrier()
    ) 
end)
hyrule_castle_top_outside:connect_two_ways_entrance("Hyrule Castle Top Left", hyrule_castle_top_left)
hyrule_castle_top_outside:connect_two_ways_entrance("Hyrule Castle Top Right", hyrule_castle_top_right)
hyrule_castle_top_outside:connect_one_way(hyrule_castle_area)
hyrule_castle_area:connect_two_ways_entrance(hyrule_castle_front)
hyrule_castle_area:connect_one_way_entrance("Secret Passage Hole", secret_passage_hole)
hyrule_castle_area:connect_two_ways_entrance("Secret Passage Stairs", secret_passage_stairs)


secret_passage:connect_one_way("Secret Passage")
secret_passage:connect_one_way("Link's Uncle")
secret_passage_hole:connect_one_way(secret_passage)
secret_passage_stairs:connect_two_ways(secret_passage)





-- witchhut
witchhut:connect_one_way(eastern_palace_area)
witchhut:connect_one_way(sanctuary_area)
witchhut:connect_one_way(light_flute_map, function() 
    return all(
        has("flute"),
        openOrStandard(),
        can_reach(light_activate_flute)
    ) 
end)
witchhut:connect_one_way(zora_river, function() 
    return has("glove") 
end)

witchhut:connect_two_ways_entrance(light_potion_shop)

light_potion_shop:connect_one_way("Potion Shop", function() return deliverMushroom() end)
light_potion_shop:connect_one_way("Potion Shop - Left")
light_potion_shop:connect_one_way("Potion Shop - Right")
light_potion_shop:connect_one_way("Potion Shop - Center")



darkworld_teleport_kakariko_village:connect_one_way(skull_woods_area, function() 
    return any(
        has("titans"),
        all(
            has("glove"),
            has("hammer")
        )
    )
end)



darkworld_teleport_turtle_rock:connect_one_way(dark_death_mountain_right_top, function() 
    return all(
        has("hammer"), 
        has("titans")
    )
end)


darkworld_teleport_desert_area:connect_one_way(desert_area)
darkworld_teleport_desert_area:connect_one_way(mire_area, function() 
    return all(
        has("titans")
    )
end)




-- 

-- 







-- light_death_mountain_left_bottom
light_death_mountain_left_bottom:connect_one_way(light_death_mountain_left_top, function() return has("mirror") end)
light_death_mountain_left_bottom:connect_one_way(light_death_mountain_right_bottom, function() return has("hookshot") end)
-- light_death_mountain_left_bottom:connect_one_way("Spectacle Rock", function() return has("mirror") end)
light_death_mountain_left_bottom:connect_one_way(light_flute_map, function() 
    return all(
        has("flute"),
        openOrStandard(),
        can_reach(light_activate_flute)
    ) 
end)
light_death_mountain_left_bottom:connect_one_way()




-- -- light_death_mountain_left:connect_one_way(lumberjacks_area)
-- light_death_mountain_left_bottom:connect_one_way(light_death_mountain_right_bottom)
-- -- light_death_mountain_left_bottom:connect_one_way(light_death_mountain_left_top)







-- light_death_mountain_left_top
light_death_mountain_left_top:connect_one_way(light_death_mountain_left_bottom)
light_death_mountain_left_top:connect_one_way(light_flute_map, function() 
    return all(
        has("flute"),
        openOrStandard(),
        can_reach(light_activate_flute)
    ) 
end)
light_death_mountain_left_top:connect_one_way(light_death_mountain_right_top, function() return has("hammer") end)
light_death_mountain_left_top:connect_one_way("Ether Tablet", function() 
    return any(
        all(
        has("book"), 
        canActivateTablets()
        ),
        canCheckWithBook()
    )
end)


-- light_death_mountain_left_top:connect_one_way(light_death_mountain_right_top)
-- light_death_mountain_left_top:connect_one_way(light_death_mountain_left_bottom)







-- light_death_mountain_right_bottom
light_death_mountain_right_bottom:connect_one_way(light_death_mountain_left_bottom, function() return has("hookshot") end)
light_death_mountain_right_bottom:connect_one_way(light_flute_map, function() 
    return all(
        has("flute"),
        openOrStandard(),
        can_reach(light_activate_flute)
    ) 
end)
-- light_death_mountain_right_bottom:connect_one_way()
-- light_death_mountain_right_bottom:connect_one_way()







-- light_death_mountain_right_top
light_death_mountain_right_top:connect_one_way(light_death_mountain_right_bottom)
light_death_mountain_right_top:connect_one_way(light_flute_map, function() 
    return all(
        has("flute"),
        openOrStandard(),
        can_reach(light_activate_flute)
    ) 
end)
light_death_mountain_right_top:connect_one_way(light_death_mountain_left_top, function() return has("hammer") end)
-- light_death_mountain_right_top:connect_one_way()
-- light_death_mountain_right_top:connect_one_way()