---@classdef record_skin_info
local record_skin_info = {}


record_skin_info.id = 0--变装ID
record_skin_info.name =  ""--变装名称
record_skin_info.book_id = 0--图鉴id
record_skin_info.time_value = 0--变装时效
record_skin_info.gm = 0--是否GM后台发送
record_skin_info.remind_size = 0--GM后台数量提示
record_skin_info.warn_size = 0--资源预警数量

local skin_info = {
   _data = {   
    [1] = {51004001,"赵云·江湖游龙",51004001,0,1,2,2,},  
    [2] = {51004002,"赵云·龙胆武生",51004002,0,1,2,2,},  
    [3] = {51004003,"赵云·朋克少年",51004003,0,1,2,2,},  
    [4] = {51004004,"赵云·江湖墨龙",51004004,0,1,2,2,},  
    [5] = {51006001,"小乔·霓光科技",51006001,0,1,2,2,},  
    [6] = {51006002,"小乔·虹光偶像",51006002,0,1,2,2,},  
    [7] = {50011001,"马超·白衣胜雪",50011001,0,1,2,2,},  
    [8] = {50011002,"马超·赤黑荣耀",50011002,0,1,2,2,},  
    [9] = {51002001,"典韦·陆战精英",51002001,0,1,2,2,},  
    [10] = {51008001,"貂蝉·冰雪公主",51008001,0,1,2,2,},  
    [11] = {51008002,"貂蝉·冰雪极客",51008002,0,1,2,2,},  
    [12] = {51001001,"郭嘉·玉虚转世",51001001,0,1,2,2,},  
    [13] = {51003001,"刘备·赤帝天威",51003001,0,1,2,2,},  
    [14] = {51003002,"刘备·幽帝灵威",51003002,0,1,2,2,},  
    [15] = {51005001,"陆逊·望族骑士",51005001,0,1,2,2,},  
    [16] = {51007001,"贾诩·暗夜伯爵",51007001,0,1,2,2,},  
    [17] = {60009001,"黄月英·燎原火凤",60009001,0,1,2,2,},  
    [18] = {60009002,"黄月英·凤与米兔",60009002,0,1,2,2,},  
    [19] = {60002001,"司马懿·秘术绅士",60002001,0,1,2,2,},  
    [20] = {60010001,"甘宁·深渊海王",60010001,0,1,2,2,},  
    [21] = {60008001,"张角·妖狐降世",60008001,0,1,2,2,},  
    [22] = {60011001,"荀彧·锦衣御令",60011001,0,1,2,2,},  
    [23] = {60003001,"诸葛亮·墨羽神巫",60003001,0,1,2,2,},  
    [24] = {60005001,"孙策·神枪牛仔",60005001,0,1,2,2,},  
    [25] = {60012001,"左慈·神道剑心",60012001,0,1,2,2,},  
    [26] = {60001001,"曹操·堕天暗翼",60001001,0,1,2,2,},  
    [27] = {60004001,"关羽·金刀豪侠",60004001,0,1,2,2,},  
    [28] = {60006001,"周瑜·妙笔丹青",60006001,0,1,2,2,},  
    [29] = {60007001,"吕布·赤焰魔王",60007001,0,1,2,2,},  
    [30] = {70001001,"曹节·海浪夏姬",70001001,0,1,2,2,},  
    [31] = {70002001,"诸葛果·春桃使者",70002001,0,1,2,2,},  
    [32] = {70003001,"孙鲁班·落雪精灵",70003001,0,1,2,2,},  
    [33] = {70004001,"吕玲绮·飒爽红枫",70004001,0,1,2,2,},
    }
}

local __index_id = {   
    [50011001] = 7,  
    [50011002] = 8,  
    [51001001] = 12,  
    [51002001] = 9,  
    [51003001] = 13,  
    [51003002] = 14,  
    [51004001] = 1,  
    [51004002] = 2,  
    [51004003] = 3,  
    [51004004] = 4,  
    [51005001] = 15,  
    [51006001] = 5,  
    [51006002] = 6,  
    [51007001] = 16,  
    [51008001] = 10,  
    [51008002] = 11,  
    [60001001] = 26,  
    [60002001] = 19,  
    [60003001] = 23,  
    [60004001] = 27,  
    [60005001] = 24,  
    [60006001] = 28,  
    [60007001] = 29,  
    [60008001] = 21,  
    [60009001] = 17,  
    [60009002] = 18,  
    [60010001] = 20,  
    [60011001] = 22,  
    [60012001] = 25,  
    [70001001] = 30,  
    [70002001] = 31,  
    [70003001] = 32,  
    [70004001] = 33,
}

local __key_map = { 
    id = 1,
    name = 2,
    book_id = 3,
    time_value = 4,
    gm = 5,
    remind_size = 6,
    warn_size = 7,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_skin_info")

        return t._raw[__key_map[k]]
    end
}


function skin_info.getLength()
    return #skin_info._data
end



function skin_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_skin_info
function skin_info.indexOf(index)
    if index == nil or not skin_info._data[index] then
        return nil
    end
    return setmetatable({_raw = skin_info._data[index]}, m)
end



---
--@return @class record_skin_info
function skin_info.get(id)
    
    return skin_info.indexOf(__index_id[ id ])
     
end



function skin_info.set(id, key, value)
    local record = skin_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function skin_info.get_index_data()
    return __index_id 
end

return  skin_info 