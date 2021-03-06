---@classdef record_auction_item_info
local record_auction_item_info = {}


record_auction_item_info.id = 0--id
record_auction_item_info.service_time_min = 0--开服天数下限
record_auction_item_info.service_time_max = 0--开服天数上限
record_auction_item_info.guild_parameter = 0--军团排名参数
record_auction_item_info.pool = 0--所属货物池
record_auction_item_info.item_num_min = 0--出货最小组数
record_auction_item_info.item_num_max = 0--出货最大组数
record_auction_item_info.tab = 0--所属页签
record_auction_item_info.tab_name =  ""--页签名称
record_auction_item_info.name =  ""--货物名称
record_auction_item_info.type = 0--货物类型
record_auction_item_info.value = 0--货物类型值
record_auction_item_info.size = 0--货物数量
record_auction_item_info.quality = 0--货物品质
record_auction_item_info.price_min = 0--竞拍底价
record_auction_item_info.price_add = 0--递增步长
record_auction_item_info.price_max = 0--一口价
record_auction_item_info.fixed_price_vip = 0--一口价VIP限制
record_auction_item_info.pro = 0--出货概率
record_auction_item_info.order = 0--排序
record_auction_item_info.if_show = 0--是否显示

local auction_item_info = {
   _data = {   
    [1] = {1001,1,9999999,9999999,1,0,0,1,"符石","苍叶绿绮琴",2,23060,100,7,30000,2000,90000,0,0,11,0,},  
    [2] = {1002,1,9999999,9999999,1,0,0,1,"符石","苍叶绿绮琴碎片",2,23060,10,7,3000,200,9000,0,0,12,0,},  
    [3] = {2001,1,4,1,2,0,0,1,"符石","全红将选择箱",3,2061,1,6,4000,400,8000,0,0,11,0,},  
    [4] = {2002,1,4,3,2,0,0,1,"符石","全红将选择箱",3,2061,1,6,4000,400,8000,0,0,12,0,},  
    [5] = {2003,1,4,5,2,0,0,1,"符石","全红将选择箱",3,2061,1,6,4000,400,8000,0,0,13,0,},  
    [6] = {2004,1,4,9999999,2,0,0,1,"符石","核心红将碎片箱（一）",3,2034,10,6,500,50,1000,0,0,14,0,},  
    [7] = {2005,1,4,9999999,2,0,0,1,"符石","核心红将碎片箱（二）",3,2035,10,6,500,50,1000,0,0,16,0,},  
    [8] = {2006,1,4,9999999,2,0,0,1,"符石","红将碎片选择箱",3,2036,10,6,500,50,1000,0,0,18,0,},  
    [9] = {2007,1,4,9999999,2,0,0,1,"符石","核心红将碎片箱（一）",3,2034,10,6,500,50,1000,0,0,15,0,},  
    [10] = {2008,1,4,9999999,2,0,0,1,"符石","核心红将碎片箱（二）",3,2035,10,6,500,50,1000,0,0,17,0,},  
    [11] = {2009,1,4,9999999,2,0,0,1,"符石","红将碎片选择箱",3,2036,10,6,500,50,1000,0,0,19,0,},  
    [12] = {2010,1,4,9999999,2,0,0,1,"符石","兵符铸造石",3,32,20,6,300,100,1100,0,0,20,0,},  
    [13] = {2011,6,14,9999999,2,0,0,1,"符石","孟德新书碎片1",2,11321,1,6,500,50,1000,0,0,21,0,},  
    [14] = {2012,6,14,9999999,2,0,0,1,"符石","太平要术碎片1",2,11211,1,6,500,50,1000,0,0,23,0,},  
    [15] = {2013,6,14,9999999,2,0,0,1,"符石","丞相印碎片1",2,12321,1,6,500,50,1000,0,0,25,0,},  
    [16] = {2014,6,14,9999999,2,0,0,1,"符石","将军印碎片1",2,12211,1,6,500,50,1000,0,0,27,0,},  
    [17] = {2015,6,14,9999999,2,0,0,1,"符石","孟德新书碎片1",2,11321,1,6,500,50,1000,0,0,22,0,},  
    [18] = {2016,6,14,9999999,2,0,0,1,"符石","太平要术碎片1",2,11211,1,6,500,50,1000,0,0,24,0,},  
    [19] = {2017,6,14,9999999,2,0,0,1,"符石","丞相印碎片1",2,12321,1,6,500,50,1000,0,0,26,0,},  
    [20] = {2018,6,14,9999999,2,0,0,1,"符石","将军印碎片1",2,12211,1,6,500,50,1000,0,0,28,0,},  
    [21] = {2019,6,14,9999999,2,0,0,1,"符石","兵符铸造石",3,32,20,6,300,100,1100,0,0,29,0,},  
    [22] = {2020,15,9999999,1,2,0,0,1,"符石","金将碎片箱（一）",3,2038,5,7,1000,100,2000,0,0,11,0,},  
    [23] = {2021,15,9999999,3,2,0,0,1,"符石","金将碎片箱（一）",3,2038,5,7,1000,100,2000,0,0,12,0,},  
    [24] = {2022,15,9999999,5,2,0,0,1,"符石","金将碎片箱（一）",3,2038,5,7,1000,100,2000,0,0,13,0,},  
    [25] = {2023,15,9999999,9999999,2,0,0,1,"符石","金将碎片箱（一）",3,2038,2,7,400,50,800,0,0,14,0,},  
    [26] = {2024,15,9999999,9999999,2,0,0,1,"符石","全红将选择箱",3,2061,1,6,3200,400,7200,0,0,15,0,},  
    [27] = {2025,15,9999999,9999999,2,0,0,1,"符石","孟德新书碎片1",2,11321,1,6,450,50,1000,0,0,16,0,},  
    [28] = {2026,15,9999999,9999999,2,0,0,1,"符石","太平要术碎片1",2,11211,1,6,450,50,1000,0,0,17,0,},  
    [29] = {2027,15,9999999,9999999,2,0,0,1,"符石","丞相印碎片1",2,12321,1,6,450,50,1000,0,0,18,0,},  
    [30] = {2028,15,9999999,9999999,2,0,0,1,"符石","将军印碎片1",2,12211,1,6,450,50,1000,0,0,19,0,},  
    [31] = {2029,15,9999999,9999999,2,0,0,1,"符石","兵符铸造石",3,32,30,6,300,150,1500,0,0,20,0,},  
    [32] = {2030,5,5,1,2,0,0,1,"符石","全红将选择箱",3,2061,1,6,4000,400,8000,0,0,11,0,},  
    [33] = {2031,5,5,3,2,0,0,1,"符石","全红将选择箱",3,2061,1,6,4000,400,8000,0,0,12,0,},  
    [34] = {2032,5,5,5,2,0,0,1,"符石","全红将选择箱",3,2061,1,6,4000,400,8000,0,0,13,0,},  
    [35] = {2033,5,5,9999999,2,0,0,1,"符石","核心红将碎片箱（一）",3,2034,10,6,500,50,1000,0,0,14,0,},  
    [36] = {2034,5,5,9999999,2,0,0,1,"符石","核心红将碎片箱（二）",3,2035,10,6,500,50,1000,0,0,16,0,},  
    [37] = {2035,5,5,9999999,2,0,0,1,"符石","红将碎片选择箱",3,2036,10,6,500,50,1000,0,0,18,0,},  
    [38] = {2036,5,5,9999999,2,0,0,1,"符石","核心红将碎片箱（一）",3,2034,10,6,500,50,1000,0,0,15,0,},  
    [39] = {2037,5,5,9999999,2,0,0,1,"符石","核心红将碎片箱（二）",3,2035,10,6,500,50,1000,0,0,17,0,},  
    [40] = {2038,5,5,9999999,2,0,0,1,"符石","红将碎片选择箱",3,2036,10,6,500,50,1000,0,0,19,0,},  
    [41] = {2039,5,5,9999999,2,0,0,1,"符石","兵符铸造石",3,32,20,6,300,100,1100,0,0,20,0,},  
    [42] = {2040,6,14,1,2,0,0,1,"符石","全红将选择箱",3,2061,1,6,4000,400,8000,0,0,11,0,},  
    [43] = {2041,6,14,3,2,0,0,1,"符石","全红将选择箱",3,2061,1,6,4000,400,8000,0,0,12,0,},  
    [44] = {2042,6,14,5,2,0,0,1,"符石","全红将选择箱",3,2061,1,6,4000,400,8000,0,0,13,0,},  
    [45] = {2043,6,14,9999999,2,0,0,1,"符石","核心红将碎片箱（一）",3,2034,10,6,500,50,1000,0,0,14,0,},  
    [46] = {2044,6,14,9999999,2,0,0,1,"符石","核心红将碎片箱（二）",3,2035,10,6,500,50,1000,0,0,16,0,},  
    [47] = {2045,6,14,9999999,2,0,0,1,"符石","红将碎片选择箱",3,2036,10,6,500,50,1000,0,0,18,0,},  
    [48] = {2046,6,14,9999999,2,0,0,1,"符石","核心红将碎片箱（一）",3,2034,10,6,500,50,1000,0,0,15,0,},  
    [49] = {2047,6,14,9999999,2,0,0,1,"符石","核心红将碎片箱（二）",3,2035,10,6,500,50,1000,0,0,17,0,},  
    [50] = {2048,6,14,9999999,2,0,0,1,"符石","红将碎片选择箱",3,2036,10,6,500,50,1000,0,0,19,0,},  
    [51] = {3001,15,9999999,1,3,0,0,1,"符石","金将碎片箱（一）",3,2038,10,7,2000,200,4000,0,0,11,0,},  
    [52] = {3002,15,9999999,5,3,0,0,1,"符石","金将碎片箱（一）",3,2038,10,7,2000,200,4000,0,0,12,0,},  
    [53] = {3003,15,9999999,10,3,0,0,1,"符石","金将碎片箱（一）",3,2038,10,7,2000,200,4000,0,0,13,0,},  
    [54] = {3004,15,9999999,9999999,3,0,0,1,"符石","金将碎片箱（一）",3,2038,3,7,600,50,1200,0,0,14,0,},  
    [55] = {3005,15,9999999,9999999,3,0,0,1,"符石","全红将选择箱",3,2061,1,6,3200,400,7200,0,0,15,0,},  
    [56] = {3006,15,9999999,9999999,3,0,0,1,"符石","孟德新书碎片1",2,11321,2,6,800,100,1800,0,0,16,0,},  
    [57] = {3007,15,9999999,9999999,3,0,0,1,"符石","太平要术碎片1",2,11211,2,6,800,100,1800,0,0,17,0,},  
    [58] = {3008,15,9999999,9999999,3,0,0,1,"符石","丞相印碎片1",2,12321,2,6,800,100,1800,0,0,18,0,},  
    [59] = {3009,15,9999999,9999999,3,0,0,1,"符石","将军印碎片1",2,12211,2,6,800,100,1800,0,0,19,0,},  
    [60] = {3010,15,9999999,9999999,3,0,0,1,"符石","兵符铸造石",3,32,50,6,350,250,2500,0,0,20,0,},  
    [61] = {10001,1,30,9999999,1,5,20,1,"符石","日曜符石",3,63,1,6,2400,200,6000,0,1000,1,1,},  
    [62] = {10002,1,30,9999999,1,5,50,1,"符石","月辉符石",3,62,1,5,1200,100,3000,0,1000,2,1,},  
    [63] = {10003,31,59,9999999,1,5,30,1,"符石","日曜符石",3,63,1,6,2400,200,6000,0,1000,1,1,},  
    [64] = {10004,31,59,9999999,1,5,30,1,"符石","月辉符石",3,62,1,5,1200,100,3000,0,1000,2,1,},  
    [65] = {10005,60,9999999,9999999,1,4,10,1,"符石","神意符石",3,64,1,7,6000,600,15000,0,1000,3,1,},  
    [66] = {10006,60,9999999,9999999,1,5,30,1,"符石","日曜符石",3,63,1,6,2400,200,6000,0,1000,5,1,},  
    [67] = {10007,60,9999999,9999999,1,5,30,1,"符石","月辉符石",3,62,1,5,1200,100,3000,0,1000,6,1,},  
    [68] = {10008,60,9999999,9999999,1,2,5,2,"命星","全红命星选择箱",3,2346,1,6,1250,250,3000,0,1000,4,1,},  
    [69] = {10009,60,9999999,9999999,1,2,5,2,"命星","金色命星随机箱",3,2366,1,7,3500,500,8000,0,1000,2,1,},  
    [70] = {10010,60,9999999,9999999,1,1,3,1,"符石","天威符石",3,219,1,8,7500,750,18750,0,1000,1,1,},  
    [71] = {10011,60,9999999,9999999,1,10,15,3,"神兵洗炼","上品洗炼晶玉",3,233,1,7,2800,600,6000,0,1000,1,1,},  
    [72] = {10012,60,9999999,9999999,1,20,30,4,"图腾","图腾之灵",3,231,1,5,350,100,800,0,1000,1,1,},  
    [73] = {20001,1,7,1,2,1,1,1,"符石","月辉符石",3,62,1,5,1200,100,3000,0,1000,1,1,},  
    [74] = {20002,1,7,3,2,1,1,1,"符石","月辉符石",3,62,1,5,1200,100,3000,0,1000,2,0,},  
    [75] = {20003,1,7,5,2,1,1,1,"符石","月辉符石",3,62,1,5,1200,100,3000,0,1000,3,0,},  
    [76] = {20004,1,7,9999999,2,0,3,1,"符石","月辉符石",3,62,1,5,1200,100,3000,0,1000,4,0,},  
    [77] = {20005,1,7,9999999,2,1,8,1,"符石","星辰符石",3,61,1,4,400,50,1000,0,1000,5,1,},  
    [78] = {21001,8,29,1,2,1,1,1,"符石","月辉符石",3,62,1,5,1200,100,3000,0,1000,1,1,},  
    [79] = {21002,8,29,3,2,1,1,1,"符石","月辉符石",3,62,1,5,1200,100,3000,0,1000,2,0,},  
    [80] = {21003,8,29,5,2,1,1,1,"符石","月辉符石",3,62,1,5,1200,100,3000,0,1000,3,0,},  
    [81] = {21004,8,29,9999999,2,1,6,1,"符石","月辉符石",3,62,1,5,1200,100,3000,0,1000,4,0,},  
    [82] = {21005,8,29,9999999,2,1,6,1,"符石","星辰符石",3,61,1,4,400,50,1000,0,1000,5,1,},  
    [83] = {21006,30,59,1,2,1,1,1,"符石","日曜符石",3,63,1,6,2400,250,6000,0,1000,6,1,},  
    [84] = {21007,30,59,2,2,1,1,1,"符石","日曜符石",3,63,1,6,2400,250,6000,0,1000,7,0,},  
    [85] = {21008,30,59,3,2,1,1,1,"符石","日曜符石",3,63,1,6,2400,250,6000,0,1000,8,0,},  
    [86] = {21009,30,59,9999999,2,1,6,1,"符石","月辉符石",3,62,1,5,1200,100,3000,0,1000,9,1,},  
    [87] = {21010,30,59,9999999,2,1,6,1,"符石","星辰符石",3,61,1,4,400,50,1000,0,1000,10,1,},  
    [88] = {22001,60,9999999,1,2,1,1,1,"符石","神意符石",3,64,1,7,6000,600,15000,0,600,3,1,},  
    [89] = {22002,60,9999999,1,2,1,1,1,"符石","日曜符石",3,63,1,6,2400,250,6000,0,1000,7,1,},  
    [90] = {22003,60,9999999,2,2,1,1,1,"符石","日曜符石",3,63,1,6,2400,250,6000,0,1000,8,0,},  
    [91] = {22004,60,9999999,3,2,1,1,1,"符石","日曜符石",3,63,1,6,2400,250,6000,0,1000,9,0,},  
    [92] = {22005,60,9999999,9999999,2,1,6,1,"符石","月辉符石",3,62,1,5,1200,100,3000,0,1000,10,1,},  
    [93] = {22006,60,9999999,9999999,2,1,6,1,"符石","星辰符石",3,61,1,4,400,50,1000,0,1000,11,1,},  
    [94] = {22007,60,9999999,1,2,1,1,2,"命星","全红命星选择箱",3,2346,1,6,1250,250,3000,0,250,4,1,},  
    [95] = {22008,60,9999999,2,2,1,1,2,"命星","全红命星选择箱",3,2346,1,6,1250,250,3000,0,250,5,0,},  
    [96] = {22009,60,9999999,3,2,1,1,2,"命星","全红命星选择箱",3,2346,1,6,1250,250,3000,0,250,6,0,},  
    [97] = {22010,60,9999999,1,2,1,1,2,"命星","金色命星随机箱",3,2366,1,7,3500,500,8000,0,800,2,1,},  
    [98] = {22011,60,9999999,1,2,1,1,1,"符石","天威符石",3,219,1,8,7500,750,18750,0,100,1,1,},  
    [99] = {22012,60,9999999,1,2,1,1,3,"神兵洗炼","上品洗炼晶玉",3,233,1,7,2800,600,6000,0,1000,1,1,},  
    [100] = {22013,60,9999999,2,2,1,1,3,"神兵洗炼","上品洗炼晶玉",3,233,1,7,2800,600,6000,0,600,1,0,},  
    [101] = {22014,60,9999999,3,2,1,1,3,"神兵洗炼","上品洗炼晶玉",3,233,1,7,2800,600,6000,0,400,1,0,},  
    [102] = {22015,60,9999999,1,2,3,3,4,"图腾","图腾之灵",3,231,1,5,350,100,800,0,1000,1,1,},  
    [103] = {22016,60,9999999,2,2,2,2,4,"图腾","图腾之灵",3,231,1,5,350,100,800,0,1000,1,0,},  
    [104] = {22017,60,9999999,3,2,1,1,4,"图腾","图腾之灵",3,231,1,5,350,100,800,0,1000,1,0,},  
    [105] = {30001,15,59,1,3,1,1,1,"符石","日曜符石",3,63,1,6,2400,250,6000,0,1000,1,1,},  
    [106] = {30002,15,59,3,3,1,1,1,"符石","日曜符石",3,63,1,6,2400,250,6000,0,1000,2,0,},  
    [107] = {30003,15,59,5,3,1,1,1,"符石","日曜符石",3,63,1,6,2400,250,6000,0,1000,3,0,},  
    [108] = {30004,15,59,9999999,3,1,5,1,"符石","日曜符石",3,63,1,6,2400,250,6000,0,1000,4,0,},  
    [109] = {30005,15,59,9999999,3,1,10,1,"符石","月辉符石",3,62,1,5,1200,100,3000,0,1000,5,1,},  
    [110] = {31001,60,9999999,1,3,1,1,1,"符石","神意符石",3,64,1,7,6000,600,15000,0,1000,7,1,},  
    [111] = {31002,60,9999999,3,3,1,1,1,"符石","神意符石",3,64,1,7,6000,600,15000,0,800,8,0,},  
    [112] = {31003,60,9999999,5,3,1,1,1,"符石","神意符石",3,64,1,7,6000,600,15000,0,600,9,0,},  
    [113] = {31004,60,9999999,1,3,1,1,1,"符石","日曜符石",3,63,1,6,2400,250,6000,0,1000,15,1,},  
    [114] = {31005,60,9999999,3,3,1,1,1,"符石","日曜符石",3,63,1,6,2400,250,6000,0,1000,16,0,},  
    [115] = {31006,60,9999999,5,3,1,1,1,"符石","日曜符石",3,63,1,6,2400,250,6000,0,1000,17,0,},  
    [116] = {31007,60,9999999,9999999,3,1,5,1,"符石","日曜符石",3,63,1,6,2400,250,6000,0,1000,18,0,},  
    [117] = {31008,60,9999999,9999999,3,1,10,1,"符石","月辉符石",3,62,1,5,1200,100,3000,0,1000,19,1,},  
    [118] = {31009,60,9999999,1,3,1,1,2,"命星","全红命星选择箱",3,2346,1,6,1250,250,3000,0,500,11,1,},  
    [119] = {31010,60,9999999,3,3,1,1,2,"命星","全红命星选择箱",3,2346,1,6,1250,250,3000,0,500,12,0,},  
    [120] = {31011,60,9999999,5,3,1,1,2,"命星","全红命星选择箱",3,2346,1,6,1250,250,3000,0,500,13,0,},  
    [121] = {31012,60,9999999,9999999,3,1,2,2,"命星","全红命星选择箱",3,2346,1,6,1250,250,3000,0,1000,14,0,},  
    [122] = {31013,60,9999999,1,3,1,1,2,"命星","金色命星随机箱",3,2366,1,7,3500,500,8000,0,1000,4,1,},  
    [123] = {31014,60,9999999,3,3,1,1,2,"命星","金色命星随机箱",3,2366,1,7,3500,500,8000,0,600,5,0,},  
    [124] = {31015,60,9999999,5,3,1,1,2,"命星","金色命星随机箱",3,2366,1,7,3500,500,8000,0,400,6,0,},  
    [125] = {31016,60,9999999,1,3,1,1,1,"符石","天威符石",3,219,1,8,7500,750,18750,0,500,1,1,},  
    [126] = {31017,60,9999999,3,3,1,1,1,"符石","天威符石",3,219,1,8,7500,750,18750,0,300,2,0,},  
    [127] = {31018,60,9999999,5,3,1,1,1,"符石","天威符石",3,219,1,8,7500,750,18750,0,200,3,0,},  
    [128] = {31019,60,9999999,10,3,1,1,1,"符石","神意符石",3,64,1,7,6000,600,15000,0,400,10,0,},  
    [129] = {31020,60,9999999,1,3,2,2,3,"神兵洗炼","上品洗炼晶玉",3,233,1,7,2800,600,6000,0,1000,1,1,},  
    [130] = {31021,60,9999999,3,3,1,1,3,"神兵洗炼","上品洗炼晶玉",3,233,1,7,2800,600,6000,0,1000,1,0,},  
    [131] = {31022,60,9999999,5,3,1,1,3,"神兵洗炼","上品洗炼晶玉",3,233,1,7,2800,600,6000,0,1000,1,0,},  
    [132] = {31023,60,9999999,1,3,5,5,4,"图腾","图腾之灵",3,231,1,5,350,100,800,0,1000,1,1,},  
    [133] = {31024,60,9999999,3,3,3,3,4,"图腾","图腾之灵",3,231,1,5,350,100,800,0,1000,1,0,},  
    [134] = {31025,60,9999999,5,3,2,2,4,"图腾","图腾之灵",3,231,1,5,350,100,800,0,1000,1,0,},  
    [135] = {31026,60,9999999,9999999,3,1,2,4,"图腾","图腾之灵",3,231,1,5,350,100,800,0,1000,1,0,},
    }
}

local __index_id = {   
    [1001] = 1,  
    [1002] = 2,  
    [2001] = 3,  
    [2002] = 4,  
    [2003] = 5,  
    [2004] = 6,  
    [2005] = 7,  
    [2006] = 8,  
    [2007] = 9,  
    [2008] = 10,  
    [2009] = 11,  
    [2010] = 12,  
    [2011] = 13,  
    [2012] = 14,  
    [2013] = 15,  
    [2014] = 16,  
    [2015] = 17,  
    [2016] = 18,  
    [2017] = 19,  
    [2018] = 20,  
    [2019] = 21,  
    [2020] = 22,  
    [2021] = 23,  
    [2022] = 24,  
    [2023] = 25,  
    [2024] = 26,  
    [2025] = 27,  
    [2026] = 28,  
    [2027] = 29,  
    [2028] = 30,  
    [2029] = 31,  
    [2030] = 32,  
    [2031] = 33,  
    [2032] = 34,  
    [2033] = 35,  
    [2034] = 36,  
    [2035] = 37,  
    [2036] = 38,  
    [2037] = 39,  
    [2038] = 40,  
    [2039] = 41,  
    [2040] = 42,  
    [2041] = 43,  
    [2042] = 44,  
    [2043] = 45,  
    [2044] = 46,  
    [2045] = 47,  
    [2046] = 48,  
    [2047] = 49,  
    [2048] = 50,  
    [3001] = 51,  
    [3002] = 52,  
    [3003] = 53,  
    [3004] = 54,  
    [3005] = 55,  
    [3006] = 56,  
    [3007] = 57,  
    [3008] = 58,  
    [3009] = 59,  
    [3010] = 60,  
    [10001] = 61,  
    [10002] = 62,  
    [10003] = 63,  
    [10004] = 64,  
    [10005] = 65,  
    [10006] = 66,  
    [10007] = 67,  
    [10008] = 68,  
    [10009] = 69,  
    [10010] = 70,  
    [10011] = 71,  
    [10012] = 72,  
    [20001] = 73,  
    [20002] = 74,  
    [20003] = 75,  
    [20004] = 76,  
    [20005] = 77,  
    [21001] = 78,  
    [21002] = 79,  
    [21003] = 80,  
    [21004] = 81,  
    [21005] = 82,  
    [21006] = 83,  
    [21007] = 84,  
    [21008] = 85,  
    [21009] = 86,  
    [21010] = 87,  
    [22001] = 88,  
    [22002] = 89,  
    [22003] = 90,  
    [22004] = 91,  
    [22005] = 92,  
    [22006] = 93,  
    [22007] = 94,  
    [22008] = 95,  
    [22009] = 96,  
    [22010] = 97,  
    [22011] = 98,  
    [22012] = 99,  
    [22013] = 100,  
    [22014] = 101,  
    [22015] = 102,  
    [22016] = 103,  
    [22017] = 104,  
    [30001] = 105,  
    [30002] = 106,  
    [30003] = 107,  
    [30004] = 108,  
    [30005] = 109,  
    [31001] = 110,  
    [31002] = 111,  
    [31003] = 112,  
    [31004] = 113,  
    [31005] = 114,  
    [31006] = 115,  
    [31007] = 116,  
    [31008] = 117,  
    [31009] = 118,  
    [31010] = 119,  
    [31011] = 120,  
    [31012] = 121,  
    [31013] = 122,  
    [31014] = 123,  
    [31015] = 124,  
    [31016] = 125,  
    [31017] = 126,  
    [31018] = 127,  
    [31019] = 128,  
    [31020] = 129,  
    [31021] = 130,  
    [31022] = 131,  
    [31023] = 132,  
    [31024] = 133,  
    [31025] = 134,  
    [31026] = 135,
}

local __key_map = { 
    id = 1,
    service_time_min = 2,
    service_time_max = 3,
    guild_parameter = 4,
    pool = 5,
    item_num_min = 6,
    item_num_max = 7,
    tab = 8,
    tab_name = 9,
    name = 10,
    type = 11,
    value = 12,
    size = 13,
    quality = 14,
    price_min = 15,
    price_add = 16,
    price_max = 17,
    fixed_price_vip = 18,
    pro = 19,
    order = 20,
    if_show = 21,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_auction_item_info")

        return t._raw[__key_map[k]]
    end
}


function auction_item_info.getLength()
    return #auction_item_info._data
end



function auction_item_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_auction_item_info
function auction_item_info.indexOf(index)
    if index == nil or not auction_item_info._data[index] then
        return nil
    end
    return setmetatable({_raw = auction_item_info._data[index]}, m)
end



---
--@return @class record_auction_item_info
function auction_item_info.get(id)
    
    return auction_item_info.indexOf(__index_id[ id ])
     
end



function auction_item_info.set(id, key, value)
    local record = auction_item_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function auction_item_info.get_index_data()
    return __index_id 
end

return  auction_item_info 