---@classdef record_material_exchange_info
local record_material_exchange_info = {}


record_material_exchange_info.id = 0--序号
record_material_exchange_info.type = 0-- 功能类型
record_material_exchange_info.target_type = 0--合成对象类型
record_material_exchange_info.target_value = 0--合成对象类型值
record_material_exchange_info.target_size = 0--合成对象数量
record_material_exchange_info.main_part_type = 0--合成主件类型
record_material_exchange_info.main_part_value = 0--合成主件类型值
record_material_exchange_info.main_part_size = 0--合成主件数量
record_material_exchange_info.fitting_part_type = 0--合成配件类型
record_material_exchange_info.fitting_part_value = 0--合成配件类型值
record_material_exchange_info.fitting_part_size = 0--合成配件数量
record_material_exchange_info.cost_type = 0--合成消耗类型
record_material_exchange_info.cost_value = 0--合成消耗类型值
record_material_exchange_info.cost_size = 0--合成消耗类型

local material_exchange_info = {
   _data = {   
    [1] = {1,1,6,5,1,6,1,1,6,73,1,0,0,0,},  
    [2] = {2,1,6,6,1,6,2,1,6,73,1,0,0,0,},  
    [3] = {3,1,6,7,1,6,3,1,6,73,1,0,0,0,},  
    [4] = {4,1,6,8,1,6,4,1,6,73,1,0,0,0,},  
    [5] = {5,1,6,9,1,6,5,1,6,73,1,0,0,0,},  
    [6] = {6,1,6,10,1,6,6,1,6,73,1,0,0,0,},  
    [7] = {7,1,6,11,1,6,7,1,6,73,1,0,0,0,},  
    [8] = {8,1,6,12,1,6,8,1,6,73,1,0,0,0,},  
    [9] = {9,1,6,13,1,6,9,2,6,73,1,0,0,0,},  
    [10] = {10,1,6,14,1,6,10,2,6,73,1,0,0,0,},  
    [11] = {11,1,6,15,1,6,11,2,6,73,1,0,0,0,},  
    [12] = {12,1,6,16,1,6,12,2,6,73,1,0,0,0,},  
    [13] = {13,1,6,17,1,6,13,1,6,73,1,0,0,0,},  
    [14] = {14,1,6,18,1,6,14,1,6,73,1,0,0,0,},  
    [15] = {15,1,6,19,1,6,15,1,6,73,1,0,0,0,},  
    [16] = {16,1,6,20,1,6,16,1,6,73,1,0,0,0,},  
    [17] = {17,1,6,21,1,6,17,1,6,73,1,0,0,0,},  
    [18] = {18,1,6,22,1,6,18,1,6,73,1,0,0,0,},  
    [19] = {19,1,6,23,1,6,19,1,6,73,1,0,0,0,},  
    [20] = {20,1,6,24,1,6,20,1,6,73,1,0,0,0,},  
    [21] = {21,1,6,25,1,6,21,2,6,73,1,0,0,0,},  
    [22] = {22,1,6,26,1,6,22,2,6,73,1,0,0,0,},  
    [23] = {23,1,6,27,1,6,23,2,6,73,1,0,0,0,},  
    [24] = {24,1,6,28,1,6,24,2,6,73,1,0,0,0,},  
    [25] = {25,1,6,29,1,6,25,1,6,73,1,0,0,0,},  
    [26] = {26,1,6,30,1,6,26,1,6,73,1,0,0,0,},  
    [27] = {27,1,6,31,1,6,27,1,6,73,1,0,0,0,},  
    [28] = {28,1,6,32,1,6,28,1,6,73,1,0,0,0,},  
    [29] = {29,1,6,33,1,6,29,1,6,73,1,0,0,0,},  
    [30] = {30,1,6,34,1,6,30,1,6,73,1,0,0,0,},  
    [31] = {31,1,6,35,1,6,31,1,6,73,1,0,0,0,},  
    [32] = {32,1,6,36,1,6,32,1,6,73,1,0,0,0,},  
    [33] = {33,1,6,37,1,6,33,2,6,73,1,0,0,0,},  
    [34] = {34,1,6,38,1,6,34,2,6,73,1,0,0,0,},  
    [35] = {35,1,6,39,1,6,35,2,6,73,1,0,0,0,},  
    [36] = {36,1,6,40,1,6,36,2,6,73,1,0,0,0,},  
    [37] = {37,1,6,41,1,6,37,1,6,73,1,0,0,0,},  
    [38] = {38,1,6,42,1,6,38,1,6,73,1,0,0,0,},  
    [39] = {39,1,6,43,1,6,39,1,6,73,1,0,0,0,},  
    [40] = {40,1,6,44,1,6,40,1,6,73,1,0,0,0,},  
    [41] = {41,1,6,45,1,6,41,1,6,73,1,0,0,0,},  
    [42] = {42,1,6,46,1,6,42,1,6,73,1,0,0,0,},  
    [43] = {43,1,6,47,1,6,43,1,6,73,1,0,0,0,},  
    [44] = {44,1,6,48,1,6,44,1,6,73,1,0,0,0,},  
    [45] = {45,1,6,49,1,6,45,2,6,73,1,0,0,0,},  
    [46] = {46,1,6,50,1,6,46,2,6,73,1,0,0,0,},  
    [47] = {47,1,6,51,1,6,47,2,6,73,1,0,0,0,},  
    [48] = {48,1,6,52,1,6,48,2,6,73,1,0,0,0,},  
    [49] = {49,1,6,53,1,6,49,1,6,73,1,0,0,0,},  
    [50] = {50,1,6,54,1,6,50,1,6,73,1,0,0,0,},  
    [51] = {51,1,6,55,1,6,51,1,6,73,1,0,0,0,},  
    [52] = {52,1,6,56,1,6,52,1,6,73,1,0,0,0,},  
    [53] = {53,1,6,57,1,6,53,1,6,73,1,0,0,0,},  
    [54] = {54,1,6,58,1,6,54,1,6,73,1,0,0,0,},  
    [55] = {55,1,6,59,1,6,55,1,6,73,1,0,0,0,},  
    [56] = {56,1,6,60,1,6,56,1,6,73,1,0,0,0,},  
    [57] = {57,1,6,61,1,6,57,2,6,73,1,0,0,0,},  
    [58] = {58,1,6,62,1,6,58,2,6,73,1,0,0,0,},  
    [59] = {59,1,6,63,1,6,59,2,6,73,1,0,0,0,},  
    [60] = {60,1,6,64,1,6,60,2,6,73,1,0,0,0,},  
    [61] = {61,1,6,65,1,6,61,1,6,73,1,0,0,0,},  
    [62] = {62,1,6,66,1,6,62,1,6,73,1,0,0,0,},  
    [63] = {63,1,6,67,1,6,63,1,6,73,1,0,0,0,},  
    [64] = {64,1,6,68,1,6,64,1,6,73,1,0,0,0,},  
    [65] = {65,1,6,69,1,6,65,1,6,73,1,0,0,0,},  
    [66] = {66,1,6,70,1,6,66,1,6,73,1,0,0,0,},  
    [67] = {67,1,6,71,1,6,67,1,6,73,1,0,0,0,},  
    [68] = {68,1,6,72,1,6,68,1,6,73,1,0,0,0,},
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
    type = 2,
    target_type = 3,
    target_value = 4,
    target_size = 5,
    main_part_type = 6,
    main_part_value = 7,
    main_part_size = 8,
    fitting_part_type = 9,
    fitting_part_value = 10,
    fitting_part_size = 11,
    cost_type = 12,
    cost_value = 13,
    cost_size = 14,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_material_exchange_info")

        return t._raw[__key_map[k]]
    end
}


function material_exchange_info.getLength()
    return #material_exchange_info._data
end



function material_exchange_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_material_exchange_info
function material_exchange_info.indexOf(index)
    if index == nil or not material_exchange_info._data[index] then
        return nil
    end
    return setmetatable({_raw = material_exchange_info._data[index]}, m)
end



---
--@return @class record_material_exchange_info
function material_exchange_info.get(id)
    
    return material_exchange_info.indexOf(__index_id[ id ])
     
end



function material_exchange_info.set(id, key, value)
    local record = material_exchange_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function material_exchange_info.get_index_data()
    return __index_id 
end

return  material_exchange_info 