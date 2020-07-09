---@classdef record_function_info
local record_function_info = {}


record_function_info.id = 0--ID
record_function_info.name =  ""--功能名字
record_function_info.preset_ID = 0--前置功能ID
record_function_info.unlock_type = 0--开启条件类型
record_function_info.level_type = 0--开启等级类型
record_function_info.level = 0--开启等级
record_function_info.vip_level = 0--开启VIP等级
record_function_info.privilege_type = 0--特权开启
record_function_info.icon =  ""--入口图标
record_function_info.lock_direction =  ""--未开启描述
record_function_info.show_function_description =  ""--系统说明
record_function_info.show_unlock_type = 0--显示条件类型
record_function_info.show_level_type = 0--显示等级类型
record_function_info.show_level = 0--显示等级
record_function_info.show_vip_level = 0--显示VIP等级
record_function_info.turn_on_type = 0--功能开启提示形式

local function_info = {
   _data = {   
    [1] = {1,"武将阵位2",0,0,1,1,0,0,"icon/function/icon_buzhen.png","1级开启，将军快去提升等级吧！","可以上阵第2个武将了！",0,1,1,0,0,},  
    [2] = {2,"武将阵位3",0,0,1,2,0,0,"icon/function/icon_buzhen.png","2级开启，将军快去提升等级吧！","可以上阵第3个武将了！",0,1,1,0,0,},  
    [3] = {3,"武将阵位4",0,0,1,3,0,0,"icon/function/icon_buzhen.png","3级开启，将军快去提升等级吧！","可以上阵第4个武将了！",0,1,1,0,0,},  
    [4] = {4,"武将阵位5",0,0,1,8,0,0,"icon/function/icon_buzhen.png","8级开启，将军快去提升等级吧！","可以上阵第5个武将了！",0,1,1,0,0,},  
    [5] = {5,"武将阵位6",0,0,1,14,0,0,"icon/function/icon_buzhen.png","14级开启，将军快去提升等级吧！","可以上阵第6个武将了！",0,1,1,0,0,},  
    [6] = {100,"合击阵位1",0,0,1,1,0,0,"icon/function/icon_heji1.png","1级开启，将军快去提升等级吧！","可以上阵第1个合击了！",0,1,1,0,0,},  
    [7] = {101,"合击阵位2",0,0,1,1,0,0,"icon/function/icon_heji1.png","1级开启，将军快去提升等级吧！","可以上阵第2个合击了！",0,1,1,0,0,},  
    [8] = {102,"合击阵位3",0,0,1,8,0,0,"icon/function/icon_heji1.png","8级开启，将军快去提升等级吧！","可以上阵第3个合击了！",0,1,1,0,0,},  
    [9] = {103,"合击阵位4",0,0,1,10,0,0,"icon/function/icon_heji1.png","10级开启，将军快去提升等级吧！","可以上阵第4个合击了！",0,1,1,0,0,},  
    [10] = {200,"武将援军位1",0,0,1,25,0,0,"icon/function/icon_yuanjun.png","25级开启，将军快去提升等级吧！","可以上阵援军激活缘分！",0,1,1,0,0,},  
    [11] = {201,"武将援军位2",0,0,1,35,0,0,"icon/function/icon_yuanjun.png","35级开启，将军快去提升等级吧！","可以上阵第2个援军了！",0,1,1,0,0,},  
    [12] = {202,"武将援军位3",0,0,1,45,0,0,"icon/function/icon_yuanjun.png","45级开启，将军快去提升等级吧！","可以上阵第3个援军了！",0,1,1,0,0,},  
    [13] = {203,"武将援军位4",0,0,1,50,0,0,"icon/function/icon_yuanjun.png","50级开启，将军快去提升等级吧！","可以上阵第4个援军了！",0,1,1,0,0,},  
    [14] = {204,"武将援军位5",0,0,1,55,0,0,"icon/function/icon_yuanjun.png","55级开启，将军快去提升等级吧！","可以上阵第5个援军了！",0,1,1,0,0,},  
    [15] = {205,"武将援军位6",0,0,1,60,0,0,"icon/function/icon_yuanjun.png","60级开启，将军快去提升等级吧！","可以上阵第6个援军了！",0,1,1,0,0,},  
    [16] = {206,"武将援军位7",0,0,1,65,0,0,"icon/function/icon_yuanjun.png","60级开启，将军快去提升等级吧！","可以上阵第7个援军了！",0,1,1,0,0,},  
    [17] = {207,"武将援军位8",0,0,1,70,0,0,"icon/function/icon_yuanjun.png","65级开启，将军快去提升等级吧！","可以上阵第8个援军了！",0,1,1,0,0,},  
    [18] = {208,"武将援军位9",0,0,1,9999,0,0,"icon/function/icon_yuanjun.png","25级开启，将军快去提升等级吧！","可以上阵援军激活缘分！",0,1,1,0,0,},  
    [19] = {209,"武将援军位10",0,0,1,9999,0,0,"icon/function/icon_yuanjun.png","35级开启，将军快去提升等级吧！","可以上阵第2个援军了！",0,1,1,0,0,},  
    [20] = {210,"武将援军位11",0,0,1,9999,0,0,"icon/function/icon_yuanjun.png","45级开启，将军快去提升等级吧！","可以上阵第3个援军了！",0,1,1,0,0,},  
    [21] = {211,"武将援军位12",0,0,1,9999,0,0,"icon/function/icon_yuanjun.png","50级开启，将军快去提升等级吧！","可以上阵第4个援军了！",0,1,1,0,0,},  
    [22] = {212,"武将援军位13",0,0,1,9999,0,0,"icon/function/icon_yuanjun.png","55级开启，将军快去提升等级吧！","可以上阵第5个援军了！",0,1,1,0,0,},  
    [23] = {213,"武将援军位14",0,0,1,9999,0,0,"icon/function/icon_yuanjun.png","60级开启，将军快去提升等级吧！","可以上阵第6个援军了！",0,1,1,0,0,},  
    [24] = {214,"武将援军位15",0,0,1,9999,0,0,"icon/function/icon_yuanjun.png","60级开启，将军快去提升等级吧！","可以上阵第7个援军了！",0,1,1,0,0,},  
    [25] = {1000,"武将背包",0,0,1,1,0,0,"icon/function/icon_wjiang1.png","1级开启，将军快去提升等级吧！","武将背包开启了！",0,1,1,0,0,},  
    [26] = {1001,"武将升级",0,0,1,3,0,0,"icon/function/icon_wjiang1.png","1级开启，将军快去提升等级吧！","武将升级开启了！",0,1,3,0,0,},  
    [27] = {1002,"武将升星",0,0,1,6,0,0,"icon/function/icon_wjiang1.png","6级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,1,0,0,},  
    [28] = {1003,"武将进阶",0,0,1,5,0,0,"icon/function/icon_wjiang1.png","5级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,1,0,0,},  
    [29] = {1004,"武将培养",0,0,2,4,0,0,"icon/function/icon_wjiang1.png","通关主线副本第4章开启，将军快去挑战吧！","系统说明文字 对仗极为工整",0,2,4,0,0,},  
    [30] = {1005,"武将缘分",0,0,1,1,0,0,"icon/function/icon_wjiang1.png","1级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,1,0,0,},  
    [31] = {1006,"武将图鉴激活",0,0,1,30,0,0,"icon/function/icon_wujiangtujian.png","30级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,30,0,1,},  
    [32] = {1007,"一键装备",0,0,1,5,0,0,"icon/function/icon_wjiang1.png","9级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,1,0,0,},  
    [33] = {1008,"购买饰品",0,0,1,25,0,0,"icon/function/icon_wjiang1.png","25级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,25,0,0,},  
    [34] = {1009,"武将图鉴升级",0,0,1,30,0,0,"icon/function/icon_wujiangtujian.png","30级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,30,0,0,},  
    [35] = {1010,"武将助阵",0,0,1,40,0,0,"icon/function/icon_wjiang1.png","40级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,40,0,0,},  
    [36] = {1011,"进阶材料合成",0,0,2,6,0,0,"icon/function/icon_wjiang1.png","通关主线副本第6章开启，将军快去挑战吧！","系统说明文字 对仗极为工整",0,2,6,0,0,},  
    [37] = {1012,"武将图鉴显示",0,0,1,10,0,0,"icon/function/icon_wujiangtujian.png","10级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,10,0,0,},  
    [38] = {1013,"武将觉醒",0,0,1,120,0,0,"icon/function/icon_wjiang1.png","120级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,115,0,1,},  
    [39] = {1014,"武将碎片出售",0,0,1,100,0,0,"icon/function/icon_wjiang1.png","100级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,100,0,0,},  
    [40] = {1015,"武将副将",0,0,1,50,0,0,"icon/function/icon_wjiang1.png","50级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,45,0,0,},  
    [41] = {1100,"合击兵符背包",0,0,1,1,0,0,"icon/function/icon_heji1.png","1级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,1,0,0,},  
    [42] = {1101,"合击兵符升级",0,0,7,7,0,0,"icon/function/icon_heji1.png","通关神将列传-传记第七章开启，将军快去挑战吧！","系统说明文字 对仗极为工整",0,7,6,0,0,},  
    [43] = {1102,"合击兵符进阶",0,0,1,1,0,0,"icon/function/icon_heji1.png","1级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,1,0,0,},  
    [44] = {1103,"合击兵符觉醒",0,0,1,1,0,0,"icon/function/icon_heji1.png","1级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,1,0,0,},  
    [45] = {1104,"合击兵符符石",0,0,8,2,0,0,"icon/function/icon_heji1.png","明日开启，敬请期待！","系统说明文字 对仗极为工整",0,8,2,0,0,},  
    [46] = {1105,"合击兵符刻印",0,0,1,75,0,0,"icon/function/icon_heji1.png","75级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,70,0,0,},  
    [47] = {1200,"装备背包",0,0,2,3,0,0,"icon/function/icon_zhuangbei.png","通关主线副本第3章开启，将军快去挑战吧！","系统说明文字 对仗极为工整",0,2,3,0,0,},  
    [48] = {1201,"装备强化",0,0,2,3,0,0,"icon/function/icon_zhuangbei.png","通关主线副本第3章开启，将军快去挑战吧！","系统说明文字 对仗极为工整",0,2,3,0,0,},  
    [49] = {1202,"装备精炼",0,0,1,35,0,0,"icon/function/icon_zhuangbei.png","35级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,30,0,0,},  
    [50] = {1203,"阵容-装备位",0,0,2,3,0,0,"icon/function/icon_zhuangbei.png","通关主线副本第3章开启，将军快去挑战吧！","系统说明文字 对仗极为工整",0,2,3,0,0,},  
    [51] = {1204,"装备雕纹",0,0,1,48,0,0,"icon/function/icon_zhuangbei.png","48级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,43,0,1,},  
    [52] = {1205,"一键强化",0,0,2,10,0,0,"icon/function/icon_zhuangbei.png","通关主线副本第10章开启，将军快去挑战吧！","系统说明文字 对仗极为工整",0,2,5,0,0,},  
    [53] = {1206,"装备铸灵",0,0,1,70,0,0,"icon/function/icon_zhuangbei.png","70级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,70,0,0,},  
    [54] = {1300,"强化大师",0,0,2,3,0,0,"icon/function/icon_qianghuadashi_big.png","通关主线副本第3章开启，将军快去挑战吧！","系统说明文字 对仗极为工整",0,2,3,0,0,},  
    [55] = {1301,"成长入口",0,0,1,1,0,0,"icon/function/icon_chengzhang1.png","1级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,1,0,0,},  
    [56] = {1302,"穿戴入口",0,0,2,3,0,0,"icon/function/icon_chuandai1.png","通关主线副本第3章开启，将军快去挑战吧！","系统说明文字 对仗极为工整",0,1,1,0,0,},  
    [57] = {1400,"宝物背包",0,0,1,43,0,0,"icon/function/icon_baowu.png","43级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,38,0,0,},  
    [58] = {1401,"宝物强化",0,0,1,43,0,0,"icon/function/icon_baowu.png","43级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,38,0,1,},  
    [59] = {1402,"宝物精炼",0,0,1,46,0,0,"icon/function/icon_baowu.png","46级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,44,0,1,},  
    [60] = {1403,"阵容-宝物位",0,0,2,3,0,0,"icon/function/icon_baowu.png","通关主线副本第3章开启，将军快去挑战吧！","系统说明文字 对仗极为工整",0,2,3,0,0,},  
    [61] = {1404,"宝物雕纹",0,0,1,48,0,0,"icon/function/icon_baowu.png","48级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,46,0,0,},  
    [62] = {1405,"神器铸灵",0,0,1,70,0,0,"icon/function/icon_baowu.png","70级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,70,0,1,},  
    [63] = {1406,"宝物升金",0,0,1,65,0,0,"icon/function/icon_baowu.png","65级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,60,0,0,},  
    [64] = {1500,"三国志",0,0,2,3,0,0,"icon/function/icon_sanguozhi.png","通关主线副本第3章开启，将军快去挑战吧！","系统说明文字 对仗极为工整",0,1,1,0,0,},  
    [65] = {1501,"时空秘宝",0,0,2,120,0,0,"icon/function/icon_sanguozhi.png","通关主线副本第120章开启，将军快去挑战吧！","系统说明文字 对仗极为工整",0,2,80,0,0,},  
    [66] = {1600,"称号系统",0,0,1,10,0,0,"icon/function/icon_chenghao.png","10级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,10,0,0,},  
    [67] = {1700,"时装系统",0,0,1,20,0,0,"icon/function/icon_shizhuang.png","20级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,20,0,0,},  
    [68] = {1701,"时装强化",0,0,1,20,0,0,"icon/function/icon_shizhuang.png","20级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,20,0,0,},  
    [69] = {1702,"时装一键强化",0,0,1,60,0,0,"icon/function/icon_shizhuang.png","60级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,60,0,0,},  
    [70] = {1800,"变装系统",0,0,1,15,0,0,"icon/function/icon_bianzhuang.png","15级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,15,0,0,},  
    [71] = {1900,"神兵系统",0,0,1,53,0,0,"icon/function/icon_hd_sq1.png","53级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,48,0,1,},  
    [72] = {1901,"神兵强化",0,0,1,53,0,0,"icon/function/icon_hd_sq1.png","53级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,53,0,0,},  
    [73] = {1902,"神兵升星",0,0,1,53,0,0,"icon/function/icon_hd_sq1.png","53级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,53,0,0,},  
    [74] = {1903,"神兵图鉴",0,0,1,53,0,0,"icon/function/icon_hd_sq1.png","53级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,53,0,0,},  
    [75] = {1904,"神兵商店",0,0,1,53,0,0,"icon/function/icon_hd_sqsd1.png","53级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,53,0,1,},  
    [76] = {1905,"神兵宝库",0,0,1,53,0,0,"icon/function/icon_hd_sqzp1.png","53级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,48,0,1,},  
    [77] = {1906,"阵容-神兵位",0,0,1,53,0,0,"icon/function/icon_hd_sq1.png","53级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,53,0,0,},  
    [78] = {2000,"化身系统",0,0,1,56,0,0,"icon/function/icon_shizhuang.png","56级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,56,0,0,},  
    [79] = {2001,"化身抽取",0,0,1,20,0,0,"icon/function/icon_shizhuang.png","20级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,20,0,0,},  
    [80] = {2100,"神翼系统",0,0,1,50,0,0,"icon/function/icon_shenyi.png","50级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,50,0,0,},  
    [81] = {2101,"神翼精炼",0,0,1,50,0,0,"icon/function/icon_shenyitujian.png","50级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,50,0,0,},  
    [82] = {2200,"神兽系统",0,0,1,60,0,0,"icon/function/icon_shenshou.png","60级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,60,0,0,},  
    [83] = {2201,"神兽升1级",0,0,1,65,0,0,"icon/function/icon_shenshou.png","65级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,65,0,0,},  
    [84] = {2202,"神兽升星",0,0,1,60,0,0,"icon/function/icon_shenshou.png","60级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,60,0,0,},  
    [85] = {2203,"神兽阵位1",0,0,1,60,0,0,"icon/function/icon_shenshou.png","60级开启，将军快去提升等级吧！","可以上阵第1个神兽了！",0,1,60,0,0,},  
    [86] = {2204,"神兽阵位2",0,0,1,70,0,0,"icon/function/icon_shenshou.png","70级开启，将军快去提升等级吧！","可以上阵第2个神兽了！",0,1,60,0,0,},  
    [87] = {2205,"神兽阵位3",0,0,1,80,0,0,"icon/function/icon_shenshou.png","80级开启，将军快去提升等级吧！","可以上阵第3个神兽了！",0,1,70,0,0,},  
    [88] = {2206,"神兽阵位4",0,0,1,90,0,0,"icon/function/icon_shenshou.png","90级开启，将军快去提升等级吧！","可以上阵第4个神兽了！",0,1,80,0,0,},  
    [89] = {2207,"神兽阵位5",0,0,1,100,0,0,"icon/function/icon_shenshou.png","100级开启，将军快去提升等级吧！","可以上阵第5个神兽了！",0,1,90,0,0,},  
    [90] = {2208,"神兽阵位6",0,0,1,110,0,0,"icon/function/icon_shenshou.png","110级开启，将军快去提升等级吧！","可以上阵第6个神兽了！",0,1,100,0,0,},  
    [91] = {2209,"神兽升5级",0,0,1,80,0,0,"icon/function/icon_shenshou.png","80级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,80,0,0,},  
    [92] = {2210,"神兽下阵",0,0,1,60,0,0,"icon/function/icon_shenshou.png","60级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,60,0,0,},  
    [93] = {2300,"神兽装备",0,0,1,70,0,0,"icon/function/icon_shenshouzhuangbeibeibao.png","70级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,70,0,0,},  
    [94] = {2301,"神兽装备强化",0,0,1,70,0,0,"icon/function/icon_shenshouzhuangbeibeibao.png","70级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,70,0,0,},  
    [95] = {2302,"神兽装备一键强化",0,0,1,75,0,0,"icon/function/icon_shenshouzhuangbeibeibao.png","75级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,73,0,0,},  
    [96] = {2400,"将灵系统",0,0,1,80,0,0,"icon/function/icon_jiangling.png","80级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,80,0,0,},  
    [97] = {2401,"将灵抽取",0,0,1,80,0,0,"icon/function/icon_zhanxingge.png","80级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,80,0,0,},  
    [98] = {2402,"将灵升星",0,0,1,100,0,0,"icon/function/icon_jiangling.png","100级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,100,0,0,},  
    [99] = {10000,"副本扫荡",0,0,1,5,0,0,"icon/function/icon_zhuxianfuben.png","5级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,5,0,0,},  
    [100] = {10001,"神将列传",0,0,2,3,0,0,"icon/function/icon_mingjiangzhuan.png","通关主线副本第3章开启，将军快去挑战吧！","系统说明文字 对仗极为工整",0,2,3,0,1,},  
    [101] = {10002,"名将来袭",0,0,7,2,0,0,"icon/function/icon_mingjiangzhuan.png","通关神将列传-传记第2章开启，将军快去挑战吧！","系统说明文字 对仗极为工整",0,7,2,0,0,},  
    [102] = {10003,"竞技场",10031,0,2,4,0,0,"icon/function/icon_jingjichang.png","通关主线副本第4章开启，将军快去挑战吧！","系统说明文字 对仗极为工整",0,2,4,0,1,},  
    [103] = {10004,"竞技场扫荡",10031,0,2,4,0,0,"icon/function/icon_jingjichang.png","通关主线副本第4章开启，将军快去挑战吧！","系统说明文字 对仗极为工整",0,2,4,0,0,},  
    [104] = {10005,"主线副本扫荡10次",0,0,1,20,0,0,"icon/function/icon_zhuxianfuben.png","20级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,20,0,0,},  
    [105] = {10006,"竞技场扫荡5次",0,0,2,4,0,0,"icon/function/icon_jingjichang.png","通关主线副本第4章开启，将军快去挑战吧！","系统说明文字 对仗极为工整",0,2,4,0,0,},  
    [106] = {10007,"传记扫荡",0,0,7,2,0,0,"icon/function/icon_mingjiangzhuan.png","通关神将列传-传记第2章开启，将军快去挑战吧！","系统说明文字 对仗极为工整",0,7,2,0,0,},  
    [107] = {10008,"传记-扫荡多次",0,0,1,52,0,0,"icon/function/icon_mingjiangzhuan.png","52级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,52,0,0,},  
    [108] = {10009,"无双试炼",10031,0,1,23,0,0,"icon/function/icon_wushuangshilian.png","23级且通关主线第4章开启，将军快去挑战吧！","系统说明文字 对仗极为工整",0,1,1,0,1,},  
    [109] = {10010,"无双试炼扫荡",10031,0,1,43,9,6,"icon/function/icon_wushuangshilian.png","购买订阅，43级或贵族9开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,23,0,0,},  
    [110] = {10011,"秘境寻宝",10031,0,1,43,0,0,"icon/function/icon_xunlongduobao.png","43级且通关主线第4章开启，将军快去挑战吧！","系统说明文字 对仗极为工整",0,1,35,0,1,},  
    [111] = {10012,"秘境寻宝-寻5次",10031,0,1,48,0,0,"icon/function/icon_xunlongduobao.png","48级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,43,0,0,},  
    [112] = {10013,"秘境寻宝-快捷战斗",0,0,1,43,0,0,"icon/function/icon_xunlongduobao.png","43级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,40,0,0,},  
    [113] = {10014,"秘境寻宝-一键寻宝",10031,0,1,65,0,0,"icon/function/icon_xunlongduobao.png","65级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,63,0,0,},  
    [114] = {10019,"封地高级巡逻",0,0,1,0,6,0,"icon/function/icon_fengdi.png","0级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,1,0,0,},  
    [115] = {10020,"封地一键巡逻",1,1,1,75,0,0,"icon/function/icon_fengdi.png","75级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,70,0,0,},  
    [116] = {10021,"封地一键收获",1,1,1,75,0,0,"icon/function/icon_fengdi.png","75级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,70,0,0,},  
    [117] = {10022,"封地一键镇压",10031,0,1,65,0,0,"icon/function/icon_pingding.png","65级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,63,0,0,},  
    [118] = {10023,"封地系统",1,1,4,11040,0,0,"icon/function/icon_fengdi.png","通关主线第7章开启，将军快去攻打主线吧！","系统说明文字 对仗极为工整",0,4,10640,0,0,},  
    [119] = {10024,"巨兽入侵",10031,1,1,35,0,0,"icon/function/icon_zhuijipanjun.png","35级且通关主线第4章开启，将军快去挑战吧！","系统说明文字 对仗极为工整",0,1,1,0,1,},  
    [120] = {10025,"军团系统",1,1,1,20,0,0,"icon/function/icon_juntuan.png","20级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,20,0,1,},  
    [121] = {10026,"军团红包",1,1,3,1,0,0,"icon/function/icon_hongbao.png","军团1级开启，将军快去加入军团吧！","系统说明文字 对仗极为工整",0,3,1,0,0,},  
    [122] = {10027,"军团副本",1,1,3,3,0,0,"icon/function/icon_mingjianglaixi.png","军团3级开启，将军快去提升军团等级吧！","系统说明文字 对仗极为工整",0,1,1,0,0,},  
    [123] = {10028,"军团铸像",1,1,3,1,0,0,"icon/function/icon_hd_pm1.png","军团1级开启，将军快去提升军团等级吧！","系统说明文字 对仗极为工整",0,1,1,0,0,},  
    [124] = {10030,"日常副本",1,1,1,26,0,0,"icon/function/icon_richangfuben.png","26级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,23,0,1,},  
    [125] = {10031,"征战",0,0,2,4,0,0,"icon/function/icon_zhengzhan.png","通关主线副本第4章开启，将军快去挑战吧！","系统说明文字 对仗极为工整",0,2,4,0,0,},  
    [126] = {10032,"神将列传-战役",0,0,7,7,0,0,"icon/function/icon_mingjiangzhuan.png","通关神将列传-传记第7章开启，将军快去挑战吧！","系统说明文字 对仗极为工整",0,7,3,0,1,},  
    [127] = {10033,"过关斩将",10031,1,1,48,0,0,"icon/function/icon_fengdi.png","48级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,43,0,0,},  
    [128] = {10034,"激斗神将",10025,1,8,2,0,0,"icon/function/icon_hd_jtboss1.png","明日开启，敬请期待！","系统说明文字 对仗极为工整",0,8,2,0,0,},  
    [129] = {10035,"军团副本（仅日常任务用）",0,1,1,38,0,0,"icon/function/icon_juntuan.png","38级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,38,0,0,},  
    [130] = {10036,"讨伐神兽",20092,1,1,70,0,0,"icon/function/icon_shenshoutiaozhan.png","70级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,68,0,0,},  
    [131] = {10037,"决战定军山",10031,1,1,65,0,0,"icon/function/icon_juezhandingjunshan.png","65级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,63,0,1,},  
    [132] = {10038,"王者竞技",10031,1,1,55,0,0,"icon/function/icon_wangzhejingji.png","55级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,55,0,1,},  
    [133] = {10039,"时空外传",0,0,2,120,0,0,"icon/function/icon_shikongwaizhuan.png","通关主线副本第120章开启，将军快去挑战吧！","系统说明文字 对仗极为工整",0,2,80,0,0,},  
    [134] = {10040,"主线副本连续扫荡",0,0,1,55,0,0,"icon/function/icon_zhuxianfuben.png","55级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,55,0,0,},  
    [135] = {10041,"竞技场一键挑战",10031,0,1,55,0,0,"icon/function/icon_jingjichang.png","55级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,55,0,0,},  
    [136] = {10042,"神将列传-战役扫荡",10032,0,1,65,0,0,"icon/function/icon_mingjiangzhuan.png","65级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,63,0,0,},  
    [137] = {10043,"竞技场一键领奖",10031,0,1,55,0,0,"icon/function/icon_jingjichang.png","55级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,55,0,0,},  
    [138] = {10044,"军团一键赠礼",10025,0,1,80,0,0,"icon/function/icon_juntuan.png","80级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,80,0,0,},  
    [139] = {10045,"军团副本一键领奖",10027,0,1,80,0,0,"icon/function/icon_juntuan.png","80级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,80,0,0,},  
    [140] = {10046,"兵临城下（军团）",0,0,3,3,0,0,"icon/function/icon_binglinchengxia.png","军团3级开启，将军快去提升军团等级吧！","系统说明文字 对仗极为工整",0,1,1,0,0,},  
    [141] = {10047,"兵临城下",0,0,1,80,0,0,"icon/function/icon_binglinchengxia.png","80级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,1,0,1,},  
    [142] = {10048,"兵临城下（仅跳转用）",10046,0,1,80,0,0,"icon/function/icon_binglinchengxia.png","80级且军团3级开启，快去提升等级吧！","系统说明文字 对仗极为工整",0,1,1,0,0,},  
    [143] = {10049,"军团铸像一键领取宝箱",10028,0,1,65,0,0,"icon/function/icon_juntuan.png","65级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,65,0,0,},  
    [144] = {10050,"讨伐魔将",10031,1,1,75,0,0,"icon/function/icon_mojiang.png","75级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,75,0,1,},  
    [145] = {10051,"讨伐巨兽—快捷讨伐",10024,1,1,85,0,0,"icon/function/icon_zhuijipanjun.png","85级开启，将军快去挑战吧！","系统说明文字 对仗极为工整",0,1,85,0,1,},  
    [146] = {10052,"精英副本",0,1,1,85,0,0,"icon/function/icon_jingyinfubeng.png","通关主线副本第150章开启，将军快去挑战吧！","系统说明文字 对仗极为工整",0,1,85,0,0,},  
    [147] = {20000,"聊天",0,0,1,10,0,0,"icon/function/icon_liaotian.png","10级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,1,0,0,},  
    [148] = {20001,"招将-普通",0,0,1,1,0,0,"icon/function/icon_zhaojiangtai.png","1级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,1,0,0,},  
    [149] = {20002,"招将-高级",0,0,1,1,0,0,"icon/function/icon_zhaojiangtai.png","1级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,1,0,0,},  
    [150] = {20003,"邮件",0,0,1,5,0,0,"icon/function/icon_youjian.png","5级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,1,0,0,},  
    [151] = {20004,"邮件-一键领取",0,0,1,10,0,0,"icon/function/icon_youjian.png","10级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,10,0,0,},  
    [152] = {20005,"邮件-批量删除",0,0,1,10,0,0,"icon/function/icon_youjian.png","10级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,10,0,0,},  
    [153] = {20006,"战队",0,0,1,10,0,0,"icon/function/icon_huodong.png","10级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,999,0,0,},  
    [154] = {20007,"好友",0,0,1,10,0,0,"icon/function/icon_haoyou.png","10级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,1,0,0,},  
    [155] = {20008,"好友-一键赠送",0,0,1,55,0,0,"icon/function/icon_haoyou.png","55级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,50,0,0,},  
    [156] = {20009,"好友-一键领取",0,0,1,55,0,0,"icon/function/icon_haoyou.png","55级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,50,0,0,},  
    [157] = {20010,"日常任务",1,1,1,20,0,0,"icon/function/icon_hd_rw1.png","20级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,20,0,0,},  
    [158] = {20011,"回收",1,1,1,10,0,0,"icon/function/icon_huishou.png","10级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,5,0,0,},  
    [159] = {20012,"将魂商店",0,0,2,3,0,0,"icon/function/icon_hd_jhsd1.png","通关主线副本第3章开启，将军快去挑战吧！","系统说明文字 对仗极为工整",0,2,3,0,0,},  
    [160] = {20013,"限时商店",0,0,1,999,0,0,"icon/function/icon_hd_xssd1.png","999级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,999,0,0,},  
    [161] = {20014,"成就",1,1,2,4,0,0,"icon/function/icon_hd_rw1.png","通关主线副本第4章开启，将军快去挑战吧！","系统说明文字 对仗极为工整",0,2,4,0,0,},  
    [162] = {20015,"领取体力",0,0,1,10,0,0,"icon/function/icon_lingqutili.png","10级开启，将军快去提升等级吧！","每日签到领大取奖",0,1,10,0,0,},  
    [163] = {20016,"签到",0,0,1,23,0,0,"icon/function/icon_huodong_qiandao.png","23级开启，将军快去提升等级吧！","吃货有大力 大力出奇迹",0,1,23,0,0,},  
    [164] = {20017,"名人堂",0,0,1,26,0,0,"icon/function/icon_mingrentang.png","26级开启，将军快去提升等级吧！","站紫荆之巅  受万人膜拜",0,1,23,0,0,},  
    [165] = {20018,"活动",0,0,1,10,0,0,"icon/function/icon_hd_hd1.png","10级开启，将军快去提升等级吧！","日常活动都在这里",0,1,10,0,0,},  
    [166] = {20019,"走马灯",1,1,1,6,0,0,"icon/function/icon_tujian.png","6级开启，将军快去提升等级吧！","走马灯",0,1,6,0,0,},  
    [167] = {20020,"聊天-世界频道发言和私聊功能",1,1,2,8,0,0,"icon/function/icon_liaotian.png","通关主线副本第8章开启世界聊天和私聊，将军快去挑战吧！","聊天世界频道",0,2,8,0,0,},  
    [168] = {20021,"自动战斗",0,0,1,6,0,0,"icon/function/icon_yijianxunlu.png","6级开启，将军快去提升等级吧！","自动战斗",0,1,6,0,0,},  
    [169] = {20022,"战斗加速",0,0,1,6,0,0,"icon/function/icon_yijianxunlu.png","6级开启，将军快去提升等级吧！","战斗加速",0,1,6,0,0,},  
    [170] = {20023,"暂停战斗",0,0,1,6,0,0,"icon/function/icon_yijianxunlu.png","6级开启，将军快去提升等级吧！","暂停战斗",0,1,6,0,0,},  
    [171] = {20024,"日常副本跳过战斗",0,0,1,25,0,0,"icon/function/icon_richangfuben.png","25级开启，将军快去提升等级吧！","跳过战斗",0,1,20,0,0,},  
    [172] = {20025,"无双试炼跳过战斗",0,0,1,23,0,0,"icon/function/icon_wushuangshilian.png","23级开启，将军快去提升等级吧！","跳过战斗",0,1,23,0,0,},  
    [173] = {20026,"聊天-悬浮icon",0,0,1,10,0,0,"icon/function/icon_liaotian.png","10级开启，将军快去提升等级吧！","聊天-悬浮icon",0,1,10,0,0,},  
    [174] = {20027,"神将列传传记跳过战斗",0,0,1,1,0,0,"icon/function/icon_mingjiangzhuan.png","1级开启，将军快去提升等级吧！","跳过战斗",0,1,1,0,0,},  
    [175] = {20028,"主线副本跳过战斗",0,0,1,1,0,0,"icon/function/icon_zhuxianfuben.png","1级开启，将军快去提升等级吧！","跳过战斗",0,1,1,0,0,},  
    [176] = {20029,"战力竞赛",0,0,1,15,0,0,"icon/function/icon_hd_zljs1.png","15级开启，将军快去提升等级吧！","战力竞赛",0,1,15,0,0,},  
    [177] = {20030,"七日活动",0,0,2,3,0,0,"icon/function/icon_hd_qrhd1.png","通关主线第3章开启，将军快去攻打主线吧！","七日活动",0,2,3,0,0,},  
    [178] = {20031,"将军手卷",0,0,1,999,0,0,"icon/function/icon_renwu.png","7级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,999,0,0,},  
    [179] = {20032,"登陆送礼",0,0,1,5,0,0,"icon/function/icon_hd_dlsl1.png","5级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,5,0,0,},  
    [180] = {20033,"绑定手机",0,0,1,20,0,0,"icon/function/icon_renwu.png","20级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,20,0,0,},  
    [181] = {20034,"主线副本-星数成就",0,0,2,2,0,0,"icon/function/icon_renwu.png","通关主线第2章开启，将军快去攻打主线吧！","系统说明文字 对仗极为工整",0,2,2,0,0,},  
    [182] = {20035,"升级有礼",0,0,1,20,0,0,"icon/function/icon_renwu.png","20级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,20,0,0,},  
    [183] = {20036,"军团竞赛",0,0,1,20,0,0,"icon/function/icon_hd_jtjs1.png","20级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,20,0,0,},  
    [184] = {20037,"抽将返利",0,0,1,5,0,0,"icon/function/icon_renwu.png","5级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,5,0,0,},  
    [185] = {20038,"变强途径",0,0,1,1,0,0,"icon/function/icon_renwu.png","50级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,1,0,0,},  
    [186] = {20039,"武将、兵符收集",0,0,1,99999,0,0,"icon/function/icon_renwu.png","99999级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,99999,0,0,},  
    [187] = {20041,"阵营招将",0,0,5,50,0,0,"icon/function/icon_zhenyingzhaojiang.png","高级招将50次后开启！","系统说明文字 对仗极为工整",0,5,30,0,0,},  
    [188] = {20042,"武将绘卷",0,0,1,15,0,0,"icon/function/icon_wujianghuijuan.png","15级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,15,0,0,},  
    [189] = {20043,"首充",0,0,1,5,0,0,"icon/function/icon_hd_sc1.png","5级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,5,0,0,},  
    [190] = {20044,"天天充值",0,0,2,4,0,0,"icon/function/icon_choujiangfanli.png","通关主线副本第4章开启，将军快去挑战吧！","系统说明文字 对仗极为工整",0,2,4,0,0,},  
    [191] = {20045,"基金",0,0,1,1,0,0,"icon/function/icon_shouchong.png","1级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,1,0,0,},  
    [192] = {20046,"充值",0,0,1,1,0,0,"icon/function/icon_hd_cz1.png","1级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,1,0,0,},  
    [193] = {20047,"月卡",0,0,1,1,0,0,"icon/function/icon_zengli.png","1级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,1,0,0,},  
    [194] = {20048,"订阅",0,0,1,1,0,0,"icon/function/icon_youjian.png","1级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,1,0,0,},  
    [195] = {20049,"阵营光环",0,0,1,5,0,0,"icon/function/icon_renwu.png","5级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,5,0,0,},  
    [196] = {20050,"新服累充",0,0,1,99999,0,0,"icon/function/icon_choujiangfanli.png","99999级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,99999,0,0,},  
    [197] = {20051,"贵族礼包",0,0,1,13,0,0,"icon/function/icon_libao_off.png","13级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,13,0,0,},  
    [198] = {20052,"超划算",0,0,1,25,0,0,"icon/function/icon_zhiyin.png","25级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,25,0,0,},  
    [199] = {20053,"图鉴竞赛",0,0,1,30,0,0,"icon/function/icon_hd_tjjs1.png","30级开启，将军快去提升等级吧！","图鉴竞赛",0,1,30,0,0,},  
    [200] = {20054,"限时商人",0,0,1,15,1,0,"icon/function/icon_youjian.png","活动尚未开启，敬请期待","系统说明文字 对仗极为工整",0,1,15,1,0,},  
    [201] = {20055,"限时商人小人显示",20054,0,1,15,1,0,"icon/function/icon_youjian.png","活动尚未开启，敬请期待","系统说明文字 对仗极为工整",0,1,15,1,0,},  
    [202] = {20056,"限时神将",0,0,1,5,0,0,"icon/function/icon_hd_xswj1.png","活动尚未开启，敬请期待","系统说明文字 对仗极为工整",0,1,20,0,0,},  
    [203] = {20057,"十四日活动",0,0,2,3,0,0,"icon/function/icon_hd_bysd1.png","通关主线第3章开启，将军快去攻打主线吧！","十四日活动",0,2,3,0,0,},  
    [204] = {20058,"吕布喵",0,0,1,10,0,0,"icon/function/icon_renwu.png","活动尚未开启，敬请期待","系统说明文字 对仗极为工整",0,1,10,0,0,},  
    [205] = {20059,"天天充值（8-14日）",0,0,2,4,0,0,"icon/function/icon_choujiangfanli.png","通关主线副本第4章开启，将军快去挑战吧！","系统说明文字 对仗极为工整",0,2,4,0,0,},  
    [206] = {20060,"在线好礼",0,0,1,5,0,0,"icon/function/icon_choujiangfanli.png","活动尚未开启，敬请期待","系统说明文字 对仗极为工整",0,1,5,0,0,},  
    [207] = {20061,"天公赐福",0,0,1,5,0,0,"icon/function/icon_choujiangfanli.png","活动尚未开启，敬请期待","系统说明文字 对仗极为工整",0,1,5,0,0,},  
    [208] = {20062,"每日特惠",0,0,1,38,0,0,"icon/function/icon_choujiangfanli.png","活动尚未开启，敬请期待","系统说明文字 对仗极为工整",0,1,38,0,0,},  
    [209] = {20063,"一键讨伐",0,0,1,52,0,0,"icon/function/icon_zhuijipanjun.png","52级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,48,0,0,},  
    [210] = {20064,"一键领取（巨兽讨伐伤害奖励）",0,0,1,52,0,0,"icon/function/icon_zhuijipanjun.png","52级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,48,0,0,},  
    [211] = {20065,"军团副本一键挑战",0,0,1,50,0,0,"icon/function/icon_juntuan.png","50级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,45,0,0,},  
    [212] = {20066,"武将一键升级",0,0,1,55,0,0,"icon/function/icon_wjiang1.png","55级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,55,0,0,},  
    [213] = {20067,"装备一键精炼",0,0,1,55,0,0,"icon/function/icon_zhuangbei.png","55级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,53,0,0,},  
    [214] = {20068,"拍卖",10025,0,8,2,0,0,"icon/function/icon_hd_rw1.png","开服第2天且达到20级开启，敬请期待！","系统说明文字 对仗极为工整",0,8,2,0,0,},  
    [215] = {20069,"横扫千军",0,0,1,20,0,0,"icon/function/icon_hd_hsqj1.png","活动尚未开启，敬请期待","系统说明文字 对仗极为工整",0,1,20,0,0,},  
    [216] = {20070,"攻城略地",0,0,8,5,0,0,"icon/function/icon_mingrentang.png","开服第五天中午12点且等级达到40级开启，敬请期待！","系统说明文字 对仗极为工整",0,1,40,0,0,},  
    [217] = {20071,"攻城略地特权卡",20070,0,0,0,6,0,"icon/function/icon_mingrentang.png","达到贵族6级开启！","系统说明文字 对仗极为工整",0,0,0,6,0,},  
    [218] = {20072,"每日特惠周卡",20062,0,0,0,6,0,"icon/function/icon_choujiangfanli.png","达到贵族6级开启！","系统说明文字 对仗极为工整",0,0,0,6,0,},  
    [219] = {20073,"资源找回",0,0,1,10,0,0,"icon/function/icon_huishou.png","10级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,10,0,0,},  
    [220] = {20074,"城主榜",20017,1,1,60,0,0,"icon/function/icon_fengdi.png","60级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",1,1,60,0,0,},  
    [221] = {20075,"红包雨",0,0,1,20,0,0,"icon/function/icon_hd_hby.png","20级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,20,0,0,},  
    [222] = {20076,"一键无双(扫荡最大星数）",10031,0,1,60,0,0,"icon/function/icon_wushuangshilian.png","60级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,55,0,0,},  
    [223] = {20077,"分享",0,0,1,15,0,0,"icon/function/icon_renwu.png","15级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,15,0,0,},  
    [224] = {20078,"节日掉落",0,0,1,10,0,0,"icon/function/icon_shizhuang.png","1级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,10,0,0,},  
    [225] = {20079,"欢庆佳节",0,0,1,10,0,0,"icon/function/icon_hd_hqjj1.png","10级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,10,0,0,},  
    [226] = {20080,"心愿商店",0,0,1,56,0,0,"icon/function/icon_hd_xinyuan1.png","56级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,56,0,0,},  
    [227] = {20081,"心愿礼包",0,0,1,56,0,0,"icon/function/icon_hd_xinyuan1.png","56级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,56,0,0,},  
    [228] = {20082,"化身抽取",0,0,1,20,0,0,"icon/function/icon_hd_hsqj1.png","活动尚未开启，敬请期待","系统说明文字 对仗极为工整",0,1,20,0,0,},  
    [229] = {20083,"珍宝商店",20070,0,1,40,0,0,"icon/function/icon_hd_zbsd1.png","开服第五天中午12点开启，敬请期待！","系统说明文字 对仗极为工整",0,1,40,0,0,},  
    [230] = {20084,"神将列传排行榜",0,0,7,3,0,0,"icon/function/icon_mingrentang.png","通关神将列传第3章后开启！","系统说明文字 对仗极为工整",0,7,3,0,0,},  
    [231] = {20085,"武将培养100次",1004,0,1,50,0,0,"icon/function/icon_wjiang1.png","50级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,49,0,0,},  
    [232] = {20086,"皇家贵族",0,0,0,0,12,0,"icon/function/icon_hd_hjgz1.png","vip12开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,0,0,12,0,},  
    [233] = {20087,"宝物一键强化",0,0,1,65,0,0,"icon/function/icon_baowu.png","65级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,64,0,0,},  
    [234] = {20088,"拼多多福袋",0,0,1,20,0,0,"icon/function/icon_baowu.png","20级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,20,0,0,},  
    [235] = {20089,"号令天下",0,0,1,15,0,0,"icon_hd_hltx1.png","15级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,15,0,0,},  
    [236] = {20090,"主城场景更换",0,0,1,10,0,0,"icon/function/icon_baowu.png","10级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,10,0,0,},  
    [237] = {20091,"制作名单",0,0,1,10,0,0,"icon/function/icon_baowu.png","10级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,10,0,0,},  
    [238] = {20092,"神兽秘境",10031,0,1,60,0,0,"icon/function/icon_shenshouxianjing.png","60级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,55,0,0,},  
    [239] = {20093,"神兽商店",0,0,1,60,0,0,"icon/function/icon_hd_shsd1.png","60级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,60,0,0,},  
    [240] = {20094,"月基金",0,0,1,10,0,0,"icon/function/icon_hd_yjj.png","10级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,10,0,0,},  
    [241] = {20095,"老玩家回归",0,0,1,10,0,0,"icon/function/icon_hd_hd1.png","10级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,10,0,0,},  
    [242] = {20096,"富甲天下",0,0,1,20,0,0,"icon/function/icon_hd_fjtx.png","活动尚未开启，敬请期待","系统说明文字 对仗极为工整",0,1,20,0,0,},  
    [243] = {20097,"流失玩家礼包",0,0,1,30,0,0,"icon/function/icon_hd_lslb.png","30级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,30,0,0,},  
    [244] = {20098,"熔炼",0,0,1,120,0,0,"icon/function/icon_huishou.png","120级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,120,0,0,},  
    [245] = {20099,"条件类活动（仅用显示）",0,0,1,1,0,0,"icon/function/icon_hd_hd1.png","1级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,1,0,0,},  
    [246] = {20100,"充值类活动（仅用显示）",0,0,1,1,0,0,"icon/function/icon_hd_hd1.png","1级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,1,0,0,},  
    [247] = {20101,"兑换类活动（仅用显示）",0,0,1,1,0,0,"icon/function/icon_hd_hd1.png","1级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,1,0,0,},  
    [248] = {20102,"天天充值-gm后台（仅用显示）",0,0,1,1,0,0,"icon/function/icon_hd_hd1.png","1级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,1,0,0,},  
    [249] = {20103,"周礼包",0,0,1,10,0,0,"icon/function/icon_hd_yjj.png","10级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,10,0,0,},  
    [250] = {20104,"好友申请等级限制",20007,0,1,15,0,0,"icon/function/icon_haoyou.png","15级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,15,0,0,},  
    [251] = {20105,"少年庆典",0,0,2,10,0,0,"icon/function/icon_hd_snqd.png","通关主线副本第10章开启！","系统说明文字 对仗极为工整",0,1,5,0,0,},  
    [252] = {20106,"主线副本战斗3秒后跳过",0,0,2,8,0,0,"icon/function/icon_haoyou.png","通关主线副本第8章开启！","系统说明文字 对仗极为工整",0,1,6,0,0,},  
    [253] = {20107,"快报",0,0,1,20,0,0,"icon/function/icon_hd_kuaibao.png","20级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,20,0,0,},  
    [254] = {20108,"时空外传—镇魂",0,0,2,30,0,0,"icon/function/icon_shikongwaizhuan.png","通关主线副本第30章开启！","系统说明文字 对仗极为工整",0,1,10,0,0,},  
    [255] = {20109,"三国志—镇魂",0,0,2,30,0,0,"icon/function/icon_shikongwaizhuan.png","通关主线副本第30章开启！","系统说明文字 对仗极为工整",0,1,10,0,0,},  
    [256] = {20110,"置换",0,0,1,85,0,0,"icon/function/icon_zhihuan.png","85级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,85,0,0,},  
    [257] = {20111,"武将置换",20110,0,1,85,0,0,"icon/function/icon_zhihuan.png","85级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,85,0,0,},  
    [258] = {20112,"宝物置换",20110,0,1,85,0,0,"icon/function/icon_zhihuan.png","85级开启，将军快去提升等级吧！","系统说明文字 对仗极为工整",0,1,85,0,0,},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [3] = 3,  
    [4] = 4,  
    [5] = 5,  
    [100] = 6,  
    [101] = 7,  
    [102] = 8,  
    [103] = 9,  
    [200] = 10,  
    [201] = 11,  
    [202] = 12,  
    [203] = 13,  
    [204] = 14,  
    [205] = 15,  
    [206] = 16,  
    [207] = 17,  
    [208] = 18,  
    [209] = 19,  
    [210] = 20,  
    [211] = 21,  
    [212] = 22,  
    [213] = 23,  
    [214] = 24,  
    [1000] = 25,  
    [1001] = 26,  
    [1002] = 27,  
    [1003] = 28,  
    [1004] = 29,  
    [1005] = 30,  
    [1006] = 31,  
    [1007] = 32,  
    [1008] = 33,  
    [1009] = 34,  
    [1010] = 35,  
    [1011] = 36,  
    [1012] = 37,  
    [1013] = 38,  
    [1014] = 39,  
    [1015] = 40,  
    [1100] = 41,  
    [1101] = 42,  
    [1102] = 43,  
    [1103] = 44,  
    [1104] = 45,  
    [1105] = 46,  
    [1200] = 47,  
    [1201] = 48,  
    [1202] = 49,  
    [1203] = 50,  
    [1204] = 51,  
    [1205] = 52,  
    [1206] = 53,  
    [1300] = 54,  
    [1301] = 55,  
    [1302] = 56,  
    [1400] = 57,  
    [1401] = 58,  
    [1402] = 59,  
    [1403] = 60,  
    [1404] = 61,  
    [1405] = 62,  
    [1406] = 63,  
    [1500] = 64,  
    [1501] = 65,  
    [1600] = 66,  
    [1700] = 67,  
    [1701] = 68,  
    [1702] = 69,  
    [1800] = 70,  
    [1900] = 71,  
    [1901] = 72,  
    [1902] = 73,  
    [1903] = 74,  
    [1904] = 75,  
    [1905] = 76,  
    [1906] = 77,  
    [2000] = 78,  
    [2001] = 79,  
    [2100] = 80,  
    [2101] = 81,  
    [2200] = 82,  
    [2201] = 83,  
    [2202] = 84,  
    [2203] = 85,  
    [2204] = 86,  
    [2205] = 87,  
    [2206] = 88,  
    [2207] = 89,  
    [2208] = 90,  
    [2209] = 91,  
    [2210] = 92,  
    [2300] = 93,  
    [2301] = 94,  
    [2302] = 95,  
    [2400] = 96,  
    [2401] = 97,  
    [2402] = 98,  
    [10000] = 99,  
    [10001] = 100,  
    [10002] = 101,  
    [10003] = 102,  
    [10004] = 103,  
    [10005] = 104,  
    [10006] = 105,  
    [10007] = 106,  
    [10008] = 107,  
    [10009] = 108,  
    [10010] = 109,  
    [10011] = 110,  
    [10012] = 111,  
    [10013] = 112,  
    [10014] = 113,  
    [10019] = 114,  
    [10020] = 115,  
    [10021] = 116,  
    [10022] = 117,  
    [10023] = 118,  
    [10024] = 119,  
    [10025] = 120,  
    [10026] = 121,  
    [10027] = 122,  
    [10028] = 123,  
    [10030] = 124,  
    [10031] = 125,  
    [10032] = 126,  
    [10033] = 127,  
    [10034] = 128,  
    [10035] = 129,  
    [10036] = 130,  
    [10037] = 131,  
    [10038] = 132,  
    [10039] = 133,  
    [10040] = 134,  
    [10041] = 135,  
    [10042] = 136,  
    [10043] = 137,  
    [10044] = 138,  
    [10045] = 139,  
    [10046] = 140,  
    [10047] = 141,  
    [10048] = 142,  
    [10049] = 143,  
    [10050] = 144,  
    [10051] = 145,  
    [10052] = 146,  
    [20000] = 147,  
    [20001] = 148,  
    [20002] = 149,  
    [20003] = 150,  
    [20004] = 151,  
    [20005] = 152,  
    [20006] = 153,  
    [20007] = 154,  
    [20008] = 155,  
    [20009] = 156,  
    [20010] = 157,  
    [20011] = 158,  
    [20012] = 159,  
    [20013] = 160,  
    [20014] = 161,  
    [20015] = 162,  
    [20016] = 163,  
    [20017] = 164,  
    [20018] = 165,  
    [20019] = 166,  
    [20020] = 167,  
    [20021] = 168,  
    [20022] = 169,  
    [20023] = 170,  
    [20024] = 171,  
    [20025] = 172,  
    [20026] = 173,  
    [20027] = 174,  
    [20028] = 175,  
    [20029] = 176,  
    [20030] = 177,  
    [20031] = 178,  
    [20032] = 179,  
    [20033] = 180,  
    [20034] = 181,  
    [20035] = 182,  
    [20036] = 183,  
    [20037] = 184,  
    [20038] = 185,  
    [20039] = 186,  
    [20041] = 187,  
    [20042] = 188,  
    [20043] = 189,  
    [20044] = 190,  
    [20045] = 191,  
    [20046] = 192,  
    [20047] = 193,  
    [20048] = 194,  
    [20049] = 195,  
    [20050] = 196,  
    [20051] = 197,  
    [20052] = 198,  
    [20053] = 199,  
    [20054] = 200,  
    [20055] = 201,  
    [20056] = 202,  
    [20057] = 203,  
    [20058] = 204,  
    [20059] = 205,  
    [20060] = 206,  
    [20061] = 207,  
    [20062] = 208,  
    [20063] = 209,  
    [20064] = 210,  
    [20065] = 211,  
    [20066] = 212,  
    [20067] = 213,  
    [20068] = 214,  
    [20069] = 215,  
    [20070] = 216,  
    [20071] = 217,  
    [20072] = 218,  
    [20073] = 219,  
    [20074] = 220,  
    [20075] = 221,  
    [20076] = 222,  
    [20077] = 223,  
    [20078] = 224,  
    [20079] = 225,  
    [20080] = 226,  
    [20081] = 227,  
    [20082] = 228,  
    [20083] = 229,  
    [20084] = 230,  
    [20085] = 231,  
    [20086] = 232,  
    [20087] = 233,  
    [20088] = 234,  
    [20089] = 235,  
    [20090] = 236,  
    [20091] = 237,  
    [20092] = 238,  
    [20093] = 239,  
    [20094] = 240,  
    [20095] = 241,  
    [20096] = 242,  
    [20097] = 243,  
    [20098] = 244,  
    [20099] = 245,  
    [20100] = 246,  
    [20101] = 247,  
    [20102] = 248,  
    [20103] = 249,  
    [20104] = 250,  
    [20105] = 251,  
    [20106] = 252,  
    [20107] = 253,  
    [20108] = 254,  
    [20109] = 255,  
    [20110] = 256,  
    [20111] = 257,  
    [20112] = 258,
}

local __key_map = { 
    id = 1,
    name = 2,
    preset_ID = 3,
    unlock_type = 4,
    level_type = 5,
    level = 6,
    vip_level = 7,
    privilege_type = 8,
    icon = 9,
    lock_direction = 10,
    show_function_description = 11,
    show_unlock_type = 12,
    show_level_type = 13,
    show_level = 14,
    show_vip_level = 15,
    turn_on_type = 16,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_function_info")

        return t._raw[__key_map[k]]
    end
}


function function_info.getLength()
    return #function_info._data
end



function function_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_function_info
function function_info.indexOf(index)
    if index == nil or not function_info._data[index] then
        return nil
    end
    return setmetatable({_raw = function_info._data[index]}, m)
end



---
--@return @class record_function_info
function function_info.get(id)
    
    return function_info.indexOf(__index_id[ id ])
     
end



function function_info.set(id, key, value)
    local record = function_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function function_info.get_index_data()
    return __index_id 
end

return  function_info 