---@classdef record_guild_statue_info
local record_guild_statue_info = {}


record_guild_statue_info.id = 0--id
record_guild_statue_info.level = 0--军团等级
record_guild_statue_info.type = 0--类型
record_guild_statue_info.name =  ""--名称
record_guild_statue_info.pic =  ""--部件美术资源
record_guild_statue_info.box =  ""--宝箱资源
record_guild_statue_info.stage = 0--阶段
record_guild_statue_info.next_stage_id = 0--下一阶段id
record_guild_statue_info.progress = 0--升到下一阶段进度值
record_guild_statue_info.next_stage_award = 0--升到下一阶段奖励
record_guild_statue_info.next_stage_guild_exp = 0--升到下一阶段军团经验
record_guild_statue_info.statue_reward = 0--铸造奖励（每个铸造石）
record_guild_statue_info.statue_guild_exp = 0--铸造军团经验（每个铸造石）
record_guild_statue_info.statue_final_reward = 0--显灵阶段奖励

local guild_statue_info = {
   _data = {   
    [1] = {1,1,1,"头盔","toukui_tie","0",1,7,35,210211,35,210201,5,101,},  
    [2] = {2,1,2,"武器","wuqi_tie","0",1,8,35,210211,35,210201,5,101,},  
    [3] = {3,1,3,"胸甲","xiongjia_tie","0",1,9,35,210211,35,210201,5,101,},  
    [4] = {4,1,4,"肩甲","jianjia_tie","0",1,10,35,210211,35,210201,5,101,},  
    [5] = {5,1,5,"腰带","yaodai_tie","0",1,11,35,210211,35,210201,5,101,},  
    [6] = {6,1,6,"腿甲","tuijia_tie","0",1,12,35,210211,35,210201,5,101,},  
    [7] = {7,1,1,"头盔","toukui_tong","3",2,13,60,210221,60,210201,5,201,},  
    [8] = {8,1,2,"武器","wuqi_tong","3",2,14,60,210221,60,210201,5,201,},  
    [9] = {9,1,3,"胸甲","xiongjia_tong","3",2,15,60,210221,60,210201,5,201,},  
    [10] = {10,1,4,"肩甲","jianjia_tong","3",2,16,60,210221,60,210201,5,201,},  
    [11] = {11,1,5,"腰带","yaodai_tong","3",2,17,60,210221,60,210201,5,201,},  
    [12] = {12,1,6,"腿甲","tuijia_tong","3",2,18,60,210221,60,210201,5,201,},  
    [13] = {13,1,1,"头盔","toukui_yin","4",3,19,100,210231,100,210201,5,301,},  
    [14] = {14,1,2,"武器","wuqi_yin","4",3,20,100,210231,100,210201,5,301,},  
    [15] = {15,1,3,"胸甲","xiongjia_yin","4",3,21,100,210231,100,210201,5,301,},  
    [16] = {16,1,4,"肩甲","jianjia_yin","4",3,22,100,210231,100,210201,5,301,},  
    [17] = {17,1,5,"腰带","yaodai_yin","4",3,23,100,210231,100,210201,5,301,},  
    [18] = {18,1,6,"腿甲","tuijia_yin","4",3,24,100,210231,100,210201,5,301,},  
    [19] = {19,1,1,"头盔","toukui_jin","5",4,0,0,0,0,210201,5,401,},  
    [20] = {20,1,2,"武器","wuqi_jin","5",4,0,0,0,0,210201,5,401,},  
    [21] = {21,1,3,"胸甲","xiongjia_jin","5",4,0,0,0,0,210201,5,401,},  
    [22] = {22,1,4,"肩甲","jianjia_jin","5",4,0,0,0,0,210201,5,401,},  
    [23] = {23,1,5,"腰带","yaodai_jin","5",4,0,0,0,0,210201,5,401,},  
    [24] = {24,1,6,"腿甲","tuijia_jin","5",4,0,0,0,0,210201,5,401,},  
    [25] = {25,2,1,"头盔","toukui_tie","0",1,31,40,210212,40,210201,5,102,},  
    [26] = {26,2,2,"武器","wuqi_tie","0",1,32,40,210212,40,210201,5,102,},  
    [27] = {27,2,3,"胸甲","xiongjia_tie","0",1,33,40,210212,40,210201,5,102,},  
    [28] = {28,2,4,"肩甲","jianjia_tie","0",1,34,40,210212,40,210201,5,102,},  
    [29] = {29,2,5,"腰带","yaodai_tie","0",1,35,40,210212,40,210201,5,102,},  
    [30] = {30,2,6,"腿甲","tuijia_tie","0",1,36,40,210212,40,210201,5,102,},  
    [31] = {31,2,1,"头盔","toukui_tong","3",2,37,65,210222,65,210201,5,202,},  
    [32] = {32,2,2,"武器","wuqi_tong","3",2,38,65,210222,65,210201,5,202,},  
    [33] = {33,2,3,"胸甲","xiongjia_tong","3",2,39,65,210222,65,210201,5,202,},  
    [34] = {34,2,4,"肩甲","jianjia_tong","3",2,40,65,210222,65,210201,5,202,},  
    [35] = {35,2,5,"腰带","yaodai_tong","3",2,41,65,210222,65,210201,5,202,},  
    [36] = {36,2,6,"腿甲","tuijia_tong","3",2,42,65,210222,65,210201,5,202,},  
    [37] = {37,2,1,"头盔","toukui_yin","4",3,43,105,210232,105,210201,5,302,},  
    [38] = {38,2,2,"武器","wuqi_yin","4",3,44,105,210232,105,210201,5,302,},  
    [39] = {39,2,3,"胸甲","xiongjia_yin","4",3,45,105,210232,105,210201,5,302,},  
    [40] = {40,2,4,"肩甲","jianjia_yin","4",3,46,105,210232,105,210201,5,302,},  
    [41] = {41,2,5,"腰带","yaodai_yin","4",3,47,105,210232,105,210201,5,302,},  
    [42] = {42,2,6,"腿甲","tuijia_yin","4",3,48,105,210232,105,210201,5,302,},  
    [43] = {43,2,1,"头盔","toukui_jin","5",4,0,0,0,0,210201,5,402,},  
    [44] = {44,2,2,"武器","wuqi_jin","5",4,0,0,0,0,210201,5,402,},  
    [45] = {45,2,3,"胸甲","xiongjia_jin","5",4,0,0,0,0,210201,5,402,},  
    [46] = {46,2,4,"肩甲","jianjia_jin","5",4,0,0,0,0,210201,5,402,},  
    [47] = {47,2,5,"腰带","yaodai_jin","5",4,0,0,0,0,210201,5,402,},  
    [48] = {48,2,6,"腿甲","tuijia_jin","5",4,0,0,0,0,210201,5,402,},  
    [49] = {49,3,1,"头盔","toukui_tie","0",1,31,40,210213,40,210201,5,103,},  
    [50] = {50,3,2,"武器","wuqi_tie","0",1,32,40,210213,40,210201,5,103,},  
    [51] = {51,3,3,"胸甲","xiongjia_tie","0",1,33,40,210213,40,210201,5,103,},  
    [52] = {52,3,4,"肩甲","jianjia_tie","0",1,34,40,210213,40,210201,5,103,},  
    [53] = {53,3,5,"腰带","yaodai_tie","0",1,35,40,210213,40,210201,5,103,},  
    [54] = {54,3,6,"腿甲","tuijia_tie","0",1,36,40,210213,40,210201,5,103,},  
    [55] = {55,3,1,"头盔","toukui_tong","3",2,37,70,210223,70,210201,5,203,},  
    [56] = {56,3,2,"武器","wuqi_tong","3",2,38,70,210223,70,210201,5,203,},  
    [57] = {57,3,3,"胸甲","xiongjia_tong","3",2,39,70,210223,70,210201,5,203,},  
    [58] = {58,3,4,"肩甲","jianjia_tong","3",2,40,70,210223,70,210201,5,203,},  
    [59] = {59,3,5,"腰带","yaodai_tong","3",2,41,70,210223,70,210201,5,203,},  
    [60] = {60,3,6,"腿甲","tuijia_tong","3",2,42,70,210223,70,210201,5,203,},  
    [61] = {61,3,1,"头盔","toukui_yin","4",3,43,110,210233,110,210201,5,303,},  
    [62] = {62,3,2,"武器","wuqi_yin","4",3,44,110,210233,110,210201,5,303,},  
    [63] = {63,3,3,"胸甲","xiongjia_yin","4",3,45,110,210233,110,210201,5,303,},  
    [64] = {64,3,4,"肩甲","jianjia_yin","4",3,46,110,210233,110,210201,5,303,},  
    [65] = {65,3,5,"腰带","yaodai_yin","4",3,47,110,210233,110,210201,5,303,},  
    [66] = {66,3,6,"腿甲","tuijia_yin","4",3,48,110,210233,110,210201,5,303,},  
    [67] = {67,3,1,"头盔","toukui_jin","5",4,0,0,0,0,210201,5,403,},  
    [68] = {68,3,2,"武器","wuqi_jin","5",4,0,0,0,0,210201,5,403,},  
    [69] = {69,3,3,"胸甲","xiongjia_jin","5",4,0,0,0,0,210201,5,403,},  
    [70] = {70,3,4,"肩甲","jianjia_jin","5",4,0,0,0,0,210201,5,403,},  
    [71] = {71,3,5,"腰带","yaodai_jin","5",4,0,0,0,0,210201,5,403,},  
    [72] = {72,3,6,"腿甲","tuijia_jin","5",4,0,0,0,0,210201,5,403,},  
    [73] = {73,4,1,"头盔","toukui_tie","0",1,31,45,210214,45,210201,5,104,},  
    [74] = {74,4,2,"武器","wuqi_tie","0",1,32,45,210214,45,210201,5,104,},  
    [75] = {75,4,3,"胸甲","xiongjia_tie","0",1,33,45,210214,45,210201,5,104,},  
    [76] = {76,4,4,"肩甲","jianjia_tie","0",1,34,45,210214,45,210201,5,104,},  
    [77] = {77,4,5,"腰带","yaodai_tie","0",1,35,45,210214,45,210201,5,104,},  
    [78] = {78,4,6,"腿甲","tuijia_tie","0",1,36,45,210214,45,210201,5,104,},  
    [79] = {79,4,1,"头盔","toukui_tong","3",2,37,75,210224,75,210201,5,204,},  
    [80] = {80,4,2,"武器","wuqi_tong","3",2,38,75,210224,75,210201,5,204,},  
    [81] = {81,4,3,"胸甲","xiongjia_tong","3",2,39,75,210224,75,210201,5,204,},  
    [82] = {82,4,4,"肩甲","jianjia_tong","3",2,40,75,210224,75,210201,5,204,},  
    [83] = {83,4,5,"腰带","yaodai_tong","3",2,41,75,210224,75,210201,5,204,},  
    [84] = {84,4,6,"腿甲","tuijia_tong","3",2,42,75,210224,75,210201,5,204,},  
    [85] = {85,4,1,"头盔","toukui_yin","4",3,43,120,210234,120,210201,5,304,},  
    [86] = {86,4,2,"武器","wuqi_yin","4",3,44,120,210234,120,210201,5,304,},  
    [87] = {87,4,3,"胸甲","xiongjia_yin","4",3,45,120,210234,120,210201,5,304,},  
    [88] = {88,4,4,"肩甲","jianjia_yin","4",3,46,120,210234,120,210201,5,304,},  
    [89] = {89,4,5,"腰带","yaodai_yin","4",3,47,120,210234,120,210201,5,304,},  
    [90] = {90,4,6,"腿甲","tuijia_yin","4",3,48,120,210234,120,210201,5,304,},  
    [91] = {91,4,1,"头盔","toukui_jin","5",4,0,0,0,0,210201,5,404,},  
    [92] = {92,4,2,"武器","wuqi_jin","5",4,0,0,0,0,210201,5,404,},  
    [93] = {93,4,3,"胸甲","xiongjia_jin","5",4,0,0,0,0,210201,5,404,},  
    [94] = {94,4,4,"肩甲","jianjia_jin","5",4,0,0,0,0,210201,5,404,},  
    [95] = {95,4,5,"腰带","yaodai_jin","5",4,0,0,0,0,210201,5,404,},  
    [96] = {96,4,6,"腿甲","tuijia_jin","5",4,0,0,0,0,210201,5,404,},  
    [97] = {97,5,1,"头盔","toukui_tie","0",1,31,45,210215,45,210201,5,105,},  
    [98] = {98,5,2,"武器","wuqi_tie","0",1,32,45,210215,45,210201,5,105,},  
    [99] = {99,5,3,"胸甲","xiongjia_tie","0",1,33,45,210215,45,210201,5,105,},  
    [100] = {100,5,4,"肩甲","jianjia_tie","0",1,34,45,210215,45,210201,5,105,},  
    [101] = {101,5,5,"腰带","yaodai_tie","0",1,35,45,210215,45,210201,5,105,},  
    [102] = {102,5,6,"腿甲","tuijia_tie","0",1,36,45,210215,45,210201,5,105,},  
    [103] = {103,5,1,"头盔","toukui_tong","3",2,37,75,210225,75,210201,5,205,},  
    [104] = {104,5,2,"武器","wuqi_tong","3",2,38,75,210225,75,210201,5,205,},  
    [105] = {105,5,3,"胸甲","xiongjia_tong","3",2,39,75,210225,75,210201,5,205,},  
    [106] = {106,5,4,"肩甲","jianjia_tong","3",2,40,75,210225,75,210201,5,205,},  
    [107] = {107,5,5,"腰带","yaodai_tong","3",2,41,75,210225,75,210201,5,205,},  
    [108] = {108,5,6,"腿甲","tuijia_tong","3",2,42,75,210225,75,210201,5,205,},  
    [109] = {109,5,1,"头盔","toukui_yin","4",3,43,125,210235,125,210201,5,305,},  
    [110] = {110,5,2,"武器","wuqi_yin","4",3,44,125,210235,125,210201,5,305,},  
    [111] = {111,5,3,"胸甲","xiongjia_yin","4",3,45,125,210235,125,210201,5,305,},  
    [112] = {112,5,4,"肩甲","jianjia_yin","4",3,46,125,210235,125,210201,5,305,},  
    [113] = {113,5,5,"腰带","yaodai_yin","4",3,47,125,210235,125,210201,5,305,},  
    [114] = {114,5,6,"腿甲","tuijia_yin","4",3,48,125,210235,125,210201,5,305,},  
    [115] = {115,5,1,"头盔","toukui_jin","5",4,0,0,0,0,210201,5,405,},  
    [116] = {116,5,2,"武器","wuqi_jin","5",4,0,0,0,0,210201,5,405,},  
    [117] = {117,5,3,"胸甲","xiongjia_jin","5",4,0,0,0,0,210201,5,405,},  
    [118] = {118,5,4,"肩甲","jianjia_jin","5",4,0,0,0,0,210201,5,405,},  
    [119] = {119,5,5,"腰带","yaodai_jin","5",4,0,0,0,0,210201,5,405,},  
    [120] = {120,5,6,"腿甲","tuijia_jin","5",4,0,0,0,0,210201,5,405,},  
    [121] = {121,6,1,"头盔","toukui_tie","0",1,7,50,210216,50,210201,5,106,},  
    [122] = {122,6,2,"武器","wuqi_tie","0",1,8,50,210216,50,210201,5,106,},  
    [123] = {123,6,3,"胸甲","xiongjia_tie","0",1,9,50,210216,50,210201,5,106,},  
    [124] = {124,6,4,"肩甲","jianjia_tie","0",1,10,50,210216,50,210201,5,106,},  
    [125] = {125,6,5,"腰带","yaodai_tie","0",1,11,50,210216,50,210201,5,106,},  
    [126] = {126,6,6,"腿甲","tuijia_tie","0",1,12,50,210216,50,210201,5,106,},  
    [127] = {127,6,1,"头盔","toukui_tong","3",2,13,80,210226,80,210201,5,206,},  
    [128] = {128,6,2,"武器","wuqi_tong","3",2,14,80,210226,80,210201,5,206,},  
    [129] = {129,6,3,"胸甲","xiongjia_tong","3",2,15,80,210226,80,210201,5,206,},  
    [130] = {130,6,4,"肩甲","jianjia_tong","3",2,16,80,210226,80,210201,5,206,},  
    [131] = {131,6,5,"腰带","yaodai_tong","3",2,17,80,210226,80,210201,5,206,},  
    [132] = {132,6,6,"腿甲","tuijia_tong","3",2,18,80,210226,80,210201,5,206,},  
    [133] = {133,6,1,"头盔","toukui_yin","4",3,19,130,210236,130,210201,5,306,},  
    [134] = {134,6,2,"武器","wuqi_yin","4",3,20,130,210236,130,210201,5,306,},  
    [135] = {135,6,3,"胸甲","xiongjia_yin","4",3,21,130,210236,130,210201,5,306,},  
    [136] = {136,6,4,"肩甲","jianjia_yin","4",3,22,130,210236,130,210201,5,306,},  
    [137] = {137,6,5,"腰带","yaodai_yin","4",3,23,130,210236,130,210201,5,306,},  
    [138] = {138,6,6,"腿甲","tuijia_yin","4",3,24,130,210236,130,210201,5,306,},  
    [139] = {139,6,1,"头盔","toukui_jin","5",4,0,0,0,0,210201,5,406,},  
    [140] = {140,6,2,"武器","wuqi_jin","5",4,0,0,0,0,210201,5,406,},  
    [141] = {141,6,3,"胸甲","xiongjia_jin","5",4,0,0,0,0,210201,5,406,},  
    [142] = {142,6,4,"肩甲","jianjia_jin","5",4,0,0,0,0,210201,5,406,},  
    [143] = {143,6,5,"腰带","yaodai_jin","5",4,0,0,0,0,210201,5,406,},  
    [144] = {144,6,6,"腿甲","tuijia_jin","5",4,0,0,0,0,210201,5,406,},  
    [145] = {145,7,1,"头盔","toukui_tie","0",1,31,50,210217,50,210201,5,107,},  
    [146] = {146,7,2,"武器","wuqi_tie","0",1,32,50,210217,50,210201,5,107,},  
    [147] = {147,7,3,"胸甲","xiongjia_tie","0",1,33,50,210217,50,210201,5,107,},  
    [148] = {148,7,4,"肩甲","jianjia_tie","0",1,34,50,210217,50,210201,5,107,},  
    [149] = {149,7,5,"腰带","yaodai_tie","0",1,35,50,210217,50,210201,5,107,},  
    [150] = {150,7,6,"腿甲","tuijia_tie","0",1,36,50,210217,50,210201,5,107,},  
    [151] = {151,7,1,"头盔","toukui_tong","3",2,37,85,210227,85,210201,5,207,},  
    [152] = {152,7,2,"武器","wuqi_tong","3",2,38,85,210227,85,210201,5,207,},  
    [153] = {153,7,3,"胸甲","xiongjia_tong","3",2,39,85,210227,85,210201,5,207,},  
    [154] = {154,7,4,"肩甲","jianjia_tong","3",2,40,85,210227,85,210201,5,207,},  
    [155] = {155,7,5,"腰带","yaodai_tong","3",2,41,85,210227,85,210201,5,207,},  
    [156] = {156,7,6,"腿甲","tuijia_tong","3",2,42,85,210227,85,210201,5,207,},  
    [157] = {157,7,1,"头盔","toukui_yin","4",3,43,140,210237,140,210201,5,307,},  
    [158] = {158,7,2,"武器","wuqi_yin","4",3,44,140,210237,140,210201,5,307,},  
    [159] = {159,7,3,"胸甲","xiongjia_yin","4",3,45,140,210237,140,210201,5,307,},  
    [160] = {160,7,4,"肩甲","jianjia_yin","4",3,46,140,210237,140,210201,5,307,},  
    [161] = {161,7,5,"腰带","yaodai_yin","4",3,47,140,210237,140,210201,5,307,},  
    [162] = {162,7,6,"腿甲","tuijia_yin","4",3,48,140,210237,140,210201,5,307,},  
    [163] = {163,7,1,"头盔","toukui_jin","5",4,0,0,0,0,210201,5,407,},  
    [164] = {164,7,2,"武器","wuqi_jin","5",4,0,0,0,0,210201,5,407,},  
    [165] = {165,7,3,"胸甲","xiongjia_jin","5",4,0,0,0,0,210201,5,407,},  
    [166] = {166,7,4,"肩甲","jianjia_jin","5",4,0,0,0,0,210201,5,407,},  
    [167] = {167,7,5,"腰带","yaodai_jin","5",4,0,0,0,0,210201,5,407,},  
    [168] = {168,7,6,"腿甲","tuijia_jin","5",4,0,0,0,0,210201,5,407,},  
    [169] = {169,8,1,"头盔","toukui_tie","0",1,31,55,210218,55,210201,5,108,},  
    [170] = {170,8,2,"武器","wuqi_tie","0",1,32,55,210218,55,210201,5,108,},  
    [171] = {171,8,3,"胸甲","xiongjia_tie","0",1,33,55,210218,55,210201,5,108,},  
    [172] = {172,8,4,"肩甲","jianjia_tie","0",1,34,55,210218,55,210201,5,108,},  
    [173] = {173,8,5,"腰带","yaodai_tie","0",1,35,55,210218,55,210201,5,108,},  
    [174] = {174,8,6,"腿甲","tuijia_tie","0",1,36,55,210218,55,210201,5,108,},  
    [175] = {175,8,1,"头盔","toukui_tong","3",2,37,90,210228,90,210201,5,208,},  
    [176] = {176,8,2,"武器","wuqi_tong","3",2,38,90,210228,90,210201,5,208,},  
    [177] = {177,8,3,"胸甲","xiongjia_tong","3",2,39,90,210228,90,210201,5,208,},  
    [178] = {178,8,4,"肩甲","jianjia_tong","3",2,40,90,210228,90,210201,5,208,},  
    [179] = {179,8,5,"腰带","yaodai_tong","3",2,41,90,210228,90,210201,5,208,},  
    [180] = {180,8,6,"腿甲","tuijia_tong","3",2,42,90,210228,90,210201,5,208,},  
    [181] = {181,8,1,"头盔","toukui_yin","4",3,43,145,210238,145,210201,5,308,},  
    [182] = {182,8,2,"武器","wuqi_yin","4",3,44,145,210238,145,210201,5,308,},  
    [183] = {183,8,3,"胸甲","xiongjia_yin","4",3,45,145,210238,145,210201,5,308,},  
    [184] = {184,8,4,"肩甲","jianjia_yin","4",3,46,145,210238,145,210201,5,308,},  
    [185] = {185,8,5,"腰带","yaodai_yin","4",3,47,145,210238,145,210201,5,308,},  
    [186] = {186,8,6,"腿甲","tuijia_yin","4",3,48,145,210238,145,210201,5,308,},  
    [187] = {187,8,1,"头盔","toukui_jin","5",4,0,0,0,0,210201,5,408,},  
    [188] = {188,8,2,"武器","wuqi_jin","5",4,0,0,0,0,210201,5,408,},  
    [189] = {189,8,3,"胸甲","xiongjia_jin","5",4,0,0,0,0,210201,5,408,},  
    [190] = {190,8,4,"肩甲","jianjia_jin","5",4,0,0,0,0,210201,5,408,},  
    [191] = {191,8,5,"腰带","yaodai_jin","5",4,0,0,0,0,210201,5,408,},  
    [192] = {192,8,6,"腿甲","tuijia_jin","5",4,0,0,0,0,210201,5,408,},  
    [193] = {193,9,1,"头盔","toukui_tie","0",1,31,55,210219,55,210201,5,109,},  
    [194] = {194,9,2,"武器","wuqi_tie","0",1,32,55,210219,55,210201,5,109,},  
    [195] = {195,9,3,"胸甲","xiongjia_tie","0",1,33,55,210219,55,210201,5,109,},  
    [196] = {196,9,4,"肩甲","jianjia_tie","0",1,34,55,210219,55,210201,5,109,},  
    [197] = {197,9,5,"腰带","yaodai_tie","0",1,35,55,210219,55,210201,5,109,},  
    [198] = {198,9,6,"腿甲","tuijia_tie","0",1,36,55,210219,55,210201,5,109,},  
    [199] = {199,9,1,"头盔","toukui_tong","3",2,37,95,210229,95,210201,5,209,},  
    [200] = {200,9,2,"武器","wuqi_tong","3",2,38,95,210229,95,210201,5,209,},  
    [201] = {201,9,3,"胸甲","xiongjia_tong","3",2,39,95,210229,95,210201,5,209,},  
    [202] = {202,9,4,"肩甲","jianjia_tong","3",2,40,95,210229,95,210201,5,209,},  
    [203] = {203,9,5,"腰带","yaodai_tong","3",2,41,95,210229,95,210201,5,209,},  
    [204] = {204,9,6,"腿甲","tuijia_tong","3",2,42,95,210229,95,210201,5,209,},  
    [205] = {205,9,1,"头盔","toukui_yin","4",3,43,150,210239,150,210201,5,309,},  
    [206] = {206,9,2,"武器","wuqi_yin","4",3,44,150,210239,150,210201,5,309,},  
    [207] = {207,9,3,"胸甲","xiongjia_yin","4",3,45,150,210239,150,210201,5,309,},  
    [208] = {208,9,4,"肩甲","jianjia_yin","4",3,46,150,210239,150,210201,5,309,},  
    [209] = {209,9,5,"腰带","yaodai_yin","4",3,47,150,210239,150,210201,5,309,},  
    [210] = {210,9,6,"腿甲","tuijia_yin","4",3,48,150,210239,150,210201,5,309,},  
    [211] = {211,9,1,"头盔","toukui_jin","5",4,0,0,0,0,210201,5,409,},  
    [212] = {212,9,2,"武器","wuqi_jin","5",4,0,0,0,0,210201,5,409,},  
    [213] = {213,9,3,"胸甲","xiongjia_jin","5",4,0,0,0,0,210201,5,409,},  
    [214] = {214,9,4,"肩甲","jianjia_jin","5",4,0,0,0,0,210201,5,409,},  
    [215] = {215,9,5,"腰带","yaodai_jin","5",4,0,0,0,0,210201,5,409,},  
    [216] = {216,9,6,"腿甲","tuijia_jin","5",4,0,0,0,0,210201,5,409,},  
    [217] = {217,10,1,"头盔","toukui_tie","0",1,31,60,210220,60,210201,5,110,},  
    [218] = {218,10,2,"武器","wuqi_tie","0",1,32,60,210220,60,210201,5,110,},  
    [219] = {219,10,3,"胸甲","xiongjia_tie","0",1,33,60,210220,60,210201,5,110,},  
    [220] = {220,10,4,"肩甲","jianjia_tie","0",1,34,60,210220,60,210201,5,110,},  
    [221] = {221,10,5,"腰带","yaodai_tie","0",1,35,60,210220,60,210201,5,110,},  
    [222] = {222,10,6,"腿甲","tuijia_tie","0",1,36,60,210220,60,210201,5,110,},  
    [223] = {223,10,1,"头盔","toukui_tong","3",2,37,100,210230,100,210201,5,210,},  
    [224] = {224,10,2,"武器","wuqi_tong","3",2,38,100,210230,100,210201,5,210,},  
    [225] = {225,10,3,"胸甲","xiongjia_tong","3",2,39,100,210230,100,210201,5,210,},  
    [226] = {226,10,4,"肩甲","jianjia_tong","3",2,40,100,210230,100,210201,5,210,},  
    [227] = {227,10,5,"腰带","yaodai_tong","3",2,41,100,210230,100,210201,5,210,},  
    [228] = {228,10,6,"腿甲","tuijia_tong","3",2,42,100,210230,100,210201,5,210,},  
    [229] = {229,10,1,"头盔","toukui_yin","4",3,43,160,210240,160,210201,5,310,},  
    [230] = {230,10,2,"武器","wuqi_yin","4",3,44,160,210240,160,210201,5,310,},  
    [231] = {231,10,3,"胸甲","xiongjia_yin","4",3,45,160,210240,160,210201,5,310,},  
    [232] = {232,10,4,"肩甲","jianjia_yin","4",3,46,160,210240,160,210201,5,310,},  
    [233] = {233,10,5,"腰带","yaodai_yin","4",3,47,160,210240,160,210201,5,310,},  
    [234] = {234,10,6,"腿甲","tuijia_yin","4",3,48,160,210240,160,210201,5,310,},  
    [235] = {235,10,1,"头盔","toukui_jin","5",4,0,0,0,0,210201,5,410,},  
    [236] = {236,10,2,"武器","wuqi_jin","5",4,0,0,0,0,210201,5,410,},  
    [237] = {237,10,3,"胸甲","xiongjia_jin","5",4,0,0,0,0,210201,5,410,},  
    [238] = {238,10,4,"肩甲","jianjia_jin","5",4,0,0,0,0,210201,5,410,},  
    [239] = {239,10,5,"腰带","yaodai_jin","5",4,0,0,0,0,210201,5,410,},  
    [240] = {240,10,6,"腿甲","tuijia_jin","5",4,0,0,0,0,210201,5,410,},
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
}

local __key_map = { 
    id = 1,
    level = 2,
    type = 3,
    name = 4,
    pic = 5,
    box = 6,
    stage = 7,
    next_stage_id = 8,
    progress = 9,
    next_stage_award = 10,
    next_stage_guild_exp = 11,
    statue_reward = 12,
    statue_guild_exp = 13,
    statue_final_reward = 14,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_guild_statue_info")

        return t._raw[__key_map[k]]
    end
}


function guild_statue_info.getLength()
    return #guild_statue_info._data
end



function guild_statue_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_guild_statue_info
function guild_statue_info.indexOf(index)
    if index == nil or not guild_statue_info._data[index] then
        return nil
    end
    return setmetatable({_raw = guild_statue_info._data[index]}, m)
end



---
--@return @class record_guild_statue_info
function guild_statue_info.get(id)
    
    return guild_statue_info.indexOf(__index_id[ id ])
     
end



function guild_statue_info.set(id, key, value)
    local record = guild_statue_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function guild_statue_info.get_index_data()
    return __index_id 
end

return  guild_statue_info 