---@classdef record_artifact_support_info
local record_artifact_support_info = {}


record_artifact_support_info.id = 0--ID
record_artifact_support_info.quality = 0--品质
record_artifact_support_info.rare = 0--稀有
record_artifact_support_info.star = 0--星级
record_artifact_support_info.lv_limit = 0--协战神兵等级上限
record_artifact_support_info.affect_target_1 = 0--作用目标
record_artifact_support_info.basic_type_1 = 0--基础属性类型1
record_artifact_support_info.basic_value_1 = 0--基础属性类型值1
record_artifact_support_info.basic_growth_1 = 0--属性1成长值
record_artifact_support_info.affect_target_2 = 0--作用目标
record_artifact_support_info.basic_type_2 = 0--基础属性类型2
record_artifact_support_info.basic_value_2 = 0--基础属性类型值2
record_artifact_support_info.basic_growth_2 = 0--属性2成长值
record_artifact_support_info.affect_target_3 = 0--作用目标
record_artifact_support_info.basic_type_3 = 0--基础属性类型3
record_artifact_support_info.basic_value_3 = 0--基础属性类型值3
record_artifact_support_info.basic_growth_3 = 0--属性3成长值
record_artifact_support_info.affect_target_4 = 0--作用目标
record_artifact_support_info.basic_type_4 = 0--基础属性类型4
record_artifact_support_info.basic_value_4 = 0--基础属性类型值4
record_artifact_support_info.basic_growth_4 = 0--属性4成长值
record_artifact_support_info.affect_target_5 = 0--作用目标
record_artifact_support_info.basic_type_5 = 0--基础属性类型5
record_artifact_support_info.basic_value_5 = 0--基础属性类型值5
record_artifact_support_info.basic_growth_5 = 0--属性5成长值
record_artifact_support_info.affect_target_6 = 0--作用目标
record_artifact_support_info.basic_type_6 = 0--基础属性类型6
record_artifact_support_info.basic_value_6 = 0--基础属性类型值6
record_artifact_support_info.basic_growth_6 = 0--属性6成长值
record_artifact_support_info.affect_target_7 = 0--作用目标
record_artifact_support_info.basic_type_7 = 0--基础属性类型7
record_artifact_support_info.basic_value_7 = 0--基础属性类型值7
record_artifact_support_info.basic_growth_7 = 0--属性7成长值
record_artifact_support_info.affect_target_8 = 0--作用目标
record_artifact_support_info.basic_type_8 = 0--基础属性类型8
record_artifact_support_info.basic_value_8 = 0--基础属性类型值8
record_artifact_support_info.basic_growth_8 = 0--属性8成长值

local artifact_support_info = {
   _data = {   
    [1] = {1,6,0,0,400,1,1,64560,808,1,2,3230,40,1,3,1620,20,1,4,1620,20,2,1,32280,404,2,2,1620,20,2,3,810,10,2,4,810,10,},  
    [2] = {2,6,0,1,400,1,1,81420,1018,1,2,4070,50,1,3,2040,25,1,4,2040,25,2,1,40710,509,2,2,2040,25,2,3,1020,13,2,4,1020,13,},  
    [3] = {3,6,0,2,400,1,1,105840,1323,1,2,5290,65,1,3,2650,33,1,4,2650,33,2,1,52920,661,2,2,2650,33,2,3,1320,16,2,4,1320,16,},  
    [4] = {4,6,0,3,400,1,1,135160,1690,1,2,6760,85,1,3,3380,43,1,4,3380,43,2,1,67580,845,2,2,3380,43,2,3,1690,21,2,4,1690,21,},  
    [5] = {5,6,0,4,400,1,1,172150,2153,1,2,8610,108,1,3,4310,55,1,4,4310,55,2,1,86080,1076,2,2,4310,54,2,3,2150,28,2,4,2150,28,},  
    [6] = {6,6,0,5,400,1,1,222410,2780,1,2,11120,140,1,3,5560,70,1,4,5560,70,2,1,111200,1390,2,2,5560,70,2,3,2780,35,2,4,2780,35,},  
    [7] = {7,6,0,6,400,1,1,287040,3588,1,2,14350,180,1,3,7180,90,1,4,7180,90,2,1,143520,1794,2,2,7180,90,2,3,3590,45,2,4,3590,45,},  
    [8] = {8,6,0,7,400,1,1,375270,4690,1,2,18770,235,1,3,9380,118,1,4,9380,118,2,1,187640,2345,2,2,9380,118,2,3,4690,59,2,4,4690,59,},  
    [9] = {11,7,0,0,400,1,1,146790,1835,1,2,7340,93,1,3,3670,45,1,4,3670,45,2,1,73390,918,2,2,3670,46,2,3,1840,23,2,4,1840,23,},  
    [10] = {12,7,0,1,400,1,1,175720,2198,1,2,8790,110,1,3,4400,55,1,4,4400,55,2,1,87860,1099,2,2,4390,55,2,3,2200,28,2,4,2200,28,},  
    [11] = {13,7,0,2,400,1,1,215640,2695,1,2,10780,135,1,3,5390,68,1,4,5390,68,2,1,107820,1348,2,2,5390,68,2,3,2700,34,2,4,2700,34,},  
    [12] = {14,7,0,3,400,1,1,264620,3308,1,2,13230,165,1,3,6620,83,1,4,6620,83,2,1,132310,1654,2,2,6620,83,2,3,3310,41,2,4,3310,41,},  
    [13] = {15,7,0,4,400,1,1,328380,4105,1,2,16420,205,1,3,8210,103,1,4,8210,103,2,1,164190,2053,2,2,8210,103,2,3,4110,51,2,4,4110,51,},  
    [14] = {16,7,0,5,400,1,1,418330,5230,1,2,20920,263,1,3,10460,130,1,4,10460,130,2,1,209160,2615,2,2,10460,131,2,3,5230,65,2,4,5230,65,},  
    [15] = {17,7,0,6,400,1,1,534330,6680,1,2,26720,335,1,3,13360,168,1,4,13360,168,2,1,267170,3340,2,2,13360,168,2,3,6680,84,2,4,6680,84,},  
    [16] = {18,7,0,7,400,1,1,693740,8673,1,2,34690,433,1,3,17350,218,1,4,17350,218,2,1,346870,4336,2,2,17340,216,2,3,8670,109,2,4,8670,109,},  
    [17] = {21,7,1,0,400,1,1,277550,3470,1,2,13880,173,1,3,6940,88,1,4,6940,88,2,1,138780,1735,2,2,6940,86,2,3,3470,44,2,4,3470,44,},  
    [18] = {22,7,1,1,400,1,1,332240,4153,1,2,16610,208,1,3,8310,105,1,4,8310,105,2,1,166120,2076,2,2,8310,104,2,3,4150,53,2,4,4150,53,},  
    [19] = {23,7,1,2,400,1,1,407690,5095,1,2,20390,255,1,3,10190,128,1,4,10190,128,2,1,203840,2548,2,2,10190,128,2,3,5100,64,2,4,5100,64,},  
    [20] = {24,7,1,3,400,1,1,500250,6253,1,2,25010,313,1,3,12510,158,1,4,12510,158,2,1,250120,3126,2,2,12510,156,2,3,6250,79,2,4,6250,79,},  
    [21] = {25,7,1,4,400,1,1,621060,7763,1,2,31060,388,1,3,15530,195,1,4,15530,195,2,1,310530,3881,2,2,15530,194,2,3,7760,98,2,4,7760,98,},  
    [22] = {26,7,1,5,400,1,1,791120,9890,1,2,39560,495,1,3,19780,248,1,4,19780,248,2,1,395560,4945,2,2,19780,248,2,3,9890,124,2,4,9890,124,},  
    [23] = {27,7,1,6,400,1,1,1010420,12630,1,2,50520,633,1,3,25260,315,1,4,25260,315,2,1,505210,6315,2,2,25260,316,2,3,12630,158,2,4,12630,158,},  
    [24] = {28,7,1,7,400,1,1,1311840,16398,1,2,65590,820,1,3,32800,410,1,4,32800,410,2,1,655920,8199,2,2,32800,410,2,3,16400,205,2,4,16400,205,},  
    [25] = {101,8,0,0,400,1,1,840660,10508,1,2,42040,525,1,3,21020,263,1,4,21020,263,2,1,420330,5254,2,2,21020,263,2,3,10510,131,2,4,10510,131,},  
    [26] = {102,8,0,1,400,1,1,1006310,12580,1,2,50320,630,1,3,25160,315,1,4,25160,315,2,1,503150,6290,2,2,25160,315,2,3,12580,158,2,4,12580,158,},  
    [27] = {103,8,0,2,400,1,1,1234860,15435,1,2,61750,773,1,3,30870,385,1,4,30870,385,2,1,617430,7718,2,2,30870,386,2,3,15440,193,2,4,15440,193,},  
    [28] = {104,8,0,3,400,1,1,1515230,18940,1,2,75760,948,1,3,37880,473,1,4,37880,473,2,1,757610,9470,2,2,37880,474,2,3,18940,236,2,4,18940,236,},  
    [29] = {105,8,0,4,400,1,1,1881030,23513,1,2,94050,1175,1,3,47030,588,1,4,47030,588,2,1,940520,11756,2,2,47030,588,2,3,23510,294,2,4,23510,294,},  
    [30] = {106,8,0,5,400,1,1,2396130,29953,1,2,119810,1498,1,3,59910,750,1,4,59910,750,2,1,1198060,14976,2,2,59900,749,2,3,29950,375,2,4,29950,375,},  
    [31] = {107,8,0,6,400,1,1,3060390,38255,1,2,153020,1913,1,3,76510,958,1,4,76510,958,2,1,1530190,19128,2,2,76510,956,2,3,38260,479,2,4,38260,479,},  
    [32] = {108,8,0,7,400,1,1,3973320,49668,1,2,198670,2483,1,3,99340,1243,1,4,99340,1243,2,1,1986660,24834,2,2,99330,1241,2,3,49670,621,2,4,49670,621,},
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
    [11] = 9,  
    [12] = 10,  
    [13] = 11,  
    [14] = 12,  
    [15] = 13,  
    [16] = 14,  
    [17] = 15,  
    [18] = 16,  
    [21] = 17,  
    [22] = 18,  
    [23] = 19,  
    [24] = 20,  
    [25] = 21,  
    [26] = 22,  
    [27] = 23,  
    [28] = 24,  
    [101] = 25,  
    [102] = 26,  
    [103] = 27,  
    [104] = 28,  
    [105] = 29,  
    [106] = 30,  
    [107] = 31,  
    [108] = 32,
}

local __key_map = { 
    id = 1,
    quality = 2,
    rare = 3,
    star = 4,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_artifact_support_info")

        return t._raw[__key_map[k]]
    end
}


function artifact_support_info.getLength()
    return #artifact_support_info._data
end



function artifact_support_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_artifact_support_info
function artifact_support_info.indexOf(index)
    if index == nil or not artifact_support_info._data[index] then
        return nil
    end
    return setmetatable({_raw = artifact_support_info._data[index]}, m)
end



---
--@return @class record_artifact_support_info
function artifact_support_info.get(id)
    
    return artifact_support_info.indexOf(__index_id[ id ])
     
end



function artifact_support_info.set(id, key, value)
    local record = artifact_support_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function artifact_support_info.get_index_data()
    return __index_id 
end

return  artifact_support_info 