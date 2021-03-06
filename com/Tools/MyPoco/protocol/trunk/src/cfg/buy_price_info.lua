---@classdef record_buy_price_info
local record_buy_price_info = {}


record_buy_price_info.id = 0--id
record_buy_price_info.num = 0--购买次数
record_buy_price_info.price = 0--购买价格
record_buy_price_info.discount = 0--折扣
record_buy_price_info.direction =  ""--描述

local buy_price_info = {
   _data = {   
    [1] = {1,1,500,5,"策划备注1",},  
    [2] = {1,3,600,10,"策划备注2",},  
    [3] = {1,5,700,15,"策划备注3",},  
    [4] = {1,7,800,20,"策划备注4",},  
    [5] = {1,9,900,25,"策划备注5",},  
    [6] = {2,11,1000,30,"策划备注6",},  
    [7] = {2,13,1100,35,"策划备注7",},  
    [8] = {2,15,1200,40,"策划备注8",},  
    [9] = {2,17,1300,45,"策划备注9",},  
    [10] = {2,19,1400,50,"策划备注10",},  
    [11] = {3,1,10,30,"神将列传-武将传记购买次数",},  
    [12] = {3,2,20,60,"神将列传-武将传记购买次数",},  
    [13] = {3,3,30,100,"神将列传-武将传记购买次数",},  
    [14] = {3,4,30,100,"神将列传-武将传记购买次数",},  
    [15] = {3,5,30,100,"神将列传-武将传记购买次数",},  
    [16] = {4,1,30,30,"神将列传-武将传记关卡重置次数",},  
    [17] = {4,2,50,50,"神将列传-武将传记关卡重置次数",},  
    [18] = {4,3,70,70,"神将列传-武将传记关卡重置次数",},  
    [19] = {4,4,100,100,"神将列传-武将传记关卡重置次数",},  
    [20] = {5,1,100,50,"神将列传-战役购买次数",},  
    [21] = {5,2,150,75,"神将列传-战役购买次数",},  
    [22] = {5,3,200,100,"神将列传-战役购买次数",},  
    [23] = {5,4,200,100,"神将列传-战役购买次数",},  
    [24] = {5,5,200,100,"神将列传-战役购买次数",},  
    [25] = {6,1,500,5,"神将列传-战役关卡重置次数",},  
    [26] = {6,2,600,10,"神将列传-战役关卡重置次数",},  
    [27] = {6,3,700,15,"神将列传-战役关卡重置次数",},  
    [28] = {6,4,800,20,"神将列传-战役关卡重置次数",},  
    [29] = {6,5,900,25,"神将列传-战役关卡重置次数",},  
    [30] = {7,1,15,100,"追击令购买次数",},  
    [31] = {7,2,15,100,"追击令购买次数",},  
    [32] = {7,3,15,100,"追击令购买次数",},  
    [33] = {7,999,15,100,"追击令购买次数",},  
    [34] = {8,1,10,30,"军团副本购买次数",},  
    [35] = {8,2,10,30,"军团副本购买次数",},  
    [36] = {8,3,15,50,"军团副本购买次数",},  
    [37] = {8,4,15,50,"军团副本购买次数",},  
    [38] = {8,5,20,60,"军团副本购买次数",},  
    [39] = {8,6,20,60,"军团副本购买次数",},  
    [40] = {8,7,20,60,"军团副本购买次数",},  
    [41] = {8,8,20,60,"军团副本购买次数",},  
    [42] = {8,9,25,80,"军团副本购买次数",},  
    [43] = {8,10,25,80,"军团副本购买次数",},  
    [44] = {8,11,25,80,"军团副本购买次数",},  
    [45] = {8,12,25,80,"军团副本购买次数",},  
    [46] = {8,13,25,80,"军团副本购买次数",},  
    [47] = {8,14,30,100,"军团副本购买次数",},  
    [48] = {8,15,30,100,"军团副本购买次数",},  
    [49] = {9,1,40,20,"限时优惠商店手动刷新元宝价格",},  
    [50] = {9,3,50,25,"限时优惠商店手动刷新元宝价格",},  
    [51] = {9,6,100,50,"限时优惠商店手动刷新元宝价格",},  
    [52] = {9,9,200,100,"限时优惠商店手动刷新元宝价格",},  
    [53] = {10,1,20,50,"竞技场挑战令购买",},  
    [54] = {10,2,30,75,"竞技场挑战令购买",},  
    [55] = {10,3,40,100,"竞技场挑战令购买",},  
    [56] = {10,999,40,100,"竞技场挑战令购买",},  
    [57] = {11,1,200,60,"无双试炼重置次数购买",},  
    [58] = {11,2,250,80,"无双试炼重置次数购买",},  
    [59] = {11,3,300,100,"无双试炼重置次数购买",},  
    [60] = {12,1,25,100,"体力丹购买价格",},  
    [61] = {12,2,25,100,"体力丹购买价格",},  
    [62] = {12,3,30,100,"体力丹购买价格",},  
    [63] = {12,4,30,100,"体力丹购买价格",},  
    [64] = {12,5,30,100,"体力丹购买价格",},  
    [65] = {12,6,30,100,"体力丹购买价格",},  
    [66] = {12,7,40,100,"体力丹购买价格",},  
    [67] = {12,8,40,100,"体力丹购买价格",},  
    [68] = {12,9,40,100,"体力丹购买价格",},  
    [69] = {12,10,40,100,"体力丹购买价格",},  
    [70] = {12,11,50,100,"体力丹购买价格",},  
    [71] = {12,12,60,100,"体力丹购买价格",},  
    [72] = {12,13,60,100,"体力丹购买价格",},  
    [73] = {12,14,70,100,"体力丹购买价格",},  
    [74] = {12,15,70,100,"体力丹购买价格",},  
    [75] = {12,16,100,100,"体力丹购买价格",},  
    [76] = {12,999,100,100,"体力丹购买价格",},  
    [77] = {13,1,20,50,"夺宝令购买价格",},  
    [78] = {13,2,30,75,"夺宝令购买价格",},  
    [79] = {13,3,40,100,"夺宝令购买价格",},  
    [80] = {13,999,40,100,"夺宝令购买价格",},  
    [81] = {14,1,20,20,"银币购买价格",},  
    [82] = {14,2,40,40,"银币购买价格",},  
    [83] = {14,3,60,60,"银币购买价格",},  
    [84] = {14,4,80,80,"银币购买价格",},  
    [85] = {14,5,100,100,"银币购买价格",},  
    [86] = {14,6,100,100,"银币购买价格",},  
    [87] = {14,999,100,100,"银币购买价格",},  
    [88] = {15,1,150,100,"特级装备随机箱购买价格",},  
    [89] = {15,2,150,100,"特级装备随机箱购买价格",},  
    [90] = {15,999,150,100,"特级装备随机箱购买价格",},  
    [91] = {16,1,200,100,"特级宝物碎片随机箱购买价格",},  
    [92] = {16,2,200,100,"特级宝物碎片随机箱购买价格",},  
    [93] = {16,999,200,100,"特级宝物碎片随机箱购买价格",},  
    [94] = {17,1,100,100,"进阶丹购买价格",},  
    [95] = {17,2,100,100,"进阶丹购买价格",},  
    [96] = {18,1,50,100,"兵符铸造石购买价格",},  
    [97] = {18,2,50,100,"兵符铸造石购买价格",},  
    [98] = {19,1,100,100,"兵符精华购买价格",},  
    [99] = {19,2,100,100,"兵符精华购买价格",},  
    [100] = {19,3,100,100,"兵符精华购买价格",},  
    [101] = {20,1,100,100,"时装精华购买价格",},  
    [102] = {20,2,100,100,"时装精华购买价格",},  
    [103] = {20,3,100,100,"时装精华购买价格",},  
    [104] = {21,1,100,100,"宝物精炼石购买价格",},  
    [105] = {21,2,100,100,"宝物精炼石购买价格",},  
    [106] = {21,3,100,100,"宝物精炼石购买价格",},  
    [107] = {22,1,100,100,"将星石购买价格",},  
    [108] = {22,2,100,100,"将星石购买价格",},  
    [109] = {22,3,100,100,"将星石购买价格",},  
    [110] = {23,1,100,100,"顶级精炼石购买价格",},  
    [111] = {23,2,100,100,"顶级精炼石购买价格",},  
    [112] = {23,999,100,100,"顶级精炼石购买价格",},  
    [113] = {24,1,25,100,"顶级女儿红购买价格",},  
    [114] = {24,2,25,100,"顶级女儿红购买价格",},  
    [115] = {24,999,25,100,"顶级女儿红购买价格",},  
    [116] = {25,1,100,100,"虎符购买价格",},  
    [117] = {25,2,100,100,"虎符购买价格",},  
    [118] = {25,999,100,100,"虎符购买价格",},  
    [119] = {26,1,100,100,"图鉴升级石购买价格",},  
    [120] = {26,2,100,100,"图鉴升级石购买价格",},  
    [121] = {27,1,150,50,"高级招募令购买价格",},  
    [122] = {27,2,300,100,"高级招募令购买价格",},  
    [123] = {28,1,0,0,"军团贡献价格",},  
    [124] = {28,2,50,100,"军团贡献价格",},  
    [125] = {28,3,50,100,"军团贡献价格",},  
    [126] = {28,4,50,100,"军团贡献价格",},  
    [127] = {28,5,50,100,"军团贡献价格",},  
    [128] = {28,6,50,100,"军团贡献价格",},  
    [129] = {28,7,50,100,"军团贡献价格",},  
    [130] = {28,8,50,100,"军团贡献价格",},  
    [131] = {28,9,50,100,"军团贡献价格",},  
    [132] = {28,10,50,100,"军团贡献价格",},  
    [133] = {28,11,50,100,"军团贡献价格",},  
    [134] = {28,12,50,100,"军团贡献价格",},  
    [135] = {28,13,50,100,"军团贡献价格",},  
    [136] = {28,14,50,100,"军团贡献价格",},  
    [137] = {28,15,50,100,"军团贡献价格",},  
    [138] = {28,16,50,100,"军团贡献价格",},  
    [139] = {29,1,50,100,"主线关卡重置价格",},  
    [140] = {29,2,50,100,"主线关卡重置价格",},  
    [141] = {29,3,100,100,"主线关卡重置价格",},  
    [142] = {30,1,5,100,"攻城略地-城池挑战次数购买",},  
    [143] = {30,10,10,100,"攻城略地-城池挑战次数购买",},  
    [144] = {30,30,15,100,"攻城略地-城池挑战次数购买",},  
    [145] = {30,100,20,100,"攻城略地-城池挑战次数购买",},  
    [146] = {31,1,30,100,"免战令（小）价格",},  
    [147] = {31,2,30,100,"免战令（小）价格",},  
    [148] = {31,3,30,100,"免战令（小）价格",},  
    [149] = {32,1,100,100,"免战令（大）价格",},  
    [150] = {32,2,100,100,"免战令（大）价格",},  
    [151] = {32,3,100,100,"免战令（大）价格",},  
    [152] = {33,1,50,100,"进阶材料魂价格",},  
    [153] = {33,2,50,100,"进阶材料魂价格",},  
    [154] = {33,3,50,100,"进阶材料魂价格",},  
    [155] = {34,1,20,100,"过关斩将-关城挑战次数价格",},  
    [156] = {34,2,30,100,"过关斩将-关城挑战次数价格",},  
    [157] = {34,3,50,100,"过关斩将-关城挑战次数价格",},  
    [158] = {34,4,70,100,"过关斩将-关城挑战次数价格",},  
    [159] = {34,5,100,100,"过关斩将-关城挑战次数价格",},  
    [160] = {34,999,100,100,"过关斩将-关城挑战次数价格",},  
    [161] = {35,1,20,100,"过关斩将-关城技能重置次数价格",},  
    [162] = {35,2,50,100,"过关斩将-关城技能重置次数价格",},  
    [163] = {35,3,70,100,"过关斩将-关城技能重置次数价格",},  
    [164] = {35,4,100,100,"过关斩将-关城技能重置次数价格",},  
    [165] = {35,5,150,100,"过关斩将-关城技能重置次数价格",},  
    [166] = {35,6,200,100,"过关斩将-关城技能重置次数价格",},  
    [167] = {35,7,250,100,"过关斩将-关城技能重置次数价格",},  
    [168] = {35,999,250,100,"过关斩将-关城技能重置次数价格",},  
    [169] = {36,1,50,100,"过关斩将-疲劳值价格",},  
    [170] = {36,2,50,100,"过关斩将-疲劳值价格",},  
    [171] = {36,3,75,100,"过关斩将-疲劳值价格",},  
    [172] = {36,4,75,100,"过关斩将-疲劳值价格",},  
    [173] = {36,5,100,100,"过关斩将-疲劳值价格",},  
    [174] = {36,6,100,100,"过关斩将-疲劳值价格",},  
    [175] = {36,7,150,100,"过关斩将-疲劳值价格",},  
    [176] = {36,8,150,100,"过关斩将-疲劳值价格",},  
    [177] = {36,999,150,100,"过关斩将-疲劳值价格",},  
    [178] = {37,1,20,100,"神器商店手动刷新价格",},  
    [179] = {37,999,20,100,"神器商店手动刷新价格",},  
    [180] = {38,1,0,100,"神器抽卡刷新价格",},  
    [181] = {38,2,50,100,"神器抽卡刷新价格",},  
    [182] = {38,999,50,100,"神器抽卡刷新价格",},  
    [183] = {39,1,100,50,"神兵令购买价格",},  
    [184] = {39,2,200,100,"神兵令购买价格",},  
    [185] = {40,20,5,100,"攻城略地军令购买",},  
    [186] = {40,40,10,100,"攻城略地军令购买",},  
    [187] = {40,60,20,100,"攻城略地军令购买",},  
    [188] = {40,80,30,100,"攻城略地军令购买",},  
    [189] = {40,100,50,100,"攻城略地军令购买",},  
    [190] = {40,200,60,100,"攻城略地军令购买",},  
    [191] = {41,1,50,100,"决战定军山次数购买",},  
    [192] = {41,2,100,100,"决战定军山次数购买",},  
    [193] = {41,3,150,100,"决战定军山次数购买",},  
    [194] = {41,4,200,100,"决战定军山次数购买",},  
    [195] = {42,1,3500,100,"普通命星牌购买价格",},  
    [196] = {42,2,3500,100,"普通命星牌购买价格",},  
    [197] = {43,1,150,50,"高级命星牌购买价格",},  
    [198] = {43,2,300,100,"高级命星牌购买价格",},  
    [199] = {44,1,50,20,"讨伐魔将购买次数",},  
    [200] = {44,2,50,20,"讨伐魔将购买次数",},  
    [201] = {44,3,100,30,"讨伐魔将购买次数",},  
    [202] = {44,4,100,30,"讨伐魔将购买次数",},  
    [203] = {44,5,150,50,"讨伐魔将购买次数",},  
    [204] = {44,6,150,50,"讨伐魔将购买次数",},  
    [205] = {44,7,200,70,"讨伐魔将购买次数",},  
    [206] = {44,8,200,70,"讨伐魔将购买次数",},  
    [207] = {44,9,300,100,"讨伐魔将购买次数",},  
    [208] = {44,10,300,100,"讨伐魔将购买次数",},  
    [209] = {45,1,10,20,"烽火连城购买次数",},  
    [210] = {45,2,20,40,"烽火连城购买次数",},  
    [211] = {45,3,30,60,"烽火连城购买次数",},  
    [212] = {45,4,40,80,"烽火连城购买次数",},  
    [213] = {45,5,50,100,"烽火连城购买次数",},  
    [214] = {46,1,50,100,"学宫论战购买次数",},  
    [215] = {46,2,50,100,"学宫论战购买次数",},  
    [216] = {46,3,50,100,"学宫论战购买次数",},  
    [217] = {46,4,50,100,"学宫论战购买次数",},  
    [218] = {46,5,60,100,"学宫论战购买次数",},  
    [219] = {46,6,70,100,"学宫论战购买次数",},  
    [220] = {46,7,80,100,"学宫论战购买次数",},  
    [221] = {46,8,90,100,"学宫论战购买次数",},  
    [222] = {46,9,100,100,"学宫论战购买次数",},  
    [223] = {46,10,100,100,"学宫论战购买次数",},
    }
}

local __index_id_num = {   
    ["1_1"] = 1,  
    ["1_3"] = 2,  
    ["1_5"] = 3,  
    ["1_7"] = 4,  
    ["1_9"] = 5,  
    ["2_11"] = 6,  
    ["2_13"] = 7,  
    ["2_15"] = 8,  
    ["2_17"] = 9,  
    ["2_19"] = 10,  
    ["3_1"] = 11,  
    ["3_2"] = 12,  
    ["3_3"] = 13,  
    ["3_4"] = 14,  
    ["3_5"] = 15,  
    ["4_1"] = 16,  
    ["4_2"] = 17,  
    ["4_3"] = 18,  
    ["4_4"] = 19,  
    ["5_1"] = 20,  
    ["5_2"] = 21,  
    ["5_3"] = 22,  
    ["5_4"] = 23,  
    ["5_5"] = 24,  
    ["6_1"] = 25,  
    ["6_2"] = 26,  
    ["6_3"] = 27,  
    ["6_4"] = 28,  
    ["6_5"] = 29,  
    ["7_1"] = 30,  
    ["7_2"] = 31,  
    ["7_3"] = 32,  
    ["7_999"] = 33,  
    ["8_1"] = 34,  
    ["8_2"] = 35,  
    ["8_3"] = 36,  
    ["8_4"] = 37,  
    ["8_5"] = 38,  
    ["8_6"] = 39,  
    ["8_7"] = 40,  
    ["8_8"] = 41,  
    ["8_9"] = 42,  
    ["8_10"] = 43,  
    ["8_11"] = 44,  
    ["8_12"] = 45,  
    ["8_13"] = 46,  
    ["8_14"] = 47,  
    ["8_15"] = 48,  
    ["9_1"] = 49,  
    ["9_3"] = 50,  
    ["9_6"] = 51,  
    ["9_9"] = 52,  
    ["10_1"] = 53,  
    ["10_2"] = 54,  
    ["10_3"] = 55,  
    ["10_999"] = 56,  
    ["11_1"] = 57,  
    ["11_2"] = 58,  
    ["11_3"] = 59,  
    ["12_1"] = 60,  
    ["12_2"] = 61,  
    ["12_3"] = 62,  
    ["12_4"] = 63,  
    ["12_5"] = 64,  
    ["12_6"] = 65,  
    ["12_7"] = 66,  
    ["12_8"] = 67,  
    ["12_9"] = 68,  
    ["12_10"] = 69,  
    ["12_11"] = 70,  
    ["12_12"] = 71,  
    ["12_13"] = 72,  
    ["12_14"] = 73,  
    ["12_15"] = 74,  
    ["12_16"] = 75,  
    ["12_999"] = 76,  
    ["13_1"] = 77,  
    ["13_2"] = 78,  
    ["13_3"] = 79,  
    ["13_999"] = 80,  
    ["14_1"] = 81,  
    ["14_2"] = 82,  
    ["14_3"] = 83,  
    ["14_4"] = 84,  
    ["14_5"] = 85,  
    ["14_6"] = 86,  
    ["14_999"] = 87,  
    ["15_1"] = 88,  
    ["15_2"] = 89,  
    ["15_999"] = 90,  
    ["16_1"] = 91,  
    ["16_2"] = 92,  
    ["16_999"] = 93,  
    ["17_1"] = 94,  
    ["17_2"] = 95,  
    ["18_1"] = 96,  
    ["18_2"] = 97,  
    ["19_1"] = 98,  
    ["19_2"] = 99,  
    ["19_3"] = 100,  
    ["20_1"] = 101,  
    ["20_2"] = 102,  
    ["20_3"] = 103,  
    ["21_1"] = 104,  
    ["21_2"] = 105,  
    ["21_3"] = 106,  
    ["22_1"] = 107,  
    ["22_2"] = 108,  
    ["22_3"] = 109,  
    ["23_1"] = 110,  
    ["23_2"] = 111,  
    ["23_999"] = 112,  
    ["24_1"] = 113,  
    ["24_2"] = 114,  
    ["24_999"] = 115,  
    ["25_1"] = 116,  
    ["25_2"] = 117,  
    ["25_999"] = 118,  
    ["26_1"] = 119,  
    ["26_2"] = 120,  
    ["27_1"] = 121,  
    ["27_2"] = 122,  
    ["28_1"] = 123,  
    ["28_2"] = 124,  
    ["28_3"] = 125,  
    ["28_4"] = 126,  
    ["28_5"] = 127,  
    ["28_6"] = 128,  
    ["28_7"] = 129,  
    ["28_8"] = 130,  
    ["28_9"] = 131,  
    ["28_10"] = 132,  
    ["28_11"] = 133,  
    ["28_12"] = 134,  
    ["28_13"] = 135,  
    ["28_14"] = 136,  
    ["28_15"] = 137,  
    ["28_16"] = 138,  
    ["29_1"] = 139,  
    ["29_2"] = 140,  
    ["29_3"] = 141,  
    ["30_1"] = 142,  
    ["30_10"] = 143,  
    ["30_30"] = 144,  
    ["30_100"] = 145,  
    ["31_1"] = 146,  
    ["31_2"] = 147,  
    ["31_3"] = 148,  
    ["32_1"] = 149,  
    ["32_2"] = 150,  
    ["32_3"] = 151,  
    ["33_1"] = 152,  
    ["33_2"] = 153,  
    ["33_3"] = 154,  
    ["34_1"] = 155,  
    ["34_2"] = 156,  
    ["34_3"] = 157,  
    ["34_4"] = 158,  
    ["34_5"] = 159,  
    ["34_999"] = 160,  
    ["35_1"] = 161,  
    ["35_2"] = 162,  
    ["35_3"] = 163,  
    ["35_4"] = 164,  
    ["35_5"] = 165,  
    ["35_6"] = 166,  
    ["35_7"] = 167,  
    ["35_999"] = 168,  
    ["36_1"] = 169,  
    ["36_2"] = 170,  
    ["36_3"] = 171,  
    ["36_4"] = 172,  
    ["36_5"] = 173,  
    ["36_6"] = 174,  
    ["36_7"] = 175,  
    ["36_8"] = 176,  
    ["36_999"] = 177,  
    ["37_1"] = 178,  
    ["37_999"] = 179,  
    ["38_1"] = 180,  
    ["38_2"] = 181,  
    ["38_999"] = 182,  
    ["39_1"] = 183,  
    ["39_2"] = 184,  
    ["40_20"] = 185,  
    ["40_40"] = 186,  
    ["40_60"] = 187,  
    ["40_80"] = 188,  
    ["40_100"] = 189,  
    ["40_200"] = 190,  
    ["41_1"] = 191,  
    ["41_2"] = 192,  
    ["41_3"] = 193,  
    ["41_4"] = 194,  
    ["42_1"] = 195,  
    ["42_2"] = 196,  
    ["43_1"] = 197,  
    ["43_2"] = 198,  
    ["44_1"] = 199,  
    ["44_2"] = 200,  
    ["44_3"] = 201,  
    ["44_4"] = 202,  
    ["44_5"] = 203,  
    ["44_6"] = 204,  
    ["44_7"] = 205,  
    ["44_8"] = 206,  
    ["44_9"] = 207,  
    ["44_10"] = 208,  
    ["45_1"] = 209,  
    ["45_2"] = 210,  
    ["45_3"] = 211,  
    ["45_4"] = 212,  
    ["45_5"] = 213,  
    ["46_1"] = 214,  
    ["46_2"] = 215,  
    ["46_3"] = 216,  
    ["46_4"] = 217,  
    ["46_5"] = 218,  
    ["46_6"] = 219,  
    ["46_7"] = 220,  
    ["46_8"] = 221,  
    ["46_9"] = 222,  
    ["46_10"] = 223,
}

local __key_map = { 
    id = 1,
    num = 2,
    price = 3,
    discount = 4,
    direction = 5,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_buy_price_info")

        return t._raw[__key_map[k]]
    end
}


function buy_price_info.getLength()
    return #buy_price_info._data
end



function buy_price_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_buy_price_info
function buy_price_info.indexOf(index)
    if index == nil or not buy_price_info._data[index] then
        return nil
    end
    return setmetatable({_raw = buy_price_info._data[index]}, m)
end



---
--@return @class record_buy_price_info
function buy_price_info.get(id,num)
    
    local k = id .. '_' .. num
    return buy_price_info.indexOf(__index_id_num[k])
     
end



function buy_price_info.set(id,num, key, value)
    local record = buy_price_info.get(id,num)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function buy_price_info.get_index_data()
    return __index_id_num 
end

return  buy_price_info 