---@classdef record_scroll_reel_info
local record_scroll_reel_info = {}


record_scroll_reel_info.id = 0--ID
record_scroll_reel_info.name =  ""--名称
record_scroll_reel_info.type = 0--风物志类型
record_scroll_reel_info.order = 0--排序
record_scroll_reel_info.painted_id = 0--立绘资源
record_scroll_reel_info.if_change = 0--是否翻转
record_scroll_reel_info.pic_reel =  ""--卷轴底图
record_scroll_reel_info.pic_drawing =  ""--卷轴插画
record_scroll_reel_info.point =  ""--底图偏移
record_scroll_reel_info.reelx_type = 0--底图X轴偏移类型
record_scroll_reel_info.reelx_value = 0--底图X轴偏移参数
record_scroll_reel_info.reely_type = 0--底图Y轴偏移类型
record_scroll_reel_info.reely_value = 0--底图Y轴偏移参数
record_scroll_reel_info.desc =  ""--描述
record_scroll_reel_info.play_id = 0--关联剧情
record_scroll_reel_info.target_desc =  ""--获取说明
record_scroll_reel_info.line_type = 0--进度类型
record_scroll_reel_info.line_value = 0--进度类型值

local scroll_reel_info = {
   _data = {   
    [1] = {1,"少年三国行",2,1,210000,1,"2001","2001","500",1,100,2,40,"虎牢关前，吕布魔化，神秘少年，空降三国",30001,"少年初入三国",3,1,},  
    [2] = {2,"三国志爆炸",2,2,300360,2,"2002","2002","500",1,80,2,30,"三国志意外爆炸，碎成无数残卷飞向各地",30002,"虎牢关前大战吕布",3,1,},  
    [3] = {3,"神将列传",2,3,300390,2,"2003","2003","500",2,30,1,70,"多少英雄豪杰，都化作江山画卷，史册一篇",30003,"主线第3章",1,10280,},  
    [4] = {4,"激斗神将",2,4,510040,2,"2004","2004","500",2,70,1,0,"神将天威，横扫千军，少年无畏，百战成名",30004,"主角达到35级",3,35,},  
    [5] = {5,"奸雄登场",1,1,600010,2,"1009","1009","500",1,100,1,50,"治世之能臣，乱世之奸雄",20009,"主线第1章",1,10060,},  
    [6] = {6,"温酒斩华雄",1,2,600040,1,"1001","1001","500",2,92,1,100,"汜水关前，关羽力斩华雄，其酒尚温",20001,"主线第2章",1,10160,},  
    [7] = {7,"三英战吕布",1,3,600070,2,"1002","1002","500",1,40,1,90,"虎牢关前，神将天威；桃园三英，兄弟扬名",20002,"主线第3章",1,10280,},  
    [8] = {8,"桃园结义",1,4,510030,2,"1003","1003","500",1,5,1,65,"少年英杰聚首，豪情桃园结义",20003,"列传桃园结义-刘备传",2,1006,},  
    [9] = {9,"挂印封金",1,5,600040,1,"1006","1006","500",2,50,1,40,"挂印封金，义薄云天关云长",20005,"列传桃园结义-关羽传",2,2008,},  
    [10] = {10,"孙坚一家人",1,6,500150,1,"1017","1017","500",1,55,1,5,"乱世中的一抹温情",20015,"主线第7章",1,11040,},  
    [11] = {11,"喝断当阳桥",1,7,500080,2,"1004","1004","500",1,60,1,100,"长坂坡前一声吼，喝退曹操百万军",20004,"列传桃园结义-张飞传",2,3009,},  
    [12] = {12,"龙啸长坂坡",1,8,510040,2,"1007","1007","500",1,20,1,60,"子龙一身都是胆，匹马龙啸长坂坡",20007,"列传少年英杰-赵云传",2,4007,},  
    [13] = {13,"乱世佳侣",1,9,600060,2,"1008","1008","500",1,10,2,10,"遥想公瑾当年，小乔初嫁了",20006,"列传少年英杰-周瑜传",2,6009,},  
    [14] = {14,"洛神赋",1,10,500010,2,"1012","1012","500",2,50,1,20,"飘摇兮若流风之回雪",20012,"列传乱世红颜-甄姬传",2,11008,},  
    [15] = {15,"威震逍遥津",1,11,500020,1,"1014","1014","500",1,80,1,50,"逍遥津一役，江东闻张辽之名丧胆",20014,"列传猛将如云-张辽传",2,19007,},  
    [16] = {16,"许褚裸衣战马超",1,12,500110,2,"1013","1013","500",1,10,1,30,"虎痴大战锦马超，一时难分胜负",20013,"列传猛将如云-马超传",2,21006,},  
    [17] = {17,"火烧连营",1,13,510050,1,"1011","1011","500",1,30,1,90,"江东业火，烧尽百里连营",20011,"列传谋臣似雨-陆逊传",2,24008,},  
    [18] = {18,"太平教主",1,14,600080,2,"1010","1010","500",1,10,1,90,"苍天已死，黄天当立",20010,"列传祸乱天下-张角传",2,28006,},  
    [19] = {19,"青梅煮酒论英雄",1,15,600010,2,"1005","1005","500",1,50,1,100,"天下英雄，唯使君与操耳",20008,"列传君临天下-刘备传",2,37006,},
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
}

local __key_map = { 
    id = 1,
    name = 2,
    type = 3,
    order = 4,
    painted_id = 5,
    if_change = 6,
    pic_reel = 7,
    pic_drawing = 8,
    point = 9,
    reelx_type = 10,
    reelx_value = 11,
    reely_type = 12,
    reely_value = 13,
    desc = 14,
    play_id = 15,
    target_desc = 16,
    line_type = 17,
    line_value = 18,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_scroll_reel_info")

        return t._raw[__key_map[k]]
    end
}


function scroll_reel_info.getLength()
    return #scroll_reel_info._data
end



function scroll_reel_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_scroll_reel_info
function scroll_reel_info.indexOf(index)
    if index == nil or not scroll_reel_info._data[index] then
        return nil
    end
    return setmetatable({_raw = scroll_reel_info._data[index]}, m)
end



---
--@return @class record_scroll_reel_info
function scroll_reel_info.get(id)
    
    return scroll_reel_info.indexOf(__index_id[ id ])
     
end



function scroll_reel_info.set(id, key, value)
    local record = scroll_reel_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function scroll_reel_info.get_index_data()
    return __index_id 
end

return  scroll_reel_info 