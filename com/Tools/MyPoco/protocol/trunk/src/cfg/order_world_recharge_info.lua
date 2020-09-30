---@classdef record_order_world_recharge_info
local record_order_world_recharge_info = {}


record_order_world_recharge_info.id = 0--id
record_order_world_recharge_info.amount = 0--充值金额
record_order_world_recharge_info.limit = 0--充值次数限制
record_order_world_recharge_info.refresh = 0--刷新
record_order_world_recharge_info.reward_type_1 = 0--奖励类型1
record_order_world_recharge_info.reward_value_1 = 0--奖励值1
record_order_world_recharge_info.reward_size_1 = 0--奖励数量1
record_order_world_recharge_info.reward_type_2 = 0--奖励类型2
record_order_world_recharge_info.reward_value_2 = 0--奖励值2
record_order_world_recharge_info.reward_size_2 = 0--奖励数量2

local order_world_recharge_info = {
   _data = {   
    [1] = {1,6,1,1,999,0,288,3,99,5,},  
    [2] = {2,30,2,1,999,0,488,3,99,10,},  
    [3] = {3,98,3,2,999,0,980,3,99,25,},  
    [4] = {4,198,6,2,999,0,1980,3,99,45,},  
    [5] = {5,328,9,2,999,0,3280,3,99,70,},  
    [6] = {6,648,0,2,999,0,6480,3,99,140,},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [3] = 3,  
    [4] = 4,  
    [5] = 5,  
    [6] = 6,
}

local __key_map = { 
    id = 1,
    amount = 2,
    limit = 3,
    refresh = 4,
    reward_type_1 = 5,
    reward_value_1 = 6,
    reward_size_1 = 7,
    reward_type_2 = 8,
    reward_value_2 = 9,
    reward_size_2 = 10,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_order_world_recharge_info")

        return t._raw[__key_map[k]]
    end
}


function order_world_recharge_info.getLength()
    return #order_world_recharge_info._data
end



function order_world_recharge_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_order_world_recharge_info
function order_world_recharge_info.indexOf(index)
    if index == nil or not order_world_recharge_info._data[index] then
        return nil
    end
    return setmetatable({_raw = order_world_recharge_info._data[index]}, m)
end



---
--@return @class record_order_world_recharge_info
function order_world_recharge_info.get(id)
    
    return order_world_recharge_info.indexOf(__index_id[ id ])
     
end



function order_world_recharge_info.set(id, key, value)
    local record = order_world_recharge_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function order_world_recharge_info.get_index_data()
    return __index_id 
end

return  order_world_recharge_info 