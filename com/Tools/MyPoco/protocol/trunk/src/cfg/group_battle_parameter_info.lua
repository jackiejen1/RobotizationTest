---@classdef record_group_battle_parameter_info
local record_group_battle_parameter_info = {}


record_group_battle_parameter_info.id = 0--ID
record_group_battle_parameter_info.parameter = 0--参数

local group_battle_parameter_info = {
   _data = {   
    [1] = {1,100,},  
    [2] = {2,60,},  
    [3] = {3,400,},  
    [4] = {4,600,},  
    [5] = {5,10,},  
    [6] = {6,10,},  
    [7] = {7,50,},  
    [8] = {8,100,},  
    [9] = {9,65,},  
    [10] = {101,0,},  
    [11] = {102,0,},  
    [12] = {103,0,},  
    [13] = {104,1000,},  
    [14] = {105,0,},  
    [15] = {106,60,},  
    [16] = {201,0,},  
    [17] = {202,50,},  
    [18] = {203,50,},  
    [19] = {204,0,},  
    [20] = {205,0,},
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
    [101] = 10,  
    [102] = 11,  
    [103] = 12,  
    [104] = 13,  
    [105] = 14,  
    [106] = 15,  
    [201] = 16,  
    [202] = 17,  
    [203] = 18,  
    [204] = 19,  
    [205] = 20,
}

local __key_map = { 
    id = 1,
    parameter = 2,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_group_battle_parameter_info")

        return t._raw[__key_map[k]]
    end
}


function group_battle_parameter_info.getLength()
    return #group_battle_parameter_info._data
end



function group_battle_parameter_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_group_battle_parameter_info
function group_battle_parameter_info.indexOf(index)
    if index == nil or not group_battle_parameter_info._data[index] then
        return nil
    end
    return setmetatable({_raw = group_battle_parameter_info._data[index]}, m)
end



---
--@return @class record_group_battle_parameter_info
function group_battle_parameter_info.get(id)
    
    return group_battle_parameter_info.indexOf(__index_id[ id ])
     
end



function group_battle_parameter_info.set(id, key, value)
    local record = group_battle_parameter_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function group_battle_parameter_info.get_index_data()
    return __index_id 
end

return  group_battle_parameter_info 