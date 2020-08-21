---@classdef record_activity_lucky_reward_info
local record_activity_lucky_reward_info = {}


record_activity_lucky_reward_info.group = 0--奖励组
record_activity_lucky_reward_info.id = 0--id
record_activity_lucky_reward_info.big_reward = 0--是否是大奖
record_activity_lucky_reward_info.lucky_type = 0--奖励类型
record_activity_lucky_reward_info.lucky_value = 0--奖励类型值
record_activity_lucky_reward_info.lucky_size = 0--奖励数量
record_activity_lucky_reward_info.pro = 0--权重

local activity_lucky_reward_info = {
   _data = {   
    [1] = {90006,1,1,3,2385,30,1000,},  
    [2] = {90006,2,0,999,0,1888,1000,},  
    [3] = {90006,3,0,999,0,2888,1000,},  
    [4] = {90006,4,0,3,2385,10,1000,},  
    [5] = {90006,5,0,3,2385,15,1000,},  
    [6] = {90006,6,0,3,2385,5,1000,},
    }
}

local __index_group_id = {   
    ["90006_1"] = 1,  
    ["90006_2"] = 2,  
    ["90006_3"] = 3,  
    ["90006_4"] = 4,  
    ["90006_5"] = 5,  
    ["90006_6"] = 6,
}

local __key_map = { 
    group = 1,
    id = 2,
    big_reward = 3,
    lucky_type = 4,
    lucky_value = 5,
    lucky_size = 6,
    pro = 7,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_activity_lucky_reward_info")

        return t._raw[__key_map[k]]
    end
}


function activity_lucky_reward_info.getLength()
    return #activity_lucky_reward_info._data
end



function activity_lucky_reward_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_activity_lucky_reward_info
function activity_lucky_reward_info.indexOf(index)
    if index == nil or not activity_lucky_reward_info._data[index] then
        return nil
    end
    return setmetatable({_raw = activity_lucky_reward_info._data[index]}, m)
end



---
--@return @class record_activity_lucky_reward_info
function activity_lucky_reward_info.get(group,id)
    
    local k = group .. '_' .. id
    return activity_lucky_reward_info.indexOf(__index_group_id[k])
     
end



function activity_lucky_reward_info.set(group,id, key, value)
    local record = activity_lucky_reward_info.get(group,id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function activity_lucky_reward_info.get_index_data()
    return __index_group_id 
end

return  activity_lucky_reward_info 