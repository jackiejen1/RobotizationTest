---@classdef record_dead_battle_floor_info
local record_dead_battle_floor_info = {}


record_dead_battle_floor_info.id = 0--id
record_dead_battle_floor_info.type = 0--类型
record_dead_battle_floor_info.stage1 = 0--关卡1
record_dead_battle_floor_info.stage2 = 0--关卡2
record_dead_battle_floor_info.stage3 = 0--关卡3
record_dead_battle_floor_info.win = 0--胜利条件
record_dead_battle_floor_info.buff_group_1 = 0--buff组1
record_dead_battle_floor_info.buff_group_2 = 0--buff组2
record_dead_battle_floor_info.buff_group_3 = 0--buff组3
record_dead_battle_floor_info.award_id_1 = 0--奖励组1id
record_dead_battle_floor_info.award_id_2 = 0--奖励组2id
record_dead_battle_floor_info.award_id_3 = 0--奖励组3id
record_dead_battle_floor_info.success_directions =  ""--过关条件描述
record_dead_battle_floor_info.talk =  ""--气泡内对话
record_dead_battle_floor_info.sucesss_talk =  ""--战斗胜利后描述
record_dead_battle_floor_info.sucesss_result =  ""--战斗胜利后结果
record_dead_battle_floor_info.fail_talk =  ""--战斗失败后描述

local dead_battle_floor_info = {
   _data = {   
    [1] = {1,1,1,2,3,1001,1,2,3,100010,100011,100012,"敌方全灭","无双阁的兵器只能是我的！","敌方全灭","敌方全灭","敌方未被全灭",},  
    [2] = {2,1,4,5,6,1301,4,5,6,100013,100014,100015,"我方总血量高于50%","想到阁上去，先打赢我！","我方总血量高于50%","我方总血量剩余#result#%","我方总血量未高于50%",},  
    [3] = {3,2,7,0,0,1201,1,2,3,100016,100017,100018,"我方死亡不超过2人","这里装备无数，看你有没有本事拿了！","我方死亡不超过2人","我方死亡#result#人","我方死亡超过2人",},  
    [4] = {4,1,8,9,10,1101,1,2,3,100019,100020,100021,"在6回合内获胜","无双阁里无双兵器！","在6回合内获胜","在#result#回合内获胜","未在6回合内获胜",},  
    [5] = {5,1,11,12,13,1202,4,5,6,100022,100023,100024,"我方死亡不超过1人","征战天下没个趁手的兵器怎么行！","我方死亡不超过1人","我方死亡#result#人","我方死亡超过1人",},  
    [6] = {6,2,14,0,0,1302,1,2,3,100025,100026,100027,"我方总血量高于60%","此地是装备重地，速速离去！","我方总血量高于60%","我方总血量剩余#result#%","我方总血量未高于60%",},  
    [7] = {7,1,15,16,17,1102,1,2,3,100028,100029,100030,"在5回合内获胜","无双阁的兵器只能是我的！","在5回合内获胜","在#result#回合内获胜","未在5回合内获胜",},  
    [8] = {8,1,18,19,20,1202,4,5,6,100031,100032,100033,"我方死亡不超过1人","想到阁上去，先打赢我！","我方死亡不超过1人","我方死亡#result#人","我方死亡超过1人",},  
    [9] = {9,2,21,0,0,1303,1,2,3,100034,100035,100036,"我方总血量高于65%","这里装备无数，看你有没有本事拿了！","我方总血量高于65%","我方总血量剩余#result#%","我方总血量未高于65%",},  
    [10] = {10,1,22,23,24,1103,1,2,3,100037,100038,100039,"在4回合内获胜","无双阁里无双兵器！","在4回合内获胜","在#result#回合内获胜","未在4回合内获胜",},  
    [11] = {11,1,25,26,27,1203,4,5,6,100040,100041,100042,"我方全体存活","征战天下没个趁手的兵器怎么行！","我方全体存活","我方全体存活","我方未全体存活",},  
    [12] = {12,2,28,0,0,1103,1,2,3,100043,100044,100045,"在4回合内获胜","此地是装备重地，速速离去！","在4回合内获胜","在#result#回合内获胜","未在4回合内获胜",},  
    [13] = {13,1,29,30,31,1304,1,2,3,100046,100047,100048,"我方总血量高于70%","无双阁的兵器只能是我的！","我方总血量高于70%","我方总血量剩余#result#%","我方总血量未高于70%",},  
    [14] = {14,1,32,33,34,1103,4,5,6,100049,100050,100051,"在4回合内获胜","想到阁上去，先打赢我！","在4回合内获胜","在#result#回合内获胜","未在4回合内获胜",},  
    [15] = {15,2,35,0,0,1203,1,2,3,100052,100053,100054,"我方全体存活","这里装备无数，看你有没有本事拿了！","我方全体存活","我方全体存活","我方未全体存活",},  
    [16] = {16,1,36,37,38,1304,1,2,3,100055,100056,100057,"我方总血量高于70%","无双阁里无双兵器！","我方总血量高于70%","我方总血量剩余#result#%","我方总血量未高于70%",},  
    [17] = {17,1,39,40,41,1103,4,5,6,100058,100059,100060,"在4回合内获胜","征战天下没个趁手的兵器怎么行！","在4回合内获胜","在#result#回合内获胜","未在4回合内获胜",},  
    [18] = {18,2,42,0,0,1304,1,2,3,100061,100062,100063,"我方总血量高于70%","此地是装备重地，速速离去！","我方总血量高于70%","我方总血量剩余#result#%","我方总血量未高于70%",},  
    [19] = {19,1,43,44,45,1203,1,2,3,100064,100065,100066,"我方全体存活","无双阁的兵器只能是我的！","我方全体存活","我方全体存活","我方未全体存活",},  
    [20] = {20,1,46,47,48,1304,4,5,6,100067,100068,100069,"我方总血量高于70%","想到阁上去，先打赢我！","我方总血量高于70%","我方总血量剩余#result#%","我方总血量未高于70%",},  
    [21] = {21,2,49,0,0,1103,1,2,3,100070,100071,100072,"在4回合内获胜","这里装备无数，看你有没有本事拿了！","在4回合内获胜","在#result#回合内获胜","未在4回合内获胜",},  
    [22] = {22,1,50,51,52,1304,1,2,3,100073,100074,100075,"我方总血量高于70%","无双阁里无双兵器！","我方总血量高于70%","我方总血量高于#result#%","我方总血量未高于70%",},  
    [23] = {23,1,53,54,55,1203,4,5,6,100076,100077,100078,"我方全体存活","征战天下没个趁手的兵器怎么行！","我方全体存活","我方全体存活","我方未全体存活",},  
    [24] = {24,2,56,0,0,1103,1,2,3,100079,100080,100081,"在4回合内获胜","此地是装备重地，速速离去！","在4回合内获胜","在#result#回合内获胜","未在4回合内获胜",},  
    [25] = {25,1,57,58,59,1203,1,2,3,100082,100083,100084,"我方全体存活","无双阁的兵器只能是我的！","我方全体存活","我方全体存活","我方未全体存活",},  
    [26] = {26,1,60,61,62,1305,4,5,6,100085,100086,100087,"我方总血量高于75%","想到阁上去，先打赢我！","我方总血量高于75%","我方总血量高于#result#%","我方总血量未高于75%",},  
    [27] = {27,2,63,0,0,1103,1,2,3,100088,100089,100090,"在4回合内获胜","这里装备无数，看你有没有本事拿了！","在4回合内获胜","在#result#回合内获胜","未在4回合内获胜",},  
    [28] = {28,1,64,65,66,1203,1,2,3,100091,100092,100093,"我方全体存活","无双阁里无双兵器！","我方全体存活","我方全体存活","我方未全体存活",},  
    [29] = {29,1,67,68,69,1103,4,5,6,100094,100095,100096,"在4回合内获胜","征战天下没个趁手的兵器怎么行！","在4回合内获胜","在#result#回合内获胜","未在4回合内获胜",},  
    [30] = {30,2,70,0,0,1203,1,2,3,100097,100098,100099,"我方全体存活","此地是装备重地，速速离去！","我方全体存活","我方全体存活","我方未全体存活",},  
    [31] = {31,1,71,72,73,1305,1,2,3,100100,100101,100102,"我方总血量高于75%","无双阁的兵器只能是我的！","我方总血量高于75%","我方总血量高于#result#%","我方总血量未高于75%",},  
    [32] = {32,1,74,75,76,1203,4,5,6,100103,100104,100105,"我方全体存活","想到阁上去，先打赢我！","我方全体存活","我方全体存活","我方未全体存活",},  
    [33] = {33,2,77,0,0,1103,1,2,3,100106,100107,100108,"在4回合内获胜","这里装备无数，看你有没有本事拿了！","在4回合内获胜","在#result#回合内获胜","未在4回合内获胜",},  
    [34] = {34,1,78,79,80,1203,1,2,3,100109,100110,100111,"我方全体存活","无双阁里无双兵器！","我方全体存活","我方全体存活","我方未全体存活",},  
    [35] = {35,1,81,82,83,1305,4,5,6,100112,100113,100114,"我方总血量高于75%","征战天下没个趁手的兵器怎么行！","我方总血量高于75%","我方总血量高于#result#%","我方总血量未高于75%",},  
    [36] = {36,2,84,0,0,1104,1,2,3,100115,100116,100117,"在3回合内获胜","此地是装备重地，速速离去！","在3回合内获胜","在#result#回合内获胜","未在3回合内获胜",},  
    [37] = {37,1,85,86,87,1203,1,2,3,100118,100119,100120,"我方全体存活","无双阁的兵器只能是我的！","我方全体存活","我方全体存活","我方未全体存活",},  
    [38] = {38,1,88,89,90,1305,4,5,6,100121,100122,100123,"我方总血量高于75%","想到阁上去，先打赢我！","我方总血量高于75%","我方总血量高于#result#%","我方总血量未高于75%",},  
    [39] = {39,2,91,0,0,1203,1,2,3,100124,100125,100126,"我方全体存活","这里装备无数，看你有没有本事拿了！","我方全体存活","我方全体存活","我方未全体存活",},  
    [40] = {40,1,92,93,94,1104,1,2,3,100127,100128,100129,"在3回合内获胜","无双阁里无双兵器！","在3回合内获胜","在#result#回合内获胜","未在3回合内获胜",},  
    [41] = {41,1,95,96,97,1305,4,5,6,100130,100131,100132,"我方总血量高于75%","征战天下没个趁手的兵器怎么行！","我方总血量高于75%","我方总血量高于#result#%","我方总血量未高于75%",},  
    [42] = {42,2,98,0,0,1104,1,2,3,100133,100134,100135,"在3回合内获胜","此地是装备重地，速速离去！","在3回合内获胜","在#result#回合内获胜","未在3回合内获胜",},  
    [43] = {43,1,99,100,101,1305,1,2,3,100136,100137,100138,"我方总血量高于75%","无双阁里无双兵器！","我方总血量高于75%","我方总血量高于#result#%","我方总血量未高于75%",},  
    [44] = {44,1,102,103,104,1203,4,5,6,100139,100140,100141,"我方全体存活","征战天下没个趁手的兵器怎么行！","我方全体存活","我方全体存活","我方未全体存活",},  
    [45] = {45,2,105,0,0,1104,1,2,3,100142,100143,100144,"在3回合内获胜","此地是装备重地，速速离去！","在3回合内获胜","在#result#回合内获胜","未在3回合内获胜",},  
    [46] = {46,1,106,107,108,1203,1,2,3,100145,100146,100147,"我方全体存活","无双阁的兵器只能是我的！","我方全体存活","我方全体存活","我方未全体存活",},  
    [47] = {47,1,109,110,111,1306,4,5,6,100148,100149,100150,"我方总血量高于80%","想到阁上去，先打赢我！","我方总血量高于80%","我方总血量高于#result#%","我方总血量未高于80%",},  
    [48] = {48,2,112,0,0,1104,1,2,3,100151,100152,100153,"在3回合内获胜","这里装备无数，看你有没有本事拿了！","在3回合内获胜","在#result#回合内获胜","未在3回合内获胜",},  
    [49] = {49,1,113,114,115,1203,1,2,3,100154,100155,100156,"我方全体存活","无双阁里无双兵器！","我方全体存活","我方全体存活","我方未全体存活",},  
    [50] = {50,1,116,117,118,1104,4,5,6,100157,100158,100159,"在3回合内获胜","征战天下没个趁手的兵器怎么行！","在3回合内获胜","在#result#回合内获胜","未在3回合内获胜",},  
    [51] = {51,2,119,0,0,1203,1,2,3,100160,100161,100162,"我方全体存活","此地是装备重地，速速离去！","我方全体存活","我方全体存活","我方未全体存活",},  
    [52] = {52,1,120,121,122,1306,1,2,3,100163,100164,100165,"我方总血量高于80%","无双阁的兵器只能是我的！","我方总血量高于80%","我方总血量高于#result#%","我方总血量未高于80%",},  
    [53] = {53,1,123,124,125,1203,4,5,6,100166,100167,100168,"我方全体存活","想到阁上去，先打赢我！","我方全体存活","我方全体存活","我方未全体存活",},  
    [54] = {54,2,126,0,0,1104,1,2,3,100169,100170,100171,"在3回合内获胜","这里装备无数，看你有没有本事拿了！","在3回合内获胜","在#result#回合内获胜","未在3回合内获胜",},  
    [55] = {55,1,127,128,129,1203,1,2,3,100172,100173,100174,"我方全体存活","无双阁里无双兵器！","我方全体存活","我方全体存活","我方未全体存活",},  
    [56] = {56,1,130,131,132,1307,4,5,6,100175,100176,100177,"我方总血量高于85%","征战天下没个趁手的兵器怎么行！","我方总血量高于85%","我方总血量高于#result#%","我方总血量未高于85%",},  
    [57] = {57,2,133,0,0,1105,1,2,3,100178,100179,100180,"在2回合内获胜","此地是装备重地，速速离去！","在2回合内获胜","在#result#回合内获胜","未在2回合内获胜",},  
    [58] = {58,1,134,135,136,1203,1,2,3,100181,100182,100183,"我方全体存活","无双阁的兵器只能是我的！","我方全体存活","我方全体存活","我方未全体存活",},  
    [59] = {59,1,137,138,139,1307,4,5,6,100184,100185,100186,"我方总血量高于85%","想到阁上去，先打赢我！","我方总血量高于85%","我方总血量高于#result#%","我方总血量未高于85%",},  
    [60] = {60,2,140,0,0,1203,1,2,3,100187,100188,100189,"我方全体存活","这里装备无数，看你有没有本事拿了！","我方全体存活","我方全体存活","我方未全体存活",},  
    [61] = {61,1,141,142,143,1105,1,2,3,100190,100191,100192,"在2回合内获胜","无双阁里无双兵器！","在2回合内获胜","在#result#回合内获胜","未在2回合内获胜",},  
    [62] = {62,1,144,145,146,1307,4,5,6,100193,100194,100195,"我方总血量高于85%","征战天下没个趁手的兵器怎么行！","我方总血量高于85%","我方总血量高于#result#%","我方总血量未高于85%",},  
    [63] = {63,2,147,0,0,1105,1,2,3,100196,100197,100198,"在2回合内获胜","此地是装备重地，速速离去！","在2回合内获胜","在#result#回合内获胜","未在2回合内获胜",},  
    [64] = {64,1,148,149,150,1307,7,8,9,100199,100200,100201,"我方总血量高于85%","无双阁里无双兵器！","我方总血量高于85%","我方总血量高于#result#%","我方总血量未高于85%",},  
    [65] = {65,1,151,152,153,1203,4,5,6,100202,100203,100204,"我方全体存活","征战天下没个趁手的兵器怎么行！","我方全体存活","我方全体存活","我方未全体存活",},  
    [66] = {66,2,154,0,0,1105,7,8,9,100205,100206,100207,"在2回合内获胜","此地是装备重地，速速离去！","在2回合内获胜","在#result#回合内获胜","未在2回合内获胜",},  
    [67] = {67,1,155,156,157,1203,7,8,9,100208,100209,100210,"我方全体存活","无双阁的兵器只能是我的！","我方全体存活","我方全体存活","我方未全体存活",},  
    [68] = {68,1,158,159,160,1307,4,5,6,100211,100212,100213,"我方总血量高于85%","想到阁上去，先打赢我！","我方总血量高于85%","我方总血量高于#result#%","我方总血量未高于85%",},  
    [69] = {69,2,161,0,0,1105,7,8,9,100214,100215,100216,"在2回合内获胜","这里装备无数，看你有没有本事拿了！","在2回合内获胜","在#result#回合内获胜","未在2回合内获胜",},  
    [70] = {70,1,162,163,164,1203,7,8,9,100217,100218,100219,"我方全体存活","无双阁里无双兵器！","我方全体存活","我方全体存活","我方未全体存活",},  
    [71] = {71,1,165,166,167,1105,4,5,6,100220,100221,100222,"在2回合内获胜","征战天下没个趁手的兵器怎么行！","在2回合内获胜","在#result#回合内获胜","未在2回合内获胜",},  
    [72] = {72,2,168,0,0,1203,7,8,9,100223,100224,100225,"我方全体存活","此地是装备重地，速速离去！","我方全体存活","我方全体存活","我方未全体存活",},  
    [73] = {73,1,169,170,171,1307,7,8,9,100226,100227,100228,"我方总血量高于85%","无双阁的兵器只能是我的！","我方总血量高于85%","我方总血量高于#result#%","我方总血量未高于85%",},  
    [74] = {74,1,172,173,174,1203,4,5,6,100229,100230,100231,"我方全体存活","想到阁上去，先打赢我！","我方全体存活","我方全体存活","我方未全体存活",},  
    [75] = {75,2,175,0,0,1105,7,8,9,100232,100233,100234,"在2回合内获胜","这里装备无数，看你有没有本事拿了！","在2回合内获胜","在#result#回合内获胜","未在2回合内获胜",},  
    [76] = {76,1,176,177,178,1203,7,8,9,100235,100236,100237,"我方全体存活","无双阁里无双兵器！","我方全体存活","我方全体存活","我方未全体存活",},  
    [77] = {77,1,179,180,181,1307,4,5,6,100238,100239,100240,"我方总血量高于85%","征战天下没个趁手的兵器怎么行！","我方总血量高于85%","我方总血量高于#result#%","我方总血量未高于85%",},  
    [78] = {78,2,182,0,0,1105,7,8,9,100241,100242,100243,"在2回合内获胜","此地是装备重地，速速离去！","在2回合内获胜","在#result#回合内获胜","未在2回合内获胜",},  
    [79] = {79,1,183,184,185,1203,7,8,9,100244,100245,100246,"我方全体存活","无双阁的兵器只能是我的！","我方全体存活","我方全体存活","我方未全体存活",},  
    [80] = {80,1,186,187,188,1307,4,5,6,100247,100248,100249,"我方总血量高于85%","想到阁上去，先打赢我！","我方总血量高于85%","我方总血量高于#result#%","我方总血量未高于85%",},  
    [81] = {81,2,189,0,0,1203,7,8,9,100250,100251,100252,"我方全体存活","这里装备无数，看你有没有本事拿了！","我方全体存活","我方全体存活","我方未全体存活",},  
    [82] = {82,1,190,191,192,1105,7,8,9,100253,100254,100255,"在2回合内获胜","无双阁里无双兵器！","在2回合内获胜","在#result#回合内获胜","未在2回合内获胜",},  
    [83] = {83,1,193,194,195,1307,4,5,6,100256,100257,100258,"我方总血量高于85%","征战天下没个趁手的兵器怎么行！","我方总血量高于85%","我方总血量高于#result#%","我方总血量未高于85%",},  
    [84] = {84,2,196,0,0,1105,0,0,0,100259,100260,100261,"在2回合内获胜","此地是装备重地，速速离去！","在2回合内获胜","在#result#回合内获胜","未在2回合内获胜",},
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
}

local __key_map = { 
    id = 1,
    type = 2,
    stage1 = 3,
    stage2 = 4,
    stage3 = 5,
    win = 6,
    buff_group_1 = 7,
    buff_group_2 = 8,
    buff_group_3 = 9,
    award_id_1 = 10,
    award_id_2 = 11,
    award_id_3 = 12,
    success_directions = 13,
    talk = 14,
    sucesss_talk = 15,
    sucesss_result = 16,
    fail_talk = 17,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_dead_battle_floor_info")

        return t._raw[__key_map[k]]
    end
}


function dead_battle_floor_info.getLength()
    return #dead_battle_floor_info._data
end



function dead_battle_floor_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_dead_battle_floor_info
function dead_battle_floor_info.indexOf(index)
    if index == nil or not dead_battle_floor_info._data[index] then
        return nil
    end
    return setmetatable({_raw = dead_battle_floor_info._data[index]}, m)
end



---
--@return @class record_dead_battle_floor_info
function dead_battle_floor_info.get(id)
    
    return dead_battle_floor_info.indexOf(__index_id[ id ])
     
end



function dead_battle_floor_info.set(id, key, value)
    local record = dead_battle_floor_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function dead_battle_floor_info.get_index_data()
    return __index_id 
end

return  dead_battle_floor_info 