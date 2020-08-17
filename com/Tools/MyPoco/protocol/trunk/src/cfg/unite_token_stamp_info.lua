---@classdef record_unite_token_stamp_info
local record_unite_token_stamp_info = {}


record_unite_token_stamp_info.id =  ""--刻印ID
record_unite_token_stamp_info.order =  ""--刻印顺序
record_unite_token_stamp_info.star =  ""--解锁所需星级
record_unite_token_stamp_info.name =  ""--刻印名称
record_unite_token_stamp_info.quality = 0--品质
record_unite_token_stamp_info.res =  ""--关联资源
record_unite_token_stamp_info.cost_type = 0--激活消耗材料类型
record_unite_token_stamp_info.cost_value = 0--消耗材料类型值
record_unite_token_stamp_info.cost_size = 0--消耗材料数量
record_unite_token_stamp_info.affect_type_1 = 0--加成属性1
record_unite_token_stamp_info.affect_value_1 = 0--加成类型值1
record_unite_token_stamp_info.affect_type_2 = 0--加成属性2
record_unite_token_stamp_info.affect_value_2 = 0--加成类型值2
record_unite_token_stamp_info.affect_type_3 = 0--加成属性3
record_unite_token_stamp_info.affect_value_3 = 0--加成类型值3
record_unite_token_stamp_info.affect_type_4 = 0--加成属性4
record_unite_token_stamp_info.affect_value_4 = 0--加成类型值4
record_unite_token_stamp_info.talent_id = 0--刻印天赋

local unite_token_stamp_info = {
   _data = {   
    [1] = {101,1,0,"乾天印",4,101,3,204,10,2,700,1,28300,3,400,4,400,0,},  
    [2] = {101,2,1,"坤地印",4,102,3,204,30,2,2000,1,76300,3,1000,4,1000,0,},  
    [3] = {101,3,3,"震雷印",4,103,3,204,60,2,3400,1,127500,3,1700,4,1700,0,},  
    [4] = {101,4,5,"巽风印",4,104,3,204,100,2,4800,1,183300,3,2400,4,2400,500001,},  
    [5] = {102,1,0,"乾天印",4,101,3,204,10,2,1500,1,14200,3,400,4,400,0,},  
    [6] = {102,2,1,"坤地印",4,102,3,204,30,2,4000,1,38100,3,1000,4,1000,0,},  
    [7] = {102,3,3,"震雷印",4,103,3,204,60,2,6700,1,63800,3,1700,4,1700,0,},  
    [8] = {102,4,5,"巽风印",4,104,3,204,100,2,9600,1,91700,3,2400,4,2400,500002,},  
    [9] = {103,1,0,"乾天印",4,101,3,204,10,2,700,1,14200,3,700,4,700,0,},  
    [10] = {103,2,1,"坤地印",4,102,3,204,30,2,2000,1,38100,3,2000,4,2000,0,},  
    [11] = {103,3,3,"震雷印",4,103,3,204,60,2,3400,1,63800,3,3400,4,3400,0,},  
    [12] = {103,4,5,"巽风印",4,104,3,204,100,2,4800,1,91700,3,4800,4,4800,500003,},  
    [13] = {201,1,0,"乾天印",5,201,3,204,10,2,800,1,30400,3,400,4,400,0,},  
    [14] = {201,2,1,"坤地印",5,202,3,204,40,2,2800,1,106700,3,1400,4,1400,0,},  
    [15] = {201,3,3,"震雷印",5,203,3,204,80,2,4700,1,180000,3,2400,4,2400,0,},  
    [16] = {201,4,5,"巽风印",5,204,3,204,130,2,6800,1,260000,3,3400,4,3400,500101,},  
    [17] = {202,1,0,"乾天印",5,201,3,204,10,2,1600,1,15200,3,400,4,400,0,},  
    [18] = {202,2,1,"坤地印",5,202,3,204,40,2,5600,1,53300,3,1400,4,1400,0,},  
    [19] = {202,3,3,"震雷印",5,203,3,204,80,2,9500,1,90000,3,2400,4,2400,0,},  
    [20] = {202,4,5,"巽风印",5,204,3,204,130,2,13700,1,130000,3,3400,4,3400,500102,},  
    [21] = {203,1,0,"乾天印",5,201,3,204,10,2,800,1,15200,3,800,4,800,0,},  
    [22] = {203,2,1,"坤地印",5,202,3,204,40,2,2800,1,53300,3,2800,4,2800,0,},  
    [23] = {203,3,3,"震雷印",5,203,3,204,80,2,4700,1,90000,3,4700,4,4700,0,},  
    [24] = {203,4,5,"巽风印",5,204,3,204,130,2,6800,1,130000,3,6800,4,6800,500103,},  
    [25] = {301,1,0,"乾天印",6,301,3,204,15,2,1500,1,55500,3,700,4,700,0,},  
    [26] = {301,2,1,"坤地印",6,302,3,204,50,2,4400,1,168800,3,2200,4,2200,0,},  
    [27] = {301,3,2,"震雷印",6,303,3,204,100,2,8200,1,312500,3,4100,4,4100,500201,},  
    [28] = {301,4,3,"巽风印",6,304,3,204,155,2,10900,1,413300,3,5400,4,5400,0,},  
    [29] = {301,5,4,"坎水印",6,305,3,204,210,2,13600,1,516300,3,6800,4,6800,0,},  
    [30] = {301,6,5,"离火印",6,306,3,204,265,2,15400,1,585200,3,7700,4,7700,500202,},  
    [31] = {302,1,0,"乾天印",6,301,3,204,15,2,2900,1,27800,3,700,4,700,0,},  
    [32] = {302,2,1,"坤地印",6,302,3,204,50,2,8900,1,84400,3,2200,4,2200,0,},  
    [33] = {302,3,2,"震雷印",6,303,3,204,100,2,16400,1,156300,3,4100,4,4100,500203,},  
    [34] = {302,4,3,"巽风印",6,304,3,204,155,2,21800,1,206700,3,5400,4,5400,0,},  
    [35] = {302,5,4,"坎水印",6,305,3,204,210,2,27200,1,258100,3,6800,4,6800,0,},  
    [36] = {302,6,5,"离火印",6,306,3,204,265,2,30800,1,292600,3,7700,4,7700,500204,},  
    [37] = {303,1,0,"乾天印",6,301,3,204,15,2,1500,1,27800,3,1500,4,1500,0,},  
    [38] = {303,2,1,"坤地印",6,302,3,204,50,2,4400,1,84400,3,4400,4,4400,0,},  
    [39] = {303,3,2,"震雷印",6,303,3,204,100,2,8200,1,156300,3,8200,4,8200,500205,},  
    [40] = {303,4,3,"巽风印",6,304,3,204,155,2,10900,1,206700,3,10900,4,10900,0,},  
    [41] = {303,5,4,"坎水印",6,305,3,204,210,2,13600,1,258100,3,13600,4,13600,0,},  
    [42] = {303,6,5,"离火印",6,306,3,204,265,2,15400,1,292600,3,15400,4,15400,500206,},  
    [43] = {401,1,0,"乾天印",7,401,3,204,15,2,1600,1,60000,3,800,4,800,0,},  
    [44] = {401,2,0,"坤地印",7,402,3,204,50,2,4800,1,183300,3,2400,4,2400,0,},  
    [45] = {401,3,0,"震雷印",7,403,3,204,100,2,8900,1,338300,3,4500,4,4500,500301,},  
    [46] = {401,4,1,"巽风印",7,404,3,204,155,2,12600,1,477900,3,6300,4,6300,0,},  
    [47] = {401,5,2,"坎水印",7,405,3,204,210,2,15900,1,603800,3,7900,4,7900,0,},  
    [48] = {401,6,3,"离火印",7,406,3,204,270,2,18900,1,720000,3,9500,4,9500,500302,},  
    [49] = {401,7,4,"艮山印",7,407,3,204,310,2,21100,1,800800,3,10500,4,10500,0,},  
    [50] = {401,8,5,"兑泽印",7,408,3,204,390,2,25700,1,975000,3,12800,4,12800,500303,},  
    [51] = {402,1,0,"乾天印",7,401,3,204,15,2,3200,1,30000,3,800,4,800,0,},  
    [52] = {402,2,0,"坤地印",7,402,3,204,50,2,9600,1,91700,3,2400,4,2400,0,},  
    [53] = {402,3,0,"震雷印",7,403,3,204,100,2,17800,1,169200,3,4500,4,4500,500304,},  
    [54] = {402,4,1,"巽风印",7,404,3,204,155,2,25200,1,239000,3,6300,4,6300,0,},  
    [55] = {402,5,2,"坎水印",7,405,3,204,210,2,31800,1,301900,3,7900,4,7900,0,},  
    [56] = {402,6,3,"离火印",7,406,3,204,270,2,37900,1,360000,3,9500,4,9500,500305,},  
    [57] = {402,7,4,"艮山印",7,407,3,204,310,2,42100,1,400400,3,10500,4,10500,0,},  
    [58] = {402,8,5,"兑泽印",7,408,3,204,390,2,51300,1,487500,3,12800,4,12800,500306,},  
    [59] = {403,1,0,"乾天印",7,401,3,204,15,2,1600,1,30000,3,1600,4,1600,0,},  
    [60] = {403,2,0,"坤地印",7,402,3,204,50,2,4800,1,91700,3,4800,4,4800,0,},  
    [61] = {403,3,0,"震雷印",7,403,3,204,100,2,8900,1,169200,3,8900,4,8900,500307,},  
    [62] = {403,4,1,"巽风印",7,404,3,204,155,2,12600,1,239000,3,12600,4,12600,0,},  
    [63] = {403,5,2,"坎水印",7,405,3,204,210,2,15900,1,301900,3,15900,4,15900,0,},  
    [64] = {403,6,3,"离火印",7,406,3,204,270,2,18900,1,360000,3,18900,4,18900,500308,},  
    [65] = {403,7,4,"艮山印",7,407,3,204,310,2,21100,1,400400,3,21100,4,21100,0,},  
    [66] = {403,8,5,"兑泽印",7,408,3,204,390,2,25700,1,487500,3,25700,4,25700,500309,},  
    [67] = {501,1,0,"乾天印",8,501,3,204,15,2,1920,1,72000,3,960,4,960,0,},  
    [68] = {501,2,0,"坤地印",8,502,3,204,50,2,5760,1,219960,3,2880,4,2880,0,},  
    [69] = {501,3,0,"震雷印",8,503,3,204,100,2,10680,1,405960,3,5400,4,5400,500401,},  
    [70] = {501,4,1,"巽风印",8,504,3,204,155,2,15120,1,573480,3,7560,4,7560,0,},  
    [71] = {501,5,2,"坎水印",8,505,3,204,210,2,19080,1,724560,3,9480,4,9480,0,},  
    [72] = {501,6,3,"离火印",8,506,3,204,270,2,22680,1,864000,3,11400,4,11400,500402,},  
    [73] = {501,7,4,"艮山印",8,507,3,204,310,2,25320,1,960960,3,12600,4,12600,0,},  
    [74] = {501,8,5,"兑泽印",8,508,3,204,390,2,30840,1,1170000,3,15360,4,15360,500403,},  
    [75] = {502,1,0,"乾天印",8,501,3,204,15,2,3840,1,36000,3,960,4,960,0,},  
    [76] = {502,2,0,"坤地印",8,502,3,204,50,2,11520,1,110040,3,2880,4,2880,0,},  
    [77] = {502,3,0,"震雷印",8,503,3,204,100,2,21360,1,203040,3,5400,4,5400,500404,},  
    [78] = {502,4,1,"巽风印",8,504,3,204,155,2,30240,1,286800,3,7560,4,7560,0,},  
    [79] = {502,5,2,"坎水印",8,505,3,204,210,2,38160,1,362280,3,9480,4,9480,0,},  
    [80] = {502,6,3,"离火印",8,506,3,204,270,2,45480,1,432000,3,11400,4,11400,500405,},  
    [81] = {502,7,4,"艮山印",8,507,3,204,310,2,50520,1,480480,3,12600,4,12600,0,},  
    [82] = {502,8,5,"兑泽印",8,508,3,204,390,2,61560,1,585000,3,15360,4,15360,500406,},  
    [83] = {503,1,0,"乾天印",8,501,3,204,15,2,1920,1,36000,3,1920,4,1920,0,},  
    [84] = {503,2,0,"坤地印",8,502,3,204,50,2,5760,1,110040,3,5760,4,5760,0,},  
    [85] = {503,3,0,"震雷印",8,503,3,204,100,2,10680,1,203040,3,10680,4,10680,500407,},  
    [86] = {503,4,1,"巽风印",8,504,3,204,155,2,15120,1,286800,3,15120,4,15120,0,},  
    [87] = {503,5,2,"坎水印",8,505,3,204,210,2,19080,1,362280,3,19080,4,19080,0,},  
    [88] = {503,6,3,"离火印",8,506,3,204,270,2,22680,1,432000,3,22680,4,22680,500408,},  
    [89] = {503,7,4,"艮山印",8,507,3,204,310,2,25320,1,480480,3,25320,4,25320,0,},  
    [90] = {503,8,5,"兑泽印",8,508,3,204,390,2,30840,1,585000,3,30840,4,30840,500409,},
    }
}

local __index_id_order = {   
    ["101_1"] = 1,  
    ["101_2"] = 2,  
    ["101_3"] = 3,  
    ["101_4"] = 4,  
    ["102_1"] = 5,  
    ["102_2"] = 6,  
    ["102_3"] = 7,  
    ["102_4"] = 8,  
    ["103_1"] = 9,  
    ["103_2"] = 10,  
    ["103_3"] = 11,  
    ["103_4"] = 12,  
    ["201_1"] = 13,  
    ["201_2"] = 14,  
    ["201_3"] = 15,  
    ["201_4"] = 16,  
    ["202_1"] = 17,  
    ["202_2"] = 18,  
    ["202_3"] = 19,  
    ["202_4"] = 20,  
    ["203_1"] = 21,  
    ["203_2"] = 22,  
    ["203_3"] = 23,  
    ["203_4"] = 24,  
    ["301_1"] = 25,  
    ["301_2"] = 26,  
    ["301_3"] = 27,  
    ["301_4"] = 28,  
    ["301_5"] = 29,  
    ["301_6"] = 30,  
    ["302_1"] = 31,  
    ["302_2"] = 32,  
    ["302_3"] = 33,  
    ["302_4"] = 34,  
    ["302_5"] = 35,  
    ["302_6"] = 36,  
    ["303_1"] = 37,  
    ["303_2"] = 38,  
    ["303_3"] = 39,  
    ["303_4"] = 40,  
    ["303_5"] = 41,  
    ["303_6"] = 42,  
    ["401_1"] = 43,  
    ["401_2"] = 44,  
    ["401_3"] = 45,  
    ["401_4"] = 46,  
    ["401_5"] = 47,  
    ["401_6"] = 48,  
    ["401_7"] = 49,  
    ["401_8"] = 50,  
    ["402_1"] = 51,  
    ["402_2"] = 52,  
    ["402_3"] = 53,  
    ["402_4"] = 54,  
    ["402_5"] = 55,  
    ["402_6"] = 56,  
    ["402_7"] = 57,  
    ["402_8"] = 58,  
    ["403_1"] = 59,  
    ["403_2"] = 60,  
    ["403_3"] = 61,  
    ["403_4"] = 62,  
    ["403_5"] = 63,  
    ["403_6"] = 64,  
    ["403_7"] = 65,  
    ["403_8"] = 66,  
    ["501_1"] = 67,  
    ["501_2"] = 68,  
    ["501_3"] = 69,  
    ["501_4"] = 70,  
    ["501_5"] = 71,  
    ["501_6"] = 72,  
    ["501_7"] = 73,  
    ["501_8"] = 74,  
    ["502_1"] = 75,  
    ["502_2"] = 76,  
    ["502_3"] = 77,  
    ["502_4"] = 78,  
    ["502_5"] = 79,  
    ["502_6"] = 80,  
    ["502_7"] = 81,  
    ["502_8"] = 82,  
    ["503_1"] = 83,  
    ["503_2"] = 84,  
    ["503_3"] = 85,  
    ["503_4"] = 86,  
    ["503_5"] = 87,  
    ["503_6"] = 88,  
    ["503_7"] = 89,  
    ["503_8"] = 90,
}

local __key_map = { 
    id = 1,
    order = 2,
    star = 3,
    name = 4,
    quality = 5,
    res = 6,
    cost_type = 7,
    cost_value = 8,
    cost_size = 9,
    affect_type_1 = 10,
    affect_value_1 = 11,
    affect_type_2 = 12,
    affect_value_2 = 13,
    affect_type_3 = 14,
    affect_value_3 = 15,
    affect_type_4 = 16,
    affect_value_4 = 17,
    talent_id = 18,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_unite_token_stamp_info")

        return t._raw[__key_map[k]]
    end
}


function unite_token_stamp_info.getLength()
    return #unite_token_stamp_info._data
end



function unite_token_stamp_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_unite_token_stamp_info
function unite_token_stamp_info.indexOf(index)
    if index == nil or not unite_token_stamp_info._data[index] then
        return nil
    end
    return setmetatable({_raw = unite_token_stamp_info._data[index]}, m)
end



---
--@return @class record_unite_token_stamp_info
function unite_token_stamp_info.get(id,order)
    
    local k = id .. '_' .. order
    return unite_token_stamp_info.indexOf(__index_id_order[k])
     
end



function unite_token_stamp_info.set(id,order, key, value)
    local record = unite_token_stamp_info.get(id,order)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function unite_token_stamp_info.get_index_data()
    return __index_id_order 
end

return  unite_token_stamp_info 