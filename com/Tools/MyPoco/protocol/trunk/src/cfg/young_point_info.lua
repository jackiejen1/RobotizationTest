---@classdef record_young_point_info
local record_young_point_info = {}


record_young_point_info.id = 0--id
record_young_point_info.young_id = 0--所属活动ID
record_young_point_info.activity_time = 0--少三二进度
record_young_point_info.raise_bat = 0--少三二速度
record_young_point_info.activity_time1 = 0--少三进度
record_young_point_info.raise_bat1 = 0--少三速度
record_young_point_info.activity_time2 = 0--少西进度
record_young_point_info.raise_bat2 = 0--少西速度

local young_point_info = {
   _data = {   
    [1] = {1,1,60,50000,3540,400,600,784,},  
    [2] = {2,1,660,3333,13680,1960,1320,1813,},  
    [3] = {3,1,1440,1831,15840,900,2040,680,},  
    [4] = {4,1,1500,14285,18720,600,2760,1578,},  
    [5] = {5,1,2100,952,21600,1120,3480,514,},  
    [6] = {6,1,2880,1831,21780,3000,4200,1185,},  
    [7] = {7,1,2940,14285,21960,1200,4920,540,},  
    [8] = {8,1,3540,952,22140,1400,5640,1255,},  
    [9] = {9,1,4320,1831,22320,900,6360,601,},  
    [10] = {10,1,4380,14285,22500,1960,7080,1395,},  
    [11] = {11,1,4980,952,22680,1600,7800,1159,},  
    [12] = {12,1,5760,1831,22860,2500,8520,2677,},  
    [13] = {13,1,5820,17441,23040,1800,9240,1185,},  
    [14] = {14,1,6420,1162,23220,3000,9960,2729,},  
    [15] = {15,1,7200,2236,23400,1200,10680,575,},  
    [16] = {16,1,7260,17441,23580,1400,11400,1334,},  
    [17] = {17,1,7860,1162,23760,900,12120,523,},  
    [18] = {18,1,8640,2236,23940,1960,12840,1212,},  
    [19] = {19,1,8700,17441,24120,1600,13560,584,},  
    [20] = {20,1,9300,1162,24300,2500,14280,1351,},  
    [21] = {21,1,10080,2236,24480,1800,15000,523,},  
    [22] = {22,1,10140,17441,24660,3000,15720,1220,},  
    [23] = {23,1,10740,1162,24840,1200,16440,645,},  
    [24] = {24,1,11520,2236,25020,1400,17160,1499,},  
    [25] = {25,1,11580,17441,25200,900,17880,1246,},  
    [26] = {26,1,12180,1282,25380,1960,18600,2886,},  
    [27] = {27,1,12960,2465,25560,1600,19320,1325,},  
    [28] = {28,1,13020,19230,25740,2500,20040,3060,},  
    [29] = {29,1,13620,1282,25920,1800,20760,662,},  
    [30] = {30,1,14400,2465,26100,3000,21480,1543,},  
    [31] = {31,1,14460,19230,26280,1200,22200,575,},  
    [32] = {32,1,15060,1282,26460,1400,22920,1334,},  
    [33] = {33,1,15840,2465,26640,900,23640,549,},  
    [34] = {34,1,15900,19230,26820,1960,24360,1264,},  
    [35] = {35,1,16500,1282,27000,1600,25080,662,},  
    [36] = {36,1,17280,2465,27180,2500,25800,1534,},  
    [37] = {37,1,17340,19230,27360,1800,26520,1098,},  
    [38] = {38,1,17940,1282,27540,3000,27240,2537,},  
    [39] = {39,1,18720,2465,27720,1200,27960,575,},  
    [40] = {40,1,18780,19230,27900,1400,28680,1325,},  
    [41] = {41,1,19380,1282,28080,900,29400,462,},  
    [42] = {42,1,20160,4856,28260,1960,30120,1072,},  
    [43] = {43,1,20220,37878,28440,1600,30840,462,},  
    [44] = {44,1,20820,2525,28620,2500,31560,1063,},  
    [45] = {45,1,21600,4856,28800,1800,32280,479,},  
    [46] = {46,1,21660,37878,28980,3000,33000,1107,},  
    [47] = {47,1,22260,2525,29160,1200,33720,1430,},  
    [48] = {48,1,23040,4856,29340,1400,34440,3296,},  
    [49] = {49,1,23100,37878,29520,900,35160,1360,},  
    [50] = {50,1,23700,2525,29700,1960,35880,3147,},  
    [51] = {51,1,24480,4856,29880,1600,36600,1299,},  
    [52] = {52,1,24540,37878,30060,2500,37320,2999,},  
    [53] = {53,1,25140,2525,30240,1800,38040,1325,},  
    [54] = {54,1,25920,4856,30420,3000,38160,3060,},  
    [55] = {55,1,25980,37878,30600,1200,43200,3060,},  
    [56] = {56,1,26580,2525,30780,1400,0,0,},  
    [57] = {57,1,27360,4856,30960,900,0,0,},  
    [58] = {58,1,27420,37878,31140,1960,0,0,},  
    [59] = {59,1,28020,2525,31320,1600,0,0,},  
    [60] = {60,1,28800,4856,31500,2500,0,0,},  
    [61] = {61,1,28860,37878,31680,1800,0,0,},  
    [62] = {62,1,29460,2525,31860,3000,0,0,},  
    [63] = {63,1,30240,4856,32040,1200,0,0,},  
    [64] = {64,1,30300,37878,32220,1400,0,0,},  
    [65] = {65,1,30900,2525,32400,900,0,0,},  
    [66] = {66,1,31680,4856,32580,1960,0,0,},  
    [67] = {67,1,31740,37878,32760,1600,0,0,},  
    [68] = {68,1,32340,2525,32940,2500,0,0,},  
    [69] = {69,1,33120,4856,33120,1800,0,0,},  
    [70] = {70,1,33180,37878,33300,3000,0,0,},  
    [71] = {71,1,33780,2525,33480,1200,0,0,},  
    [72] = {72,1,34560,4856,33660,1400,0,0,},  
    [73] = {73,1,34620,37878,33840,900,0,0,},  
    [74] = {74,1,35220,2525,34020,1960,0,0,},  
    [75] = {75,1,36000,4856,34200,1600,0,0,},  
    [76] = {76,1,36060,37878,34380,2500,0,0,},  
    [77] = {77,1,36660,2525,34560,1800,0,0,},  
    [78] = {78,1,37440,4856,43200,600,0,0,},  
    [79] = {79,1,37500,37878,0,0,0,0,},  
    [80] = {80,1,38100,2525,0,0,0,0,},  
    [81] = {81,1,38880,4856,0,0,0,0,},  
    [82] = {82,1,38940,37878,0,0,0,0,},  
    [83] = {83,1,39540,2525,0,0,0,0,},  
    [84] = {84,1,40320,4856,0,0,0,0,},  
    [85] = {85,1,40380,37878,0,0,0,0,},  
    [86] = {86,1,40980,2525,0,0,0,0,},  
    [87] = {87,1,41760,4856,0,0,0,0,},  
    [88] = {88,1,41820,37878,0,0,0,0,},  
    [89] = {89,1,42420,2525,0,0,0,0,},  
    [90] = {90,1,43200,4856,0,0,0,0,},  
    [91] = {91,2,60,5274,0,0,0,0,},  
    [92] = {92,2,480,2110,0,0,0,0,},  
    [93] = {93,2,1080,3165,0,0,0,0,},  
    [94] = {94,2,1500,5274,0,0,0,0,},  
    [95] = {95,2,1920,2110,0,0,0,0,},  
    [96] = {96,2,2520,3165,0,0,0,0,},  
    [97] = {97,2,2940,5274,0,0,0,0,},  
    [98] = {98,2,3360,2110,0,0,0,0,},  
    [99] = {99,2,3960,3165,0,0,0,0,},  
    [100] = {100,2,4380,5274,0,0,0,0,},  
    [101] = {101,2,4800,1406,0,0,0,0,},  
    [102] = {102,2,5400,2110,0,0,0,0,},  
    [103] = {103,2,5820,3516,0,0,0,0,},  
    [104] = {104,2,6240,1406,0,0,0,0,},  
    [105] = {105,2,6840,2110,0,0,0,0,},  
    [106] = {106,2,7260,3516,0,0,0,0,},  
    [107] = {107,2,7680,1406,0,0,0,0,},  
    [108] = {108,2,8280,2110,0,0,0,0,},  
    [109] = {109,2,8700,3516,0,0,0,0,},  
    [110] = {110,2,9120,2110,0,0,0,0,},  
    [111] = {111,2,9720,3165,0,0,0,0,},  
    [112] = {112,2,10140,5374,0,0,0,0,},  
    [113] = {113,2,10560,2110,0,0,0,0,},  
    [114] = {114,2,11160,3165,0,0,0,0,},  
    [115] = {115,2,11580,5374,0,0,0,0,},  
    [116] = {116,2,12000,2110,0,0,0,0,},  
    [117] = {117,2,12600,3165,0,0,0,0,},  
    [118] = {118,2,13020,5374,0,0,0,0,},  
    [119] = {119,2,13440,2110,0,0,0,0,},  
    [120] = {120,2,14040,3165,0,0,0,0,},  
    [121] = {121,2,14460,5374,0,0,0,0,},  
    [122] = {122,2,14880,2110,0,0,0,0,},  
    [123] = {123,2,15480,3165,0,0,0,0,},  
    [124] = {124,2,15900,5374,0,0,0,0,},  
    [125] = {125,2,16320,2110,0,0,0,0,},  
    [126] = {126,2,16920,3165,0,0,0,0,},  
    [127] = {127,2,17340,5374,0,0,0,0,},  
    [128] = {128,2,17760,2110,0,0,0,0,},  
    [129] = {129,2,18360,3165,0,0,0,0,},  
    [130] = {130,2,18780,5374,0,0,0,0,},  
    [131] = {131,2,19200,2110,0,0,0,0,},  
    [132] = {132,2,19800,3165,0,0,0,0,},  
    [133] = {133,2,20220,5374,0,0,0,0,},  
    [134] = {134,2,20640,2110,0,0,0,0,},  
    [135] = {135,2,21240,3165,0,0,0,0,},  
    [136] = {136,2,21660,5374,0,0,0,0,},  
    [137] = {137,2,22080,2110,0,0,0,0,},  
    [138] = {138,2,22680,3165,0,0,0,0,},  
    [139] = {139,2,23100,5374,0,0,0,0,},  
    [140] = {140,2,23520,2110,0,0,0,0,},  
    [141] = {141,2,24120,3165,0,0,0,0,},  
    [142] = {142,2,24540,5374,0,0,0,0,},  
    [143] = {143,2,24960,2110,0,0,0,0,},  
    [144] = {144,2,25560,3165,0,0,0,0,},  
    [145] = {145,2,25980,5374,0,0,0,0,},  
    [146] = {146,2,26400,2110,0,0,0,0,},  
    [147] = {147,2,27000,3165,0,0,0,0,},  
    [148] = {148,2,27420,5374,0,0,0,0,},  
    [149] = {149,2,27840,2110,0,0,0,0,},  
    [150] = {150,2,28440,3165,0,0,0,0,},  
    [151] = {151,2,28860,5374,0,0,0,0,},  
    [152] = {152,2,29280,2110,0,0,0,0,},  
    [153] = {153,2,29880,3165,0,0,0,0,},  
    [154] = {154,2,30300,5374,0,0,0,0,},  
    [155] = {155,2,30720,2110,0,0,0,0,},  
    [156] = {156,2,31320,3165,0,0,0,0,},  
    [157] = {157,2,31740,5374,0,0,0,0,},  
    [158] = {158,2,32160,2110,0,0,0,0,},  
    [159] = {159,2,32760,3165,0,0,0,0,},  
    [160] = {160,2,33180,5374,0,0,0,0,},  
    [161] = {161,2,33600,2110,0,0,0,0,},  
    [162] = {162,2,34200,3165,0,0,0,0,},  
    [163] = {163,2,34620,5374,0,0,0,0,},  
    [164] = {164,2,35040,2110,0,0,0,0,},  
    [165] = {165,2,35640,3165,0,0,0,0,},  
    [166] = {166,2,36060,5374,0,0,0,0,},  
    [167] = {167,2,36480,2110,0,0,0,0,},  
    [168] = {168,2,37080,3165,0,0,0,0,},  
    [169] = {169,2,37500,5374,0,0,0,0,},  
    [170] = {170,2,37920,2110,0,0,0,0,},  
    [171] = {171,2,38520,3165,0,0,0,0,},  
    [172] = {172,2,38940,5374,0,0,0,0,},  
    [173] = {173,2,39360,2110,0,0,0,0,},  
    [174] = {174,2,39960,3165,0,0,0,0,},  
    [175] = {175,2,40380,5374,0,0,0,0,},  
    [176] = {176,2,40800,2110,0,0,0,0,},  
    [177] = {177,2,41400,3165,0,0,0,0,},  
    [178] = {178,2,41820,5374,0,0,0,0,},  
    [179] = {179,2,42240,2110,0,0,0,0,},  
    [180] = {180,2,42840,3165,0,0,0,0,},  
    [181] = {181,2,43260,5374,0,0,0,0,},  
    [182] = {182,2,43680,2110,0,0,0,0,},  
    [183] = {183,2,44280,3165,0,0,0,0,},  
    [184] = {184,2,44700,5374,0,0,0,0,},  
    [185] = {185,2,45120,2110,0,0,0,0,},  
    [186] = {186,2,45720,3165,0,0,0,0,},  
    [187] = {187,2,46140,5374,0,0,0,0,},  
    [188] = {188,2,46560,2110,0,0,0,0,},  
    [189] = {189,2,47160,3165,0,0,0,0,},  
    [190] = {190,2,47580,5374,0,0,0,0,},  
    [191] = {191,2,48000,2110,0,0,0,0,},  
    [192] = {192,2,48600,3165,0,0,0,0,},  
    [193] = {193,2,49020,5374,0,0,0,0,},  
    [194] = {194,2,49440,2110,0,0,0,0,},  
    [195] = {195,2,50040,3165,0,0,0,0,},  
    [196] = {196,2,50460,5374,0,0,0,0,},  
    [197] = {197,2,50880,2110,0,0,0,0,},  
    [198] = {198,2,51480,3165,0,0,0,0,},  
    [199] = {199,2,51900,5374,0,0,0,0,},  
    [200] = {200,2,52320,2110,0,0,0,0,},  
    [201] = {201,2,52920,3165,0,0,0,0,},  
    [202] = {202,2,53340,5374,0,0,0,0,},  
    [203] = {203,2,53760,2110,0,0,0,0,},  
    [204] = {204,2,54360,3165,0,0,0,0,},  
    [205] = {205,2,54780,5374,0,0,0,0,},
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
    [161] = 161,  
    [162] = 162,  
    [163] = 163,  
    [164] = 164,  
    [165] = 165,  
    [166] = 166,  
    [167] = 167,  
    [168] = 168,  
    [169] = 169,  
    [170] = 170,  
    [171] = 171,  
    [172] = 172,  
    [173] = 173,  
    [174] = 174,  
    [175] = 175,  
    [176] = 176,  
    [177] = 177,  
    [178] = 178,  
    [179] = 179,  
    [180] = 180,  
    [181] = 181,  
    [182] = 182,  
    [183] = 183,  
    [184] = 184,  
    [185] = 185,  
    [186] = 186,  
    [187] = 187,  
    [188] = 188,  
    [189] = 189,  
    [190] = 190,  
    [191] = 191,  
    [192] = 192,  
    [193] = 193,  
    [194] = 194,  
    [195] = 195,  
    [196] = 196,  
    [197] = 197,  
    [198] = 198,  
    [199] = 199,  
    [200] = 200,  
    [201] = 201,  
    [202] = 202,  
    [203] = 203,  
    [204] = 204,  
    [205] = 205,
}

local __key_map = { 
    id = 1,
    young_id = 2,
    activity_time = 3,
    raise_bat = 4,
    activity_time1 = 5,
    raise_bat1 = 6,
    activity_time2 = 7,
    raise_bat2 = 8,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_young_point_info")

        return t._raw[__key_map[k]]
    end
}


function young_point_info.getLength()
    return #young_point_info._data
end



function young_point_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_young_point_info
function young_point_info.indexOf(index)
    if index == nil or not young_point_info._data[index] then
        return nil
    end
    return setmetatable({_raw = young_point_info._data[index]}, m)
end



---
--@return @class record_young_point_info
function young_point_info.get(id)
    
    return young_point_info.indexOf(__index_id[ id ])
     
end



function young_point_info.set(id, key, value)
    local record = young_point_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function young_point_info.get_index_data()
    return __index_id 
end

return  young_point_info 