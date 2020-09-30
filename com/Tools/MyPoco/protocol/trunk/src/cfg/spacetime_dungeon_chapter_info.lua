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
record_spacetime_dungeon_chapter_info.event_start_time = 0--活动时间开启
record_spacetime_dungeon_chapter_info.event_end_time = 0--活动时间结束
record_spacetime_dungeon_chapter_info.zone_pic =  ""--板块封面图
record_spacetime_dungeon_chapter_info.word_color_start =  ""--板块封面主色
record_spacetime_dungeon_chapter_info.word_color_end =  ""--板块封面过渡色
record_spacetime_dungeon_chapter_info.end_time = 0--篇章关闭时间

local spacetime_dungeon_chapter_info = {
   _data = {   
    [1] = {1,101,"101_event",0,1,120,0,1,"白狼山一战，张辽全歼乌桓骑兵，并俘获了无数乌桓勇士。乌桓勇士所携带的匕首锋锐非常，引起了张辽的注意。","杀敌夺宝","白狼刀啸","0","pic_cezi_cj_xueshan",0,1,0,0,0,"0",0,0,"0","0","0",0,},  
    [2] = {2,102,"102_event",1,1,150,3,2,"诸葛亮北伐中原，与魏军在汉中一代对峙数月。双方僵持不下，诸葛亮在战场周围布下阵法，试图将魏军困在阵中。","破解机关","奇门遁甲","0","pic_cezi_cj_gebi",0,1,0,0,0,"0",0,0,"0","0","0",0,},  
    [3] = {3,103,"103_event",2,1,180,3,3,"传说山中有山鬼，上山的人都会成为山鬼的食物。儒生张角为治疫病，入山中采药。","寻找通路","南华仙书","0","pic_cezi_cj_conglin",0,1,0,0,0,"0",0,0,"0","0","0",0,},  
    [4] = {4,104,"104_event",3,1,210,5,4,"十八路联军反攻洛阳，孙坚在洛阳城中发现了一道冲天而起的紫光。","解除陷阱","冲霄紫气","0","pic_cezi_cj_chengzhen",0,1,0,0,0,"0",0,0,"0","0","0",0,},  
    [5] = {5,105,"105_event",4,1,240,5,5,"甘宁巡海时误闯无名荒岛，满目皆是皑皑白雪。此时，荒岛深处却传来了一阵如真似幻的清脆铃音。","寻找生路","雪域迷音","0","pic_cezi_cj_xueshan",0,1,0,0,0,"0",0,0,"0","0","0",0,},  
    [6] = {6,106,"106_event",5,1,270,10,6,"曹操东征徐州，张邈、陈宫乘机在兖州反曹，暗中迎接吕布。时兖州诸城皆响应张邈，投靠吕布。独豫州刺史郭贡虽受吕布煽动，却犹豫未定。荀彧准确判断情势，欲游说郭贡，却被陈宫所设机关所困。","破解机关","智破两仪","0","pic_cezi_cj_conglin",0,1,0,0,0,"0",0,0,"0","0","0",0,},  
    [7] = {7,107,"107_event",6,1,300,8,7,"马腾被曹操所杀，马超准备起兵为父报仇。临行之际，入山寻找绝世神兵，并邀请少年助他一臂之力。","获取祝福","雾隐仙踪","0","pic_cezi_cj_xueshan",0,1,0,0,0,"0",0,0,"0","0","0",0,},  
    [8] = {1001,10001,"10001_event",0,1,30,0,10001,"镇魂街上恶灵异动，盗走灵槐枝。曹焱兵追回灵槐枝，却发现自己的守护灵在不断削弱，而削弱的原因似乎和三国时代有关。","杀敌夺宝","灵槐异动","0","pic_cezi_cj_zhenhunjie02",210012,2,1592236800,1,1,"镇魂奇遇",1598585786,1599898240,"pic_emfb_shu_02","#a32230","#d84950",0,},  
    [9] = {1002,10002,"10002_event",1001,1,30,9,10002,"曹焱兵追寻守护灵进入三国时代，没想到三国时代也乱象不断。曹焱兵的首要任务就是救出祖宗曹操。","伏兵危机","三国乱变","0","pic_cezi_cj_conglin",210012,2,1592409600,1,1,"镇魂奇遇",1598585786,1599898240,"pic_emfb_shu_02","#a32230","#d84950",0,},  
    [10] = {1003,10003,"10003_event",1002,1,30,8,10003,"三国时代面临崩塌，曹焱兵得知是个神秘黑衣人在操纵着这一切。他必须尽快抓住罪魁祸首，拯救三国时代。","机关传送","清风化煞","0","pic_cezi_cj_xueshan",210012,2,1592668800,1,1,"镇魂奇遇",1598585786,1599898240,"pic_emfb_shu_02","#a32230","#d84950",0,},  
    [11] = {1004,10004,"10004_event",1003,1,30,7,10004,"曹焱兵用清风化煞净化三国的同时，返回镇魂街的黑衣人催动转轮神珠开启了阴门，镇魂街面临前所未有的巨大危机。","异界穿梭","回天转日","0","pic_cezi_cj_zhenhunjie01",210012,2,1593014400,1,1,"镇魂奇遇",1598585786,1599898240,"pic_emfb_shu_02","#a32230","#d84950",0,},  
    [12] = {1005,10005,"10005_event",0,1,30,0,10005,"初平元年，袁绍以盟主之名，号令十八路诸侯讨伐董卓。不料中途受困，袁绍顺势揪出盟军叛徒。","破解机关","诸侯并起","0","pic_cezi_cj_xiari01",500200,2,1596384000,0,2,"四世三公",1599898240,1599898250,"pic_emfb_shu_03","#453f78","#637d98",0,},  
    [13] = {1006,10006,"10006_event",1005,1,30,11,10006,"袁绍收服叛贼鞠义，奇袭邺城。冀州牧韩馥不敌，最终交出冀州牧令，袁绍自领冀州牧。","寻找通路","入主冀州","0","pic_cezi_cj_zhenhunjie02",500200,2,1596988800,0,2,"四世三公",1599898240,1599898251,"pic_emfb_shu_03","#453f78","#637d98",0,},  
    [14] = {1007,10007,"10007_event",1006,1,30,8,10007,"初平四年，袁绍大举进剿黑山、黄巾军，围攻五天，剿灭黑山、黄巾部队数万人。","杀敌求生","苍岩会战","0","pic_cezi_cj_xueshan",500200,2,1597593600,0,2,"四世三公",1599898240,1599898252,"pic_emfb_shu_03","#453f78","#637d98",0,},  
    [15] = {1008,10008,"10008_event",1007,1,30,8,10008,"建安三年，袁绍率兵攻公孙瓒。公孙瓒退入易京，设下重重拒马，只守不攻。袁绍以火攻之计拿下公孙瓒。","点火造路","奇袭易京","0","pic_cezi_cj_xiari02",500200,2,1598198400,0,2,"四世三公",1599898240,1599898253,"pic_emfb_shu_03","#453f78","#637d98",0,},  
    [16] = {1009,10009,"10009_event",0,1,30,0,10009,"姜子牙随身宝物打神鞭莫名失落于幽都山，他寻找之际，却发现另一个时空的乱流引发了幽都山异变。","迷宫传送","幽都疑云","0","pic_cezi_cj_youdushan",700130,2,1601568000,1,3,"一战封神",1601481600,1604160000,"pic_emfb_shu_02","#a32230","#d84950",0,},  
    [17] = {1010,10010,"10010_event",1009,1,30,10,10010,"姜子牙来到三国时空，救下被镜像大阵所困的诸葛亮和赵云，原来诸葛亮正是那个引姜子牙前来之人。","镜像机关","风云际会","0","pic_cezi_cj_zhenhunjie02",700130,2,1602259200,1,3,"一战封神",1601481600,1604160001,"pic_emfb_shu_02","#a32230","#d84950",0,},  
    [18] = {1011,10011,"10011_event",1010,1,30,9,10011,"赤壁之战前夕，诸葛亮欲借东风，却发现风被法阵所挡。姜子牙帮其破阵，揭穿假扮成曹操的于吉，于吉就是那个引发乱世的人。","破碎虚空","赤壁硝烟","0","pic_cezi_cj_xueshan",700130,2,1602864000,1,3,"一战封神",1601481600,1604160002,"pic_emfb_shu_02","#a32230","#d84950",0,},  
    [19] = {1012,10012,"10012_event",1011,1,30,9,10012,"姜子牙再上昆仑打败于吉，取走封神榜。这一战，姜子牙以一己之力护佑苍生，他亦成为三国世界的神！","点火造路","再上昆仑","0","pic_cezi_cj_kunlun",700130,2,1603468800,1,3,"一战封神",1601481600,1604160003,"pic_emfb_shu_02","#a32230","#d84950",0,},
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
    [1001] = 8,  
    [1002] = 9,  
    [1003] = 10,  
    [1004] = 11,  
    [1005] = 12,  
    [1006] = 13,  
    [1007] = 14,  
    [1008] = 15,  
    [1009] = 16,  
    [1010] = 17,  
    [1011] = 18,  
    [1012] = 19,
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
    event_start_time = 20,
    event_end_time = 21,
    zone_pic = 22,
    word_color_start = 23,
    word_color_end = 24,
    end_time = 25,
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