---@classdef record_exchange_info
local record_exchange_info = {}


record_exchange_info.id = 0--id
record_exchange_info.target_type = 0--目标类型
record_exchange_info.target_value = 0--目标类型值
record_exchange_info.unit_price = 0--目标单价
record_exchange_info.exchange_group1 = 0--兑换组1
record_exchange_info.exchange_group2 = 0--兑换组2
record_exchange_info.exchange_group3 = 0--兑换组3
record_exchange_info.exchange_group4 = 0--兑换组4

local exchange_info = {
   _data = {   
    [1] = {1,3,173,1000000,1,0,0,0,},  
    [2] = {2,3,204,1000000,2,0,0,0,},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,
}

local __key_map = { 
    id = 1,
    target_type = 2,
    target_value = 3,
    unit_price = 4,
    exchange_group1 = 5,
    exchange_group2 = 6,
    exchange_group3 = 7,
    exchange_group4 = 8,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_exchange_info")

        return t._raw[__key_map[k]]
    end
}


function exchange_info.getLength()
    return #exchange_info._data
end



function exchange_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_exchange_info
function exchange_info.indexOf(index)
    if index == nil or not exchange_info._data[index] then
        return nil
    end
    return setmetatable({_raw = exchange_info._data[index]}, m)
end



---
--@return @class record_exchange_info
function exchange_info.get(id)
    
    return exchange_info.indexOf(__index_id[ id ])
     
end



function exchange_info.set(id, key, value)
    local record = exchange_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function exchange_info.get_index_data()
    return __index_id 
end

return  exchange_info 