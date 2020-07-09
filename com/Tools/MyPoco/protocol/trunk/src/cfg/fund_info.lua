---@classdef record_fund_info
local record_fund_info = {}


record_fund_info.id = 0--id
record_fund_info.recharge_id = 0--类型
record_fund_info.type = 0--类型
record_fund_info.num = 0--数额
record_fund_info.reward_type_1 = 0--奖励类型1
record_fund_info.reward_value_1 = 0--奖励类型值1
record_fund_info.reward_size_1 = 0--奖励数量1
record_fund_info.reward_type_2 = 0--奖励类型2
record_fund_info.reward_value_2 = 0--奖励类型值2
record_fund_info.reward_size_2 = 0--奖励数量2
record_fund_info.reward_type_3 = 0--奖励类型3
record_fund_info.reward_value_3 = 0--奖励类型值3
record_fund_info.reward_size_3 = 0--奖励数量3

local fund_info = {
   _data = {   
    [1] = {1,4,1,10,999,0,100,0,0,0,0,0,0,},  
    [2] = {2,4,1,25,999,0,100,0,0,0,0,0,0,},  
    [3] = {3,4,1,35,999,0,100,0,0,0,0,0,0,},  
    [4] = {4,4,1,45,999,0,120,0,0,0,0,0,0,},  
    [5] = {5,4,1,55,999,0,130,0,0,0,0,0,0,},  
    [6] = {6,4,1,65,999,0,150,0,0,0,0,0,0,},  
    [7] = {7,4,1,75,999,0,150,0,0,0,0,0,0,},  
    [8] = {8,4,1,85,999,0,150,0,0,0,0,0,0,},  
    [9] = {9,4,1,95,999,0,200,0,0,0,0,0,0,},  
    [10] = {10,4,2,10,999,0,1000,0,0,0,0,0,0,},  
    [11] = {11,4,2,25,999,0,1000,0,0,0,0,0,0,},  
    [12] = {12,4,2,35,999,0,1000,0,0,0,0,0,0,},  
    [13] = {13,4,2,45,999,0,1200,0,0,0,0,0,0,},  
    [14] = {14,4,2,55,999,0,1300,0,0,0,0,0,0,},  
    [15] = {15,4,2,65,999,0,1500,0,0,0,0,0,0,},  
    [16] = {16,4,2,75,999,0,1500,0,0,0,0,0,0,},  
    [17] = {17,4,2,85,999,0,1500,0,0,0,0,0,0,},  
    [18] = {18,4,2,95,999,0,2000,0,0,0,0,0,0,},  
    [19] = {19,4,3,5,1,3,50000,0,0,0,0,0,0,},  
    [20] = {20,4,3,10,3,8,5,0,0,0,0,0,0,},  
    [21] = {21,4,3,30,3,2,50,0,0,0,0,0,0,},  
    [22] = {22,4,3,50,3,11,50,0,0,0,0,0,0,},  
    [23] = {23,4,3,100,999,0,100,0,0,0,0,0,0,},  
    [24] = {24,4,3,150,3,10,5,0,0,0,0,0,0,},  
    [25] = {25,4,3,200,3,11,50,0,0,0,0,0,0,},  
    [26] = {26,4,3,250,3,10,10,0,0,0,0,0,0,},  
    [27] = {27,4,3,300,999,0,200,0,0,0,0,0,0,},  
    [28] = {28,4,3,350,1,3,200000,0,0,0,0,0,0,},  
    [29] = {29,4,3,400,3,11,100,0,0,0,0,0,0,},  
    [30] = {30,4,3,450,3,2,150,0,0,0,0,0,0,},  
    [31] = {31,4,3,500,999,0,300,0,0,0,0,0,0,},
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
}

local __key_map = { 
    id = 1,
    recharge_id = 2,
    type = 3,
    num = 4,
    reward_type_1 = 5,
    reward_value_1 = 6,
    reward_size_1 = 7,
    reward_type_2 = 8,
    reward_value_2 = 9,
    reward_size_2 = 10,
    reward_type_3 = 11,
    reward_value_3 = 12,
    reward_size_3 = 13,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_fund_info")

        return t._raw[__key_map[k]]
    end
}


function fund_info.getLength()
    return #fund_info._data
end



function fund_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_fund_info
function fund_info.indexOf(index)
    if index == nil or not fund_info._data[index] then
        return nil
    end
    return setmetatable({_raw = fund_info._data[index]}, m)
end



---
--@return @class record_fund_info
function fund_info.get(id)
    
    return fund_info.indexOf(__index_id[ id ])
     
end



function fund_info.set(id, key, value)
    local record = fund_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function fund_info.get_index_data()
    return __index_id 
end

return  fund_info 