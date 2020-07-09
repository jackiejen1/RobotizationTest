---@classdef record_daily_task_active_degree_info
local record_daily_task_active_degree_info = {}


record_daily_task_active_degree_info.id = 0--编号
record_daily_task_active_degree_info.unlock_level = 0--开启等级
record_daily_task_active_degree_info.num = 0--目标活跃度
record_daily_task_active_degree_info.icon = 0--宝箱图标
record_daily_task_active_degree_info.reward_type_1 = 0--奖励类型1
record_daily_task_active_degree_info.reward_value_1 = 0--奖励类型值1
record_daily_task_active_degree_info.reward_size_1 = 0--奖励数量1
record_daily_task_active_degree_info.reward_type_2 = 0--奖励类型2
record_daily_task_active_degree_info.reward_value_2 = 0--奖励类型值2
record_daily_task_active_degree_info.reward_size_2 = 0--奖励数量2
record_daily_task_active_degree_info.reward_type_3 = 0--奖励类型3
record_daily_task_active_degree_info.reward_value_3 = 0--奖励类型值3
record_daily_task_active_degree_info.reward_size_3 = 0--奖励数量3
record_daily_task_active_degree_info.reward_type_4 = 0--奖励类型4
record_daily_task_active_degree_info.reward_value_4 = 0--奖励类型值4
record_daily_task_active_degree_info.reward_size_4 = 0--奖励数量4

local daily_task_active_degree_info = {
   _data = {   
    [1] = {101,1,30,1,3,1,2,0,0,0,0,0,0,0,0,0,},  
    [2] = {102,1,60,2,999,0,100,0,0,0,0,0,0,0,0,0,},  
    [3] = {103,1,90,3,3,6,1,0,0,0,0,0,0,0,0,0,},  
    [4] = {104,1,120,4,999,0,200,3,37,20,0,0,0,0,0,0,},  
    [5] = {105,35,40,1,3,1,2,0,0,0,0,0,0,0,0,0,},  
    [6] = {106,35,80,2,999,0,110,0,0,0,0,0,0,0,0,0,},  
    [7] = {107,35,120,3,3,6,1,0,0,0,0,0,0,0,0,0,},  
    [8] = {108,35,160,4,999,0,250,3,37,20,0,0,0,0,0,0,},  
    [9] = {109,48,50,1,3,1,2,0,0,0,0,0,0,0,0,0,},  
    [10] = {110,48,100,2,999,0,120,0,0,0,0,0,0,0,0,0,},  
    [11] = {111,48,160,3,3,6,1,3,37,20,0,0,0,0,0,0,},  
    [12] = {112,48,220,4,999,0,300,3,2036,10,0,0,0,0,0,0,},  
    [13] = {113,53,50,1,3,1,2,0,0,0,0,0,0,0,0,0,},  
    [14] = {114,53,110,2,999,0,120,3,37,20,0,0,0,0,0,0,},  
    [15] = {115,53,160,3,3,6,1,3,2036,10,0,0,0,0,0,0,},  
    [16] = {116,53,220,4,999,0,300,3,51,2,0,0,0,0,0,0,},  
    [17] = {117,65,60,1,3,1,4,0,0,0,0,0,0,0,0,0,},  
    [18] = {118,65,120,2,999,0,120,3,2036,10,0,0,0,0,0,0,},  
    [19] = {119,65,180,3,3,1,8,3,2328,1,0,0,0,0,0,0,},  
    [20] = {120,65,240,4,999,0,300,1,37,100,0,0,0,0,0,0,},  
    [21] = {121,85,70,1,3,1,5,0,0,0,0,0,0,0,0,0,},  
    [22] = {122,85,140,2,999,0,150,3,2036,15,0,0,0,0,0,0,},  
    [23] = {123,85,210,3,3,1,10,3,2328,1,0,0,0,0,0,0,},  
    [24] = {124,85,280,4,999,0,400,1,37,120,0,0,0,0,0,0,},
    }
}

local __index_id = {   
    [101] = 1,  
    [102] = 2,  
    [103] = 3,  
    [104] = 4,  
    [105] = 5,  
    [106] = 6,  
    [107] = 7,  
    [108] = 8,  
    [109] = 9,  
    [110] = 10,  
    [111] = 11,  
    [112] = 12,  
    [113] = 13,  
    [114] = 14,  
    [115] = 15,  
    [116] = 16,  
    [117] = 17,  
    [118] = 18,  
    [119] = 19,  
    [120] = 20,  
    [121] = 21,  
    [122] = 22,  
    [123] = 23,  
    [124] = 24,
}

local __key_map = { 
    id = 1,
    unlock_level = 2,
    num = 3,
    icon = 4,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_daily_task_active_degree_info")

        return t._raw[__key_map[k]]
    end
}


function daily_task_active_degree_info.getLength()
    return #daily_task_active_degree_info._data
end



function daily_task_active_degree_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_daily_task_active_degree_info
function daily_task_active_degree_info.indexOf(index)
    if index == nil or not daily_task_active_degree_info._data[index] then
        return nil
    end
    return setmetatable({_raw = daily_task_active_degree_info._data[index]}, m)
end



---
--@return @class record_daily_task_active_degree_info
function daily_task_active_degree_info.get(id)
    
    return daily_task_active_degree_info.indexOf(__index_id[ id ])
     
end



function daily_task_active_degree_info.set(id, key, value)
    local record = daily_task_active_degree_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function daily_task_active_degree_info.get_index_data()
    return __index_id 
end

return  daily_task_active_degree_info 