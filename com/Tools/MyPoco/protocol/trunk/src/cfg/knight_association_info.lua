---@classdef record_knight_association_info
local record_knight_association_info = {}


record_knight_association_info.id = 0--组合编号
record_knight_association_info.name =  ""--组合名称
record_knight_association_info.type = 0--关联组合类型
record_knight_association_info.value_1 = 0--类型值1
record_knight_association_info.value_2 = 0--类型值2
record_knight_association_info.value_3 = 0--类型值3
record_knight_association_info.value_4 = 0--类型值4
record_knight_association_info.value_5 = 0--类型值5
record_knight_association_info.affect_type_1 = 0--加成属性1
record_knight_association_info.affect_value_1 = 0--加成类型值
record_knight_association_info.affect_type_2 = 0--加成属性2
record_knight_association_info.affect_value_2 = 0--加成类型值2
record_knight_association_info.directions =  ""--描述

local knight_association_info = {
   _data = {   
    [1] = {1,"奇谋鬼才",1,510070,0,0,0,0,11,300,0,0,"与贾诩一起上阵，生命提高30%",},  
    [2] = {2,"壮志未酬",1,500070,0,0,0,0,11,250,0,0,"与庞统一起上阵，生命提高25%",},  
    [3] = {3,"开国元勋",1,500020,500040,0,0,0,12,150,11,150,"与张辽、夏侯惇一起上阵，攻击提高15%，生命提高15%",},  
    [4] = {4,"忠心侍魏",1,510020,0,0,0,0,12,300,0,0,"与典韦一起上阵，攻击提高30%",},  
    [5] = {5,"悍勇杀将",1,510020,0,0,0,0,12,300,0,0,"与典韦一起上阵，攻击提高30%",},  
    [6] = {6,"枪法超群",1,510040,500120,0,0,0,12,150,11,150,"与赵云、姜维一起上阵，攻击提高15%，生命提高15%",},  
    [7] = {7,"桀骜不驯",1,500100,0,0,0,0,12,250,0,0,"与魏延一起上阵，攻击提高25%",},  
    [8] = {8,"归附明主",1,510030,0,0,0,0,11,300,0,0,"与刘备一起上阵，生命提高30%",},  
    [9] = {9,"火烧连营",1,510030,0,0,0,0,11,300,0,0,"与刘备一起上阵，生命提高30%",},  
    [10] = {10,"东吴支柱",1,500160,500180,0,0,0,12,150,11,150,"与吕蒙、鲁肃一起上阵，攻击提高15%，生命提高15%",},  
    [11] = {11,"社稷之臣",1,500140,0,0,0,0,11,250,0,0,"与孙权一起上阵，生命提高25%",},  
    [12] = {12,"血浓于水",1,510060,0,0,0,0,12,300,0,0,"与小乔一起上阵，攻击提高30%",},  
    [13] = {13,"国色天香",1,510060,0,0,0,0,12,300,0,0,"与小乔一起上阵，攻击提高30%",},  
    [14] = {14,"洛神蔽月",1,500010,0,0,0,0,11,250,0,0,"与甄姬一起上阵，生命提高25%",},  
    [15] = {15,"枭雄美人",1,500200,500230,0,0,0,12,150,11,150,"与袁绍、董卓一起上阵，攻击提高15%，生命提高15%",},  
    [16] = {16,"美人毒计",1,510070,0,0,0,0,12,300,0,0,"与贾诩一起上阵，攻击提高30%",},  
    [17] = {17,"悍勇杀将",1,500110,0,0,0,0,12,300,0,0,"与马超一起上阵，攻击提高30%",},  
    [18] = {18,"虎卫双煞",1,500030,0,0,0,0,11,250,0,0,"与许褚一起上阵，生命提高25%",},  
    [19] = {19,"忠心侍魏",1,510010,0,0,0,0,12,300,0,0,"与郭嘉一起上阵，攻击提高30%",},  
    [20] = {20,"虎贲猛将",1,500060,0,0,0,0,11,250,0,0,"与张郃一起上阵，生命提高25%",},  
    [21] = {21,"火烧连营",1,510050,0,0,0,0,11,300,0,0,"与陆逊一起上阵，生命提高30%",},  
    [22] = {22,"义结金兰",1,500080,0,0,0,0,12,250,0,0,"与张飞一起上阵，攻击提高25%",},  
    [23] = {23,"归附明主",1,500110,0,0,0,0,11,300,0,0,"与马超一起上阵，生命提高30%",},  
    [24] = {24,"君臣相得",1,500090,0,0,0,0,12,250,0,0,"与黄忠一起上阵，攻击提高25%",},  
    [25] = {25,"国色天香",1,510080,0,0,0,0,12,300,0,0,"与貂蝉一起上阵，攻击提高30%",},  
    [26] = {26,"铜雀双娇",1,500130,0,0,0,0,11,250,0,0,"与大乔一起上阵，生命提高25%",},  
    [27] = {27,"血浓于水",1,510050,0,0,0,0,12,300,0,0,"与陆逊一起上阵，攻击提高30%",},  
    [28] = {28,"桃花箭雨",1,500170,0,0,0,0,11,250,0,0,"与太史慈一起上阵，生命提高25%",},  
    [29] = {29,"奇谋鬼才",1,510010,0,0,0,0,11,300,0,0,"与郭嘉一起上阵，生命提高30%",},  
    [30] = {30,"妖术惑世",1,500210,0,0,0,0,12,250,0,0,"与于吉一起上阵，攻击提高25%",},  
    [31] = {31,"美人毒计",1,510080,0,0,0,0,12,300,0,0,"与貂蝉一起上阵，攻击提高30%",},  
    [32] = {32,"毒士名医",1,500190,0,0,0,0,11,250,0,0,"与华佗一起上阵，生命提高25%",},  
    [33] = {33,"良禽择木",1,500060,0,0,0,0,12,200,0,0,"与张郃一起上阵，攻击提高20%",},  
    [34] = {34,"开国元勋",1,510010,500040,0,0,0,12,150,11,150,"与郭嘉、夏侯惇一起上阵，攻击提高15%，生命提高15%",},  
    [35] = {35,"合围东海",1,400030,0,0,0,0,12,200,0,0,"与乐进一起上阵，攻击提高20%",},  
    [36] = {36,"棋逢对手",1,500160,0,0,0,0,11,200,0,0,"与吕蒙一起上阵，生命提高20%",},  
    [37] = {37,"夏侯双雄",1,500050,0,0,0,0,12,200,0,0,"与夏侯渊一起上阵，攻击提高20%",},  
    [38] = {38,"开国元勋",1,510010,500020,0,0,0,12,150,11,150,"与郭嘉、张辽一起上阵，攻击提高15%，生命提高15%",},  
    [39] = {39,"奋不顾身",1,500030,0,0,0,0,11,200,0,0,"与许褚一起上阵，生命提高20%",},  
    [40] = {40,"勇猛悍将",1,500080,0,0,0,0,12,200,0,0,"与张飞一起上阵，攻击提高20%",},  
    [41] = {41,"义结金兰",1,510030,0,0,0,0,12,200,0,0,"与刘备一起上阵，攻击提高20%",},  
    [42] = {42,"横冲直撞",1,400060,0,0,0,0,11,200,0,0,"与孟获一起上阵，生命提高20%",},  
    [43] = {43,"勇猛悍将",1,500040,0,0,0,0,12,200,0,0,"与夏侯惇一起上阵，攻击提高20%",},  
    [44] = {44,"狂战天下",1,500090,0,0,0,0,11,200,0,0,"与黄忠一起上阵，生命提高20%",},  
    [45] = {45,"枪法超群",1,500110,500120,0,0,0,12,150,11,150,"与马超、姜维一起上阵，攻击提高15%，生命提高15%",},  
    [46] = {46,"白马银枪",1,500240,0,0,0,0,12,200,0,0,"与公孙瓒一起上阵，攻击提高20%",},  
    [47] = {47,"勇冠千军",1,500090,0,0,0,0,12,200,0,0,"与黄忠一起上阵，攻击提高20%",},  
    [48] = {48,"听命行事",1,500070,0,0,0,0,11,200,0,0,"与庞统一起上阵，生命提高20%",},  
    [49] = {49,"霸王血脉",1,500150,0,0,0,0,12,200,0,0,"与孙坚一起上阵，攻击提高20%",},  
    [50] = {50,"社稷之臣",1,510050,0,0,0,0,11,200,0,0,"与陆逊一起上阵，生命提高20%",},  
    [51] = {51,"三代忠臣",1,400110,0,0,0,0,11,200,0,0,"与黄盖一起上阵，生命提高20%",},  
    [52] = {52,"刮目相看",1,500160,0,0,0,0,12,200,0,0,"与吕蒙一起上阵，攻击提高20%",},  
    [53] = {53,"东吴栋梁",1,510050,500180,0,0,0,12,150,11,150,"与陆逊、鲁肃一起上阵，攻击提高15%，生命提高15%",},  
    [54] = {54,"凌云之志",1,500170,0,0,0,0,12,200,0,0,"与太史慈一起上阵，攻击提高20%",},  
    [55] = {55,"棋逢对手",1,500020,0,0,0,0,11,200,0,0,"与张辽一起上阵，生命提高20%",},  
    [56] = {56,"刮目相看",1,500140,0,0,0,0,12,200,0,0,"与孙权一起上阵，攻击提高20%",},  
    [57] = {57,"乱世枭雄",1,500240,0,0,0,0,12,200,0,0,"与公孙瓒一起上阵，攻击提高20%",},  
    [58] = {58,"枭雄美人",1,510080,500230,0,0,0,12,150,11,150,"与貂蝉、董卓一起上阵，攻击提高15%，生命提高15%",},  
    [59] = {59,"巧谋无用",1,400140,0,0,0,0,11,200,0,0,"与颜良一起上阵，生命提高20%",},  
    [60] = {60,"酸枣会盟",1,500150,0,0,0,0,11,200,0,0,"与孙坚一起上阵，生命提高20%",},  
    [61] = {61,"妖术惑世",1,510070,0,0,0,0,12,200,0,0,"与贾诩一起上阵，攻击提高20%",},  
    [62] = {62,"医道同归",1,500190,0,0,0,0,11,200,0,0,"与华佗一起上阵，生命提高20%",},  
    [63] = {63,"巧计不言",1,400050,0,0,0,0,11,200,0,0,"与步练师一起上阵，生命提高20%",},  
    [64] = {64,"言出法随",1,400080,0,0,0,0,12,200,0,0,"与法正一起上阵，攻击提高20%",},  
    [65] = {65,"洛神蔽月",1,510080,0,0,0,0,11,200,0,0,"与貂蝉一起上阵，生命提高20%",},  
    [66] = {66,"亲如姐妹",1,400130,0,0,0,0,11,200,0,0,"与孙尚香一起上阵，生命提高20%",},  
    [67] = {67,"美人如画",1,500130,0,0,0,0,12,200,0,0,"与大乔一起上阵，攻击提高20%",},  
    [68] = {68,"一见倾心",1,400020,0,0,0,0,12,200,0,0,"与曹丕一起上阵，攻击提高20%",},  
    [69] = {69,"虎卫双煞",1,510020,0,0,0,0,11,200,0,0,"与典韦一起上阵，生命提高20%",},  
    [70] = {70,"奋不顾身",1,500040,0,0,0,0,11,200,0,0,"与夏侯惇一起上阵，生命提高20%",},  
    [71] = {71,"曹魏忠臣",1,500050,0,0,0,0,12,200,0,0,"与夏侯渊一起上阵，攻击提高20%",},  
    [72] = {72,"加官进爵",1,400020,0,0,0,0,12,200,0,0,"与曹丕一起上阵，攻击提高20%",},  
    [73] = {73,"夏侯双雄",1,500040,0,0,0,0,12,200,0,0,"与夏侯惇一起上阵，攻击提高20%",},  
    [74] = {74,"曹魏忠臣",1,500030,0,0,0,0,12,200,0,0,"与许褚一起上阵，攻击提高20%",},  
    [75] = {75,"坚守汉中",1,500060,0,0,0,0,11,200,0,0,"与张郃一起上阵，生命提高20%",},  
    [76] = {76,"并肩奋战",1,400010,0,0,0,0,11,200,0,0,"与于禁一起上阵，生命提高20%",},  
    [77] = {77,"良禽择木",1,500020,0,0,0,0,12,200,0,0,"与张辽一起上阵，攻击提高20%",},  
    [78] = {78,"虎贲猛将",1,510020,0,0,0,0,11,200,0,0,"与典韦一起上阵，生命提高20%",},  
    [79] = {79,"曹魏良将",1,400010,0,0,0,0,12,200,0,0,"与于禁一起上阵，攻击提高20%",},  
    [80] = {80,"坚守汉中",1,500050,0,0,0,0,11,200,0,0,"与夏侯渊一起上阵，生命提高20%",},  
    [81] = {81,"壮志未酬",1,510010,0,0,0,0,11,200,0,0,"与郭嘉一起上阵，生命提高20%",},  
    [82] = {82,"不可貌相",1,400050,0,0,0,0,12,200,0,0,"与步练师一起上阵，攻击提高20%",},  
    [83] = {83,"听命行事",1,510040,0,0,0,0,11,200,0,0,"与赵云一起上阵，生命提高20%",},  
    [84] = {84,"天命不在",1,500100,0,0,0,0,12,200,0,0,"与魏延一起上阵，攻击提高20%",},  
    [85] = {85,"长沙名将",1,500090,0,0,0,0,11,200,0,0,"与黄忠一起上阵，生命提高20%",},  
    [86] = {86,"桀骜不驯",1,500110,0,0,0,0,12,200,0,0,"与马超一起上阵，攻击提高20%",},  
    [87] = {87,"忠臣逆臣",1,500120,0,0,0,0,11,200,0,0,"与姜维一起上阵，生命提高20%",},  
    [88] = {88,"不可貌相",1,500070,0,0,0,0,12,200,0,0,"与庞统一起上阵，攻击提高20%",},  
    [89] = {89,"长沙名将",1,500100,0,0,0,0,11,200,0,0,"与魏延一起上阵，生命提高20%",},  
    [90] = {90,"君臣相得",1,510030,0,0,0,0,12,200,0,0,"与刘备一起上阵，攻击提高20%",},  
    [91] = {91,"狂战天下",1,500080,0,0,0,0,11,200,0,0,"与张飞一起上阵，生命提高20%",},  
    [92] = {92,"勇冠千军",1,510040,0,0,0,0,12,200,0,0,"与赵云一起上阵，攻击提高20%",},  
    [93] = {93,"蜀汉谋主",1,400080,0,0,0,0,12,200,0,0,"与法正一起上阵，攻击提高20%",},  
    [94] = {94,"枪法超群",1,500110,510040,0,0,0,12,150,11,150,"与马超、赵云一起上阵，攻击提高15%，生命提高15%",},  
    [95] = {95,"忠臣逆臣",1,500100,0,0,0,0,11,200,0,0,"与魏延一起上阵，生命提高20%",},  
    [96] = {96,"有胆有谋",1,400060,0,0,0,0,11,200,0,0,"与孟获一起上阵，生命提高20%",},  
    [97] = {97,"铜雀双娇",1,510060,0,0,0,0,11,200,0,0,"与小乔一起上阵，生命提高20%",},  
    [98] = {98,"野性知性",1,400070,0,0,0,0,11,200,0,0,"与祝融一起上阵，生命提高20%",},  
    [99] = {99,"美人如画",1,500010,0,0,0,0,12,200,0,0,"与甄姬一起上阵，攻击提高20%",},  
    [100] = {100,"孙氏美媳",1,500150,0,0,0,0,12,200,0,0,"与孙坚一起上阵，攻击提高20%",},  
    [101] = {101,"霸王血脉",1,500140,0,0,0,0,12,200,0,0,"与孙权一起上阵，攻击提高20%",},  
    [102] = {102,"东吴老将",1,400090,0,0,0,0,11,200,0,0,"与程普一起上阵，生命提高20%",},  
    [103] = {103,"酸枣会盟",1,500200,0,0,0,0,11,200,0,0,"与袁绍一起上阵，生命提高20%",},  
    [104] = {104,"孙氏美媳",1,500130,0,0,0,0,12,200,0,0,"与大乔一起上阵，攻击提高20%",},  
    [105] = {105,"奋勇当先",1,400100,0,0,0,0,11,200,0,0,"与周泰一起上阵，生命提高20%",},  
    [106] = {106,"桃花箭雨",1,510060,0,0,0,0,11,200,0,0,"与小乔一起上阵，生命提高20%",},  
    [107] = {107,"凌云之志",1,500160,0,0,0,0,12,200,0,0,"与吕蒙一起上阵，攻击提高20%",},  
    [108] = {108,"鞠躬尽瘁",1,500180,0,0,0,0,12,200,0,0,"与鲁肃一起上阵，攻击提高20%",},  
    [109] = {109,"仁心济世",1,500190,0,0,0,0,11,200,0,0,"与华佗一起上阵，生命提高20%",},  
    [110] = {110,"东吴支柱",1,510050,500160,0,0,0,12,150,11,150,"与陆逊、吕蒙一起上阵，攻击提高15%，生命提高15%",},  
    [111] = {111,"赤壁奇功",1,400110,0,0,0,0,11,200,0,0,"与黄盖一起上阵，生命提高20%",},  
    [112] = {112,"鞠躬尽瘁",1,500170,0,0,0,0,12,200,0,0,"与太史慈一起上阵，攻击提高20%",},  
    [113] = {113,"仁心济世",1,500180,0,0,0,0,11,200,0,0,"与鲁肃一起上阵，生命提高20%",},  
    [114] = {114,"毒士名医",1,510070,0,0,0,0,11,200,0,0,"与贾诩一起上阵，生命提高20%",},  
    [115] = {115,"医道同归",1,500210,0,0,0,0,11,200,0,0,"与于吉一起上阵，生命提高20%",},  
    [116] = {116,"本姓一家",1,500220,0,0,0,0,12,200,0,0,"与华雄一起上阵，攻击提高20%",},  
    [117] = {117,"乱世枭雄",1,500200,0,0,0,0,12,200,0,0,"与袁绍一起上阵，攻击提高20%",},  
    [118] = {118,"亡命追杀",1,400150,0,0,0,0,11,200,0,0,"与文丑一起上阵，生命提高20%",},  
    [119] = {119,"白马银枪",1,510040,0,0,0,0,12,200,0,0,"与赵云一起上阵，攻击提高20%",},  
    [120] = {120,"边疆豪杰",1,500230,0,0,0,0,11,200,0,0,"与董卓一起上阵，生命提高20%",},  
    [121] = {121,"纵横天下",1,400160,0,0,0,0,11,200,0,0,"与陈宫一起上阵，生命提高20%",},  
    [122] = {122,"大漠将才",1,400040,0,0,0,0,11,200,0,0,"与庞德一起上阵，生命提高20%",},  
    [123] = {123,"大漠豪强",1,500230,0,0,0,0,12,200,0,0,"与董卓一起上阵，攻击提高20%",},  
    [124] = {124,"本姓一家",1,500190,0,0,0,0,12,200,0,0,"与华佗一起上阵，攻击提高20%",},  
    [125] = {125,"枭雄霸主",1,400020,0,0,0,0,11,200,0,0,"与曹丕一起上阵，生命提高20%",},  
    [126] = {126,"枭雄美人",1,510080,500200,0,0,0,12,150,11,150,"与貂蝉、袁绍一起上阵，攻击提高15%，生命提高15%",},  
    [127] = {127,"大漠豪强",1,500220,0,0,0,0,12,200,0,0,"与华雄一起上阵，攻击提高20%",},  
    [128] = {128,"边疆豪杰",1,500240,0,0,0,0,11,200,0,0,"与公孙瓒一起上阵，生命提高20%",},  
    [129] = {129,"背水一战",1,400040,0,0,0,0,12,170,0,0,"与庞德一起上阵，攻击提高17%",},  
    [130] = {130,"曹魏良将",1,500060,0,0,0,0,12,170,0,0,"与张郃一起上阵，攻击提高17%",},  
    [131] = {131,"并肩奋战",1,500050,0,0,0,0,11,170,0,0,"与夏侯渊一起上阵，生命提高17%",},  
    [132] = {132,"背水一战",1,400010,0,0,0,0,12,170,0,0,"与于禁一起上阵，攻击提高17%",},  
    [133] = {133,"大漠将才",1,500220,0,0,0,0,11,170,0,0,"与华雄一起上阵，生命提高17%",},  
    [134] = {134,"虎狼之师",1,400030,0,0,0,0,11,170,0,0,"与乐进一起上阵，生命提高17%",},  
    [135] = {135,"枭雄霸主",1,500230,0,0,0,0,11,170,0,0,"与董卓一起上阵，生命提高17%",},  
    [136] = {136,"一见倾心",1,500010,0,0,0,0,12,170,0,0,"与甄姬一起上阵，攻击提高17%",},  
    [137] = {137,"加官进爵",1,500030,0,0,0,0,12,170,0,0,"与许褚一起上阵，攻击提高17%",},  
    [138] = {138,"骁勇善战",1,400120,0,0,0,0,11,170,0,0,"与徐盛一起上阵，生命提高17%",},  
    [139] = {139,"合围东海",1,500020,0,0,0,0,12,170,0,0,"与张辽一起上阵，攻击提高17%",},  
    [140] = {140,"虎狼之师",1,400040,0,0,0,0,11,170,0,0,"与庞德一起上阵，生命提高17%",},  
    [141] = {141,"兰心蕙质",1,400130,0,0,0,0,12,170,0,0,"与孙尚香一起上阵，攻击提高17%",},  
    [142] = {142,"不可貌相",1,500070,0,0,0,0,12,170,0,0,"与庞统一起上阵，攻击提高17%",},  
    [143] = {143,"巧计不言",1,500210,0,0,0,0,11,170,0,0,"与于吉一起上阵，生命提高17%",},  
    [144] = {144,"夫妻同心",1,400070,0,0,0,0,12,170,0,0,"与祝融一起上阵，攻击提高17%",},  
    [145] = {145,"横冲直撞",1,500080,0,0,0,0,11,170,0,0,"与张飞一起上阵，生命提高17%",},  
    [146] = {146,"有胆有谋",1,500120,0,0,0,0,11,170,0,0,"与姜维一起上阵，生命提高17%",},  
    [147] = {147,"夫妻同心",1,400060,0,0,0,0,12,170,0,0,"与孟获一起上阵，攻击提高17%",},  
    [148] = {148,"野性知性",1,500130,0,0,0,0,11,170,0,0,"与大乔一起上阵，生命提高17%",},  
    [149] = {149,"风助火势",1,400080,0,0,0,0,11,170,0,0,"与法正一起上阵，生命提高17%",},  
    [150] = {150,"蜀汉谋主",1,500120,0,0,0,0,12,170,0,0,"与姜维一起上阵，攻击提高17%",},  
    [151] = {151,"言出法随",1,500210,0,0,0,0,12,170,0,0,"与于吉一起上阵，攻击提高17%",},  
    [152] = {152,"风助火势",1,400070,0,0,0,0,11,170,0,0,"与祝融一起上阵，生命提高17%",},  
    [153] = {153,"德高望重",1,400110,0,0,0,0,12,170,0,0,"与黄盖一起上阵，攻击提高17%",},  
    [154] = {154,"东吴老将",1,500150,0,0,0,0,11,170,0,0,"与孙坚一起上阵，生命提高17%",},  
    [155] = {155,"激昂作战",1,400100,0,0,0,0,11,170,0,0,"与周泰一起上阵，生命提高17%",},  
    [156] = {156,"奋勇当先",1,500170,0,0,0,0,11,170,0,0,"与太史慈一起上阵，生命提高17%",},  
    [157] = {157,"出生入死",1,400120,0,0,0,0,12,170,0,0,"与徐盛一起上阵，攻击提高17%",},  
    [158] = {158,"激昂作战",1,400090,0,0,0,0,11,170,0,0,"与程普一起上阵，生命提高17%",},  
    [159] = {159,"德高望重",1,400090,0,0,0,0,12,170,0,0,"与程普一起上阵，攻击提高17%",},  
    [160] = {160,"三代忠臣",1,500140,0,0,0,0,11,170,0,0,"与孙权一起上阵，生命提高17%",},  
    [161] = {161,"赤壁奇功",1,500180,0,0,0,0,11,170,0,0,"与鲁肃一起上阵，生命提高17%",},  
    [162] = {162,"骁勇善战",1,400030,0,0,0,0,11,170,0,0,"与乐进一起上阵，生命提高17%",},  
    [163] = {163,"招贤纳士",1,500140,0,0,0,0,11,170,0,0,"与孙权一起上阵，生命提高17%",},  
    [164] = {164,"出生入死",1,400100,0,0,0,0,12,170,0,0,"与周泰一起上阵，攻击提高17%",},  
    [165] = {165,"亲如姐妹",1,400050,0,0,0,0,12,170,0,0,"与步练师一起上阵，攻击提高17%",},  
    [166] = {166,"美人如玉",1,500010,0,0,0,0,11,170,0,0,"与甄姬一起上阵，生命提高17%",},  
    [167] = {167,"俏皮贤惠",1,500130,0,0,0,0,12,170,0,0,"与大乔一起上阵，攻击提高17%",},  
    [168] = {168,"河北双雄",1,400150,0,0,0,0,12,170,0,0,"与文丑一起上阵，攻击提高17%",},  
    [169] = {169,"巧谋无用",1,500200,0,0,0,0,11,170,0,0,"与袁绍一起上阵，生命提高17%",},  
    [170] = {170,"智勇双全",1,400160,0,0,0,0,12,170,0,0,"与陈宫一起上阵，攻击提高17%",},  
    [171] = {171,"河北双雄",1,400140,0,0,0,0,12,170,0,0,"与颜良一起上阵，攻击提高17%",},  
    [172] = {172,"亡命追杀",1,500240,0,0,0,0,11,170,0,0,"与公孙瓒一起上阵，生命提高17%",},  
    [173] = {173,"有勇有谋",1,400160,0,0,0,0,11,170,0,0,"与陈宫一起上阵，生命提高17%",},  
    [174] = {174,"纵横天下",1,500220,0,0,0,0,11,170,0,0,"与华雄一起上阵，生命提高17%",},  
    [175] = {175,"智勇双全",1,400140,0,0,0,0,12,170,0,0,"与颜良一起上阵，攻击提高17%",},  
    [176] = {176,"有勇有谋",1,400150,0,0,0,0,11,170,0,0,"与文丑一起上阵，生命提高17%",},  
    [177] = {177,"仙人指路",1,500210,0,0,0,0,11,200,0,0,"与于吉一起上阵，生命提高20%",},  
    [178] = {178,"仙人指路",1,500220,0,0,0,0,11,200,0,0,"与华雄一起上阵，生命提高20%",},  
    [179] = {179,"妙才鬼谋",1,500050,0,0,0,0,11,300,0,0,"与夏侯渊一起上阵，生命提高30%",},  
    [180] = {180,"神勇无双",1,500080,0,0,0,0,12,300,0,0,"与张飞一起上阵，攻击提高30%",},  
    [181] = {181,"江东意志",1,500150,0,0,0,0,11,300,0,0,"与孙坚一起上阵，生命提高30%",},  
    [182] = {182,"红颜祸水",1,500210,0,0,0,0,12,300,0,0,"与于吉一起上阵，攻击提高30%",},  
    [183] = {183,"忠肝义胆",1,500040,0,0,0,0,12,300,0,0,"与夏侯惇一起上阵，攻击提高30%",},  
    [184] = {184,"一世君臣",1,510040,0,0,0,0,11,300,0,0,"与赵云一起上阵，生命提高30%",},  
    [185] = {185,"江东儿女",1,500140,0,0,0,0,12,300,0,0,"与孙权一起上阵，攻击提高30%",},  
    [186] = {186,"恨不相逢",1,500200,0,0,0,0,11,300,0,0,"与袁绍一起上阵，生命提高30%",},  
    [187] = {187,"汉臣魏将",1,600110,0,0,0,0,11,300,0,0,"与荀彧一起上阵，生命提高30%",},  
    [188] = {188,"狼顾反骨",1,500100,0,0,0,0,11,250,0,0,"与魏延一起上阵，生命提高25%",},  
    [189] = {189,"大魏庭柱",1,500050,500040,0,0,0,12,150,11,150,"与夏侯渊、夏侯惇一起上阵，攻击提高15%，生命提高15%",},  
    [190] = {190,"鬼策玄机",1,510010,0,0,0,0,12,300,0,0,"与郭嘉一起上阵，攻击提高30%",},  
    [191] = {191,"九天雷劫",1,600120,0,0,0,0,12,300,0,0,"与左慈一起上阵，攻击提高30%",},  
    [192] = {192,"太平传承",1,500210,0,0,0,0,11,250,0,0,"与于吉一起上阵，生命提高25%",},  
    [193] = {193,"三方群雄",1,500220,500240,0,0,0,12,150,11,150,"与华雄、公孙瓒一起上阵，攻击提高15%，生命提高15%",},  
    [194] = {194,"乱世巨星",1,510070,0,0,0,0,12,300,0,0,"与贾诩一起上阵，攻击提高30%",},  
    [195] = {195,"绝才夫妻",1,600030,0,0,0,0,12,300,0,0,"与诸葛亮一起上阵，攻击提高30%",},  
    [196] = {196,"骁将才女",1,510040,500090,0,0,0,12,150,11,150,"与赵云、黄忠一起上阵，攻击提高15%，生命提高15%",},  
    [197] = {197,"绝世才女",1,500010,0,0,0,0,11,250,0,0,"与甄姬一起上阵，生命提高25%",},  
    [198] = {198,"世间仁义",1,510030,0,0,0,0,11,300,0,0,"与刘备一起上阵，生命提高30%",},  
    [199] = {199,"霸王横江",1,600050,0,0,0,0,12,300,0,0,"与孙策一起上阵，攻击提高30%",},  
    [200] = {200,"伏波踏浪",1,500150,500140,0,0,0,12,150,11,150,"与孙坚、孙权一起上阵，攻击提高15%，生命提高15%",},  
    [201] = {201,"生死之交",1,500160,0,0,0,0,11,250,0,0,"与吕蒙一起上阵，生命提高25%",},  
    [202] = {202,"水火不容",1,510050,0,0,0,0,11,300,0,0,"与陆逊一起上阵，生命提高30%",},  
    [203] = {203,"汉臣魏将",1,600020,0,0,0,0,11,300,0,0,"与司马懿一起上阵，生命提高30%",},  
    [204] = {204,"文韬武略",1,500060,0,0,0,0,11,250,0,0,"与张郃一起上阵，生命提高25%",},  
    [205] = {205,"怒破千军",1,500020,500030,0,0,0,12,150,11,150,"与张辽、许褚一起上阵，攻击提高15%，生命提高15%",},  
    [206] = {206,"吾之子房",1,600010,0,0,0,0,12,300,0,0,"与曹操一起上阵，攻击提高30%",},  
    [207] = {207,"九天雷劫",1,600080,0,0,0,0,12,300,0,0,"与张角一起上阵，攻击提高30%",},  
    [208] = {208,"神鬼莫测",1,500210,0,0,0,0,11,250,0,0,"与于吉一起上阵，生命提高25%",},  
    [209] = {209,"我行我素",1,500200,500230,0,0,0,12,150,11,150,"与袁绍、董卓一起上阵，攻击提高15%，生命提高15%",},  
    [210] = {210,"奇门飞将",1,600070,0,0,0,0,11,300,0,0,"与吕布一起上阵，生命提高30%",},  
    [211] = {211,"绝才夫妻",1,600090,0,0,0,0,12,300,0,0,"与黄月英一起上阵，攻击提高30%",},  
    [212] = {212,"智勇兼备",1,500080,510040,0,0,0,12,150,11,150,"与张飞、赵云一起上阵，攻击提高15%，生命提高15%",},  
    [213] = {213,"火尽薪传",1,500120,0,0,0,0,11,250,0,0,"与姜维一起上阵，生命提高25%",},  
    [214] = {214,"万人不敌",1,600040,0,0,0,0,11,300,0,0,"与关羽一起上阵，生命提高30%",},  
    [215] = {215,"霸王横江",1,600100,0,0,0,0,12,300,0,0,"与甘宁一起上阵，攻击提高30%",},  
    [216] = {216,"血脉共鸣",1,500150,500140,0,0,0,12,150,11,150,"与孙坚、孙权一起上阵，攻击提高15%，生命提高15%",},  
    [217] = {217,"锦衣相待",1,500170,0,0,0,0,11,250,0,0,"与太史慈一起上阵，生命提高25%",},  
    [218] = {218,"江东双璧",1,600060,0,0,0,0,11,300,0,0,"与周瑜一起上阵，生命提高30%",},  
    [219] = {219,"君臣戮力",1,510020,0,0,0,0,11,300,0,0,"与典韦一起上阵，生命提高30%",},  
    [220] = {220,"肝胆连襟",1,500050,0,0,0,0,11,250,0,0,"与夏侯渊一起上阵，生命提高25%",},  
    [221] = {221,"英君良将",1,500060,500020,0,0,0,12,150,11,150,"与张郃、张辽一起上阵，攻击提高15%，生命提高15%",},  
    [222] = {222,"吾之子房",1,600110,0,0,0,0,12,300,0,0,"与荀彧一起上阵，攻击提高30%",},  
    [223] = {223,"拔山盖世",1,500110,0,0,0,0,12,300,0,0,"与马超一起上阵，攻击提高30%",},  
    [224] = {224,"珠联璧合",1,500070,500090,0,0,0,12,150,11,150,"与庞统、黄忠一起上阵，攻击提高15%，生命提高15%",},  
    [225] = {225,"刮骨之义",1,500190,0,0,0,0,11,250,0,0,"与华佗一起上阵，生命提高25%",},  
    [226] = {226,"万人不敌",1,600030,0,0,0,0,11,300,0,0,"与诸葛亮一起上阵，生命提高30%",},  
    [227] = {227,"琴瑟和鸣",1,510060,0,0,0,0,12,300,0,0,"与小乔一起上阵，攻击提高30%",},  
    [228] = {228,"扛鼎之臣",1,500180,500160,0,0,0,12,150,11,150,"与鲁肃、吕蒙一起上阵，攻击提高15%，生命提高15%",},  
    [229] = {229,"亲上加亲",1,500130,0,0,0,0,11,250,0,0,"与大乔一起上阵，生命提高25%",},  
    [230] = {230,"江东双壁",1,600050,0,0,0,0,11,300,0,0,"与孙策一起上阵，生命提高30%",},  
    [231] = {231,"美人难关",1,510080,0,0,0,0,12,300,0,0,"与貂蝉一起上阵，攻击提高30%",},  
    [232] = {232,"猛虎反噬",1,500230,0,0,0,0,11,250,0,0,"与董卓一起上阵，生命提高25%",},  
    [233] = {233,"血勇骁将",1,500220,500240,0,0,0,12,150,11,150,"与华雄、公孙瓒一起上阵，攻击提高15%，生命提高15%",},  
    [234] = {234,"奇门飞将",1,600120,0,0,0,0,11,300,0,0,"与左慈一起上阵，生命提高30%",},  
    [235] = {235,"枭雄明珠",1,600010,0,0,0,0,11,450,0,0,"与曹操一起上阵，生命提高45%",},  
    [236] = {236,"护花铁卫",1,510020,0,0,0,0,11,350,0,0,"与典韦一起上阵，生命提高35%",},  
    [237] = {237,"风华绝代",1,510010,600020,0,0,0,12,250,11,250,"与郭嘉，司马懿一起上阵，攻击提高25%，生命提高25%",},  
    [238] = {238,"铁骨素心",1,700050,0,0,0,0,12,450,0,0,"与神秘武将一起上阵，攻击提高45%",},  
    [239] = {239,"仙羽圣公",1,600040,0,0,0,0,12,450,0,0,"与关羽一起上阵，攻击提高45%",},  
    [240] = {240,"冠世神机",1,600030,600090,0,0,0,12,250,11,250,"与诸葛亮，黄月英一起上阵，攻击提高25%，生命提高25%",},  
    [241] = {241,"仁心妙法",1,510030,0,0,0,0,11,350,0,0,"与刘备一起上阵，生命提高35%",},  
    [242] = {242,"慧质明姿",1,700060,0,0,0,0,11,450,0,0,"与神秘武将一起上阵，生命提高45%",},  
    [243] = {243,"怜心俊才",1,600060,0,0,0,0,12,450,0,0,"与周瑜一起上阵，攻击提高45%",},  
    [244] = {244,"恃宠若娇",1,500140,400050,0,0,0,12,250,11,250,"与孙权，步练师一起上阵，攻击提高25%，生命提高25%",},  
    [245] = {245,"傲骨黯心",1,600100,0,0,0,0,11,350,0,0,"与甘宁一起上阵，生命提高35%",},  
    [246] = {246,"诡术破军",1,700070,0,0,0,0,11,450,0,0,"与神秘武将一起上阵，生命提高45%",},  
    [247] = {247,"战神传承",1,600070,0,0,0,0,12,450,0,0,"与吕布一起上阵，攻击提高45%",},  
    [248] = {248,"乱世枭姬",1,510080,0,0,0,0,11,350,0,0,"与貂蝉一起上阵，生命提高35%",},  
    [249] = {249,"神戟镇仙",1,600120,600080,0,0,0,12,250,11,250,"与左慈，张角一起上阵，攻击提高25%，生命提高25%",},  
    [250] = {250,"睥睨天下",1,700080,0,0,0,0,11,450,0,0,"与神秘武将一起上阵，生命提高45%",},  
    [251] = {251,"龙腾万里",1,600010,0,0,0,0,11,450,0,0,"与曹操一起上阵，生命提高45%",},  
    [252] = {252,"威震天下",1,510020,0,0,0,0,11,350,0,0,"与典韦一起上阵，生命提高35%",},  
    [253] = {253,"挡者披靡",1,510010,600110,0,0,0,12,250,11,250,"与郭嘉，荀彧一起上阵，攻击提高25%，生命提高25%",},  
    [254] = {254,"铁骨素心",1,700010,0,0,0,0,12,450,0,0,"与曹节一起上阵，攻击提高45%",},  
    [255] = {255,"忠勇英豪",1,600040,0,0,0,0,12,450,0,0,"与关羽一起上阵，攻击提高45%",},  
    [256] = {256,"幼麟天威",1,510030,500110,0,0,0,12,250,11,250,"与刘备，马超一起上阵，攻击提高25%，生命提高25%",},  
    [257] = {257,"北伐之志",1,600030,0,0,0,0,11,350,0,0,"与诸葛亮一起上阵，生命提高35%",},  
    [258] = {258,"慧质明姿",1,700020,0,0,0,0,11,450,0,0,"与诸葛果一起上阵，生命提高45%",},  
    [259] = {259,"贯日神箭",1,600060,0,0,0,0,12,450,0,0,"与周瑜一起上阵，攻击提高45%",},  
    [260] = {260,"气贯长虹",1,510050,600050,0,0,0,12,250,11,250,"与陆逊，孙策一起上阵，攻击提高25%，生命提高25%",},  
    [261] = {261,"花箭若雨",1,510060,0,0,0,0,11,350,0,0,"与小乔一起上阵，生命提高35%",},  
    [262] = {262,"诡术破军",1,700030,0,0,0,0,11,450,0,0,"与孙鲁班一起上阵，生命提高45%",},  
    [263] = {263,"盖世神威",1,600070,0,0,0,0,12,450,0,0,"与吕布一起上阵，攻击提高45%",},  
    [264] = {264,"好谋善断",1,510070,0,0,0,0,11,350,0,0,"与贾诩一起上阵，生命提高35%",},  
    [265] = {265,"天公名流",1,600120,600080,0,0,0,12,250,11,250,"与左慈，张角一起上阵，攻击提高25%，生命提高25%",},  
    [266] = {266,"睥睨天下",1,700040,0,0,0,0,11,450,0,0,"与吕玲绮一起上阵，生命提高45%",},  
    [267] = {1001,"血战护佑",2,302,0,0,0,0,0,0,0,0,"穿戴血战长靴，生命提高8%",},  
    [268] = {1002,"血战不退",2,301,0,0,0,0,12,80,0,0,"穿戴血战利斧，攻击提高8%",},  
    [269] = {1003,"血战守护",2,303,0,0,0,0,0,0,0,0,"穿戴血战锁甲，防御提高8%",},  
    [270] = {1004,"血战意志",2,304,0,0,0,0,0,0,0,0,"穿戴血战头盔，防御提高8%",},  
    [271] = {1005,"破军护佑",2,312,0,0,0,0,11,80,0,0,"穿戴破军长靴，生命提高8%",},  
    [272] = {1006,"破军杀将",2,311,0,0,0,0,12,80,0,0,"穿戴破军战枪，攻击提高8%",},  
    [273] = {1007,"破军守护",2,313,0,0,0,0,0,0,0,0,"穿戴破军锁甲，防御提高8%",},  
    [274] = {1008,"破军意志",2,314,0,0,0,0,0,0,0,0,"穿戴破军面甲，防御提高8%",},  
    [275] = {1009,"破军护佑",2,312,0,0,0,0,11,100,0,0,"穿戴破军长靴，生命提高10%",},  
    [276] = {1010,"破军杀将",2,311,0,0,0,0,12,100,0,0,"穿戴破军战枪，攻击提高10%",},  
    [277] = {1011,"破军守护",2,313,0,0,0,0,12,100,0,0,"穿戴破军锁甲，攻击提高10%",},  
    [278] = {1012,"破军意志",2,314,0,0,0,0,11,100,0,0,"穿戴破军面甲，生命提高10%",},  
    [279] = {1101,"朱雀护佑",2,402,0,0,0,0,11,100,0,0,"穿戴朱雀步履，生命提高10%",},  
    [280] = {1102,"朱雀灭杀",2,401,0,0,0,0,12,100,0,0,"穿戴朱雀羽扇，攻击提高10%",},  
    [281] = {1103,"朱雀守护",2,403,0,0,0,0,15,100,0,0,"穿戴朱雀法袍，防御提高10%",},  
    [282] = {1104,"朱雀意志",2,404,0,0,0,0,15,100,0,0,"穿戴朱雀发冠，防御提高10%",},  
    [283] = {1105,"霸王护佑",2,412,0,0,0,0,11,100,0,0,"穿戴霸王战靴，生命提高10%",},  
    [284] = {1106,"霸王之资",2,411,0,0,0,0,12,100,0,0,"穿戴霸王神剑，攻击提高10%",},  
    [285] = {1107,"霸王守护",2,413,0,0,0,0,15,100,0,0,"穿戴霸王重甲，防御提高10%",},  
    [286] = {1108,"霸王意志",2,414,0,0,0,0,15,100,0,0,"穿戴霸王战盔，防御提高10%",},  
    [287] = {1109,"霸王护佑",2,412,0,0,0,0,11,180,0,0,"穿戴霸王战靴，生命提高18%",},  
    [288] = {1110,"霸王之资",2,411,0,0,0,0,12,180,0,0,"穿戴霸王神剑，攻击提高18%",},  
    [289] = {1111,"霸王守护",2,413,0,0,0,0,12,180,0,0,"穿戴霸王重甲，攻击提高18%",},  
    [290] = {1112,"霸王意志",2,414,0,0,0,0,11,180,0,0,"穿戴霸王战盔，生命提高18%",},  
    [291] = {1113,"朱雀灭杀",2,401,0,0,0,0,12,150,0,0,"穿戴朱雀羽扇，攻击提高15%",},  
    [292] = {1114,"朱雀守护",2,403,0,0,0,0,15,150,0,0,"穿戴朱雀法袍，防御提高15%",},  
    [293] = {1115,"朱雀意志",2,404,0,0,0,0,15,150,0,0,"穿戴朱雀发冠，防御提高15%",},  
    [294] = {1116,"朱雀护佑",2,402,0,0,0,0,11,150,0,0,"穿戴朱雀步履，生命提高15%",},  
    [295] = {1117,"霸王之资",2,411,0,0,0,0,12,150,0,0,"穿戴霸王神剑，攻击提高15%",},  
    [296] = {1118,"霸王护佑",2,412,0,0,0,0,11,150,0,0,"穿戴霸王战靴，生命提高15%",},  
    [297] = {1119,"霸王守护",2,413,0,0,0,0,15,150,0,0,"穿戴霸王重甲，防御提高15%",},  
    [298] = {1120,"霸王意志",2,414,0,0,0,0,15,150,0,0,"穿戴霸王战盔，防御提高15%",},  
    [299] = {1201,"无双护佑",2,422,0,0,0,0,11,150,0,0,"穿戴无双战靴，生命提高15%",},  
    [300] = {1202,"无双之力",2,421,0,0,0,0,12,150,0,0,"穿戴无双画戟，攻击提高15%",},  
    [301] = {1203,"无双守护",2,423,0,0,0,0,15,150,0,0,"穿戴无双宝铠，防御提高15%",},  
    [302] = {1204,"无双意志",2,424,0,0,0,0,15,150,0,0,"穿戴无双金冠，防御提高15%",},  
    [303] = {1205,"无双护佑",2,422,0,0,0,0,11,230,0,0,"穿戴无双战靴，生命提高23%",},  
    [304] = {1206,"无双之力",2,421,0,0,0,0,12,230,0,0,"穿戴无双画戟，攻击提高23%",},  
    [305] = {1207,"无双守护",2,423,0,0,0,0,12,230,0,0,"穿戴无双宝铠，攻击提高23%",},  
    [306] = {1208,"无双意志",2,424,0,0,0,0,11,230,0,0,"穿戴无双金冠，生命提高23%",},  
    [307] = {1210,"无双之力",2,421,0,0,0,0,12,250,0,0,"穿戴无双画戟，攻击提高25%",},  
    [308] = {1211,"无双守护",2,423,0,0,0,0,15,250,0,0,"穿戴无双宝铠，防御提高25%",},  
    [309] = {1212,"无双意志",2,424,0,0,0,0,15,250,0,0,"穿戴无双金冠，防御提高25%",},  
    [310] = {1213,"无双护佑",2,422,0,0,0,0,11,250,0,0,"穿戴无双战靴，生命提高25%",},  
    [311] = {2001,"孙武之策",3,11110,0,0,0,0,0,0,0,0,"穿戴孙子兵法，攻击提高10%",},  
    [312] = {2002,"鬼谷纵横",3,11120,0,0,0,0,0,0,0,0,"穿戴鬼谷子，攻击提高10%",},  
    [313] = {2003,"太尉之职",3,12110,0,0,0,0,0,0,0,0,"穿戴太尉印，防御提高10%",},  
    [314] = {2004,"御史大夫",3,12120,0,0,0,0,0,0,0,0,"穿戴御史印，防御提高10%",},  
    [315] = {2005,"孙武之策",3,11110,0,0,0,0,12,100,0,0,"穿戴孙子兵法，攻击提高10%",},  
    [316] = {2006,"太尉之职",3,12110,0,0,0,0,15,100,0,0,"穿戴太尉印，防御提高10%",},  
    [317] = {2101,"太平仙法",3,11210,0,0,0,0,12,120,0,0,"穿戴太平要术/天·太平要术，攻击提高12%",},  
    [318] = {2102,"孟德之志",3,11320,0,0,0,0,12,120,0,0,"穿戴孟德新书/天·孟德新书，攻击提高12%",},  
    [319] = {2103,"将帅意志",3,12210,0,0,0,0,15,120,0,0,"穿戴将军印/地·将军印，防御提高12%",},  
    [320] = {2104,"一国之相",3,12320,0,0,0,0,15,120,0,0,"穿戴丞相印/地·丞相印，防御提高12%",},  
    [321] = {2105,"孟德之志",3,11320,0,0,0,0,12,230,0,0,"穿戴孟德新书/天·孟德新书，攻击提高23%",},  
    [322] = {2106,"将帅意志",3,12210,0,0,0,0,15,230,0,0,"穿戴将军印/地·将军印，防御提高23%",},  
    [323] = {2107,"太平仙法",3,11210,0,0,0,0,12,150,0,0,"穿戴太平要术/天·太平要术，攻击提高15%",},  
    [324] = {2108,"孟德之志",3,11320,0,0,0,0,12,150,0,0,"穿戴孟德新书/天·孟德新书，攻击提高15%",},  
    [325] = {2109,"将帅意志",3,12210,0,0,0,0,15,150,0,0,"穿戴将军印/地·将军印，防御提高15%",},  
    [326] = {2110,"一国之相",3,12320,0,0,0,0,15,150,0,0,"穿戴丞相印/地·丞相印，防御提高15%",},  
    [327] = {1301,"不灭护佑",2,5010,0,0,0,0,11,200,0,0,"穿戴不灭飞履，生命提高20%",},  
    [328] = {1302,"不灭之力",2,5000,0,0,0,0,12,200,0,0,"穿戴不灭神镰，攻击提高20%",},  
    [329] = {1303,"不灭守护",2,5020,0,0,0,0,15,200,0,0,"穿戴不灭玄铠，防御提高20%",},  
    [330] = {1304,"不灭意志",2,5030,0,0,0,0,15,200,0,0,"穿戴不灭灵盔，防御提高20%",},  
    [331] = {1305,"不灭护佑",2,5010,0,0,0,0,11,300,0,0,"穿戴不灭飞履，生命提高30%",},  
    [332] = {1306,"不灭之力",2,5000,0,0,0,0,12,300,0,0,"穿戴不灭神镰，攻击提高30%",},  
    [333] = {1307,"不灭守护",2,5020,0,0,0,0,12,300,0,0,"穿戴不灭玄铠，攻击提高30%",},  
    [334] = {1308,"不灭意志",2,5030,0,0,0,0,11,300,0,0,"穿戴不灭灵盔，生命提高30%",},  
    [335] = {1309,"不灭护佑",2,5010,0,0,0,0,11,300,0,0,"穿戴不灭飞履，生命提高30%",},  
    [336] = {1310,"不灭之力",2,5000,0,0,0,0,12,300,0,0,"穿戴不灭神镰，攻击提高30%",},  
    [337] = {1311,"不灭守护",2,5020,0,0,0,0,15,300,0,0,"穿戴不灭玄铠，防御提高30%",},  
    [338] = {1312,"不灭意志",2,5030,0,0,0,0,15,300,0,0,"穿戴不灭灵盔，防御提高30%",},
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
    [1001] = 267,  
    [1002] = 268,  
    [1003] = 269,  
    [1004] = 270,  
    [1005] = 271,  
    [1006] = 272,  
    [1007] = 273,  
    [1008] = 274,  
    [1009] = 275,  
    [1010] = 276,  
    [1011] = 277,  
    [1012] = 278,  
    [1101] = 279,  
    [1102] = 280,  
    [1103] = 281,  
    [1104] = 282,  
    [1105] = 283,  
    [1106] = 284,  
    [1107] = 285,  
    [1108] = 286,  
    [1109] = 287,  
    [1110] = 288,  
    [1111] = 289,  
    [1112] = 290,  
    [1113] = 291,  
    [1114] = 292,  
    [1115] = 293,  
    [1116] = 294,  
    [1117] = 295,  
    [1118] = 296,  
    [1119] = 297,  
    [1120] = 298,  
    [1201] = 299,  
    [1202] = 300,  
    [1203] = 301,  
    [1204] = 302,  
    [1205] = 303,  
    [1206] = 304,  
    [1207] = 305,  
    [1208] = 306,  
    [1210] = 307,  
    [1211] = 308,  
    [1212] = 309,  
    [1213] = 310,  
    [1301] = 327,  
    [1302] = 328,  
    [1303] = 329,  
    [1304] = 330,  
    [1305] = 331,  
    [1306] = 332,  
    [1307] = 333,  
    [1308] = 334,  
    [1309] = 335,  
    [1310] = 336,  
    [1311] = 337,  
    [1312] = 338,  
    [2001] = 311,  
    [2002] = 312,  
    [2003] = 313,  
    [2004] = 314,  
    [2005] = 315,  
    [2006] = 316,  
    [2101] = 317,  
    [2102] = 318,  
    [2103] = 319,  
    [2104] = 320,  
    [2105] = 321,  
    [2106] = 322,  
    [2107] = 323,  
    [2108] = 324,  
    [2109] = 325,  
    [2110] = 326,
}

local __key_map = { 
    id = 1,
    name = 2,
    type = 3,
    value_1 = 4,
    value_2 = 5,
    value_3 = 6,
    value_4 = 7,
    value_5 = 8,
    affect_type_1 = 9,
    affect_value_1 = 10,
    affect_type_2 = 11,
    affect_value_2 = 12,
    directions = 13,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_knight_association_info")

        return t._raw[__key_map[k]]
    end
}


function knight_association_info.getLength()
    return #knight_association_info._data
end



function knight_association_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_knight_association_info
function knight_association_info.indexOf(index)
    if index == nil or not knight_association_info._data[index] then
        return nil
    end
    return setmetatable({_raw = knight_association_info._data[index]}, m)
end



---
--@return @class record_knight_association_info
function knight_association_info.get(id)
    
    return knight_association_info.indexOf(__index_id[ id ])
     
end



function knight_association_info.set(id, key, value)
    local record = knight_association_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function knight_association_info.get_index_data()
    return __index_id 
end

return  knight_association_info 