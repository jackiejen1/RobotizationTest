---@classdef record_biography_chapter_info
local record_biography_chapter_info = {}


record_biography_chapter_info.id = 0--id
record_biography_chapter_info.name =  ""--章节名称
record_biography_chapter_info.if_open = 0--板块是否开启
record_biography_chapter_info.dungeon_chapter_open = 0--主线章节开启
record_biography_chapter_info.land_id = 0--所属版块
record_biography_chapter_info.stage_map = 0--关卡地图文件
record_biography_chapter_info.ctrl_id = 0--关卡地图配置
record_biography_chapter_info.story = 0--关卡初始剧情
record_biography_chapter_info.chapter_clear =  ""--传记通关描述
record_biography_chapter_info.base_id = 0--章节头像
record_biography_chapter_info.chapter_story =  ""--章节剧情
record_biography_chapter_info.mission_chain_main = 0--主线任务链
record_biography_chapter_info.mission_chain_branch_1 = 0--支线任务链1
record_biography_chapter_info.mission_chain_branch_2 = 0--支线任务链2
record_biography_chapter_info.mission_chain_branch_3 = 0--支线任务链3
record_biography_chapter_info.mission_chain_branch_4 = 0--支线任务链4
record_biography_chapter_info.mission_chain_branch_5 = 0--支线任务链5
record_biography_chapter_info.mission_chain_branch_6 = 0--支线任务链6
record_biography_chapter_info.mission_chain_branch_7 = 0--支线任务链7
record_biography_chapter_info.mission_chain_branch_8 = 0--支线任务链8
record_biography_chapter_info.mission_chain_branch_9 = 0--支线任务链9
record_biography_chapter_info.mission_chain_branch_10 = 0--支线任务链10
record_biography_chapter_info.branch_target = 0--支线任务进度奖励值
record_biography_chapter_info.branch_reward = 0--支线任务进度奖励
record_biography_chapter_info.scroll_num = 0--通关残卷数量
record_biography_chapter_info.BOSS_position_X_1 = 0--BOSS坐标1X
record_biography_chapter_info.BOSS_position_Y_1 = 0--BOSS坐标1Y
record_biography_chapter_info.BOSS_position_X_2 = 0--BOSS坐标2X
record_biography_chapter_info.BOSS_position_Y_2 = 0--BOSS坐标2Y
record_biography_chapter_info.story_npc_X = 0--水镜先生坐标X
record_biography_chapter_info.story_npc_Y = 0--水镜先生坐标Y
record_biography_chapter_info.finish_award_type = 0--通关章节奖励类型
record_biography_chapter_info.finish_award_value = 0--通关章节奖励类型值
record_biography_chapter_info.finish_award_size = 0--通关章节奖励数量

local biography_chapter_info = {
   _data = {   
    [1] = {1,"刘备传",1,3,1,1002,1002,72,"刘关张三人涿县相逢，桃园结义，这是历史上的一段传奇，也开启了三国名将的华丽篇章。",510030,"新传记开启，将军，您将融入刘备之魂，体验名将刘备的喜怒哀乐吧！",1001,1101,1201,1301,0,0,0,0,0,0,0,10,1,1,742,325,742,325,1924,377,2,40070,5,},  
    [2] = {2,"关羽传",1,5,1,7,7,83,"关羽帮助曹操斩颜良，诛文丑，得知大哥刘备消息后，毅然放弃荣华富贵，挂印封金而去。这段佳话久久被后人传诵。",300310,"新传记开启，将军，您将融入关羽之魂，体验名将关羽的喜怒哀乐吧！",2001,2101,2201,2301,0,0,0,0,0,0,0,10,1,1,1595,614,1595,614,2208,1021,2,40070,5,},  
    [3] = {3,"张飞传",1,7,1,8,8,82,"张飞在当阳桥之战中，智勇双全，用疑兵计骗过曹操，在当阳桥上呵退百万大军，一战成名，从此后，曹军上下无有不知张翼德之名的人。",500080,"新传记开启，将军，您将融入张飞之魂，体验名将张飞的喜怒哀乐吧！",3001,3101,3201,3301,0,0,0,0,0,0,0,10,1,1,2120,564,2120,564,1975,244,2,40070,10,},  
    [4] = {4,"赵云传",1,9,2,6004,6004,281,"赵云忠肝义胆，在长坂坡七进七出，杀的曹军望风丧胆，救出少主刘禅，立下不世功劳，常山赵子龙，在三国中创下赫赫威名。",510040,"新传记开启，将军，您将融入赵云之魂，体验名将赵云的喜怒哀乐吧！",4001,4101,4201,4301,0,0,0,0,0,0,0,10,1,1,379,439,379,439,881,1103,1,16,500,},  
    [5] = {5,"孙策传",1,11,2,4005,4005,279,"孙策继承其父遗志，揽江东英才，携小霸王之名，荡平江东，为东吴的建立打下基础，可以说，没有孙策，就没有东吴。",600050,"新传记开启，将军，您将融入孙策之魂，体验名将孙策的喜怒哀乐吧！",5001,5101,5201,5301,0,0,0,0,0,0,0,10,1,1,1283,296,1283,296,571,682,1,16,500,},  
    [6] = {6,"周瑜传",1,13,2,5003,5003,280,"周瑜与孙策同为江东双壁，随孙策征战江东的过程中，相遇一生挚爱小乔，英雄与美人，是这乱世永恒的话题。",600060,"新传记开启，将军，您将融入周瑜之魂，体验名将周瑜的喜怒哀乐吧！",6001,6101,6201,6301,0,0,0,0,0,0,0,10,1,1,541,386,541,386,579,942,1,16,500,},  
    [7] = {7,"郭嘉传",1,15,2,7001,1004,123,"曹操围攻吕布几次不得，想放弃，郭嘉四处调查情况后，最终向曹操提出建议，围三放一水淹下邳，最终击败并活抓吕布。",510010,"新传记开启，将军，您将融入郭嘉之魂，体验名将郭嘉的喜怒哀乐吧！",7001,7101,7201,7301,0,0,0,0,0,0,0,10,1,1,1169,658,1169,658,1068,282,1,16,500,},  
    [8] = {8,"孙尚香传",1,17,3,8005,8005,600,"孙尚香返回东吴，帮助其兄孙权在江东站稳脚跟，而是从此留在江东，还是继续追求梦想，成为孙尚香的一道难题。",400130,"新传记开启，将军，您将融入孙尚香之魂，体验名将孙尚香的喜怒哀乐吧！",8001,8101,8201,8301,0,0,0,0,0,0,0,10,1,1,707,244,707,244,409,741,1,16,500,},  
    [9] = {9,"步练师传",1,19,3,9004,9004,601,"步练师在逍遥津之战，以自身为饵，帮助孙权突围，连张辽都称赞步练师为女中豪杰，巾帼英雄。",400050,"新传记开启，将军，您将融入步练师之魂，体验名将步练师的喜怒哀乐吧！",9001,9101,9201,9301,0,0,0,0,0,0,0,10,1,1,829,325,829,325,2209,283,1,16,500,},  
    [10] = {10,"大乔传",1,21,3,10002,10002,603,"大乔在其夫孙策遇害后立誓要为他报仇，她经过一番调查得知，原来刺杀孙策的主谋是曹操和郭嘉，她决定北上许昌，为孙策报仇。",500130,"新传记开启，将军，您将融入大乔之魂，体验名将大乔的喜怒哀乐吧！",10001,10101,10201,10301,0,0,0,0,0,0,0,10,1,1,632,499,632,499,810,258,1,16,500,},  
    [11] = {11,"甄姬传",1,23,3,11007,11007,602,"袁熙战败，邺城被曹军占领，甄姬在出逃的过程中碰到曹丕，一向强势的她选择相信曹丕，相信这个男人可以保护自己。",500010,"新传记开启，将军，您将融入甄姬之魂，体验名将甄姬的喜怒哀乐吧！",11001,11101,11201,11301,0,0,0,0,0,0,0,10,1,1,1735,1033,1735,1033,848,1108,1,16,500,},  
    [12] = {12,"貂蝉传",1,25,3,1203,1203,143,"貂蝉决定帮助义父王允击杀董卓，于是分别约见吕布与董卓，并引起二人矛盾，让二人因为自己而翻脸。",510080,"新传记开启，将军，您将融入貂蝉之魂，体验名将貂蝉的喜怒哀乐吧！",12001,12101,12201,12301,0,0,0,0,0,0,0,10,1,1,1113,763,1113,763,887,226,1,16,500,},  
    [13] = {13,"曹操传",1,27,4,201,201,75,"曹操找王允借七星宝刀，准备去刺杀董卓，谁知董卓半路发觉，曹操假借比武与他打了一架，事后献刀，随后跑路。",300280,"新传记开启，将军，您将融入曹操之魂，体验名将曹操的喜怒哀乐吧！",13001,13101,13201,13301,0,0,0,0,0,0,0,10,1,1,935,395,935,395,607,286,1,16,500,},  
    [14] = {14,"董卓传",1,29,4,303,303,81,"董卓在崇德前殿召集百官继续商议废立皇帝之事，接着又威逼何太后下诏废少帝，汉少帝从此被废，陈留王刘协即位，是为汉献帝。",500230,"新传记开启，将军，您将融入董卓之魂，体验名将董卓的喜怒哀乐吧！",14001,14101,14201,14301,0,0,0,0,0,0,0,10,1,1,370,800,370,800,1100,1229,1,16,500,},  
    [15] = {15,"袁绍传",1,31,4,804,804,105,"袁绍与公孙瓒在界桥开战，他让麹义埋伏死士在旁，通过自己为诱饵引得公孙瓒率将来袭，最终公孙瓒陷入埋伏，若非赵云相救，差点被袁绍所杀。",500200,"新传记开启，将军，您将融入袁绍之魂，体验名将袁绍的喜怒哀乐吧！",15001,15101,15201,15301,0,0,0,0,0,0,0,10,1,1,925,1130,925,1130,339,1200,1,16,500,},  
    [16] = {16,"孙坚传",1,33,4,903,903,113,"孙坚击败李傕郭汜和董卓，灭掉宫殿大火，最终残破的洛阳城中找到失落的玉玺，在程普解释下他野心大涨，决定私吞玉玺。",500150,"新传记开启，将军，您将融入孙坚之魂，体验名将孙坚的喜怒哀乐吧！",16001,16101,16201,16301,0,0,0,0,0,0,0,10,1,1,1727,887,1727,887,887,226,1,16,500,},  
    [17] = {17,"吕布传",1,35,4,17007,17007,85,"吕布击败公孙瓒，随后张飞、关羽、刘备皆来袭，全部被吕布抵挡住，最后袁绍无耻派武将进攻，吕布从容退走。",300340,"新传记开启，将军，您将融入吕布之魂，体验名将吕布的喜怒哀乐吧！",17001,17101,17201,17301,0,0,0,0,0,0,0,10,1,1,1793,990,1793,990,2292,860,1,16,500,},  
    [18] = {18,"典韦传",1,37,5,18003,18003,604,"典韦在宛城之战中为曹操殿后，与无数张绣的将领士兵厮杀，浴血奋战，以自己的性命换来曹操的安全。",510020,"新传记开启，将军，您将融入典韦之魂，体验名将典韦的喜怒哀乐吧！",18001,18101,18201,18301,0,0,0,0,0,0,0,10,1,1,1556,1041,1556,1041,872,270,1,16,500,},  
    [19] = {19,"张辽传",1,39,5,19004,19004,605,"张辽在逍遥津，率八百勇士冲进孙权十万军中，以背水一战，置之死地而后生的精神大破东吴大军，威震逍遥津。",500020,"新传记开启，将军，您将融入张辽之魂，体验名将张辽的喜怒哀乐吧！",19001,19101,19201,19301,0,0,0,0,0,0,0,10,1,1,804,332,804,332,711,979,1,16,500,},  
    [20] = {20,"黄忠传",1,41,5,21001,21001,606,"黄忠在花甲之年，请命攻打定军山，用计力克曹军，并一战斩杀名将夏侯渊，凭此战功，列于蜀汉五虎上将之中。",500090,"新传记开启，将军，您将融入黄忠之魂，体验名将黄忠的喜怒哀乐吧！",20001,20101,20201,20301,0,0,0,0,0,0,0,10,1,1,1502,833,1502,833,657,295,1,16,500,},  
    [21] = {21,"马超传",1,43,5,20005,20005,607,"马超兴兵为父报仇，在渭水之战大破曹操，杀的曹操割须弃袍，锦马超一战成名，世人皆知，马超之勇，不亚于吕布。",500110,"新传记开启，将军，您将融入马超之魂，体验名将马超的喜怒哀乐吧！",21001,21101,21201,21301,0,0,0,0,0,0,0,10,1,1,1312,329,1312,329,1938,876,1,16,500,},  
    [22] = {22,"黄盖传",1,45,5,22008,22008,608,"黄盖与周瑜定苦肉计，忍受皮肉之苦，骗得曹操相信自己的诈降，点起了赤壁的第一把火，这把火彻底烧灭了曹操一统天下的野心。",400110,"新传记开启，将军，您将融入黄盖之魂，体验名将黄盖的喜怒哀乐吧！",22001,22101,22201,22301,0,0,0,0,0,0,0,10,1,1,1839,1125,1839,1125,1986,288,1,16,500,},  
    [23] = {23,"鲁肃传",1,47,6,23005,23005,609,"鲁肃为讨要荆州，前往蜀军领地，独自面对天下名将关羽，他毫无惧色，不卑不亢，从关羽手中讨回半个荆州。",500180,"新传记开启，将军，您将融入鲁肃之魂，体验名将鲁肃的喜怒哀乐吧！",23001,23101,23201,23301,0,0,0,0,0,0,0,10,1,1,793,310,793,310,1384,1136,1,16,500,},  
    [24] = {24,"陆逊传",1,49,6,24008,24008,626,"陆逊临危受命，被孙权拜为大都督，他亲赴前线，威伏重将，并在夷陵火烧八百里连营，大破刘备，拯救了东吴。",510050,"新传记开启，将军，您将融入陆逊之魂，体验名将陆逊的喜怒哀乐吧！",24001,24101,24201,24301,0,0,0,0,0,0,0,10,1,1,746,494,746,494,605,320,1,16,500,},  
    [25] = {25,"陈宫传",1,51,6,25001,25001,646,"陈宫在辅佐吕布后，凭一张利嘴，说服曹操旧部反叛，率领人马占据兖州，使吕布从一个光杆司令摇身变为有实力争夺天下的群雄之一。",400160,"新传记开启，将军，您将融入陈宫之魂，体验名将陈宫的喜怒哀乐吧！",25001,25101,25201,25301,0,0,0,0,0,0,0,10,1,1,1402,723,1402,723,1625,504,1,16,500,},  
    [26] = {26,"庞统传",1,53,6,26003,26003,659,"庞统在赤壁大战之际，为救江东百姓，摒弃和东吴的私怨，入曹营献连环计使得曹操铁索连船，为赤壁的大火立下了汗马功劳。",500070,"新传记开启，将军，您将融入庞统之魂，体验名将庞统的喜怒哀乐吧！",26001,26101,26201,26301,0,0,0,0,0,0,0,10,1,1,1429,806,1429,806,2006,287,1,16,500,},  
    [27] = {27,"诸葛亮传",1,55,6,27004,27004,675,"诸葛亮刚刚出山就碰到曹操大将夏侯惇的进攻，他用智谋征服了关羽张飞，博望的一把大火也使得卧龙的名号正式出现在天下的争霸中。",300300,"新传记开启，将军，您将融入诸葛亮之魂，体验名将诸葛亮的喜怒哀乐吧！",27001,27101,27201,27301,0,0,0,0,0,0,0,10,1,1,592,404,592,404,2241,296,1,16,500,},  
    [28] = {28,"张角传",1,58,7,28002,28002,688,"张角在东汉末年，号召黄巾教众，掀起了一场动荡天下的起义，但因为消息泄露，被朝廷的各路兵马围剿，惨淡收场。",300350,"新传记开启，将军，您将融入张角之魂，体验名将张角的喜怒哀乐吧！",28001,28101,28201,28301,0,0,0,0,0,0,0,10,1,1,609,521,609,521,404,762,1,16,500,},  
    [29] = {29,"董卓传",1,61,7,29007,29007,697,"董卓本为西凉外臣，因十常侍之乱，被大将军何进请进京勤王，不料进入中原的董卓趁乱谋害了何进，开始露出了他的獠牙。",500230,"新传记开启，将军，您将融入董卓之魂，体验名将董卓的喜怒哀乐吧！",29001,29101,29201,29301,0,0,0,0,0,0,0,10,1,1,388,486,388,486,940,300,1,16,500,},  
    [30] = {30,"吕布传",1,64,7,30001,30001,705,"吕布盘踞中原之时，袁术，刘备，曹操等诸强环绕，他听从陈宫的计策，以个人的勇武和魅力，平息了袁术和刘备的争执，腾出手来对付大敌曹操。",300340,"新传记开启，将军，您将融入吕布之魂，体验名将吕布的喜怒哀乐吧！",30001,30101,30201,30301,0,0,0,0,0,0,0,10,1,1,1004,563,1004,563,764,226,1,16,500,},  
    [31] = {31,"华雄传",1,67,7,31005,31005,717,"华雄是西凉军中首屈一指的猛将，诸侯讨伐董卓期间，战事频起，华雄四处征战，疲惫不堪，他的终曲终将落幕在汜水关。",500220,"新传记开启，将军，您将融入华雄之魂，体验名将华雄的喜怒哀乐吧！",31001,31101,31201,31301,0,0,0,0,0,0,0,10,1,1,1223,423,1223,423,716,603,1,16,500,},  
    [32] = {32,"贾诩传",1,70,7,32003,32003,726,"贾诩天纵奇才，他渴望乱世降临，因为乱世才能给他施展才华的机会，他的前半生一直在辗转，制造祸乱，一展他的鬼才。",510070,"新传记开启，将军，您将融入贾诩之魂，体验名将贾诩的喜怒哀乐吧！",32001,32101,32201,32301,0,0,0,0,0,0,0,10,1,1,953,416,953,416,1732,930,1,16,500,},  
    [33] = {33,"曹操传",1,73,8,33008,33008,758,"太祖率水军南下平定江东，依从庞统之言铁索连船，被周瑜、黄盖用火攻计打败。",300280,"新传记开启，将军，您将融入曹操之魂，体验名将曹操的喜怒哀乐吧！",33001,33101,33201,33301,0,0,0,0,0,0,0,10,1,1,1031,666,1031,666,573,275,1,16,500,},  
    [34] = {34,"曹丕传",1,76,8,34007,34007,940,"曹操设下考验试探曹植和曹丕的秉性。曹丕果断坚毅，顺利通过考验，获得曹操的青睐。",400020,"新传记开启，将军，您将融入曹丕之魂，体验名将曹丕的喜怒哀乐吧！",34001,34101,34201,34301,0,0,0,0,0,0,0,10,1,1,597,405,597,405,1902,1141,1,16,500,},  
    [35] = {35,"司马懿传",1,79,8,35005,35005,789,"渭南一战，诸葛亮准备将司马懿困入上方谷烧死，谁料天降大雨扑灭火灾，司马懿侥幸逃脱。",300290,"新传记开启，将军，您将融入司马懿之魂，体验名将司马懿的喜怒哀乐吧！",35001,35101,35201,35301,0,0,0,0,0,0,0,10,1,1,1810,337,1810,337,848,237,1,16,500,},  
    [36] = {36,"孙权传",1,82,8,36008,36008,805,"曹操攻打濡须坞，孙权以船军围攻曹操水军，俘获三千余人，曹军溺亡数千人，曹操败退。",500140,"新传记开启，将军，您将融入孙权之魂，体验名将孙权的喜怒哀乐吧！",36001,36101,36201,36301,0,0,0,0,0,0,0,10,1,1,972,659,972,659,494,239,1,16,500,},  
    [37] = {37,"刘备传",1,85,8,37003,37003,823,"献帝传衣带诏给刘备，逢曹操宴请刘备。刘备作俯首韬晦，曹操直接指出天下英雄惟他二人。",510030,"新传记开启，将军，您将融入刘备之魂，体验名将刘备的喜怒哀乐吧！",37001,37101,37201,37301,0,0,0,0,0,0,0,10,1,1,1279,583,1279,583,624,917,1,16,500,},  
    [38] = {38,"郭嘉传",1,89,9,38004,38004,842,"袁尚等人逃入乌桓，郭嘉力谏太祖远征乌桓，从而彻底平定北方，而郭嘉因操劳过度病逝。",510010,"新传记开启，将军，您将融入郭嘉之魂，体验名将郭嘉的喜怒哀乐吧！",38001,38101,38201,38301,0,0,0,0,0,0,0,10,1,1,930,950,930,950,2059,384,1,16,500,},  
    [39] = {39,"夏侯惇传",1,93,9,39001,39001,867,"吕布趁太祖征徐州之际偷袭兖州，夏侯惇带军突围，被流箭射中左眼，拔矢啖睛斩曹性。",500040,"新传记开启，将军，您将融入夏侯惇之魂，体验名将夏侯惇的喜怒哀乐吧！",39001,39101,39201,39301,0,0,0,0,0,0,0,10,1,1,747,794,747,794,1621,345,1,16,500,},  
    [40] = {40,"吕蒙传",1,97,9,40008,40008,882,"吕蒙意图谋取荆州，先称病使关羽放松警惕，又带军白衣乔装客商奇袭江陵，关羽败退。",500160,"新传记开启，将军，您将融入吕蒙之魂，体验名将吕蒙的喜怒哀乐吧！",40001,40101,40201,40301,0,0,0,0,0,0,0,10,1,1,971,678,971,678,470,220,1,16,500,},  
    [41] = {41,"张飞传",1,101,9,41007,41007,902,"刘备与刘璋决裂，张飞等人领兵入川增援，生擒江州守将严颜。张飞感严颜豪气，将其释放。",500080,"新传记开启，将军，您将融入张飞之魂，体验名将张飞的喜怒哀乐吧！",41001,41101,41201,41301,0,0,0,0,0,0,0,10,1,1,1534,989,1534,989,653,313,1,16,500,},  
    [42] = {42,"关羽传",1,105,9,42004,42004,920,"关羽离开曹营投奔先主，过五关斩六将。又被夏侯惇所阻，幸而曹操及时赶到，放其离开。",300310,"新传记开启，将军，您将融入关羽之魂，体验名将关羽的喜怒哀乐吧！",42001,42101,42201,42301,0,0,0,0,0,0,0,10,1,1,840,295,840,295,594,887,1,16,500,},  
    [43] = {43,"于吉传",1,110,10,43007,43007,941,"于吉在江东名气盖过孙策。孙策命人杀他，却发现其伤口竟能自愈。孙策大惊，放他离去。",500210,"新传记开启，将军，您将融入孙权之魂，体验名将孙权的喜怒哀乐吧！",43001,43101,43201,43301,0,0,0,0,0,0,0,10,1,1,608,423,608,423,1311,989,1,16,500,},  
    [44] = {44,"张角传",1,115,10,44002,44002,959,"农民张角偶遇神秘道人于吉。于吉赞叹张角资质甚好，设计考验张角，最后传他太平经。",600080,"新传记开启，将军，您将融入张角之魂，体验名将张角的喜怒哀乐吧！",44001,44101,44201,44301,0,0,0,0,0,0,0,10,1,1,575,521,575,521,747,408,1,16,500,},  
    [45] = {45,"华佗传",1,120,10,45001,45001,977,"华佗因医术高明被掳去为曹操诊病，华佗断曹操的头痛只有开颅可解。曹操大怒，将其下狱。",500190,"新传记开启，将军，您将融入华佗之魂，体验名将华佗的喜怒哀乐吧！",45001,45101,45201,45301,0,0,0,0,0,0,0,10,1,1,1496,506,1496,506,718,286,1,16,500,},  
    [46] = {46,"司马懿传",1,125,10,46003,46003,991,"司马懿博学善谋。因厌弃曹操出身阉党，一度拒绝曹操授予的官职。",300290,"新传记开启，将军，您将融入司马懿之魂，体验名将司马懿的喜怒哀乐吧！",46001,46101,46201,46301,0,0,0,0,0,0,0,10,1,1,353,826,353,826,1559,457,1,16,500,},  
    [47] = {47,"诸葛亮传",1,130,10,47005,47005,1007,"诸葛亮早年在隆中隐居，先主拜访三次才将他请出。诸葛亮被先主感动，献上三分天下之计。",300300,"新传记开启，将军，您将融入诸葛亮之魂，体验名将诸葛亮的喜怒哀乐吧！",47001,47101,47201,47301,0,0,0,0,0,0,0,10,1,1,200,877,200,877,1712,612,1,16,500,},  
    [48] = {48,"张辽传",1,135,11,48007,48007,1454,"白狼山一战，临时持麾的张辽指挥先锋部队击破了乌桓军队并斩杀乌桓单于蹋顿 ，名扬天下。",500020,"新传记开启，将军，您将融入张辽之魂，体验名将张辽的喜怒哀乐吧！",48001,48101,48201,48301,0,0,0,0,0,0,0,10,1,1,1224,832,1224,832,1652,1099,1,16,500,},  
    [49] = {49,"关羽传",1,140,11,49008,49008,1474,"建安二十四年，关羽与曹军在襄江对峙。关羽设堤坝水淹曹操七军，活捉于禁和庞德。",300310,"新传记开启，将军，您将融入关羽之魂，体验名将关羽的喜怒哀乐吧！",49001,49101,49201,49301,0,0,0,0,0,0,0,10,1,1,1224,832,1224,832,871,467,1,16,500,},  
    [50] = {50,"吕蒙传",1,145,11,50003,50003,1492,"建安二十年，吕蒙率兵士攻取长沙、桂阳二郡，又孤身入零陵诈降太守郝普，拿下荆州三郡。",500160,"新传记开启，将军，您将融入吕蒙之魂，体验名将吕蒙的喜怒哀乐吧！",50001,50101,50201,50301,0,0,0,0,0,0,0,10,1,1,1592,1020,1592,1020,610,972,1,16,500,},  
    [51] = {51,"夏侯渊传",1,150,11,51005,51005,1511,"夏侯渊镇守汉中之时，计保凉州，击退韩遂马超，虎步关右。",500050,"新传记开启，将军，您将融入夏侯渊之魂，体验名将夏侯渊的喜怒哀乐吧！",51001,51101,51201,51301,0,0,0,0,0,0,0,10,1,1,1866,906,1866,906,816,614,1,16,500,},  
    [52] = {52,"公孙瓒传",1,155,11,52004,52004,1532,"公孙瓒带领白马义从，击败鲜卑王檀石槐、乌桓王丘力居，名动塞外。",500240,"新传记开启，将军，您将融入公孙瓒之魂，体验名将公孙瓒的喜怒哀乐吧！",52001,52101,52201,52301,0,0,0,0,0,0,0,10,1,1,2131,604,2131,604,713,1044,1,16,500,},  
    [53] = {53,"于禁传",1,160,12,53005,53005,1624,"冀州平定，昌豨又叛，先主派于禁征剿。于禁击败昌豨，因其违背军令，不念旧情挥泪斩杀。",400010,"新传记开启，将军，您将融入于禁之魂，体验名将于禁的喜怒哀乐吧！",53001,53101,53201,53301,0,0,0,0,0,0,0,10,1,1,782,585,782,585,1600,1052,1,16,500,},  
    [54] = {54,"张飞传",1,165,12,54004,54004,1644,"时张飞驻守巴西，张飞粗中有细，装作醉生梦死，以假人骗取张郃出兵，一举击溃张郃。",500080,"新传记开启，将军，您将融入张飞之魂，体验名将张飞的喜怒哀乐吧！",54001,54101,54201,54301,54401,0,0,0,0,0,0,10,1,1,1528,967,1528,967,808,1020,1,16,500,},  
    [55] = {55,"鲁肃传",1,170,12,55008,55008,1663,"刘表新亡，曹操趁机南下。鲁肃不惧荆州旧恨，亲往吊唁，凭一己之力联合刘备共同抗曹。",500180,"新传记开启，将军，您将融入鲁肃之魂，体验名将鲁肃的喜怒哀乐吧！",55001,55101,55201,55301,0,0,0,0,0,0,0,10,1,1,2139,820,2139,820,851,477,1,16,500,},  
    [56] = {56,"陆逊传",1,175,12,56001,56001,1682,"吴黄武七年。陆逊受命迎击曹休于石亭，以滚石围攻之计击败曹休，斩俘魏军一万余人。",510050,"新传记开启，将军，您将融入陆逊之魂，体验名将陆逊的喜怒哀乐吧！",56001,56101,56201,56301,0,0,0,0,0,0,0,10,1,1,1189,740,1189,740,992,378,1,16,500,},  
    [57] = {57,"贾诩传",1,180,12,57007,57007,1698,"渭水之战，太祖失利。贾诩献计太祖，以离间计使马超、韩遂反目，曹军借机大败关中联军。",510070,"新传记开启，将军，您将融入贾诩之魂，体验名将贾诩的喜怒哀乐吧！",57001,57101,57201,57301,0,0,0,0,0,0,0,10,1,1,1329,949,1329,949,1842,1046,1,16,500,},  
    [58] = {58,"乐进传",1,185,13,58005,58005,1773,"刘备出兵巴蜀之际，乐进奉曹操之命攻打荆州，连败关羽、关平父子，名震荆襄。",400030,"新传记开启，将军，您将融入乐进之魂，体验名将乐进的喜怒哀乐吧！",58001,58101,58201,58301,0,0,0,0,0,0,0,10,1,1,230,874,230,874,690,650,1,16,500,},  
    [59] = {59,"张郃传",1,190,13,59008,59008,1790,"黄武二年，张郃奉命进攻东吴，搭桥渡江破围坞之计、水战大胜诸葛瑾，横扫江陵。",500060,"新传记开启，将军，您将融入张郃之魂，体验名将张郃的喜怒哀乐吧！",59001,59101,59201,0,0,0,0,0,0,0,0,10,1,1,770,496,770,496,568,368,1,16,500,},  
    [60] = {60,"赵云传",1,195,13,60004,60004,1806,"建兴六年，诸葛亮首出祁山，遣赵云作疑兵牵制魏军主力。赵云老当益壮，于凤鸣山力斩五将。",510040,"新传记开启，将军，您将融入赵云之魂，体验名将赵云的喜怒哀乐吧！",60001,60101,60201,60301,60401,0,0,0,0,0,0,10,1,1,2106,284,2106,284,822,1006,1,16,500,},  
    [61] = {61,"黄忠传",1,200,13,61001,61001,1826,"章武元年，黄忠自请出战夷陵，大败敌军主将潘璋，最终马革裹尸而还。",500090,"新传记开启，将军，您将融入黄忠之魂，体验名将黄忠的喜怒哀乐吧！",61001,61101,61201,61301,0,0,0,0,0,0,0,10,1,1,1204,570,1204,570,1314,834,1,16,500,},  
    [62] = {62,"陈宫传",1,205,13,62001,62001,1845,"下邳之战，局势危困，陈宫几番献计欲保吕布大业，却反遭怀疑，最终随吕布殒命下邳。",400160,"新传记开启，将军，您将融入陈宫之魂，体验名将陈宫的喜怒哀乐吧！",62001,62101,62201,62301,0,0,0,0,0,0,0,10,1,1,1740,654,1740,654,1072,772,1,16,500,},  
    [63] = {63,"荀彧传",1,210,14,63004,63004,1971,"吕布投向刘备，致使曹操忧虑不已。荀彧献驱虎吞狼之策巧解危机，并使曹军从中得利。",600110,"新传记开启，将军，您将融入荀彧之魂，体验名将荀彧的喜怒哀乐吧！",63001,63101,63201,0,0,0,0,0,0,0,0,10,1,1,414,418,414,418,1132,920,1,16,500,},  
    [64] = {64,"黄月英传",1,215,14,64007,64007,1991,"诸葛亮数次北伐，皆因运粮不利退兵，黄月英发明木牛流马解其危局。",600090,"新传记开启，将军，您将融入黄月英之魂，体验名将黄月英的喜怒哀乐吧！",64001,64101,64201,0,0,0,0,0,0,0,0,10,1,1,1762,986,1762,986,968,390,1,16,500,},  
    [65] = {65,"甘宁传",1,220,14,65008,65008,2013,"建安十八年，曹操亲率大军攻打濡须口。甘宁百骑劫曹营，不折一兵一卒，大挫曹军士气。",600100,"新传记开启，将军，您将融入甘宁之魂，体验名将甘宁的喜怒哀乐吧！",65001,65101,65201,0,0,0,0,0,0,0,0,10,1,1,638,780,638,780,862,496,1,16,500,},  
    [66] = {66,"左慈传",1,225,14,66003,66003,2031,"左慈亲往曹宅试探曹操本性，在宴席上分杯为二、化酒为鸠，其手段之高明，神鬼难测。",600120,"新传记开启，将军，您将融入左慈之魂，体验名将左慈的喜怒哀乐吧！",66001,66101,66201,0,0,0,0,0,0,0,0,10,1,1,752,1140,752,1140,722,1000,1,16,500,},  
    [67] = {67,"典韦传",1,230,14,67001,67001,2050,"兴平元年，曹操被困濮阳，形势危急。典韦以戟掷敌，五步内尽诛敌军，救曹操于水火之中。",510020,"新传记开启，将军，您将融入典韦之魂，体验名将典韦的喜怒哀乐吧！",67001,67101,67201,0,0,0,0,0,0,0,0,10,1,1,1290,355,1290,355,808,730,1,16,500,},  
    [68] = {68,"马超传",1,235,15,68007,68007,2094,"建安十九年，马超攻取葭萌关，与张飞大战数百回合。猛将相争，胜负难分。",500110,"新传记开启，将军，您将融入马超之魂，体验名将马超的喜怒哀乐吧！",68001,68101,68201,68301,0,0,0,0,0,0,0,10,1,1,688,452,688,452,1772,1000,1,16,500,},  
    [69] = {69,"周瑜传",1,240,15,69001,69001,2110,"周瑜在南郡之战中不慎中箭，而后将计就计，凭借假死之策大败曹军。",600060,"新传记开启，将军，您将融入周瑜之魂，体验名将周瑜的喜怒哀乐吧！",69001,69101,69201,0,0,0,0,0,0,0,0,10,1,1,1177,511,1177,511,853,287,1,16,500,},  
    [70] = {70,"程普传",1,245,15,70004,70004,2128,"陵阳之战，孙策被围。程普赤胆忠心、拼死相护，为孙策求得一线生机。",400090,"新传记开启，将军，您将融入程普之魂，体验名将程普的喜怒哀乐吧！",70001,70101,70201,0,0,0,0,0,0,0,0,10,1,1,794,1054,794,1054,974,906,1,16,500,},  
    [71] = {71,"董卓传",1,250,15,71003,71003,2146,"董卓发现吕布、貂蝉之事背后端倪，对王允产生疑心，却为时已晚。",500230,"新传记开启，将军，您将融入董卓之魂，体验名将董卓的喜怒哀乐吧！",71001,71101,71201,71301,0,0,0,0,0,0,0,10,1,1,362,840,362,840,998,472,1,16,500,},  
    [72] = {72,"于吉传",1,255,15,72008,72008,2165,"为挑起孙刘之争，于吉步步诱导、蛊惑人心，助吕蒙白衣渡江、成功夺取荆州。",500210,"新传记开启，将军，您将融入于吉之魂，体验名将于吉的喜怒哀乐吧！",72001,72101,72201,72301,0,0,0,0,0,0,0,10,1,1,2082,901,2082,901,825,731,1,16,500,},  
    [73] = {73,"刘备传",1,260,16,73004,73004,2289,"建安二十四年，刘备进位汉中王，拜诸葛亮为军师，关羽、张飞、赵云、马超、黄忠为五虎上将。",510030,"新传记开启，将军，您将融入刘备之魂，体验名将刘备的喜怒哀乐吧！",73001,73101,73201,0,0,0,0,0,0,0,0,10,1,1,1908,538,1908,538,1068,908,1,16,500,},  
    [74] = {74,"诸葛亮传",1,265,16,74007,74007,2306,"马谡失守街亭，司马懿大军直逼西城。诸葛亮布下空城计，吓退魏兵。",600030,"新传记开启，将军，您将融入诸葛亮之魂，体验名将诸葛亮的喜怒哀乐吧！",74001,74101,74201,74301,0,0,0,0,0,0,0,10,1,1,908,340,908,340,1663,1078,1,16,500,},  
    [75] = {75,"曹操传",1,270,16,75007,75007,2325,"吕布趁曹操征陶谦之际占据濮阳。曹操闻内乱，撤军北回，几经波折打败叛军，收复失地。",600010,"新传记开启，将军，您将融入曹操之魂，体验名将曹操的喜怒哀乐吧！",75001,75101,75201,75301,0,0,0,0,0,0,0,10,1,1,1842,1002,1842,1002,784,390,1,16,500,},  
    [76] = {76,"袁绍传",1,275,16,76004,76004,2345,"袁绍初以豪侠得众，遂怀雄霸之图，天下胜兵举旗者，莫不假以为名。",500200,"新传记开启，将军，您将融入袁绍之魂，体验名将袁绍的喜怒哀乐吧！",76001,76101,76201,76301,76401,0,0,0,0,0,0,10,1,1,1687,446,1687,446,952,1001,1,16,500,},  
    [77] = {77,"孙策传",1,280,16,77005,77005,2363,"兴平二年，孙策讨伐刘繇，与太史慈酣战于神亭岭，此战过后两人互相钦慕，结为至交。",600050,"新传记开启，将军，您将融入孙策之魂，体验名将孙策的喜怒哀乐吧！",77001,77101,77201,0,0,0,0,0,0,0,0,10,1,1,1712,452,1712,452,770,666,1,16,500,},
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
}

local __key_map = { 
    id = 1,
    name = 2,
    if_open = 3,
    dungeon_chapter_open = 4,
    land_id = 5,
    stage_map = 6,
    ctrl_id = 7,
    story = 8,
    chapter_clear = 9,
    base_id = 10,
    chapter_story = 11,
    mission_chain_main = 12,
    mission_chain_branch_1 = 13,
    mission_chain_branch_2 = 14,
    mission_chain_branch_3 = 15,
    mission_chain_branch_4 = 16,
    mission_chain_branch_5 = 17,
    mission_chain_branch_6 = 18,
    mission_chain_branch_7 = 19,
    mission_chain_branch_8 = 20,
    mission_chain_branch_9 = 21,
    mission_chain_branch_10 = 22,
    branch_target = 23,
    branch_reward = 24,
    scroll_num = 25,
    BOSS_position_X_1 = 26,
    BOSS_position_Y_1 = 27,
    BOSS_position_X_2 = 28,
    BOSS_position_Y_2 = 29,
    story_npc_X = 30,
    story_npc_Y = 31,
    finish_award_type = 32,
    finish_award_value = 33,
    finish_award_size = 34,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_biography_chapter_info")

        return t._raw[__key_map[k]]
    end
}


function biography_chapter_info.getLength()
    return #biography_chapter_info._data
end



function biography_chapter_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_biography_chapter_info
function biography_chapter_info.indexOf(index)
    if index == nil or not biography_chapter_info._data[index] then
        return nil
    end
    return setmetatable({_raw = biography_chapter_info._data[index]}, m)
end



---
--@return @class record_biography_chapter_info
function biography_chapter_info.get(id)
    
    return biography_chapter_info.indexOf(__index_id[ id ])
     
end



function biography_chapter_info.set(id, key, value)
    local record = biography_chapter_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function biography_chapter_info.get_index_data()
    return __index_id 
end

return  biography_chapter_info 