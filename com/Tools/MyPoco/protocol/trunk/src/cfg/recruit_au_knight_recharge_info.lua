---@classdef record_recruit_au_knight_recharge_info
local record_recruit_au_knight_recharge_info = {}


record_recruit_au_knight_recharge_info.id = 0--id
record_recruit_au_knight_recharge_info.open = 0--活动id
record_recruit_au_knight_recharge_info.amount = 0--充值金额
record_recruit_au_knight_recharge_info.limit = 0--充值次数限制
record_recruit_au_knight_recharge_info.refresh_type = 0--刷新类型
record_recruit_au_knight_recharge_info.discount = 0--折扣
record_recruit_au_knight_recharge_info.reward_type_1 = 0--奖励类型1
record_recruit_au_knight_recharge_info.reward_value_1 = 0--奖励值1
record_recruit_au_knight_recharge_info.reward_size_1 = 0--奖励数量1
record_recruit_au_knight_recharge_info.reward_type_2 = 0--奖励类型2
record_recruit_au_knight_recharge_info.reward_value_2 = 0--奖励值2
record_recruit_au_knight_recharge_info.reward_size_2 = 0--奖励数量2

local recruit_au_knight_recharge_info = {
   _data = {   
    [1] = {1,100001,6,1,1,0,999,0,288,3,253,5,},  
    [2] = {2,100001,30,2,1,90,999,0,488,3,253,10,},  
    [3] = {3,100001,98,3,2,80,999,0,980,3,253,25,},  
    [4] = {4,100001,198,6,2,70,999,0,1980,3,253,45,},  
    [5] = {5,100001,328,9,2,60,999,0,3280,3,253,70,},  
    [6] = {6,100001,648,0,2,50,999,0,6480,3,253,140,},  
    [7] = {7,100010,6,1,1,0,999,0,288,3,253,5,},  
    [8] = {8,100010,30,2,1,90,999,0,488,3,253,10,},  
    [9] = {9,100010,98,3,2,80,999,0,980,3,253,25,},  
    [10] = {10,100010,198,6,2,70,999,0,1980,3,253,45,},  
    [11] = {11,100010,328,9,2,60,999,0,3280,3,253,70,},  
    [12] = {12,100010,648,0,2,50,999,0,6480,3,253,140,},  
    [13] = {101,1000001,30,1,1,100,3,253,10,999,0,388,},  
    [14] = {102,1000001,60,1,1,90,3,253,18,999,0,688,},  
    [15] = {103,1000001,98,1,1,80,3,253,26,999,0,988,},  
    [16] = {104,1000001,198,6,2,70,3,253,40,999,0,1988,},  
    [17] = {105,1000001,328,9,2,70,3,253,65,999,0,3288,},  
    [18] = {106,1000001,648,0,2,70,3,253,130,999,0,6488,},  
    [19] = {201,1000002,30,1,1,100,3,253,10,999,0,388,},  
    [20] = {202,1000002,60,1,1,90,3,253,18,999,0,688,},  
    [21] = {203,1000002,98,1,1,80,3,253,26,999,0,988,},  
    [22] = {204,1000002,198,6,2,70,3,253,40,999,0,1988,},  
    [23] = {205,1000002,328,9,2,70,3,253,65,999,0,3288,},  
    [24] = {206,1000002,648,0,2,70,3,253,130,999,0,6488,},
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
    [101] = 13,  
    [102] = 14,  
    [103] = 15,  
    [104] = 16,  
    [105] = 17,  
    [106] = 18,  
    [201] = 19,  
    [202] = 20,  
    [203] = 21,  
    [204] = 22,  
    [205] = 23,  
    [206] = 24,
}

local __key_map = { 
    id = 1,
    open = 2,
    amount = 3,
    limit = 4,
    refresh_type = 5,
    discount = 6,
    reward_type_1 = 7,
    reward_value_1 = 8,
    reward_size_1 = 9,
    reward_type_2 = 10,
    reward_value_2 = 11,
    reward_size_2 = 12,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_recruit_au_knight_recharge_info")

        return t._raw[__key_map[k]]
    end
}


function recruit_au_knight_recharge_info.getLength()
    return #recruit_au_knight_recharge_info._data
end



function recruit_au_knight_recharge_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_recruit_au_knight_recharge_info
function recruit_au_knight_recharge_info.indexOf(index)
    if index == nil or not recruit_au_knight_recharge_info._data[index] then
        return nil
    end
    return setmetatable({_raw = recruit_au_knight_recharge_info._data[index]}, m)
end



---
--@return @class record_recruit_au_knight_recharge_info
function recruit_au_knight_recharge_info.get(id)
    
    return recruit_au_knight_recharge_info.indexOf(__index_id[ id ])
     
end



function recruit_au_knight_recharge_info.set(id, key, value)
    local record = recruit_au_knight_recharge_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function recruit_au_knight_recharge_info.get_index_data()
    return __index_id 
end

return  recruit_au_knight_recharge_info 