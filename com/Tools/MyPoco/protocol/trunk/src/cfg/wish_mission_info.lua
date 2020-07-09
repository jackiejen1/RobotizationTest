---@classdef record_wish_mission_info
local record_wish_mission_info = {}


record_wish_mission_info.id = 0--ID
record_wish_mission_info.server_time = 0--开服天数
record_wish_mission_info.show_server_time = 0--显示开服时间
record_wish_mission_info.show_level = 0--显示等级
record_wish_mission_info.level_down = 0--等级下限
record_wish_mission_info.level_up = 0--等级上限
record_wish_mission_info.time_type = 0--刷新类型
record_wish_mission_info.weekday = 0--星期
record_wish_mission_info.start_time = 0--开启时间
record_wish_mission_info.end_time = 0--结束时间
record_wish_mission_info.mission_type = 0--任务类型
record_wish_mission_info.target = 0--目标数量
record_wish_mission_info.pic = 0--功能图片
record_wish_mission_info.name =  ""--标题
record_wish_mission_info.descreption =  ""--任务描述
record_wish_mission_info.route_id = 0--跳转
record_wish_mission_info.award_1_type = 0--奖励1类型
record_wish_mission_info.award_1_value = 0--奖励1类型值
record_wish_mission_info.award_1_size = 0--奖励1数量
record_wish_mission_info.award_2_type = 0--奖励2类型
record_wish_mission_info.award_2_value = 0--奖励2类型值
record_wish_mission_info.award_2_size = 0--奖励2数量
record_wish_mission_info.award_3_type = 0--奖励3类型
record_wish_mission_info.award_3_value = 0--奖励3类型值
record_wish_mission_info.award_3_size = 0--奖励3数量

local wish_mission_info = {
   _data = {   
    [1] = {1,2,2,30,30,999,1,0,0,50400,1098,3,1,"激斗神将","激斗神将挑战3次",171,1,37,60,0,0,0,0,0,0,},  
    [2] = {2,5,3,40,40,999,2,4,0,79200,1099,20,2,"攻城略地","攻城略地挑战20次",177,1,37,80,999,0,300,0,0,0,},  
    [3] = {3,1,1,48,48,999,2,6,0,79200,1092,10,3,"城池争霸","城池争霸挑战10次",162,1,37,80,999,0,300,0,0,0,},  
    [4] = {4,2,2,70,70,999,1,0,0,86400,1106,1,4,"讨伐神兽","讨伐神兽中获得奖励1次",222,1,37,60,0,0,0,0,0,0,},  
    [5] = {5,7,7,80,80,999,2,3,0,86399,1114,3,5,"兵临城下","兵临城下挑战3次",229,1,37,80,999,0,300,0,0,0,},  
    [6] = {6,7,7,75,75,999,2,1,43200,79200,1118,5,6,"讨伐魔将","讨伐魔化貂蝉5次",233,1,37,80,999,0,300,0,0,0,},  
    [7] = {7,7,7,75,75,999,2,5,43200,79200,1119,5,7,"讨伐魔将","讨伐魔化吕布5次",233,1,37,80,999,0,300,0,0,0,},
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
}

local __key_map = { 
    id = 1,
    server_time = 2,
    show_server_time = 3,
    show_level = 4,
    level_down = 5,
    level_up = 6,
    time_type = 7,
    weekday = 8,
    start_time = 9,
    end_time = 10,
    mission_type = 11,
    target = 12,
    pic = 13,
    name = 14,
    descreption = 15,
    route_id = 16,
    award_1_type = 17,
    award_1_value = 18,
    award_1_size = 19,
    award_2_type = 20,
    award_2_value = 21,
    award_2_size = 22,
    award_3_type = 23,
    award_3_value = 24,
    award_3_size = 25,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_wish_mission_info")

        return t._raw[__key_map[k]]
    end
}


function wish_mission_info.getLength()
    return #wish_mission_info._data
end



function wish_mission_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_wish_mission_info
function wish_mission_info.indexOf(index)
    if index == nil or not wish_mission_info._data[index] then
        return nil
    end
    return setmetatable({_raw = wish_mission_info._data[index]}, m)
end



---
--@return @class record_wish_mission_info
function wish_mission_info.get(id)
    
    return wish_mission_info.indexOf(__index_id[ id ])
     
end



function wish_mission_info.set(id, key, value)
    local record = wish_mission_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function wish_mission_info.get_index_data()
    return __index_id 
end

return  wish_mission_info 