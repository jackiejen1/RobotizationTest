---@classdef record_month_card_active_info
local record_month_card_active_info = {}


record_month_card_active_info.id = 0--id
record_month_card_active_info.next_id = 0--下一ID
record_month_card_active_info.num = 0--节点
record_month_card_active_info.reward = 0--宝箱

local month_card_active_info = {
   _data = {   
    [1] = {1,2,10,2368,},  
    [2] = {2,3,20,2369,},  
    [3] = {3,4,30,2370,},  
    [4] = {4,0,45,2371,},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [3] = 3,  
    [4] = 4,
}

local __key_map = { 
    id = 1,
    next_id = 2,
    num = 3,
    reward = 4,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_month_card_active_info")

        return t._raw[__key_map[k]]
    end
}


function month_card_active_info.getLength()
    return #month_card_active_info._data
end



function month_card_active_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_month_card_active_info
function month_card_active_info.indexOf(index)
    if index == nil or not month_card_active_info._data[index] then
        return nil
    end
    return setmetatable({_raw = month_card_active_info._data[index]}, m)
end



---
--@return @class record_month_card_active_info
function month_card_active_info.get(id)
    
    return month_card_active_info.indexOf(__index_id[ id ])
     
end



function month_card_active_info.set(id, key, value)
    local record = month_card_active_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function month_card_active_info.get_index_data()
    return __index_id 
end

return  month_card_active_info 