---@classdef record_equipment_extract_time
local record_equipment_extract_time = {}


record_equipment_extract_time.id = 0--id
record_equipment_extract_time.task_type = 0--任务类型
record_equipment_extract_time.activity_id = 0--对应的活动id
record_equipment_extract_time.task_name =  ""--任务名称
record_equipment_extract_time.task_describe =  ""--任务描述
record_equipment_extract_time.task_describe1 =  ""--任务描述
record_equipment_extract_time.source_id = 0--跳转界面
record_equipment_extract_time.goal = 0--目标值
record_equipment_extract_time.refresh = 0--任务刷新
record_equipment_extract_time.frequency = 0--次数限制
record_equipment_extract_time.order = 0--排序
record_equipment_extract_time.reward_type1 = 0--奖励类型1
record_equipment_extract_time.reward_value1 = 0--奖励类型值1
record_equipment_extract_time.reward_size1 = 0--奖励数量1
record_equipment_extract_time.reward_type2 = 0--奖励类型2
record_equipment_extract_time.reward_value2 = 0--奖励类型值2
record_equipment_extract_time.reward_size2 = 0--奖励数量2
record_equipment_extract_time.reward_type3 = 0--奖励类型3
record_equipment_extract_time.reward_value3 = 0--奖励类型值3
record_equipment_extract_time.reward_size3 = 0--奖励数量3
record_equipment_extract_time.reward_type4 = 0--奖励类型4
record_equipment_extract_time.reward_value4 = 0--奖励类型值4
record_equipment_extract_time.reward_size4 = 0--奖励数量4

local equipment_extract_time = {
   _data = {   
    [1] = {1,1094,100001,"登录游戏","活动期间每天登录游戏可获得","0",0,1,1,1,1,3,53,3,0,0,0,0,0,0,0,0,0,},  
    [2] = {2,84,100001,"活跃有奖","活动期间当日活跃度达到#num#可获得","0",27,50,1,1,4,3,53,1,0,0,0,0,0,0,0,0,0,},  
    [3] = {3,3109,100001,"充值有礼","活动期间每充值#num#元可获得","(当前可领取#num2#次)",29,20,2,9999999,2,3,53,1,0,0,0,0,0,0,0,0,0,},  
    [4] = {4,3110,100001,"元宝购买","活动期间每消耗#num#元宝购买获得","(剩余#num2#次)",0,300,2,30,3,3,53,1,0,0,0,0,0,0,0,0,0,},  
    [5] = {5,84,100001,"活跃有奖","活动期间当日活跃度达到#num#可获得","0",27,100,1,1,5,3,53,1,0,0,0,0,0,0,0,0,0,},  
    [6] = {6,84,100001,"活跃有奖","活动期间当日活跃度达到#num#可获得","0",27,150,1,1,6,3,53,1,0,0,0,0,0,0,0,0,0,},  
    [7] = {7,1094,100002,"登录游戏","活动期间每天登录游戏可获得","0",0,1,1,1,1,3,53,3,0,0,0,0,0,0,0,0,0,},  
    [8] = {8,84,100002,"活跃有奖","活动期间当日活跃度达到#num#可获得","0",27,50,1,1,4,3,53,1,0,0,0,0,0,0,0,0,0,},  
    [9] = {9,3109,100002,"充值有礼","活动期间每充值#num#元可获得","(当前可领取#num2#次)",29,20,2,9999999,2,3,53,1,0,0,0,0,0,0,0,0,0,},  
    [10] = {10,3110,100002,"元宝购买","活动期间每消耗#num#元宝购买获得","(剩余#num2#次)",0,300,2,30,3,3,53,1,0,0,0,0,0,0,0,0,0,},  
    [11] = {11,84,100002,"活跃有奖","活动期间当日活跃度达到#num#可获得","0",27,100,1,1,5,3,53,1,0,0,0,0,0,0,0,0,0,},  
    [12] = {12,84,100002,"活跃有奖","活动期间当日活跃度达到#num#可获得","0",27,150,1,1,6,3,53,1,0,0,0,0,0,0,0,0,0,},  
    [13] = {13,1094,100003,"登录游戏","活动期间每天登录游戏可获得","0",0,1,1,1,1,3,53,3,0,0,0,0,0,0,0,0,0,},  
    [14] = {14,84,100003,"活跃有奖","活动期间当日活跃度达到#num#可获得","0",27,50,1,1,4,3,53,1,0,0,0,0,0,0,0,0,0,},  
    [15] = {15,3109,100003,"充值有礼","活动期间每充值#num#元可获得","(当前可领取#num2#次)",29,20,2,9999999,2,3,53,1,0,0,0,0,0,0,0,0,0,},  
    [16] = {16,3110,100003,"元宝购买","活动期间每消耗#num#元宝购买获得","(剩余#num2#次)",0,300,2,30,3,3,53,1,0,0,0,0,0,0,0,0,0,},  
    [17] = {17,84,100003,"活跃有奖","活动期间当日活跃度达到#num#可获得","0",27,100,1,1,5,3,53,1,0,0,0,0,0,0,0,0,0,},  
    [18] = {18,84,100003,"活跃有奖","活动期间当日活跃度达到#num#可获得","0",27,150,1,1,6,3,53,1,0,0,0,0,0,0,0,0,0,},  
    [19] = {19,1094,100004,"登录游戏","活动期间每天登录游戏可获得","0",0,1,1,1,1,3,53,3,0,0,0,0,0,0,0,0,0,},  
    [20] = {20,84,100004,"活跃有奖","活动期间当日活跃度达到#num#可获得","0",27,50,1,1,4,3,53,1,0,0,0,0,0,0,0,0,0,},  
    [21] = {21,3109,100004,"充值有礼","活动期间每充值#num#元可获得","(当前可领取#num2#次)",29,20,2,9999999,2,3,53,1,0,0,0,0,0,0,0,0,0,},  
    [22] = {22,3110,100004,"元宝购买","活动期间每消耗#num#元宝购买获得","(剩余#num2#次)",0,300,2,30,3,3,53,1,0,0,0,0,0,0,0,0,0,},  
    [23] = {23,84,100004,"活跃有奖","活动期间当日活跃度达到#num#可获得","0",27,100,1,1,5,3,53,1,0,0,0,0,0,0,0,0,0,},  
    [24] = {24,84,100004,"活跃有奖","活动期间当日活跃度达到#num#可获得","0",27,150,1,1,6,3,53,1,0,0,0,0,0,0,0,0,0,},
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
}

local __key_map = { 
    id = 1,
    task_type = 2,
    activity_id = 3,
    task_name = 4,
    task_describe = 5,
    task_describe1 = 6,
    source_id = 7,
    goal = 8,
    refresh = 9,
    frequency = 10,
    order = 11,
    reward_type1 = 12,
    reward_value1 = 13,
    reward_size1 = 14,
    reward_type2 = 15,
    reward_value2 = 16,
    reward_size2 = 17,
    reward_type3 = 18,
    reward_value3 = 19,
    reward_size3 = 20,
    reward_type4 = 21,
    reward_value4 = 22,
    reward_size4 = 23,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_equipment_extract_time")

        return t._raw[__key_map[k]]
    end
}


function equipment_extract_time.getLength()
    return #equipment_extract_time._data
end



function equipment_extract_time.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_equipment_extract_time
function equipment_extract_time.indexOf(index)
    if index == nil or not equipment_extract_time._data[index] then
        return nil
    end
    return setmetatable({_raw = equipment_extract_time._data[index]}, m)
end



---
--@return @class record_equipment_extract_time
function equipment_extract_time.get(id)
    
    return equipment_extract_time.indexOf(__index_id[ id ])
     
end



function equipment_extract_time.set(id, key, value)
    local record = equipment_extract_time.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function equipment_extract_time.get_index_data()
    return __index_id 
end

return  equipment_extract_time 