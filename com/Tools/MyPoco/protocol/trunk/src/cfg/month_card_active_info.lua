---@classdef record_month_card_active_info
local record_month_card_active_info = {}


record_month_card_active_info.id = 0--id
record_month_card_active_info.next_id = 0--下一ID
record_month_card_active_info.num = 0--节点
record_month_card_active_info.reward_type_1 = 0--奖励1类型
record_month_card_active_info.reward_value_1 = 0--奖励1类型值
record_month_card_active_info.reward_size_1 = 0--奖励1数量
record_month_card_active_info.reward_type_2 = 0--奖励2类型
record_month_card_active_info.reward_value_2 = 0--奖励2类型值
record_month_card_active_info.reward_size_2 = 0--奖励2数量
record_month_card_active_info.reward_type_3 = 0--奖励3类型
record_month_card_active_info.reward_value_3 = 0--奖励3类型值
record_month_card_active_info.reward_size_3 = 0--奖励3数量
record_month_card_active_info.reward_type_4 = 0--奖励4类型
record_month_card_active_info.reward_value_4 = 0--奖励4类型值
record_month_card_active_info.reward_size_4 = 0--奖励4数量

local month_card_active_info = {
   _data = {   
    [1] = {1,2,10,999,0,1000,1,37,100,0,0,0,0,0,0,},  
    [2] = {2,3,20,999,0,1500,1,37,200,0,0,0,0,0,0,},  
    [3] = {3,4,30,999,0,2000,1,37,300,0,0,0,0,0,0,},  
    [4] = {4,0,45,999,0,3000,1,37,500,0,0,0,0,0,0,},
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