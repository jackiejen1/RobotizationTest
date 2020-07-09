---@classdef record_recruit_knight_cost_gain_info
local record_recruit_knight_cost_gain_info = {}


record_recruit_knight_cost_gain_info.id = 0--编号
record_recruit_knight_cost_gain_info.type = 0--招募类型
record_recruit_knight_cost_gain_info.cost_type_1 = 0--消耗类型1
record_recruit_knight_cost_gain_info.cost_value_1 = 0--消耗类型值1
record_recruit_knight_cost_gain_info.cost_size_1 = 0--消耗数量1
record_recruit_knight_cost_gain_info.discount_1 = 0--消耗1折扣
record_recruit_knight_cost_gain_info.cost_type_2 = 0--消耗类型2
record_recruit_knight_cost_gain_info.cost_value_2 = 0--消耗类型值2
record_recruit_knight_cost_gain_info.cost_size_2 = 0--买消耗数量2
record_recruit_knight_cost_gain_info.discount_2 = 0--消耗2折扣
record_recruit_knight_cost_gain_info.gain_type = 0--购得物品类型
record_recruit_knight_cost_gain_info.gain_value = 0--购得物品类型值
record_recruit_knight_cost_gain_info.gain_size = 0--购得物品数量
record_recruit_knight_cost_gain_info.extra_cost_type = 0--其他消耗类型
record_recruit_knight_cost_gain_info.extra_cost_value = 0--其他消耗类型值
record_recruit_knight_cost_gain_info.extra_cost_size = 0--其他消耗数量

local recruit_knight_cost_gain_info = {
   _data = {   
    [1] = {1,1,3,5,1,0,0,0,0,0,1,16,50,0,0,0,},  
    [2] = {2,2,3,6,1,0,0,0,0,0,1,16,150,3,38,1,},  
    [3] = {3,3,3,5,10,0,0,0,0,0,1,16,500,0,0,0,},  
    [4] = {4,4,3,6,10,0,0,0,0,0,1,16,1500,0,0,0,},  
    [5] = {5,5,3,57,1,0,0,0,0,0,0,0,10,0,0,0,},  
    [6] = {6,5,3,57,10,0,0,0,0,0,0,0,100,0,0,0,},  
    [7] = {7,6,3,51,1,0,0,0,0,0,1,28,100,0,0,0,},  
    [8] = {8,7,3,51,10,0,0,0,0,0,1,28,1000,0,0,0,},  
    [9] = {9,8,3,53,1,0,0,0,0,0,0,0,0,0,0,0,},  
    [10] = {10,9,3,53,10,0,0,0,0,0,0,0,0,0,0,0,},  
    [11] = {11,10,3,59,1,0,0,0,0,0,0,0,0,0,0,0,},  
    [12] = {12,11,3,59,10,0,0,0,0,0,0,0,0,0,0,0,},  
    [13] = {13,12,3,163,1,0,0,0,0,0,0,0,0,0,0,0,},  
    [14] = {14,13,3,163,10,0,0,0,0,0,0,0,0,0,0,0,},  
    [15] = {15,14,3,186,1,0,0,0,0,0,0,0,0,0,0,0,},  
    [16] = {16,15,3,186,10,0,0,0,0,0,0,0,0,0,0,0,},  
    [17] = {17,16,3,187,1,0,0,0,0,0,0,0,0,0,0,0,},  
    [18] = {18,17,3,187,10,0,0,0,0,0,0,0,0,0,0,0,},
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
}

local __key_map = { 
    id = 1,
    type = 2,
    cost_type_1 = 3,
    cost_value_1 = 4,
    cost_size_1 = 5,
    discount_1 = 6,
    cost_type_2 = 7,
    cost_value_2 = 8,
    cost_size_2 = 9,
    discount_2 = 10,
    gain_type = 11,
    gain_value = 12,
    gain_size = 13,
    extra_cost_type = 14,
    extra_cost_value = 15,
    extra_cost_size = 16,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_recruit_knight_cost_gain_info")

        return t._raw[__key_map[k]]
    end
}


function recruit_knight_cost_gain_info.getLength()
    return #recruit_knight_cost_gain_info._data
end



function recruit_knight_cost_gain_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_recruit_knight_cost_gain_info
function recruit_knight_cost_gain_info.indexOf(index)
    if index == nil or not recruit_knight_cost_gain_info._data[index] then
        return nil
    end
    return setmetatable({_raw = recruit_knight_cost_gain_info._data[index]}, m)
end



---
--@return @class record_recruit_knight_cost_gain_info
function recruit_knight_cost_gain_info.get(id)
    
    return recruit_knight_cost_gain_info.indexOf(__index_id[ id ])
     
end



function recruit_knight_cost_gain_info.set(id, key, value)
    local record = recruit_knight_cost_gain_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function recruit_knight_cost_gain_info.get_index_data()
    return __index_id 
end

return  recruit_knight_cost_gain_info 