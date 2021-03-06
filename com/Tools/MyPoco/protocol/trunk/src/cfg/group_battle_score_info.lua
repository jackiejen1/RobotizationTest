---@classdef record_group_battle_score_info
local record_group_battle_score_info = {}


record_group_battle_score_info.id = 0--玩家等级
record_group_battle_score_info.win_score = 0--获胜奖励积分数量
record_group_battle_score_info.defeat_score = 0--失败奖励积分数量
record_group_battle_score_info.win_glory = 0--获胜荣誉值数量
record_group_battle_score_info.defeat_glory = 0--失败荣誉值数量

local group_battle_score_info = {
   _data = {   
    [1] = {1,6214,4214,100,70,},  
    [2] = {2,6228,4228,100,70,},  
    [3] = {3,6242,4242,100,70,},  
    [4] = {4,6256,4256,100,70,},  
    [5] = {5,6270,4270,100,70,},  
    [6] = {6,6284,4284,100,70,},  
    [7] = {7,6298,4298,100,70,},  
    [8] = {8,6312,4312,100,70,},  
    [9] = {9,6326,4326,100,70,},  
    [10] = {10,6340,4340,100,70,},  
    [11] = {11,6354,4354,100,70,},  
    [12] = {12,6368,4368,100,70,},  
    [13] = {13,6382,4382,100,70,},  
    [14] = {14,6396,4396,100,70,},  
    [15] = {15,6410,4410,100,70,},  
    [16] = {16,6424,4424,100,70,},  
    [17] = {17,6438,4438,100,70,},  
    [18] = {18,6452,4452,100,70,},  
    [19] = {19,6466,4466,100,70,},  
    [20] = {20,6480,4480,100,70,},  
    [21] = {21,6494,4494,100,70,},  
    [22] = {22,6508,4508,100,70,},  
    [23] = {23,6522,4522,100,70,},  
    [24] = {24,6536,4536,100,70,},  
    [25] = {25,6550,4550,100,70,},  
    [26] = {26,6564,4564,100,70,},  
    [27] = {27,6578,4578,100,70,},  
    [28] = {28,6592,4592,100,70,},  
    [29] = {29,6606,4606,100,70,},  
    [30] = {30,6620,4620,100,70,},  
    [31] = {31,6634,4634,100,70,},  
    [32] = {32,6648,4648,100,70,},  
    [33] = {33,6662,4662,100,70,},  
    [34] = {34,6676,4676,100,70,},  
    [35] = {35,6690,4690,100,70,},  
    [36] = {36,6704,4704,100,70,},  
    [37] = {37,6718,4718,100,70,},  
    [38] = {38,6732,4732,100,70,},  
    [39] = {39,6746,4746,100,70,},  
    [40] = {40,6760,4760,100,70,},  
    [41] = {41,6774,4774,100,70,},  
    [42] = {42,6788,4788,100,70,},  
    [43] = {43,6802,4802,100,70,},  
    [44] = {44,6816,4816,100,70,},  
    [45] = {45,6830,4830,100,70,},  
    [46] = {46,6844,4844,100,70,},  
    [47] = {47,6858,4858,100,70,},  
    [48] = {48,6872,4872,100,70,},  
    [49] = {49,6886,4886,100,70,},  
    [50] = {50,6900,4900,100,70,},  
    [51] = {51,6914,4914,100,70,},  
    [52] = {52,6928,4928,100,70,},  
    [53] = {53,6942,4942,100,70,},  
    [54] = {54,6956,4956,100,70,},  
    [55] = {55,6970,4970,100,70,},  
    [56] = {56,6984,4984,100,70,},  
    [57] = {57,6998,4998,100,70,},  
    [58] = {58,7012,5012,100,70,},  
    [59] = {59,7026,5026,100,70,},  
    [60] = {60,7040,5040,100,70,},  
    [61] = {61,7054,5054,100,70,},  
    [62] = {62,7068,5068,100,70,},  
    [63] = {63,7082,5082,100,70,},  
    [64] = {64,7096,5096,100,70,},  
    [65] = {65,7110,5110,100,70,},  
    [66] = {66,7124,5124,100,70,},  
    [67] = {67,7138,5138,100,70,},  
    [68] = {68,7152,5152,100,70,},  
    [69] = {69,7166,5166,100,70,},  
    [70] = {70,7180,5180,100,70,},  
    [71] = {71,7194,5194,100,70,},  
    [72] = {72,7208,5208,100,70,},  
    [73] = {73,7222,5222,100,70,},  
    [74] = {74,7236,5236,100,70,},  
    [75] = {75,7250,5250,100,70,},  
    [76] = {76,7264,5264,100,70,},  
    [77] = {77,7278,5278,100,70,},  
    [78] = {78,7292,5292,100,70,},  
    [79] = {79,7306,5306,100,70,},  
    [80] = {80,7320,5320,100,70,},  
    [81] = {81,7334,5334,100,70,},  
    [82] = {82,7348,5348,100,70,},  
    [83] = {83,7362,5362,100,70,},  
    [84] = {84,7376,5376,100,70,},  
    [85] = {85,7390,5390,100,70,},  
    [86] = {86,7404,5404,100,70,},  
    [87] = {87,7418,5418,100,70,},  
    [88] = {88,7432,5432,100,70,},  
    [89] = {89,7446,5446,100,70,},  
    [90] = {90,7460,5460,100,70,},  
    [91] = {91,7474,5474,100,70,},  
    [92] = {92,7488,5488,100,70,},  
    [93] = {93,7502,5502,100,70,},  
    [94] = {94,7516,5516,100,70,},  
    [95] = {95,7530,5530,100,70,},  
    [96] = {96,7544,5544,100,70,},  
    [97] = {97,7558,5558,100,70,},  
    [98] = {98,7572,5572,100,70,},  
    [99] = {99,7586,5586,100,70,},  
    [100] = {100,7600,5600,100,70,},  
    [101] = {101,7614,5614,100,70,},  
    [102] = {102,7628,5628,100,70,},  
    [103] = {103,7642,5642,100,70,},  
    [104] = {104,7656,5656,100,70,},  
    [105] = {105,7670,5670,100,70,},  
    [106] = {106,7684,5684,100,70,},  
    [107] = {107,7698,5698,100,70,},  
    [108] = {108,7712,5712,100,70,},  
    [109] = {109,7726,5726,100,70,},  
    [110] = {110,7740,5740,100,70,},  
    [111] = {111,7754,5754,100,70,},  
    [112] = {112,7768,5768,100,70,},  
    [113] = {113,7782,5782,100,70,},  
    [114] = {114,7796,5796,100,70,},  
    [115] = {115,7810,5810,100,70,},  
    [116] = {116,7824,5824,100,70,},  
    [117] = {117,7838,5838,100,70,},  
    [118] = {118,7852,5852,100,70,},  
    [119] = {119,7866,5866,100,70,},  
    [120] = {120,7880,5880,100,70,},  
    [121] = {121,7894,5894,100,70,},  
    [122] = {122,7908,5908,100,70,},  
    [123] = {123,7922,5922,100,70,},  
    [124] = {124,7936,5936,100,70,},  
    [125] = {125,7950,5950,100,70,},  
    [126] = {126,7964,5964,100,70,},  
    [127] = {127,7978,5978,100,70,},  
    [128] = {128,7992,5992,100,70,},  
    [129] = {129,8006,6006,100,70,},  
    [130] = {130,8020,6020,100,70,},  
    [131] = {131,8034,6034,100,70,},  
    [132] = {132,8048,6048,100,70,},  
    [133] = {133,8062,6062,100,70,},  
    [134] = {134,8076,6076,100,70,},  
    [135] = {135,8090,6090,100,70,},  
    [136] = {136,8104,6104,100,70,},  
    [137] = {137,8118,6118,100,70,},  
    [138] = {138,8132,6132,100,70,},  
    [139] = {139,8146,6146,100,70,},  
    [140] = {140,8160,6160,100,70,},  
    [141] = {141,8174,6174,100,70,},  
    [142] = {142,8188,6188,100,70,},  
    [143] = {143,8202,6202,100,70,},  
    [144] = {144,8216,6216,100,70,},  
    [145] = {145,8230,6230,100,70,},  
    [146] = {146,8244,6244,100,70,},  
    [147] = {147,8258,6258,100,70,},  
    [148] = {148,8272,6272,100,70,},  
    [149] = {149,8286,6286,100,70,},  
    [150] = {150,8300,6300,100,70,},  
    [151] = {151,8314,6314,100,70,},  
    [152] = {152,8328,6328,100,70,},  
    [153] = {153,8342,6342,100,70,},  
    [154] = {154,8356,6356,100,70,},  
    [155] = {155,8370,6370,100,70,},  
    [156] = {156,8384,6384,100,70,},  
    [157] = {157,8398,6398,100,70,},  
    [158] = {158,8412,6412,100,70,},  
    [159] = {159,8426,6426,100,70,},  
    [160] = {160,8440,6440,100,70,},
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
    [69] = 69,  
    [70] = 70,  
    [71] = 71,  
    [72] = 72,  
    [73] = 73,  
    [74] = 74,  
    [75] = 75,  
    [76] = 76,  
    [77] = 77,  
    [78] = 78,  
    [79] = 79,  
    [80] = 80,  
    [81] = 81,  
    [82] = 82,  
    [83] = 83,  
    [84] = 84,  
    [85] = 85,  
    [86] = 86,  
    [87] = 87,  
    [88] = 88,  
    [89] = 89,  
    [90] = 90,  
    [91] = 91,  
    [92] = 92,  
    [93] = 93,  
    [94] = 94,  
    [95] = 95,  
    [96] = 96,  
    [97] = 97,  
    [98] = 98,  
    [99] = 99,  
    [100] = 100,  
    [101] = 101,  
    [102] = 102,  
    [103] = 103,  
    [104] = 104,  
    [105] = 105,  
    [106] = 106,  
    [107] = 107,  
    [108] = 108,  
    [109] = 109,  
    [110] = 110,  
    [111] = 111,  
    [112] = 112,  
    [113] = 113,  
    [114] = 114,  
    [115] = 115,  
    [116] = 116,  
    [117] = 117,  
    [118] = 118,  
    [119] = 119,  
    [120] = 120,  
    [121] = 121,  
    [122] = 122,  
    [123] = 123,  
    [124] = 124,  
    [125] = 125,  
    [126] = 126,  
    [127] = 127,  
    [128] = 128,  
    [129] = 129,  
    [130] = 130,  
    [131] = 131,  
    [132] = 132,  
    [133] = 133,  
    [134] = 134,  
    [135] = 135,  
    [136] = 136,  
    [137] = 137,  
    [138] = 138,  
    [139] = 139,  
    [140] = 140,  
    [141] = 141,  
    [142] = 142,  
    [143] = 143,  
    [144] = 144,  
    [145] = 145,  
    [146] = 146,  
    [147] = 147,  
    [148] = 148,  
    [149] = 149,  
    [150] = 150,  
    [151] = 151,  
    [152] = 152,  
    [153] = 153,  
    [154] = 154,  
    [155] = 155,  
    [156] = 156,  
    [157] = 157,  
    [158] = 158,  
    [159] = 159,  
    [160] = 160,
}

local __key_map = { 
    id = 1,
    win_score = 2,
    defeat_score = 3,
    win_glory = 4,
    defeat_glory = 5,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_group_battle_score_info")

        return t._raw[__key_map[k]]
    end
}


function group_battle_score_info.getLength()
    return #group_battle_score_info._data
end



function group_battle_score_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_group_battle_score_info
function group_battle_score_info.indexOf(index)
    if index == nil or not group_battle_score_info._data[index] then
        return nil
    end
    return setmetatable({_raw = group_battle_score_info._data[index]}, m)
end



---
--@return @class record_group_battle_score_info
function group_battle_score_info.get(id)
    
    return group_battle_score_info.indexOf(__index_id[ id ])
     
end



function group_battle_score_info.set(id, key, value)
    local record = group_battle_score_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function group_battle_score_info.get_index_data()
    return __index_id 
end

return  group_battle_score_info 