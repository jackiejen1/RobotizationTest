---@classdef record_sevendays_courage_info
local record_sevendays_courage_info = {}


record_sevendays_courage_info.id = 0--编号
record_sevendays_courage_info.activity_type = 0--所属活动
record_sevendays_courage_info.activity_value = 0--所属活动iD
record_sevendays_courage_info.num = 0--所需勇气值（仅用于显示）
record_sevendays_courage_info.grid = 0--关联方格（仅用于显示）
record_sevendays_courage_info.pos_1 = 0--方格X坐标
record_sevendays_courage_info.pos_2 = 0--方格Y坐标
record_sevendays_courage_info.reward_type_1 = 0--奖励1（仅用于显示）
record_sevendays_courage_info.reward_value_1 = 0--奖励类型值1（仅用于显示）
record_sevendays_courage_info.reward_size_1 = 0--奖励数量1（仅用于显示）
record_sevendays_courage_info.reward_type_2 = 0--奖励2（仅用于显示）
record_sevendays_courage_info.reward_value_2 = 0--奖励类型值2（仅用于显示）
record_sevendays_courage_info.reward_size_2 = 0--奖励数量2（仅用于显示）
record_sevendays_courage_info.reward_type_3 = 0--奖励3仅用于显示）
record_sevendays_courage_info.reward_value_3 = 0--奖励类型值3仅用于显示）
record_sevendays_courage_info.reward_size_3 = 0--奖励数量3仅用于显示）

local sevendays_courage_info = {
   _data = {   
    [1] = {1,1,100001,20,34,3,0,2,510040,20,1,3,1000000,0,0,0,},  
    [2] = {2,1,100001,40,70,9,0,2,510040,20,3,2,500,0,0,0,},  
    [3] = {3,1,100001,65,106,15,0,2,510040,20,3,15,50,0,0,0,},  
    [4] = {4,1,100001,90,142,21,0,2,510040,20,3,35,5000,0,0,0,},  
    [5] = {5,1,100001,120,178,27,0,2,510040,30,8,13020,50,0,0,0,},  
    [6] = {101,2,100002,15,1034,3,0,2,403,15,3,2,500,0,0,0,},  
    [7] = {102,2,100002,30,1070,9,0,2,403,15,3,15,50,0,0,0,},  
    [8] = {103,2,100002,45,1106,15,0,2,403,15,3,35,5000,0,0,0,},  
    [9] = {104,2,100002,60,1142,21,0,2,403,15,3,17,300,0,0,0,},  
    [10] = {105,2,100002,75,1178,27,0,2,403,15,1,25,5000,0,0,0,},  
    [11] = {201,1,100003,20,2034,3,0,2,510040,30,1,3,1000000,0,0,0,},  
    [12] = {202,1,100003,40,2070,9,0,2,510040,40,3,2,500,0,0,0,},  
    [13] = {203,1,100003,65,2106,15,0,2,510040,50,3,15,50,0,0,0,},  
    [14] = {204,1,100003,90,2142,21,0,2,510040,70,3,35,5000,0,0,0,},  
    [15] = {205,1,100003,120,2178,27,0,2,510040,80,8,13020,50,0,0,0,},  
    [16] = {301,2,100004,15,3034,3,0,2,423,15,3,2,500,0,0,0,},  
    [17] = {302,2,100004,30,3070,9,0,2,423,15,3,15,50,0,0,0,},  
    [18] = {303,2,100004,45,3106,15,0,2,423,15,3,35,5000,0,0,0,},  
    [19] = {304,2,100004,60,3142,21,0,2,423,15,3,17,300,0,0,0,},  
    [20] = {305,2,100004,75,3178,27,0,2,423,15,1,25,5000,0,0,0,},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [3] = 3,  
    [4] = 4,  
    [5] = 5,  
    [101] = 6,  
    [102] = 7,  
    [103] = 8,  
    [104] = 9,  
    [105] = 10,  
    [201] = 11,  
    [202] = 12,  
    [203] = 13,  
    [204] = 14,  
    [205] = 15,  
    [301] = 16,  
    [302] = 17,  
    [303] = 18,  
    [304] = 19,  
    [305] = 20,
}

local __key_map = { 
    id = 1,
    activity_type = 2,
    activity_value = 3,
    num = 4,
    grid = 5,
    pos_1 = 6,
    pos_2 = 7,
    reward_type_1 = 8,
    reward_value_1 = 9,
    reward_size_1 = 10,
    reward_type_2 = 11,
    reward_value_2 = 12,
    reward_size_2 = 13,
    reward_type_3 = 14,
    reward_value_3 = 15,
    reward_size_3 = 16,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_sevendays_courage_info")

        return t._raw[__key_map[k]]
    end
}


function sevendays_courage_info.getLength()
    return #sevendays_courage_info._data
end



function sevendays_courage_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_sevendays_courage_info
function sevendays_courage_info.indexOf(index)
    if index == nil or not sevendays_courage_info._data[index] then
        return nil
    end
    return setmetatable({_raw = sevendays_courage_info._data[index]}, m)
end



---
--@return @class record_sevendays_courage_info
function sevendays_courage_info.get(id)
    
    return sevendays_courage_info.indexOf(__index_id[ id ])
     
end



function sevendays_courage_info.set(id, key, value)
    local record = sevendays_courage_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function sevendays_courage_info.get_index_data()
    return __index_id 
end

return  sevendays_courage_info 