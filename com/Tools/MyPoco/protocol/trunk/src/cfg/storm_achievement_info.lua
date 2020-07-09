---@classdef record_storm_achievement_info
local record_storm_achievement_info = {}


record_storm_achievement_info.id = 0--编号
record_storm_achievement_info.num = 0--目标统治力
record_storm_achievement_info.icon = 0--宝箱图标
record_storm_achievement_info.next_id = 0--下一成就奖励
record_storm_achievement_info.reward_type_1 = 0--奖励类型1
record_storm_achievement_info.reward_value_1 = 0--奖励类型值1
record_storm_achievement_info.reward_size_1 = 0--奖励数量1
record_storm_achievement_info.reward_type_2 = 0--奖励类型2
record_storm_achievement_info.reward_value_2 = 0--奖励类型值2
record_storm_achievement_info.reward_size_2 = 0--奖励数量2
record_storm_achievement_info.reward_type_3 = 0--奖励类型3
record_storm_achievement_info.reward_value_3 = 0--奖励类型值3
record_storm_achievement_info.reward_size_3 = 0--奖励数量3
record_storm_achievement_info.reward_type_4 = 0--奖励类型4
record_storm_achievement_info.reward_value_4 = 0--奖励类型值4
record_storm_achievement_info.reward_size_4 = 0--奖励数量4

local storm_achievement_info = {
   _data = {   
    [1] = {1,20,1,2,3,93,1,0,0,0,0,0,0,0,0,0,},  
    [2] = {2,50,1,3,3,95,1,0,0,0,0,0,0,0,0,0,},  
    [3] = {3,100,1,4,9,54,1,0,0,0,0,0,0,0,0,0,},  
    [4] = {4,180,1,5,3,94,1,0,0,0,0,0,0,0,0,0,},  
    [5] = {5,240,1,6,3,96,1,0,0,0,0,0,0,0,0,0,},  
    [6] = {6,300,1,0,9,55,1,0,0,0,0,0,0,0,0,0,},
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
    num = 2,
    icon = 3,
    next_id = 4,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_storm_achievement_info")

        return t._raw[__key_map[k]]
    end
}


function storm_achievement_info.getLength()
    return #storm_achievement_info._data
end



function storm_achievement_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_storm_achievement_info
function storm_achievement_info.indexOf(index)
    if index == nil or not storm_achievement_info._data[index] then
        return nil
    end
    return setmetatable({_raw = storm_achievement_info._data[index]}, m)
end



---
--@return @class record_storm_achievement_info
function storm_achievement_info.get(id)
    
    return storm_achievement_info.indexOf(__index_id[ id ])
     
end



function storm_achievement_info.set(id, key, value)
    local record = storm_achievement_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function storm_achievement_info.get_index_data()
    return __index_id 
end

return  storm_achievement_info 