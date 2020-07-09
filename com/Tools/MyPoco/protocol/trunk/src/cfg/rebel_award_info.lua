---@classdef record_rebel_award_info
local record_rebel_award_info = {}


record_rebel_award_info.id = 0--id
record_rebel_award_info.seen_grade_min = 0--等级最小值(闭区间）
record_rebel_award_info.seen_grade_max = 0--等级最大值（闭区间）
record_rebel_award_info.damage = 0--所需伤害
record_rebel_award_info.type = 0--奖励类型
record_rebel_award_info.value = 0--奖励类型值
record_rebel_award_info.size = 0--奖励数量

local rebel_award_info = {
   _data = {   
    [1] = {1001,0,100,3840000,3,13,5,},  
    [2] = {1002,0,100,19230000,3,9,2,},  
    [3] = {1003,0,100,46170000,3,13,5,},  
    [4] = {1004,0,100,115420000,3,13,5,},  
    [5] = {1005,0,100,192370000,3,25,1,},  
    [6] = {1006,0,100,346270000,3,13,5,},  
    [7] = {1007,0,100,423220000,3,9,2,},  
    [8] = {1008,0,100,577120000,3,13,5,},  
    [9] = {1009,0,100,654070000,3,13,5,},  
    [10] = {1010,0,100,731020000,3,25,1,},  
    [11] = {1011,0,100,807970000,3,13,5,},  
    [12] = {1012,0,100,884920000,3,9,5,},  
    [13] = {1013,0,100,961870000,3,13,5,},  
    [14] = {1014,0,100,1154250000,3,13,5,},  
    [15] = {1015,0,100,1346620000,3,25,1,},  
    [16] = {1016,0,100,1539000000,3,35,250,},  
    [17] = {1017,0,100,1731370000,3,9,5,},  
    [18] = {1018,0,100,1923750000,3,13,5,},  
    [19] = {1019,0,100,2116120000,3,13,5,},  
    [20] = {1020,0,100,2308500000,3,25,1,},  
    [21] = {1021,0,100,2500870000,3,35,300,},  
    [22] = {1022,0,100,2693250000,3,9,7,},  
    [23] = {1023,0,100,2885620000,3,13,5,},  
    [24] = {1024,0,100,3078000000,3,13,5,},  
    [25] = {1025,0,100,3270370000,3,25,1,},  
    [26] = {1026,0,100,3462750000,3,35,350,},  
    [27] = {1027,0,100,3655120000,3,9,7,},  
    [28] = {1028,0,100,3847500000,3,13,5,},  
    [29] = {1029,0,100,4039870000,3,13,5,},  
    [30] = {1030,0,100,4232250000,3,25,1,},  
    [31] = {1031,101,200,5200000,3,35,150,},  
    [32] = {1032,101,200,26400000,3,10,1,},  
    [33] = {1033,101,200,63500000,3,14,5,},  
    [34] = {1034,101,200,158900000,3,14,5,},  
    [35] = {1035,101,200,264900000,3,25,1,},  
    [36] = {1036,101,200,476800000,3,35,200,},  
    [37] = {1037,101,200,582800000,3,10,2,},  
    [38] = {1038,101,200,794800000,3,14,5,},  
    [39] = {1039,101,200,900700000,3,14,5,},  
    [40] = {1040,101,200,1006700000,3,25,1,},  
    [41] = {1041,101,200,1112700000,3,35,250,},  
    [42] = {1042,101,200,1218700000,3,10,3,},  
    [43] = {1043,101,200,1324600000,3,14,5,},  
    [44] = {1044,101,200,1589600000,3,14,5,},  
    [45] = {1045,101,200,1854500000,3,25,1,},  
    [46] = {1046,101,200,2119500000,3,35,300,},  
    [47] = {1047,101,200,2384400000,3,10,3,},  
    [48] = {1048,101,200,2649300000,3,14,5,},  
    [49] = {1049,101,200,2914300000,3,14,5,},  
    [50] = {1050,101,200,3179200000,3,25,1,},  
    [51] = {1051,101,200,3444100000,3,35,350,},  
    [52] = {1052,101,200,3709100000,3,10,4,},  
    [53] = {1053,101,200,3974000000,3,14,5,},  
    [54] = {1054,101,200,4239000000,3,14,5,},  
    [55] = {1055,101,200,4503900000,3,25,1,},  
    [56] = {1056,101,200,4768800000,3,35,400,},  
    [57] = {1057,101,200,5033800000,3,10,5,},  
    [58] = {1058,101,200,5298700000,3,14,5,},  
    [59] = {1059,101,200,5563600000,3,14,5,},  
    [60] = {1060,101,200,5828600000,3,25,1,},  
    [61] = {1061,101,200,7948100000,3,35,450,},  
    [62] = {1062,101,200,9537700000,3,10,5,},  
    [63] = {1063,101,200,11127300000,3,14,5,},  
    [64] = {1064,101,200,12717000000,3,14,5,},  
    [65] = {1065,101,200,14306600000,3,25,1,},  
    [66] = {1066,101,200,15896200000,3,35,500,},  
    [67] = {1067,101,200,17485800000,3,10,7,},  
    [68] = {1068,101,200,19075500000,3,14,5,},  
    [69] = {1069,101,200,20665100000,3,14,5,},  
    [70] = {1070,101,200,22254700000,3,25,1,},  
    [71] = {1071,201,300,7200000,3,35,200,},  
    [72] = {1072,201,300,36100000,3,10,3,},  
    [73] = {1073,201,300,86700000,3,15,5,},  
    [74] = {1074,201,300,216800000,8,13010,1,},  
    [75] = {1075,201,300,361400000,3,15,5,},  
    [76] = {1076,201,300,650500000,3,25,1,},  
    [77] = {1077,201,300,795000000,3,35,250,},  
    [78] = {1078,201,300,1084200000,3,10,3,},  
    [79] = {1079,201,300,1228700000,3,15,5,},  
    [80] = {1080,201,300,1373300000,8,13010,1,},  
    [81] = {1081,201,300,1517900000,3,15,5,},  
    [82] = {1082,201,300,1662400000,3,25,1,},  
    [83] = {1083,201,300,1807000000,3,35,300,},  
    [84] = {1084,201,300,2168400000,3,10,4,},  
    [85] = {1085,201,300,2529800000,3,15,5,},  
    [86] = {1086,201,300,2891200000,8,13010,2,},  
    [87] = {1087,201,300,3252600000,3,15,5,},  
    [88] = {1088,201,300,3614000000,3,25,1,},  
    [89] = {1089,201,300,3975400000,3,35,350,},  
    [90] = {1090,201,300,4336800000,3,10,4,},  
    [91] = {1091,201,300,4698200000,3,15,5,},  
    [92] = {1092,201,300,5059600000,8,13010,2,},  
    [93] = {1093,201,300,5421000000,3,15,5,},  
    [94] = {1094,201,300,5782500000,3,25,1,},  
    [95] = {1095,201,300,6143900000,3,35,400,},  
    [96] = {1096,201,300,6505300000,3,10,5,},  
    [97] = {1097,201,300,6866700000,3,15,5,},  
    [98] = {1098,201,300,7228100000,8,13010,3,},  
    [99] = {1099,201,300,7589500000,3,15,5,},  
    [100] = {1100,201,300,7950900000,3,25,1,},  
    [101] = {1101,201,300,10842100000,3,35,450,},  
    [102] = {1102,201,300,13010600000,3,10,5,},  
    [103] = {1103,201,300,15179000000,3,15,5,},  
    [104] = {1104,201,300,17347500000,8,13010,3,},  
    [105] = {1105,201,300,19515900000,3,15,5,},  
    [106] = {1106,201,300,21684300000,3,25,1,},  
    [107] = {1107,201,300,23852800000,3,35,500,},  
    [108] = {1108,201,300,26021200000,3,10,6,},  
    [109] = {1109,201,300,28189600000,3,15,5,},  
    [110] = {1110,201,300,30358100000,8,13010,4,},  
    [111] = {1111,201,300,34695000000,3,15,5,},  
    [112] = {1112,201,300,39031800000,3,25,1,},  
    [113] = {1113,201,300,43368700000,3,35,550,},  
    [114] = {1114,201,300,47705600000,3,10,6,},  
    [115] = {1115,201,300,52042500000,3,15,5,},  
    [116] = {1116,201,300,56379300000,8,13010,4,},  
    [117] = {1117,201,300,60716200000,3,15,5,},  
    [118] = {1118,201,300,65053100000,3,25,1,},  
    [119] = {1119,201,300,69390000000,3,35,600,},  
    [120] = {1120,201,300,73726800000,3,15,5,},  
    [121] = {1121,301,450,10700000,3,35,250,},  
    [122] = {1122,301,450,53700000,3,10,5,},  
    [123] = {1123,301,450,128900000,3,15,6,},  
    [124] = {1124,301,450,322300000,8,13010,1,},  
    [125] = {1125,301,450,537100000,3,17,10,},  
    [126] = {1126,301,450,966900000,3,15,6,},  
    [127] = {1127,301,450,1181800000,3,25,1,},  
    [128] = {1128,301,450,1611500000,3,35,300,},  
    [129] = {1129,301,450,1826400000,3,10,5,},  
    [130] = {1130,301,450,2041300000,3,15,6,},  
    [131] = {1131,301,450,2256100000,8,13010,1,},  
    [132] = {1132,301,450,2471000000,3,17,10,},  
    [133] = {1133,301,450,2685900000,3,15,6,},  
    [134] = {1134,301,450,3223100000,3,25,1,},  
    [135] = {1135,301,450,3760300000,3,35,350,},  
    [136] = {1136,301,450,4297500000,3,10,7,},  
    [137] = {1137,301,450,4834600000,3,15,6,},  
    [138] = {1138,301,450,5371800000,8,13010,2,},  
    [139] = {1139,301,450,5909000000,3,17,15,},  
    [140] = {1140,301,450,6446200000,3,15,6,},  
    [141] = {1141,301,450,6983400000,3,25,1,},  
    [142] = {1142,301,450,7520600000,3,35,400,},  
    [143] = {1143,301,450,8057800000,3,10,7,},  
    [144] = {1144,301,450,8595000000,3,15,6,},  
    [145] = {1145,301,450,9132100000,8,13010,2,},  
    [146] = {1146,301,450,9669300000,3,17,15,},  
    [147] = {1147,301,450,10206500000,3,15,6,},  
    [148] = {1148,301,450,10743700000,3,25,1,},  
    [149] = {1149,301,450,11280900000,3,35,450,},  
    [150] = {1150,301,450,11818100000,3,10,7,},  
    [151] = {1151,301,450,16115600000,3,15,6,},  
    [152] = {1152,301,450,19338700000,8,13010,2,},  
    [153] = {1153,301,450,22561800000,3,17,20,},  
    [154] = {1154,301,450,25785000000,3,15,6,},  
    [155] = {1155,301,450,29008100000,3,25,1,},  
    [156] = {1156,301,450,32231200000,3,35,500,},  
    [157] = {1157,301,450,35454300000,3,10,10,},  
    [158] = {1158,301,450,38677500000,3,15,6,},  
    [159] = {1159,301,450,41900600000,8,13010,2,},  
    [160] = {1160,301,450,45123700000,3,17,20,},  
    [161] = {1161,301,450,51570000000,3,15,6,},  
    [162] = {1162,301,450,58016200000,3,25,1,},  
    [163] = {1163,301,450,64462500000,3,35,550,},  
    [164] = {1164,301,450,70908700000,3,10,10,},  
    [165] = {1165,301,450,77355000000,3,15,6,},  
    [166] = {1166,301,450,83801200000,8,13010,2,},  
    [167] = {1167,301,450,90247500000,3,17,25,},  
    [168] = {1168,301,450,96693700000,3,15,6,},  
    [169] = {1169,301,450,103140000000,3,25,1,},  
    [170] = {1170,301,450,109586200000,3,35,600,},  
    [171] = {1171,301,450,116032500000,3,10,12,},  
    [172] = {1172,301,450,125701800000,3,15,6,},  
    [173] = {1173,301,450,135371200000,8,13010,3,},  
    [174] = {1174,301,450,145040600000,3,17,25,},  
    [175] = {1175,301,450,154710000000,3,15,6,},  
    [176] = {1176,301,450,164379300000,3,25,1,},  
    [177] = {1177,301,450,174048700000,3,35,650,},  
    [178] = {1178,301,450,183718100000,3,10,15,},  
    [179] = {1179,301,450,193387500000,3,15,6,},  
    [180] = {1180,301,450,203056800000,8,13010,3,},  
    [181] = {1181,451,600,18200000,3,35,300,},  
    [182] = {1182,451,600,91000000,3,10,7,},  
    [183] = {1183,451,600,218500000,3,15,7,},  
    [184] = {1184,451,600,546300000,8,13020,2,},  
    [185] = {1185,451,600,910500000,3,17,20,},  
    [186] = {1186,451,600,1638900000,3,15,7,},  
    [187] = {1187,451,600,2003100000,3,25,1,},  
    [188] = {1188,451,600,2731500000,3,35,350,},  
    [189] = {1189,451,600,3095700000,3,10,7,},  
    [190] = {1190,451,600,3459900000,3,15,7,},  
    [191] = {1191,451,600,3824100000,8,13020,2,},  
    [192] = {1192,451,600,4188300000,3,17,20,},  
    [193] = {1193,451,600,4552500000,3,15,7,},  
    [194] = {1194,451,600,5463000000,3,25,1,},  
    [195] = {1195,451,600,6373500000,3,35,400,},  
    [196] = {1196,451,600,7284000000,3,10,10,},  
    [197] = {1197,451,600,8194500000,3,15,7,},  
    [198] = {1198,451,600,9105000000,8,13020,3,},  
    [199] = {1199,451,600,10015500000,3,17,30,},  
    [200] = {1200,451,600,10926000000,3,15,7,},  
    [201] = {1201,451,600,11836500000,3,25,1,},  
    [202] = {1202,451,600,12747000000,3,35,450,},  
    [203] = {1203,451,600,13657500000,3,10,10,},  
    [204] = {1204,451,600,14568000000,3,15,7,},  
    [205] = {1205,451,600,15478500000,8,13020,3,},  
    [206] = {1206,451,600,16389000000,3,17,30,},  
    [207] = {1207,451,600,17299500000,3,15,7,},  
    [208] = {1208,451,600,18210000000,3,25,1,},  
    [209] = {1209,451,600,19120500000,3,35,500,},  
    [210] = {1210,451,600,20031000000,3,10,10,},  
    [211] = {1211,451,600,27315000000,3,15,7,},  
    [212] = {1212,451,600,32778000000,8,13020,3,},  
    [213] = {1213,451,600,38241000000,3,17,40,},  
    [214] = {1214,451,600,43704000000,3,15,7,},  
    [215] = {1215,451,600,49167000000,3,25,1,},  
    [216] = {1216,451,600,54630000000,3,35,550,},  
    [217] = {1217,451,600,60093000000,3,10,12,},  
    [218] = {1218,451,600,65556000000,3,15,7,},  
    [219] = {1219,451,600,71019000000,8,13020,3,},  
    [220] = {1220,451,600,76482000000,3,17,40,},  
    [221] = {1221,451,600,87408000000,3,15,7,},  
    [222] = {1222,451,600,98334000000,3,25,1,},  
    [223] = {1223,451,600,109260000000,3,35,600,},  
    [224] = {1224,451,600,120186000000,3,10,12,},  
    [225] = {1225,451,600,131112000000,3,15,7,},  
    [226] = {1226,451,600,142038000000,8,13020,3,},  
    [227] = {1227,451,600,152964000000,3,17,50,},  
    [228] = {1228,451,600,163890000000,3,15,7,},  
    [229] = {1229,451,600,174816000000,3,25,1,},  
    [230] = {1230,451,600,185742000000,3,35,650,},  
    [231] = {1231,451,600,196668000000,3,10,15,},  
    [232] = {1232,451,600,213057000000,3,15,7,},  
    [233] = {1233,451,600,229446000000,8,13020,4,},  
    [234] = {1234,451,600,245835000000,3,17,50,},  
    [235] = {1235,451,600,262224000000,3,15,7,},  
    [236] = {1236,451,600,278613000000,3,25,1,},  
    [237] = {1237,451,600,295002000000,3,35,700,},  
    [238] = {1238,451,600,311391000000,3,10,12,},  
    [239] = {1239,451,600,327780000000,3,15,7,},  
    [240] = {1240,451,600,344169000000,8,13020,4,},  
    [241] = {1241,451,600,363835800000,3,17,60,},  
    [242] = {1242,451,600,383502600000,3,15,7,},  
    [243] = {1243,451,600,403169400000,3,25,1,},  
    [244] = {1244,451,600,422836200000,3,35,750,},  
    [245] = {1245,451,600,442503000000,3,10,12,},  
    [246] = {1246,451,600,462169800000,3,15,7,},  
    [247] = {1247,451,600,481836600000,8,13020,4,},  
    [248] = {1248,451,600,501503400000,3,17,60,},  
    [249] = {1249,601,20000,209800000,3,35,600,},  
    [250] = {1250,601,20000,1049300000,3,10,20,},  
    [251] = {1251,601,20000,2518500000,3,15,12,},  
    [252] = {1252,601,20000,6296200000,8,13020,6,},  
    [253] = {1253,601,20000,10493800000,3,17,80,},  
    [254] = {1254,601,20000,18888800000,3,15,12,},  
    [255] = {1255,601,20000,23086400000,3,25,2,},  
    [256] = {1256,601,20000,31481400000,3,35,900,},  
    [257] = {1257,601,20000,35679000000,3,10,20,},  
    [258] = {1258,601,20000,39876500000,3,15,12,},  
    [259] = {1259,601,20000,44074000000,8,13020,6,},  
    [260] = {1260,601,20000,48271600000,3,17,80,},  
    [261] = {1261,601,20000,52469100000,3,15,12,},  
    [262] = {1262,601,20000,62962900000,3,25,2,},  
    [263] = {1263,601,20000,73456700000,3,35,1200,},  
    [264] = {1264,601,20000,83950600000,3,10,20,},  
    [265] = {1265,601,20000,94444400000,3,15,12,},  
    [266] = {1266,601,20000,104938200000,8,13020,8,},  
    [267] = {1267,601,20000,115432000000,3,17,80,},  
    [268] = {1268,601,20000,125925900000,3,15,15,},  
    [269] = {1269,601,20000,136419700000,3,25,2,},  
    [270] = {1270,601,20000,146913500000,3,35,1200,},  
    [271] = {1271,601,20000,157407400000,3,10,25,},  
    [272] = {1272,601,20000,167901200000,3,15,15,},  
    [273] = {1273,601,20000,178395000000,8,13020,8,},  
    [274] = {1274,601,20000,188888800000,3,17,80,},  
    [275] = {1275,601,20000,199382700000,3,15,15,},  
    [276] = {1276,601,20000,209876500000,3,25,3,},  
    [277] = {1277,601,20000,220370300000,3,35,1500,},  
    [278] = {1278,601,20000,230864100000,3,10,25,},  
    [279] = {1279,601,20000,314814800000,3,15,15,},  
    [280] = {1280,601,20000,377777700000,8,13020,8,},  
    [281] = {1281,601,20000,440740700000,3,17,80,},  
    [282] = {1282,601,20000,503703700000,3,15,15,},  
    [283] = {1283,601,20000,850000000000,3,204,2,},  
    [284] = {1284,601,20000,944444400000,1,3,50000,},  
    [285] = {1285,601,20000,1038888800000,3,15,15,},  
    [286] = {1286,601,20000,1133333300000,8,13030,5,},  
    [287] = {1287,601,20000,1227777700000,1,3,50000,},  
    [288] = {1288,601,20000,1322222200000,3,15,15,},  
    [289] = {1289,601,20000,2266666600000,3,204,2,},  
    [290] = {1290,601,20000,2550000000000,3,10,25,},  
    [291] = {1291,601,20000,2833333300000,1,3,50000,},  
    [292] = {1292,601,20000,3116666600000,8,13030,5,},  
    [293] = {1293,601,20000,3400000000000,1,3,50000,},  
    [294] = {1294,601,20000,3683333300000,3,15,15,},  
    [295] = {1295,601,20000,3966666600000,3,204,2,},  
    [296] = {1296,601,20000,4250000000000,1,3,50000,},  
    [297] = {1297,601,20000,4533333300000,3,15,15,},  
    [298] = {1298,601,20000,4816666600000,8,13030,5,},  
    [299] = {1299,601,20000,6800000000000,1,3,50000,},  
    [300] = {1300,601,20000,7366666600000,3,15,15,},  
    [301] = {1301,601,20000,7933333300000,3,204,2,},  
    [302] = {1302,601,20000,8500000000000,3,10,25,},  
    [303] = {1303,601,20000,9066666600000,1,3,100000,},  
    [304] = {1304,601,20000,9633333300000,8,13030,5,},  
    [305] = {1305,601,20000,10200000000000,1,3,100000,},  
    [306] = {1306,601,20000,10766666600000,3,15,15,},  
    [307] = {1307,601,20000,11333333300000,3,204,2,},  
    [308] = {1308,601,20000,11900000000000,1,3,100000,},  
    [309] = {1309,601,20000,25160000000000,3,15,15,},  
    [310] = {1310,601,20000,26520000000000,8,13030,5,},  
    [311] = {1311,601,20000,27880000000000,1,3,100000,},  
    [312] = {1312,601,20000,29240000000000,3,15,15,},  
    [313] = {1313,601,20000,30600000000000,3,204,2,},  
    [314] = {1314,601,20000,31960000000000,3,10,25,},  
    [315] = {1315,601,20000,33320000000000,1,3,100000,},  
    [316] = {1316,601,20000,34680000000000,3,204,3,},
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
    [1043] = 43,  
    [1044] = 44,  
    [1045] = 45,  
    [1046] = 46,  
    [1047] = 47,  
    [1048] = 48,  
    [1049] = 49,  
    [1050] = 50,  
    [1051] = 51,  
    [1052] = 52,  
    [1053] = 53,  
    [1054] = 54,  
    [1055] = 55,  
    [1056] = 56,  
    [1057] = 57,  
    [1058] = 58,  
    [1059] = 59,  
    [1060] = 60,  
    [1061] = 61,  
    [1062] = 62,  
    [1063] = 63,  
    [1064] = 64,  
    [1065] = 65,  
    [1066] = 66,  
    [1067] = 67,  
    [1068] = 68,  
    [1069] = 69,  
    [1070] = 70,  
    [1071] = 71,  
    [1072] = 72,  
    [1073] = 73,  
    [1074] = 74,  
    [1075] = 75,  
    [1076] = 76,  
    [1077] = 77,  
    [1078] = 78,  
    [1079] = 79,  
    [1080] = 80,  
    [1081] = 81,  
    [1082] = 82,  
    [1083] = 83,  
    [1084] = 84,  
    [1085] = 85,  
    [1086] = 86,  
    [1087] = 87,  
    [1088] = 88,  
    [1089] = 89,  
    [1090] = 90,  
    [1091] = 91,  
    [1092] = 92,  
    [1093] = 93,  
    [1094] = 94,  
    [1095] = 95,  
    [1096] = 96,  
    [1097] = 97,  
    [1098] = 98,  
    [1099] = 99,  
    [1100] = 100,  
    [1101] = 101,  
    [1102] = 102,  
    [1103] = 103,  
    [1104] = 104,  
    [1105] = 105,  
    [1106] = 106,  
    [1107] = 107,  
    [1108] = 108,  
    [1109] = 109,  
    [1110] = 110,  
    [1111] = 111,  
    [1112] = 112,  
    [1113] = 113,  
    [1114] = 114,  
    [1115] = 115,  
    [1116] = 116,  
    [1117] = 117,  
    [1118] = 118,  
    [1119] = 119,  
    [1120] = 120,  
    [1121] = 121,  
    [1122] = 122,  
    [1123] = 123,  
    [1124] = 124,  
    [1125] = 125,  
    [1126] = 126,  
    [1127] = 127,  
    [1128] = 128,  
    [1129] = 129,  
    [1130] = 130,  
    [1131] = 131,  
    [1132] = 132,  
    [1133] = 133,  
    [1134] = 134,  
    [1135] = 135,  
    [1136] = 136,  
    [1137] = 137,  
    [1138] = 138,  
    [1139] = 139,  
    [1140] = 140,  
    [1141] = 141,  
    [1142] = 142,  
    [1143] = 143,  
    [1144] = 144,  
    [1145] = 145,  
    [1146] = 146,  
    [1147] = 147,  
    [1148] = 148,  
    [1149] = 149,  
    [1150] = 150,  
    [1151] = 151,  
    [1152] = 152,  
    [1153] = 153,  
    [1154] = 154,  
    [1155] = 155,  
    [1156] = 156,  
    [1157] = 157,  
    [1158] = 158,  
    [1159] = 159,  
    [1160] = 160,  
    [1161] = 161,  
    [1162] = 162,  
    [1163] = 163,  
    [1164] = 164,  
    [1165] = 165,  
    [1166] = 166,  
    [1167] = 167,  
    [1168] = 168,  
    [1169] = 169,  
    [1170] = 170,  
    [1171] = 171,  
    [1172] = 172,  
    [1173] = 173,  
    [1174] = 174,  
    [1175] = 175,  
    [1176] = 176,  
    [1177] = 177,  
    [1178] = 178,  
    [1179] = 179,  
    [1180] = 180,  
    [1181] = 181,  
    [1182] = 182,  
    [1183] = 183,  
    [1184] = 184,  
    [1185] = 185,  
    [1186] = 186,  
    [1187] = 187,  
    [1188] = 188,  
    [1189] = 189,  
    [1190] = 190,  
    [1191] = 191,  
    [1192] = 192,  
    [1193] = 193,  
    [1194] = 194,  
    [1195] = 195,  
    [1196] = 196,  
    [1197] = 197,  
    [1198] = 198,  
    [1199] = 199,  
    [1200] = 200,  
    [1201] = 201,  
    [1202] = 202,  
    [1203] = 203,  
    [1204] = 204,  
    [1205] = 205,  
    [1206] = 206,  
    [1207] = 207,  
    [1208] = 208,  
    [1209] = 209,  
    [1210] = 210,  
    [1211] = 211,  
    [1212] = 212,  
    [1213] = 213,  
    [1214] = 214,  
    [1215] = 215,  
    [1216] = 216,  
    [1217] = 217,  
    [1218] = 218,  
    [1219] = 219,  
    [1220] = 220,  
    [1221] = 221,  
    [1222] = 222,  
    [1223] = 223,  
    [1224] = 224,  
    [1225] = 225,  
    [1226] = 226,  
    [1227] = 227,  
    [1228] = 228,  
    [1229] = 229,  
    [1230] = 230,  
    [1231] = 231,  
    [1232] = 232,  
    [1233] = 233,  
    [1234] = 234,  
    [1235] = 235,  
    [1236] = 236,  
    [1237] = 237,  
    [1238] = 238,  
    [1239] = 239,  
    [1240] = 240,  
    [1241] = 241,  
    [1242] = 242,  
    [1243] = 243,  
    [1244] = 244,  
    [1245] = 245,  
    [1246] = 246,  
    [1247] = 247,  
    [1248] = 248,  
    [1249] = 249,  
    [1250] = 250,  
    [1251] = 251,  
    [1252] = 252,  
    [1253] = 253,  
    [1254] = 254,  
    [1255] = 255,  
    [1256] = 256,  
    [1257] = 257,  
    [1258] = 258,  
    [1259] = 259,  
    [1260] = 260,  
    [1261] = 261,  
    [1262] = 262,  
    [1263] = 263,  
    [1264] = 264,  
    [1265] = 265,  
    [1266] = 266,  
    [1267] = 267,  
    [1268] = 268,  
    [1269] = 269,  
    [1270] = 270,  
    [1271] = 271,  
    [1272] = 272,  
    [1273] = 273,  
    [1274] = 274,  
    [1275] = 275,  
    [1276] = 276,  
    [1277] = 277,  
    [1278] = 278,  
    [1279] = 279,  
    [1280] = 280,  
    [1281] = 281,  
    [1282] = 282,  
    [1283] = 283,  
    [1284] = 284,  
    [1285] = 285,  
    [1286] = 286,  
    [1287] = 287,  
    [1288] = 288,  
    [1289] = 289,  
    [1290] = 290,  
    [1291] = 291,  
    [1292] = 292,  
    [1293] = 293,  
    [1294] = 294,  
    [1295] = 295,  
    [1296] = 296,  
    [1297] = 297,  
    [1298] = 298,  
    [1299] = 299,  
    [1300] = 300,  
    [1301] = 301,  
    [1302] = 302,  
    [1303] = 303,  
    [1304] = 304,  
    [1305] = 305,  
    [1306] = 306,  
    [1307] = 307,  
    [1308] = 308,  
    [1309] = 309,  
    [1310] = 310,  
    [1311] = 311,  
    [1312] = 312,  
    [1313] = 313,  
    [1314] = 314,  
    [1315] = 315,  
    [1316] = 316,
}

local __key_map = { 
    id = 1,
    seen_grade_min = 2,
    seen_grade_max = 3,
    damage = 4,
    type = 5,
    value = 6,
    size = 7,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_rebel_award_info")

        return t._raw[__key_map[k]]
    end
}


function rebel_award_info.getLength()
    return #rebel_award_info._data
end



function rebel_award_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_rebel_award_info
function rebel_award_info.indexOf(index)
    if index == nil or not rebel_award_info._data[index] then
        return nil
    end
    return setmetatable({_raw = rebel_award_info._data[index]}, m)
end



---
--@return @class record_rebel_award_info
function rebel_award_info.get(id)
    
    return rebel_award_info.indexOf(__index_id[ id ])
     
end



function rebel_award_info.set(id, key, value)
    local record = rebel_award_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function rebel_award_info.get_index_data()
    return __index_id 
end

return  rebel_award_info 