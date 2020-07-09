---@classdef record_fragment_info
local record_fragment_info = {}


record_fragment_info.id = 0--碎片ID
record_fragment_info.name =  ""--碎片名称
record_fragment_info.res_id = 0--碎片图标id
record_fragment_info.quality = 0--品质
record_fragment_info.rare = 0--稀有
record_fragment_info.fragment_type = 0--碎片类型
record_fragment_info.fragment_value = 0--碎片类型值
record_fragment_info.combine_num = 0--碎片合成数量
record_fragment_info.is_combination = 0--是否组合合成
record_fragment_info.gm = 0--是否GM后台发送
record_fragment_info.is_sell = 0--是否可以出售
record_fragment_info.price_type = 0--出售类型
record_fragment_info.price_value = 0--出售类型值
record_fragment_info.price_size = 0--出售货币数量
record_fragment_info.description =  ""--描述

local fragment_info = {
   _data = {   
    [1] = {1,"测试战戟碎片",421,6,0,7,1,40,0,0,0,1,6,100,"测试武器",},  
    [2] = {2,"测试战靴碎片",422,6,0,7,2,40,0,0,0,1,6,100,"测试腰带",},  
    [3] = {3,"测试战甲碎片",423,6,0,7,3,40,0,0,0,1,6,100,"测试铠甲",},  
    [4] = {4,"测试头盔碎片",424,6,0,7,4,40,0,0,0,1,6,100,"测试头盔",},  
    [5] = {201,"烈焰弓碎片",201,4,0,7,201,20,0,1,1,1,6,50,"烈焰套装部件，用玄铜制造的强弓，其射出的箭支力道惊人。",},  
    [6] = {202,"烈焰鞋碎片",202,4,0,7,202,20,0,1,1,1,6,50,"烈焰套装部件，棉布为衬，银丝镶边，外镶甲片，穿着美观轻便",},  
    [7] = {203,"烈焰甲碎片",203,4,0,7,203,20,0,1,1,1,6,50,"烈焰套装部件，通体以玄铜炼制，外绣火焰图案，古朴美观。",},  
    [8] = {204,"烈焰盔碎片",204,4,0,7,204,20,0,1,1,1,6,50,"烈焰套装部件，以玄铜炼制的头盔，顶部缀以红缨，穿戴舒适。",},  
    [9] = {211,"寒光锤碎片",211,4,0,7,211,20,0,1,1,1,6,50,"寒光套装部件，以寒铁锻造的巨锤，外表突出尖刺，狰狞刺骨。",},  
    [10] = {212,"寒光靴碎片",212,4,0,7,212,20,0,1,1,1,6,50,"寒光套装部件，鞋子通体以寒铁锻造，内衬棉布，穿戴舒适。",},  
    [11] = {213,"寒光甲碎片",213,4,0,7,213,20,0,1,1,1,6,50,"寒光套装部件，通体使用寒铁铸造，入手沉重冰寒，具备不错的防护力。",},  
    [12] = {214,"寒光盔碎片",214,4,0,7,214,20,0,1,1,1,6,50,"寒光套装部件，使用寒铁锻造的头盔，入手冰寒，能有效保护头部。",},  
    [13] = {301,"血战利斧碎片",301,5,0,7,301,30,0,1,1,1,6,250,"血战套装部件，通体由乌金锻造，因斧刃黑红宛若鲜血残渍，故名。",},  
    [14] = {302,"血战长靴碎片",302,5,0,7,302,30,0,1,1,1,6,250,"血战套装部件，鞋面由牛皮缝制，外以乌金拉丝装饰，利于疾跑迎战",},  
    [15] = {303,"血战锁甲碎片",303,5,0,7,303,30,0,1,1,1,6,250,"血战套装部件，以乌金混杂白银拉丝编织而成，穿戴舒适，造型威严。",},  
    [16] = {304,"血战头盔碎片",304,5,0,7,304,30,0,1,1,1,6,250,"血战套装部件，使用乌金锻造而成，内衬羊皮，造型精美，穿戴舒适。",},  
    [17] = {311,"破军战枪碎片",311,5,0,7,311,30,0,1,1,1,6,250,"破军套装部件，通体以玄铁制造，枪头梭形上尖，下部有倒钩，常用来对付冲锋骑兵",},  
    [18] = {312,"破军长靴碎片",312,5,0,7,312,30,0,1,1,1,6,250,"破军套装部件，通体用寒铁锻造，外镶乌金装饰，内衬牛皮，穿戴舒适。",},  
    [19] = {313,"破军锁甲碎片",313,5,0,7,313,30,0,1,1,1,6,250,"破军套装部件，采用寒铁与乌金锻造，造型凶猛，拥有出色的防御力。",},  
    [20] = {314,"破军面甲碎片",314,5,0,7,314,30,0,1,1,1,6,250,"破军套装部件，面具采用玄铁混杂玉砂锻造，造型宛若妖魔，凶悍威猛",},  
    [21] = {401,"朱雀羽扇碎片",401,6,0,7,401,75,0,1,1,1,6,400,"朱雀套装部件，巧匠用异禽尾羽，并乌金拉丝编成，扇动时宛若浴火朱雀。",},  
    [22] = {402,"朱雀步履碎片",402,6,0,7,402,75,0,1,1,1,6,400,"朱雀套装部件，巧匠用真丝彩线缝制而成，上面镶有玄铁甲片，穿着舒适尊贵",},  
    [23] = {403,"朱雀法袍碎片",403,6,0,7,403,75,0,1,1,1,6,400,"朱雀套装部件，巧匠以金丝、豹虎毛裘缝制，其上绣有朱雀。造型华贵飘逸。",},  
    [24] = {404,"朱雀发冠碎片",404,6,0,7,404,75,0,1,1,1,6,400,"朱雀套装部件，巧匠以金丝、云锦缝制，其上镶以宝石，穿戴尽显儒雅。",},  
    [25] = {411,"霸王神剑碎片",411,6,0,7,411,75,0,1,1,1,6,400,"霸王套装部件，名匠以玄铁混乌金锻造，重达百斤，非霸王神力无法使用。",},  
    [26] = {412,"霸王战靴碎片",412,6,0,7,412,75,0,1,1,1,6,400,"霸王套装部件，名匠用玄铁乌金锻造的长靴，内垫虎皮，穿戴沉重，力道惊人。",},  
    [27] = {413,"霸王重甲碎片",413,6,0,7,413,75,0,1,1,1,6,400,"霸王套装部件，名匠以玄铁混乌金锻造的重甲，造型威猛狰狞，气势惊人。",},  
    [28] = {414,"霸王战盔碎片",414,6,0,7,414,75,0,1,1,1,6,400,"霸王套装部件，名匠用玄铁锻造，内垫虎皮，穿戴舒适且威猛。",},  
    [29] = {421,"无双画戟碎片",421,7,0,7,421,75,0,1,1,1,6,1000,"无双套装部件，来历已不可考，通体为玄铁锻造，戟头尖锐带钩，杀气腾腾。",},  
    [30] = {422,"无双战靴碎片",422,7,0,7,422,75,0,1,1,1,6,1000,"无双套装部件，来历已不可考，通体玄铁锻造，外以乌金锦缎装饰，气势十足。",},  
    [31] = {423,"无双宝铠碎片",423,7,0,7,423,75,0,1,1,1,6,1000,"无双套装部件，来历已不可考，通体以玄铁锻造，外以乌金、白银装饰，异常华丽。",},  
    [32] = {424,"无双金冠碎片",424,7,0,7,424,75,0,1,1,1,6,1000,"无双套装部件，来历已不可考，冠身为天蚕丝编织，顶部镶两根雉尾， 霸气凌人",},  
    [33] = {11011,"三略碎片1",11011,4,0,8,11010,1,1,1,0,0,0,0,"汉初道家隐士黄石公所作，糅合了诸子各家思想中专论战略的兵书。",},  
    [34] = {11012,"三略碎片2",11012,4,0,8,11010,1,1,1,0,0,0,0,"汉初道家隐士黄石公所作，糅合了诸子各家思想中专论战略的兵书。",},  
    [35] = {11013,"三略碎片3",11013,4,0,8,11010,1,1,1,0,0,0,0,"汉初道家隐士黄石公所作，糅合了诸子各家思想中专论战略的兵书。",},  
    [36] = {11021,"司马法碎片1",11021,4,0,8,11020,1,1,1,0,0,0,0,"齐国司马穰苴整理成文，是现存中国最古老的兵法书。",},  
    [37] = {11022,"司马法碎片2",11022,4,0,8,11020,1,1,1,0,0,0,0,"齐国司马穰苴整理成文，是现存中国最古老的兵法书。",},  
    [38] = {11023,"司马法碎片3",11023,4,0,8,11020,1,1,1,0,0,0,0,"齐国司马穰苴整理成文，是现存中国最古老的兵法书。",},  
    [39] = {11111,"孙子兵法碎片1",11111,5,0,8,11110,1,1,1,0,0,0,0,"春秋时期孙武所著，博大精深，被誉为“兵学圣典”。",},  
    [40] = {11112,"孙子兵法碎片2",11112,5,0,8,11110,1,1,1,0,0,0,0,"春秋时期孙武所著，博大精深，被誉为“兵学圣典”。",},  
    [41] = {11113,"孙子兵法碎片3",11113,5,0,8,11110,1,1,1,0,0,0,0,"春秋时期孙武所著，博大精深，被誉为“兵学圣典”。",},  
    [42] = {11114,"孙子兵法碎片4",11114,5,0,8,11110,1,1,1,0,0,0,0,"春秋时期孙武所著，博大精深，被誉为“兵学圣典”。",},  
    [43] = {11121,"鬼谷子碎片1",11121,5,0,8,11120,1,1,1,0,0,0,0,"鬼谷子为纵横家之鼻祖，学识惊人，著有《鬼谷子》兵书十四篇传世。",},  
    [44] = {11122,"鬼谷子碎片2",11122,5,0,8,11120,1,1,1,0,0,0,0,"鬼谷子为纵横家之鼻祖，学识惊人，著有《鬼谷子》兵书十四篇传世。",},  
    [45] = {11123,"鬼谷子碎片3",11123,5,0,8,11120,1,1,1,0,0,0,0,"鬼谷子为纵横家之鼻祖，学识惊人，著有《鬼谷子》兵书十四篇传世。",},  
    [46] = {11124,"鬼谷子碎片4",11124,5,0,8,11120,1,1,1,0,0,0,0,"鬼谷子为纵横家之鼻祖，学识惊人，著有《鬼谷子》兵书十四篇传世。",},  
    [47] = {11211,"太平要术碎片1",11211,6,0,8,11210,1,1,1,0,0,0,0,"于吉曾于汉顺帝时入山采药，忽视有书浮于水。取而观之，名太平要术。",},  
    [48] = {11212,"太平要术碎片2",11212,6,0,8,11210,1,1,1,0,0,0,0,"于吉曾于汉顺帝时入山采药，忽视有书浮于水。取而观之，名太平要术。",},  
    [49] = {11213,"太平要术碎片3",11213,6,0,8,11210,1,1,1,0,0,0,0,"于吉曾于汉顺帝时入山采药，忽视有书浮于水。取而观之，名太平要术。",},  
    [50] = {11214,"太平要术碎片4",11214,6,0,8,11210,1,1,1,0,0,0,0,"于吉曾于汉顺帝时入山采药，忽视有书浮于水。取而观之，名太平要术。",},  
    [51] = {11215,"太平要术碎片5",11215,6,0,8,11210,1,1,1,0,0,0,0,"于吉曾于汉顺帝时入山采药，忽视有书浮于水。取而观之，名太平要术。",},  
    [52] = {11321,"孟德新书碎片1",11321,6,0,8,11320,1,1,1,0,0,0,0,"曹操半生戎马，在前人的基础上总结并创新，成就了这本孟德新书。",},  
    [53] = {11322,"孟德新书碎片2",11322,6,0,8,11320,1,1,1,0,0,0,0,"曹操半生戎马，在前人的基础上总结并创新，成就了这本孟德新书。",},  
    [54] = {11323,"孟德新书碎片3",11323,6,0,8,11320,1,1,1,0,0,0,0,"曹操半生戎马，在前人的基础上总结并创新，成就了这本孟德新书。",},  
    [55] = {11324,"孟德新书碎片4",11324,6,0,8,11320,1,1,1,0,0,0,0,"曹操半生戎马，在前人的基础上总结并创新，成就了这本孟德新书。",},  
    [56] = {11325,"孟德新书碎片5",11325,6,0,8,11320,1,1,1,0,0,0,0,"曹操半生戎马，在前人的基础上总结并创新，成就了这本孟德新书。",},  
    [57] = {12011,"县令印碎片1",12011,4,0,8,12010,1,1,1,0,0,0,0,"以青铜锻造的官印，由吏部颁发，为县吏的身份凭物。",},  
    [58] = {12012,"县令印碎片2",12012,4,0,8,12010,1,1,1,0,0,0,0,"以青铜锻造的官印，由吏部颁发，为县吏的身份凭物。",},  
    [59] = {12013,"县令印碎片3",12013,4,0,8,12010,1,1,1,0,0,0,0,"以青铜锻造的官印，由吏部颁发，为县吏的身份凭物。",},  
    [60] = {12021,"主簿印碎片1",12021,4,0,8,12020,1,1,1,0,0,0,0,"以青铜锻造的官印，由吏部颁发，为功曹的身份凭物。",},  
    [61] = {12022,"主簿印碎片2",12022,4,0,8,12020,1,1,1,0,0,0,0,"以青铜锻造的官印，由吏部颁发，为功曹的身份凭物。",},  
    [62] = {12023,"主簿印碎片3",12023,4,0,8,12020,1,1,1,0,0,0,0,"以青铜锻造的官印，由吏部颁发，为功曹的身份凭物。",},  
    [63] = {12111,"太尉印碎片1",12111,5,0,8,12110,1,1,1,0,0,0,0,"由朝廷颁发，以白银锻造的官印，是太尉官职的身份象征。",},  
    [64] = {12112,"太尉印碎片2",12112,5,0,8,12110,1,1,1,0,0,0,0,"由朝廷颁发，以白银锻造的官印，是太尉官职的身份象征。",},  
    [65] = {12113,"太尉印碎片3",12113,5,0,8,12110,1,1,1,0,0,0,0,"由朝廷颁发，以白银锻造的官印，是太尉官职的身份象征。",},  
    [66] = {12114,"太尉印碎片4",12114,5,0,8,12110,1,1,1,0,0,0,0,"由朝廷颁发，以白银锻造的官印，是太尉官职的身份象征。",},  
    [67] = {12121,"御史印碎片1",12121,5,0,8,12120,1,1,1,0,0,0,0,"由朝廷颁发，以白银锻造的官印，是御史官职的身份凭物。",},  
    [68] = {12122,"御史印碎片2",12122,5,0,8,12120,1,1,1,0,0,0,0,"由朝廷颁发，以白银锻造的官印，是御史官职的身份凭物。",},  
    [69] = {12123,"御史印碎片3",12123,5,0,8,12120,1,1,1,0,0,0,0,"由朝廷颁发，以白银锻造的官印，是御史官职的身份凭物。",},  
    [70] = {12124,"御史印碎片4",12124,5,0,8,12120,1,1,1,0,0,0,0,"由朝廷颁发，以白银锻造的官印，是御史官职的身份凭物。",},  
    [71] = {12211,"将军印碎片1",12211,6,0,8,12210,1,1,1,0,0,0,0,"由名匠使用黄金精工雕琢而成，由皇帝下旨颁发，为大将军身份象征、",},  
    [72] = {12212,"将军印碎片2",12212,6,0,8,12210,1,1,1,0,0,0,0,"由名匠使用黄金精工雕琢而成，由皇帝下旨颁发，为大将军身份象征、",},  
    [73] = {12213,"将军印碎片3",12213,6,0,8,12210,1,1,1,0,0,0,0,"由名匠使用黄金精工雕琢而成，由皇帝下旨颁发，为大将军身份象征、",},  
    [74] = {12214,"将军印碎片4",12214,6,0,8,12210,1,1,1,0,0,0,0,"由名匠使用黄金精工雕琢而成，由皇帝下旨颁发，为大将军身份象征、",},  
    [75] = {12215,"将军印碎片5",12215,6,0,8,12210,1,1,1,0,0,0,0,"由名匠使用黄金精工雕琢而成，由皇帝下旨颁发，为大将军身份象征、",},  
    [76] = {12321,"丞相印碎片1",12321,6,0,8,12320,1,1,1,0,0,0,0,"由皇帝下旨制造并颁发，名匠用黄金白银加工而成，为丞相的身份象征、",},  
    [77] = {12322,"丞相印碎片2",12322,6,0,8,12320,1,1,1,0,0,0,0,"由皇帝下旨制造并颁发，名匠用黄金白银加工而成，为丞相的身份象征、",},  
    [78] = {12323,"丞相印碎片3",12323,6,0,8,12320,1,1,1,0,0,0,0,"由皇帝下旨制造并颁发，名匠用黄金白银加工而成，为丞相的身份象征、",},  
    [79] = {12324,"丞相印碎片4",12324,6,0,8,12320,1,1,1,0,0,0,0,"由皇帝下旨制造并颁发，名匠用黄金白银加工而成，为丞相的身份象征、",},  
    [80] = {12325,"丞相印碎片5",12325,6,0,8,12320,1,1,1,0,0,0,0,"由皇帝下旨制造并颁发，名匠用黄金白银加工而成，为丞相的身份象征、",},  
    [81] = {13011,"鱼符碎片1",13011,4,0,8,13010,1,1,1,0,0,0,0,"工匠以白玉为材，雕琢为鱼造型的宝符，可用于宝物强化，提供1000点经验",},  
    [82] = {13012,"鱼符碎片2",13012,4,0,8,13010,1,1,1,0,0,0,0,"工匠以白玉为材，雕琢为鱼造型的宝符，可用于宝物强化，提供1000点经验",},  
    [83] = {13013,"鱼符碎片3",13013,4,0,8,13010,1,1,1,0,0,0,0,"工匠以白玉为材，雕琢为鱼造型的宝符，可用于宝物强化，提供1000点经验",},  
    [84] = {13021,"雀符碎片1",13021,5,0,8,13020,1,1,1,0,0,0,0,"道士以绿玉为材，雕琢为飞雀造型的宝符，可用于宝物强化，提供2000点经验",},  
    [85] = {13022,"雀符碎片2",13022,5,0,8,13020,1,1,1,0,0,0,0,"道士以绿玉为材，雕琢为飞雀造型的宝符，可用于宝物强化，提供2000点经验",},  
    [86] = {13023,"雀符碎片3",13023,5,0,8,13020,1,1,1,0,0,0,0,"道士以绿玉为材，雕琢为飞雀造型的宝符，可用于宝物强化，提供2000点经验",},  
    [87] = {13024,"雀符碎片4",13024,5,0,8,13020,1,1,1,0,0,0,0,"道士以绿玉为材，雕琢为飞雀造型的宝符，可用于宝物强化，提供2000点经验",},  
    [88] = {13031,"虎符碎片1",13031,6,0,8,13030,1,1,1,0,0,0,0,"名匠以美玉为材，雕琢成猛虎造型的的宝符，可用于宝物强化，提供5000点经验",},  
    [89] = {13032,"虎符碎片2",13032,6,0,8,13030,1,1,1,0,0,0,0,"名匠以美玉为材，雕琢成猛虎造型的的宝符，可用于宝物强化，提供5000点经验",},  
    [90] = {13033,"虎符碎片3",13033,6,0,8,13030,1,1,1,0,0,0,0,"名匠以美玉为材，雕琢成猛虎造型的的宝符，可用于宝物强化，提供5000点经验",},  
    [91] = {13034,"虎符碎片4",13034,6,0,8,13030,1,1,1,0,0,0,0,"名匠以美玉为材，雕琢成猛虎造型的的宝符，可用于宝物强化，提供5000点经验",},  
    [92] = {13035,"虎符碎片5",13035,6,0,8,13030,1,1,1,0,0,0,0,"名匠以美玉为材，雕琢成猛虎造型的的宝符，可用于宝物强化，提供5000点经验",},  
    [93] = {14011,"墨麟符碎片1",14011,7,0,8,14010,1,1,1,0,0,0,0,"沉甸甸的墨麒麟，是将红色攻击宝物铸炼成金色的必备之物。",},  
    [94] = {14012,"墨麟符碎片2",14012,7,0,8,14010,1,1,1,0,0,0,0,"沉甸甸的墨麒麟，是将红色攻击宝物铸炼成金色的必备之物。",},  
    [95] = {14013,"墨麟符碎片3",14013,7,0,8,14010,1,1,1,0,0,0,0,"沉甸甸的墨麒麟，是将红色攻击宝物铸炼成金色的必备之物。",},  
    [96] = {14014,"墨麟符碎片4",14014,7,0,8,14010,1,1,1,0,0,0,0,"沉甸甸的墨麒麟，是将红色攻击宝物铸炼成金色的必备之物。",},  
    [97] = {14015,"墨麟符碎片5",14015,7,0,8,14010,1,1,1,0,0,0,0,"沉甸甸的墨麒麟，是将红色攻击宝物铸炼成金色的必备之物。",},  
    [98] = {14021,"白麟符碎片1",14021,7,0,8,14020,1,1,1,0,0,0,0,"沉甸甸的白麒麟，是将红色防御宝物铸炼成金色的必备之物。",},  
    [99] = {14022,"白麟符碎片2",14022,7,0,8,14020,1,1,1,0,0,0,0,"沉甸甸的白麒麟，是将红色防御宝物铸炼成金色的必备之物。",},  
    [100] = {14023,"白麟符碎片3",14023,7,0,8,14020,1,1,1,0,0,0,0,"沉甸甸的白麒麟，是将红色防御宝物铸炼成金色的必备之物。",},  
    [101] = {14024,"白麟符碎片4",14024,7,0,8,14020,1,1,1,0,0,0,0,"沉甸甸的白麒麟，是将红色防御宝物铸炼成金色的必备之物。",},  
    [102] = {14025,"白麟符碎片5",14025,7,0,8,14020,1,1,1,0,0,0,0,"沉甸甸的白麒麟，是将红色防御宝物铸炼成金色的必备之物。",},  
    [103] = {21010,"定军刀碎片",21010,5,0,14,1010,20,0,1,1,1,28,75,"收集20个可以合成定军刀",},  
    [104] = {21020,"曲燕碎片",21020,4,0,14,1020,10,0,1,1,1,28,75,"收集10个可以合成曲燕",},  
    [105] = {22010,"霸王手戟碎片",22010,6,0,14,2010,80,0,1,1,1,28,150,"收集80个可以合成霸王手戟",},  
    [106] = {22020,"松纹古锭刀碎片",22020,6,0,14,2020,80,0,1,1,1,28,150,"收集80个可以合成松纹古锭刀",},  
    [107] = {22030,"雌雄双股剑碎片",22030,6,0,14,2030,80,0,1,1,1,28,150,"收集80个可以合成雌雄双股剑",},  
    [108] = {22040,"诸葛连弩碎片",22040,6,0,14,2040,80,0,1,1,1,28,150,"收集80个可以合成诸葛连弩",},  
    [109] = {22050,"墨羽扇碎片",22050,6,0,14,2050,80,0,1,1,1,28,150,"收集80个可以合成墨羽扇",},  
    [110] = {22060,"火云剑碎片",22060,6,0,14,2060,80,0,1,1,1,28,150,"收集80个可以合成火云剑",},  
    [111] = {23010,"丈八蛇矛碎片",23010,7,0,14,3010,100,0,1,1,1,28,300,"收集100个可以合成丈八蛇矛",},  
    [112] = {23020,"龙胆亮银枪碎片",23020,7,0,14,3020,100,0,1,1,1,28,300,"收集100个可以合成龙胆亮银枪",},  
    [113] = {23030,"青釭剑碎片",23030,7,0,14,3030,100,0,1,1,1,28,300,"收集100个可以合成青釭剑",},  
    [114] = {23040,"七星宝刀碎片",23040,7,1,14,3040,100,0,1,1,1,28,300,"收集100个可以合成七星宝刀",},  
    [115] = {23050,"闭月团扇碎片",23050,7,0,14,3050,100,0,1,1,1,28,300,"收集100个可以合成闭月团扇",},  
    [116] = {23060,"苍叶绿绮琴碎片",23060,7,0,14,3060,100,0,1,1,1,28,300,"收集100个可以合成苍叶绿绮琴",},  
    [117] = {40010,"红颜符碎片",1,4,0,5,40010,10,0,1,0,0,0,0,"收集10个可合成红颜兵符",},  
    [118] = {40020,"凤鸣符碎片",1,4,0,5,40020,10,0,1,0,0,0,0,"收集10个可合成凤鸣兵符",},  
    [119] = {40030,"战象符碎片",1,4,0,5,40030,10,0,1,0,0,0,0,"收集10个可合成战象兵符",},  
    [120] = {40040,"撼天符碎片",1,5,0,5,40040,20,0,1,0,0,0,0,"收集20个可合成撼天兵符",},  
    [121] = {40050,"双轮符碎片",1,5,0,5,40050,20,0,1,0,0,0,0,"收集20个可合成双轮兵符",},  
    [122] = {40060,"冰封符碎片",1,5,0,5,40060,20,0,1,0,0,0,0,"收集20个可合成冰封兵符",},  
    [123] = {40070,"截江符碎片",1,5,0,5,40070,20,0,1,0,0,0,0,"收集20个可合成截江兵符",},  
    [124] = {40080,"雷霆符碎片",1,5,0,5,40080,20,0,1,0,0,0,0,"收集20个可合成雷霆兵符",},  
    [125] = {40090,"狂熊符碎片",1,5,0,5,40090,20,0,1,0,0,0,0,"收集20个可合成狂熊兵符",},  
    [126] = {40100,"地刺符碎片",1,5,0,5,40100,20,0,1,0,0,0,0,"收集20个可合成地刺兵符",},  
    [127] = {40110,"悍勇符碎片",1,5,0,5,40110,20,0,1,0,0,0,0,"收集20个可合成悍勇兵符",},  
    [128] = {50010,"寒冰裂符碎片",1,6,0,5,50010,60,0,1,0,0,0,0,"收集60个可合成寒冰裂兵符",},  
    [129] = {50020,"枪剑合符碎片",1,6,0,5,50020,60,0,1,0,0,0,0,"收集60个可合成枪剑合兵符",},  
    [130] = {50030,"万箭发符碎片",1,6,0,5,50030,60,0,1,0,0,0,0,"收集60个可合成万箭发兵符",},  
    [131] = {50040,"巨刃斩符碎片",1,6,0,5,50040,60,0,1,0,0,0,0,"收集60个可合成巨刃斩兵符",},  
    [132] = {50050,"救苍生符碎片",1,6,0,5,50050,60,0,1,0,0,0,0,"收集60个可合成救苍生兵符",},  
    [133] = {50060,"雷龙暴符碎片",1,6,0,5,50060,60,0,1,0,0,0,0,"收集60个可合成雷龙暴兵符",},  
    [134] = {50070,"豪情志符碎片",1,6,0,5,50070,60,0,1,0,0,0,0,"收集60个可合成豪情志兵符",},  
    [135] = {50080,"铁蹄踏符碎片",1,6,0,5,50080,60,0,1,0,0,0,0,"收集60个可合成铁蹄踏兵符",},  
    [136] = {50090,"皓月明符碎片",1,6,0,5,50090,60,0,1,0,0,0,0,"收集60个可合成皓月明兵符",},  
    [137] = {50100,"荼毒咒符碎片",1,6,0,5,50100,60,0,1,0,0,0,0,"收集60个可合成荼毒咒兵符",},  
    [138] = {50110,"火蛇舞符碎片",1,6,0,5,50110,60,0,1,0,0,0,0,"收集60个可合成火蛇舞兵符",},  
    [139] = {50120,"双骄媚符碎片",1,6,0,5,50120,60,0,1,0,0,0,0,"收集60个可合成双骄媚兵符",},  
    [140] = {50130,"虎骑冲符碎片",1,6,0,5,50130,60,0,1,0,0,0,0,"收集60个可合成虎骑冲兵符",},  
    [141] = {50140,"双凤鸣符碎片",1,6,0,5,50140,60,0,1,0,0,0,0,"收集60个可合成双凤鸣兵符",},  
    [142] = {50150,"山崩地裂符碎片",1,7,0,5,50150,100,0,1,0,0,0,0,"收集100个可合成山崩地裂兵符",},  
    [143] = {50160,"月影蝶舞符碎片",1,7,0,5,50160,100,0,1,0,0,0,0,"收集100个可合成月影蝶舞兵符",},  
    [144] = {50170,"魔灵咆哮符碎片",1,7,0,5,50170,100,0,1,0,0,0,0,"收集100个可合成魔灵咆哮兵符",},  
    [145] = {50180,"神勇无双符碎片",1,7,0,5,50180,100,0,1,0,0,0,0,"收集100个可合成神勇无双兵符",},  
    [146] = {50190,"落子天下符碎片",1,7,0,5,50190,100,0,1,0,0,0,0,"收集100个可合成落子天下兵符",},  
    [147] = {50200,"木鸢乘风符碎片",1,7,0,5,50200,100,0,1,0,0,0,0,"收集100个可合成木鸢乘风兵符",},  
    [148] = {50210,"霸王横江符碎片",1,7,0,5,50210,100,0,1,0,0,0,0,"收集100个可合成霸王横江兵符",},  
    [149] = {50220,"紫霄天劫符碎片",1,7,0,5,50220,100,0,1,0,0,0,0,"收集100个可合成紫霄天劫兵符",},  
    [150] = {50230,"龙啸九州符碎片",1,7,0,5,50230,100,0,1,0,0,0,0,"收集100个可合成龙啸九州兵符",},  
    [151] = {50240,"神魔焚天符碎片",1,7,0,5,50240,100,0,1,0,0,0,0,"收集100个可合成神魔焚天兵符",},  
    [152] = {400010,"于禁碎片",600070,5,0,4,400010,30,0,1,1,1,16,45,"收集30个碎片可合成于禁",},  
    [153] = {400020,"曹丕碎片",600070,5,0,4,400020,30,0,1,1,1,16,45,"收集30个碎片可合成曹丕",},  
    [154] = {400030,"乐进碎片",600070,5,0,4,400030,30,0,1,1,1,16,45,"收集30个碎片可合成乐进",},  
    [155] = {400040,"庞德碎片",600070,5,0,4,400040,30,0,1,1,1,16,45,"收集30个碎片可合成庞德",},  
    [156] = {400050,"步练师碎片",500130,5,0,4,400050,30,0,1,1,1,16,45,"收集30个碎片可合成步练师",},  
    [157] = {400060,"孟获碎片",600070,4,0,4,400060,10,0,1,1,1,16,45,"收集10个碎片可合成孟获",},  
    [158] = {400070,"祝融碎片",500130,4,0,4,400070,10,0,1,1,1,16,45,"收集10个碎片可合成祝融",},  
    [159] = {400080,"法正碎片",600070,5,0,4,400080,30,0,1,1,1,16,45,"收集30个碎片可合成法正",},  
    [160] = {400090,"程普碎片",600070,5,0,4,400090,30,0,1,1,1,16,45,"收集30个碎片可合成程普",},  
    [161] = {400100,"周泰碎片",600070,5,0,4,400100,30,0,1,1,1,16,45,"收集30个碎片可合成周泰",},  
    [162] = {400110,"黄盖碎片",600070,5,0,4,400110,30,0,1,1,1,16,45,"收集30个碎片可合成黄盖",},  
    [163] = {400120,"徐盛碎片",600070,5,0,4,400120,30,0,1,1,1,16,45,"收集30个碎片可合成徐盛",},  
    [164] = {400130,"孙尚香碎片",500130,4,0,4,400130,10,0,1,1,1,16,45,"收集10个碎片可合成孙尚香",},  
    [165] = {400140,"颜良碎片",600070,5,0,4,400140,30,0,1,1,1,16,45,"收集30个碎片可合成颜良",},  
    [166] = {400150,"文丑碎片",600070,5,0,4,400150,30,0,1,1,1,16,45,"收集30个碎片可合成文丑",},  
    [167] = {400160,"陈宫碎片",600070,5,0,4,400160,30,0,1,1,1,16,45,"收集30个碎片可合成陈宫",},  
    [168] = {500010,"甄姬碎片",500130,6,0,4,500010,80,0,1,1,1,16,45,"收集80个碎片可合成甄姬",},  
    [169] = {500020,"张辽碎片",600070,6,0,4,500020,80,0,1,1,1,16,45,"收集80个碎片可合成张辽",},  
    [170] = {500030,"许褚碎片",600070,6,0,4,500030,80,0,1,1,1,16,45,"收集80个碎片可合成许褚",},  
    [171] = {500040,"夏侯惇碎片",600070,6,0,4,500040,80,0,1,1,1,16,45,"收集80个碎片可合成夏侯惇",},  
    [172] = {500050,"夏侯渊碎片",600070,6,0,4,500050,80,0,1,1,1,16,45,"收集80个碎片可合成夏侯渊",},  
    [173] = {500060,"张郃碎片",600070,6,0,4,500060,80,0,1,1,1,16,45,"收集80个碎片可合成张郃",},  
    [174] = {500070,"庞统碎片",600070,6,0,4,500070,80,0,1,1,1,16,45,"收集80个碎片可合成庞统",},  
    [175] = {500080,"张飞碎片",600070,6,0,4,500080,80,0,1,1,1,16,45,"收集80个碎片可合成张飞",},  
    [176] = {500090,"黄忠碎片",600070,6,0,4,500090,80,0,1,1,1,16,45,"收集80个碎片可合成黄忠",},  
    [177] = {500100,"魏延碎片",600070,6,0,4,500100,80,0,1,1,1,16,45,"收集80个碎片可合成魏延",},  
    [178] = {500110,"马超碎片",600070,7,0,4,500110,120,0,1,1,1,16,300,"收集120个碎片可合成马超",},  
    [179] = {500120,"姜维碎片",600070,6,0,4,500120,80,0,1,1,1,16,45,"收集80个碎片可合成姜维",},  
    [180] = {500130,"大乔碎片",600070,6,0,4,500130,80,0,1,1,1,16,45,"收集80个碎片可合成大乔",},  
    [181] = {500140,"孙权碎片",600070,6,0,4,500140,80,0,1,1,1,16,45,"收集80个碎片可合成孙权",},  
    [182] = {500150,"孙坚碎片",600070,6,0,4,500150,80,0,1,1,1,16,45,"收集80个碎片可合成孙坚",},  
    [183] = {500160,"吕蒙碎片",600070,6,0,4,500160,80,0,1,1,1,16,45,"收集80个碎片可合成吕蒙",},  
    [184] = {500170,"太史慈碎片",600070,6,0,4,500170,80,0,1,1,1,16,45,"收集80个碎片可合成太史慈",},  
    [185] = {500180,"鲁肃碎片",600070,6,0,4,500180,80,0,1,1,1,16,45,"收集80个碎片可合成鲁肃",},  
    [186] = {500190,"华佗碎片",600070,6,0,4,500190,80,0,1,1,1,16,45,"收集80个碎片可合成华佗",},  
    [187] = {500200,"袁绍碎片",600070,6,0,4,500200,80,0,1,1,1,16,45,"收集80个碎片可合成袁绍",},  
    [188] = {500210,"于吉碎片",600070,6,0,4,500210,80,0,1,1,1,16,45,"收集80个碎片可合成于吉",},  
    [189] = {500220,"华雄碎片",600070,6,0,4,500220,80,0,1,1,1,16,45,"收集80个碎片可合成华雄",},  
    [190] = {500230,"董卓碎片",600070,6,0,4,500230,80,0,1,1,1,16,45,"收集80个碎片可合成董卓",},  
    [191] = {500240,"公孙瓒碎片",600070,6,0,4,500240,80,0,1,1,1,16,45,"收集80个碎片可合成公孙瓒",},  
    [192] = {510010,"郭嘉碎片",600070,7,0,4,510010,120,0,1,1,1,16,300,"收集120个碎片可合成郭嘉",},  
    [193] = {510020,"典韦碎片",600070,7,0,4,510020,120,0,1,1,1,16,300,"收集120个碎片可合成典韦",},  
    [194] = {510030,"刘备碎片",600070,7,0,4,510030,120,0,1,1,1,16,300,"收集120个碎片可合成刘备",},  
    [195] = {510040,"赵云碎片",600070,6,0,4,510040,80,0,1,1,1,16,45,"收集80个碎片可合成赵云",},  
    [196] = {510050,"陆逊碎片",600070,7,0,4,510050,120,0,1,1,1,16,300,"收集120个碎片可合成陆逊",},  
    [197] = {510060,"小乔碎片",500130,7,0,4,510060,120,0,1,1,1,16,300,"收集120个碎片可合成小乔",},  
    [198] = {510070,"贾诩碎片",600070,7,0,4,510070,120,0,1,1,1,16,300,"收集120个碎片可合成贾诩",},  
    [199] = {510080,"貂蝉碎片",500130,7,0,4,510080,120,0,1,1,1,16,300,"收集120个碎片可合成貂蝉",},  
    [200] = {600010,"曹操碎片",600070,7,1,4,600010,120,0,1,1,1,16,300,"收集120个碎片可合成曹操",},  
    [201] = {600020,"司马懿碎片",600070,7,0,4,600020,120,0,1,1,1,16,300,"收集120个碎片可合成司马懿",},  
    [202] = {600030,"诸葛亮碎片",600030,7,0,4,600030,120,0,1,1,1,16,300,"收集120个碎片可合成诸葛亮",},  
    [203] = {600040,"关羽碎片",600070,7,1,4,600040,120,0,1,1,1,16,300,"收集120个碎片可合成关羽",},  
    [204] = {600050,"孙策碎片",600050,7,0,4,600050,120,0,1,1,1,16,300,"收集120个碎片可合成孙策",},  
    [205] = {600060,"周瑜碎片",600070,7,1,4,600060,120,0,1,1,1,16,300,"收集120个碎片可合成周瑜",},  
    [206] = {600070,"吕布碎片",600070,7,1,4,600070,120,0,1,1,1,16,300,"收集120个碎片可合成吕布",},  
    [207] = {600080,"张角碎片",600080,7,0,4,600080,120,0,1,1,1,16,300,"收集120个碎片可合成张角",},  
    [208] = {600090,"黄月英碎片",600090,7,0,4,600090,120,0,1,1,1,16,300,"收集120个碎片可合成黄月英",},  
    [209] = {600100,"甘宁碎片",600100,7,0,4,600100,120,0,1,1,1,16,300,"收集120个碎片可合甘宁",},  
    [210] = {600110,"荀彧碎片",600110,7,0,4,600110,120,0,1,1,1,16,300,"收集120个碎片可合成荀彧",},  
    [211] = {600120,"左慈碎片",600120,7,0,4,600120,120,0,1,1,1,16,300,"收集120个碎片可合成左慈",},  
    [212] = {700010,"曹节碎片",700010,8,0,4,700010,130,0,1,1,1,16,300,"收集130个碎片可合成曹节",},  
    [213] = {700020,"诸葛果碎片",700020,8,0,4,700020,130,0,1,1,1,16,300,"收集130个碎片可合成诸葛果",},  
    [214] = {700030,"孙鲁班碎片",700030,8,0,4,700030,130,0,1,1,1,16,300,"收集130个碎片可合成孙鲁班",},  
    [215] = {700040,"吕玲绮碎片",700040,8,0,4,700040,130,0,1,1,1,16,300,"收集130个碎片可合成吕玲绮",},  
    [216] = {700050,"紫金张辽碎片",700050,8,0,4,700050,130,0,0,1,1,16,300,"收集130个碎片可合成曹节",},  
    [217] = {700060,"紫金姜维碎片",700060,8,0,4,700060,130,0,0,1,1,16,300,"收集130个碎片可合成诸葛果",},  
    [218] = {700070,"紫金太史慈碎片",700070,8,0,4,700070,130,0,0,1,1,16,300,"收集130个碎片可合成孙鲁班",},  
    [219] = {700080,"紫金袁绍碎片",700080,8,0,4,700080,130,0,0,1,1,16,300,"收集130个碎片可合成吕玲绮",},  
    [220] = {15101,"巨猿碎片",413,4,0,17,1010,30,0,1,0,1,42,75,"收集30个碎片合成巨猿",},  
    [221] = {15201,"猞猁碎片",414,5,0,17,2010,50,0,1,0,1,42,75,"收集50个碎片合成猞猁",},  
    [222] = {15301,"机关鸟碎片",421,6,0,17,3010,80,0,1,0,1,42,150,"收集80个碎片合成机关鸟",},  
    [223] = {15302,"机关牛碎片",422,6,0,17,3020,80,0,1,0,1,42,150,"收集80个碎片合成机关牛",},  
    [224] = {15401,"神木青鸾碎片",423,7,0,17,4010,100,0,1,0,1,42,300,"收集100个碎片合成神木青鸾",},  
    [225] = {15402,"撼地灵犀碎片",424,7,0,17,4020,100,0,1,0,1,42,300,"收集100个碎片合成撼地灵犀",},  
    [226] = {15403,"狱火穷奇碎片",423,7,0,17,4030,100,0,1,0,1,42,300,"收集100个碎片合成狱火穷奇",},  
    [227] = {15404,"九天应龙碎片",424,7,1,17,4040,100,0,1,0,1,42,300,"收集100个碎片合成九天应龙",},  
    [228] = {1000001,"雷焰羽毛碎片",105,7,0,3,105,3,0,1,0,0,0,0,"收集3个碎片合成雷焰羽毛",},  
    [229] = {1000002,"冰剑羽毛碎片",104,6,0,3,104,2,0,1,0,0,0,0,"收集2个碎片合成冰剑羽毛",},  
    [230] = {1000003,"金色万能化身符碎片",92,7,0,3,77,2,0,1,0,0,0,0,"收集2个碎片合成金色万能化身符",},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [3] = 3,  
    [4] = 4,  
    [201] = 5,  
    [202] = 6,  
    [203] = 7,  
    [204] = 8,  
    [211] = 9,  
    [212] = 10,  
    [213] = 11,  
    [214] = 12,  
    [301] = 13,  
    [302] = 14,  
    [303] = 15,  
    [304] = 16,  
    [311] = 17,  
    [312] = 18,  
    [313] = 19,  
    [314] = 20,  
    [401] = 21,  
    [402] = 22,  
    [403] = 23,  
    [404] = 24,  
    [411] = 25,  
    [412] = 26,  
    [413] = 27,  
    [414] = 28,  
    [421] = 29,  
    [422] = 30,  
    [423] = 31,  
    [424] = 32,  
    [11011] = 33,  
    [11012] = 34,  
    [11013] = 35,  
    [11021] = 36,  
    [11022] = 37,  
    [11023] = 38,  
    [11111] = 39,  
    [11112] = 40,  
    [11113] = 41,  
    [11114] = 42,  
    [11121] = 43,  
    [11122] = 44,  
    [11123] = 45,  
    [11124] = 46,  
    [11211] = 47,  
    [11212] = 48,  
    [11213] = 49,  
    [11214] = 50,  
    [11215] = 51,  
    [11321] = 52,  
    [11322] = 53,  
    [11323] = 54,  
    [11324] = 55,  
    [11325] = 56,  
    [12011] = 57,  
    [12012] = 58,  
    [12013] = 59,  
    [12021] = 60,  
    [12022] = 61,  
    [12023] = 62,  
    [12111] = 63,  
    [12112] = 64,  
    [12113] = 65,  
    [12114] = 66,  
    [12121] = 67,  
    [12122] = 68,  
    [12123] = 69,  
    [12124] = 70,  
    [12211] = 71,  
    [12212] = 72,  
    [12213] = 73,  
    [12214] = 74,  
    [12215] = 75,  
    [12321] = 76,  
    [12322] = 77,  
    [12323] = 78,  
    [12324] = 79,  
    [12325] = 80,  
    [13011] = 81,  
    [13012] = 82,  
    [13013] = 83,  
    [13021] = 84,  
    [13022] = 85,  
    [13023] = 86,  
    [13024] = 87,  
    [13031] = 88,  
    [13032] = 89,  
    [13033] = 90,  
    [13034] = 91,  
    [13035] = 92,  
    [14011] = 93,  
    [14012] = 94,  
    [14013] = 95,  
    [14014] = 96,  
    [14015] = 97,  
    [14021] = 98,  
    [14022] = 99,  
    [14023] = 100,  
    [14024] = 101,  
    [14025] = 102,  
    [15101] = 220,  
    [15201] = 221,  
    [15301] = 222,  
    [15302] = 223,  
    [15401] = 224,  
    [15402] = 225,  
    [15403] = 226,  
    [15404] = 227,  
    [21010] = 103,  
    [21020] = 104,  
    [22010] = 105,  
    [22020] = 106,  
    [22030] = 107,  
    [22040] = 108,  
    [22050] = 109,  
    [22060] = 110,  
    [23010] = 111,  
    [23020] = 112,  
    [23030] = 113,  
    [23040] = 114,  
    [23050] = 115,  
    [23060] = 116,  
    [40010] = 117,  
    [40020] = 118,  
    [40030] = 119,  
    [40040] = 120,  
    [40050] = 121,  
    [40060] = 122,  
    [40070] = 123,  
    [40080] = 124,  
    [40090] = 125,  
    [40100] = 126,  
    [40110] = 127,  
    [50010] = 128,  
    [50020] = 129,  
    [50030] = 130,  
    [50040] = 131,  
    [50050] = 132,  
    [50060] = 133,  
    [50070] = 134,  
    [50080] = 135,  
    [50090] = 136,  
    [50100] = 137,  
    [50110] = 138,  
    [50120] = 139,  
    [50130] = 140,  
    [50140] = 141,  
    [50150] = 142,  
    [50160] = 143,  
    [50170] = 144,  
    [50180] = 145,  
    [50190] = 146,  
    [50200] = 147,  
    [50210] = 148,  
    [50220] = 149,  
    [50230] = 150,  
    [50240] = 151,  
    [400010] = 152,  
    [400020] = 153,  
    [400030] = 154,  
    [400040] = 155,  
    [400050] = 156,  
    [400060] = 157,  
    [400070] = 158,  
    [400080] = 159,  
    [400090] = 160,  
    [400100] = 161,  
    [400110] = 162,  
    [400120] = 163,  
    [400130] = 164,  
    [400140] = 165,  
    [400150] = 166,  
    [400160] = 167,  
    [500010] = 168,  
    [500020] = 169,  
    [500030] = 170,  
    [500040] = 171,  
    [500050] = 172,  
    [500060] = 173,  
    [500070] = 174,  
    [500080] = 175,  
    [500090] = 176,  
    [500100] = 177,  
    [500110] = 178,  
    [500120] = 179,  
    [500130] = 180,  
    [500140] = 181,  
    [500150] = 182,  
    [500160] = 183,  
    [500170] = 184,  
    [500180] = 185,  
    [500190] = 186,  
    [500200] = 187,  
    [500210] = 188,  
    [500220] = 189,  
    [500230] = 190,  
    [500240] = 191,  
    [510010] = 192,  
    [510020] = 193,  
    [510030] = 194,  
    [510040] = 195,  
    [510050] = 196,  
    [510060] = 197,  
    [510070] = 198,  
    [510080] = 199,  
    [600010] = 200,  
    [600020] = 201,  
    [600030] = 202,  
    [600040] = 203,  
    [600050] = 204,  
    [600060] = 205,  
    [600070] = 206,  
    [600080] = 207,  
    [600090] = 208,  
    [600100] = 209,  
    [600110] = 210,  
    [600120] = 211,  
    [700010] = 212,  
    [700020] = 213,  
    [700030] = 214,  
    [700040] = 215,  
    [700050] = 216,  
    [700060] = 217,  
    [700070] = 218,  
    [700080] = 219,  
    [1000001] = 228,  
    [1000002] = 229,  
    [1000003] = 230,
}

local __key_map = { 
    id = 1,
    name = 2,
    res_id = 3,
    quality = 4,
    rare = 5,
    fragment_type = 6,
    fragment_value = 7,
    combine_num = 8,
    is_combination = 9,
    gm = 10,
    is_sell = 11,
    price_type = 12,
    price_value = 13,
    price_size = 14,
    description = 15,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_fragment_info")

        return t._raw[__key_map[k]]
    end
}


function fragment_info.getLength()
    return #fragment_info._data
end



function fragment_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_fragment_info
function fragment_info.indexOf(index)
    if index == nil or not fragment_info._data[index] then
        return nil
    end
    return setmetatable({_raw = fragment_info._data[index]}, m)
end



---
--@return @class record_fragment_info
function fragment_info.get(id)
    
    return fragment_info.indexOf(__index_id[ id ])
     
end



function fragment_info.set(id, key, value)
    local record = fragment_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function fragment_info.get_index_data()
    return __index_id 
end

return  fragment_info 