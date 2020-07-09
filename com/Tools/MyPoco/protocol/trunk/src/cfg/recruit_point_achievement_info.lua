---@classdef record_recruit_point_achievement_info
local record_recruit_point_achievement_info = {}


record_recruit_point_achievement_info.id = 0--编号
record_recruit_point_achievement_info.num = 0--目标积分
record_recruit_point_achievement_info.reward_type_1 = 0--奖励类型1
record_recruit_point_achievement_info.reward_value_1 = 0--奖励类型值1
record_recruit_point_achievement_info.reward_size_1 = 0--奖励数量1
record_recruit_point_achievement_info.reward_type_2 = 0--奖励类型2
record_recruit_point_achievement_info.reward_value_2 = 0--奖励类型值2
record_recruit_point_achievement_info.reward_size_2 = 0--奖励数量2
record_recruit_point_achievement_info.reward_type_3 = 0--奖励类型3
record_recruit_point_achievement_info.reward_value_3 = 0--奖励类型值3
record_recruit_point_achievement_info.reward_size_3 = 0--奖励数量3
record_recruit_point_achievement_info.reward_type_4 = 0--奖励类型4
record_recruit_point_achievement_info.reward_value_4 = 0--奖励类型值4
record_recruit_point_achievement_info.reward_size_4 = 0--奖励数量4

local recruit_point_achievement_info = {
   _data = {   
    [1] = {1,150,3,2038,10,0,0,0,0,0,0,0,0,0,},  
    [2] = {2,350,3,2038,10,0,0,0,0,0,0,0,0,0,},  
    [3] = {3,700,3,2038,10,0,0,0,0,0,0,0,0,0,},  
    [4] = {4,1100,3,2038,15,0,0,0,0,0,0,0,0,0,},  
    [5] = {5,1500,3,2038,15,0,0,0,0,0,0,0,0,0,},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [3] = 3,  
    [4] = 4,  
    [5] = 5,
}

local __key_map = { 
    id = 1,
    num = 2,
    reward_type_1 = 3,
    reward_value_1 = 4,
    reward_size_1 = 5,
    reward_type_2 = 6,
    reward_value_2 = 7,
    reward_size_2 = 8,
    reward_type_3 = 9,
    reward_value_3 = 10,
    reward_size_3 = 11,
    reward_type_4 = 12,
    reward_value_4 = 13,
    reward_size_4 = 14,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_recruit_point_achievement_info")

        return t._raw[__key_map[k]]
    end
}


function recruit_point_achievement_info.getLength()
    return #recruit_point_achievement_info._data
end



function recruit_point_achievement_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_recruit_point_achievement_info
function recruit_point_achievement_info.indexOf(index)
    if index == nil or not recruit_point_achievement_info._data[index] then
        return nil
    end
    return setmetatable({_raw = recruit_point_achievement_info._data[index]}, m)
end



---
--@return @class record_recruit_point_achievement_info
function recruit_point_achievement_info.get(id)
    
    return recruit_point_achievement_info.indexOf(__index_id[ id ])
     
end



function recruit_point_achievement_info.set(id, key, value)
    local record = recruit_point_achievement_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function recruit_point_achievement_info.get_index_data()
    return __index_id 
end

return  recruit_point_achievement_info 