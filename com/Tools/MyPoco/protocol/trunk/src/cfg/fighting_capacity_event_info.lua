---@classdef record_fighting_capacity_event_info
local record_fighting_capacity_event_info = {}


record_fighting_capacity_event_info.id = 0--ID
record_fighting_capacity_event_info.event = 0--活动
record_fighting_capacity_event_info.sub_event = 0--子活动
record_fighting_capacity_event_info.sub_event_paramete = 0--参数1
record_fighting_capacity_event_info.text_pic =  ""--美术字（已废弃）
record_fighting_capacity_event_info.reward_type_1 = 0--奖励1类型
record_fighting_capacity_event_info.reward_value_1 = 0--奖励1类型值
record_fighting_capacity_event_info.reward_size_1 = 0--奖励1数量
record_fighting_capacity_event_info.reward_type_2 = 0--奖励2类型
record_fighting_capacity_event_info.reward_value_2 = 0--奖励2类型值
record_fighting_capacity_event_info.reward_size_2 = 0--奖励2数量
record_fighting_capacity_event_info.reward_type_3 = 0--奖励3类型
record_fighting_capacity_event_info.reward_value_3 = 0--奖励3类型值
record_fighting_capacity_event_info.reward_size_3 = 0--奖励3数量
record_fighting_capacity_event_info.reward_type_4 = 0--奖励4类型
record_fighting_capacity_event_info.reward_value_4 = 0--奖励4类型值
record_fighting_capacity_event_info.reward_size_4 = 0--奖励4数量
record_fighting_capacity_event_info.reward_type_5 = 0--奖励5类型
record_fighting_capacity_event_info.reward_value_5 = 0--奖励5类型值
record_fighting_capacity_event_info.reward_size_5 = 0--奖励5数量

local fighting_capacity_event_info = {
   _data = {   
    [1] = {1,100000,1,1,"dianweijieshao",3,2041,1,3,22,100,3,37,200,0,0,0,0,0,0,},  
    [2] = {2,100000,1,2,"0",3,2041,1,3,22,80,3,37,150,0,0,0,0,0,0,},  
    [3] = {3,100000,1,3,"0",3,2041,1,3,22,60,3,37,120,0,0,0,0,0,0,},  
    [4] = {4,100000,1,4,"0",3,2041,1,3,22,50,3,37,100,0,0,0,0,0,0,},  
    [5] = {5,100000,1,5,"0",3,2041,1,3,22,40,3,37,100,0,0,0,0,0,0,},  
    [6] = {6,100000,1,6,"0",3,2030,1,3,22,30,3,37,90,0,0,0,0,0,0,},  
    [7] = {7,100000,1,7,"0",3,2030,1,3,22,20,3,37,90,0,0,0,0,0,0,},  
    [8] = {8,100000,1,8,"0",3,2030,1,3,22,10,3,37,80,0,0,0,0,0,0,},  
    [9] = {9,100000,1,9,"0",3,2030,1,3,37,80,0,0,0,0,0,0,0,0,0,},  
    [10] = {10,100000,1,10,"0",3,2030,1,3,37,75,0,0,0,0,0,0,0,0,0,},  
    [11] = {11,100000,1,11,"0",3,2036,60,3,37,75,0,0,0,0,0,0,0,0,0,},  
    [12] = {12,100000,1,12,"0",3,2036,60,3,37,70,0,0,0,0,0,0,0,0,0,},  
    [13] = {13,100000,1,13,"0",3,2036,50,3,37,70,0,0,0,0,0,0,0,0,0,},  
    [14] = {14,100000,1,14,"0",3,2036,50,3,37,65,0,0,0,0,0,0,0,0,0,},  
    [15] = {15,100000,1,15,"0",3,2036,40,3,37,60,0,0,0,0,0,0,0,0,0,},  
    [16] = {16,100000,1,16,"0",3,2036,40,3,37,55,0,0,0,0,0,0,0,0,0,},  
    [17] = {17,100000,1,17,"0",3,2036,40,3,37,50,0,0,0,0,0,0,0,0,0,},  
    [18] = {18,100000,1,18,"0",3,2036,30,3,37,45,0,0,0,0,0,0,0,0,0,},  
    [19] = {19,100000,1,19,"0",3,2036,30,3,37,40,0,0,0,0,0,0,0,0,0,},  
    [20] = {20,100000,1,20,"0",3,2036,30,3,37,35,0,0,0,0,0,0,0,0,0,},  
    [21] = {21,100000,2,500000,"0",2,400100,15,3,2,50,1,3,90000,0,0,0,0,0,0,},  
    [22] = {22,100000,2,1000000,"0",2,400100,15,3,2,50,1,3,120000,0,0,0,0,0,0,},  
    [23] = {23,100000,2,1500000,"0",2,400100,15,3,2,100,1,3,150000,0,0,0,0,0,0,},  
    [24] = {24,100000,2,2000000,"0",2,400100,40,3,2,100,1,3,200000,0,0,0,0,0,0,},  
    [25] = {25,100000,2,2500000,"0",2,400100,80,3,2,100,1,3,250000,0,0,0,0,0,0,},  
    [26] = {26,100000,2,3000000,"0",3,27,10,3,32,1,3,35,500,0,0,0,0,0,0,},  
    [27] = {27,100000,2,4000000,"0",3,27,10,3,32,2,3,35,800,0,0,0,0,0,0,},  
    [28] = {28,100000,2,5000000,"0",3,27,10,3,32,3,3,35,1000,0,0,0,0,0,0,},  
    [29] = {29,100001,1,1,"0",3,2084,210,3,2061,1,3,22,300,3,37,300,0,0,0,},  
    [30] = {30,100001,1,2,"0",3,2084,150,3,2061,1,3,22,250,3,37,250,0,0,0,},  
    [31] = {31,100001,1,3,"0",3,2084,120,3,2061,1,3,22,200,3,37,200,0,0,0,},  
    [32] = {32,100001,1,4,"0",3,2084,90,3,2061,1,3,22,150,3,37,150,0,0,0,},  
    [33] = {33,100001,1,5,"0",3,2084,80,3,2061,1,3,22,150,3,37,150,0,0,0,},  
    [34] = {34,100001,1,6,"0",3,2084,70,3,2061,1,3,22,130,3,37,130,0,0,0,},  
    [35] = {35,100001,1,7,"0",3,2084,60,3,2061,1,3,22,130,3,37,130,0,0,0,},  
    [36] = {36,100001,1,8,"0",3,2084,50,3,2061,1,3,22,100,3,37,100,0,0,0,},  
    [37] = {37,100001,1,9,"0",3,2084,40,3,2061,1,3,22,100,3,37,100,0,0,0,},  
    [38] = {38,100001,1,10,"0",3,2084,30,3,2061,1,3,22,100,3,37,100,0,0,0,},  
    [39] = {39,100001,1,11,"0",3,2061,1,3,22,80,3,37,80,0,0,0,0,0,0,},  
    [40] = {40,100001,1,12,"0",3,2061,1,3,22,80,3,37,80,0,0,0,0,0,0,},  
    [41] = {41,100001,1,13,"0",3,2061,1,3,22,60,3,37,60,0,0,0,0,0,0,},  
    [42] = {42,100001,1,14,"0",3,2061,1,3,22,60,3,37,60,0,0,0,0,0,0,},  
    [43] = {43,100001,1,15,"0",3,2061,1,3,22,50,3,37,50,0,0,0,0,0,0,},  
    [44] = {44,100001,1,16,"0",3,2061,1,3,22,50,3,37,50,0,0,0,0,0,0,},  
    [45] = {45,100001,1,17,"0",3,2061,1,3,22,40,3,37,40,0,0,0,0,0,0,},  
    [46] = {46,100001,1,18,"0",3,2061,1,3,22,40,3,37,40,0,0,0,0,0,0,},  
    [47] = {47,100001,1,19,"0",3,2061,1,3,22,40,3,37,40,0,0,0,0,0,0,},  
    [48] = {48,100001,1,20,"0",3,2061,1,3,22,40,3,37,40,0,0,0,0,0,0,},  
    [49] = {49,100001,2,500000,"0",2,400100,30,3,2,50,1,3,200000,0,0,0,0,0,0,},  
    [50] = {50,100001,2,1000000,"0",2,400100,70,3,2,100,1,3,300000,0,0,0,0,0,0,},  
    [51] = {51,100001,2,1500000,"0",2,400100,100,3,2,150,1,3,400000,0,0,0,0,0,0,},  
    [52] = {52,100001,2,2000000,"0",3,22,30,3,2,200,1,3,500000,0,0,0,0,0,0,},  
    [53] = {53,100001,2,2500000,"0",3,22,50,3,2,300,1,3,700000,0,0,0,0,0,0,},  
    [54] = {54,100001,2,3000000,"0",3,27,30,3,32,30,3,35,1000,0,0,0,0,0,0,},  
    [55] = {55,100001,2,4000000,"0",3,27,50,3,32,50,3,35,3000,0,0,0,0,0,0,},  
    [56] = {56,100001,2,5000000,"0",3,28,30,3,32,80,3,35,5000,0,0,0,0,0,0,},
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
    [41] = 41,  
    [42] = 42,  
    [43] = 43,  
    [44] = 44,  
    [45] = 45,  
    [46] = 46,  
    [47] = 47,  
    [48] = 48,  
    [49] = 49,  
    [50] = 50,  
    [51] = 51,  
    [52] = 52,  
    [53] = 53,  
    [54] = 54,  
    [55] = 55,  
    [56] = 56,
}

local __key_map = { 
    id = 1,
    event = 2,
    sub_event = 3,
    sub_event_paramete = 4,
    text_pic = 5,
    reward_type_1 = 6,
    reward_value_1 = 7,
    reward_size_1 = 8,
    reward_type_2 = 9,
    reward_value_2 = 10,
    reward_size_2 = 11,
    reward_type_3 = 12,
    reward_value_3 = 13,
    reward_size_3 = 14,
    reward_type_4 = 15,
    reward_value_4 = 16,
    reward_size_4 = 17,
    reward_type_5 = 18,
    reward_value_5 = 19,
    reward_size_5 = 20,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_fighting_capacity_event_info")

        return t._raw[__key_map[k]]
    end
}


function fighting_capacity_event_info.getLength()
    return #fighting_capacity_event_info._data
end



function fighting_capacity_event_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_fighting_capacity_event_info
function fighting_capacity_event_info.indexOf(index)
    if index == nil or not fighting_capacity_event_info._data[index] then
        return nil
    end
    return setmetatable({_raw = fighting_capacity_event_info._data[index]}, m)
end



---
--@return @class record_fighting_capacity_event_info
function fighting_capacity_event_info.get(id)
    
    return fighting_capacity_event_info.indexOf(__index_id[ id ])
     
end



function fighting_capacity_event_info.set(id, key, value)
    local record = fighting_capacity_event_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function fighting_capacity_event_info.get_index_data()
    return __index_id 
end

return  fighting_capacity_event_info 