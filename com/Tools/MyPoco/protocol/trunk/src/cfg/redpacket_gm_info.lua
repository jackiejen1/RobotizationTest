---@classdef record_redpacket_gm_info
local record_redpacket_gm_info = {}


record_redpacket_gm_info.id = 0--编号
record_redpacket_gm_info.position = 0--红包位ID
record_redpacket_gm_info.red_id = 0--红包ID
record_redpacket_gm_info.open_type = 0--开启类型
record_redpacket_gm_info.open_type_value = 0--开启类型值
record_redpacket_gm_info.position_des =  ""--位置描述

local redpacket_gm_info = {
   _data = {   
    [1] = {1,1,4,1,1,"0",},  
    [2] = {2,1,5,1,4,"0",},  
    [3] = {3,1,6,1,7,"0",},  
    [4] = {4,2,7,1,2,"0",},  
    [5] = {5,2,8,1,5,"0",},  
    [6] = {6,2,9,1,8,"0",},  
    [7] = {7,3,10,1,3,"0",},  
    [8] = {8,3,11,1,6,"0",},  
    [9] = {9,3,12,1,9,"0",},
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
}

local __key_map = { 
    id = 1,
    position = 2,
    red_id = 3,
    open_type = 4,
    open_type_value = 5,
    position_des = 6,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_redpacket_gm_info")

        return t._raw[__key_map[k]]
    end
}


function redpacket_gm_info.getLength()
    return #redpacket_gm_info._data
end



function redpacket_gm_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_redpacket_gm_info
function redpacket_gm_info.indexOf(index)
    if index == nil or not redpacket_gm_info._data[index] then
        return nil
    end
    return setmetatable({_raw = redpacket_gm_info._data[index]}, m)
end



---
--@return @class record_redpacket_gm_info
function redpacket_gm_info.get(id)
    
    return redpacket_gm_info.indexOf(__index_id[ id ])
     
end



function redpacket_gm_info.set(id, key, value)
    local record = redpacket_gm_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function redpacket_gm_info.get_index_data()
    return __index_id 
end

return  redpacket_gm_info 