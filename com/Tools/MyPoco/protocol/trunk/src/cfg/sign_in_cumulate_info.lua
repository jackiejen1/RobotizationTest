---@classdef record_sign_in_cumulate_info
local record_sign_in_cumulate_info = {}


record_sign_in_cumulate_info.id = 0--ID
record_sign_in_cumulate_info.turn = 0--轮次编号
record_sign_in_cumulate_info.days = 0--累积天数
record_sign_in_cumulate_info.reward_type_1 = 0--奖励类型1
record_sign_in_cumulate_info.reward_value_1 = 0--奖励类型值1
record_sign_in_cumulate_info.reward_size_1 = 0--奖励数量1
record_sign_in_cumulate_info.reward_type_2 = 0--奖励类型2
record_sign_in_cumulate_info.reward_value_2 = 0--奖励类型值2
record_sign_in_cumulate_info.reward_size_2 = 0--奖励数量2
record_sign_in_cumulate_info.reward_type_3 = 0--奖励类型3
record_sign_in_cumulate_info.reward_value_3 = 0--奖励类型值3
record_sign_in_cumulate_info.reward_size_3 = 0--奖励数量3
record_sign_in_cumulate_info.reward_type_4 = 0--奖励类型4
record_sign_in_cumulate_info.reward_value_4 = 0--奖励类型值4
record_sign_in_cumulate_info.reward_size_4 = 0--奖励数量4

local sign_in_cumulate_info = {
   _data = {   
    [1] = {1,1,3,3,27,10,999,0,200,3,1,3,1,3,100000,},  
    [2] = {2,1,7,3,27,10,999,0,300,3,1,3,1,3,200000,},  
    [3] = {3,1,14,3,27,10,999,0,400,3,1,3,1,3,300000,},  
    [4] = {4,1,21,3,27,10,999,0,500,3,1,3,1,3,400000,},  
    [5] = {5,1,30,3,27,10,999,0,600,3,1,3,1,3,500000,},  
    [6] = {1,2,3,3,22,5,999,0,200,3,1,3,1,3,100000,},  
    [7] = {2,2,7,3,22,5,999,0,300,3,1,3,1,3,200000,},  
    [8] = {3,2,14,3,22,5,999,0,400,3,1,3,1,3,300000,},  
    [9] = {4,2,21,3,22,5,999,0,500,3,1,3,1,3,400000,},  
    [10] = {5,2,30,3,22,5,999,0,600,3,1,3,1,3,500000,},  
    [11] = {1,3,3,3,22,5,999,0,200,3,1,3,1,3,100000,},  
    [12] = {2,3,7,3,22,5,999,0,300,3,1,3,1,3,200000,},  
    [13] = {3,3,14,3,22,5,999,0,400,3,1,3,1,3,300000,},  
    [14] = {4,3,21,3,22,5,999,0,500,3,1,3,1,3,400000,},  
    [15] = {5,3,30,3,22,5,999,0,600,3,1,3,1,3,500000,},  
    [16] = {1,4,3,3,22,5,999,0,200,3,1,3,1,3,100000,},  
    [17] = {2,4,7,3,22,5,999,0,300,3,1,3,1,3,200000,},  
    [18] = {3,4,14,3,22,5,999,0,400,3,1,3,1,3,300000,},  
    [19] = {4,4,21,3,22,5,999,0,500,3,1,3,1,3,400000,},  
    [20] = {5,4,30,3,22,5,999,0,600,3,1,3,1,3,500000,},
    }
}

local __index_id_turn = {   
    ["1_1"] = 1,  
    ["2_1"] = 2,  
    ["3_1"] = 3,  
    ["4_1"] = 4,  
    ["5_1"] = 5,  
    ["1_2"] = 6,  
    ["2_2"] = 7,  
    ["3_2"] = 8,  
    ["4_2"] = 9,  
    ["5_2"] = 10,  
    ["1_3"] = 11,  
    ["2_3"] = 12,  
    ["3_3"] = 13,  
    ["4_3"] = 14,  
    ["5_3"] = 15,  
    ["1_4"] = 16,  
    ["2_4"] = 17,  
    ["3_4"] = 18,  
    ["4_4"] = 19,  
    ["5_4"] = 20,
}

local __key_map = { 
    id = 1,
    turn = 2,
    days = 3,
    reward_type_1 = 4,
    reward_value_1 = 5,
    reward_size_1 = 6,
    reward_type_2 = 7,
    reward_value_2 = 8,
    reward_size_2 = 9,
    reward_type_3 = 10,
    reward_value_3 = 11,
    reward_size_3 = 12,
    reward_type_4 = 13,
    reward_value_4 = 14,
    reward_size_4 = 15,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_sign_in_cumulate_info")

        return t._raw[__key_map[k]]
    end
}


function sign_in_cumulate_info.getLength()
    return #sign_in_cumulate_info._data
end



function sign_in_cumulate_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_sign_in_cumulate_info
function sign_in_cumulate_info.indexOf(index)
    if index == nil or not sign_in_cumulate_info._data[index] then
        return nil
    end
    return setmetatable({_raw = sign_in_cumulate_info._data[index]}, m)
end



---
--@return @class record_sign_in_cumulate_info
function sign_in_cumulate_info.get(id,turn)
    
    local k = id .. '_' .. turn
    return sign_in_cumulate_info.indexOf(__index_id_turn[k])
     
end



function sign_in_cumulate_info.set(id,turn, key, value)
    local record = sign_in_cumulate_info.get(id,turn)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function sign_in_cumulate_info.get_index_data()
    return __index_id_turn 
end

return  sign_in_cumulate_info 