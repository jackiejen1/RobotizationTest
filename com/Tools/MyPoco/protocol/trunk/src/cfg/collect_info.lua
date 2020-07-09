---@classdef record_collect_info
local record_collect_info = {}


record_collect_info.id = 0--编号
record_collect_info.target_type_1 = 0--收集类型1
record_collect_info.target_id_1 = 0--收集目标1
record_collect_info.target_type_2 = 0--收集类型2
record_collect_info.target_id_2 = 0--收集目标2
record_collect_info.target_type_3 = 0--收集类型3
record_collect_info.target_id_3 = 0--收集目标3
record_collect_info.target_type_4 = 0--收集类型4
record_collect_info.target_id_4 = 0--收集目标4
record_collect_info.sort = 0--排序值
record_collect_info.reward_type_1 = 0--奖励类型1
record_collect_info.reward_value_1 = 0--奖励类型值1
record_collect_info.reward_size_1 = 0--奖励数量1
record_collect_info.reward_type_2 = 0--奖励类型2
record_collect_info.reward_value_2 = 0--奖励类型值2
record_collect_info.reward_size_2 = 0--奖励数量2
record_collect_info.reward_type_3 = 0--奖励类型3
record_collect_info.reward_value_3 = 0--奖励类型值3
record_collect_info.reward_size_3 = 0--奖励数量3
record_collect_info.reward_type_4 = 0--奖励类型4
record_collect_info.reward_value_4 = 0--奖励类型值4
record_collect_info.reward_size_4 = 0--奖励数量4

local collect_info = {
   _data = {   
    [1] = {1,56,40040,38,400140,38,400150,0,0,1,3,32,5,3,35,500,0,0,0,0,0,0,},  
    [2] = {2,56,40050,38,400110,38,400090,0,0,2,3,32,5,3,35,500,0,0,0,0,0,0,},  
    [3] = {3,56,40060,38,400010,38,400040,0,0,3,3,32,5,3,35,500,0,0,0,0,0,0,},  
    [4] = {4,56,40070,38,400030,38,400120,0,0,4,3,32,5,3,35,500,0,0,0,0,0,0,},  
    [5] = {5,56,40080,38,500230,38,400020,0,0,5,3,27,10,3,32,1,3,35,800,0,0,0,},  
    [6] = {6,56,40090,38,500220,38,400160,0,0,6,3,27,10,3,32,1,3,35,800,0,0,0,},  
    [7] = {7,56,40100,38,500120,38,400080,0,0,7,3,27,10,3,32,1,3,35,800,0,0,0,},  
    [8] = {8,56,40110,38,500170,38,400100,0,0,8,3,27,10,3,32,1,3,35,800,0,0,0,},  
    [9] = {9,56,50010,38,500040,38,500050,0,0,9,3,28,10,3,32,3,3,35,1500,1,3,100000,},  
    [10] = {10,56,50020,38,500200,38,500240,0,0,10,3,28,10,3,32,3,3,35,1500,1,3,100000,},  
    [11] = {11,56,50030,38,500090,38,500100,0,0,11,3,28,10,3,32,3,3,35,1500,1,3,100000,},  
    [12] = {12,56,50040,38,500140,38,500150,0,0,12,3,28,10,3,32,3,3,35,1500,1,3,100000,},  
    [13] = {13,56,50050,38,500190,38,500180,0,0,13,3,28,10,3,32,3,3,35,1500,1,3,100000,},  
    [14] = {14,56,50060,38,500020,38,500060,0,0,14,3,28,10,3,32,3,3,35,1500,1,3,100000,},
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
}

local __key_map = { 
    id = 1,
    target_type_1 = 2,
    target_id_1 = 3,
    target_type_2 = 4,
    target_id_2 = 5,
    target_type_3 = 6,
    target_id_3 = 7,
    target_type_4 = 8,
    target_id_4 = 9,
    sort = 10,
    reward_type_1 = 11,
    reward_value_1 = 12,
    reward_size_1 = 13,
    reward_type_2 = 14,
    reward_value_2 = 15,
    reward_size_2 = 16,
    reward_type_3 = 17,
    reward_value_3 = 18,
    reward_size_3 = 19,
    reward_type_4 = 20,
    reward_value_4 = 21,
    reward_size_4 = 22,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_collect_info")

        return t._raw[__key_map[k]]
    end
}


function collect_info.getLength()
    return #collect_info._data
end



function collect_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_collect_info
function collect_info.indexOf(index)
    if index == nil or not collect_info._data[index] then
        return nil
    end
    return setmetatable({_raw = collect_info._data[index]}, m)
end



---
--@return @class record_collect_info
function collect_info.get(id)
    
    return collect_info.indexOf(__index_id[ id ])
     
end



function collect_info.set(id, key, value)
    local record = collect_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function collect_info.get_index_data()
    return __index_id 
end

return  collect_info 