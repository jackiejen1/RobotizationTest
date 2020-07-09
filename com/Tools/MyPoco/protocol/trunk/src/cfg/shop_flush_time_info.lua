---@classdef record_shop_flush_time_info
local record_shop_flush_time_info = {}


record_shop_flush_time_info.id = 0--id
record_shop_flush_time_info.flush_id = 0--刷新ID
record_shop_flush_time_info.flush_type = 0--刷新类型
record_shop_flush_time_info.day = 0--天
record_shop_flush_time_info.hour = 0--小时

local shop_flush_time_info = {
   _data = {   
    [1] = {1,202,1,0,12,},
    }
}

local __index_id = {   
    [1] = 1,
}

local __key_map = { 
    id = 1,
    flush_id = 2,
    flush_type = 3,
    day = 4,
    hour = 5,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_shop_flush_time_info")

        return t._raw[__key_map[k]]
    end
}


function shop_flush_time_info.getLength()
    return #shop_flush_time_info._data
end



function shop_flush_time_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_shop_flush_time_info
function shop_flush_time_info.indexOf(index)
    if index == nil or not shop_flush_time_info._data[index] then
        return nil
    end
    return setmetatable({_raw = shop_flush_time_info._data[index]}, m)
end



---
--@return @class record_shop_flush_time_info
function shop_flush_time_info.get(id)
    
    return shop_flush_time_info.indexOf(__index_id[ id ])
     
end



function shop_flush_time_info.set(id, key, value)
    local record = shop_flush_time_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function shop_flush_time_info.get_index_data()
    return __index_id 
end

return  shop_flush_time_info 