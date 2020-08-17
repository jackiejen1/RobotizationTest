---@classdef record_back_reward_info
local record_back_reward_info = {}


record_back_reward_info.id = 0--ID
record_back_reward_info.activity_id = 0--活动id
record_back_reward_info.activity_name =  ""--活动名称
record_back_reward_info.activity_type = 0--任务类型
record_back_reward_info.name =  ""--任务名称
record_back_reward_info.require_type = 0--任务要求类型
record_back_reward_info.require_value = 0--任务要求类型值
record_back_reward_info.vip_exp = 0--返还VIP经验比例
record_back_reward_info.reward_type_1 = 0--奖励1类型
record_back_reward_info.reward_value_1 = 0--奖励1类型值
record_back_reward_info.reward_size_1 = 0--奖励1数量
record_back_reward_info.reward_type_2 = 0--奖励2类型
record_back_reward_info.reward_value_2 = 0--奖励2类型值
record_back_reward_info.reward_size_2 = 0--奖励2数量
record_back_reward_info.reward_type_3 = 0--奖励3类型
record_back_reward_info.reward_value_3 = 0--奖励3类型值
record_back_reward_info.reward_size_3 = 0--奖励3数量
record_back_reward_info.reward_type_4 = 0--奖励4类型
record_back_reward_info.reward_value_4 = 0--奖励4类型值
record_back_reward_info.reward_size_4 = 0--奖励4数量
record_back_reward_info.route_id = 0--跳转路径

local back_reward_info = {
   _data = {   
    [1] = {1,100001,"召回新服第1期",1,"等级达到10级",1,10,300,0,0,0,0,0,0,0,0,0,0,0,0,2,},  
    [2] = {2,100001,"召回新服第1期",1,"等级达到20级",1,20,100,0,0,0,0,0,0,0,0,0,0,0,0,2,},  
    [3] = {3,100001,"召回新服第1期",1,"等级达到30级",1,30,100,0,0,0,0,0,0,0,0,0,0,0,0,2,},  
    [4] = {4,100001,"召回新服第1期",1,"等级达到40级",1,40,200,0,0,0,0,0,0,0,0,0,0,0,0,2,},  
    [5] = {5,100001,"召回新服第1期",1,"等级达到50级",1,50,300,0,0,0,0,0,0,0,0,0,0,0,0,2,},  
    [6] = {6,100001,"召回新服第1期",2,"累计登录1天",1076,1,0,3,6,3,3,2,150,1,2,300,0,0,0,0,},  
    [7] = {7,100001,"召回新服第1期",2,"累计登录2天",1076,2,0,999,0,888,3,22,20,0,0,0,0,0,0,0,},  
    [8] = {8,100001,"召回新服第1期",2,"累计登录3天",1076,3,0,3,2004,5,3,15,50,0,0,0,0,0,0,0,},  
    [9] = {9,100001,"召回新服第1期",2,"累计登录4天",1076,4,0,3,2008,5,8,13030,10,0,0,0,0,0,0,0,},  
    [10] = {10,100001,"召回新服第1期",2,"累计登录5天",1076,5,0,999,0,1288,9,115,1,3,156,1,0,0,0,0,},  
    [11] = {11,100002,"召回新服第2期",1,"等级达到10级",1,10,300,0,0,0,0,0,0,0,0,0,0,0,0,2,},  
    [12] = {12,100002,"召回新服第2期",1,"等级达到20级",1,20,100,0,0,0,0,0,0,0,0,0,0,0,0,2,},  
    [13] = {13,100002,"召回新服第2期",1,"等级达到30级",1,30,100,0,0,0,0,0,0,0,0,0,0,0,0,2,},  
    [14] = {14,100002,"召回新服第2期",1,"等级达到40级",1,40,200,0,0,0,0,0,0,0,0,0,0,0,0,2,},  
    [15] = {15,100002,"召回新服第2期",1,"等级达到50级",1,50,300,0,0,0,0,0,0,0,0,0,0,0,0,2,},  
    [16] = {16,100002,"召回新服第2期",2,"累计登录1天",1076,1,0,3,6,3,3,2,150,1,2,300,0,0,0,0,},  
    [17] = {17,100002,"召回新服第2期",2,"累计登录2天",1076,2,0,999,0,888,3,22,20,0,0,0,0,0,0,0,},  
    [18] = {18,100002,"召回新服第2期",2,"累计登录3天",1076,3,0,3,2004,5,3,15,50,0,0,0,0,0,0,0,},  
    [19] = {19,100002,"召回新服第2期",2,"累计登录4天",1076,4,0,3,2008,5,8,13030,10,0,0,0,0,0,0,0,},  
    [20] = {20,100002,"召回新服第2期",2,"累计登录5天",1076,5,0,999,0,1288,9,115,1,3,156,1,0,0,0,0,},  
    [21] = {21,100002,"召回新服第2期",2,"等级达到10级",1,10,0,999,0,2000,0,0,0,0,0,0,0,0,0,2,},  
    [22] = {22,100002,"召回新服第2期",2,"等级达到20级",1,20,0,999,0,2000,0,0,0,0,0,0,0,0,0,2,},  
    [23] = {23,100002,"召回新服第2期",2,"等级达到30级",1,30,0,999,0,3000,0,0,0,0,0,0,0,0,0,2,},  
    [24] = {24,100002,"召回新服第2期",2,"等级达到40级",1,40,0,999,0,3000,0,0,0,0,0,0,0,0,0,2,},  
    [25] = {25,100002,"召回新服第2期",2,"等级达到50级",1,50,0,999,0,5000,0,0,0,0,0,0,0,0,0,2,},
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
}

local __key_map = { 
    id = 1,
    activity_id = 2,
    activity_name = 3,
    activity_type = 4,
    name = 5,
    require_type = 6,
    require_value = 7,
    vip_exp = 8,
    reward_type_1 = 9,
    reward_value_1 = 10,
    reward_size_1 = 11,
    reward_type_2 = 12,
    reward_value_2 = 13,
    reward_size_2 = 14,
    reward_type_3 = 15,
    reward_value_3 = 16,
    reward_size_3 = 17,
    reward_type_4 = 18,
    reward_value_4 = 19,
    reward_size_4 = 20,
    route_id = 21,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_back_reward_info")

        return t._raw[__key_map[k]]
    end
}


function back_reward_info.getLength()
    return #back_reward_info._data
end



function back_reward_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_back_reward_info
function back_reward_info.indexOf(index)
    if index == nil or not back_reward_info._data[index] then
        return nil
    end
    return setmetatable({_raw = back_reward_info._data[index]}, m)
end



---
--@return @class record_back_reward_info
function back_reward_info.get(id)
    
    return back_reward_info.indexOf(__index_id[ id ])
     
end



function back_reward_info.set(id, key, value)
    local record = back_reward_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function back_reward_info.get_index_data()
    return __index_id 
end

return  back_reward_info 