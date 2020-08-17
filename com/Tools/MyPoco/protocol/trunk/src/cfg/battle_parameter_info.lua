---@classdef record_battle_parameter_info
local record_battle_parameter_info = {}


record_battle_parameter_info.id = 0--序号ID
record_battle_parameter_info.type = 0--参数类型
record_battle_parameter_info.sub_type = 0--参数值
record_battle_parameter_info.value_sign = 0--值符号
record_battle_parameter_info.value = 0--值

local battle_parameter_info = {
   _data = {   
    [1] = {1,0,0,0,20,},  
    [2] = {2,0,0,0,10,},  
    [3] = {3,1,601,0,0,},  
    [4] = {4,1,602,0,12,},  
    [5] = {5,1,603,0,1,},  
    [6] = {6,1,605,0,0,},  
    [7] = {101,0,0,0,3000,},  
    [8] = {102,0,0,0,4000,},  
    [9] = {103,0,0,0,4500,},  
    [10] = {104,0,0,0,5000,},  
    [11] = {105,0,0,0,5500,},  
    [12] = {106,0,0,0,6000,},  
    [13] = {1001,0,0,1,900,},  
    [14] = {1002,0,0,0,999999999,},  
    [15] = {1003,0,0,0,0,},  
    [16] = {1004,0,0,0,1200,},  
    [17] = {1005,0,0,0,0,},  
    [18] = {1006,0,0,0,500,},  
    [19] = {1007,0,0,0,0,},  
    [20] = {1008,0,0,0,500,},  
    [21] = {1009,0,0,0,0,},  
    [22] = {1010,0,0,0,500,},  
    [23] = {1011,0,0,0,0,},  
    [24] = {1012,0,0,0,500,},  
    [25] = {1013,0,0,0,0,},  
    [26] = {1014,0,0,0,500,},  
    [27] = {1015,0,0,0,0,},  
    [28] = {1016,0,0,0,500,},  
    [29] = {1017,0,0,1,500,},  
    [30] = {1018,0,0,0,500,},  
    [31] = {1019,0,0,0,0,},  
    [32] = {1020,0,0,0,1000,},  
    [33] = {1021,0,0,1,500,},  
    [34] = {1022,0,0,0,500,},  
    [35] = {1023,0,0,0,0,},  
    [36] = {1024,0,0,0,1000,},  
    [37] = {2001,0,0,0,0,},  
    [38] = {2002,0,0,0,500,},  
    [39] = {2003,0,0,0,650,},  
    [40] = {2004,0,0,0,1000,},  
    [41] = {2005,0,0,1,600,},  
    [42] = {2006,0,0,0,600,},  
    [43] = {2007,0,0,1,200,},  
    [44] = {2008,0,0,0,500,},  
    [45] = {2009,0,0,1,600,},  
    [46] = {2010,0,0,0,600,},  
    [47] = {2011,0,0,1,200,},  
    [48] = {2012,0,0,0,200,},  
    [49] = {2013,0,0,1,800,},  
    [50] = {2014,0,0,0,800,},  
    [51] = {2015,0,0,1,800,},  
    [52] = {2016,0,0,0,999999999,},  
    [53] = {2017,0,0,1,600,},  
    [54] = {2018,0,0,0,3000,},  
    [55] = {2019,0,0,0,1000,},  
    [56] = {2020,0,0,0,2000,},  
    [57] = {2021,0,0,0,0,},  
    [58] = {2022,0,0,0,400,},  
    [59] = {2023,0,0,0,0,},  
    [60] = {2024,0,0,0,500,},  
    [61] = {2025,0,0,1,800,},  
    [62] = {2026,0,0,0,800,},  
    [63] = {2027,0,0,1,600,},  
    [64] = {2028,0,0,0,600,},  
    [65] = {2029,0,0,1,200,},  
    [66] = {2030,0,0,0,500,},  
    [67] = {2031,0,0,1,800,},  
    [68] = {2032,0,0,0,999999999,},  
    [69] = {2033,0,0,1,600,},  
    [70] = {2034,0,0,0,3000,},  
    [71] = {2035,0,0,0,1000,},  
    [72] = {2036,0,0,0,2000,},  
    [73] = {2037,0,0,0,0,},  
    [74] = {2038,0,0,0,400,},  
    [75] = {2039,0,0,0,0,},  
    [76] = {2040,0,0,0,500,},  
    [77] = {2041,0,0,1,500,},  
    [78] = {2042,0,0,0,999999999,},  
    [79] = {2043,0,0,1,500,},  
    [80] = {2044,0,0,0,999999999,},  
    [81] = {2045,0,0,0,0,},  
    [82] = {2046,0,0,0,800,},  
    [83] = {2047,0,0,0,200,},  
    [84] = {2048,0,0,0,800,},  
    [85] = {2049,0,0,0,800,},  
    [86] = {2050,0,0,0,800,},  
    [87] = {2051,0,0,0,500,},  
    [88] = {2052,0,0,0,3500,},  
    [89] = {2053,0,0,0,980,},  
    [90] = {3001,2,1,0,50,},  
    [91] = {3002,2,2,0,950,},  
    [92] = {3003,2,3,0,1900,},  
    [93] = {3004,2,4,0,1900,},  
    [94] = {3005,2,101,0,750,},  
    [95] = {3006,2,102,0,750,},  
    [96] = {3007,2,103,0,750,},  
    [97] = {3008,2,104,0,750,},  
    [98] = {3009,2,105,0,750,},  
    [99] = {3010,2,106,0,750,},  
    [100] = {3011,2,201,0,750,},  
    [101] = {3012,2,202,0,750,},  
    [102] = {3013,2,203,0,750,},  
    [103] = {3014,2,204,0,750,},  
    [104] = {3015,2,205,0,0,},  
    [105] = {3016,2,206,0,0,},  
    [106] = {3017,2,207,0,1000,},  
    [107] = {3018,2,208,0,1000,},  
    [108] = {3019,2,209,0,2000,},  
    [109] = {3020,2,210,0,2000,},  
    [110] = {3021,2,211,0,1000,},  
    [111] = {3022,2,212,0,1000,},  
    [112] = {3023,2,301,0,250,},  
    [113] = {3024,2,302,0,250,},  
    [114] = {3025,2,303,0,250,},  
    [115] = {3026,2,304,0,250,},  
    [116] = {3027,2,305,0,250,},  
    [117] = {3028,2,306,0,250,},  
    [118] = {3029,2,307,0,250,},  
    [119] = {3030,2,308,0,250,},  
    [120] = {4001,2,601,0,0,},  
    [121] = {4002,2,602,0,0,},  
    [122] = {4003,2,603,0,0,},  
    [123] = {4004,2,604,0,0,},  
    [124] = {4005,2,605,0,0,},  
    [125] = {4006,2,606,0,1500,},  
    [126] = {4007,2,607,0,1500,},  
    [127] = {4008,2,608,0,150,},  
    [128] = {4009,2,609,0,150,},  
    [129] = {4010,2,610,0,250,},  
    [130] = {4011,2,611,0,250,},  
    [131] = {5001,2,801,0,750,},  
    [132] = {5002,2,802,0,150,},  
    [133] = {5003,2,803,0,1000,},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [3] = 3,  
    [4] = 4,  
    [5] = 5,  
    [6] = 6,  
    [101] = 7,  
    [102] = 8,  
    [103] = 9,  
    [104] = 10,  
    [105] = 11,  
    [106] = 12,  
    [1001] = 13,  
    [1002] = 14,  
    [1003] = 15,  
    [1004] = 16,  
    [1005] = 17,  
    [1006] = 18,  
    [1007] = 19,  
    [1008] = 20,  
    [1009] = 21,  
    [1010] = 22,  
    [1011] = 23,  
    [1012] = 24,  
    [1013] = 25,  
    [1014] = 26,  
    [1015] = 27,  
    [1016] = 28,  
    [1017] = 29,  
    [1018] = 30,  
    [1019] = 31,  
    [1020] = 32,  
    [1021] = 33,  
    [1022] = 34,  
    [1023] = 35,  
    [1024] = 36,  
    [2001] = 37,  
    [2002] = 38,  
    [2003] = 39,  
    [2004] = 40,  
    [2005] = 41,  
    [2006] = 42,  
    [2007] = 43,  
    [2008] = 44,  
    [2009] = 45,  
    [2010] = 46,  
    [2011] = 47,  
    [2012] = 48,  
    [2013] = 49,  
    [2014] = 50,  
    [2015] = 51,  
    [2016] = 52,  
    [2017] = 53,  
    [2018] = 54,  
    [2019] = 55,  
    [2020] = 56,  
    [2021] = 57,  
    [2022] = 58,  
    [2023] = 59,  
    [2024] = 60,  
    [2025] = 61,  
    [2026] = 62,  
    [2027] = 63,  
    [2028] = 64,  
    [2029] = 65,  
    [2030] = 66,  
    [2031] = 67,  
    [2032] = 68,  
    [2033] = 69,  
    [2034] = 70,  
    [2035] = 71,  
    [2036] = 72,  
    [2037] = 73,  
    [2038] = 74,  
    [2039] = 75,  
    [2040] = 76,  
    [2041] = 77,  
    [2042] = 78,  
    [2043] = 79,  
    [2044] = 80,  
    [2045] = 81,  
    [2046] = 82,  
    [2047] = 83,  
    [2048] = 84,  
    [2049] = 85,  
    [2050] = 86,  
    [2051] = 87,  
    [2052] = 88,  
    [2053] = 89,  
    [3001] = 90,  
    [3002] = 91,  
    [3003] = 92,  
    [3004] = 93,  
    [3005] = 94,  
    [3006] = 95,  
    [3007] = 96,  
    [3008] = 97,  
    [3009] = 98,  
    [3010] = 99,  
    [3011] = 100,  
    [3012] = 101,  
    [3013] = 102,  
    [3014] = 103,  
    [3015] = 104,  
    [3016] = 105,  
    [3017] = 106,  
    [3018] = 107,  
    [3019] = 108,  
    [3020] = 109,  
    [3021] = 110,  
    [3022] = 111,  
    [3023] = 112,  
    [3024] = 113,  
    [3025] = 114,  
    [3026] = 115,  
    [3027] = 116,  
    [3028] = 117,  
    [3029] = 118,  
    [3030] = 119,  
    [4001] = 120,  
    [4002] = 121,  
    [4003] = 122,  
    [4004] = 123,  
    [4005] = 124,  
    [4006] = 125,  
    [4007] = 126,  
    [4008] = 127,  
    [4009] = 128,  
    [4010] = 129,  
    [4011] = 130,  
    [5001] = 131,  
    [5002] = 132,  
    [5003] = 133,
}

local __key_map = { 
    id = 1,
    type = 2,
    sub_type = 3,
    value_sign = 4,
    value = 5,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_battle_parameter_info")

        return t._raw[__key_map[k]]
    end
}


function battle_parameter_info.getLength()
    return #battle_parameter_info._data
end



function battle_parameter_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_battle_parameter_info
function battle_parameter_info.indexOf(index)
    if index == nil or not battle_parameter_info._data[index] then
        return nil
    end
    return setmetatable({_raw = battle_parameter_info._data[index]}, m)
end



---
--@return @class record_battle_parameter_info
function battle_parameter_info.get(id)
    
    return battle_parameter_info.indexOf(__index_id[ id ])
     
end



function battle_parameter_info.set(id, key, value)
    local record = battle_parameter_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function battle_parameter_info.get_index_data()
    return __index_id 
end

return  battle_parameter_info 