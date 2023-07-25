function has(item, amount)
    local count = Tracker:ProviderCountForCode(item)
    amount = tonumber(amount)
    if not amount then
        return count > 0
    else
        return count >= amount
    end
end

function getBossRef(nameRef)
    local bosses = {
        [1.0] = {"@Bosses/Armos Knights"},
        [2.0] = {"@Bosses/Lanmolas"},
        [3.0] = {"@Bosses/Moldorm"},
        [4.0] = {"@Bosses/Helmasaur King"},
        [5.0] = {"@Bosses/Arrghus"},
        [6.0] = {"@Bosses/Mothula"},
        [7.0] = {"@Bosses/Blind"},
        [8.0] = {"@Bosses/Kholdstare"},
        [9.0] = {"@Bosses/Vitreous"},
        [10.0] = {"@Bosses/Trinexx"}
    }
    local stage = Tracker:FindObjectForCode(nameRef).CurrentStage
    local access_lvl = 0
    -- print("if")
    if stage == 0.0 then
       access_lvl = 1
    else
       access_lvl = Tracker:FindObjectForCode(bosses[stage][1]).AccessibilityLevel
    end
    if access_lvl > 0 then
        return true
    end
    -- print("Failed Boss_check with ".. name .. "and" .. stage)
    return 0
end

function canActivateTablets()
    if Tracker:ProviderCountForCode("swordless") > 0 then
        return Tracker:ProviderCountForCode("hammer")
    else
        return Tracker:ProviderCountForCode("mastersword")
    end
end

function getShuffle(item, type)
    -- print(item, type)
    if Tracker:ProviderCountForCode(item) > 0 and type == "shuffle" then
        return true
    elseif Tracker:ProviderCountForCode(item) == 0 and type == "vanilla" then
        return true
    else 
        return false
    end
end

function checkSwordless()
    if Tracker:ProviderCountForCode("swordless") > 0 then
        return 1
    else
        return Tracker:ProviderCountForCode("sword")
    end
end

function canUseMedallions()
    return checkSwordless()
end

function canRemoveCurtains()
    return checkSwordless()
end

function canClearAgaTowerBarrier()
    -- With cape, we can always get through
    if Tracker:ProviderCountForCode("cape") > 0 then
        return 1
    end
    -- Otherwise we need master sword or a hammer depending on the mode
    if Tracker:ProviderCountForCode("swordless") > 0 then
        return Tracker:ProviderCountForCode("hammer")
    else
        return Tracker:ProviderCountForCode("mastersword")
    end    
end

function gtCrystalCount()
    return checkRequirements("gt_access", "crystal")
end

function ganonCrystalCount()
    return checkRequirements("ganon_killable", "crystal")
end

function canSwim() --fake flippers
    if Tracker:FindObjectForCode("glitches").CurrentStage > 0 then
        return true
    else 
        return Tracker:ProviderCountForCode("flippers")
    end
end

function smallKeys(dungeon, count)
    if Tracker:ProviderCountForCode("small_keys") == 0 then
        return true
    else 
        if Tracker:FindObjectForCode(dungeon).AcquiredCount >= tonumber(count) then
            return true
        else
            return false
        end
    end
end

function checkRequirements(reference, check_count)
    local reqCount = Tracker:ProviderCountForCode(reference)
    local count = Tracker:ProviderCountForCode(check_count)

    if count >= reqCount then
        return 1
    else
        return 0
    end
end

function darkRooms()
    local dark_mode = Tracker:FindObjectForCode("dark_mode").CurrentStage
    if dark_mode == 0 then --none
        return true
    elseif  dark_mode == 1 and Tracker:ProviderCountForCode("lamp") > 0 then -- lamp
        return true
    elseif  dark_mode == 2 and (Tracker:ProviderCountForCode("firerod") > 0 or Tracker:ProviderCountForCode("lamp") > 0) then -- scornes/firerod
        return true
    else
        return false
    end
end

function calcHeartpieces()
    local pieces = Tracker:FindObjectForCode("heartpieces")
    pieces.CurrentStage = (Tracker:FindObjectForCode("heartpieces").AcquiredCount % 4)
end

function health(targetHealth)
    local target = tonumber(targetHealth)
    local amount = 0
    local base = 3
    local container = Tracker:ProviderCountForCode("heartcontainer")
    local pieces = Tracker:FindObjectForCode("heartpieces").AcquiredCount // 4
    local byrna = Tracker:FindObjectForCode("byrna").Active
    local cape = Tracker:FindObjectForCode("cape").Active
    local magic = Tracker:FindObjectForCode("half_magic").Active
    local bottles = Tracker:FindObjectForCode("bottle").CurrentStage
    local amount = base + container + pieces
    -- print(container, pieces, amount, target, bottles)
    if amount >= target then
        return true
    elseif amount > ((target//2)) and (magic and (byrna or cape)) then
        return true
    elseif amount * (bottles+1) >= target then
        return true
    elseif bottles > 0 and amount > ((target//bottles+1)+1) and (byrna or cape) then
        return true
    else
        return false
    end
end

function enemizerCheck(item)
    if Tracker:FindObjectForCode("enemizer").Active == true then
        return true
    end
    if Tracker:FindObjectForCode(item).Active == true then
        return true
    else
        return false
    end
end

function canFinish() 
    local reqs = {
        [1] = {checkRequirements("ganon_killable", "crystal")},
        [2] = {Tracker:ProviderCountForCode("aga1")},
        [3] = {Tracker:ProviderCountForCode("aga2")},
        [4] = {Tracker:ProviderCountForCode("green_pendant")},
        [5] = {Tracker:ProviderCountForCode("blue_pendant")},
        [6] = {Tracker:ProviderCountForCode("red_pendant")},
        [7] = {checkRequirements("triforce_pieces_needed", "triforcepieces")},
        [8] = {Tracker:ProviderCountForCode("icerod")}
    }
    local goals = {
        [0] = {reqs[1][1], reqs[3][1]}, --aga2 + ganon killable
        [1] = {reqs[1][1]}, --ganon killable
        [2] = {reqs[1][1], reqs[2][1], reqs[3][1], reqs[4][1], reqs[5][1], reqs[6][1]}, --7crystal, aga1+aga2, 3pendants
        [3] = {reqs[4][1], reqs[5][1], reqs[6][1]}, --3 pendants
        [4] = {reqs[1][1], reqs[4][1], reqs[5][1], reqs[6][1]}, --pendants+ ganon killable
        [5] = {reqs[7][1]}, --trifoce pieces
        [6] = {reqs[1][1], reqs[7][1]}, --triforce pieces + ganon killabel
        [7] = {reqs[8][1]} --icerod
    }
    local beatable = 0

    for k,h in pairs(goals[Tracker:FindObjectForCode("goal").CurrentStage]) do
        beatable = beatable + h
        table_length = k
    end
    local obj = Tracker:FindObjectForCode("go_mode")
    if beatable >= table_length then
        obj.Active = true
        return true
    else
        obj.Active = false
        return false
    end
end

function openOrStandard()
    if Tracker:FindObjectForCode("start_option").CurrentStage ~= 1 then
        return true
    end
    return false
end

function checkGlitches(stage)
    if Tracker:FindObjectForCode("glitches").CurrentStage >= tonumber(stage) then
        return true
    end
    return false
end

-- function  chestCount(dungeon, baseCount)
--     local counter = 0 
--     local settings = {
--         [1] = {Tracker:FindObjectForCode("map").Active},
--         [2] = {Tracker:FindObjectForCode("compass").Active},
--         [3] = {Tracker:FindObjectForCode("small_keys").Active},
--         [4] = {Tracker:FindObjectForCode("big_keys").Active},
--     }
--     -- local items = {
--     --     [1] = {Tracker:FindObjectForCode(dungeon.."_map")},
--     --     [2] = {Tracker:FindObjectForCode(dungeon.."_compass")},
--     --     [3] = {Tracker:FindObjectForCode(dungeon.."_smallkey")},
--     --     [4] = {Tracker:FindObjectForCode(dungeon.."_bigkey")},
--     -- }
--     for k,v in pairs(settings) do
--         print(k,v)
--         if v == true then
--             counter = coutner + 1
--         end
--     end
--     print(baseCount, counter)
--     -- return baseCount
-- end

-- function maxKeycount(baseKeys, keyDropShuffle)
--     print(baseKeys, keyDropShuffle)
--     if Tracker:FindObjectForCode("key_drop_shuffle").Active == true then
--         print("yes")
--         return baseKeys + keyDropShuffle
--     end
--     print("no")
--     return baseKeys
-- end

