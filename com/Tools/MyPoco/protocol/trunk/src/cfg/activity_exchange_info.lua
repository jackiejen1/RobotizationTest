---@classdef record_activity_exchange_info
local record_activity_exchange_info = {}


record_activity_exchange_info.id = 0--ID
record_activity_exchange_info.sub_id = 0--子id
record_activity_exchange_info.drop_type = 0--掉落类型
record_activity_exchange_info.reward_type_1 = 0--兑换道具类型1
record_activity_exchange_info.reward_value_1 = 0--兑换道具值1
record_activity_exchange_info.reward_size_1 = 0--兑换道具数量1
record_activity_exchange_info.reward_type_2 = 0--兑换道具类型2
record_activity_exchange_info.reward_value_2 = 0--兑换道具值2
record_activity_exchange_info.reward_size_2 = 0--兑换道具数量2
record_activity_exchange_info.reward_type_3 = 0--兑换道具类型3
record_activity_exchange_info.reward_value_3 = 0--兑换道具值3
record_activity_exchange_info.reward_size_3 = 0--兑换道具数量3
record_activity_exchange_info.reward_type_4 = 0--兑换道具类型4
record_activity_exchange_info.reward_value_4 = 0--兑换道具值4
record_activity_exchange_info.reward_size_4 = 0--兑换道具数量4
record_activity_exchange_info.cost_type_1 = 0--消耗道具类型1
record_activity_exchange_info.cost_value_1 = 0--消耗道具值1
record_activity_exchange_info.cost_size_1 = 0--消耗道具数量1
record_activity_exchange_info.cost_type_2 = 0--消耗道具类型2
record_activity_exchange_info.cost_value_2 = 0--消耗道具值2
record_activity_exchange_info.cost_size_2 = 0--消耗道具数量2
record_activity_exchange_info.cost_type_3 = 0--消耗道具类型3
record_activity_exchange_info.cost_value_3 = 0--消耗道具值3
record_activity_exchange_info.cost_size_3 = 0--消耗道具数量3
record_activity_exchange_info.buy_num = 0--限制次数
record_activity_exchange_info.discount = 0--折扣

local activity_exchange_info = {
   _data = { 
    }
}

local __index_id_sub_id = { 
}

local __key_map = { 
    id = 1,
    sub_id = 2,
    drop_type = 3,
    reward_type_1 = 4,
    reward_value_1 = 5,
    reward_size_1 = 6,
    reward_type_2 = 7,
    reward_value_2 = 8,
    reward_size_2 = 9,
    reward_type_3 = 10,
    reward_value_3 = 11,
    reward_size_3 = 12,
    reward_type_4 = 13,
    reward_value_4 = 14,
    reward_size_4 = 15,
    cost_type_1 = 16,
    cost_value_1 = 17,
    cost_size_1 = 18,
    cost_type_2 = 19,
    cost_value_2 = 20,
    cost_size_2 = 21,
    cost_type_3 = 22,
    cost_value_3 = 23,
    cost_size_3 = 24,
    buy_num = 25,
    discount = 26,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_activity_exchange_info")

        return t._raw[__key_map[k]]
    end
}


function activity_exchange_info.getLength()
    return #activity_exchange_info._data
end



function activity_exchange_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_activity_exchange_info
function activity_exchange_info.indexOf(index)
    if index == nil or not activity_exchange_info._data[index] then
        return nil
    end
    return setmetatable({_raw = activity_exchange_info._data[index]}, m)
end



---
--@return @class record_activity_exchange_info
function activity_exchange_info.get(id,sub_id)
    
    local k = id .. '_' .. sub_id
    return activity_exchange_info.indexOf(__index_id_sub_id[k])
     
end



function activity_exchange_info.set(id,sub_id, key, value)
    local record = activity_exchange_info.get(id,sub_id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function activity_exchange_info.get_index_data()
    return __index_id_sub_id 
end

return  activity_exchange_info 