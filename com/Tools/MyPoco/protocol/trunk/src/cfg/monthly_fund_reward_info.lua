---@classdef record_monthly_fund_reward_info
local record_monthly_fund_reward_info = {}


record_monthly_fund_reward_info.id = 0--编号
record_monthly_fund_reward_info.reward_id = 0--奖励id
record_monthly_fund_reward_info.day = 0--领奖天数
record_monthly_fund_reward_info.reward_type_1 = 0--奖励类型1
record_monthly_fund_reward_info.reward_value_1 = 0--奖励类型值1
record_monthly_fund_reward_info.reward_size_1 = 0--奖励数量1

local monthly_fund_reward_info = {
   _data = {   
    [1] = {1,1,1,999,0,980,},  
    [2] = {2,1,2,3,15,50,},  
    [3] = {3,1,3,3,2005,50,},  
    [4] = {4,1,4,18,9002,2,},  
    [5] = {5,1,5,3,15,50,},  
    [6] = {6,1,6,3,2054,25,},  
    [7] = {7,1,7,999,0,388,},  
    [8] = {8,1,8,18,9002,2,},  
    [9] = {9,1,9,3,2005,25,},  
    [10] = {10,1,10,3,15,50,},  
    [11] = {11,1,11,18,9002,2,},  
    [12] = {12,1,12,999,0,388,},  
    [13] = {13,1,13,3,2054,25,},  
    [14] = {14,1,14,3,15,50,},  
    [15] = {15,1,15,3,2005,25,},  
    [16] = {16,1,16,18,9002,2,},  
    [17] = {17,1,17,999,0,388,},  
    [18] = {18,1,18,3,2054,25,},  
    [19] = {19,1,19,3,15,50,},  
    [20] = {20,1,20,3,2005,25,},  
    [21] = {21,2,1,999,0,3280,},  
    [22] = {22,2,2,3,56,500,},  
    [23] = {23,2,3,3,2091,60,},  
    [24] = {24,2,4,3,51,10,},  
    [25] = {25,2,5,3,2069,20,},  
    [26] = {26,2,6,999,0,888,},  
    [27] = {27,2,7,3,2069,20,},  
    [28] = {28,2,8,3,51,10,},  
    [29] = {29,2,9,3,2091,40,},  
    [30] = {30,2,10,3,56,500,},  
    [31] = {31,2,11,3,51,10,},  
    [32] = {32,2,12,3,2069,20,},  
    [33] = {33,2,13,999,0,888,},  
    [34] = {34,2,14,3,56,500,},  
    [35] = {35,2,15,3,2091,40,},  
    [36] = {36,2,16,3,51,10,},  
    [37] = {37,2,17,3,2069,20,},  
    [38] = {38,2,18,999,0,888,},  
    [39] = {39,2,19,3,56,500,},  
    [40] = {40,2,20,3,2091,40,},
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
    [40] = 40,
}

local __key_map = { 
    id = 1,
    reward_id = 2,
    day = 3,
    reward_type_1 = 4,
    reward_value_1 = 5,
    reward_size_1 = 6,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_monthly_fund_reward_info")

        return t._raw[__key_map[k]]
    end
}


function monthly_fund_reward_info.getLength()
    return #monthly_fund_reward_info._data
end



function monthly_fund_reward_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_monthly_fund_reward_info
function monthly_fund_reward_info.indexOf(index)
    if index == nil or not monthly_fund_reward_info._data[index] then
        return nil
    end
    return setmetatable({_raw = monthly_fund_reward_info._data[index]}, m)
end



---
--@return @class record_monthly_fund_reward_info
function monthly_fund_reward_info.get(id)
    
    return monthly_fund_reward_info.indexOf(__index_id[ id ])
     
end



function monthly_fund_reward_info.set(id, key, value)
    local record = monthly_fund_reward_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function monthly_fund_reward_info.get_index_data()
    return __index_id 
end

return  monthly_fund_reward_info 