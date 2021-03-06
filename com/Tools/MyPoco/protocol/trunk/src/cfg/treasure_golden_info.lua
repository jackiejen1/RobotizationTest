---@classdef record_treasure_golden_info
local record_treasure_golden_info = {}


record_treasure_golden_info.id = 0--ID
record_treasure_golden_info.treature_id = 0--宝物id
record_treasure_golden_info.level = 0--等级
record_treasure_golden_info.type = 0--类型
record_treasure_golden_info.name =  ""--名称
record_treasure_golden_info.lock_level = 0--解锁精炼等级
record_treasure_golden_info.cost_type = 0--消耗类型
record_treasure_golden_info.cost_value = 0--消耗类型值
record_treasure_golden_info.cost_size = 0--消耗数量
record_treasure_golden_info.affect_type_1 = 0--属性1
record_treasure_golden_info.affect_value_1 = 0--属性值1
record_treasure_golden_info.affect_type_2 = 0--属性2
record_treasure_golden_info.affect_value_2 = 0--属性值2
record_treasure_golden_info.affect_type_3 = 0--属性3
record_treasure_golden_info.affect_value_3 = 0--属性值3
record_treasure_golden_info.talent_skill_id = 0--天赋属性
record_treasure_golden_info.gold_id = 0--升金id

local treasure_golden_info = {
   _data = {   
    [1] = {1,11210,1,1,"两仪",3,8,14010,2,2,13000,1,247000,0,0,0,0,},  
    [2] = {2,11210,2,1,"两仪",3,8,14010,4,2,15000,1,285000,0,0,0,0,},  
    [3] = {3,11210,3,1,"两仪",3,3,157,10,2,40000,1,760000,0,0,170101,0,},  
    [4] = {4,11210,4,2,"四象",3,8,14010,6,2,18000,1,342000,0,0,0,0,},  
    [5] = {5,11210,5,2,"四象",3,8,14010,9,2,21000,1,399000,0,0,0,0,},  
    [6] = {6,11210,6,2,"四象",3,8,14010,12,2,24000,1,456000,0,0,0,0,},  
    [7] = {7,11210,7,2,"四象",3,8,14010,15,2,27000,1,513000,0,0,0,0,},  
    [8] = {8,11210,8,2,"四象",5,3,157,25,2,80000,1,1520000,0,0,170102,0,},  
    [9] = {9,11210,9,3,"八卦",5,8,14010,16,2,31000,1,589000,0,0,0,0,},  
    [10] = {10,11210,10,3,"八卦",5,8,14010,18,2,35000,1,665000,0,0,0,0,},  
    [11] = {11,11210,11,3,"八卦",5,8,14010,20,2,39000,1,741000,0,0,0,0,},  
    [12] = {12,11210,12,3,"八卦",5,8,14010,22,2,43000,1,817000,0,0,0,0,},  
    [13] = {13,11210,13,3,"八卦",5,8,14010,24,2,47000,1,893000,0,0,0,0,},  
    [14] = {14,11210,14,3,"八卦",5,8,14010,26,2,51000,1,969000,0,0,0,0,},  
    [15] = {15,11210,15,3,"八卦",5,8,14010,28,2,55000,1,1045000,0,0,0,0,},  
    [16] = {16,11210,16,3,"八卦",5,8,14010,30,2,59000,1,1121000,0,0,0,0,},  
    [17] = {17,11210,17,3,"八卦",10,3,157,40,2,120000,1,2280000,0,0,170103,11410,},  
    [18] = {18,11320,1,1,"两仪",3,8,14010,2,2,13000,1,247000,0,0,0,0,},  
    [19] = {19,11320,2,1,"两仪",3,8,14010,4,2,15000,1,285000,0,0,0,0,},  
    [20] = {20,11320,3,1,"两仪",3,3,157,10,2,40000,1,760000,0,0,170101,0,},  
    [21] = {21,11320,4,2,"四象",3,8,14010,6,2,18000,1,342000,0,0,0,0,},  
    [22] = {22,11320,5,2,"四象",3,8,14010,9,2,21000,1,399000,0,0,0,0,},  
    [23] = {23,11320,6,2,"四象",3,8,14010,12,2,24000,1,456000,0,0,0,0,},  
    [24] = {24,11320,7,2,"四象",3,8,14010,15,2,27000,1,513000,0,0,0,0,},  
    [25] = {25,11320,8,2,"四象",5,3,157,25,2,80000,1,1520000,0,0,170102,0,},  
    [26] = {26,11320,9,3,"八卦",5,8,14010,16,2,31000,1,589000,0,0,0,0,},  
    [27] = {27,11320,10,3,"八卦",5,8,14010,18,2,35000,1,665000,0,0,0,0,},  
    [28] = {28,11320,11,3,"八卦",5,8,14010,20,2,39000,1,741000,0,0,0,0,},  
    [29] = {29,11320,12,3,"八卦",5,8,14010,22,2,43000,1,817000,0,0,0,0,},  
    [30] = {30,11320,13,3,"八卦",5,8,14010,24,2,47000,1,893000,0,0,0,0,},  
    [31] = {31,11320,14,3,"八卦",5,8,14010,26,2,51000,1,969000,0,0,0,0,},  
    [32] = {32,11320,15,3,"八卦",5,8,14010,28,2,55000,1,1045000,0,0,0,0,},  
    [33] = {33,11320,16,3,"八卦",5,8,14010,30,2,59000,1,1121000,0,0,0,0,},  
    [34] = {34,11320,17,3,"八卦",10,3,157,40,2,120000,1,2280000,0,0,170103,11420,},  
    [35] = {35,12210,1,1,"两仪",3,8,14020,2,1,247000,5,6500,0,0,0,0,},  
    [36] = {36,12210,2,1,"两仪",3,8,14020,4,1,285000,5,7500,0,0,0,0,},  
    [37] = {37,12210,3,1,"两仪",3,3,157,10,1,760000,5,20000,0,0,170201,0,},  
    [38] = {38,12210,4,2,"四象",3,8,14020,6,1,342000,5,9000,0,0,0,0,},  
    [39] = {39,12210,5,2,"四象",3,8,14020,9,1,399000,5,10500,0,0,0,0,},  
    [40] = {40,12210,6,2,"四象",3,8,14020,12,1,456000,5,12000,0,0,0,0,},  
    [41] = {41,12210,7,2,"四象",3,8,14020,15,1,513000,5,13500,0,0,0,0,},  
    [42] = {42,12210,8,2,"四象",5,3,157,25,1,1520000,5,40000,0,0,170202,0,},  
    [43] = {43,12210,9,3,"八卦",5,8,14020,16,1,589000,5,15500,0,0,0,0,},  
    [44] = {44,12210,10,3,"八卦",5,8,14020,18,1,665000,5,17500,0,0,0,0,},  
    [45] = {45,12210,11,3,"八卦",5,8,14020,20,1,741000,5,19500,0,0,0,0,},  
    [46] = {46,12210,12,3,"八卦",5,8,14020,22,1,817000,5,21500,0,0,0,0,},  
    [47] = {47,12210,13,3,"八卦",5,8,14020,24,1,893000,5,23500,0,0,0,0,},  
    [48] = {48,12210,14,3,"八卦",5,8,14020,26,1,969000,5,25500,0,0,0,0,},  
    [49] = {49,12210,15,3,"八卦",5,8,14020,28,1,1045000,5,27500,0,0,0,0,},  
    [50] = {50,12210,16,3,"八卦",5,8,14020,30,1,1121000,5,29500,0,0,0,0,},  
    [51] = {51,12210,17,3,"八卦",10,3,157,40,1,2280000,5,60000,0,0,170203,12410,},  
    [52] = {52,12320,1,1,"两仪",3,8,14020,2,1,247000,5,6500,0,0,0,0,},  
    [53] = {53,12320,2,1,"两仪",3,8,14020,4,1,285000,5,7500,0,0,0,0,},  
    [54] = {54,12320,3,1,"两仪",3,3,157,10,1,760000,5,20000,0,0,170201,0,},  
    [55] = {55,12320,4,2,"四象",3,8,14020,6,1,342000,5,9000,0,0,0,0,},  
    [56] = {56,12320,5,2,"四象",3,8,14020,9,1,399000,5,10500,0,0,0,0,},  
    [57] = {57,12320,6,2,"四象",3,8,14020,12,1,456000,5,12000,0,0,0,0,},  
    [58] = {58,12320,7,2,"四象",3,8,14020,15,1,513000,5,13500,0,0,0,0,},  
    [59] = {59,12320,8,2,"四象",5,3,157,25,1,1520000,5,40000,0,0,170202,0,},  
    [60] = {60,12320,9,3,"八卦",5,8,14020,16,1,589000,5,15500,0,0,0,0,},  
    [61] = {61,12320,10,3,"八卦",5,8,14020,18,1,665000,5,17500,0,0,0,0,},  
    [62] = {62,12320,11,3,"八卦",5,8,14020,20,1,741000,5,19500,0,0,0,0,},  
    [63] = {63,12320,12,3,"八卦",5,8,14020,22,1,817000,5,21500,0,0,0,0,},  
    [64] = {64,12320,13,3,"八卦",5,8,14020,24,1,893000,5,23500,0,0,0,0,},  
    [65] = {65,12320,14,3,"八卦",5,8,14020,26,1,969000,5,25500,0,0,0,0,},  
    [66] = {66,12320,15,3,"八卦",5,8,14020,28,1,1045000,5,27500,0,0,0,0,},  
    [67] = {67,12320,16,3,"八卦",5,8,14020,30,1,1121000,5,29500,0,0,0,0,},  
    [68] = {68,12320,17,3,"八卦",10,3,157,40,1,2280000,5,60000,0,0,170203,12420,},
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
    [57] = 57,  
    [58] = 58,  
    [59] = 59,  
    [60] = 60,  
    [61] = 61,  
    [62] = 62,  
    [63] = 63,  
    [64] = 64,  
    [65] = 65,  
    [66] = 66,  
    [67] = 67,  
    [68] = 68,
}

local __key_map = { 
    id = 1,
    treature_id = 2,
    level = 3,
    type = 4,
    name = 5,
    lock_level = 6,
    cost_type = 7,
    cost_value = 8,
    cost_size = 9,
    affect_type_1 = 10,
    affect_value_1 = 11,
    affect_type_2 = 12,
    affect_value_2 = 13,
    affect_type_3 = 14,
    affect_value_3 = 15,
    talent_skill_id = 16,
    gold_id = 17,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_treasure_golden_info")

        return t._raw[__key_map[k]]
    end
}


function treasure_golden_info.getLength()
    return #treasure_golden_info._data
end



function treasure_golden_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_treasure_golden_info
function treasure_golden_info.indexOf(index)
    if index == nil or not treasure_golden_info._data[index] then
        return nil
    end
    return setmetatable({_raw = treasure_golden_info._data[index]}, m)
end



---
--@return @class record_treasure_golden_info
function treasure_golden_info.get(id)
    
    return treasure_golden_info.indexOf(__index_id[ id ])
     
end



function treasure_golden_info.set(id, key, value)
    local record = treasure_golden_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function treasure_golden_info.get_index_data()
    return __index_id 
end

return  treasure_golden_info 