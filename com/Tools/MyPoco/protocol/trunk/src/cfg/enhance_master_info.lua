---@classdef record_enhance_master_info
local record_enhance_master_info = {}


record_enhance_master_info.id = 0--id
record_enhance_master_info.name =  ""--名称
record_enhance_master_info.type = 0--类型
record_enhance_master_info.value = 0--类型值
record_enhance_master_info.affect_type_1 = 0--加成属性1
record_enhance_master_info.affect_value_1 = 0--加成类型值1
record_enhance_master_info.affect_type_2 = 0--加成属性2
record_enhance_master_info.affect_value_2 = 0--加成类型值2
record_enhance_master_info.affect_type_3 = 0--加成属性3
record_enhance_master_info.affect_value_3 = 0--加成类型值3
record_enhance_master_info.affect_type_4 = 0--加成属性4
record_enhance_master_info.affect_value_4 = 0--加成类型值4
record_enhance_master_info.description =  ""--名称
record_enhance_master_info.master_name =  ""--名称

local enhance_master_info = {
   _data = {   
    [1] = {1001,"装备强化10级",1,10,1,1000,2,100,3,50,4,50,"全身装备强化至10级！","强化大师1级",},  
    [2] = {1002,"装备强化20级",1,20,1,2200,2,220,3,110,4,110,"全身装备强化至20级！","强化大师2级",},  
    [3] = {1003,"装备强化30级",1,30,1,3600,2,360,3,180,4,180,"全身装备强化至30级！","强化大师3级",},  
    [4] = {1004,"装备强化40级",1,40,1,5200,2,520,3,260,4,260,"全身装备强化至40级！","强化大师4级",},  
    [5] = {1005,"装备强化50级",1,50,1,7000,2,700,3,350,4,350,"全身装备强化至50级！","强化大师5级",},  
    [6] = {1006,"装备强化60级",1,60,1,9000,2,900,3,450,4,450,"全身装备强化至60级！","强化大师6级",},  
    [7] = {1007,"装备强化70级",1,70,1,11200,2,1120,3,560,4,560,"全身装备强化至70级！","强化大师7级",},  
    [8] = {1008,"装备强化80级",1,80,1,13600,2,1360,3,680,4,680,"全身装备强化至80级！","强化大师8级",},  
    [9] = {1009,"装备强化90级",1,90,1,16200,2,1620,3,810,4,810,"全身装备强化至90级！","强化大师9级",},  
    [10] = {1010,"装备强化100级",1,100,1,19000,2,1900,3,950,4,950,"全身装备强化至100级！","强化大师10级",},  
    [11] = {1011,"装备强化110级",1,110,1,22000,2,2200,3,1100,4,1100,"全身装备强化至110级！","强化大师11级",},  
    [12] = {1012,"装备强化120级",1,120,1,25200,2,2520,3,1260,4,1260,"全身装备强化至120级！","强化大师12级",},  
    [13] = {1013,"装备强化130级",1,130,1,28600,2,2860,3,1430,4,1430,"全身装备强化至130级！","强化大师13级",},  
    [14] = {1014,"装备强化140级",1,140,1,32200,2,3220,3,1610,4,1610,"全身装备强化至140级！","强化大师14级",},  
    [15] = {1015,"装备强化150级",1,150,1,36000,2,3600,3,1800,4,1800,"全身装备强化至150级！","强化大师15级",},  
    [16] = {1016,"装备强化160级",1,160,1,40000,2,4000,3,2000,4,2000,"全身装备强化至160级！","强化大师16级",},  
    [17] = {1017,"装备强化170级",1,170,1,44200,2,4420,3,2210,4,2210,"全身装备强化至170级！","强化大师17级",},  
    [18] = {1018,"装备强化180级",1,180,1,48600,2,4860,3,2430,4,2430,"全身装备强化至180级！","强化大师18级",},  
    [19] = {1019,"装备强化190级",1,190,1,53200,2,5320,3,2660,4,2660,"全身装备强化至190级！","强化大师19级",},  
    [20] = {1020,"装备强化200级",1,200,1,58000,2,5800,3,2900,4,2900,"全身装备强化至200级！","强化大师20级",},  
    [21] = {1021,"装备强化210级",1,210,1,63000,2,6300,3,3150,4,3150,"全身装备强化至210级！","强化大师21级",},  
    [22] = {1022,"装备强化220级",1,220,1,68200,2,6820,3,3410,4,3410,"全身装备强化至220级！","强化大师22级",},  
    [23] = {1023,"装备强化230级",1,230,1,73600,2,7360,3,3680,4,3680,"全身装备强化至230级！","强化大师23级",},  
    [24] = {1024,"装备强化240级",1,240,1,79200,2,7920,3,3960,4,3960,"全身装备强化至240级！","强化大师24级",},  
    [25] = {1025,"装备强化250级",1,250,1,85000,2,8500,3,4250,4,4250,"全身装备强化至250级！","强化大师25级",},  
    [26] = {1026,"装备强化260级",1,260,1,91000,2,9100,3,4550,4,4550,"全身装备强化至260级！","强化大师26级",},  
    [27] = {1027,"装备强化270级",1,270,1,97200,2,9720,3,4860,4,4860,"全身装备强化至270级！","强化大师27级",},  
    [28] = {1028,"装备强化280级",1,280,1,103600,2,10360,3,5180,4,5180,"全身装备强化至280级！","强化大师28级",},  
    [29] = {1029,"装备强化290级",1,290,1,110200,2,11020,3,5510,4,5510,"全身装备强化至290级！","强化大师29级",},  
    [30] = {1030,"装备强化300级",1,300,1,117000,2,11700,3,5850,4,5850,"全身装备强化至300级！","强化大师30级",},  
    [31] = {1031,"装备强化310级",1,310,1,124000,2,12400,3,6200,4,6200,"全身装备强化至310级！","强化大师31级",},  
    [32] = {1032,"装备强化320级",1,320,1,131200,2,13120,3,6560,4,6560,"全身装备强化至320级！","强化大师32级",},  
    [33] = {1033,"装备强化330级",1,330,1,138600,2,13860,3,6930,4,6930,"全身装备强化至330级","强化大师33级",},  
    [34] = {1034,"装备强化340级",1,340,1,146200,2,14620,3,7310,4,7310,"全身装备强化至340级","强化大师34级",},  
    [35] = {1035,"装备强化350级",1,350,1,154000,2,15400,3,7700,4,7700,"全身装备强化至350级","强化大师35级",},  
    [36] = {1036,"装备强化360级",1,360,1,162000,2,16200,3,8100,4,8100,"全身装备强化至360级","强化大师36级",},  
    [37] = {1037,"装备强化370级",1,370,1,170200,2,17020,3,8510,4,8510,"全身装备强化至370级","强化大师37级",},  
    [38] = {1038,"装备强化380级",1,380,1,178600,2,17860,3,8930,4,8930,"全身装备强化至380级","强化大师38级",},  
    [39] = {1039,"装备强化390级",1,390,1,187200,2,18720,3,9360,4,9360,"全身装备强化至390级","强化大师39级",},  
    [40] = {1040,"装备强化400级",1,400,1,196000,2,19600,3,9800,4,9800,"全身装备强化至400级","强化大师40级",},  
    [41] = {1041,"装备强化410级",1,410,1,205000,2,20500,3,10250,4,10250,"全身装备强化至410级","强化大师41级",},  
    [42] = {1042,"装备强化420级",1,420,1,214200,2,21420,3,10710,4,10710,"全身装备强化至420级","强化大师42级",},  
    [43] = {2001,"装备精炼2级",2,2,1,2000,2,200,3,100,4,100,"全身装备精炼至2级！","精炼大师1级",},  
    [44] = {2002,"装备精炼4级",2,4,1,4400,2,440,3,220,4,220,"全身装备精炼至4级！","精炼大师2级",},  
    [45] = {2003,"装备精炼6级",2,6,1,7200,2,720,3,360,4,360,"全身装备精炼至6级！","精炼大师3级",},  
    [46] = {2004,"装备精炼8级",2,8,1,10400,2,1040,3,520,4,520,"全身装备精炼至8级！","精炼大师4级",},  
    [47] = {2005,"装备精炼10级",2,10,1,14000,2,1400,3,700,4,700,"全身装备精炼至10级！","精炼大师5级",},  
    [48] = {2006,"装备精炼12级",2,12,1,18000,2,1800,3,900,4,900,"全身装备精炼至12级！","精炼大师6级",},  
    [49] = {2007,"装备精炼14级",2,14,1,22400,2,2240,3,1120,4,1120,"全身装备精炼至14级！","精炼大师7级",},  
    [50] = {2008,"装备精炼16级",2,16,1,27200,2,2720,3,1360,4,1360,"全身装备精炼至16级！","精炼大师8级",},  
    [51] = {2009,"装备精炼18级",2,18,1,32400,2,3240,3,1620,4,1620,"全身装备精炼至18级！","精炼大师9级",},  
    [52] = {2010,"装备精炼20级",2,20,1,38000,2,3800,3,1900,4,1900,"全身装备精炼至20级！","精炼大师10级",},  
    [53] = {2011,"装备精炼22级",2,22,1,44000,2,4400,3,2200,4,2200,"全身装备精炼至22级！","精炼大师11级",},  
    [54] = {2012,"装备精炼24级",2,24,1,50400,2,5040,3,2520,4,2520,"全身装备精炼至24级！","精炼大师12级",},  
    [55] = {2013,"装备精炼26级",2,26,1,57200,2,5720,3,2860,4,2860,"全身装备精炼至26级！","精炼大师13级",},  
    [56] = {2014,"装备精炼28级",2,28,1,64400,2,6440,3,3220,4,3220,"全身装备精炼至28级！","精炼大师14级",},  
    [57] = {2015,"装备精炼30级",2,30,1,72000,2,7200,3,3600,4,3600,"全身装备精炼至30级！","精炼大师15级",},  
    [58] = {2016,"装备精炼32级",2,32,1,80000,2,8000,3,4000,4,4000,"全身装备精炼至32级！","精炼大师16级",},  
    [59] = {2017,"装备精炼34级",2,34,1,88400,2,8840,3,4420,4,4420,"全身装备精炼至34级！","精炼大师17级",},  
    [60] = {2018,"装备精炼36级",2,36,1,97200,2,9720,3,4860,4,4860,"全身装备精炼至36级！","精炼大师18级",},  
    [61] = {2019,"装备精炼38级",2,38,1,106400,2,10640,3,5320,4,5320,"全身装备精炼至38级！","精炼大师19级",},  
    [62] = {2020,"装备精炼40级",2,40,1,116000,2,11600,3,5800,4,5800,"全身装备精炼至40级！","精炼大师20级",},  
    [63] = {2021,"装备精炼42级",2,42,1,126000,2,12600,3,6300,4,6300,"全身装备精炼至42级！","精炼大师21级",},  
    [64] = {2022,"装备精炼44级",2,44,1,136400,2,13640,3,6820,4,6820,"全身装备精炼至44级！","精炼大师22级",},  
    [65] = {2023,"装备精炼46级",2,46,1,147200,2,14720,3,7360,4,7360,"全身装备精炼至46级！","精炼大师23级",},  
    [66] = {2024,"装备精炼48级",2,48,1,158400,2,15840,3,7920,4,7920,"全身装备精炼至48级！","精炼大师24级",},  
    [67] = {2025,"装备精炼50级",2,50,1,170000,2,17000,3,8500,4,8500,"全身装备精炼至50级！","精炼大师25级",},  
    [68] = {2026,"装备精炼52级",2,52,1,182000,2,18200,3,9100,4,9100,"全身装备精炼至52级！","精炼大师26级",},  
    [69] = {2027,"装备精炼54级",2,54,1,194400,2,19440,3,9720,4,9720,"全身装备精炼至54级！","精炼大师27级",},  
    [70] = {2028,"装备精炼56级",2,56,1,207200,2,20720,3,10360,4,10360,"全身装备精炼至56级！","精炼大师28级",},  
    [71] = {2029,"装备精炼58级",2,58,1,220400,2,22040,3,11020,4,11020,"全身装备精炼至58级！","精炼大师29级",},  
    [72] = {2030,"装备精炼60级",2,60,1,234000,2,23400,3,11700,4,11700,"全身装备精炼至60级！","精炼大师30级",},  
    [73] = {2031,"装备精炼62级",2,62,1,248000,2,24800,3,12400,4,12400,"全身装备精炼至62级！","精炼大师31级",},  
    [74] = {2032,"装备精炼64级",2,64,1,262400,2,26240,3,13120,4,13120,"全身装备精炼至64级！","精炼大师32级",},  
    [75] = {2033,"装备精炼66级",2,66,1,277200,2,27720,3,13860,4,13860,"全身装备精炼至66级！","精炼大师33级",},  
    [76] = {2034,"装备精炼68级",2,68,1,292400,2,29240,3,14620,4,14620,"全身装备精炼至68级！","精炼大师34级",},  
    [77] = {2035,"装备精炼70级",2,70,1,308000,2,30800,3,15400,4,15400,"全身装备精炼至70级！","精炼大师35级",},  
    [78] = {2036,"装备精炼72级",2,72,1,324000,2,32400,3,16200,4,16200,"全身装备精炼至72级！","精炼大师36级",},  
    [79] = {2037,"装备精炼74级",2,74,1,340400,2,34040,3,17020,4,17020,"全身装备精炼至74级！","精炼大师37级",},  
    [80] = {2038,"装备精炼76级",2,76,1,357200,2,35720,3,17860,4,17860,"全身装备精炼至76级！","精炼大师38级",},  
    [81] = {2039,"装备精炼78级",2,78,1,374400,2,37440,3,18720,4,18720,"全身装备精炼至78级！","精炼大师39级",},  
    [82] = {2040,"装备精炼80级",2,80,1,392000,2,39200,3,19600,4,19600,"全身装备精炼至80级！","精炼大师40级",},  
    [83] = {2042,"装备精炼82级",2,82,1,410000,2,41000,3,20500,4,20500,"全身装备精炼至82级！","精炼大师41级",},  
    [84] = {2043,"装备精炼84级",2,84,1,428400,2,42840,3,21420,4,21420,"全身装备精炼至84级！","精炼大师42级",},  
    [85] = {2045,"装备精炼86级",2,86,1,447200,2,44720,3,22360,4,22360,"全身装备精炼至86级！","精炼大师43级",},  
    [86] = {2046,"装备精炼88级",2,88,1,466400,2,46640,3,23320,4,23320,"全身装备精炼至88级！","精炼大师44级",},  
    [87] = {2048,"装备精炼90级",2,90,1,486000,2,48600,3,24300,4,24300,"全身装备精炼至90级！","精炼大师45级",},  
    [88] = {2049,"装备精炼92级",2,92,1,506000,2,50600,3,25300,4,25300,"全身装备精炼至92级！","精炼大师46级",},  
    [89] = {2051,"装备精炼94级",2,94,1,526400,2,52640,3,26320,4,26320,"全身装备精炼至94级！","精炼大师47级",},  
    [90] = {2052,"装备精炼96级",2,96,1,547200,2,54720,3,27360,4,27360,"全身装备精炼至96级！","精炼大师48级",},  
    [91] = {2054,"装备精炼98级",2,98,1,568400,2,56840,3,28420,4,28420,"全身装备精炼至98级！","精炼大师49级",},  
    [92] = {2055,"装备精炼100级",2,100,1,590000,2,59000,3,29500,4,29500,"全身装备精炼至100级！","精炼大师50级",},  
    [93] = {2057,"装备精炼102级",2,102,1,612000,2,61200,3,30600,4,30600,"全身装备精炼至102级！","精炼大师51级",},  
    [94] = {2058,"装备精炼104级",2,104,1,634400,2,63440,3,31720,4,31720,"全身装备精炼至104级！","精炼大师52级",},  
    [95] = {2060,"装备精炼106级",2,106,1,657200,2,65720,3,32860,4,32860,"全身装备精炼至106级！","精炼大师53级",},  
    [96] = {2061,"装备精炼108级",2,108,1,680400,2,68040,3,34020,4,34020,"全身装备精炼至108级！","精炼大师54级",},  
    [97] = {2063,"装备精炼110级",2,110,1,704000,2,70400,3,35200,4,35200,"全身装备精炼至110级！","精炼大师55级",},  
    [98] = {2064,"装备精炼112级",2,112,1,728000,2,72800,3,36400,4,36400,"全身装备精炼至112级！","精炼大师56级",},  
    [99] = {2066,"装备精炼114级",2,114,1,752400,2,75240,3,37620,4,37620,"全身装备精炼至114级！","精炼大师57级",},  
    [100] = {2067,"装备精炼116级",2,116,1,777200,2,77720,3,38860,4,38860,"全身装备精炼至116级！","精炼大师58级",},  
    [101] = {2069,"装备精炼118级",2,118,1,802400,2,80240,3,40120,4,40120,"全身装备精炼至118级！","精炼大师59级",},  
    [102] = {2070,"装备精炼120级",2,120,1,828000,2,82800,3,41400,4,41400,"全身装备精炼至120级！","精炼大师60级",},  
    [103] = {2072,"装备精炼122级",2,122,1,854000,2,85400,3,42700,4,42700,"全身装备精炼至122级！","精炼大师61级",},  
    [104] = {3001,"宝物强化5级",3,5,1,1500,2,150,3,150,4,150,"全身宝物强化至5级！","强化大师1级",},  
    [105] = {3002,"宝物强化10级",3,10,1,3600,2,360,3,360,4,360,"全身宝物强化至10级！","强化大师2级",},  
    [106] = {3003,"宝物强化15级",3,15,1,6300,2,630,3,630,4,630,"全身宝物强化至15级！","强化大师3级",},  
    [107] = {3004,"宝物强化20级",3,20,1,9600,2,960,3,960,4,960,"全身宝物强化至20级！","强化大师4级",},  
    [108] = {3005,"宝物强化25级",3,25,1,13500,2,1350,3,1350,4,1350,"全身宝物强化至25级！","强化大师5级",},  
    [109] = {3006,"宝物强化30级",3,30,1,18000,2,1800,3,1800,4,1800,"全身宝物强化至30级！","强化大师6级",},  
    [110] = {3007,"宝物强化35级",3,35,1,23100,2,2310,3,2310,4,2310,"全身宝物强化至35级！","强化大师7级",},  
    [111] = {3008,"宝物强化40级",3,40,1,28800,2,2880,3,2880,4,2880,"全身宝物强化至40级！","强化大师8级",},  
    [112] = {3009,"宝物强化45级",3,45,1,35100,2,3510,3,3510,4,3510,"全身宝物强化至45级！","强化大师9级",},  
    [113] = {3010,"宝物强化50级",3,50,1,42000,2,4200,3,4200,4,4200,"全身宝物强化至50级！","强化大师10级",},  
    [114] = {3011,"宝物强化55级",3,55,1,49500,2,4950,3,4950,4,4950,"全身宝物强化至55级！","强化大师11级",},  
    [115] = {3012,"宝物强化60级",3,60,1,57600,2,5760,3,5760,4,5760,"全身宝物强化至60级！","强化大师12级",},  
    [116] = {3013,"宝物强化65级",3,65,1,66300,2,6630,3,6630,4,6630,"全身宝物强化至65级！","强化大师13级",},  
    [117] = {3014,"宝物强化70级",3,70,1,75600,2,7560,3,7560,4,7560,"全身宝物强化至70级！","强化大师14级",},  
    [118] = {3015,"宝物强化75级",3,75,1,85500,2,8550,3,8550,4,8550,"全身宝物强化至75级！","强化大师15级",},  
    [119] = {3016,"宝物强化80级",3,80,1,96000,2,9600,3,9600,4,9600,"全身宝物强化至80级！","强化大师16级",},  
    [120] = {3017,"宝物强化85级",3,85,1,107100,2,10710,3,10710,4,10710,"全身宝物强化至85级！","强化大师17级",},  
    [121] = {3018,"宝物强化90级",3,90,1,118800,2,11880,3,11880,4,11880,"全身宝物强化至90级！","强化大师18级",},  
    [122] = {3019,"宝物强化95级",3,95,1,131100,2,13110,3,13110,4,13110,"全身宝物强化至95级！","强化大师19级",},  
    [123] = {3020,"宝物强化100级",3,100,1,144000,2,14400,3,14400,4,14400,"全身宝物强化至100级！","强化大师20级",},  
    [124] = {3021,"宝物强化105级",3,105,1,157500,2,15750,3,15750,4,15750,"全身宝物强化至105级！","强化大师21级",},  
    [125] = {3022,"宝物强化110级",3,110,1,171600,2,17160,3,17160,4,17160,"全身宝物强化至110级！","强化大师22级",},  
    [126] = {3023,"宝物强化115级",3,115,1,186300,2,18630,3,18630,4,18630,"全身宝物强化至115级！","强化大师23级",},  
    [127] = {3024,"宝物强化120级",3,120,1,201600,2,20160,3,20160,4,20160,"全身宝物强化至120级！","强化大师24级",},  
    [128] = {3025,"宝物强化125级",3,125,1,217500,2,21750,3,21750,4,21750,"全身宝物强化至125级！","强化大师25级",},  
    [129] = {3026,"宝物强化130级",3,130,1,234000,2,23400,3,23400,4,23400,"全身宝物强化至130级！","强化大师26级",},  
    [130] = {3027,"宝物强化135级",3,135,1,251100,2,25110,3,25110,4,25110,"全身宝物强化至135级！","强化大师27级",},  
    [131] = {3028,"宝物强化140级",3,140,1,268800,2,26880,3,26880,4,26880,"全身宝物强化至140级！","强化大师28级",},  
    [132] = {3029,"宝物强化145级",3,145,1,287100,2,28710,3,28710,4,28710,"全身宝物强化至145级！","强化大师29级",},  
    [133] = {3030,"宝物强化150级",3,150,1,306000,2,30600,3,30600,4,30600,"全身宝物强化至150级！","强化大师30级",},  
    [134] = {3031,"宝物强化155级",3,155,1,325500,2,32550,3,32550,4,32550,"全身宝物强化至155级！","强化大师31级",},  
    [135] = {3032,"宝物强化160级",3,160,1,345600,2,34560,3,34560,4,34560,"全身宝物强化至160级！","强化大师32级",},  
    [136] = {3033,"宝物强化165级",3,165,1,366300,2,36630,3,36630,4,36630,"全身宝物强化至165级！","强化大师33级",},  
    [137] = {3034,"宝物强化170级",3,170,1,387600,2,38760,3,38760,4,38760,"全身宝物强化至170级！","强化大师34级",},  
    [138] = {3035,"宝物强化175级",3,175,1,409500,2,40950,3,40950,4,40950,"全身宝物强化至175级！","强化大师35级",},  
    [139] = {3036,"宝物强化180级",3,180,1,432000,2,43200,3,43200,4,43200,"全身宝物强化至180级！","强化大师36级",},  
    [140] = {3037,"宝物强化185级",3,185,1,455100,2,45510,3,45510,4,45510,"全身宝物强化至185级！","强化大师37级",},  
    [141] = {3038,"宝物强化190级",3,190,1,478800,2,47880,3,47880,4,47880,"全身宝物强化至190级！","强化大师38级",},  
    [142] = {3039,"宝物强化195级",3,195,1,503100,2,50310,3,50310,4,50310,"全身宝物强化至195级！","强化大师39级",},  
    [143] = {3040,"宝物强化200级",3,200,1,528000,2,52800,3,52800,4,52800,"全身宝物强化至200级！","强化大师40级",},  
    [144] = {4001,"宝物精炼1级",4,1,1,3000,2,300,3,300,4,300,"全身宝物精炼至1级！","精炼大师1级",},  
    [145] = {4002,"宝物精炼2级",4,2,1,7200,2,720,3,720,4,720,"全身宝物精炼至2级！","精炼大师2级",},  
    [146] = {4003,"宝物精炼3级",4,3,1,12600,2,1260,3,1260,4,1260,"全身宝物精炼至3级！","精炼大师3级",},  
    [147] = {4004,"宝物精炼4级",4,4,1,19200,2,1920,3,1920,4,1920,"全身宝物精炼至4级！","精炼大师4级",},  
    [148] = {4005,"宝物精炼5级",4,5,1,27000,2,2700,3,2700,4,2700,"全身宝物精炼至5级！","精炼大师5级",},  
    [149] = {4006,"宝物精炼6级",4,6,1,36000,2,3600,3,3600,4,3600,"全身宝物精炼至6级！","精炼大师6级",},  
    [150] = {4007,"宝物精炼7级",4,7,1,46200,2,4620,3,4620,4,4620,"全身宝物精炼至7级！","精炼大师7级",},  
    [151] = {4008,"宝物精炼8级",4,8,1,57600,2,5760,3,5760,4,5760,"全身宝物精炼至8级！","精炼大师8级",},  
    [152] = {4009,"宝物精炼9级",4,9,1,70200,2,7020,3,7020,4,7020,"全身宝物精炼至9级！","精炼大师9级",},  
    [153] = {4010,"宝物精炼10级",4,10,1,84000,2,8400,3,8400,4,8400,"全身宝物精炼至10级！","精炼大师10级",},  
    [154] = {4011,"宝物精炼11级",4,11,1,99000,2,9900,3,9900,4,9900,"全身宝物精炼至11级！","精炼大师11级",},  
    [155] = {4012,"宝物精炼12级",4,12,1,115200,2,11520,3,11520,4,11520,"全身宝物精炼至12级！","精炼大师12级",},  
    [156] = {4013,"宝物精炼13级",4,13,1,132600,2,13260,3,13260,4,13260,"全身宝物精炼至13级！","精炼大师13级",},  
    [157] = {4014,"宝物精炼14级",4,14,1,151200,2,15120,3,15120,4,15120,"全身宝物精炼至14级！","精炼大师14级",},  
    [158] = {4015,"宝物精炼15级",4,15,1,171000,2,17100,3,17100,4,17100,"全身宝物精炼至15级！","精炼大师15级",},  
    [159] = {4016,"宝物精炼16级",4,16,1,192000,2,19200,3,19200,4,19200,"全身宝物精炼至16级！","精炼大师16级",},  
    [160] = {4017,"宝物精炼17级",4,17,1,214200,2,21420,3,21420,4,21420,"全身宝物精炼至17级！","精炼大师17级",},  
    [161] = {4018,"宝物精炼18级",4,18,1,237600,2,23760,3,23760,4,23760,"全身宝物精炼至18级！","精炼大师18级",},  
    [162] = {4019,"宝物精炼19级",4,19,1,262200,2,26220,3,26220,4,26220,"全身宝物精炼至19级！","精炼大师19级",},  
    [163] = {4020,"宝物精炼20级",4,20,1,288000,2,28800,3,28800,4,28800,"全身宝物精炼至20级！","精炼大师20级",},  
    [164] = {4021,"宝物精炼21级",4,21,1,315000,2,31500,3,31500,4,31500,"全身宝物精炼至21级！","精炼大师21级",},  
    [165] = {4022,"宝物精炼22级",4,22,1,343200,2,34320,3,34320,4,34320,"全身宝物精炼至22级！","精炼大师22级",},  
    [166] = {4023,"宝物精炼23级",4,23,1,372600,2,37260,3,37260,4,37260,"全身宝物精炼至23级！","精炼大师23级",},  
    [167] = {4024,"宝物精炼24级",4,24,1,403200,2,40320,3,40320,4,40320,"全身宝物精炼至24级！","精炼大师24级",},  
    [168] = {4025,"宝物精炼25级",4,25,1,435000,2,43500,3,43500,4,43500,"全身宝物精炼至25级！","精炼大师25级",},  
    [169] = {4026,"宝物精炼26级",4,26,1,468000,2,46800,3,46800,4,46800,"全身宝物精炼至26级！","精炼大师26级",},  
    [170] = {4027,"宝物精炼27级",4,27,1,502200,2,50220,3,50220,4,50220,"全身宝物精炼至27级！","精炼大师27级",},  
    [171] = {4028,"宝物精炼28级",4,28,1,537600,2,53760,3,53760,4,53760,"全身宝物精炼至28级！","精炼大师28级",},  
    [172] = {4029,"宝物精炼29级",4,29,1,574200,2,57420,3,57420,4,57420,"全身宝物精炼至29级！","精炼大师29级",},  
    [173] = {4030,"宝物精炼30级",4,30,1,612000,2,61200,3,61200,4,61200,"全身宝物精炼至30级！","精炼大师30级",},
    }
}

local __index_id = {   
    [1001] = 1,  
    [1002] = 2,  
    [1003] = 3,  
    [1004] = 4,  
    [1005] = 5,  
    [1006] = 6,  
    [1007] = 7,  
    [1008] = 8,  
    [1009] = 9,  
    [1010] = 10,  
    [1011] = 11,  
    [1012] = 12,  
    [1013] = 13,  
    [1014] = 14,  
    [1015] = 15,  
    [1016] = 16,  
    [1017] = 17,  
    [1018] = 18,  
    [1019] = 19,  
    [1020] = 20,  
    [1021] = 21,  
    [1022] = 22,  
    [1023] = 23,  
    [1024] = 24,  
    [1025] = 25,  
    [1026] = 26,  
    [1027] = 27,  
    [1028] = 28,  
    [1029] = 29,  
    [1030] = 30,  
    [1031] = 31,  
    [1032] = 32,  
    [1033] = 33,  
    [1034] = 34,  
    [1035] = 35,  
    [1036] = 36,  
    [1037] = 37,  
    [1038] = 38,  
    [1039] = 39,  
    [1040] = 40,  
    [1041] = 41,  
    [1042] = 42,  
    [2001] = 43,  
    [2002] = 44,  
    [2003] = 45,  
    [2004] = 46,  
    [2005] = 47,  
    [2006] = 48,  
    [2007] = 49,  
    [2008] = 50,  
    [2009] = 51,  
    [2010] = 52,  
    [2011] = 53,  
    [2012] = 54,  
    [2013] = 55,  
    [2014] = 56,  
    [2015] = 57,  
    [2016] = 58,  
    [2017] = 59,  
    [2018] = 60,  
    [2019] = 61,  
    [2020] = 62,  
    [2021] = 63,  
    [2022] = 64,  
    [2023] = 65,  
    [2024] = 66,  
    [2025] = 67,  
    [2026] = 68,  
    [2027] = 69,  
    [2028] = 70,  
    [2029] = 71,  
    [2030] = 72,  
    [2031] = 73,  
    [2032] = 74,  
    [2033] = 75,  
    [2034] = 76,  
    [2035] = 77,  
    [2036] = 78,  
    [2037] = 79,  
    [2038] = 80,  
    [2039] = 81,  
    [2040] = 82,  
    [2042] = 83,  
    [3001] = 104,  
    [3002] = 105,  
    [3003] = 106,  
    [3004] = 107,  
    [3005] = 108,  
    [3006] = 109,  
    [3007] = 110,  
    [3008] = 111,  
    [3009] = 112,  
    [3010] = 113,  
    [3011] = 114,  
    [3012] = 115,  
    [3013] = 116,  
    [3014] = 117,  
    [3015] = 118,  
    [3016] = 119,  
    [3017] = 120,  
    [3018] = 121,  
    [3019] = 122,  
    [3020] = 123,  
    [3021] = 124,  
    [3022] = 125,  
    [3023] = 126,  
    [3024] = 127,  
    [3025] = 128,  
    [3026] = 129,  
    [3027] = 130,  
    [3028] = 131,  
    [3029] = 132,  
    [3030] = 133,  
    [3031] = 134,  
    [3032] = 135,  
    [3033] = 136,  
    [3034] = 137,  
    [3035] = 138,  
    [3036] = 139,  
    [3037] = 140,  
    [3038] = 141,  
    [3039] = 142,  
    [3040] = 143,  
    [4001] = 144,  
    [4002] = 145,  
    [4003] = 146,  
    [4004] = 147,  
    [4005] = 148,  
    [4006] = 149,  
    [4007] = 150,  
    [4008] = 151,  
    [4009] = 152,  
    [4010] = 153,  
    [4011] = 154,  
    [4012] = 155,  
    [4013] = 156,  
    [4014] = 157,  
    [4015] = 158,  
    [4016] = 159,  
    [4017] = 160,  
    [4018] = 161,  
    [4019] = 162,  
    [4020] = 163,  
    [4021] = 164,  
    [4022] = 165,  
    [4023] = 166,  
    [4024] = 167,  
    [4025] = 168,  
    [4026] = 169,  
    [4027] = 170,  
    [4028] = 171,  
    [4029] = 172,  
    [4030] = 173,  
    [2043.33333333333] = 84,  
    [2044.83333333333] = 85,  
    [2046.33333333333] = 86,  
    [2047.83333333333] = 87,  
    [2049.33333333333] = 88,  
    [2050.83333333333] = 89,  
    [2052.33333333333] = 90,  
    [2053.83333333333] = 91,  
    [2055.33333333333] = 92,  
    [2056.83333333333] = 93,  
    [2058.33333333333] = 94,  
    [2059.83333333333] = 95,  
    [2061.33333333333] = 96,  
    [2062.83333333333] = 97,  
    [2064.33333333333] = 98,  
    [2065.83333333333] = 99,  
    [2067.33333333333] = 100,  
    [2068.83333333333] = 101,  
    [2070.33333333333] = 102,  
    [2071.83333333333] = 103,
}

local __key_map = { 
    id = 1,
    name = 2,
    type = 3,
    value = 4,
    affect_type_1 = 5,
    affect_value_1 = 6,
    affect_type_2 = 7,
    affect_value_2 = 8,
    affect_type_3 = 9,
    affect_value_3 = 10,
    affect_type_4 = 11,
    affect_value_4 = 12,
    description = 13,
    master_name = 14,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_enhance_master_info")

        return t._raw[__key_map[k]]
    end
}


function enhance_master_info.getLength()
    return #enhance_master_info._data
end



function enhance_master_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_enhance_master_info
function enhance_master_info.indexOf(index)
    if index == nil or not enhance_master_info._data[index] then
        return nil
    end
    return setmetatable({_raw = enhance_master_info._data[index]}, m)
end



---
--@return @class record_enhance_master_info
function enhance_master_info.get(id)
    
    return enhance_master_info.indexOf(__index_id[ id ])
     
end



function enhance_master_info.set(id, key, value)
    local record = enhance_master_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function enhance_master_info.get_index_data()
    return __index_id 
end

return  enhance_master_info 