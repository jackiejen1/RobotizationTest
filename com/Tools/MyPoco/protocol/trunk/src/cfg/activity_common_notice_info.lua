---@classdef record_activity_common_notice_info
local record_activity_common_notice_info = {}


record_activity_common_notice_info.activity_type = 0--活动类型
record_activity_common_notice_info.id = 0--id
record_activity_common_notice_info.reward_type = 0--获得奖励类型
record_activity_common_notice_info.reward_value = 0--奖励类型值
record_activity_common_notice_info.reward_size = 0--奖励数量
record_activity_common_notice_info.big_reward = 0--大奖展示
record_activity_common_notice_info.news =  ""--描述

local activity_common_notice_info = {
   _data = {   
    [1] = {9,901,3,54,1,5,"恭喜[color=#role_color#]#name#[/color]获得了[color=##quality_color#]#item#[/color]",},  
    [2] = {9,902,3,221,1,5,"恭喜[color=#role_color#]#name#[/color]获得了[color=##quality_color#]#item#[/color]",},  
    [3] = {10,1001,4,510010,1,4,"恭喜[color=#role_color#]#name#[/color]获得了[color=##quality_color#]#item#[/color]",},  
    [4] = {10,1002,4,510020,1,4,"恭喜[color=#role_color#]#name#[/color]获得了[color=##quality_color#]#item#[/color]",},  
    [5] = {10,1003,4,510030,1,4,"恭喜[color=#role_color#]#name#[/color]获得了[color=##quality_color#]#item#[/color]",},  
    [6] = {10,1004,4,500110,1,4,"恭喜[color=#role_color#]#name#[/color]获得了[color=##quality_color#]#item#[/color]",},  
    [7] = {10,1005,4,510050,1,4,"恭喜[color=#role_color#]#name#[/color]获得了[color=##quality_color#]#item#[/color]",},  
    [8] = {10,1006,4,510060,1,4,"恭喜[color=#role_color#]#name#[/color]获得了[color=##quality_color#]#item#[/color]",},  
    [9] = {10,1007,4,510070,1,4,"恭喜[color=#role_color#]#name#[/color]获得了[color=##quality_color#]#item#[/color]",},  
    [10] = {10,1008,4,510080,1,4,"恭喜[color=#role_color#]#name#[/color]获得了[color=##quality_color#]#item#[/color]",},  
    [11] = {10,1009,4,600020,1,4,"恭喜[color=#role_color#]#name#[/color]获得了[color=##quality_color#]#item#[/color]",},  
    [12] = {10,1010,4,600030,1,4,"恭喜[color=#role_color#]#name#[/color]获得了[color=##quality_color#]#item#[/color]",},  
    [13] = {10,1011,4,600050,1,4,"恭喜[color=#role_color#]#name#[/color]获得了[color=##quality_color#]#item#[/color]",},  
    [14] = {10,1012,4,600080,1,4,"恭喜[color=#role_color#]#name#[/color]获得了[color=##quality_color#]#item#[/color]",},  
    [15] = {10,1013,4,600090,1,4,"恭喜[color=#role_color#]#name#[/color]获得了[color=##quality_color#]#item#[/color]",},  
    [16] = {10,1014,4,600100,1,4,"恭喜[color=#role_color#]#name#[/color]获得了[color=##quality_color#]#item#[/color]",},  
    [17] = {10,1015,4,600110,1,4,"恭喜[color=#role_color#]#name#[/color]获得了[color=##quality_color#]#item#[/color]",},  
    [18] = {10,1016,4,600120,1,4,"恭喜[color=#role_color#]#name#[/color]获得了[color=##quality_color#]#item#[/color]",},  
    [19] = {10,1017,3,2311,1,3,"恭喜[color=#role_color#]#name#[/color]获得了[color=##quality_color#]#item#[/color]",},  
    [20] = {10,1018,3,2312,1,3,"恭喜[color=#role_color#]#name#[/color]获得了[color=##quality_color#]#item#[/color]",},  
    [21] = {10,1019,3,2313,1,3,"恭喜[color=#role_color#]#name#[/color]获得了[color=##quality_color#]#item#[/color]",},  
    [22] = {10,1020,3,2314,1,3,"恭喜[color=#role_color#]#name#[/color]获得了[color=##quality_color#]#item#[/color]",},  
    [23] = {10,1021,3,2317,1,3,"恭喜[color=#role_color#]#name#[/color]获得了[color=##quality_color#]#item#[/color]",},  
    [24] = {10,1022,3,2318,1,3,"恭喜[color=#role_color#]#name#[/color]获得了[color=##quality_color#]#item#[/color]",},  
    [25] = {10,1023,3,2319,1,3,"恭喜[color=#role_color#]#name#[/color]获得了[color=##quality_color#]#item#[/color]",},  
    [26] = {10,1024,3,2320,1,3,"恭喜[color=#role_color#]#name#[/color]获得了[color=##quality_color#]#item#[/color]",},  
    [27] = {10,1025,3,2321,1,3,"恭喜[color=#role_color#]#name#[/color]获得了[color=##quality_color#]#item#[/color]",},  
    [28] = {10,1026,3,2322,1,3,"恭喜[color=#role_color#]#name#[/color]获得了[color=##quality_color#]#item#[/color]",},  
    [29] = {10,1027,3,2323,1,3,"恭喜[color=#role_color#]#name#[/color]获得了[color=##quality_color#]#item#[/color]",},  
    [30] = {10,1028,3,2324,1,3,"恭喜[color=#role_color#]#name#[/color]获得了[color=##quality_color#]#item#[/color]",},  
    [31] = {10,1029,3,2356,1,3,"恭喜[color=#role_color#]#name#[/color]获得了[color=##quality_color#]#item#[/color]",},  
    [32] = {10,1030,3,2357,1,3,"恭喜[color=#role_color#]#name#[/color]获得了[color=##quality_color#]#item#[/color]",},  
    [33] = {10,1031,3,2358,1,3,"恭喜[color=#role_color#]#name#[/color]获得了[color=##quality_color#]#item#[/color]",},  
    [34] = {10,1032,3,2359,1,3,"恭喜[color=#role_color#]#name#[/color]获得了[color=##quality_color#]#item#[/color]",},  
    [35] = {10,1033,3,2389,1,3,"恭喜[color=#role_color#]#name#[/color]获得了[color=##quality_color#]#item#[/color]",},  
    [36] = {10,1034,3,2388,1,5,"恭喜[color=#role_color#]#name#[/color]获得了[color=##quality_color#]#item#[/color]",},  
    [37] = {10,1035,4,600010,1,4,"恭喜[color=#role_color#]#name#[/color]获得了[color=##quality_color#]#item#[/color]",},  
    [38] = {10,1036,4,600040,1,4,"恭喜[color=#role_color#]#name#[/color]获得了[color=##quality_color#]#item#[/color]",},  
    [39] = {10,1037,4,600060,1,4,"恭喜[color=#role_color#]#name#[/color]获得了[color=##quality_color#]#item#[/color]",},  
    [40] = {10,1038,4,600070,1,4,"恭喜[color=#role_color#]#name#[/color]获得了[color=##quality_color#]#item#[/color]",},  
    [41] = {10,1039,3,2422,1,3,"恭喜[color=#role_color#]#name#[/color]获得了[color=##quality_color#]#item#[/color]",},  
    [42] = {15,1501,3,78,1,5,"恭喜[color=#role_color#]#name#[/color]获得了[color=##quality_color#]#item#[/color]",},  
    [43] = {15,1502,999,0,6666,5,"恭喜[color=#role_color#]#name#[/color]获得了[color=##quality_color#]#item#[/color]*#size#",},  
    [44] = {18,1801,3,164,1,5,"恭喜[color=#role_color#]#name#[/color]获得了[color=##quality_color#]#item#[/color]",},  
    [45] = {18,1802,999,0,6666,5,"恭喜[color=#role_color#]#name#[/color]获得了[color=##quality_color#]#item#[/color]*#size#",},  
    [46] = {18,1803,3,236,1,5,"恭喜[color=#role_color#]#name#[/color]获得了[color=##quality_color#]#item#[/color]",},  
    [47] = {22,2201,4,510020,1,4,"恭喜[color=#role_color#]#name#[/color]获得了[color=##quality_color#]#item#[/color]",},  
    [48] = {21,1000001,4,700130,1,4,"恭喜[color=#role_color#]#name#[/color]获得了[color=##quality_color#]#item#[/color]",},  
    [49] = {21,1000002,4,700130,1,4,"恭喜[color=#role_color#]#name#[/color]获得了[color=##quality_color#]#item#[/color]",},
    }
}

local __index_activity_type_id = {   
    ["9_901"] = 1,  
    ["9_902"] = 2,  
    ["10_1001"] = 3,  
    ["10_1002"] = 4,  
    ["10_1003"] = 5,  
    ["10_1004"] = 6,  
    ["10_1005"] = 7,  
    ["10_1006"] = 8,  
    ["10_1007"] = 9,  
    ["10_1008"] = 10,  
    ["10_1009"] = 11,  
    ["10_1010"] = 12,  
    ["10_1011"] = 13,  
    ["10_1012"] = 14,  
    ["10_1013"] = 15,  
    ["10_1014"] = 16,  
    ["10_1015"] = 17,  
    ["10_1016"] = 18,  
    ["10_1017"] = 19,  
    ["10_1018"] = 20,  
    ["10_1019"] = 21,  
    ["10_1020"] = 22,  
    ["10_1021"] = 23,  
    ["10_1022"] = 24,  
    ["10_1023"] = 25,  
    ["10_1024"] = 26,  
    ["10_1025"] = 27,  
    ["10_1026"] = 28,  
    ["10_1027"] = 29,  
    ["10_1028"] = 30,  
    ["10_1029"] = 31,  
    ["10_1030"] = 32,  
    ["10_1031"] = 33,  
    ["10_1032"] = 34,  
    ["10_1033"] = 35,  
    ["10_1034"] = 36,  
    ["10_1035"] = 37,  
    ["10_1036"] = 38,  
    ["10_1037"] = 39,  
    ["10_1038"] = 40,  
    ["10_1039"] = 41,  
    ["15_1501"] = 42,  
    ["15_1502"] = 43,  
    ["18_1801"] = 44,  
    ["18_1802"] = 45,  
    ["18_1803"] = 46,  
    ["22_2201"] = 47,  
    ["21_1000001"] = 48,  
    ["21_1000002"] = 49,
}

local __key_map = { 
    activity_type = 1,
    id = 2,
    reward_type = 3,
    reward_value = 4,
    reward_size = 5,
    big_reward = 6,
    news = 7,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_activity_common_notice_info")

        return t._raw[__key_map[k]]
    end
}


function activity_common_notice_info.getLength()
    return #activity_common_notice_info._data
end



function activity_common_notice_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_activity_common_notice_info
function activity_common_notice_info.indexOf(index)
    if index == nil or not activity_common_notice_info._data[index] then
        return nil
    end
    return setmetatable({_raw = activity_common_notice_info._data[index]}, m)
end



---
--@return @class record_activity_common_notice_info
function activity_common_notice_info.get(activity_type,id)
    
    local k = activity_type .. '_' .. id
    return activity_common_notice_info.indexOf(__index_activity_type_id[k])
     
end



function activity_common_notice_info.set(activity_type,id, key, value)
    local record = activity_common_notice_info.get(activity_type,id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function activity_common_notice_info.get_index_data()
    return __index_activity_type_id 
end

return  activity_common_notice_info 