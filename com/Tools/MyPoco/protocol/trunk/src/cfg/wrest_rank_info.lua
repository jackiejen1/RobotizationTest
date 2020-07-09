---@classdef record_wrest_rank_info
local record_wrest_rank_info = {}


record_wrest_rank_info.group = 0--排名组
record_wrest_rank_info.rank = 0--排名
record_wrest_rank_info.output_addition = 0--产量加成
record_wrest_rank_info.reward_type1 = 0--奖励类型1
record_wrest_rank_info.reward_value1 = 0--奖励类型值1
record_wrest_rank_info.reward_size1 = 0--奖励数量1
record_wrest_rank_info.reward_type2 = 0--奖励类型2
record_wrest_rank_info.reward_value2 = 0--奖励类型值2
record_wrest_rank_info.reward_size2 = 0--奖励数量2
record_wrest_rank_info.reward_type3 = 0--奖励类型3
record_wrest_rank_info.reward_value3 = 0--奖励类型值3
record_wrest_rank_info.reward_size3 = 0--奖励数量3
record_wrest_rank_info.reward_type4 = 0--奖励类型4
record_wrest_rank_info.reward_value4 = 0--奖励类型值4
record_wrest_rank_info.reward_size4 = 0--奖励数量4

local wrest_rank_info = {
   _data = {   
    [1] = {1,1,0,999,0,800,3,2,200,0,0,0,0,0,0,},  
    [2] = {2,1,0,999,0,1200,3,2,500,9,70,1,0,0,0,},  
    [3] = {3,1,0,999,0,1800,3,2,800,9,71,1,0,0,0,},  
    [4] = {4,1,150,999,0,3000,3,2,2000,9,74,1,0,0,0,},  
    [5] = {4,2,100,999,0,2500,3,2,1600,9,73,1,0,0,0,},  
    [6] = {4,3,60,999,0,2000,3,2,1200,9,72,1,0,0,0,},  
    [7] = {5,1,200,999,0,3000,3,2,2000,3,191,1,0,0,0,},  
    [8] = {5,2,100,999,0,1500,3,2,1500,3,190,1,0,0,0,},  
    [9] = {5,3,0,999,0,1000,3,2,1000,3,189,1,0,0,0,},
    }
}

local __index_group_rank = {   
    ["1_1"] = 1,  
    ["2_1"] = 2,  
    ["3_1"] = 3,  
    ["4_1"] = 4,  
    ["4_2"] = 5,  
    ["4_3"] = 6,  
    ["5_1"] = 7,  
    ["5_2"] = 8,  
    ["5_3"] = 9,
}

local __key_map = { 
    group = 1,
    rank = 2,
    output_addition = 3,
    reward_type1 = 4,
    reward_value1 = 5,
    reward_size1 = 6,
    reward_type2 = 7,
    reward_value2 = 8,
    reward_size2 = 9,
    reward_type3 = 10,
    reward_value3 = 11,
    reward_size3 = 12,
    reward_type4 = 13,
    reward_value4 = 14,
    reward_size4 = 15,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_wrest_rank_info")

        return t._raw[__key_map[k]]
    end
}


function wrest_rank_info.getLength()
    return #wrest_rank_info._data
end



function wrest_rank_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_wrest_rank_info
function wrest_rank_info.indexOf(index)
    if index == nil or not wrest_rank_info._data[index] then
        return nil
    end
    return setmetatable({_raw = wrest_rank_info._data[index]}, m)
end



---
--@return @class record_wrest_rank_info
function wrest_rank_info.get(group,rank)
    
    local k = group .. '_' .. rank
    return wrest_rank_info.indexOf(__index_group_rank[k])
     
end



function wrest_rank_info.set(group,rank, key, value)
    local record = wrest_rank_info.get(group,rank)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function wrest_rank_info.get_index_data()
    return __index_group_rank 
end

return  wrest_rank_info 