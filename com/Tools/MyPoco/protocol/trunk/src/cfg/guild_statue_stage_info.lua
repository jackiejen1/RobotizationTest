---@classdef record_guild_statue_stage_info
local record_guild_statue_stage_info = {}


record_guild_statue_stage_info.id = 0--id
record_guild_statue_stage_info.level = 0--军团等级
record_guild_statue_stage_info.stage = 0--阶段
record_guild_statue_stage_info.guild_exp = 0--提升至阶段增加军团经验

local guild_statue_stage_info = {
   _data = {   
    [1] = {1,1,1,0,},  
    [2] = {2,1,2,210,},  
    [3] = {3,1,3,315,},  
    [4] = {4,1,4,420,},  
    [5] = {5,2,1,0,},  
    [6] = {6,2,2,240,},  
    [7] = {7,2,3,360,},  
    [8] = {8,2,4,480,},  
    [9] = {9,3,1,0,},  
    [10] = {10,3,2,240,},  
    [11] = {11,3,3,360,},  
    [12] = {12,3,4,480,},  
    [13] = {13,4,1,0,},  
    [14] = {14,4,2,270,},  
    [15] = {15,4,3,405,},  
    [16] = {16,4,4,540,},  
    [17] = {17,5,1,0,},  
    [18] = {18,5,2,270,},  
    [19] = {19,5,3,405,},  
    [20] = {20,5,4,540,},  
    [21] = {21,6,1,0,},  
    [22] = {22,6,2,300,},  
    [23] = {23,6,3,450,},  
    [24] = {24,6,4,600,},  
    [25] = {25,7,1,0,},  
    [26] = {26,7,2,300,},  
    [27] = {27,7,3,450,},  
    [28] = {28,7,4,600,},  
    [29] = {29,8,1,0,},  
    [30] = {30,8,2,330,},  
    [31] = {31,8,3,495,},  
    [32] = {32,8,4,660,},  
    [33] = {33,9,1,0,},  
    [34] = {34,9,2,330,},  
    [35] = {35,9,3,495,},  
    [36] = {36,9,4,660,},  
    [37] = {37,10,1,0,},  
    [38] = {38,10,2,360,},  
    [39] = {39,10,3,540,},  
    [40] = {40,10,4,720,},
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
    [27] = 27,  
    [28] = 28,  
    [29] = 29,  
    [30] = 30,  
    [31] = 31,  
    [32] = 32,  
    [33] = 33,  
    [34] = 34,  
    [35] = 35,  
    [36] = 36,  
    [37] = 37,  
    [38] = 38,  
    [39] = 39,  
    [40] = 40,
}

local __key_map = { 
    id = 1,
    level = 2,
    stage = 3,
    guild_exp = 4,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_guild_statue_stage_info")

        return t._raw[__key_map[k]]
    end
}


function guild_statue_stage_info.getLength()
    return #guild_statue_stage_info._data
end



function guild_statue_stage_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_guild_statue_stage_info
function guild_statue_stage_info.indexOf(index)
    if index == nil or not guild_statue_stage_info._data[index] then
        return nil
    end
    return setmetatable({_raw = guild_statue_stage_info._data[index]}, m)
end



---
--@return @class record_guild_statue_stage_info
function guild_statue_stage_info.get(id)
    
    return guild_statue_stage_info.indexOf(__index_id[ id ])
     
end



function guild_statue_stage_info.set(id, key, value)
    local record = guild_statue_stage_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function guild_statue_stage_info.get_index_data()
    return __index_id 
end

return  guild_statue_stage_info 