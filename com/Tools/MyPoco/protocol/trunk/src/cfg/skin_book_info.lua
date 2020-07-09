---@classdef record_skin_book_info
local record_skin_book_info = {}


record_skin_book_info.id =  ""--id
record_skin_book_info.name =  ""--变装名称
record_skin_book_info.description =  ""--描述
record_skin_book_info.res = 0--资源id
record_skin_book_info.icon = 0--icon资源id
record_skin_book_info.put = 0--是否投放
record_skin_book_info.quality = 0-- 品质
record_skin_book_info.knight_advance_id = 0--关联武将ID
record_skin_book_info.affect_type_1 = 0--加成属性1
record_skin_book_info.affect_value_1 = 0--加成类型值1
record_skin_book_info.affect_type_2 = 0--加成属性2
record_skin_book_info.affect_value_2 = 0--加成类型值2
record_skin_book_info.affect_type_3 = 0--加成属性3
record_skin_book_info.affect_value_3 = 0--加成类型值3
record_skin_book_info.affect_type_4 = 0--加成属性4
record_skin_book_info.affect_value_4 = 0--加成类型值4
record_skin_book_info.op_game_id = 0--可见运营平台
record_skin_book_info.convert_type =  ""--转换道具类型
record_skin_book_info.convert_value =  ""--转换道具值
record_skin_book_info.convert_size =  ""--转换道具数量

local skin_book_info = {
   _data = {   
    [1] = {51004001,"江湖游龙","江湖游龙",51004001,51004001,1,6,510040,1,1000,0,0,0,0,0,0,0,999,0,500,},  
    [2] = {51004002,"龙胆武生","龙胆武生",51004002,51004002,1,6,510040,1,1000,0,0,0,0,0,0,0,999,0,500,},  
    [3] = {51004003,"朋克少年","朋克少年",51004003,51004003,1,6,510040,1,1000,0,0,0,0,0,0,0,999,0,500,},  
    [4] = {51004004,"江湖墨龙","江湖墨龙",51004004,51004004,1,6,510040,1,1000,0,0,0,0,0,0,0,999,0,500,},  
    [5] = {51006001,"霓光科技","霓光科技",51006001,51006001,1,7,510060,16,50,0,0,0,0,0,0,0,999,0,3000,},  
    [6] = {50011001,"白衣胜雪","白衣胜雪",50011001,50011001,1,7,500110,16,50,0,0,0,0,0,0,0,999,0,3000,},  
    [7] = {51002001,"陆战精英","陆战精英",51002001,51002001,1,7,510020,16,50,0,0,0,0,0,0,0,999,0,3000,},  
    [8] = {51008001,"冰雪公主","冰雪公主",51008001,51008001,1,7,510080,16,50,0,0,0,0,0,0,0,999,0,3000,},  
    [9] = {51001001,"玉虚转世","玉虚转世",51001001,51001001,1,7,510010,16,50,0,0,0,0,0,0,0,999,0,3000,},  
    [10] = {51003001,"赤帝天威","赤帝天威",51003001,51003001,1,7,510030,16,50,0,0,0,0,0,0,0,999,0,3000,},  
    [11] = {51005001,"望族骑士","望族骑士",51005001,51005001,1,7,510050,16,50,0,0,0,0,0,0,0,999,0,3000,},  
    [12] = {51007001,"暗夜伯爵","暗夜伯爵",51007001,51007001,1,7,510070,16,50,0,0,0,0,0,0,0,999,0,3000,},  
    [13] = {60009001,"燎原火凤","燎原火凤",60009001,60009001,1,7,600090,16,50,0,0,0,0,0,0,0,999,0,3000,},  
    [14] = {60002001,"秘术绅士","秘术绅士",60002001,60002001,1,7,600020,16,50,0,0,0,0,0,0,0,999,0,3000,},  
    [15] = {60010001,"深渊海王","深渊海王",60010001,60010001,1,7,600100,16,50,0,0,0,0,0,0,0,999,0,3000,},  
    [16] = {60008001,"妖狐降世","妖狐降世",60008001,60008001,1,7,600080,16,50,0,0,0,0,0,0,0,999,0,3000,},  
    [17] = {60011001,"锦衣御令","锦衣御令",60011001,60011001,1,7,600110,16,50,0,0,0,0,0,0,0,999,0,3000,},  
    [18] = {60003001,"墨羽神巫","墨羽神巫",60003001,60003001,1,7,600030,16,50,0,0,0,0,0,0,0,999,0,3000,},  
    [19] = {60005001,"神枪牛仔","神枪牛仔",60005001,60005001,1,7,600050,16,50,0,0,0,0,0,0,0,999,0,3000,},  
    [20] = {60012001,"神道剑心","神道剑心",60012001,60012001,1,7,600120,16,50,0,0,0,0,0,0,0,999,0,3000,},  
    [21] = {60001001,"堕天暗翼","堕天暗翼",60001001,60001001,1,7,600010,16,50,0,0,0,0,0,0,0,999,0,3000,},  
    [22] = {60004001,"金刀豪侠","金刀豪侠",60004001,60004001,1,7,600040,16,50,0,0,0,0,0,0,0,999,0,3000,},  
    [23] = {60006001,"妙笔丹青","妙笔丹青",60006001,60006001,1,7,600060,16,50,0,0,0,0,0,0,0,999,0,3000,},  
    [24] = {60007001,"赤焰魔王","赤焰魔王",60007001,60007001,1,7,600070,16,50,0,0,0,0,0,0,0,999,0,3000,},
    }
}

local __index_id = {   
    [50011001] = 6,  
    [51001001] = 9,  
    [51002001] = 7,  
    [51003001] = 10,  
    [51004001] = 1,  
    [51004002] = 2,  
    [51004003] = 3,  
    [51004004] = 4,  
    [51005001] = 11,  
    [51006001] = 5,  
    [51007001] = 12,  
    [51008001] = 8,  
    [60001001] = 21,  
    [60002001] = 14,  
    [60003001] = 18,  
    [60004001] = 22,  
    [60005001] = 19,  
    [60006001] = 23,  
    [60007001] = 24,  
    [60008001] = 16,  
    [60009001] = 13,  
    [60010001] = 15,  
    [60011001] = 17,  
    [60012001] = 20,
}

local __key_map = { 
    id = 1,
    name = 2,
    description = 3,
    res = 4,
    icon = 5,
    put = 6,
    quality = 7,
    knight_advance_id = 8,
    affect_type_1 = 9,
    affect_value_1 = 10,
    affect_type_2 = 11,
    affect_value_2 = 12,
    affect_type_3 = 13,
    affect_value_3 = 14,
    affect_type_4 = 15,
    affect_value_4 = 16,
    op_game_id = 17,
    convert_type = 18,
    convert_value = 19,
    convert_size = 20,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_skin_book_info")

        return t._raw[__key_map[k]]
    end
}


function skin_book_info.getLength()
    return #skin_book_info._data
end



function skin_book_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_skin_book_info
function skin_book_info.indexOf(index)
    if index == nil or not skin_book_info._data[index] then
        return nil
    end
    return setmetatable({_raw = skin_book_info._data[index]}, m)
end



---
--@return @class record_skin_book_info
function skin_book_info.get(id)
    
    return skin_book_info.indexOf(__index_id[ id ])
     
end



function skin_book_info.set(id, key, value)
    local record = skin_book_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function skin_book_info.get_index_data()
    return __index_id 
end

return  skin_book_info 