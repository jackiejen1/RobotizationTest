---@classdef record_exchange_group_info
local record_exchange_group_info = {}


record_exchange_group_info.id = 0--id
record_exchange_group_info.group = 0--材料组
record_exchange_group_info.exchange_type = 0--物品类型
record_exchange_group_info.exchange_value = 0--物品类型值
record_exchange_group_info.unit_price = 0--物品单价
record_exchange_group_info.limit_type = 0--限制类型
record_exchange_group_info.limit_value = 0--限制类型

local exchange_group_info = {
   _data = {   
    [1] = {101,1,1,3,1,1,120,},  
    [2] = {102,1,1,16,1000,1,120,},  
    [3] = {103,1,3,21,150000,1,120,},  
    [4] = {104,1,3,22,250000,1,120,},  
    [5] = {201,2,3,35,1500,1,120,},
    }
}

local __index_id = {   
    [101] = 1,  
    [102] = 2,  
    [103] = 3,  
    [104] = 4,  
    [201] = 5,
}

local __key_map = { 
    id = 1,
    group = 2,
    exchange_type = 3,
    exchange_value = 4,
    unit_price = 5,
    limit_type = 6,
    limit_value = 7,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_exchange_group_info")

        return t._raw[__key_map[k]]
    end
}


function exchange_group_info.getLength()
    return #exchange_group_info._data
end



function exchange_group_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_exchange_group_info
function exchange_group_info.indexOf(index)
    if index == nil or not exchange_group_info._data[index] then
        return nil
    end
    return setmetatable({_raw = exchange_group_info._data[index]}, m)
end



---
--@return @class record_exchange_group_info
function exchange_group_info.get(id)
    
    return exchange_group_info.indexOf(__index_id[ id ])
     
end



function exchange_group_info.set(id, key, value)
    local record = exchange_group_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function exchange_group_info.get_index_data()
    return __index_id 
end

return  exchange_group_info 