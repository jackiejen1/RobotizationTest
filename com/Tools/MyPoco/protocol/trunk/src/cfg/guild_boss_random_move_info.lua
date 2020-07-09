---@classdef record_guild_boss_random_move_info
local record_guild_boss_random_move_info = {}


record_guild_boss_random_move_info.id = 0--ID
record_guild_boss_random_move_info.position_X = 0--位置X坐标
record_guild_boss_random_move_info.position_Y = 0--位置Y坐标

local guild_boss_random_move_info = {
   _data = {   
    [1] = {1,373,380,},  
    [2] = {2,336,413,},  
    [3] = {3,310,461,},  
    [4] = {4,336,440,},  
    [5] = {5,378,400,},  
    [6] = {6,959,355,},  
    [7] = {7,1028,373,},  
    [8] = {8,1104,371,},  
    [9] = {9,1135,412,},  
    [10] = {10,1195,439,},  
    [11] = {11,1253,514,},  
    [12] = {12,1164,564,},  
    [13] = {13,1181,609,},  
    [14] = {14,1142,647,},  
    [15] = {15,982,649,},  
    [16] = {16,1032,659,},  
    [17] = {17,1077,619,},  
    [18] = {18,1077,536,},  
    [19] = {19,1106,564,},  
    [20] = {20,897,447,},  
    [21] = {21,872,737,},  
    [22] = {22,822,782,},  
    [23] = {23,561,744,},  
    [24] = {24,476,707,},  
    [25] = {25,349,656,},  
    [26] = {26,311,619,},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [3] = 3,  
    [4] = 4,  
    [5] = 5,  
    [6] = 6,  
    [7] = 7,  
    [8] = 8,  
    [9] = 9,  
    [10] = 10,  
    [11] = 11,  
    [12] = 12,  
    [13] = 13,  
    [14] = 14,  
    [15] = 15,  
    [16] = 16,  
    [17] = 17,  
    [18] = 18,  
    [19] = 19,  
    [20] = 20,  
    [21] = 21,  
    [22] = 22,  
    [23] = 23,  
    [24] = 24,  
    [25] = 25,  
    [26] = 26,
}

local __key_map = { 
    id = 1,
    position_X = 2,
    position_Y = 3,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_guild_boss_random_move_info")

        return t._raw[__key_map[k]]
    end
}


function guild_boss_random_move_info.getLength()
    return #guild_boss_random_move_info._data
end



function guild_boss_random_move_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_guild_boss_random_move_info
function guild_boss_random_move_info.indexOf(index)
    if index == nil or not guild_boss_random_move_info._data[index] then
        return nil
    end
    return setmetatable({_raw = guild_boss_random_move_info._data[index]}, m)
end



---
--@return @class record_guild_boss_random_move_info
function guild_boss_random_move_info.get(id)
    
    return guild_boss_random_move_info.indexOf(__index_id[ id ])
     
end



function guild_boss_random_move_info.set(id, key, value)
    local record = guild_boss_random_move_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function guild_boss_random_move_info.get_index_data()
    return __index_id 
end

return  guild_boss_random_move_info 