---@classdef record_guild_dungeon_award_info
local record_guild_dungeon_award_info = {}


record_guild_dungeon_award_info.id = 0--ID
record_guild_dungeon_award_info.award_type = 0--奖池类型
record_guild_dungeon_award_info.type = 0--奖励类型
record_guild_dungeon_award_info.value = 0--奖励类型值
record_guild_dungeon_award_info.size = 0--奖励数量
record_guild_dungeon_award_info.num = 0--份数
record_guild_dungeon_award_info.rare = 0--是否是珍稀物品

local guild_dungeon_award_info = {
   _data = {   
    [1] = {1,101,999,0,588,1,1,},  
    [2] = {2,101,3,2,200,1,1,},  
    [3] = {3,101,3,2,100,2,0,},  
    [4] = {4,101,3,2,60,4,0,},  
    [5] = {5,101,3,2,30,10,0,},  
    [6] = {6,101,3,2,20,30,0,},  
    [7] = {7,102,999,0,588,1,1,},  
    [8] = {8,102,1,3,1000000,1,1,},  
    [9] = {9,102,1,3,500000,2,0,},  
    [10] = {10,102,1,3,300000,4,0,},  
    [11] = {11,102,1,3,150000,10,0,},  
    [12] = {12,102,1,3,100000,30,0,},  
    [13] = {13,103,999,0,588,1,1,},  
    [14] = {14,103,1,11,10000,1,1,},  
    [15] = {15,103,1,11,5000,2,0,},  
    [16] = {16,103,1,11,3000,4,0,},  
    [17] = {17,103,1,11,1500,10,0,},  
    [18] = {18,103,1,11,1000,30,0,},  
    [19] = {19,104,999,0,588,1,1,},  
    [20] = {20,104,3,35,1000,1,1,},  
    [21] = {21,104,3,35,500,2,0,},  
    [22] = {22,104,3,35,300,4,0,},  
    [23] = {23,104,3,35,150,10,0,},  
    [24] = {24,104,3,35,100,30,0,},  
    [25] = {25,201,999,0,588,1,1,},  
    [26] = {26,201,1,11,10500,1,1,},  
    [27] = {27,201,1,11,5250,2,0,},  
    [28] = {28,201,1,11,3150,4,0,},  
    [29] = {29,201,1,11,1575,10,0,},  
    [30] = {30,201,1,11,1050,30,0,},  
    [31] = {31,202,999,0,588,1,1,},  
    [32] = {32,202,3,2,200,1,1,},  
    [33] = {33,202,3,2,100,2,0,},  
    [34] = {34,202,3,2,60,4,0,},  
    [35] = {35,202,3,2,30,10,0,},  
    [36] = {36,202,3,2,20,30,0,},  
    [37] = {37,203,999,0,588,1,1,},  
    [38] = {38,203,3,35,1050,1,1,},  
    [39] = {39,203,3,35,525,2,0,},  
    [40] = {40,203,3,35,315,4,0,},  
    [41] = {41,203,3,35,158,10,0,},  
    [42] = {42,203,3,35,105,30,0,},  
    [43] = {43,204,999,0,588,1,1,},  
    [44] = {44,204,3,9,100,1,1,},  
    [45] = {45,204,3,9,50,2,0,},  
    [46] = {46,204,3,9,30,4,0,},  
    [47] = {47,204,3,9,15,10,0,},  
    [48] = {48,204,3,9,10,30,0,},  
    [49] = {49,301,999,0,588,1,1,},  
    [50] = {50,301,3,14,100,1,1,},  
    [51] = {51,301,3,14,50,2,0,},  
    [52] = {52,301,3,14,30,4,0,},  
    [53] = {53,301,3,14,15,10,0,},  
    [54] = {54,301,3,14,10,30,0,},  
    [55] = {55,302,999,0,588,1,1,},  
    [56] = {56,302,3,35,1100,1,1,},  
    [57] = {57,302,3,35,550,2,0,},  
    [58] = {58,302,3,35,330,4,0,},  
    [59] = {59,302,3,35,165,10,0,},  
    [60] = {60,302,3,35,110,30,0,},  
    [61] = {61,303,999,0,588,1,1,},  
    [62] = {62,303,1,3,1100000,1,1,},  
    [63] = {63,303,1,3,550000,2,0,},  
    [64] = {64,303,1,3,330000,4,0,},  
    [65] = {65,303,1,3,165000,10,0,},  
    [66] = {66,303,1,3,110000,30,0,},  
    [67] = {67,304,999,0,588,1,1,},  
    [68] = {68,304,3,2,200,1,1,},  
    [69] = {69,304,3,2,100,2,0,},  
    [70] = {70,304,3,2,60,4,0,},  
    [71] = {71,304,3,2,30,10,0,},  
    [72] = {72,304,3,2,20,30,0,},  
    [73] = {73,401,999,0,588,1,1,},  
    [74] = {74,401,1,3,1150000,1,1,},  
    [75] = {75,401,1,3,575000,2,0,},  
    [76] = {76,401,1,3,345000,4,0,},  
    [77] = {77,401,1,3,172500,10,0,},  
    [78] = {78,401,1,3,115000,30,0,},  
    [79] = {79,402,999,0,588,1,1,},  
    [80] = {80,402,3,14,100,1,1,},  
    [81] = {81,402,3,14,50,2,0,},  
    [82] = {82,402,3,14,30,4,0,},  
    [83] = {83,402,3,14,15,10,0,},  
    [84] = {84,402,3,14,10,30,0,},  
    [85] = {85,403,999,0,588,1,1,},  
    [86] = {86,403,3,10,40,1,1,},  
    [87] = {87,403,3,10,20,2,0,},  
    [88] = {88,403,3,10,12,4,0,},  
    [89] = {89,403,3,10,6,10,0,},  
    [90] = {90,403,3,10,4,30,0,},  
    [91] = {91,404,999,0,588,1,1,},  
    [92] = {92,404,1,11,11500,1,1,},  
    [93] = {93,404,1,11,5750,2,0,},  
    [94] = {94,404,1,11,3450,4,0,},  
    [95] = {95,404,1,11,1725,10,0,},  
    [96] = {96,404,1,11,1150,30,0,},  
    [97] = {97,501,999,0,588,1,1,},  
    [98] = {98,501,8,13020,20,1,1,},  
    [99] = {99,501,8,13020,10,2,0,},  
    [100] = {100,501,8,13020,6,4,0,},  
    [101] = {101,501,8,13020,3,10,0,},  
    [102] = {102,501,8,13020,2,30,0,},  
    [103] = {103,502,999,0,588,1,1,},  
    [104] = {104,502,3,26,200,1,1,},  
    [105] = {105,502,3,26,100,2,0,},  
    [106] = {106,502,3,26,60,4,0,},  
    [107] = {107,502,3,26,30,10,0,},  
    [108] = {108,502,3,26,20,30,0,},  
    [109] = {109,503,999,0,588,1,1,},  
    [110] = {110,503,1,17,12000,1,1,},  
    [111] = {111,503,1,17,6000,2,0,},  
    [112] = {112,503,1,17,3600,4,0,},  
    [113] = {113,503,1,17,1800,10,0,},  
    [114] = {114,503,1,17,1200,30,0,},  
    [115] = {115,504,999,0,588,1,1,},  
    [116] = {116,504,3,14,100,1,1,},  
    [117] = {117,504,3,14,50,2,0,},  
    [118] = {118,504,3,14,30,4,0,},  
    [119] = {119,504,3,14,15,10,0,},  
    [120] = {120,504,3,14,10,30,0,},  
    [121] = {121,601,999,0,588,1,1,},  
    [122] = {122,601,3,26,250,1,1,},  
    [123] = {123,601,3,26,125,2,0,},  
    [124] = {124,601,3,26,75,4,0,},  
    [125] = {125,601,3,26,38,10,0,},  
    [126] = {126,601,3,26,25,30,0,},  
    [127] = {127,602,999,0,588,1,1,},  
    [128] = {128,602,1,11,12500,1,1,},  
    [129] = {129,602,1,11,6250,2,0,},  
    [130] = {130,602,1,11,3750,4,0,},  
    [131] = {131,602,1,11,1875,10,0,},  
    [132] = {132,602,1,11,1250,30,0,},  
    [133] = {133,603,999,0,588,1,1,},  
    [134] = {134,603,3,14,100,1,1,},  
    [135] = {135,603,3,14,50,2,0,},  
    [136] = {136,603,3,14,30,4,0,},  
    [137] = {137,603,3,14,15,10,0,},  
    [138] = {138,603,3,14,10,30,0,},  
    [139] = {139,604,999,0,588,1,1,},  
    [140] = {140,604,1,3,1250000,1,1,},  
    [141] = {141,604,1,3,625000,2,0,},  
    [142] = {142,604,1,3,375000,4,0,},  
    [143] = {143,604,1,3,187500,10,0,},  
    [144] = {144,604,1,3,125000,30,0,},  
    [145] = {145,701,999,0,588,1,1,},  
    [146] = {146,701,1,17,13000,1,1,},  
    [147] = {147,701,1,17,6500,2,0,},  
    [148] = {148,701,1,17,3900,4,0,},  
    [149] = {149,701,1,17,1950,10,0,},  
    [150] = {150,701,1,17,1300,30,0,},  
    [151] = {151,702,999,0,588,1,1,},  
    [152] = {152,702,1,3,1300000,1,1,},  
    [153] = {153,702,1,3,650000,2,0,},  
    [154] = {154,702,1,3,390000,4,0,},  
    [155] = {155,702,1,3,195000,10,0,},  
    [156] = {156,702,1,3,130000,30,0,},  
    [157] = {157,703,999,0,588,1,1,},  
    [158] = {158,703,8,13020,20,1,1,},  
    [159] = {159,703,8,13020,10,2,0,},  
    [160] = {160,703,8,13020,6,4,0,},  
    [161] = {161,703,8,13020,3,10,0,},  
    [162] = {162,703,8,13020,2,30,0,},  
    [163] = {163,704,999,0,588,1,1,},  
    [164] = {164,704,3,56,250,1,1,},  
    [165] = {165,704,3,56,125,2,0,},  
    [166] = {166,704,3,56,75,4,0,},  
    [167] = {167,704,3,56,38,10,0,},  
    [168] = {168,704,3,56,25,30,0,},  
    [169] = {169,801,999,0,588,1,1,},  
    [170] = {170,801,3,2,250,1,1,},  
    [171] = {171,801,3,2,125,2,0,},  
    [172] = {172,801,3,2,75,4,0,},  
    [173] = {173,801,3,2,38,10,0,},  
    [174] = {174,801,3,2,25,30,0,},  
    [175] = {175,802,999,0,588,1,1,},  
    [176] = {176,802,8,13020,20,1,1,},  
    [177] = {177,802,8,13020,10,2,0,},  
    [178] = {178,802,8,13020,6,4,0,},  
    [179] = {179,802,8,13020,3,10,0,},  
    [180] = {180,802,8,13020,2,30,0,},  
    [181] = {181,803,999,0,588,1,1,},  
    [182] = {182,803,3,17,250,1,1,},  
    [183] = {183,803,3,17,125,2,0,},  
    [184] = {184,803,3,17,75,4,0,},  
    [185] = {185,803,3,17,38,10,0,},  
    [186] = {186,803,3,17,25,30,0,},  
    [187] = {187,804,999,0,588,1,1,},  
    [188] = {188,804,3,56,250,1,1,},  
    [189] = {189,804,3,56,125,2,0,},  
    [190] = {190,804,3,56,75,4,0,},  
    [191] = {191,804,3,56,38,10,0,},  
    [192] = {192,804,3,56,25,30,0,},  
    [193] = {193,901,999,0,588,1,1,},  
    [194] = {194,901,3,14,100,1,1,},  
    [195] = {195,901,3,14,50,2,0,},  
    [196] = {196,901,3,14,30,4,0,},  
    [197] = {197,901,3,14,15,10,0,},  
    [198] = {198,901,3,14,10,30,0,},  
    [199] = {199,902,999,0,588,1,1,},  
    [200] = {200,902,3,2,250,1,1,},  
    [201] = {201,902,3,2,125,2,0,},  
    [202] = {202,902,3,2,75,4,0,},  
    [203] = {203,902,3,2,38,10,0,},  
    [204] = {204,902,3,2,25,30,0,},  
    [205] = {205,903,999,0,588,1,1,},  
    [206] = {206,903,8,13020,20,1,1,},  
    [207] = {207,903,8,13020,10,2,0,},  
    [208] = {208,903,8,13020,6,4,0,},  
    [209] = {209,903,8,13020,3,10,0,},  
    [210] = {210,903,8,13020,2,30,0,},  
    [211] = {211,904,999,0,588,1,1,},  
    [212] = {212,904,3,56,250,1,1,},  
    [213] = {213,904,3,56,125,2,0,},  
    [214] = {214,904,3,56,75,4,0,},  
    [215] = {215,904,3,56,38,10,0,},  
    [216] = {216,904,3,56,25,30,0,},  
    [217] = {217,1001,999,0,588,1,1,},  
    [218] = {218,1001,1,17,14500,1,1,},  
    [219] = {219,1001,1,17,7250,2,0,},  
    [220] = {220,1001,1,17,4350,4,0,},  
    [221] = {221,1001,1,17,2175,10,0,},  
    [222] = {222,1001,1,17,1450,30,0,},  
    [223] = {223,1002,999,0,588,1,1,},  
    [224] = {224,1002,3,26,250,1,1,},  
    [225] = {225,1002,3,26,125,2,0,},  
    [226] = {226,1002,3,26,75,4,0,},  
    [227] = {227,1002,3,26,38,10,0,},  
    [228] = {228,1002,3,26,25,30,0,},  
    [229] = {229,1003,999,0,588,1,1,},  
    [230] = {230,1003,3,14,100,1,1,},  
    [231] = {231,1003,3,14,50,2,0,},  
    [232] = {232,1003,3,14,30,4,0,},  
    [233] = {233,1003,3,14,15,10,0,},  
    [234] = {234,1003,3,14,10,30,0,},  
    [235] = {235,1004,999,0,588,1,1,},  
    [236] = {236,1004,3,56,250,1,1,},  
    [237] = {237,1004,3,56,125,2,0,},  
    [238] = {238,1004,3,56,75,4,0,},  
    [239] = {239,1004,3,56,38,10,0,},  
    [240] = {240,1004,3,56,25,30,0,},  
    [241] = {241,1101,999,0,588,1,1,},  
    [242] = {242,1101,3,17,300,1,1,},  
    [243] = {243,1101,3,17,150,2,0,},  
    [244] = {244,1101,3,17,90,4,0,},  
    [245] = {245,1101,3,17,45,10,0,},  
    [246] = {246,1101,3,17,30,30,0,},  
    [247] = {247,1102,999,0,588,1,1,},  
    [248] = {248,1102,8,13020,30,1,1,},  
    [249] = {249,1102,8,13020,15,2,0,},  
    [250] = {250,1102,8,13020,9,4,0,},  
    [251] = {251,1102,8,13020,5,10,0,},  
    [252] = {252,1102,8,13020,3,30,0,},  
    [253] = {253,1103,999,0,588,1,1,},  
    [254] = {254,1103,3,10,60,1,1,},  
    [255] = {255,1103,3,10,30,2,0,},  
    [256] = {256,1103,3,10,18,4,0,},  
    [257] = {257,1103,3,10,9,10,0,},  
    [258] = {258,1103,3,10,6,30,0,},  
    [259] = {259,1104,999,0,588,1,1,},  
    [260] = {260,1104,3,56,300,1,1,},  
    [261] = {261,1104,3,56,150,2,0,},  
    [262] = {262,1104,3,56,90,4,0,},  
    [263] = {263,1104,3,56,45,10,0,},  
    [264] = {264,1104,3,56,30,30,0,},  
    [265] = {265,1201,999,0,588,1,1,},  
    [266] = {266,1201,1,17,15500,1,1,},  
    [267] = {267,1201,1,17,7750,2,0,},  
    [268] = {268,1201,1,17,4650,4,0,},  
    [269] = {269,1201,1,17,2325,10,0,},  
    [270] = {270,1201,1,17,1550,30,0,},  
    [271] = {271,1202,999,0,588,1,1,},  
    [272] = {272,1202,1,3,1550000,1,1,},  
    [273] = {273,1202,1,3,775000,2,0,},  
    [274] = {274,1202,1,3,465000,4,0,},  
    [275] = {275,1202,1,3,232500,10,0,},  
    [276] = {276,1202,1,3,155000,30,0,},  
    [277] = {277,1203,999,0,588,1,1,},  
    [278] = {278,1203,3,17,300,1,1,},  
    [279] = {279,1203,3,17,150,2,0,},  
    [280] = {280,1203,3,17,90,4,0,},  
    [281] = {281,1203,3,17,45,10,0,},  
    [282] = {282,1203,3,17,30,30,0,},  
    [283] = {283,1204,999,0,588,1,1,},  
    [284] = {284,1204,3,56,300,1,1,},  
    [285] = {285,1204,3,56,150,2,0,},  
    [286] = {286,1204,3,56,90,4,0,},  
    [287] = {287,1204,3,56,45,10,0,},  
    [288] = {288,1204,3,56,30,30,0,},  
    [289] = {289,1301,999,0,588,1,1,},  
    [290] = {290,1301,3,2,300,1,1,},  
    [291] = {291,1301,3,2,150,2,0,},  
    [292] = {292,1301,3,2,90,4,0,},  
    [293] = {293,1301,3,2,45,10,0,},  
    [294] = {294,1301,3,2,30,30,0,},  
    [295] = {295,1302,999,0,588,1,1,},  
    [296] = {296,1302,3,26,300,1,1,},  
    [297] = {297,1302,3,26,150,2,0,},  
    [298] = {298,1302,3,26,90,4,0,},  
    [299] = {299,1302,3,26,45,10,0,},  
    [300] = {300,1302,3,26,30,30,0,},  
    [301] = {301,1303,999,0,588,1,1,},  
    [302] = {302,1303,8,13020,30,1,1,},  
    [303] = {303,1303,8,13020,15,2,0,},  
    [304] = {304,1303,8,13020,9,4,0,},  
    [305] = {305,1303,8,13020,5,10,0,},  
    [306] = {306,1303,8,13020,3,30,0,},  
    [307] = {307,1304,999,0,588,1,1,},  
    [308] = {308,1304,3,56,300,1,1,},  
    [309] = {309,1304,3,56,150,2,0,},  
    [310] = {310,1304,3,56,90,4,0,},  
    [311] = {311,1304,3,56,45,10,0,},  
    [312] = {312,1304,3,56,30,30,0,},  
    [313] = {313,1401,999,0,588,1,1,},  
    [314] = {314,1401,1,11,16500,1,1,},  
    [315] = {315,1401,1,11,8250,2,0,},  
    [316] = {316,1401,1,11,4950,4,0,},  
    [317] = {317,1401,1,11,2475,10,0,},  
    [318] = {318,1401,1,11,1650,30,0,},  
    [319] = {319,1402,999,0,588,1,1,},  
    [320] = {320,1402,3,17,300,1,1,},  
    [321] = {321,1402,3,17,150,2,0,},  
    [322] = {322,1402,3,17,90,4,0,},  
    [323] = {323,1402,3,17,45,10,0,},  
    [324] = {324,1402,3,17,30,30,0,},  
    [325] = {325,1403,999,0,588,1,1,},  
    [326] = {326,1403,1,3,1650000,1,1,},  
    [327] = {327,1403,1,3,825000,2,0,},  
    [328] = {328,1403,1,3,495000,4,0,},  
    [329] = {329,1403,1,3,247500,10,0,},  
    [330] = {330,1403,1,3,165000,30,0,},  
    [331] = {331,1404,999,0,588,1,1,},  
    [332] = {332,1404,3,56,300,1,1,},  
    [333] = {333,1404,3,56,150,2,0,},  
    [334] = {334,1404,3,56,90,4,0,},  
    [335] = {335,1404,3,56,45,10,0,},  
    [336] = {336,1404,3,56,30,30,0,},  
    [337] = {337,1501,999,0,588,1,1,},  
    [338] = {338,1501,3,26,300,1,1,},  
    [339] = {339,1501,3,26,150,2,0,},  
    [340] = {340,1501,3,26,90,4,0,},  
    [341] = {341,1501,3,26,45,10,0,},  
    [342] = {342,1501,3,26,30,30,0,},  
    [343] = {343,1502,999,0,588,1,1,},  
    [344] = {344,1502,3,14,150,1,1,},  
    [345] = {345,1502,3,14,75,2,0,},  
    [346] = {346,1502,3,14,45,4,0,},  
    [347] = {347,1502,3,14,23,10,0,},  
    [348] = {348,1502,3,14,15,30,0,},  
    [349] = {349,1503,999,0,588,1,1,},  
    [350] = {350,1503,8,13020,30,1,1,},  
    [351] = {351,1503,8,13020,15,2,0,},  
    [352] = {352,1503,8,13020,9,4,0,},  
    [353] = {353,1503,8,13020,5,10,0,},  
    [354] = {354,1503,8,13020,3,30,0,},  
    [355] = {355,1504,999,0,588,1,1,},  
    [356] = {356,1504,3,56,300,1,1,},  
    [357] = {357,1504,3,56,150,2,0,},  
    [358] = {358,1504,3,56,90,4,0,},  
    [359] = {359,1504,3,56,45,10,0,},  
    [360] = {360,1504,3,56,30,30,0,},  
    [361] = {361,1601,999,0,588,1,1,},  
    [362] = {362,1601,1,3,1750000,1,1,},  
    [363] = {363,1601,1,3,875000,2,0,},  
    [364] = {364,1601,1,3,525000,4,0,},  
    [365] = {365,1601,1,3,262500,10,0,},  
    [366] = {366,1601,1,3,175000,30,0,},  
    [367] = {367,1602,999,0,588,1,1,},  
    [368] = {368,1602,3,10,70,1,1,},  
    [369] = {369,1602,3,10,35,2,0,},  
    [370] = {370,1602,3,10,21,4,0,},  
    [371] = {371,1602,3,10,11,10,0,},  
    [372] = {372,1602,3,10,7,30,0,},  
    [373] = {373,1603,999,0,588,1,1,},  
    [374] = {374,1603,3,15,80,1,1,},  
    [375] = {375,1603,3,15,40,2,0,},  
    [376] = {376,1603,3,15,24,4,0,},  
    [377] = {377,1603,3,15,12,10,0,},  
    [378] = {378,1603,3,15,8,30,0,},  
    [379] = {379,1604,999,0,588,1,1,},  
    [380] = {380,1604,3,56,350,1,1,},  
    [381] = {381,1604,3,56,175,2,0,},  
    [382] = {382,1604,3,56,105,4,0,},  
    [383] = {383,1604,3,56,53,10,0,},  
    [384] = {384,1604,3,56,35,30,0,},  
    [385] = {385,1701,999,0,588,1,1,},  
    [386] = {386,1701,8,13030,10,1,1,},  
    [387] = {387,1701,8,13030,5,2,0,},  
    [388] = {388,1701,8,13030,3,4,0,},  
    [389] = {389,1701,8,13030,2,10,0,},  
    [390] = {390,1701,8,13030,1,30,0,},  
    [391] = {391,1702,999,0,588,1,1,},  
    [392] = {392,1702,3,15,90,1,1,},  
    [393] = {393,1702,3,15,45,2,0,},  
    [394] = {394,1702,3,15,27,4,0,},  
    [395] = {395,1702,3,15,14,10,0,},  
    [396] = {396,1702,3,15,9,30,0,},  
    [397] = {397,1703,999,0,588,1,1,},  
    [398] = {398,1703,1,17,18000,1,1,},  
    [399] = {399,1703,1,17,9000,2,0,},  
    [400] = {400,1703,1,17,5400,4,0,},  
    [401] = {401,1703,1,17,2700,10,0,},  
    [402] = {402,1703,1,17,1800,30,0,},  
    [403] = {403,1704,999,0,588,1,1,},  
    [404] = {404,1704,3,56,350,1,1,},  
    [405] = {405,1704,3,56,175,2,0,},  
    [406] = {406,1704,3,56,105,4,0,},  
    [407] = {407,1704,3,56,53,10,0,},  
    [408] = {408,1704,3,56,35,30,0,},  
    [409] = {409,1801,999,0,588,1,1,},  
    [410] = {410,1801,3,26,350,1,1,},  
    [411] = {411,1801,3,26,175,2,0,},  
    [412] = {412,1801,3,26,105,4,0,},  
    [413] = {413,1801,3,26,53,10,0,},  
    [414] = {414,1801,3,26,35,30,0,},  
    [415] = {415,1802,999,0,588,1,1,},  
    [416] = {416,1802,3,17,350,1,1,},  
    [417] = {417,1802,3,17,175,2,0,},  
    [418] = {418,1802,3,17,105,4,0,},  
    [419] = {419,1802,3,17,53,10,0,},  
    [420] = {420,1802,3,17,35,30,0,},  
    [421] = {421,1803,999,0,588,1,1,},  
    [422] = {422,1803,3,17,350,1,1,},  
    [423] = {423,1803,3,17,175,2,0,},  
    [424] = {424,1803,3,17,105,4,0,},  
    [425] = {425,1803,3,17,53,10,0,},  
    [426] = {426,1803,3,17,35,30,0,},  
    [427] = {427,1804,999,0,588,1,1,},  
    [428] = {428,1804,3,56,350,1,1,},  
    [429] = {429,1804,3,56,175,2,0,},  
    [430] = {430,1804,3,56,105,4,0,},  
    [431] = {431,1804,3,56,53,10,0,},  
    [432] = {432,1804,3,56,35,30,0,},  
    [433] = {433,1901,999,0,588,1,1,},  
    [434] = {434,1901,8,13030,10,1,1,},  
    [435] = {435,1901,8,13030,5,2,0,},  
    [436] = {436,1901,8,13030,3,4,0,},  
    [437] = {437,1901,8,13030,2,10,0,},  
    [438] = {438,1901,8,13030,1,30,0,},  
    [439] = {439,1902,999,0,588,1,1,},  
    [440] = {440,1902,3,15,90,1,1,},  
    [441] = {441,1902,3,15,45,2,0,},  
    [442] = {442,1902,3,15,27,4,0,},  
    [443] = {443,1902,3,15,14,10,0,},  
    [444] = {444,1902,3,15,9,30,0,},  
    [445] = {445,1903,999,0,588,1,1,},  
    [446] = {446,1903,3,26,350,1,1,},  
    [447] = {447,1903,3,26,175,2,0,},  
    [448] = {448,1903,3,26,105,4,0,},  
    [449] = {449,1903,3,26,53,10,0,},  
    [450] = {450,1903,3,26,35,30,0,},  
    [451] = {451,1904,999,0,588,1,1,},  
    [452] = {452,1904,3,56,350,1,1,},  
    [453] = {453,1904,3,56,175,2,0,},  
    [454] = {454,1904,3,56,105,4,0,},  
    [455] = {455,1904,3,56,53,10,0,},  
    [456] = {456,1904,3,56,35,30,0,},  
    [457] = {457,2001,999,0,588,1,1,},  
    [458] = {458,2001,1,3,1950000,1,1,},  
    [459] = {459,2001,1,3,975000,2,0,},  
    [460] = {460,2001,1,3,585000,4,0,},  
    [461] = {461,2001,1,3,292500,10,0,},  
    [462] = {462,2001,1,3,195000,30,0,},  
    [463] = {463,2002,999,0,588,1,1,},  
    [464] = {464,2002,3,2,350,1,1,},  
    [465] = {465,2002,3,2,175,2,0,},  
    [466] = {466,2002,3,2,105,4,0,},  
    [467] = {467,2002,3,2,53,10,0,},  
    [468] = {468,2002,3,2,35,30,0,},  
    [469] = {469,2003,999,0,588,1,1,},  
    [470] = {470,2003,3,15,90,1,1,},  
    [471] = {471,2003,3,15,45,2,0,},  
    [472] = {472,2003,3,15,27,4,0,},  
    [473] = {473,2003,3,15,14,10,0,},  
    [474] = {474,2003,3,15,9,30,0,},  
    [475] = {475,2004,999,0,588,1,1,},  
    [476] = {476,2004,3,56,350,1,1,},  
    [477] = {477,2004,3,56,175,2,0,},  
    [478] = {478,2004,3,56,105,4,0,},  
    [479] = {479,2004,3,56,53,10,0,},  
    [480] = {480,2004,3,56,35,30,0,},
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
    [206] = 206,  
    [207] = 207,  
    [208] = 208,  
    [209] = 209,  
    [210] = 210,  
    [211] = 211,  
    [212] = 212,  
    [213] = 213,  
    [214] = 214,  
    [215] = 215,  
    [216] = 216,  
    [217] = 217,  
    [218] = 218,  
    [219] = 219,  
    [220] = 220,  
    [221] = 221,  
    [222] = 222,  
    [223] = 223,  
    [224] = 224,  
    [225] = 225,  
    [226] = 226,  
    [227] = 227,  
    [228] = 228,  
    [229] = 229,  
    [230] = 230,  
    [231] = 231,  
    [232] = 232,  
    [233] = 233,  
    [234] = 234,  
    [235] = 235,  
    [236] = 236,  
    [237] = 237,  
    [238] = 238,  
    [239] = 239,  
    [240] = 240,  
    [241] = 241,  
    [242] = 242,  
    [243] = 243,  
    [244] = 244,  
    [245] = 245,  
    [246] = 246,  
    [247] = 247,  
    [248] = 248,  
    [249] = 249,  
    [250] = 250,  
    [251] = 251,  
    [252] = 252,  
    [253] = 253,  
    [254] = 254,  
    [255] = 255,  
    [256] = 256,  
    [257] = 257,  
    [258] = 258,  
    [259] = 259,  
    [260] = 260,  
    [261] = 261,  
    [262] = 262,  
    [263] = 263,  
    [264] = 264,  
    [265] = 265,  
    [266] = 266,  
    [267] = 267,  
    [268] = 268,  
    [269] = 269,  
    [270] = 270,  
    [271] = 271,  
    [272] = 272,  
    [273] = 273,  
    [274] = 274,  
    [275] = 275,  
    [276] = 276,  
    [277] = 277,  
    [278] = 278,  
    [279] = 279,  
    [280] = 280,  
    [281] = 281,  
    [282] = 282,  
    [283] = 283,  
    [284] = 284,  
    [285] = 285,  
    [286] = 286,  
    [287] = 287,  
    [288] = 288,  
    [289] = 289,  
    [290] = 290,  
    [291] = 291,  
    [292] = 292,  
    [293] = 293,  
    [294] = 294,  
    [295] = 295,  
    [296] = 296,  
    [297] = 297,  
    [298] = 298,  
    [299] = 299,  
    [300] = 300,  
    [301] = 301,  
    [302] = 302,  
    [303] = 303,  
    [304] = 304,  
    [305] = 305,  
    [306] = 306,  
    [307] = 307,  
    [308] = 308,  
    [309] = 309,  
    [310] = 310,  
    [311] = 311,  
    [312] = 312,  
    [313] = 313,  
    [314] = 314,  
    [315] = 315,  
    [316] = 316,  
    [317] = 317,  
    [318] = 318,  
    [319] = 319,  
    [320] = 320,  
    [321] = 321,  
    [322] = 322,  
    [323] = 323,  
    [324] = 324,  
    [325] = 325,  
    [326] = 326,  
    [327] = 327,  
    [328] = 328,  
    [329] = 329,  
    [330] = 330,  
    [331] = 331,  
    [332] = 332,  
    [333] = 333,  
    [334] = 334,  
    [335] = 335,  
    [336] = 336,  
    [337] = 337,  
    [338] = 338,  
    [339] = 339,  
    [340] = 340,  
    [341] = 341,  
    [342] = 342,  
    [343] = 343,  
    [344] = 344,  
    [345] = 345,  
    [346] = 346,  
    [347] = 347,  
    [348] = 348,  
    [349] = 349,  
    [350] = 350,  
    [351] = 351,  
    [352] = 352,  
    [353] = 353,  
    [354] = 354,  
    [355] = 355,  
    [356] = 356,  
    [357] = 357,  
    [358] = 358,  
    [359] = 359,  
    [360] = 360,  
    [361] = 361,  
    [362] = 362,  
    [363] = 363,  
    [364] = 364,  
    [365] = 365,  
    [366] = 366,  
    [367] = 367,  
    [368] = 368,  
    [369] = 369,  
    [370] = 370,  
    [371] = 371,  
    [372] = 372,  
    [373] = 373,  
    [374] = 374,  
    [375] = 375,  
    [376] = 376,  
    [377] = 377,  
    [378] = 378,  
    [379] = 379,  
    [380] = 380,  
    [381] = 381,  
    [382] = 382,  
    [383] = 383,  
    [384] = 384,  
    [385] = 385,  
    [386] = 386,  
    [387] = 387,  
    [388] = 388,  
    [389] = 389,  
    [390] = 390,  
    [391] = 391,  
    [392] = 392,  
    [393] = 393,  
    [394] = 394,  
    [395] = 395,  
    [396] = 396,  
    [397] = 397,  
    [398] = 398,  
    [399] = 399,  
    [400] = 400,  
    [401] = 401,  
    [402] = 402,  
    [403] = 403,  
    [404] = 404,  
    [405] = 405,  
    [406] = 406,  
    [407] = 407,  
    [408] = 408,  
    [409] = 409,  
    [410] = 410,  
    [411] = 411,  
    [412] = 412,  
    [413] = 413,  
    [414] = 414,  
    [415] = 415,  
    [416] = 416,  
    [417] = 417,  
    [418] = 418,  
    [419] = 419,  
    [420] = 420,  
    [421] = 421,  
    [422] = 422,  
    [423] = 423,  
    [424] = 424,  
    [425] = 425,  
    [426] = 426,  
    [427] = 427,  
    [428] = 428,  
    [429] = 429,  
    [430] = 430,  
    [431] = 431,  
    [432] = 432,  
    [433] = 433,  
    [434] = 434,  
    [435] = 435,  
    [436] = 436,  
    [437] = 437,  
    [438] = 438,  
    [439] = 439,  
    [440] = 440,  
    [441] = 441,  
    [442] = 442,  
    [443] = 443,  
    [444] = 444,  
    [445] = 445,  
    [446] = 446,  
    [447] = 447,  
    [448] = 448,  
    [449] = 449,  
    [450] = 450,  
    [451] = 451,  
    [452] = 452,  
    [453] = 453,  
    [454] = 454,  
    [455] = 455,  
    [456] = 456,  
    [457] = 457,  
    [458] = 458,  
    [459] = 459,  
    [460] = 460,  
    [461] = 461,  
    [462] = 462,  
    [463] = 463,  
    [464] = 464,  
    [465] = 465,  
    [466] = 466,  
    [467] = 467,  
    [468] = 468,  
    [469] = 469,  
    [470] = 470,  
    [471] = 471,  
    [472] = 472,  
    [473] = 473,  
    [474] = 474,  
    [475] = 475,  
    [476] = 476,  
    [477] = 477,  
    [478] = 478,  
    [479] = 479,  
    [480] = 480,
}

local __key_map = { 
    id = 1,
    award_type = 2,
    type = 3,
    value = 4,
    size = 5,
    num = 6,
    rare = 7,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_guild_dungeon_award_info")

        return t._raw[__key_map[k]]
    end
}


function guild_dungeon_award_info.getLength()
    return #guild_dungeon_award_info._data
end



function guild_dungeon_award_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_guild_dungeon_award_info
function guild_dungeon_award_info.indexOf(index)
    if index == nil or not guild_dungeon_award_info._data[index] then
        return nil
    end
    return setmetatable({_raw = guild_dungeon_award_info._data[index]}, m)
end



---
--@return @class record_guild_dungeon_award_info
function guild_dungeon_award_info.get(id)
    
    return guild_dungeon_award_info.indexOf(__index_id[ id ])
     
end



function guild_dungeon_award_info.set(id, key, value)
    local record = guild_dungeon_award_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function guild_dungeon_award_info.get_index_data()
    return __index_id 
end

return  guild_dungeon_award_info 