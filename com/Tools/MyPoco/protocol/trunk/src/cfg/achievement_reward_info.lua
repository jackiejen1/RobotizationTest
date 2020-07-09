---@classdef record_achievement_reward_info
local record_achievement_reward_info = {}


record_achievement_reward_info.id = 0--编号
record_achievement_reward_info.num = 0--目标成就点
record_achievement_reward_info.icon = 0--宝箱图标
record_achievement_reward_info.next_id = 0--下一成就奖励
record_achievement_reward_info.reward_type_1 = 0--奖励类型1
record_achievement_reward_info.reward_value_1 = 0--奖励类型值1
record_achievement_reward_info.reward_size_1 = 0--奖励数量1
record_achievement_reward_info.reward_type_2 = 0--奖励类型2
record_achievement_reward_info.reward_value_2 = 0--奖励类型值2
record_achievement_reward_info.reward_size_2 = 0--奖励数量2
record_achievement_reward_info.reward_type_3 = 0--奖励类型3
record_achievement_reward_info.reward_value_3 = 0--奖励类型值3
record_achievement_reward_info.reward_size_3 = 0--奖励数量3
record_achievement_reward_info.reward_type_4 = 0--奖励类型4
record_achievement_reward_info.reward_value_4 = 0--奖励类型值4
record_achievement_reward_info.reward_size_4 = 0--奖励数量4

local achievement_reward_info = {
   _data = {   
    [1] = {1,10,1,2,999,0,100,1,3,20000,0,0,0,0,0,0,},  
    [2] = {2,30,1,3,999,0,100,1,3,40000,0,0,0,0,0,0,},  
    [3] = {3,60,1,4,999,0,100,1,3,60000,0,0,0,0,0,0,},  
    [4] = {4,100,1,5,999,0,100,1,3,80000,0,0,0,0,0,0,},  
    [5] = {5,150,1,6,999,0,150,1,3,100000,0,0,0,0,0,0,},  
    [6] = {6,200,1,7,999,0,150,1,3,150000,0,0,0,0,0,0,},  
    [7] = {7,260,1,8,999,0,150,1,3,200000,0,0,0,0,0,0,},  
    [8] = {8,330,1,9,999,0,150,1,3,300000,0,0,0,0,0,0,},  
    [9] = {9,400,1,10,999,0,150,1,3,400000,0,0,0,0,0,0,},  
    [10] = {10,480,1,11,999,0,150,1,3,500000,0,0,0,0,0,0,},  
    [11] = {11,560,1,12,999,0,200,1,3,600000,0,0,0,0,0,0,},  
    [12] = {12,640,1,13,999,0,200,1,3,700000,0,0,0,0,0,0,},  
    [13] = {13,720,1,14,999,0,200,1,3,800000,0,0,0,0,0,0,},  
    [14] = {14,800,1,15,999,0,200,1,3,900000,0,0,0,0,0,0,},  
    [15] = {15,880,1,16,999,0,200,1,3,1000000,0,0,0,0,0,0,},  
    [16] = {16,960,1,17,999,0,200,1,3,1100000,0,0,0,0,0,0,},  
    [17] = {17,1040,1,18,999,0,200,1,3,1200000,0,0,0,0,0,0,},  
    [18] = {18,1120,1,19,999,0,200,1,3,1300000,0,0,0,0,0,0,},  
    [19] = {19,1200,1,20,999,0,300,1,3,1400000,0,0,0,0,0,0,},  
    [20] = {20,1300,1,21,999,0,300,1,3,1500000,0,0,0,0,0,0,},  
    [21] = {21,1400,1,22,999,0,300,1,3,1600000,0,0,0,0,0,0,},  
    [22] = {22,1500,1,23,999,0,300,1,3,1700000,0,0,0,0,0,0,},  
    [23] = {23,1600,1,24,999,0,300,1,3,1800000,0,0,0,0,0,0,},  
    [24] = {24,1700,1,25,999,0,300,1,3,1900000,0,0,0,0,0,0,},  
    [25] = {25,1850,1,26,999,0,300,1,3,2000000,0,0,0,0,0,0,},  
    [26] = {26,2000,1,27,999,0,300,1,3,2100000,0,0,0,0,0,0,},  
    [27] = {27,2150,1,28,999,0,300,1,3,2200000,0,0,0,0,0,0,},  
    [28] = {28,2300,1,29,999,0,300,1,3,2300000,0,0,0,0,0,0,},  
    [29] = {29,2450,1,30,999,0,300,1,3,2400000,0,0,0,0,0,0,},  
    [30] = {30,2600,1,31,999,0,500,1,3,2500000,0,0,0,0,0,0,},  
    [31] = {31,2800,1,32,999,0,500,1,3,2600000,0,0,0,0,0,0,},  
    [32] = {32,3000,1,33,999,0,500,1,3,2700000,0,0,0,0,0,0,},  
    [33] = {33,3200,1,34,999,0,500,1,3,2800000,0,0,0,0,0,0,},  
    [34] = {34,3400,1,35,999,0,500,1,3,2900000,0,0,0,0,0,0,},  
    [35] = {35,3600,1,36,999,0,500,1,3,3000000,0,0,0,0,0,0,},  
    [36] = {36,3800,1,37,999,0,500,1,3,3100000,0,0,0,0,0,0,},  
    [37] = {37,4000,1,38,999,0,500,1,3,3200000,0,0,0,0,0,0,},  
    [38] = {38,4200,1,39,999,0,500,1,3,3300000,0,0,0,0,0,0,},  
    [39] = {39,4400,1,0,999,0,500,1,3,3400000,0,0,0,0,0,0,},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [3] = 3,  
    [4] = 4,  
    [5] = 5,  
    [6] = 6,  
    [7] = 7,  
    [8] = 8,  
    [9] = 9,  
    [10] = 10,  
    [11] = 11,  
    [12] = 12,  
    [13] = 13,  
    [14] = 14,  
    [15] = 15,  
    [16] = 16,  
    [17] = 17,  
    [18] = 18,  
    [19] = 19,  
    [20] = 20,  
    [21] = 21,  
    [22] = 22,  
    [23] = 23,  
    [24] = 24,  
    [25] = 25,  
    [26] = 26,  
    [27] = 27,  
    [28] = 28,  
    [29] = 29,  
    [30] = 30,  
    [31] = 31,  
    [32] = 32,  
    [33] = 33,  
    [34] = 34,  
    [35] = 35,  
    [36] = 36,  
    [37] = 37,  
    [38] = 38,  
    [39] = 39,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_achievement_reward_info")

        return t._raw[__key_map[k]]
    end
}


function achievement_reward_info.getLength()
    return #achievement_reward_info._data
end



function achievement_reward_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_achievement_reward_info
function achievement_reward_info.indexOf(index)
    if index == nil or not achievement_reward_info._data[index] then
        return nil
    end
    return setmetatable({_raw = achievement_reward_info._data[index]}, m)
end



---
--@return @class record_achievement_reward_info
function achievement_reward_info.get(id)
    
    return achievement_reward_info.indexOf(__index_id[ id ])
     
end



function achievement_reward_info.set(id, key, value)
    local record = achievement_reward_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function achievement_reward_info.get_index_data()
    return __index_id 
end

return  achievement_reward_info 