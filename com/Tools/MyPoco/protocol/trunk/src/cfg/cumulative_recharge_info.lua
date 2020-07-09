---@classdef record_cumulative_recharge_info
local record_cumulative_recharge_info = {}


record_cumulative_recharge_info.id = 0--ID
record_cumulative_recharge_info.sub_id = 0--子id
record_cumulative_recharge_info.number = 0--累计充值的额度
record_cumulative_recharge_info.drop_type = 0--掉落类型
record_cumulative_recharge_info.reward_type_1 = 0--奖励道具类型1
record_cumulative_recharge_info.reward_value_1 = 0--奖励道具值1
record_cumulative_recharge_info.reward_size_1 = 0--奖励道具数量1
record_cumulative_recharge_info.reward_type_2 = 0--奖励道具类型2
record_cumulative_recharge_info.reward_value_2 = 0--奖励道具值2
record_cumulative_recharge_info.reward_size_2 = 0--奖励道具数量2
record_cumulative_recharge_info.reward_type_3 = 0--奖励道具类型3
record_cumulative_recharge_info.reward_value_3 = 0--奖励道具值3
record_cumulative_recharge_info.reward_size_3 = 0--奖励道具数量3
record_cumulative_recharge_info.reward_type_4 = 0--奖励道具类型4
record_cumulative_recharge_info.reward_value_4 = 0--奖励道具值4
record_cumulative_recharge_info.reward_size_4 = 0--奖励道具数量4

local cumulative_recharge_info = {
   _data = { 
    }
}

local __index_id_sub_id = { 
}

local __key_map = { 
    id = 1,
    sub_id = 2,
    number = 3,
    drop_type = 4,
    reward_type_1 = 5,
    reward_value_1 = 6,
    reward_size_1 = 7,
    reward_type_2 = 8,
    reward_value_2 = 9,
    reward_size_2 = 10,
    reward_type_3 = 11,
    reward_value_3 = 12,
    reward_size_3 = 13,
    reward_type_4 = 14,
    reward_value_4 = 15,
    reward_size_4 = 16,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_cumulative_recharge_info")

        return t._raw[__key_map[k]]
    end
}


function cumulative_recharge_info.getLength()
    return #cumulative_recharge_info._data
end



function cumulative_recharge_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_cumulative_recharge_info
function cumulative_recharge_info.indexOf(index)
    if index == nil or not cumulative_recharge_info._data[index] then
        return nil
    end
    return setmetatable({_raw = cumulative_recharge_info._data[index]}, m)
end



---
--@return @class record_cumulative_recharge_info
function cumulative_recharge_info.get(id,sub_id)
    
    local k = id .. '_' .. sub_id
    return cumulative_recharge_info.indexOf(__index_id_sub_id[k])
     
end



function cumulative_recharge_info.set(id,sub_id, key, value)
    local record = cumulative_recharge_info.get(id,sub_id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function cumulative_recharge_info.get_index_data()
    return __index_id_sub_id 
end

return  cumulative_recharge_info 