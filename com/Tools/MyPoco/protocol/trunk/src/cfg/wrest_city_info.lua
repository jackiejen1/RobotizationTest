---@classdef record_wrest_city_info
local record_wrest_city_info = {}


record_wrest_city_info.id = 0--ID
record_wrest_city_info.type = 0--城池类型
record_wrest_city_info.city_level = 0--城池等级
record_wrest_city_info.integral_group = 0--关联的积分组
record_wrest_city_info.name =  ""--城池名称
record_wrest_city_info.quality = 0--城池品质
record_wrest_city_info.pic =  ""--大地图城池图片
record_wrest_city_info.bg_pic =  ""--外城背景图片
record_wrest_city_info.bg_mine =  ""--外城金矿图片
record_wrest_city_info.area = 0--归属区域
record_wrest_city_info.area_name =  ""--归属区域名
record_wrest_city_info.unlock_condition = 0--解锁条件
record_wrest_city_info.bind_task = 0--结算时间
record_wrest_city_info.reward = 0--结算奖励
record_wrest_city_info.output = 0--关联产量组

local wrest_city_info = {
   _data = {   
    [1] = {101,1,1,0,"酒泉",4,"city_3","bg_2","mini_2",1,"魏",0,2,1,1,},  
    [2] = {102,1,1,0,"天水",4,"city_3","bg_2","mini_2",1,"魏",0,2,1,1,},  
    [3] = {103,1,1,0,"河间",4,"city_3","bg_2","mini_2",1,"魏",0,2,1,1,},  
    [4] = {104,1,1,0,"南皮",4,"city_3","bg_2","mini_2",1,"魏",0,2,1,1,},  
    [5] = {105,1,1,0,"常山",4,"city_3","bg_2","mini_2",1,"魏",0,2,1,1,},  
    [6] = {106,1,1,0,"延津",4,"city_3","bg_2","mini_2",1,"魏",0,2,1,1,},  
    [7] = {107,1,1,0,"官渡",4,"city_3","bg_2","mini_2",1,"魏",0,2,1,1,},  
    [8] = {108,1,1,0,"朝歌",4,"city_3","bg_2","mini_2",1,"魏",0,2,1,1,},  
    [9] = {109,1,1,0,"居庸",4,"city_3","bg_2","mini_2",1,"魏",0,2,1,1,},  
    [10] = {110,1,1,0,"昌黎",4,"city_3","bg_2","mini_2",1,"魏",0,2,1,1,},  
    [11] = {111,1,2,0,"雁门",5,"city_4","bg_3","mini_3",1,"魏",0,2,2,2,},  
    [12] = {112,1,2,0,"张掖",5,"city_4","bg_3","mini_3",1,"魏",0,2,2,2,},  
    [13] = {113,1,2,0,"太原",5,"city_4","bg_3","mini_3",1,"魏",0,2,2,2,},  
    [14] = {114,1,2,0,"汝南",5,"city_4","bg_3","mini_3",1,"魏",0,2,2,2,},  
    [15] = {115,1,2,0,"弘农",5,"city_4","bg_3","mini_3",1,"魏",0,2,2,2,},  
    [16] = {116,1,2,0,"柳城",5,"city_4","bg_3","mini_3",1,"魏",0,2,2,2,},  
    [17] = {117,1,3,0,"凉州",6,"city_8","bg_4","mini_4",1,"魏",0,2,3,3,},  
    [18] = {118,1,3,0,"冀州",6,"city_8","bg_4","mini_4",1,"魏",0,2,3,3,},  
    [19] = {119,1,3,0,"幽州",6,"city_8","bg_4","mini_4",1,"魏",0,2,3,3,},  
    [20] = {120,2,1,1,"长安",7,"city_9","bg_4","mini_4",1,"魏",0,2,4,4,},  
    [21] = {121,3,0,0,"武威",4,"city_1","bg_1","mini_1",1,"魏",0,0,0,6,},  
    [22] = {122,3,0,0,"许昌",4,"city_1","bg_1","mini_1",1,"魏",0,0,0,6,},  
    [23] = {123,4,0,0,"函谷关",4,"guanai_02","bg_1","mini_1",1,"魏",2,0,0,0,},  
    [24] = {124,4,0,0,"虎牢关",4,"guanai_01","bg_1","mini_1",1,"魏",2,0,0,0,},  
    [25] = {201,1,1,0,"博望",4,"city_3","bg_2","mini_2",2,"蜀",0,2,1,1,},  
    [26] = {202,1,1,0,"隆中",4,"city_3","bg_2","mini_2",2,"蜀",0,2,1,1,},  
    [27] = {203,1,1,0,"新城",4,"city_3","bg_2","mini_2",2,"蜀",0,2,1,1,},  
    [28] = {204,1,1,0,"夷陵",4,"city_3","bg_2","mini_2",2,"蜀",0,2,1,1,},  
    [29] = {205,1,1,0,"梓潼",4,"city_3","bg_2","mini_2",2,"蜀",0,2,1,1,},  
    [30] = {206,1,1,0,"峨眉",4,"city_3","bg_2","mini_2",2,"蜀",0,2,1,1,},  
    [31] = {207,1,1,0,"武都",4,"city_3","bg_2","mini_2",2,"蜀",0,2,1,1,},  
    [32] = {208,1,1,0,"白水",4,"city_3","bg_2","mini_2",2,"蜀",0,2,1,1,},  
    [33] = {209,1,1,0,"汉寿",4,"city_3","bg_2","mini_2",2,"蜀",0,2,1,1,},  
    [34] = {210,1,1,0,"南郑",4,"city_3","bg_2","mini_2",2,"蜀",0,2,1,1,},  
    [35] = {211,1,2,0,"桂阳",5,"city_4","bg_3","mini_3",2,"蜀",0,2,2,2,},  
    [36] = {212,1,2,0,"零陵",5,"city_4","bg_3","mini_3",2,"蜀",0,2,2,2,},  
    [37] = {213,1,2,0,"江夏",5,"city_4","bg_3","mini_3",2,"蜀",0,2,2,2,},  
    [38] = {214,1,2,0,"汉中",5,"city_4","bg_3","mini_3",2,"蜀",0,2,2,2,},  
    [39] = {215,1,2,0,"绵竹",5,"city_4","bg_3","mini_3",2,"蜀",0,2,2,2,},  
    [40] = {216,1,2,0,"武陵",5,"city_4","bg_3","mini_3",2,"蜀",0,2,2,2,},  
    [41] = {217,1,3,0,"荆州",6,"city_8","bg_4","mini_4",2,"蜀",0,2,3,3,},  
    [42] = {218,1,3,0,"豫州",6,"city_8","bg_4","mini_4",2,"蜀",0,2,3,3,},  
    [43] = {219,1,3,0,"益州",6,"city_8","bg_4","mini_4",2,"蜀",0,2,3,3,},  
    [44] = {220,2,1,1,"成都",7,"city_9","bg_4","mini_4",2,"蜀",0,2,4,4,},  
    [45] = {221,3,0,0,"白帝城",4,"city_1","bg_1","mini_1",2,"蜀",0,0,0,6,},  
    [46] = {222,3,0,0,"长沙",4,"city_1","bg_1","mini_1",2,"蜀",0,0,0,6,},  
    [47] = {223,4,0,0,"剑门关",4,"guanai_03","bg_1","mini_1",2,"蜀",2,0,0,0,},  
    [48] = {224,4,0,0,"葭萌关",4,"guanai_01","bg_1","mini_1",2,"蜀",2,0,0,0,},  
    [49] = {301,1,1,0,"即墨",4,"city_3","bg_2","mini_2",3,"吴",0,2,1,1,},  
    [50] = {302,1,1,0,"临淄",4,"city_3","bg_2","mini_2",3,"吴",0,2,1,1,},  
    [51] = {303,1,1,0,"定陶",4,"city_3","bg_2","mini_2",3,"吴",0,2,1,1,},  
    [52] = {304,1,1,0,"东阿",4,"city_3","bg_2","mini_2",3,"吴",0,2,1,1,},  
    [53] = {305,1,1,0,"乌巢",4,"city_3","bg_2","mini_2",3,"吴",0,2,1,1,},  
    [54] = {306,1,1,0,"广陵",4,"city_3","bg_2","mini_2",3,"吴",0,2,1,1,},  
    [55] = {307,1,1,0,"寿春",4,"city_3","bg_2","mini_2",3,"吴",0,2,1,1,},  
    [56] = {308,1,1,0,"柴桑",4,"city_3","bg_2","mini_2",3,"吴",0,2,1,1,},  
    [57] = {309,1,1,0,"庐江",4,"city_3","bg_2","mini_2",3,"吴",0,2,1,1,},  
    [58] = {310,1,1,0,"秣陵",4,"city_3","bg_2","mini_2",3,"吴",0,2,1,1,},  
    [59] = {311,1,2,0,"北海",5,"city_4","bg_3","mini_3",3,"吴",0,2,2,2,},  
    [60] = {312,1,2,0,"陈留",5,"city_4","bg_3","mini_3",3,"吴",0,2,2,2,},  
    [61] = {313,1,2,0,"下邳",5,"city_4","bg_3","mini_3",3,"吴",0,2,2,2,},  
    [62] = {314,1,2,0,"淮南",5,"city_4","bg_3","mini_3",3,"吴",0,2,2,2,},  
    [63] = {315,1,2,0,"丹阳",5,"city_4","bg_3","mini_3",3,"吴",0,2,2,2,},  
    [64] = {316,1,2,0,"豫章",5,"city_4","bg_3","mini_3",3,"吴",0,2,2,2,},  
    [65] = {317,1,3,0,"青州",6,"city_8","bg_4","mini_4",3,"吴",0,2,3,3,},  
    [66] = {318,1,3,0,"扬州",6,"city_8","bg_4","mini_4",3,"吴",0,2,3,3,},  
    [67] = {319,1,3,0,"兖州",6,"city_8","bg_4","mini_4",3,"吴",0,2,3,3,},  
    [68] = {320,2,1,1,"建业",7,"city_9","bg_4","mini_4",3,"吴",0,2,4,4,},  
    [69] = {321,3,0,0,"会稽",4,"city_1","bg_1","mini_1",3,"吴",0,0,0,6,},  
    [70] = {322,3,0,0,"小沛",4,"city_1","bg_1","mini_1",3,"吴",0,0,0,6,},  
    [71] = {323,4,0,0,"山海关",4,"guanai_01","bg_1","mini_1",3,"吴",2,0,0,0,},  
    [72] = {324,4,0,0,"紫荆关",4,"guanai_04","bg_1","mini_1",3,"吴",2,0,0,0,},  
    [73] = {401,2,2,2,"洛阳",7,"city_10","bg_4","mini_4",4,"吴",0,4,5,5,},
    }
}

local __index_id = {   
    [101] = 1,  
    [102] = 2,  
    [103] = 3,  
    [104] = 4,  
    [105] = 5,  
    [106] = 6,  
    [107] = 7,  
    [108] = 8,  
    [109] = 9,  
    [110] = 10,  
    [111] = 11,  
    [112] = 12,  
    [113] = 13,  
    [114] = 14,  
    [115] = 15,  
    [116] = 16,  
    [117] = 17,  
    [118] = 18,  
    [119] = 19,  
    [120] = 20,  
    [121] = 21,  
    [122] = 22,  
    [123] = 23,  
    [124] = 24,  
    [201] = 25,  
    [202] = 26,  
    [203] = 27,  
    [204] = 28,  
    [205] = 29,  
    [206] = 30,  
    [207] = 31,  
    [208] = 32,  
    [209] = 33,  
    [210] = 34,  
    [211] = 35,  
    [212] = 36,  
    [213] = 37,  
    [214] = 38,  
    [215] = 39,  
    [216] = 40,  
    [217] = 41,  
    [218] = 42,  
    [219] = 43,  
    [220] = 44,  
    [221] = 45,  
    [222] = 46,  
    [223] = 47,  
    [224] = 48,  
    [301] = 49,  
    [302] = 50,  
    [303] = 51,  
    [304] = 52,  
    [305] = 53,  
    [306] = 54,  
    [307] = 55,  
    [308] = 56,  
    [309] = 57,  
    [310] = 58,  
    [311] = 59,  
    [312] = 60,  
    [313] = 61,  
    [314] = 62,  
    [315] = 63,  
    [316] = 64,  
    [317] = 65,  
    [318] = 66,  
    [319] = 67,  
    [320] = 68,  
    [321] = 69,  
    [322] = 70,  
    [323] = 71,  
    [324] = 72,  
    [401] = 73,
}

local __key_map = { 
    id = 1,
    type = 2,
    city_level = 3,
    integral_group = 4,
    name = 5,
    quality = 6,
    pic = 7,
    bg_pic = 8,
    bg_mine = 9,
    area = 10,
    area_name = 11,
    unlock_condition = 12,
    bind_task = 13,
    reward = 14,
    output = 15,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_wrest_city_info")

        return t._raw[__key_map[k]]
    end
}


function wrest_city_info.getLength()
    return #wrest_city_info._data
end



function wrest_city_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_wrest_city_info
function wrest_city_info.indexOf(index)
    if index == nil or not wrest_city_info._data[index] then
        return nil
    end
    return setmetatable({_raw = wrest_city_info._data[index]}, m)
end



---
--@return @class record_wrest_city_info
function wrest_city_info.get(id)
    
    return wrest_city_info.indexOf(__index_id[ id ])
     
end



function wrest_city_info.set(id, key, value)
    local record = wrest_city_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function wrest_city_info.get_index_data()
    return __index_id 
end

return  wrest_city_info 