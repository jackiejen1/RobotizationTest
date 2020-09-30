---@classdef record_gvg_rank_award_info
local record_gvg_rank_award_info = {}


record_gvg_rank_award_info.id = 0--id
record_gvg_rank_award_info.rank_type = 0--排名类型
record_gvg_rank_award_info.min_rank = 0--最小排名
record_gvg_rank_award_info.max_rank = 0--最大排名
record_gvg_rank_award_info.reward_type1 = 0--奖励类型1
record_gvg_rank_award_info.reward_value1 = 0--奖励类型值1
record_gvg_rank_award_info.reward_size1 = 0--奖励数量1
record_gvg_rank_award_info.reward_type2 = 0--奖励类型2
record_gvg_rank_award_info.reward_value2 = 0--奖励类型值2
record_gvg_rank_award_info.reward_size2 = 0--奖励数量2
record_gvg_rank_award_info.extra_reward_type_1 = 0--额外奖励类型1
record_gvg_rank_award_info.extra_reward_value_1 = 0--额外奖励类型值1
record_gvg_rank_award_info.extra_reward_size_1 = 0--额外奖励数量1
record_gvg_rank_award_info.extra_reward_type_2 = 0--额外奖励类型2
record_gvg_rank_award_info.extra_reward_value_2 = 0--额外奖励类型值2
record_gvg_rank_award_info.extra_reward_size_2 = 0--额外奖励数量2
record_gvg_rank_award_info.guild_icon_id_1 = 0--军团iconID
record_gvg_rank_award_info.guild_icon_id_2 = 0--军团iconID

local gvg_rank_award_info = {
   _data = {   
    [1] = {1,1,1,1,999,0,1000,0,0,0,0,0,0,0,0,0,0,0,},  
    [2] = {2,1,2,2,999,0,900,0,0,0,0,0,0,0,0,0,0,0,},  
    [3] = {3,1,3,3,999,0,800,0,0,0,0,0,0,0,0,0,0,0,},  
    [4] = {4,1,4,4,999,0,700,0,0,0,0,0,0,0,0,0,0,0,},  
    [5] = {5,1,5,5,999,0,600,0,0,0,0,0,0,0,0,0,0,0,},  
    [6] = {6,1,6,6,999,0,500,0,0,0,0,0,0,0,0,0,0,0,},  
    [7] = {7,1,7,7,999,0,400,0,0,0,0,0,0,0,0,0,0,0,},  
    [8] = {8,1,8,8,999,0,300,0,0,0,0,0,0,0,0,0,0,0,},  
    [9] = {9,1,9,9,999,0,200,0,0,0,0,0,0,0,0,0,0,0,},  
    [10] = {10,1,10,10,999,0,100,0,0,0,0,0,0,0,0,0,0,0,},  
    [11] = {11,1,11,11,999,0,50,0,0,0,0,0,0,0,0,0,0,0,},  
    [12] = {12,1,12,12,999,0,10,0,0,0,0,0,0,0,0,0,0,0,},  
    [13] = {1001,2,1,1,999,0,1000,0,0,0,0,0,0,0,0,0,3,7,},  
    [14] = {1002,2,2,2,999,0,900,0,0,0,0,0,0,0,0,0,3,7,},  
    [15] = {1003,2,3,3,999,0,800,0,0,0,0,0,0,0,0,0,3,7,},  
    [16] = {1004,2,4,4,999,0,700,0,0,0,0,0,0,0,0,0,3,7,},  
    [17] = {1005,2,5,5,999,0,600,0,0,0,0,0,0,0,0,0,3,7,},  
    [18] = {1006,2,6,6,999,0,500,0,0,0,0,0,0,0,0,0,3,7,},  
    [19] = {1007,2,7,7,999,0,400,0,0,0,0,0,0,0,0,0,3,7,},  
    [20] = {1008,2,8,8,999,0,300,0,0,0,0,0,0,0,0,0,3,7,},  
    [21] = {1009,2,9,9,999,0,200,0,0,0,0,0,0,0,0,0,3,7,},  
    [22] = {1010,2,10,10,999,0,100,0,0,0,0,0,0,0,0,0,3,7,},  
    [23] = {1011,2,11,11,999,0,50,0,0,0,0,0,0,0,0,0,3,7,},  
    [24] = {1012,2,12,12,999,0,10,0,0,0,0,0,0,0,0,0,3,7,},
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
    [1001] = 13,  
    [1002] = 14,  
    [1003] = 15,  
    [1004] = 16,  
    [1005] = 17,  
    [1006] = 18,  
    [1007] = 19,  
    [1008] = 20,  
    [1009] = 21,  
    [1010] = 22,  
    [1011] = 23,  
    [1012] = 24,
}

local __key_map = { 
    id = 1,
    rank_type = 2,
    min_rank = 3,
    max_rank = 4,
    reward_type1 = 5,
    reward_value1 = 6,
    reward_size1 = 7,
    reward_type2 = 8,
    reward_value2 = 9,
    reward_size2 = 10,
    extra_reward_type_1 = 11,
    extra_reward_value_1 = 12,
    extra_reward_size_1 = 13,
    extra_reward_type_2 = 14,
    extra_reward_value_2 = 15,
    extra_reward_size_2 = 16,
    guild_icon_id_1 = 17,
    guild_icon_id_2 = 18,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_gvg_rank_award_info")

        return t._raw[__key_map[k]]
    end
}


function gvg_rank_award_info.getLength()
    return #gvg_rank_award_info._data
end



function gvg_rank_award_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_gvg_rank_award_info
function gvg_rank_award_info.indexOf(index)
    if index == nil or not gvg_rank_award_info._data[index] then
        return nil
    end
    return setmetatable({_raw = gvg_rank_award_info._data[index]}, m)
end



---
--@return @class record_gvg_rank_award_info
function gvg_rank_award_info.get(id)
    
    return gvg_rank_award_info.indexOf(__index_id[ id ])
     
end



function gvg_rank_award_info.set(id, key, value)
    local record = gvg_rank_award_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function gvg_rank_award_info.get_index_data()
    return __index_id 
end

return  gvg_rank_award_info 