---@classdef record_pet_support_info
local record_pet_support_info = {}


record_pet_support_info.id = 0--ID
record_pet_support_info.quality = 0--品质
record_pet_support_info.star = 0--星级
record_pet_support_info.rare = 0--稀有
record_pet_support_info.basic_type_1 = 0--基础属性类型1
record_pet_support_info.basic_value_1 = 0--基础属性类型值1
record_pet_support_info.basic_growth_1 = 0--属性1成长值
record_pet_support_info.basic_type_2 = 0--基础属性类型2
record_pet_support_info.basic_value_2 = 0--基础属性类型值2
record_pet_support_info.basic_growth_2 = 0--属性2成长值
record_pet_support_info.basic_type_3 = 0--基础属性类型3
record_pet_support_info.basic_value_3 = 0--基础属性类型值3
record_pet_support_info.basic_growth_3 = 0--属性3成长值
record_pet_support_info.basic_type_4 = 0--基础属性类型4
record_pet_support_info.basic_value_4 = 0--基础属性类型值4
record_pet_support_info.basic_growth_4 = 0--属性4成长值
record_pet_support_info.basic_type_5 = 0--基础属性类型5
record_pet_support_info.basic_value_5 = 0--基础属性类型值5
record_pet_support_info.basic_growth_5 = 0--属性5成长值
record_pet_support_info.basic_type_6 = 0--基础属性类型6
record_pet_support_info.basic_value_6 = 0--基础属性类型值6
record_pet_support_info.basic_growth_6 = 0--属性6成长值
record_pet_support_info.basic_type_7 = 0--基础属性类型7
record_pet_support_info.basic_value_7 = 0--基础属性类型值7
record_pet_support_info.basic_growth_7 = 0--属性7成长值
record_pet_support_info.basic_type_8 = 0--基础属性类型8
record_pet_support_info.basic_value_8 = 0--基础属性类型值8
record_pet_support_info.basic_growth_8 = 0--属性8成长值

local pet_support_info = {
   _data = {   
    [1] = {1,7,0,1,1,2155000,17650,2,39550,325,5,28400,233,11,150,0,0,0,0,0,0,0,0,0,0,0,0,0,},  
    [2] = {2,7,1,1,1,4307500,26500,2,79100,485,5,56700,353,11,150,0,0,0,0,0,0,0,0,0,0,0,0,0,},  
    [3] = {3,7,2,1,1,6457500,35350,2,118650,650,5,85000,468,11,150,0,0,0,0,0,0,0,0,0,0,0,0,0,},  
    [4] = {4,7,3,1,1,8615000,44175,2,158150,815,5,113300,583,11,150,0,0,0,0,0,0,0,0,0,0,0,0,0,},  
    [5] = {5,7,4,1,1,10767500,52975,2,197700,975,5,141600,698,11,150,0,0,0,0,0,0,0,0,0,0,0,0,0,},  
    [6] = {6,7,5,1,1,15070000,70675,2,276750,1300,5,198300,935,11,150,0,0,0,0,0,0,0,0,0,0,0,0,0,},  
    [7] = {7,7,6,1,1,19375000,88300,2,355850,1623,5,254900,1163,11,150,0,0,0,0,0,0,0,0,0,0,0,0,0,},  
    [8] = {8,7,7,1,1,25835000,114850,2,474400,2110,5,339950,1513,11,150,0,0,0,0,0,0,0,0,0,0,0,0,0,},  
    [9] = {9,7,0,0,1,1792500,11025,2,32950,203,5,23600,145,11,150,0,0,0,0,0,0,0,0,0,0,0,0,0,},  
    [10] = {10,7,1,0,1,3587500,16550,2,65900,303,5,47200,220,11,150,0,0,0,0,0,0,0,0,0,0,0,0,0,},  
    [11] = {11,7,2,0,1,5380000,22075,2,98850,405,5,70800,290,11,150,0,0,0,0,0,0,0,0,0,0,0,0,0,},  
    [12] = {12,7,3,0,1,7177500,27600,2,131750,508,5,94400,363,11,150,0,0,0,0,0,0,0,0,0,0,0,0,0,},  
    [13] = {13,7,4,0,1,8970000,33100,2,164700,608,5,118000,435,11,150,0,0,0,0,0,0,0,0,0,0,0,0,0,},  
    [14] = {14,7,5,0,1,12557500,44150,2,230600,810,5,165200,583,11,150,0,0,0,0,0,0,0,0,0,0,0,0,0,},  
    [15] = {15,7,6,0,1,16145000,55175,2,296500,1013,5,212400,725,11,150,0,0,0,0,0,0,0,0,0,0,0,0,0,},  
    [16] = {16,7,7,0,1,21527500,71775,2,395300,1318,5,283250,945,11,150,0,0,0,0,0,0,0,0,0,0,0,0,0,},  
    [17] = {17,6,0,0,1,717500,8825,2,13200,160,5,9400,118,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,},  
    [18] = {18,6,1,0,1,1435000,13250,2,26350,245,5,18900,175,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,},  
    [19] = {19,6,2,0,1,2152500,17675,2,39550,325,5,28300,230,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,},  
    [20] = {20,6,3,0,1,2870000,22075,2,52700,405,5,37800,290,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,},  
    [21] = {21,6,4,0,1,3587500,26500,2,65900,485,5,47200,348,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,},  
    [22] = {22,6,5,0,1,5022500,35325,2,92250,650,5,66100,465,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,},  
    [23] = {23,6,6,0,1,6457500,44150,2,118600,810,5,85000,583,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,},  
    [24] = {24,6,7,0,1,8610000,57400,2,158100,1055,5,113300,755,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,},  
    [25] = {25,5,0,0,1,225000,6625,2,4100,120,5,2950,88,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,},  
    [26] = {26,5,1,0,1,450000,9925,2,8200,183,5,5900,133,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,},  
    [27] = {27,5,2,0,1,672500,13250,2,12350,245,5,8850,175,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,},  
    [28] = {28,5,3,0,1,897500,16550,2,16500,303,5,11850,220,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,},  
    [29] = {29,5,4,0,1,1120000,19875,2,20600,365,5,14750,260,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,},  
    [30] = {30,5,5,0,1,1570000,26500,2,28800,485,5,20650,348,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,},  
    [31] = {31,5,6,0,1,2017500,33100,2,37050,608,5,26550,435,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,},  
    [32] = {32,5,7,0,1,2692500,43050,2,49400,790,5,35450,568,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,},  
    [33] = {33,4,0,0,1,132500,4400,2,2500,80,5,1750,58,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,},  
    [34] = {34,4,1,0,1,270000,6625,2,4900,120,5,3550,88,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,},  
    [35] = {35,4,2,0,1,402500,8825,2,7400,160,5,5300,118,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,},  
    [36] = {36,4,3,0,1,537500,11025,2,9900,203,5,7050,145,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,},  
    [37] = {37,4,4,0,1,672500,13250,2,12350,245,5,8850,175,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,},  
    [38] = {38,4,5,0,1,940000,17675,2,17300,325,5,12400,230,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,},  
    [39] = {39,4,6,0,1,1210000,22075,2,22200,405,5,15950,290,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,},  
    [40] = {40,4,7,0,1,1615000,28700,2,29650,528,5,21250,378,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,},
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
}

local __key_map = { 
    id = 1,
    quality = 2,
    star = 3,
    rare = 4,
    basic_type_1 = 5,
    basic_value_1 = 6,
    basic_growth_1 = 7,
    basic_type_2 = 8,
    basic_value_2 = 9,
    basic_growth_2 = 10,
    basic_type_3 = 11,
    basic_value_3 = 12,
    basic_growth_3 = 13,
    basic_type_4 = 14,
    basic_value_4 = 15,
    basic_growth_4 = 16,
    basic_type_5 = 17,
    basic_value_5 = 18,
    basic_growth_5 = 19,
    basic_type_6 = 20,
    basic_value_6 = 21,
    basic_growth_6 = 22,
    basic_type_7 = 23,
    basic_value_7 = 24,
    basic_growth_7 = 25,
    basic_type_8 = 26,
    basic_value_8 = 27,
    basic_growth_8 = 28,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_pet_support_info")

        return t._raw[__key_map[k]]
    end
}


function pet_support_info.getLength()
    return #pet_support_info._data
end



function pet_support_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_pet_support_info
function pet_support_info.indexOf(index)
    if index == nil or not pet_support_info._data[index] then
        return nil
    end
    return setmetatable({_raw = pet_support_info._data[index]}, m)
end



---
--@return @class record_pet_support_info
function pet_support_info.get(id)
    
    return pet_support_info.indexOf(__index_id[ id ])
     
end



function pet_support_info.set(id, key, value)
    local record = pet_support_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function pet_support_info.get_index_data()
    return __index_id 
end

return  pet_support_info 