---@classdef record_dead_tower_treasure_info
local record_dead_tower_treasure_info = {}


record_dead_tower_treasure_info.id = 0--id
record_dead_tower_treasure_info.step = 0--步数
record_dead_tower_treasure_info.award_1 = 0--奖励1
record_dead_tower_treasure_info.probability_1 = 0--奖励1概率
record_dead_tower_treasure_info.award_2 = 0--奖励2
record_dead_tower_treasure_info.probability_2 = 0--奖励2概率
record_dead_tower_treasure_info.award_3 = 0--奖励3
record_dead_tower_treasure_info.probability_3 = 0--奖励3概率
record_dead_tower_treasure_info.award_4 = 0--奖励4
record_dead_tower_treasure_info.probability_4 = 0--奖励4概率
record_dead_tower_treasure_info.award_5 = 0--奖励5
record_dead_tower_treasure_info.probability_5 = 0--奖励5概率
record_dead_tower_treasure_info.map_treasure_id = 0--宝藏id

local dead_tower_treasure_info = {
   _data = {   
    [1] = {1,1,720001,800,720002,200,0,0,0,0,0,0,0,},  
    [2] = {2,2,720001,800,720002,200,0,0,0,0,0,0,0,},  
    [3] = {3,3,720001,560,720002,140,720003,300,0,0,0,0,720003,},  
    [4] = {4,4,720001,400,720002,100,720003,500,0,0,0,0,720003,},  
    [5] = {5,5,720003,1000,0,0,0,0,0,0,0,0,720003,},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [3] = 3,  
    [4] = 4,  
    [5] = 5,
}

local __key_map = { 
    id = 1,
    step = 2,
    award_1 = 3,
    probability_1 = 4,
    award_2 = 5,
    probability_2 = 6,
    award_3 = 7,
    probability_3 = 8,
    award_4 = 9,
    probability_4 = 10,
    award_5 = 11,
    probability_5 = 12,
    map_treasure_id = 13,
}

local m = { 
    __index = function(t, k) 
        if k == "toObject" then
            return function()  
                local o = {}
                for key, v in pairs (__key_map) do 
                    o[key] = t._raw[v]
                end
                return o
            end 
        end
        
        assert(__key_map[k], "cannot find " .. k .. " in record_dead_tower_treasure_info")

        return t._raw[__key_map[k]]
    end
}


function dead_tower_treasure_info.getLength()
    return #dead_tower_treasure_info._data
end



function dead_tower_treasure_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_dead_tower_treasure_info
function dead_tower_treasure_info.indexOf(index)
    if index == nil or not dead_tower_treasure_info._data[index] then
        return nil
    end
    return setmetatable({_raw = dead_tower_treasure_info._data[index]}, m)
end



---
--@return @class record_dead_tower_treasure_info
function dead_tower_treasure_info.get(id)
    
    return dead_tower_treasure_info.indexOf(__index_id[ id ])
     
end



function dead_tower_treasure_info.set(id, key, value)
    local record = dead_tower_treasure_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function dead_tower_treasure_info.get_index_data()
    return __index_id 
end

return  dead_tower_treasure_info 