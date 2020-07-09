---@classdef record_storm_city_rank_info
local record_storm_city_rank_info = {}


record_storm_city_rank_info.id = 0--id
record_storm_city_rank_info.rank_type = 0--排名类型
record_storm_city_rank_info.min_rank = 0--最小排名
record_storm_city_rank_info.max_rank = 0--最大排名
record_storm_city_rank_info.lord_id = 0--对应官职
record_storm_city_rank_info.reward_type1 = 0--奖励类型1
record_storm_city_rank_info.reward_value1 = 0--奖励类型值1
record_storm_city_rank_info.reward_size1 = 0--奖励数量1
record_storm_city_rank_info.reward_type2 = 0--奖励类型2
record_storm_city_rank_info.reward_value2 = 0--奖励类型值2
record_storm_city_rank_info.reward_size2 = 0--奖励数量2
record_storm_city_rank_info.reward_type3 = 0--奖励类型3
record_storm_city_rank_info.reward_value3 = 0--奖励类型值3
record_storm_city_rank_info.reward_size3 = 0--奖励数量3
record_storm_city_rank_info.reward_type4 = 0--奖励类型4
record_storm_city_rank_info.reward_value4 = 0--奖励类型值4
record_storm_city_rank_info.reward_size4 = 0--奖励数量4

local storm_city_rank_info = {
   _data = {   
    [1] = {1,1003,1,1,101,1,38,15,999,0,6000,1,25,80000,3,2,2000,},  
    [2] = {2,1003,2,3,102,999,0,4500,1,25,60000,3,2,1400,0,0,0,},  
    [3] = {3,1003,4,5,103,999,0,3000,1,25,40000,3,2,900,0,0,0,},  
    [4] = {4,1003,6,10,104,999,0,1800,1,25,20000,3,2,650,0,0,0,},  
    [5] = {5,1003,11,30,105,999,0,1200,1,25,14000,3,2,500,0,0,0,},  
    [6] = {6,1003,31,100,106,999,0,1000,1,25,9000,3,2,360,0,0,0,},  
    [7] = {7,1003,101,300,107,999,0,700,1,25,6000,3,2,260,0,0,0,},  
    [8] = {8,1003,301,800,108,999,0,400,1,25,3500,3,2,180,0,0,0,},  
    [9] = {9,1003,801,2000,109,1,25,2000,3,2,130,0,0,0,0,0,0,},  
    [10] = {101,1002,1,1,101,1,38,10,999,0,5500,1,25,70000,3,2,1800,},  
    [11] = {102,1002,2,3,102,999,0,4000,1,25,50000,3,2,1200,0,0,0,},  
    [12] = {103,1002,4,5,103,999,0,2500,1,25,30000,3,2,800,0,0,0,},  
    [13] = {104,1002,6,10,104,999,0,1600,1,25,18000,3,2,600,0,0,0,},  
    [14] = {105,1002,11,30,105,999,0,1200,1,25,12000,3,2,450,0,0,0,},  
    [15] = {106,1002,31,100,106,999,0,900,1,25,8000,3,2,330,0,0,0,},  
    [16] = {107,1002,101,300,107,999,0,600,1,25,5000,3,2,230,0,0,0,},  
    [17] = {108,1002,301,800,108,999,0,300,1,25,3000,3,2,160,0,0,0,},  
    [18] = {109,1002,801,2000,109,1,25,1500,3,2,110,0,0,0,0,0,0,},  
    [19] = {201,1001,1,1,101,1,38,5,999,0,5000,1,25,65000,3,2,1600,},  
    [20] = {202,1001,2,3,102,999,0,3500,1,25,45000,3,2,1000,0,0,0,},  
    [21] = {203,1001,4,5,103,999,0,2000,1,25,25000,3,2,700,0,0,0,},  
    [22] = {204,1001,6,10,104,999,0,1400,1,25,16000,3,2,550,0,0,0,},  
    [23] = {205,1001,11,30,105,999,0,1100,1,25,10000,3,2,400,0,0,0,},  
    [24] = {206,1001,31,100,106,999,0,800,1,25,7000,3,2,300,0,0,0,},  
    [25] = {207,1001,101,300,107,999,0,500,1,25,4000,3,2,200,0,0,0,},  
    [26] = {208,1001,301,800,108,999,0,200,1,25,2500,3,2,150,0,0,0,},  
    [27] = {209,1001,801,2000,109,1,25,1000,3,2,100,0,0,0,0,0,0,},
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
    [101] = 10,  
    [102] = 11,  
    [103] = 12,  
    [104] = 13,  
    [105] = 14,  
    [106] = 15,  
    [107] = 16,  
    [108] = 17,  
    [109] = 18,  
    [201] = 19,  
    [202] = 20,  
    [203] = 21,  
    [204] = 22,  
    [205] = 23,  
    [206] = 24,  
    [207] = 25,  
    [208] = 26,  
    [209] = 27,
}

local __key_map = { 
    id = 1,
    rank_type = 2,
    min_rank = 3,
    max_rank = 4,
    lord_id = 5,
    reward_type1 = 6,
    reward_value1 = 7,
    reward_size1 = 8,
    reward_type2 = 9,
    reward_value2 = 10,
    reward_size2 = 11,
    reward_type3 = 12,
    reward_value3 = 13,
    reward_size3 = 14,
    reward_type4 = 15,
    reward_value4 = 16,
    reward_size4 = 17,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_storm_city_rank_info")

        return t._raw[__key_map[k]]
    end
}


function storm_city_rank_info.getLength()
    return #storm_city_rank_info._data
end



function storm_city_rank_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_storm_city_rank_info
function storm_city_rank_info.indexOf(index)
    if index == nil or not storm_city_rank_info._data[index] then
        return nil
    end
    return setmetatable({_raw = storm_city_rank_info._data[index]}, m)
end



---
--@return @class record_storm_city_rank_info
function storm_city_rank_info.get(id)
    
    return storm_city_rank_info.indexOf(__index_id[ id ])
     
end



function storm_city_rank_info.set(id, key, value)
    local record = storm_city_rank_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function storm_city_rank_info.get_index_data()
    return __index_id 
end

return  storm_city_rank_info 