---@classdef record_knight_adjutant_info
local record_knight_adjutant_info = {}


record_knight_adjutant_info.id = 0--ID
record_knight_adjutant_info.quality = 0--品质
record_knight_adjutant_info.star = 0--星级
record_knight_adjutant_info.rare = 0--稀有
record_knight_adjutant_info.lv_limit = 0--副将等级上限
record_knight_adjutant_info.affect_target_1 = 0--作用目标
record_knight_adjutant_info.basic_type_1 = 0--基础属性类型1
record_knight_adjutant_info.basic_value_1 = 0--基础属性类型值1
record_knight_adjutant_info.basic_growth_1 = 0--属性1成长值
record_knight_adjutant_info.affect_target_2 = 0--作用目标
record_knight_adjutant_info.basic_type_2 = 0--基础属性类型2
record_knight_adjutant_info.basic_value_2 = 0--基础属性类型值2
record_knight_adjutant_info.basic_growth_2 = 0--属性2成长值
record_knight_adjutant_info.affect_target_3 = 0--作用目标
record_knight_adjutant_info.basic_type_3 = 0--基础属性类型3
record_knight_adjutant_info.basic_value_3 = 0--基础属性类型值3
record_knight_adjutant_info.basic_growth_3 = 0--属性3成长值
record_knight_adjutant_info.affect_target_4 = 0--作用目标
record_knight_adjutant_info.basic_type_4 = 0--基础属性类型4
record_knight_adjutant_info.basic_value_4 = 0--基础属性类型值4
record_knight_adjutant_info.basic_growth_4 = 0--属性4成长值
record_knight_adjutant_info.affect_target_5 = 0--作用目标
record_knight_adjutant_info.basic_type_5 = 0--基础属性类型5
record_knight_adjutant_info.basic_value_5 = 0--基础属性类型值5
record_knight_adjutant_info.basic_growth_5 = 0--属性5成长值
record_knight_adjutant_info.affect_target_6 = 0--作用目标
record_knight_adjutant_info.basic_type_6 = 0--基础属性类型6
record_knight_adjutant_info.basic_value_6 = 0--基础属性类型值6
record_knight_adjutant_info.basic_growth_6 = 0--属性6成长值
record_knight_adjutant_info.affect_target_7 = 0--作用目标
record_knight_adjutant_info.basic_type_7 = 0--基础属性类型7
record_knight_adjutant_info.basic_value_7 = 0--基础属性类型值7
record_knight_adjutant_info.basic_growth_7 = 0--属性7成长值
record_knight_adjutant_info.affect_target_8 = 0--作用目标
record_knight_adjutant_info.basic_type_8 = 0--基础属性类型8
record_knight_adjutant_info.basic_value_8 = 0--基础属性类型值8
record_knight_adjutant_info.basic_growth_8 = 0--属性8成长值

local knight_adjutant_info = {
   _data = {   
    [1] = {1,7,0,0,160,1,2,2700,150,1,1,54000,3040,1,3,1350,80,1,4,1350,80,2,2,1350,80,2,1,27000,1520,2,3,680,40,2,4,680,40,},  
    [2] = {2,7,1,0,160,1,2,3630,210,1,1,72330,4070,1,3,1800,100,1,4,1800,100,2,2,1810,100,2,1,36160,2030,2,3,900,50,2,4,900,50,},  
    [3] = {3,7,2,0,160,1,2,4680,260,1,1,93350,5250,1,3,2330,130,1,4,2330,130,2,2,2340,130,2,1,46680,2630,2,3,1160,70,2,4,1160,70,},  
    [4] = {4,7,3,0,160,1,2,6030,340,1,1,120500,6780,1,3,3000,170,1,4,3000,170,2,2,3010,170,2,1,60250,3390,2,3,1500,90,2,4,1500,90,},  
    [5] = {5,7,4,0,160,1,2,7650,430,1,1,153030,8610,1,3,3830,220,1,4,3830,220,2,2,3830,220,2,1,76510,4300,2,3,1910,110,2,4,1910,110,},  
    [6] = {6,7,5,0,160,1,2,9680,550,1,1,193680,10900,1,3,4850,270,1,4,4850,270,2,2,4840,270,2,1,96840,5450,2,3,2430,140,2,4,2430,140,},  
    [7] = {7,7,6,0,160,1,2,12450,700,1,1,249230,14020,1,3,6230,350,1,4,6230,350,2,2,6230,350,2,1,124610,7010,2,3,3110,180,2,4,3110,180,},  
    [8] = {8,7,7,0,160,1,2,16430,930,1,1,328500,18480,1,3,8230,460,1,4,8230,460,2,2,8210,460,2,1,164250,9240,2,3,4110,230,2,4,4110,230,},  
    [9] = {9,7,0,1,160,1,2,4280,240,1,1,85350,4800,1,3,2130,120,1,4,2130,120,2,2,2140,120,2,1,42680,2400,2,3,1060,60,2,4,1060,60,},  
    [10] = {10,7,1,1,160,1,2,6450,360,1,1,129050,7260,1,3,3230,180,1,4,3230,180,2,2,3230,180,2,1,64530,3630,2,3,1610,90,2,4,1610,90,},  
    [11] = {11,7,2,1,160,1,2,8850,500,1,1,176800,9950,1,3,4430,250,1,4,4430,250,2,2,4430,250,2,1,88400,4970,2,3,2210,130,2,4,2210,130,},  
    [12] = {12,7,3,1,160,1,2,11950,670,1,1,239000,13450,1,3,5980,340,1,4,5980,340,2,2,5980,340,2,1,119500,6720,2,3,2990,170,2,4,2990,170,},  
    [13] = {13,7,4,1,160,1,2,15500,870,1,1,310000,17440,1,3,7750,440,1,4,7750,440,2,2,7750,440,2,1,155000,8720,2,3,3880,220,2,4,3880,220,},  
    [14] = {14,7,5,1,160,1,2,19700,1110,1,1,394050,22170,1,3,9850,560,1,4,9850,560,2,2,9850,550,2,1,197030,11080,2,3,4930,280,2,4,4930,280,},  
    [15] = {15,7,6,1,160,1,2,25550,1440,1,1,511200,28760,1,3,12780,720,1,4,12780,720,2,2,12780,720,2,1,255600,14380,2,3,6390,360,2,4,6390,360,},  
    [16] = {16,7,7,1,160,1,2,35050,1970,1,1,700800,39420,1,3,17530,990,1,4,17530,990,2,2,17530,990,2,1,350400,19710,2,3,8760,490,2,4,8760,490,},  
    [17] = {17,4,0,0,160,1,2,18,1,1,1,360,20,1,3,9,1,1,4,9,1,2,2,9,1,2,1,180,10,2,3,5,1,2,4,5,1,},  
    [18] = {18,4,1,0,160,1,2,22,2,1,1,430,30,1,3,11,1,1,4,11,1,2,2,11,1,2,1,210,10,2,3,6,1,2,4,6,1,},  
    [19] = {19,4,2,0,160,1,2,25,2,1,1,500,30,1,3,13,1,1,4,13,1,2,2,13,1,2,1,250,10,2,3,7,1,2,4,7,1,},  
    [20] = {20,4,3,0,160,1,2,29,2,1,1,570,30,1,3,15,1,1,4,15,1,2,2,15,1,2,1,280,20,2,3,8,1,2,4,8,1,},  
    [21] = {21,4,4,0,160,1,2,32,2,1,1,640,40,1,3,16,1,1,4,16,1,2,2,16,1,2,1,320,20,2,3,8,1,2,4,8,1,},  
    [22] = {22,4,5,0,160,1,2,36,2,1,1,710,40,1,3,18,1,1,4,18,1,2,2,18,1,2,1,360,20,2,3,9,1,2,4,9,1,},  
    [23] = {23,4,6,0,160,1,2,39,3,1,1,780,50,1,3,20,1,1,4,20,1,2,2,20,2,2,1,390,20,2,3,10,1,2,4,10,1,},  
    [24] = {24,4,7,0,160,1,2,43,3,1,1,850,50,1,3,22,2,1,4,22,2,2,2,22,2,2,1,430,20,2,3,11,1,2,4,11,1,},  
    [25] = {25,5,0,0,160,1,2,30,2,1,1,600,30,1,3,15,1,1,4,15,1,2,2,15,1,2,1,300,20,2,3,8,1,2,4,8,1,},  
    [26] = {26,5,1,0,160,1,2,35,2,1,1,700,40,1,3,18,1,1,4,18,1,2,2,18,1,2,1,350,20,2,3,9,1,2,4,9,1,},  
    [27] = {27,5,2,0,160,1,2,42,3,1,1,830,50,1,3,21,2,1,4,21,2,2,2,21,2,2,1,410,20,2,3,11,1,2,4,11,1,},  
    [28] = {28,5,3,0,160,1,2,47,3,1,1,930,50,1,3,23,2,1,4,23,2,2,2,24,2,2,1,460,30,2,3,12,1,2,4,12,1,},  
    [29] = {29,5,4,0,160,1,2,53,3,1,1,1050,60,1,3,27,2,1,4,27,2,2,2,27,2,2,1,530,30,2,3,14,1,2,4,14,1,},  
    [30] = {30,5,5,0,160,1,2,60,4,1,1,1190,70,1,3,30,2,1,4,30,2,2,2,30,2,2,1,600,30,2,3,15,1,2,4,15,1,},  
    [31] = {31,5,6,0,160,1,2,65,4,1,1,1290,70,1,3,33,2,1,4,33,2,2,2,33,2,2,1,650,40,2,3,17,1,2,4,17,1,},  
    [32] = {32,5,7,0,160,1,2,71,4,1,1,1420,80,1,3,36,2,1,4,36,2,2,2,36,2,2,1,710,40,2,3,18,1,2,4,18,1,},  
    [33] = {33,6,0,0,160,1,2,67,4,1,1,1340,80,1,3,34,2,1,4,34,2,2,2,34,2,2,1,670,40,2,3,17,1,2,4,17,1,},  
    [34] = {34,6,1,0,160,1,2,134,8,1,1,2680,150,1,3,67,4,1,4,67,4,2,2,67,4,2,1,1340,80,2,3,34,2,2,4,34,2,},  
    [35] = {35,6,2,0,160,1,2,269,15,1,1,5360,300,1,3,134,8,1,4,134,8,2,2,135,8,2,1,2680,150,2,3,67,4,2,4,67,4,},  
    [36] = {36,6,3,0,160,1,2,537,31,1,1,10730,600,1,3,269,15,1,4,269,15,2,2,269,16,2,1,5360,300,2,3,135,8,2,4,135,8,},  
    [37] = {37,6,4,0,160,1,2,1006,57,1,1,20110,1130,1,3,503,29,1,4,503,29,2,2,503,29,2,1,10060,570,2,3,252,15,2,4,252,15,},  
    [38] = {38,6,5,0,160,1,2,1677,95,1,1,33520,1890,1,3,838,48,1,4,838,48,2,2,839,48,2,1,16760,940,2,3,419,24,2,4,419,24,},  
    [39] = {39,6,6,0,160,1,2,2414,136,1,1,48270,2720,1,3,1207,68,1,4,1207,68,2,2,1207,68,2,1,24140,1360,2,3,604,34,2,4,604,34,},  
    [40] = {40,6,7,0,160,1,2,3353,189,1,1,67050,3770,1,3,1677,95,1,4,1677,95,2,2,1677,95,2,1,33520,1890,2,3,839,48,2,4,839,48,},
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
    lv_limit = 5,
    affect_target_1 = 6,
    basic_type_1 = 7,
    basic_value_1 = 8,
    basic_growth_1 = 9,
    affect_target_2 = 10,
    basic_type_2 = 11,
    basic_value_2 = 12,
    basic_growth_2 = 13,
    affect_target_3 = 14,
    basic_type_3 = 15,
    basic_value_3 = 16,
    basic_growth_3 = 17,
    affect_target_4 = 18,
    basic_type_4 = 19,
    basic_value_4 = 20,
    basic_growth_4 = 21,
    affect_target_5 = 22,
    basic_type_5 = 23,
    basic_value_5 = 24,
    basic_growth_5 = 25,
    affect_target_6 = 26,
    basic_type_6 = 27,
    basic_value_6 = 28,
    basic_growth_6 = 29,
    affect_target_7 = 30,
    basic_type_7 = 31,
    basic_value_7 = 32,
    basic_growth_7 = 33,
    affect_target_8 = 34,
    basic_type_8 = 35,
    basic_value_8 = 36,
    basic_growth_8 = 37,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_knight_adjutant_info")

        return t._raw[__key_map[k]]
    end
}


function knight_adjutant_info.getLength()
    return #knight_adjutant_info._data
end



function knight_adjutant_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_knight_adjutant_info
function knight_adjutant_info.indexOf(index)
    if index == nil or not knight_adjutant_info._data[index] then
        return nil
    end
    return setmetatable({_raw = knight_adjutant_info._data[index]}, m)
end



---
--@return @class record_knight_adjutant_info
function knight_adjutant_info.get(id)
    
    return knight_adjutant_info.indexOf(__index_id[ id ])
     
end



function knight_adjutant_info.set(id, key, value)
    local record = knight_adjutant_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function knight_adjutant_info.get_index_data()
    return __index_id 
end

return  knight_adjutant_info 