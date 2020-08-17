---@classdef record_guild_random_move_info
local record_guild_random_move_info = {}


record_guild_random_move_info.id = 0--ID
record_guild_random_move_info.position_X = 0--位置X坐标
record_guild_random_move_info.position_Y = 0--位置Y坐标
record_guild_random_move_info.weight_common = 0--普通期间权重
record_guild_random_move_info.weight_statue = 0--铸像显灵期间权重

local guild_random_move_info = {
   _data = {   
    [1] = {1,495,303,100,100,},  
    [2] = {2,427,367,100,100,},  
    [3] = {3,331,427,100,100,},  
    [4] = {4,594,262,100,100,},  
    [5] = {5,496,320,100,100,},  
    [6] = {6,868,303,100,100,},  
    [7] = {7,763,284,100,100,},  
    [8] = {8,967,359,100,100,},  
    [9] = {9,732,250,100,100,},  
    [10] = {10,657,233,100,100,},  
    [11] = {11,1040,630,100,100,},  
    [12] = {12,884,550,100,100,},  
    [13] = {13,910,452,100,100,},  
    [14] = {14,1023,402,100,100,},  
    [15] = {15,969,388,100,100,},  
    [16] = {16,855,334,100,100,},  
    [17] = {17,796,308,100,100,},  
    [18] = {18,884,441,100,100,},  
    [19] = {19,767,310,100,100,},  
    [20] = {20,774,535,100,500,},  
    [21] = {21,588,550,100,500,},  
    [22] = {22,467,494,100,500,},  
    [23] = {23,364,471,100,500,},  
    [24] = {24,534,630,100,500,},  
    [25] = {25,369,675,100,500,},  
    [26] = {26,525,741,100,500,},  
    [27] = {27,243,742,100,100,},  
    [28] = {28,574,691,100,100,},  
    [29] = {29,587,576,100,100,},
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
}

local __key_map = { 
    id = 1,
    position_X = 2,
    position_Y = 3,
    weight_common = 4,
    weight_statue = 5,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_guild_random_move_info")

        return t._raw[__key_map[k]]
    end
}


function guild_random_move_info.getLength()
    return #guild_random_move_info._data
end



function guild_random_move_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_guild_random_move_info
function guild_random_move_info.indexOf(index)
    if index == nil or not guild_random_move_info._data[index] then
        return nil
    end
    return setmetatable({_raw = guild_random_move_info._data[index]}, m)
end



---
--@return @class record_guild_random_move_info
function guild_random_move_info.get(id)
    
    return guild_random_move_info.indexOf(__index_id[ id ])
     
end



function guild_random_move_info.set(id, key, value)
    local record = guild_random_move_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function guild_random_move_info.get_index_data()
    return __index_id 
end

return  guild_random_move_info 