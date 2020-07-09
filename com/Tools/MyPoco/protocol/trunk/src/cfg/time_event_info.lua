---@classdef record_time_event_info
local record_time_event_info = {}


record_time_event_info.id = 0--事件类型
record_time_event_info.num = 0--事件类型序号
record_time_event_info.time_type = 0--时间类型
record_time_event_info.open_time = 0--开始时间
record_time_event_info.end_time = 0--结束时间
record_time_event_info.description =  ""--事件描述

local time_event_info = {
   _data = {   
    [1] = {1,1,1,43200,50400,"将军，每日12:00-14:00 通关的奖励翻倍！",},  
    [2] = {1,2,1,64800,72000,"将军，每日18:00-20:00 通关的奖励翻倍！",},  
    [3] = {2,0,1,0,32400,"将军，每日00:00-9:00 系统免战开启！",},  
    [4] = {3,1,1,43200,50400,"将军，每日12:00-14:00 全力一击消耗攻打次数减半！",},  
    [5] = {3,2,1,64800,86400,"将军，每日18:00-24:00 全力一击消耗攻打次数减半！",},  
    [6] = {4,1,1,43200,64800,"将军，每日12:00-18:00将军快享用午餐恢复体力哦！",},  
    [7] = {4,2,1,64800,72000,"将军，每日18:00-20:00将军快享用晚餐恢复体力哦！",},  
    [8] = {4,3,1,72000,86400,"将军，每日20:00-24:00将军快享用夜宵恢复体力哦！",},  
    [9] = {5,0,1,0,72000,"将军，每日00：00-20：00 铸像铸造阶段开始了！",},  
    [10] = {6,0,1,72000,86400,"将军，每日20：00-24：00 铸像显灵阶段开始了！",},  
    [11] = {7,0,2,0,518399,"将军，关城激战每周一~周六开启！",},  
    [12] = {8,0,2,518400,597600,"将军，城池争霸每周日0点~22点开启！",},  
    [13] = {9,1,1,43200,50400,"将军，红包雨活动期间每日12:00-14：00可以参加红包雨哦！",},  
    [14] = {9,2,1,64800,72000,"将军，红包雨活动期间每日18:00-20：00可以参加红包雨哦！",},  
    [15] = {10,1,1,43200,50400,"将军，每日12:00-14:00参与决战定军山，获得荣誉值翻倍哦！",},  
    [16] = {10,2,1,64800,72000,"将军，每日18:00-20:00参与决战定军山，获得荣誉值翻倍哦！",},  
    [17] = {11,0,2,259200,345600,"将军，兵临城下（战车）周四开启！",},
    }
}

local __index_id_num = {   
    ["1_1"] = 1,  
    ["1_2"] = 2,  
    ["2_0"] = 3,  
    ["3_1"] = 4,  
    ["3_2"] = 5,  
    ["4_1"] = 6,  
    ["4_2"] = 7,  
    ["4_3"] = 8,  
    ["5_0"] = 9,  
    ["6_0"] = 10,  
    ["7_0"] = 11,  
    ["8_0"] = 12,  
    ["9_1"] = 13,  
    ["9_2"] = 14,  
    ["10_1"] = 15,  
    ["10_2"] = 16,  
    ["11_0"] = 17,
}

local __key_map = { 
    id = 1,
    num = 2,
    time_type = 3,
    open_time = 4,
    end_time = 5,
    description = 6,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_time_event_info")

        return t._raw[__key_map[k]]
    end
}


function time_event_info.getLength()
    return #time_event_info._data
end



function time_event_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_time_event_info
function time_event_info.indexOf(index)
    if index == nil or not time_event_info._data[index] then
        return nil
    end
    return setmetatable({_raw = time_event_info._data[index]}, m)
end



---
--@return @class record_time_event_info
function time_event_info.get(id,num)
    
    local k = id .. '_' .. num
    return time_event_info.indexOf(__index_id_num[k])
     
end



function time_event_info.set(id,num, key, value)
    local record = time_event_info.get(id,num)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function time_event_info.get_index_data()
    return __index_id_num 
end

return  time_event_info 