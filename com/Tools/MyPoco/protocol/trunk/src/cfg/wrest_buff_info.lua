---@classdef record_wrest_buff_info
local record_wrest_buff_info = {}


record_wrest_buff_info.id = 0--id
record_wrest_buff_info.buff_type = 0--类型
record_wrest_buff_info.buff_value = 0--buff值
record_wrest_buff_info.icon = 0--图标
record_wrest_buff_info.buff_des =  ""--描述

local wrest_buff_info = {
   _data = {   
    [1] = {1,1,30,101,"产量增加+30%",},  
    [2] = {2,1,100,101,"产量增加+100%",},  
    [3] = {3,3,50,101,"攻击消耗减少50%",},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [3] = 3,
}

local __key_map = { 
    id = 1,
    buff_type = 2,
    buff_value = 3,
    icon = 4,
    buff_des = 5,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_wrest_buff_info")

        return t._raw[__key_map[k]]
    end
}


function wrest_buff_info.getLength()
    return #wrest_buff_info._data
end



function wrest_buff_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_wrest_buff_info
function wrest_buff_info.indexOf(index)
    if index == nil or not wrest_buff_info._data[index] then
        return nil
    end
    return setmetatable({_raw = wrest_buff_info._data[index]}, m)
end



---
--@return @class record_wrest_buff_info
function wrest_buff_info.get(id)
    
    return wrest_buff_info.indexOf(__index_id[ id ])
     
end



function wrest_buff_info.set(id, key, value)
    local record = wrest_buff_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function wrest_buff_info.get_index_data()
    return __index_id 
end

return  wrest_buff_info 