---@classdef record_gvg_parameter_info
local record_gvg_parameter_info = {}


record_gvg_parameter_info.id = 0--ID
record_gvg_parameter_info.parameter = 0--参数

local gvg_parameter_info = {
   _data = {   
    [1] = {1001,3,},  
    [2] = {1002,3,},  
    [3] = {1003,100,},  
    [4] = {1004,100,},  
    [5] = {1005,1,},  
    [6] = {1006,8,},  
    [7] = {1007,4,},  
    [8] = {1008,5,},  
    [9] = {2001,5,},  
    [10] = {3001,1000,},  
    [11] = {3002,3,},  
    [12] = {3003,100,},  
    [13] = {4001,20,},  
    [14] = {4002,60,},  
    [15] = {5001,100,},  
    [16] = {5002,20,},  
    [17] = {5003,5,},  
    [18] = {5004,20,},  
    [19] = {5005,10,},  
    [20] = {5006,100,},  
    [21] = {5007,100,},  
    [22] = {5008,100,},  
    [23] = {5009,100,},  
    [24] = {5010,100,},  
    [25] = {5011,100,},  
    [26] = {6001,180,},  
    [27] = {6002,60,},
    }
}

local __index_id = {   
    [1001] = 1,  
    [1002] = 2,  
    [1003] = 3,  
    [1004] = 4,  
    [1005] = 5,  
    [1006] = 6,  
    [1007] = 7,  
    [1008] = 8,  
    [2001] = 9,  
    [3001] = 10,  
    [3002] = 11,  
    [3003] = 12,  
    [4001] = 13,  
    [4002] = 14,  
    [5001] = 15,  
    [5002] = 16,  
    [5003] = 17,  
    [5004] = 18,  
    [5005] = 19,  
    [5006] = 20,  
    [5007] = 21,  
    [5008] = 22,  
    [5009] = 23,  
    [5010] = 24,  
    [5011] = 25,  
    [6001] = 26,  
    [6002] = 27,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_gvg_parameter_info")

        return t._raw[__key_map[k]]
    end
}


function gvg_parameter_info.getLength()
    return #gvg_parameter_info._data
end



function gvg_parameter_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_gvg_parameter_info
function gvg_parameter_info.indexOf(index)
    if index == nil or not gvg_parameter_info._data[index] then
        return nil
    end
    return setmetatable({_raw = gvg_parameter_info._data[index]}, m)
end



---
--@return @class record_gvg_parameter_info
function gvg_parameter_info.get(id)
    
    return gvg_parameter_info.indexOf(__index_id[ id ])
     
end



function gvg_parameter_info.set(id, key, value)
    local record = gvg_parameter_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function gvg_parameter_info.get_index_data()
    return __index_id 
end

return  gvg_parameter_info 