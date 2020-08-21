---@classdef record_warlord_skill_combo
local record_warlord_skill_combo = {}


record_warlord_skill_combo.id = 0--id
record_warlord_skill_combo.time = 0--技能轮询时间
record_warlord_skill_combo.stay_time = 0--待机时间
record_warlord_skill_combo.skill1_id = 0--顺序位1
record_warlord_skill_combo.skill2_id = 0--顺序位2
record_warlord_skill_combo.skill3_id = 0--顺序位3
record_warlord_skill_combo.skill4_id = 0--顺序位4
record_warlord_skill_combo.skill5_id = 0--顺序位5
record_warlord_skill_combo.skill6_id = 0--顺序位6

local warlord_skill_combo = {
   _data = {   
    [1] = {101,2000,1500,1001,1002,1001,1002,1001,1002,},  
    [2] = {102,2000,1500,1001,1003,1001,1003,1001,1003,},  
    [3] = {103,3000,5000,1004,0,0,0,0,0,},  
    [4] = {104,2000,2000,1005,1006,1005,1001,0,0,},  
    [5] = {105,2000,2000,1001,1007,1008,1007,0,0,},  
    [6] = {106,1500,500,1009,1010,1009,1010,0,0,},  
    [7] = {107,1500,500,1009,1001,1009,1001,1009,1001,},  
    [8] = {108,3000,5000,1011,0,0,0,0,0,},  
    [9] = {109,1500,1000,1012,1013,1016,1013,0,0,},  
    [10] = {110,1500,1000,1015,1014,1015,1016,0,0,},  
    [11] = {111,1000,0,1017,1018,0,0,0,0,},  
    [12] = {112,1000,0,1019,1018,1019,1018,1019,1018,},  
    [13] = {113,2000,1500,1020,1023,1022,1024,0,0,},  
    [14] = {114,2000,1500,1021,1024,1022,1023,0,0,},  
    [15] = {115,3000,5000,1025,0,0,0,0,0,},  
    [16] = {116,3500,4000,1035,1023,0,0,0,0,},  
    [17] = {117,2000,1500,1026,1028,0,0,0,0,},  
    [18] = {118,2000,1500,1027,1028,0,0,0,0,},  
    [19] = {119,1000,0,1029,1032,0,0,0,0,},  
    [20] = {120,1000,0,1030,1032,0,0,0,0,},  
    [21] = {121,1000,0,1031,1032,0,0,0,0,},  
    [22] = {122,1000,750,1033,0,0,0,0,0,},  
    [23] = {123,2000,1000,1034,0,0,0,0,0,},  
    [24] = {124,1000,0,1036,1038,0,0,0,0,},  
    [25] = {125,1000,0,1037,1038,0,0,0,0,},  
    [26] = {126,1000,0,1040,1039,0,0,0,0,},  
    [27] = {127,2500,2000,1041,0,0,0,0,0,},  
    [28] = {128,2500,2000,1042,0,0,0,0,0,},  
    [29] = {129,2500,2000,1043,0,0,0,0,0,},  
    [30] = {130,2500,2000,1044,0,0,0,0,0,},  
    [31] = {131,2500,2500,1045,0,0,0,0,0,},  
    [32] = {132,2000,2000,1046,1047,0,0,0,0,},  
    [33] = {133,2000,2000,1048,1049,0,0,0,0,},  
    [34] = {134,2500,2500,1050,0,0,0,0,0,},  
    [35] = {135,1000,0,1051,0,0,0,0,0,},  
    [36] = {136,1500,0,1041,1052,0,0,0,0,},  
    [37] = {137,1500,0,1053,1042,0,0,0,0,},
    }
}

local __index_id = {   
    [101] = 1,  
    [102] = 2,  
    [103] = 3,  
    [104] = 4,  
    [105] = 5,  
    [106] = 6,  
    [107] = 7,  
    [108] = 8,  
    [109] = 9,  
    [110] = 10,  
    [111] = 11,  
    [112] = 12,  
    [113] = 13,  
    [114] = 14,  
    [115] = 15,  
    [116] = 16,  
    [117] = 17,  
    [118] = 18,  
    [119] = 19,  
    [120] = 20,  
    [121] = 21,  
    [122] = 22,  
    [123] = 23,  
    [124] = 24,  
    [125] = 25,  
    [126] = 26,  
    [127] = 27,  
    [128] = 28,  
    [129] = 29,  
    [130] = 30,  
    [131] = 31,  
    [132] = 32,  
    [133] = 33,  
    [134] = 34,  
    [135] = 35,  
    [136] = 36,  
    [137] = 37,
}

local __key_map = { 
    id = 1,
    time = 2,
    stay_time = 3,
    skill1_id = 4,
    skill2_id = 5,
    skill3_id = 6,
    skill4_id = 7,
    skill5_id = 8,
    skill6_id = 9,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_warlord_skill_combo")

        return t._raw[__key_map[k]]
    end
}


function warlord_skill_combo.getLength()
    return #warlord_skill_combo._data
end



function warlord_skill_combo.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_warlord_skill_combo
function warlord_skill_combo.indexOf(index)
    if index == nil or not warlord_skill_combo._data[index] then
        return nil
    end
    return setmetatable({_raw = warlord_skill_combo._data[index]}, m)
end



---
--@return @class record_warlord_skill_combo
function warlord_skill_combo.get(id)
    
    return warlord_skill_combo.indexOf(__index_id[ id ])
     
end



function warlord_skill_combo.set(id, key, value)
    local record = warlord_skill_combo.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function warlord_skill_combo.get_index_data()
    return __index_id 
end

return  warlord_skill_combo 