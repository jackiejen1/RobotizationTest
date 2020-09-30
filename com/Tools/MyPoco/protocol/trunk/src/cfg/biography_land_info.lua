---@classdef record_biography_land_info
local record_biography_land_info = {}


record_biography_land_info.id = 0--id
record_biography_land_info.name =  ""--版块名称
record_biography_land_info.number =  ""--版块序号
record_biography_land_info.res = 0--版块资源
record_biography_land_info.chapter_1 = 0--武将传记1
record_biography_land_info.chapter_2 = 0--武将传记2
record_biography_land_info.chapter_3 = 0--武将传记3
record_biography_land_info.chapter_4 = 0--武将传记4
record_biography_land_info.chapter_5 = 0--武将传记5
record_biography_land_info.biography_team = 0--战役
record_biography_land_info.finish_story = 0--战役结束剧情
record_biography_land_info.if_open = 0--板块是否开启
record_biography_land_info.pic_type = 0--通关奖励形象类型
record_biography_land_info.pic_value = 0--通关奖励形象类型值
record_biography_land_info.des =  ""--通关奖励描述信息
record_biography_land_info.title_1 =  ""--通关奖励标题1
record_biography_land_info.title_2 =  ""--通关奖励标题2
record_biography_land_info.award_icon =  ""--通关奖励图标
record_biography_land_info.unite_token_id = 0--兵符
record_biography_land_info.knight_id_1 = 0--合击武将1
record_biography_land_info.knight_id_2 = 0--合击武将2

local biography_land_info = {
   _data = {   
    [1] = {1,"桃园结义","一",2,1,2,3,0,0,0,0,1,2,40070,"（再通关&<5>#num#&章解锁）","pic/dungeon_achievement/zxcj_jiejiangfu.png","pic/dungeon_achievement/zxcj_jiejiangfu.png","pic/dungeon_achievement/icon_chengjiu_bingfu.png",40070,400030,400120,},  
    [2] = {2,"少年英杰","二",3,4,5,6,7,0,1002,10021,1,2,40040,"（再通关&<5>#num#&章解锁）","pic/dungeon_achievement/zxcj_hantianfu.png","pic/dungeon_achievement/icon_zxcj_jianghun.png","pic/dungeon_achievement/icon_hantianfu.png",40040,400140,400150,},  
    [3] = {3,"乱世红颜","三",1,8,9,10,11,12,1003,10383,0,2,40050,"（再通关&<5>#num#&章解锁）","pic/dungeon_achievement/zxcj_shuanglunfu.png","pic/dungeon_achievement/icon_zxcj_jianghun.png","pic/dungeon_achievement/icon_shuanglunfu.png",40050,400090,400110,},  
    [4] = {4,"群雄争霸","四",1,13,14,15,16,17,1004,10384,0,2,40060,"（再通关&<5>#num#&章解锁）","pic/dungeon_achievement/zxcj_bingfengfu.png","pic/dungeon_achievement/icon_zxcj_jianghun.png","pic/dungeon_achievement/icon_bingfengfu.png",40060,400010,400040,},  
    [5] = {5,"猛将如云","五",1,18,19,20,21,22,1005,10385,0,2,50020,"（再通关&<5>#num#&章解锁）","pic/dungeon_achievement/zxcj_qiangjianhefu.png","pic/dungeon_achievement/icon_zxcj_jianghun.png","pic/dungeon_achievement/icon_qiangjianhefu.png",50020,500200,500240,},  
    [6] = {6,"谋臣似雨","六",1,23,24,25,26,27,1006,10386,0,2,50030,"（再通关&<5>#num#&章解锁）","pic/dungeon_achievement/zxcj_wanjianfafu.png","pic/dungeon_achievement/icon_zxcj_jianghun.png","pic/dungeon_achievement/icon_wanjianfafu.png",50030,500090,500100,},  
    [7] = {7,"祸乱苍生","七",1,28,29,30,31,32,1007,10387,0,2,50050,"（再通关&<5>#num#&章解锁）","pic/dungeon_achievement/zxcj_jiucangshengfu.png","pic/dungeon_achievement/icon_zxcj_jianghun.png","pic/dungeon_achievement/icon_jiucangshengfu.png",50050,500190,500180,},  
    [8] = {8,"君临天下","八",1,33,34,35,36,37,1008,10388,0,2,50040,"（再通关&<5>#num#&章解锁）","pic/dungeon_achievement/zxcj_jurenzhanfu.png","pic/dungeon_achievement/icon_zxcj_jianghun.png","pic/dungeon_achievement/icon_jurenzhanfu.png",50040,500140,500150,},  
    [9] = {9,"中流砥柱","九",1,38,39,40,41,42,1009,10389,0,2,50010,"（再通关&<5>#num#&章解锁）","pic/dungeon_achievement/zxcj_hanbingliefu.png","pic/dungeon_achievement/icon_zxcj_jianghun.png","pic/dungeon_achievement/icon_hanbingliefu.png",50010,500040,500050,},  
    [10] = {10,"闲云野鹤","十",1,43,44,45,46,47,1010,10390,0,2,50060,"（再通关&<5>#num#&章解锁）","pic/dungeon_achievement/zxcj_leilongbaofu.png","pic/dungeon_achievement/icon_zxcj_jianghun.png","pic/dungeon_achievement/icon_leilongbaofu.png",50060,500020,500060,},  
    [11] = {11,"横刀立马","十一",1,48,49,50,51,52,1011,10459,0,2,50090,"（再通关&<5>#num#&章解锁）","pic/dungeon_achievement/zxcj_haoyuemingfu.png","pic/dungeon_achievement/icon_zxcj_jianghun.png","pic/dungeon_achievement/icon_haoyuemingfu.png",50090,510080,500010,},  
    [12] = {12,"纵横捭阖","十二",1,53,54,55,56,57,1012,10535,0,2,50130,"（再通关&<5>#num#&章解锁）","pic/dungeon_achievement/zxcj_huqichongfu.png","pic/dungeon_achievement/icon_zxcj_jianghun.png","pic/dungeon_achievement/icon_huqichongfu.png",50130,510020,500030,},  
    [13] = {13,"勇往无前","十三",1,58,59,60,61,62,1013,10596,0,2,50080,"（再通关&<5>#num#&章解锁）","pic/dungeon_achievement/zxcj_tietitafu.png","pic/dungeon_achievement/icon_zxcj_jianghun.png","pic/dungeon_achievement/icon_tietitafu.png",50080,500110,510040,},  
    [14] = {14,"独步天下","十四",1,63,64,65,66,67,1014,10702,0,2,50120,"（再通关&<5>#num#&章解锁）","pic/dungeon_achievement/zxcj_shuangjiaomeifu.png","pic/dungeon_achievement/icon_zxcj_jianghun.png","pic/dungeon_achievement/icon_shuangjiaomeifu.png",50120,500130,510060,},  
    [15] = {15,"峥嵘头角","十五",1,68,69,70,71,72,1015,10703,0,2,50070,"（再通关&<5>#num#&章解锁）","pic/dungeon_achievement/zxcj_haoqingzhifu.png","pic/dungeon_achievement/icon_zxcj_jianghun.png","pic/dungeon_achievement/icon_haoqingzhi.png",50070,510030,500080,},  
    [16] = {16,"毕生理想","十六",1,73,74,75,76,77,1016,10779,0,2,50100,"（再通关&<5>#num#&章解锁）","pic/dungeon_achievement/zxcj_tudufuzhou.png","pic/dungeon_achievement/icon_zxcj_jianghun.png","pic/dungeon_achievement/icon_tuduzhoufu.png",50100,510070,500210,},  
    [17] = {17,"志存高远","十七",1,78,79,80,81,82,1017,10858,0,2,50140,"（再通关&<5>#num#&章解锁）","pic/dungeon_achievement/zxcj_shuangfengmingfu.png","pic/dungeon_achievement/icon_zxcj_jianghun.png","pic/dungeon_achievement/icon_shuangfengmingfu.png",50140,510010,500070,},  
    [18] = {18,"英雄本色","十八",1,83,84,85,86,87,1018,11009,0,2,50160,"（再通关&<5>#num#&章解锁）","pic/dungeon_achievement/zxcj_yueyingdiewu.png","pic/dungeon_achievement/icon_zxcj_jianghun.png","pic/dungeon_achievement/icon_yueyingdiewu.png",50160,510080,510060,},
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
}

local __key_map = { 
    id = 1,
    name = 2,
    number = 3,
    res = 4,
    chapter_1 = 5,
    chapter_2 = 6,
    chapter_3 = 7,
    chapter_4 = 8,
    chapter_5 = 9,
    biography_team = 10,
    finish_story = 11,
    if_open = 12,
    pic_type = 13,
    pic_value = 14,
    des = 15,
    title_1 = 16,
    title_2 = 17,
    award_icon = 18,
    unite_token_id = 19,
    knight_id_1 = 20,
    knight_id_2 = 21,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_biography_land_info")

        return t._raw[__key_map[k]]
    end
}


function biography_land_info.getLength()
    return #biography_land_info._data
end



function biography_land_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_biography_land_info
function biography_land_info.indexOf(index)
    if index == nil or not biography_land_info._data[index] then
        return nil
    end
    return setmetatable({_raw = biography_land_info._data[index]}, m)
end



---
--@return @class record_biography_land_info
function biography_land_info.get(id)
    
    return biography_land_info.indexOf(__index_id[ id ])
     
end



function biography_land_info.set(id, key, value)
    local record = biography_land_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function biography_land_info.get_index_data()
    return __index_id 
end

return  biography_land_info 