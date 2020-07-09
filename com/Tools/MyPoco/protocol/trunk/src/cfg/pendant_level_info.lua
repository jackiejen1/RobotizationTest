---@classdef record_pendant_level_info
local record_pendant_level_info = {}


record_pendant_level_info.id = 0--id
record_pendant_level_info.level = 0--等级
record_pendant_level_info.open_level = 0--升级条件
record_pendant_level_info.is_stage = 0--是否为大阶段
record_pendant_level_info.cost_type = 0--升级消耗类型
record_pendant_level_info.cost_value = 0--升级消耗类型值
record_pendant_level_info.cost_num = 0--升级消耗数量
record_pendant_level_info.upgrade_type_1 = 0--增加属性类型1
record_pendant_level_info.upgrade_value_1 = 0--增加属性类型值1
record_pendant_level_info.upgrade_type_2 = 0--增加属性类型2
record_pendant_level_info.upgrade_value_2 = 0--增加属性类型值2
record_pendant_level_info.upgrade_type_3 = 0--增加属性类型3
record_pendant_level_info.upgrade_value_3 = 0--增加属性类型值3
record_pendant_level_info.upgrade_type_4 = 0--增加属性类型4
record_pendant_level_info.upgrade_value_4 = 0--增加属性类型值4
record_pendant_level_info.talent = 0--解锁天赋
record_pendant_level_info.desc =  ""--饰品描述
record_pendant_level_info.point_res = 0--图标资源

local pendant_level_info = {
   _data = {   
    [1] = {1001,0,120,0,0,0,0,0,0,0,0,0,0,0,0,0,"0星0级",1,},  
    [2] = {1001,1,120,0,3,173,2,2,25560,0,0,0,0,0,0,0,"0星1级",1,},  
    [3] = {1001,2,120,0,3,173,6,1,557870,0,0,0,0,0,0,0,"0星2级",1,},  
    [4] = {1001,3,120,0,3,173,10,3,31841,0,0,0,0,0,0,0,"0星3级",1,},  
    [5] = {1001,4,120,0,3,173,18,4,33727,0,0,0,0,0,0,0,"0星4级",1,},  
    [6] = {1001,5,120,0,3,173,22,2,35266,0,0,0,0,0,0,0,"0星5级",1,},  
    [7] = {1001,6,120,0,3,173,25,1,694957,0,0,0,0,0,0,0,"0星6级",1,},  
    [8] = {1001,7,120,1,3,173,170,3,75443,0,0,0,0,0,0,400201,"1星0级",1,},  
    [9] = {1001,8,120,0,3,173,42,4,38742,0,0,0,0,0,0,0,"1星1级",1,},  
    [10] = {1001,9,120,0,3,173,45,2,39666,0,0,0,0,0,0,0,"1星2级",1,},  
    [11] = {1001,10,120,0,3,173,47,1,769711,0,0,0,0,0,0,0,"1星3级",1,},  
    [12] = {1001,11,120,0,3,173,50,3,41290,0,0,0,0,0,0,0,"1星4级",1,},  
    [13] = {1001,12,120,0,3,173,51,4,42015,0,0,0,0,0,0,0,"1星5级",1,},  
    [14] = {1001,13,120,0,3,173,52,2,42693,0,0,0,0,0,0,0,"1星6级",1,},  
    [15] = {1001,14,120,1,3,173,216,1,1646581,0,0,0,0,0,0,400202,"2星0级",1,},  
    [16] = {1001,15,120,0,3,173,59,3,43933,0,0,0,0,0,0,0,"2星1级",1,},  
    [17] = {1001,16,120,0,3,173,60,4,44503,0,0,0,0,0,0,0,"2星2级",1,},  
    [18] = {1001,17,120,0,3,173,61,2,45046,0,0,0,0,0,0,0,"2星3级",1,},  
    [19] = {1001,18,120,0,3,173,62,1,865729,0,0,0,0,0,0,0,"2星4级",1,},  
    [20] = {1001,19,120,0,3,173,63,3,46060,0,0,0,0,0,0,0,"2星5级",1,},  
    [21] = {1001,20,120,0,3,173,64,4,46535,0,0,0,0,0,0,0,"2星6级",1,},  
    [22] = {1001,21,120,1,3,173,252,2,93982,0,0,0,0,0,0,400203,"3星0级",1,},  
    [23] = {1001,22,120,0,3,173,81,1,901181,0,0,0,0,0,0,0,"3星1级",1,},  
    [24] = {1001,23,120,0,3,173,82,3,47854,0,0,0,0,0,0,0,"3星2级",1,},  
    [25] = {1001,24,120,0,3,173,83,4,48263,0,0,0,0,0,0,0,"3星3级",1,},  
    [26] = {1001,25,120,0,3,173,84,2,48658,0,0,0,0,0,0,0,"3星4级",1,},  
    [27] = {1001,26,120,0,3,173,85,1,931799,0,0,0,0,0,0,0,"3星5级",1,},  
    [28] = {1001,27,120,0,3,173,86,3,49413,0,0,0,0,0,0,0,"3星6级",1,},  
    [29] = {1001,28,120,1,3,173,298,4,99548,0,0,0,0,0,0,400204,"4星0级",1,},  
    [30] = {1001,29,120,0,3,173,94,2,50124,0,0,0,0,0,0,0,"4星1级",1,},  
    [31] = {1001,30,120,0,3,173,95,1,958852,0,0,0,0,0,0,0,"4星2级",1,},  
    [32] = {1001,31,120,0,3,173,96,3,50797,0,0,0,0,0,0,0,"4星3级",1,},  
    [33] = {1001,32,120,0,3,173,97,4,51121,0,0,0,0,0,0,0,"4星4级",1,},  
    [34] = {1001,33,120,0,3,173,98,2,51437,0,0,0,0,0,0,0,"4星5级",1,},  
    [35] = {1001,34,120,0,3,173,99,1,983158,0,0,0,0,0,0,0,"4星6级",1,},  
    [36] = {1001,35,120,1,3,173,335,3,104092,0,0,0,0,0,0,400205,"5星0级",1,},  
    [37] = {1001,36,120,0,3,173,100,4,52340,0,0,0,0,0,0,0,"5星1级",1,},  
    [38] = {1001,37,120,0,3,173,101,2,52627,0,0,0,0,0,0,0,"5星2级",1,},  
    [39] = {1001,38,120,0,3,173,102,1,1005274,0,0,0,0,0,0,0,"5星3级",1,},  
    [40] = {1001,39,120,0,3,173,103,3,53184,0,0,0,0,0,0,0,"5星4级",1,},  
    [41] = {1001,40,120,0,3,173,104,4,53454,0,0,0,0,0,0,0,"5星5级",1,},  
    [42] = {1001,41,120,0,3,173,105,2,53719,0,0,0,0,0,0,0,"5星6级",1,},  
    [43] = {1001,42,120,1,3,173,365,1,2051198,0,0,0,0,0,0,400206,"6星0级",1,},  
    [44] = {1001,43,120,0,3,173,111,3,54233,0,0,0,0,0,0,0,"6星1级",1,},  
    [45] = {1001,44,120,0,3,173,112,4,54483,0,0,0,0,0,0,0,"6星2级",1,},  
    [46] = {1001,45,120,0,3,173,113,2,54728,0,0,0,0,0,0,0,"6星3级",1,},  
    [47] = {1001,46,120,0,3,173,114,1,1044429,0,0,0,0,0,0,0,"6星4级",1,},  
    [48] = {1001,47,120,0,3,173,115,3,55206,0,0,0,0,0,0,0,"6星5级",1,},  
    [49] = {1001,48,120,0,3,173,116,4,55439,0,0,0,0,0,0,0,"6星6级",1,},  
    [50] = {1001,49,120,1,3,173,400,2,111337,0,0,0,0,0,0,400207,"7星0级",1,},  
    [51] = {1002,0,120,0,0,0,0,0,0,0,0,0,0,0,0,0,"0星0级",1,},  
    [52] = {1002,1,120,0,3,173,2,2,25560,0,0,0,0,0,0,0,"0星1级",1,},  
    [53] = {1002,2,120,0,3,173,6,1,557870,0,0,0,0,0,0,0,"0星2级",1,},  
    [54] = {1002,3,120,0,3,173,10,3,31841,0,0,0,0,0,0,0,"0星3级",1,},  
    [55] = {1002,4,120,0,3,173,18,4,33727,0,0,0,0,0,0,0,"0星4级",1,},  
    [56] = {1002,5,120,0,3,173,22,2,35266,0,0,0,0,0,0,0,"0星5级",1,},  
    [57] = {1002,6,120,0,3,173,25,1,694957,0,0,0,0,0,0,0,"0星6级",1,},  
    [58] = {1002,7,120,1,3,173,170,3,75443,0,0,0,0,0,0,400301,"1星0级",1,},  
    [59] = {1002,8,120,0,3,173,42,4,38742,0,0,0,0,0,0,0,"1星1级",1,},  
    [60] = {1002,9,120,0,3,173,45,2,39666,0,0,0,0,0,0,0,"1星2级",1,},  
    [61] = {1002,10,120,0,3,173,47,1,769711,0,0,0,0,0,0,0,"1星3级",1,},  
    [62] = {1002,11,120,0,3,173,50,3,41290,0,0,0,0,0,0,0,"1星4级",1,},  
    [63] = {1002,12,120,0,3,173,51,4,42015,0,0,0,0,0,0,0,"1星5级",1,},  
    [64] = {1002,13,120,0,3,173,52,2,42693,0,0,0,0,0,0,0,"1星6级",1,},  
    [65] = {1002,14,120,1,3,173,216,1,1646581,0,0,0,0,0,0,400302,"2星0级",1,},  
    [66] = {1002,15,120,0,3,173,59,3,43933,0,0,0,0,0,0,0,"2星1级",1,},  
    [67] = {1002,16,120,0,3,173,60,4,44503,0,0,0,0,0,0,0,"2星2级",1,},  
    [68] = {1002,17,120,0,3,173,61,2,45046,0,0,0,0,0,0,0,"2星3级",1,},  
    [69] = {1002,18,120,0,3,173,62,1,865729,0,0,0,0,0,0,0,"2星4级",1,},  
    [70] = {1002,19,120,0,3,173,63,3,46060,0,0,0,0,0,0,0,"2星5级",1,},  
    [71] = {1002,20,120,0,3,173,64,4,46535,0,0,0,0,0,0,0,"2星6级",1,},  
    [72] = {1002,21,120,1,3,173,252,2,93982,0,0,0,0,0,0,400303,"3星0级",1,},  
    [73] = {1002,22,120,0,3,173,81,1,901181,0,0,0,0,0,0,0,"3星1级",1,},  
    [74] = {1002,23,120,0,3,173,82,3,47854,0,0,0,0,0,0,0,"3星2级",1,},  
    [75] = {1002,24,120,0,3,173,83,4,48263,0,0,0,0,0,0,0,"3星3级",1,},  
    [76] = {1002,25,120,0,3,173,84,2,48658,0,0,0,0,0,0,0,"3星4级",1,},  
    [77] = {1002,26,120,0,3,173,85,1,931799,0,0,0,0,0,0,0,"3星5级",1,},  
    [78] = {1002,27,120,0,3,173,86,3,49413,0,0,0,0,0,0,0,"3星6级",1,},  
    [79] = {1002,28,120,1,3,173,298,4,99548,0,0,0,0,0,0,400304,"4星0级",1,},  
    [80] = {1002,29,120,0,3,173,94,2,50124,0,0,0,0,0,0,0,"4星1级",1,},  
    [81] = {1002,30,120,0,3,173,95,1,958852,0,0,0,0,0,0,0,"4星2级",1,},  
    [82] = {1002,31,120,0,3,173,96,3,50797,0,0,0,0,0,0,0,"4星3级",1,},  
    [83] = {1002,32,120,0,3,173,97,4,51121,0,0,0,0,0,0,0,"4星4级",1,},  
    [84] = {1002,33,120,0,3,173,98,2,51437,0,0,0,0,0,0,0,"4星5级",1,},  
    [85] = {1002,34,120,0,3,173,99,1,983158,0,0,0,0,0,0,0,"4星6级",1,},  
    [86] = {1002,35,120,1,3,173,335,3,104092,0,0,0,0,0,0,400305,"5星0级",1,},  
    [87] = {1002,36,120,0,3,173,100,4,52340,0,0,0,0,0,0,0,"5星1级",1,},  
    [88] = {1002,37,120,0,3,173,101,2,52627,0,0,0,0,0,0,0,"5星2级",1,},  
    [89] = {1002,38,120,0,3,173,102,1,1005274,0,0,0,0,0,0,0,"5星3级",1,},  
    [90] = {1002,39,120,0,3,173,103,3,53184,0,0,0,0,0,0,0,"5星4级",1,},  
    [91] = {1002,40,120,0,3,173,104,4,53454,0,0,0,0,0,0,0,"5星5级",1,},  
    [92] = {1002,41,120,0,3,173,105,2,53719,0,0,0,0,0,0,0,"5星6级",1,},  
    [93] = {1002,42,120,1,3,173,365,1,2051198,0,0,0,0,0,0,400306,"6星0级",1,},  
    [94] = {1002,43,120,0,3,173,111,3,54233,0,0,0,0,0,0,0,"6星1级",1,},  
    [95] = {1002,44,120,0,3,173,112,4,54483,0,0,0,0,0,0,0,"6星2级",1,},  
    [96] = {1002,45,120,0,3,173,113,2,54728,0,0,0,0,0,0,0,"6星3级",1,},  
    [97] = {1002,46,120,0,3,173,114,1,1044429,0,0,0,0,0,0,0,"6星4级",1,},  
    [98] = {1002,47,120,0,3,173,115,3,55206,0,0,0,0,0,0,0,"6星5级",1,},  
    [99] = {1002,48,120,0,3,173,116,4,55439,0,0,0,0,0,0,0,"6星6级",1,},  
    [100] = {1002,49,120,1,3,173,400,2,111337,0,0,0,0,0,0,400307,"7星0级",1,},
    }
}

local __index_id_level = {   
    ["1001_0"] = 1,  
    ["1001_1"] = 2,  
    ["1001_2"] = 3,  
    ["1001_3"] = 4,  
    ["1001_4"] = 5,  
    ["1001_5"] = 6,  
    ["1001_6"] = 7,  
    ["1001_7"] = 8,  
    ["1001_8"] = 9,  
    ["1001_9"] = 10,  
    ["1001_10"] = 11,  
    ["1001_11"] = 12,  
    ["1001_12"] = 13,  
    ["1001_13"] = 14,  
    ["1001_14"] = 15,  
    ["1001_15"] = 16,  
    ["1001_16"] = 17,  
    ["1001_17"] = 18,  
    ["1001_18"] = 19,  
    ["1001_19"] = 20,  
    ["1001_20"] = 21,  
    ["1001_21"] = 22,  
    ["1001_22"] = 23,  
    ["1001_23"] = 24,  
    ["1001_24"] = 25,  
    ["1001_25"] = 26,  
    ["1001_26"] = 27,  
    ["1001_27"] = 28,  
    ["1001_28"] = 29,  
    ["1001_29"] = 30,  
    ["1001_30"] = 31,  
    ["1001_31"] = 32,  
    ["1001_32"] = 33,  
    ["1001_33"] = 34,  
    ["1001_34"] = 35,  
    ["1001_35"] = 36,  
    ["1001_36"] = 37,  
    ["1001_37"] = 38,  
    ["1001_38"] = 39,  
    ["1001_39"] = 40,  
    ["1001_40"] = 41,  
    ["1001_41"] = 42,  
    ["1001_42"] = 43,  
    ["1001_43"] = 44,  
    ["1001_44"] = 45,  
    ["1001_45"] = 46,  
    ["1001_46"] = 47,  
    ["1001_47"] = 48,  
    ["1001_48"] = 49,  
    ["1001_49"] = 50,  
    ["1002_0"] = 51,  
    ["1002_1"] = 52,  
    ["1002_2"] = 53,  
    ["1002_3"] = 54,  
    ["1002_4"] = 55,  
    ["1002_5"] = 56,  
    ["1002_6"] = 57,  
    ["1002_7"] = 58,  
    ["1002_8"] = 59,  
    ["1002_9"] = 60,  
    ["1002_10"] = 61,  
    ["1002_11"] = 62,  
    ["1002_12"] = 63,  
    ["1002_13"] = 64,  
    ["1002_14"] = 65,  
    ["1002_15"] = 66,  
    ["1002_16"] = 67,  
    ["1002_17"] = 68,  
    ["1002_18"] = 69,  
    ["1002_19"] = 70,  
    ["1002_20"] = 71,  
    ["1002_21"] = 72,  
    ["1002_22"] = 73,  
    ["1002_23"] = 74,  
    ["1002_24"] = 75,  
    ["1002_25"] = 76,  
    ["1002_26"] = 77,  
    ["1002_27"] = 78,  
    ["1002_28"] = 79,  
    ["1002_29"] = 80,  
    ["1002_30"] = 81,  
    ["1002_31"] = 82,  
    ["1002_32"] = 83,  
    ["1002_33"] = 84,  
    ["1002_34"] = 85,  
    ["1002_35"] = 86,  
    ["1002_36"] = 87,  
    ["1002_37"] = 88,  
    ["1002_38"] = 89,  
    ["1002_39"] = 90,  
    ["1002_40"] = 91,  
    ["1002_41"] = 92,  
    ["1002_42"] = 93,  
    ["1002_43"] = 94,  
    ["1002_44"] = 95,  
    ["1002_45"] = 96,  
    ["1002_46"] = 97,  
    ["1002_47"] = 98,  
    ["1002_48"] = 99,  
    ["1002_49"] = 100,
}

local __key_map = { 
    id = 1,
    level = 2,
    open_level = 3,
    is_stage = 4,
    cost_type = 5,
    cost_value = 6,
    cost_num = 7,
    upgrade_type_1 = 8,
    upgrade_value_1 = 9,
    upgrade_type_2 = 10,
    upgrade_value_2 = 11,
    upgrade_type_3 = 12,
    upgrade_value_3 = 13,
    upgrade_type_4 = 14,
    upgrade_value_4 = 15,
    talent = 16,
    desc = 17,
    point_res = 18,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_pendant_level_info")

        return t._raw[__key_map[k]]
    end
}


function pendant_level_info.getLength()
    return #pendant_level_info._data
end



function pendant_level_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_pendant_level_info
function pendant_level_info.indexOf(index)
    if index == nil or not pendant_level_info._data[index] then
        return nil
    end
    return setmetatable({_raw = pendant_level_info._data[index]}, m)
end



---
--@return @class record_pendant_level_info
function pendant_level_info.get(id,level)
    
    local k = id .. '_' .. level
    return pendant_level_info.indexOf(__index_id_level[k])
     
end



function pendant_level_info.set(id,level, key, value)
    local record = pendant_level_info.get(id,level)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function pendant_level_info.get_index_data()
    return __index_id_level 
end

return  pendant_level_info 