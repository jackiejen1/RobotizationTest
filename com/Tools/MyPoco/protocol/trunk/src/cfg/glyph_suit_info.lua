---@classdef record_glyph_suit_info
local record_glyph_suit_info = {}


record_glyph_suit_info.id = 0--编号
record_glyph_suit_info.type = 0--分类
record_glyph_suit_info.level = 0--品级
record_glyph_suit_info.suit_num = 0--激活条件
record_glyph_suit_info.quality = 0--品质
record_glyph_suit_info.name =  ""--名称
record_glyph_suit_info.suit_icon =  ""--套装图标
record_glyph_suit_info.suit_name =  ""--套装名称1
record_glyph_suit_info.affect_type1 = 0--属性类型1
record_glyph_suit_info.affect_value1 = 0--属性类型值1
record_glyph_suit_info.affect_type2 = 0--属性类型2
record_glyph_suit_info.affect_value2 = 0--属性类型值2
record_glyph_suit_info.affect_type3 = 0--属性类型3
record_glyph_suit_info.affect_value3 = 0--属性类型值3
record_glyph_suit_info.affect_type4 = 0--属性类型4
record_glyph_suit_info.affect_value4 = 0--属性类型值4

local glyph_suit_info = {
   _data = {   
    [1] = {112,1,1,2,2,"鹰纹套装","11","2件激活",2,4400,0,0,0,0,0,0,},  
    [2] = {113,1,1,3,2,"鹰纹套装","11","3件激活",1,80000,0,0,0,0,0,0,},  
    [3] = {114,1,1,4,2,"鹰纹套装","11","4件激活",5,2200,16,20,0,0,0,0,},  
    [4] = {122,1,2,2,3,"狼纹套装","12","2件激活",2,6600,0,0,0,0,0,0,},  
    [5] = {123,1,2,3,3,"狼纹套装","12","3件激活",1,130000,0,0,0,0,0,0,},  
    [6] = {124,1,2,4,3,"狼纹套装","12","4件激活",5,3300,16,30,0,0,0,0,},  
    [7] = {132,1,3,2,4,"象纹套装","13","2件激活",2,8800,0,0,0,0,0,0,},  
    [8] = {133,1,3,3,4,"象纹套装","13","3件激活",1,170000,0,0,0,0,0,0,},  
    [9] = {134,1,3,4,4,"象纹套装","13","4件激活",5,4400,16,40,0,0,0,0,},  
    [10] = {142,1,4,2,5,"虎纹套装","14","2件激活",2,11100,0,0,0,0,0,0,},  
    [11] = {143,1,4,3,5,"虎纹套装","14","3件激活",1,210000,0,0,0,0,0,0,},  
    [12] = {144,1,4,4,5,"虎纹套装","14","4件激活",5,5600,16,40,0,0,0,0,},  
    [13] = {152,1,5,2,5,"凤纹套装","15","2件激活",2,13200,0,0,0,0,0,0,},  
    [14] = {153,1,5,3,5,"凤纹套装","15","3件激活",1,250000,0,0,0,0,0,0,},  
    [15] = {154,1,5,4,5,"凤纹套装","15","4件激活",5,6600,16,50,0,0,0,0,},  
    [16] = {162,1,6,2,6,"龙纹套装","16","2件激活",2,16600,0,0,0,0,0,0,},  
    [17] = {163,1,6,3,6,"龙纹套装","16","3件激活",1,310000,0,0,0,0,0,0,},  
    [18] = {164,1,6,4,6,"龙纹套装","16","4件激活",5,8300,16,50,0,0,0,0,},  
    [19] = {172,1,7,2,7,"龙纹套装1","16","2件激活",2,22000,0,0,0,0,0,0,},  
    [20] = {173,1,7,3,7,"龙纹套装1","16","3件激活",1,550000,0,0,0,0,0,0,},  
    [21] = {174,1,7,4,7,"龙纹套装1","16","4件激活",5,19000,16,50,0,0,0,0,},  
    [22] = {182,1,8,2,7,"龙纹套装2","16","2件激活",2,30000,0,0,0,0,0,0,},  
    [23] = {183,1,8,3,7,"龙纹套装2","16","3件激活",1,730000,0,0,0,0,0,0,},  
    [24] = {184,1,8,4,7,"龙纹套装2","16","4件激活",5,26000,16,50,0,0,0,0,},  
    [25] = {192,1,9,2,8,"龙纹套装3","16","2件激活",2,37000,0,0,0,0,0,0,},  
    [26] = {193,1,9,3,8,"龙纹套装3","16","3件激活",1,920000,0,0,0,0,0,0,},  
    [27] = {194,1,9,4,8,"龙纹套装3","16","4件激活",5,32000,16,60,0,0,0,0,},  
    [28] = {212,2,1,2,2,"鹰纹套装","11","2件激活",2,6000,1,110000,5,3000,102,50,},  
    [29] = {222,2,2,2,3,"狼纹套装","12","2件激活",2,7200,1,140000,5,3600,101,50,},  
    [30] = {232,2,3,2,4,"象纹套装","13","2件激活",2,10200,1,190000,5,5100,102,80,},  
    [31] = {242,2,4,2,5,"虎纹套装","14","2件激活",2,12000,1,230000,5,6000,101,80,},  
    [32] = {252,2,5,2,5,"凤纹套装","15","2件激活",2,15000,1,280000,5,7500,102,120,},  
    [33] = {262,2,6,2,6,"龙纹套装","16","2件激活",2,18000,1,340000,5,9000,101,120,},
    }
}

local __index_id = {   
    [112] = 1,  
    [113] = 2,  
    [114] = 3,  
    [122] = 4,  
    [123] = 5,  
    [124] = 6,  
    [132] = 7,  
    [133] = 8,  
    [134] = 9,  
    [142] = 10,  
    [143] = 11,  
    [144] = 12,  
    [152] = 13,  
    [153] = 14,  
    [154] = 15,  
    [162] = 16,  
    [163] = 17,  
    [164] = 18,  
    [172] = 19,  
    [173] = 20,  
    [174] = 21,  
    [182] = 22,  
    [183] = 23,  
    [184] = 24,  
    [192] = 25,  
    [193] = 26,  
    [194] = 27,  
    [212] = 28,  
    [222] = 29,  
    [232] = 30,  
    [242] = 31,  
    [252] = 32,  
    [262] = 33,
}

local __key_map = { 
    id = 1,
    type = 2,
    level = 3,
    suit_num = 4,
    quality = 5,
    name = 6,
    suit_icon = 7,
    suit_name = 8,
    affect_type1 = 9,
    affect_value1 = 10,
    affect_type2 = 11,
    affect_value2 = 12,
    affect_type3 = 13,
    affect_value3 = 14,
    affect_type4 = 15,
    affect_value4 = 16,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_glyph_suit_info")

        return t._raw[__key_map[k]]
    end
}


function glyph_suit_info.getLength()
    return #glyph_suit_info._data
end



function glyph_suit_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_glyph_suit_info
function glyph_suit_info.indexOf(index)
    if index == nil or not glyph_suit_info._data[index] then
        return nil
    end
    return setmetatable({_raw = glyph_suit_info._data[index]}, m)
end



---
--@return @class record_glyph_suit_info
function glyph_suit_info.get(id)
    
    return glyph_suit_info.indexOf(__index_id[ id ])
     
end



function glyph_suit_info.set(id, key, value)
    local record = glyph_suit_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function glyph_suit_info.get_index_data()
    return __index_id 
end

return  glyph_suit_info 