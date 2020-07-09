---@classdef record_dungeon_achievement_info
local record_dungeon_achievement_info = {}


record_dungeon_achievement_info.id = 0--id
record_dungeon_achievement_info.next_id = 0--下一阶段id
record_dungeon_achievement_info.pic_type = 0--形象类型
record_dungeon_achievement_info.pic_value = 0--形象类型值
record_dungeon_achievement_info.des =  ""--描述信息
record_dungeon_achievement_info.title_1 =  ""--标题1
record_dungeon_achievement_info.title_2 =  ""--标题2
record_dungeon_achievement_info.icon =  ""--入口icon
record_dungeon_achievement_info.star_start = 0--初始点星数
record_dungeon_achievement_info.star_1 = 0--星数条件1
record_dungeon_achievement_info.type_1 = 0--奖励类型1
record_dungeon_achievement_info.value_1 = 0--奖励类型值1
record_dungeon_achievement_info.size_1 = 0--奖励数量1
record_dungeon_achievement_info.star_2 = 0--星数条件2
record_dungeon_achievement_info.type_2 = 0--奖励类型2
record_dungeon_achievement_info.value_2 = 0--奖励类型值2
record_dungeon_achievement_info.size_2 = 0--奖励数量2
record_dungeon_achievement_info.star_3 = 0--星数条件3
record_dungeon_achievement_info.type_3 = 0--奖励类型3
record_dungeon_achievement_info.value_3 = 0--奖励类型值3
record_dungeon_achievement_info.size_3 = 0--奖励数量3
record_dungeon_achievement_info.star_4 = 0--星数条件4
record_dungeon_achievement_info.type_4 = 0--奖励类型4
record_dungeon_achievement_info.value_4 = 0--奖励类型值4
record_dungeon_achievement_info.size_4 = 0--奖励数量4
record_dungeon_achievement_info.star_5 = 0--星数条件5
record_dungeon_achievement_info.type_5 = 0--奖励类型5
record_dungeon_achievement_info.value_5 = 0--奖励类型值5
record_dungeon_achievement_info.size_5 = 0--奖励数量5
record_dungeon_achievement_info.star_6 = 0--星数条件6
record_dungeon_achievement_info.type_6 = 0--奖励类型6
record_dungeon_achievement_info.value_6 = 0--奖励类型值6
record_dungeon_achievement_info.size_6 = 0--奖励数量6
record_dungeon_achievement_info.unite_token_id = 0--兵符
record_dungeon_achievement_info.knight_id_1 = 0--合击武将1
record_dungeon_achievement_info.knight_id_2 = 0--合击武将2

local dungeon_achievement_info = {
   _data = {   
    [1] = {1,2,1,400120,"（还差&<5>#num#&星，可获得&<5>徐盛&）","zxcj_chengjiang.png","zxcj_xusheng.png","icon_chengjiu_xusheng.png",0,20,2,400120,2,30,2,400120,2,40,2,400120,2,50,2,400120,2,60,2,400120,2,70,2,400120,20,40070,400120,400030,},  
    [2] = {2,3,1,400030,"（还差&<5>#num#&星，可获得&<5>乐进&）","zxcj_chengjiang.png","zxcj_lejin.png","icon_chengjiu_lejin.png",70,75,2,400030,2,80,2,400030,2,90,2,400030,2,100,2,400030,2,110,2,400030,2,120,2,400030,20,40070,400120,400030,},  
    [3] = {3,4,1,200000,"（还差&<5>#num#&星，可获得&<5>高级招将令*5&）","zxcj_zhaojiangling.png","pic_zxcj_zhaojiangling.png","icon_chengjiu_zhaojiangling.png",120,130,3,5,1,150,3,5,1,170,3,5,1,200,3,5,1,230,3,5,1,260,3,6,5,0,0,0,},  
    [4] = {4,5,1,200000,"（还差&<5>#num#&星，可获得&<5>2000元宝&）","zxcj_yuanbao.png","pic_zxcj_yuanbao.png","icon_chengjiu_yuanbao.png",260,290,999,0,50,320,999,0,50,350,999,0,50,380,999,0,50,410,999,0,50,440,999,0,2000,0,0,0,},  
    [5] = {5,6,1,200000,"（还差&<5>#num#&星，可获得&<5>2000元宝&）","zxcj_yuanbao.png","pic_zxcj_yuanbao.png","icon_chengjiu_yuanbao.png",440,470,999,0,50,500,999,0,50,530,999,0,50,560,999,0,50,590,999,0,50,620,999,0,2000,0,0,0,},  
    [6] = {6,7,1,200000,"（还差&<5>#num#&星，可获得&<5>2000元宝&）","zxcj_yuanbao.png","pic_zxcj_yuanbao.png","icon_chengjiu_yuanbao.png",620,650,999,0,50,680,999,0,50,710,999,0,50,740,999,0,50,770,999,0,50,800,999,0,2000,0,0,0,},  
    [7] = {7,8,1,200000,"（还差&<5>#num#&星，可获得&<5>2000元宝&）","zxcj_yuanbao.png","pic_zxcj_yuanbao.png","icon_chengjiu_yuanbao.png",800,830,999,0,50,860,999,0,50,890,999,0,50,920,999,0,50,950,999,0,50,980,999,0,2000,0,0,0,},  
    [8] = {8,9,1,200000,"（还差&<5>#num#&星，可获得&<5>2000元宝&）","zxcj_yuanbao.png","pic_zxcj_yuanbao.png","icon_chengjiu_yuanbao.png",980,1010,999,0,50,1040,999,0,50,1070,999,0,50,1100,999,0,50,1130,999,0,50,1160,999,0,2000,0,0,0,},  
    [9] = {9,10,1,200000,"（还差&<5>#num#&星，可获得&<5>2000元宝&）","zxcj_yuanbao.png","pic_zxcj_yuanbao.png","icon_chengjiu_yuanbao.png",1160,1190,999,0,50,1220,999,0,50,1250,999,0,50,1280,999,0,50,1310,999,0,50,1340,999,0,2000,0,0,0,},  
    [10] = {10,11,1,200000,"（还差&<5>#num#&星，可获得&<5>2000元宝&）","zxcj_yuanbao.png","pic_zxcj_yuanbao.png","icon_chengjiu_yuanbao.png",1340,1370,999,0,50,1400,999,0,50,1430,999,0,50,1460,999,0,50,1490,999,0,50,1520,999,0,2000,0,0,0,},  
    [11] = {11,12,1,200000,"（还差&<5>#num#&星，可获得&<5>2000元宝&）","zxcj_yuanbao.png","pic_zxcj_yuanbao.png","icon_chengjiu_yuanbao.png",1520,1550,999,0,50,1580,999,0,50,1610,999,0,50,1640,999,0,50,1670,999,0,50,1700,999,0,2000,0,0,0,},  
    [12] = {12,13,1,200000,"（还差&<5>#num#&星，可获得&<5>2000元宝&）","zxcj_yuanbao.png","pic_zxcj_yuanbao.png","icon_chengjiu_yuanbao.png",1700,1730,999,0,50,1760,999,0,50,1790,999,0,50,1820,999,0,50,1850,999,0,50,1880,999,0,2000,0,0,0,},  
    [13] = {13,14,1,200000,"（还差&<5>#num#&星，可获得&<5>2000元宝&）","zxcj_yuanbao.png","pic_zxcj_yuanbao.png","icon_chengjiu_yuanbao.png",1880,1910,999,0,50,1940,999,0,50,1970,999,0,50,2000,999,0,50,2030,999,0,50,2060,999,0,2000,0,0,0,},  
    [14] = {14,15,1,200000,"（还差&<5>#num#&星，可获得&<5>2000元宝&）","zxcj_yuanbao.png","pic_zxcj_yuanbao.png","icon_chengjiu_yuanbao.png",2060,2090,999,0,50,2120,999,0,50,2150,999,0,50,2180,999,0,50,2210,999,0,50,2240,999,0,2000,0,0,0,},  
    [15] = {15,16,1,200000,"（还差&<5>#num#&星，可获得&<5>2000元宝&）","zxcj_yuanbao.png","pic_zxcj_yuanbao.png","icon_chengjiu_yuanbao.png",2240,2270,999,0,50,2300,999,0,50,2330,999,0,50,2360,999,0,50,2390,999,0,50,2420,999,0,2000,0,0,0,},  
    [16] = {16,17,1,200000,"（还差&<5>#num#&星，可获得&<5>2000元宝&）","zxcj_yuanbao.png","pic_zxcj_yuanbao.png","icon_chengjiu_yuanbao.png",2420,2450,999,0,50,2480,999,0,50,2510,999,0,50,2540,999,0,50,2570,999,0,50,2600,999,0,2000,0,0,0,},  
    [17] = {17,18,1,200000,"（还差&<5>#num#&星，可获得&<5>2000元宝&）","zxcj_yuanbao.png","pic_zxcj_yuanbao.png","icon_chengjiu_yuanbao.png",2600,2630,999,0,50,2660,999,0,50,2690,999,0,50,2720,999,0,50,2750,999,0,50,2780,999,0,2000,0,0,0,},  
    [18] = {18,19,1,200000,"（还差&<5>#num#&星，可获得&<5>2000元宝&）","zxcj_yuanbao.png","pic_zxcj_yuanbao.png","icon_chengjiu_yuanbao.png",2780,2810,999,0,50,2840,999,0,50,2870,999,0,50,2900,999,0,50,2930,999,0,50,2960,999,0,2000,0,0,0,},  
    [19] = {19,20,1,200000,"（还差&<5>#num#&星，可获得&<5>2000元宝&）","zxcj_yuanbao.png","pic_zxcj_yuanbao.png","icon_chengjiu_yuanbao.png",2960,2990,999,0,50,3020,999,0,50,3050,999,0,50,3080,999,0,50,3110,999,0,50,3140,999,0,2000,0,0,0,},  
    [20] = {20,21,1,200000,"（还差&<5>#num#&星，可获得&<5>2000元宝&）","zxcj_yuanbao.png","pic_zxcj_yuanbao.png","icon_chengjiu_yuanbao.png",3140,3170,999,0,50,3200,999,0,50,3230,999,0,50,3260,999,0,50,3290,999,0,50,3320,999,0,2000,0,0,0,},  
    [21] = {21,22,1,200000,"（还差&<5>#num#&星，可获得&<5>2000元宝&）","zxcj_yuanbao.png","pic_zxcj_yuanbao.png","icon_chengjiu_yuanbao.png",3320,3350,999,0,50,3380,999,0,50,3410,999,0,50,3440,999,0,50,3470,999,0,50,3500,999,0,2000,0,0,0,},  
    [22] = {22,23,1,200000,"（还差&<5>#num#&星，可获得&<5>2000元宝&）","zxcj_yuanbao.png","pic_zxcj_yuanbao.png","icon_chengjiu_yuanbao.png",3500,3530,999,0,50,3560,999,0,50,3590,999,0,50,3620,999,0,50,3650,999,0,50,3680,999,0,2000,0,0,0,},  
    [23] = {23,24,1,200000,"（还差&<5>#num#&星，可获得&<5>2000元宝&）","zxcj_yuanbao.png","pic_zxcj_yuanbao.png","icon_chengjiu_yuanbao.png",3680,3710,999,0,50,3740,999,0,50,3770,999,0,50,3800,999,0,50,3830,999,0,50,3860,999,0,2000,0,0,0,},  
    [24] = {24,25,1,200000,"（还差&<5>#num#&星，可获得&<5>2000元宝&）","zxcj_yuanbao.png","pic_zxcj_yuanbao.png","icon_chengjiu_yuanbao.png",3860,3890,999,0,50,3920,999,0,50,3950,999,0,50,3980,999,0,50,4010,999,0,50,4040,999,0,2000,0,0,0,},  
    [25] = {25,26,1,200000,"（还差&<5>#num#&星，可获得&<5>2000元宝&）","zxcj_yuanbao.png","pic_zxcj_yuanbao.png","icon_chengjiu_yuanbao.png",4040,4070,999,0,50,4100,999,0,50,4130,999,0,50,4160,999,0,50,4190,999,0,50,4220,999,0,2000,0,0,0,},  
    [26] = {26,27,1,200000,"（还差&<5>#num#&星，可获得&<5>2000元宝&）","zxcj_yuanbao.png","pic_zxcj_yuanbao.png","icon_chengjiu_yuanbao.png",4220,4250,999,0,50,4280,999,0,50,4310,999,0,50,4340,999,0,50,4370,999,0,50,4400,999,0,2000,0,0,0,},  
    [27] = {27,28,1,200000,"（还差&<5>#num#&星，可获得&<5>2000元宝&）","zxcj_yuanbao.png","pic_zxcj_yuanbao.png","icon_chengjiu_yuanbao.png",4400,4430,999,0,50,4460,999,0,50,4490,999,0,50,4520,999,0,50,4550,999,0,50,4580,999,0,2000,0,0,0,},  
    [28] = {28,29,1,200000,"（还差&<5>#num#&星，可获得&<5>2000元宝&）","zxcj_yuanbao.png","pic_zxcj_yuanbao.png","icon_chengjiu_yuanbao.png",4580,4610,999,0,50,4640,999,0,50,4670,999,0,50,4700,999,0,50,4730,999,0,50,4760,999,0,2000,0,0,0,},  
    [29] = {29,30,1,200000,"（还差&<5>#num#&星，可获得&<5>2000元宝&）","zxcj_yuanbao.png","pic_zxcj_yuanbao.png","icon_chengjiu_yuanbao.png",4760,4790,999,0,50,4820,999,0,50,4850,999,0,50,4880,999,0,50,4910,999,0,50,4940,999,0,2000,0,0,0,},  
    [30] = {30,31,1,200000,"（还差&<5>#num#&星，可获得&<5>2000元宝&）","zxcj_yuanbao.png","pic_zxcj_yuanbao.png","icon_chengjiu_yuanbao.png",4940,4970,999,0,50,5000,999,0,50,5030,999,0,50,5060,999,0,50,5090,999,0,50,5120,999,0,2000,0,0,0,},  
    [31] = {31,32,1,200000,"（还差&<5>#num#&星，可获得&<5>2000元宝&）","zxcj_yuanbao.png","pic_zxcj_yuanbao.png","icon_chengjiu_yuanbao.png",5120,5150,999,0,50,5180,999,0,50,5210,999,0,50,5240,999,0,50,5270,999,0,50,5300,999,0,2000,0,0,0,},  
    [32] = {32,33,1,200000,"（还差&<5>#num#&星，可获得&<5>2000元宝&）","zxcj_yuanbao.png","pic_zxcj_yuanbao.png","icon_chengjiu_yuanbao.png",5300,5330,999,0,50,5360,999,0,50,5390,999,0,50,5420,999,0,50,5450,999,0,50,5480,999,0,2000,0,0,0,},  
    [33] = {33,34,1,200000,"（还差&<5>#num#&星，可获得&<5>2000元宝&）","zxcj_yuanbao.png","pic_zxcj_yuanbao.png","icon_chengjiu_yuanbao.png",5480,5510,999,0,50,5540,999,0,50,5570,999,0,50,5600,999,0,50,5630,999,0,50,5660,999,0,2000,0,0,0,},  
    [34] = {34,35,1,200000,"（还差&<5>#num#&星，可获得&<5>2000元宝&）","zxcj_yuanbao.png","pic_zxcj_yuanbao.png","icon_chengjiu_yuanbao.png",5660,5690,999,0,50,5720,999,0,50,5750,999,0,50,5780,999,0,50,5810,999,0,50,5840,999,0,2000,0,0,0,},  
    [35] = {35,36,1,200000,"（还差&<5>#num#&星，可获得&<5>2000元宝&）","zxcj_yuanbao.png","pic_zxcj_yuanbao.png","icon_chengjiu_yuanbao.png",5840,5870,999,0,50,5900,999,0,50,5930,999,0,50,5960,999,0,50,5990,999,0,50,6020,999,0,2000,0,0,0,},  
    [36] = {36,37,1,200000,"（还差&<5>#num#&星，可获得&<5>2000元宝&）","zxcj_yuanbao.png","pic_zxcj_yuanbao.png","icon_chengjiu_yuanbao.png",6020,6050,999,0,50,6080,999,0,50,6110,999,0,50,6140,999,0,50,6170,999,0,50,6200,999,0,2000,0,0,0,},  
    [37] = {37,38,1,200000,"（还差&<5>#num#&星，可获得&<5>2000元宝&）","zxcj_yuanbao.png","pic_zxcj_yuanbao.png","icon_chengjiu_yuanbao.png",6200,6230,999,0,50,6260,999,0,50,6290,999,0,50,6320,999,0,50,6350,999,0,50,6380,999,0,2000,0,0,0,},  
    [38] = {38,39,1,200000,"（还差&<5>#num#&星，可获得&<5>2000元宝&）","zxcj_yuanbao.png","pic_zxcj_yuanbao.png","icon_chengjiu_yuanbao.png",6380,6410,999,0,50,6440,999,0,50,6470,999,0,50,6500,999,0,50,6530,999,0,50,6560,999,0,2000,0,0,0,},  
    [39] = {39,40,1,200000,"（还差&<5>#num#&星，可获得&<5>2000元宝&）","zxcj_yuanbao.png","pic_zxcj_yuanbao.png","icon_chengjiu_yuanbao.png",6560,6590,999,0,50,6620,999,0,50,6650,999,0,50,6680,999,0,50,6710,999,0,50,6740,999,0,2000,0,0,0,},  
    [40] = {40,41,1,200000,"（还差&<5>#num#&星，可获得&<5>2000元宝&）","zxcj_yuanbao.png","pic_zxcj_yuanbao.png","icon_chengjiu_yuanbao.png",6740,6770,999,0,50,6800,999,0,50,6830,999,0,50,6860,999,0,50,6890,999,0,50,6920,999,0,2000,0,0,0,},  
    [41] = {41,42,1,200000,"（还差&<5>#num#&星，可获得&<5>2000元宝&）","zxcj_yuanbao.png","pic_zxcj_yuanbao.png","icon_chengjiu_yuanbao.png",6920,6950,999,0,50,6980,999,0,50,7010,999,0,50,7040,999,0,50,7070,999,0,50,7100,999,0,2000,0,0,0,},  
    [42] = {42,43,1,200000,"（还差&<5>#num#&星，可获得&<5>2000元宝&）","zxcj_yuanbao.png","pic_zxcj_yuanbao.png","icon_chengjiu_yuanbao.png",7100,7130,999,0,50,7160,999,0,50,7190,999,0,50,7220,999,0,50,7250,999,0,50,7280,999,0,2000,0,0,0,},  
    [43] = {43,44,1,200000,"（还差&<5>#num#&星，可获得&<5>2000元宝&）","zxcj_yuanbao.png","pic_zxcj_yuanbao.png","icon_chengjiu_yuanbao.png",7280,7310,999,0,50,7340,999,0,50,7370,999,0,50,7400,999,0,50,7430,999,0,50,7460,999,0,2000,0,0,0,},  
    [44] = {44,45,1,200000,"（还差&<5>#num#&星，可获得&<5>2000元宝&）","zxcj_yuanbao.png","pic_zxcj_yuanbao.png","icon_chengjiu_yuanbao.png",7460,7490,999,0,50,7520,999,0,50,7550,999,0,50,7580,999,0,50,7610,999,0,50,7640,999,0,2000,0,0,0,},  
    [45] = {45,46,1,200000,"（还差&<5>#num#&星，可获得&<5>2000元宝&）","zxcj_yuanbao.png","pic_zxcj_yuanbao.png","icon_chengjiu_yuanbao.png",7640,7670,999,0,50,7700,999,0,50,7730,999,0,50,7760,999,0,50,7790,999,0,50,7820,999,0,2000,0,0,0,},  
    [46] = {46,47,1,200000,"（还差&<5>#num#&星，可获得&<5>2000元宝&）","zxcj_yuanbao.png","pic_zxcj_yuanbao.png","icon_chengjiu_yuanbao.png",7820,7850,999,0,50,7880,999,0,50,7910,999,0,50,7940,999,0,50,7970,999,0,50,8000,999,0,2000,0,0,0,},  
    [47] = {47,48,1,200000,"（还差&<5>#num#&星，可获得&<5>2000元宝&）","zxcj_yuanbao.png","pic_zxcj_yuanbao.png","icon_chengjiu_yuanbao.png",8000,8030,999,0,50,8060,999,0,50,8090,999,0,50,8120,999,0,50,8150,999,0,50,8180,999,0,2000,0,0,0,},  
    [48] = {48,49,1,200000,"（还差&<5>#num#&星，可获得&<5>2000元宝&）","zxcj_yuanbao.png","pic_zxcj_yuanbao.png","icon_chengjiu_yuanbao.png",8180,8210,999,0,50,8240,999,0,50,8270,999,0,50,8300,999,0,50,8330,999,0,50,8360,999,0,2000,0,0,0,},  
    [49] = {49,50,1,200000,"（还差&<5>#num#&星，可获得&<5>2000元宝&）","zxcj_yuanbao.png","pic_zxcj_yuanbao.png","icon_chengjiu_yuanbao.png",8360,8390,999,0,50,8420,999,0,50,8450,999,0,50,8480,999,0,50,8510,999,0,50,8540,999,0,2000,0,0,0,},  
    [50] = {50,51,1,200000,"（还差&<5>#num#&星，可获得&<5>2000元宝&）","zxcj_yuanbao.png","pic_zxcj_yuanbao.png","icon_chengjiu_yuanbao.png",8540,8570,999,0,50,8600,999,0,50,8630,999,0,50,8660,999,0,50,8690,999,0,50,8720,999,0,2000,0,0,0,},  
    [51] = {51,52,1,200000,"（还差&<5>#num#&星，可获得&<5>2000元宝&）","zxcj_yuanbao.png","pic_zxcj_yuanbao.png","icon_chengjiu_yuanbao.png",8720,8750,999,0,50,8780,999,0,50,8810,999,0,50,8840,999,0,50,8870,999,0,50,8900,999,0,2000,0,0,0,},  
    [52] = {52,0,1,200000,"（还差&<5>#num#&星，可获得&<5>2000元宝&）","zxcj_yuanbao.png","pic_zxcj_yuanbao.png","icon_chengjiu_yuanbao.png",8900,8930,999,0,50,8960,999,0,50,8990,999,0,50,9020,999,0,50,9050,999,0,50,9080,999,0,2000,0,0,0,},
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
}

local __key_map = { 
    id = 1,
    next_id = 2,
    pic_type = 3,
    pic_value = 4,
    des = 5,
    title_1 = 6,
    title_2 = 7,
    icon = 8,
    star_start = 9,
    star_1 = 10,
    type_1 = 11,
    value_1 = 12,
    size_1 = 13,
    star_2 = 14,
    type_2 = 15,
    value_2 = 16,
    size_2 = 17,
    star_3 = 18,
    type_3 = 19,
    value_3 = 20,
    size_3 = 21,
    star_4 = 22,
    type_4 = 23,
    value_4 = 24,
    size_4 = 25,
    star_5 = 26,
    type_5 = 27,
    value_5 = 28,
    size_5 = 29,
    star_6 = 30,
    type_6 = 31,
    value_6 = 32,
    size_6 = 33,
    unite_token_id = 34,
    knight_id_1 = 35,
    knight_id_2 = 36,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_dungeon_achievement_info")

        return t._raw[__key_map[k]]
    end
}


function dungeon_achievement_info.getLength()
    return #dungeon_achievement_info._data
end



function dungeon_achievement_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_dungeon_achievement_info
function dungeon_achievement_info.indexOf(index)
    if index == nil or not dungeon_achievement_info._data[index] then
        return nil
    end
    return setmetatable({_raw = dungeon_achievement_info._data[index]}, m)
end



---
--@return @class record_dungeon_achievement_info
function dungeon_achievement_info.get(id)
    
    return dungeon_achievement_info.indexOf(__index_id[ id ])
     
end



function dungeon_achievement_info.set(id, key, value)
    local record = dungeon_achievement_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function dungeon_achievement_info.get_index_data()
    return __index_id 
end

return  dungeon_achievement_info 