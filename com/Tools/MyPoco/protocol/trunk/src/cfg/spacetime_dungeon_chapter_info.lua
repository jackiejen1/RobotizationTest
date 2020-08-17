---@classdef record_spacetime_dungeon_chapter_info
local record_spacetime_dungeon_chapter_info = {}


record_spacetime_dungeon_chapter_info.id = 0--ID
record_spacetime_dungeon_chapter_info.map_id = 0--章节地图配置文件
record_spacetime_dungeon_chapter_info.event_file =  ""--章节事件配置文件
record_spacetime_dungeon_chapter_info.last_chapter = 0--上一章节id
record_spacetime_dungeon_chapter_info.if_show = 0--是否开放
record_spacetime_dungeon_chapter_info.dungeon_chapter_open = 0--主线章节开启条件值
record_spacetime_dungeon_chapter_info.pre_reward_num = 0--前一章节奖励进度数量
record_spacetime_dungeon_chapter_info.reward_team = 0--章节奖励组
record_spacetime_dungeon_chapter_info.chapter_des1 =  ""--章节描述
record_spacetime_dungeon_chapter_info.chapter_des2 =  ""--章节特点
record_spacetime_dungeon_chapter_info.name =  ""--章节名称
record_spacetime_dungeon_chapter_info.icon =  ""--章节建筑图标
record_spacetime_dungeon_chapter_info.pic =  ""--章节入口贴图
record_spacetime_dungeon_chapter_info.knight_base_id = 0--副本角色
record_spacetime_dungeon_chapter_info.open_type = 0--副本类型
record_spacetime_dungeon_chapter_info.open_time = 0--开启时间
record_spacetime_dungeon_chapter_info.if_shield = 0--是否屏蔽
record_spacetime_dungeon_chapter_info.set_id = 0--篇章ID
record_spacetime_dungeon_chapter_info.set_name =  ""--篇章名称

local spacetime_dungeon_chapter_info = {
   _data = {   
    [1] = {1,101,"101_event",0,1,120,0,1,"白狼山一战，张辽全歼乌桓骑兵，并俘获了无数乌桓勇士。乌桓勇士所携带的匕首锋锐非常，引起了张辽的注意。","杀敌夺宝","白狼刀啸","0","pic_cezi_cj_xueshan",0,1,0,0,0,"0",},  
    [2] = {2,102,"102_event",1,1,150,3,2,"诸葛亮北伐中原，与魏军在汉中一代对峙数月。双方僵持不下，诸葛亮在战场周围布下阵法，试图将魏军困在阵中。","破解机关","奇门遁甲","0","pic_cezi_cj_gebi",0,1,0,0,0,"0",},  
    [3] = {3,103,"103_event",2,1,180,3,3,"传说山中有山鬼，上山的人都会成为山鬼的食物。儒生张角为治疫病，入山中采药，","寻找通路","南华仙书","0","pic_cezi_cj_conglin",0,1,0,0,0,"0",},  
    [4] = {4,104,"104_event",3,1,210,5,4,"十八路联军反攻洛阳，孙坚在洛阳城中发现了一道冲天而起的紫光。","解除陷阱","冲霄紫气","0","pic_cezi_cj_chengzhen",0,1,0,0,0,"0",},  
    [5] = {5,105,"105_event",4,1,240,5,5,"甘宁巡海时误闯无名荒岛，满目皆是皑皑白雪。此时，荒岛深处却传来了一阵如真似幻的清脆铃音。","寻找生路","雪域迷音","0","pic_cezi_cj_xueshan",0,1,0,0,0,"0",},  
    [6] = {1001,10001,"10001_event",0,1,30,0,10001,"镇魂街上恶灵异动，盗走灵槐枝。曹焱兵追回灵槐枝，却发现自己的守护灵在不断削弱，而削弱的原因似乎和三国时代有关。","杀敌夺宝","灵槐异动","0","pic_cezi_cj_zhenhunjie02",210012,2,1592236800,1,1,"镇魂奇遇",},  
    [7] = {1002,10002,"10002_event",1001,1,30,9,10002,"曹焱兵追寻守护灵进入三国时代，没想到三国时代也乱象不断。曹焱兵的首要任务就是救出祖宗曹操。","伏兵危机","三国乱变","0","pic_cezi_cj_conglin",210012,2,1592409600,1,1,"镇魂奇遇",},  
    [8] = {1003,10003,"10003_event",1002,1,30,8,10003,"三国时代面临崩塌，曹焱兵得知是个神秘黑衣人在操纵着这一切。他必须尽快抓住罪魁祸首，拯救三国时代。","机关传送","清风化煞","0","pic_cezi_cj_xueshan",210012,2,1592668800,1,1,"镇魂奇遇",},  
    [9] = {1004,10004,"10004_event",1003,1,30,7,10004,"曹焱兵用清风化煞净化三国的同时，返回镇魂街的黑衣人催动转轮神珠开启了阴门，镇魂街面临前所未有的巨大危机。","异界穿梭","回天转日","0","pic_cezi_cj_zhenhunjie01",210012,2,1593014400,1,1,"镇魂奇遇",},  
    [10] = {1005,10005,"10005_event",0,1,30,0,10005,"初平元年，袁绍以盟主之名，号令十八路诸侯讨伐董卓。不料中途受困，袁绍顺势揪出盟军叛徒。","破解机关","诸侯并起","0","pic_cezi_cj_xiari01",500200,2,1596384000,0,2,"四世三公",},  
    [11] = {1006,10006,"10006_event",1005,1,30,11,10006,"袁绍收服叛贼鞠义，奇袭邺城。冀州牧韩馥不敌，最终交出冀州牧令，袁绍自领冀州牧。","寻找通路","入主冀州","0","pic_cezi_cj_zhenhunjie02",500200,2,1596988800,0,2,"四世三公",},  
    [12] = {1007,10007,"10007_event",1006,1,30,8,10007,"初平四年，袁绍大举进剿黑山、黄巾军，围攻五天，剿灭黑山、黄巾部队数万人。","杀敌求生","苍岩会战","0","pic_cezi_cj_xueshan",500200,2,1597593600,0,2,"四世三公",},  
    [13] = {1008,10008,"10008_event",1007,1,30,8,10008,"建安三年，袁绍率兵攻公孙瓒。公孙瓒退入易京，设下重重拒马，只守不攻。袁绍以火攻之计拿下公孙瓒。","点火造路","奇袭易京","0","pic_cezi_cj_xiari02",500200,2,1598198400,0,2,"四世三公",},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [3] = 3,  
    [4] = 4,  
    [5] = 5,  
    [1001] = 6,  
    [1002] = 7,  
    [1003] = 8,  
    [1004] = 9,  
    [1005] = 10,  
    [1006] = 11,  
    [1007] = 12,  
    [1008] = 13,
}

local __key_map = { 
    id = 1,
    map_id = 2,
    event_file = 3,
    last_chapter = 4,
    if_show = 5,
    dungeon_chapter_open = 6,
    pre_reward_num = 7,
    reward_team = 8,
    chapter_des1 = 9,
    chapter_des2 = 10,
    name = 11,
    icon = 12,
    pic = 13,
    knight_base_id = 14,
    open_type = 15,
    open_time = 16,
    if_shield = 17,
    set_id = 18,
    set_name = 19,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_spacetime_dungeon_chapter_info")

        return t._raw[__key_map[k]]
    end
}


function spacetime_dungeon_chapter_info.getLength()
    return #spacetime_dungeon_chapter_info._data
end



function spacetime_dungeon_chapter_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_spacetime_dungeon_chapter_info
function spacetime_dungeon_chapter_info.indexOf(index)
    if index == nil or not spacetime_dungeon_chapter_info._data[index] then
        return nil
    end
    return setmetatable({_raw = spacetime_dungeon_chapter_info._data[index]}, m)
end



---
--@return @class record_spacetime_dungeon_chapter_info
function spacetime_dungeon_chapter_info.get(id)
    
    return spacetime_dungeon_chapter_info.indexOf(__index_id[ id ])
     
end



function spacetime_dungeon_chapter_info.set(id, key, value)
    local record = spacetime_dungeon_chapter_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function spacetime_dungeon_chapter_info.get_index_data()
    return __index_id 
end

return  spacetime_dungeon_chapter_info 