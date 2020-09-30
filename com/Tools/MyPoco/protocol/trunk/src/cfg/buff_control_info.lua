---@classdef record_buff_control_info
local record_buff_control_info = {}


record_buff_control_info.id = 0--id
record_buff_control_info.buff_type_id = 0--buff_type
record_buff_control_info.buff_effect_type = 0--buff_effect_type
record_buff_control_info.eliminate_weight = 0--清除权重判断

local buff_control_info = {
   _data = {   
    [1] = {1,3,1009,800,},  
    [2] = {2,3,1005,200,},  
    [3] = {3,4,1004,200,},  
    [4] = {4,6,1007,200,},  
    [5] = {5,10,1013,1000,},  
    [6] = {6,19,1022,200,},  
    [7] = {7,3,1031,200,},
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
}

local __key_map = { 
    id = 1,
    buff_type_id = 2,
    buff_effect_type = 3,
    eliminate_weight = 4,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_buff_control_info")

        return t._raw[__key_map[k]]
    end
}


function buff_control_info.getLength()
    return #buff_control_info._data
end



function buff_control_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_buff_control_info
function buff_control_info.indexOf(index)
    if index == nil or not buff_control_info._data[index] then
        return nil
    end
    return setmetatable({_raw = buff_control_info._data[index]}, m)
end



---
--@return @class record_buff_control_info
function buff_control_info.get(id)
    
    return buff_control_info.indexOf(__index_id[ id ])
     
end



function buff_control_info.set(id, key, value)
    local record = buff_control_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function buff_control_info.get_index_data()
    return __index_id 
end

return  buff_control_info 