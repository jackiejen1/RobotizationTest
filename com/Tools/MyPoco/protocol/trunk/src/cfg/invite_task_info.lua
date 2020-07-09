---@classdef record_invite_task_info
local record_invite_task_info = {}


record_invite_task_info.id = 0--编号
record_invite_task_info.holiday_id = 0--任务组
record_invite_task_info.type = 0--任务类型
record_invite_task_info.target = 0--任务目标
record_invite_task_info.target_value = 0--目标值
record_invite_task_info.reset_type = 0--重置类型
record_invite_task_info.order = 0--显示顺序
record_invite_task_info.task_desc =  ""--任务描述
record_invite_task_info.task_desc2 =  ""--备胎描述
record_invite_task_info.special_task = 0--特殊任务
record_invite_task_info.route_id = 0--跳转
record_invite_task_info.reward_type_1 = 0--奖励类型1
record_invite_task_info.reward_value_1 = 0--奖励类型值1
record_invite_task_info.reward_size_1 = 0--奖励数量1
record_invite_task_info.reward_type_2 = 0--奖励类型2
record_invite_task_info.reward_value_2 = 0--奖励类型值2
record_invite_task_info.reward_size_2 = 0--奖励数量2
record_invite_task_info.reward_type_3 = 0--奖励类型3
record_invite_task_info.reward_value_3 = 0--奖励类型值3
record_invite_task_info.reward_size_3 = 0--奖励数量3
record_invite_task_info.reward_type_4 = 0--奖励类型4
record_invite_task_info.reward_value_4 = 0--奖励类型值4
record_invite_task_info.reward_size_4 = 0--奖励数量4

local invite_task_info = {
   _data = {   
    [1] = {1,101,2,1101,1,1,1,"分享1次新春福袋","回顾1次三国志剧情",1,45,1,39,100,3,6,2,3,2,200,0,0,0,},  
    [2] = {2,101,2,1105,150,1,2,"今日活跃度达到150点","今日活跃度达到150点",3,33,1,39,20,3,2004,2,3,15,30,0,0,0,},  
    [3] = {3,101,2,1102,1,0,3,"播放风物志动画“少年三国行”","播放风物志动画“少年三国行”",3,196,1,39,50,999,0,300,1,3,200200,0,0,0,},  
    [4] = {4,101,2,1104,1,0,5,"世界聊天发送：红包狂欢月，恭贺新春，鼠你有福！","世界聊天发送：红包狂欢月，恭贺新春，鼠你有福！",3,44,1,39,80,999,0,300,1,3,200200,0,0,0,},  
    [5] = {5,101,2,1099,160,0,4,"攻城略地主动挑战他人160次","攻城略地主动挑战他人160次",3,177,1,39,50,3,82,1,1,3,200200,0,0,0,},  
    [6] = {6,101,2,1100,1,0,6,"登陆游戏1天","登陆游戏1天",2,1,1,39,2020,0,0,0,0,0,0,0,0,0,},  
    [7] = {7,201,2,1101,1,1,1,"分享新春福袋1次","回顾三国志剧情1次",1,45,1,39,100,3,6,2,3,2,200,0,0,0,},  
    [8] = {8,201,2,1105,150,1,2,"今日活跃度达到150点","今日活跃度达到150点",3,33,1,39,20,3,2004,2,3,15,20,0,0,0,},  
    [9] = {9,201,2,1102,1,0,3,"播放风物志动画“少年三国行”","播放风物志动画“少年三国行”",3,196,1,39,50,999,0,300,1,3,200200,0,0,0,},  
    [10] = {10,201,2,1104,1,0,4,"世界频道发送：红包狂欢月，恭贺新春，鼠你有福！","世界频道发送：红包狂欢月，恭贺新春，鼠你有福！",3,44,1,39,80,999,0,300,1,3,200200,0,0,0,},  
    [11] = {11,201,2,1099,160,0,5,"攻城略地主动挑战他人160次","攻城略地主动挑战他人160次",3,177,1,39,50,3,82,1,1,3,200200,0,0,0,},  
    [12] = {12,201,2,1100,1,0,6,"登陆游戏1天","登陆游戏1天",2,1,1,39,2020,0,0,0,0,0,0,0,0,0,},  
    [13] = {13,201,2,1099,160,0,7,"攻城略地主动挑战他人160次","攻城略地主动挑战他人160次",3,177,1,39,50,1,3,100,1,3,100,0,0,0,},  
    [14] = {14,201,2,1100,1,0,8,"登陆游戏1天","登陆游戏1天",2,1,1,39,2020,0,0,0,0,0,0,0,0,0,},  
    [15] = {3011,301,2,1101,1,1,1,"分享1次元宝福袋","回顾1次三国志剧情",1,45,1,39,100,3,6,2,3,2,200,0,0,0,},  
    [16] = {3012,301,2,1105,150,1,2,"今日活跃度达到150点","今日活跃度达到150点",3,33,1,39,20,3,2004,2,3,15,30,0,0,0,},  
    [17] = {3013,301,2,1102,1,0,3,"播放风物志动画“少年三国行”","播放风物志动画“少年三国行”",3,196,1,39,50,999,0,300,1,3,200200,0,0,0,},  
    [18] = {3014,301,2,1104,1,0,5,"世界聊天发送：少年三国梦，元宝装满行囊，长风起航！","世界聊天发送：少年三国梦，元宝装满行囊，长风起航！",3,44,1,39,80,999,0,300,1,3,200200,0,0,0,},  
    [19] = {3015,301,2,1099,30,0,4,"攻城略地主动挑战他人30次","攻城略地主动挑战他人30次",3,177,1,39,50,3,82,1,1,3,200200,0,0,0,},  
    [20] = {3016,301,2,1100,1,0,6,"登陆游戏1天","登陆游戏1天",2,1,1,39,2020,0,0,0,0,0,0,0,0,0,},  
    [21] = {4011,401,2,1101,1,1,1,"分享1次元宝福袋","回顾1次三国志剧情",1,45,1,39,100,3,194,3,3,2,300,0,0,0,},  
    [22] = {4012,401,2,1105,150,1,2,"今日活跃度达到150点","今日活跃度达到150点",3,33,1,39,20,3,194,3,3,15,50,0,0,0,},  
    [23] = {4013,401,2,1102,1,0,3,"播放风物志动画“少年三国行”","播放风物志动画“少年三国行”",3,196,1,39,50,999,0,300,3,194,5,0,0,0,},  
    [24] = {4014,401,2,1104,1,0,5,"发送：《少三2》X《镇魂街》联动狂欢，百亿福利大放送！少年的三国，少年的庆典！","发送：《少三2》X《镇魂街》联动狂欢，百亿福利大放送！少年的三国，少年的庆典！",3,44,1,39,80,999,0,300,3,194,5,0,0,0,},  
    [25] = {4015,401,2,1099,20,0,4,"攻城略地主动挑战他人20次","攻城略地主动挑战他人20次",3,177,1,39,50,999,0,300,3,194,5,0,0,0,},  
    [26] = {4016,401,2,1100,1,0,6,"登陆游戏1天","登陆游戏1天",2,1,1,39,2020,0,0,0,0,0,0,0,0,0,},
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
    [3011] = 15,  
    [3012] = 16,  
    [3013] = 17,  
    [3014] = 18,  
    [3015] = 19,  
    [3016] = 20,  
    [4011] = 21,  
    [4012] = 22,  
    [4013] = 23,  
    [4014] = 24,  
    [4015] = 25,  
    [4016] = 26,
}

local __key_map = { 
    id = 1,
    holiday_id = 2,
    type = 3,
    target = 4,
    target_value = 5,
    reset_type = 6,
    order = 7,
    task_desc = 8,
    task_desc2 = 9,
    special_task = 10,
    route_id = 11,
    reward_type_1 = 12,
    reward_value_1 = 13,
    reward_size_1 = 14,
    reward_type_2 = 15,
    reward_value_2 = 16,
    reward_size_2 = 17,
    reward_type_3 = 18,
    reward_value_3 = 19,
    reward_size_3 = 20,
    reward_type_4 = 21,
    reward_value_4 = 22,
    reward_size_4 = 23,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_invite_task_info")

        return t._raw[__key_map[k]]
    end
}


function invite_task_info.getLength()
    return #invite_task_info._data
end



function invite_task_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_invite_task_info
function invite_task_info.indexOf(index)
    if index == nil or not invite_task_info._data[index] then
        return nil
    end
    return setmetatable({_raw = invite_task_info._data[index]}, m)
end



---
--@return @class record_invite_task_info
function invite_task_info.get(id)
    
    return invite_task_info.indexOf(__index_id[ id ])
     
end



function invite_task_info.set(id, key, value)
    local record = invite_task_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function invite_task_info.get_index_data()
    return __index_id 
end

return  invite_task_info 