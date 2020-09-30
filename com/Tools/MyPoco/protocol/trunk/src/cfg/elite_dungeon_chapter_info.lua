---@classdef record_elite_dungeon_chapter_info
local record_elite_dungeon_chapter_info = {}


record_elite_dungeon_chapter_info.id = 0--id
record_elite_dungeon_chapter_info.next_id = 0--下个章节
record_elite_dungeon_chapter_info.main_chapter = 0--需求主线章节
record_elite_dungeon_chapter_info.name =  ""--章节名称
record_elite_dungeon_chapter_info.chapter_feature =  ""--章节特质
record_elite_dungeon_chapter_info.land_id = 0--所属版块
record_elite_dungeon_chapter_info.res = 0--章节建筑资源
record_elite_dungeon_chapter_info.stage_map = 0--关卡地图文件
record_elite_dungeon_chapter_info.condition_level = 0--开启等级限制
record_elite_dungeon_chapter_info.ctrl_id = 0--关卡怪物配置文件
record_elite_dungeon_chapter_info.total_star = 0--总星数
record_elite_dungeon_chapter_info.star_chest_1 = 0--星数宝箱1
record_elite_dungeon_chapter_info.star_chest_2 = 0--星数宝箱2
record_elite_dungeon_chapter_info.star_chest_3 = 0--星数宝箱3
record_elite_dungeon_chapter_info.stage_1 = 0--关卡1
record_elite_dungeon_chapter_info.stage_2 = 0--关卡2
record_elite_dungeon_chapter_info.stage_3 = 0--关卡3
record_elite_dungeon_chapter_info.stage_4 = 0--关卡4
record_elite_dungeon_chapter_info.stage_5 = 0--关卡5
record_elite_dungeon_chapter_info.stage_6 = 0--关卡6
record_elite_dungeon_chapter_info.stage_7 = 0--关卡7
record_elite_dungeon_chapter_info.stage_8 = 0--关卡8
record_elite_dungeon_chapter_info.stage_9 = 0--关卡9
record_elite_dungeon_chapter_info.stage_10 = 0--关卡10
record_elite_dungeon_chapter_info.stage_chest_1 = 0--关卡宝箱1
record_elite_dungeon_chapter_info.stage_chest_2 = 0--关卡宝箱2
record_elite_dungeon_chapter_info.stage_chest_3 = 0--关卡宝箱3
record_elite_dungeon_chapter_info.stage_chest_4 = 0--关卡宝箱4
record_elite_dungeon_chapter_info.scroll_num = 0--通关残卷数量

local elite_dungeon_chapter_info = {
   _data = {   
    [1] = {1,2,150,"无坚不摧","神兵无双",1,114,3,85,3010,30,1,2,3,190101,190102,190103,190104,190105,190106,190107,190108,190109,190110,10001,10002,10003,0,1,},  
    [2] = {2,3,150,"唯寂方至","减怒沉默",1,111,4,85,4010,30,4,5,6,190201,190202,190203,190204,190205,190206,190207,190208,190209,190210,10004,10005,10006,0,1,},  
    [3] = {3,4,150,"虎啸龙吟","神兽助阵",1,107,9,85,9005,30,7,8,9,190301,190302,190303,190304,190305,190306,190307,190308,190309,190310,10007,10008,10009,0,1,},  
    [4] = {4,5,150,"无尽狂攻","持续输出",1,105,1,85,4,30,10,11,12,190401,190402,190403,190404,190405,190406,190407,190408,190409,190410,10010,10011,10012,0,1,},  
    [5] = {5,6,150,"其利断金","合击撼天",1,113,8,85,8010,30,13,14,15,190501,190502,190503,190504,190505,190506,190507,190508,190509,190510,10013,10014,10015,0,1,},  
    [6] = {6,7,150,"生死一瞬","单点秒杀",2,112,7,85,7010,30,16,17,18,190601,190602,190603,190604,190605,190606,190607,190608,190609,190610,10016,10017,10018,0,1,},  
    [7] = {7,8,150,"蛇蝎诡计","灼烧中毒",2,101,5,85,5010,30,19,20,21,190701,190702,190703,190704,190705,190706,190707,190708,190709,190710,10019,10020,10021,0,1,},  
    [8] = {8,9,150,"以柔克刚","削弱减益",2,104,6,85,6010,30,22,23,24,190801,190802,190803,190804,190805,190806,190807,190808,190809,190810,10022,10023,10024,0,1,},  
    [9] = {9,10,150,"岿然若山","血量增强",2,114,3,85,3010,30,25,26,27,190901,190902,190903,190904,190905,190906,190907,190908,190909,190910,10025,10026,10027,0,1,},  
    [10] = {10,11,150,"束敌秘法","超强控制",2,111,4,85,4010,30,28,29,30,191001,191002,191003,191004,191005,191006,191007,191008,191009,191010,10028,10029,10030,0,1,},  
    [11] = {11,12,150,"无坚不摧","神兵无双",3,107,3,85,3010,30,31,32,33,191101,191102,191103,191104,191105,191106,191107,191108,191109,191110,10031,10032,10033,0,1,},  
    [12] = {12,13,150,"唯寂方至","减怒沉默",3,105,4,85,4010,30,34,35,36,191201,191202,191203,191204,191205,191206,191207,191208,191209,191210,10034,10035,10036,0,1,},  
    [13] = {13,14,150,"虎啸龙吟","神兽助阵",3,113,9,85,9005,30,37,38,39,191301,191302,191303,191304,191305,191306,191307,191308,191309,191310,10037,10038,10039,0,1,},  
    [14] = {14,15,150,"无尽狂攻","持续输出",3,112,1,85,4,30,40,41,42,191401,191402,191403,191404,191405,191406,191407,191408,191409,191410,10040,10041,10042,0,1,},  
    [15] = {15,0,150,"其利断金","合击撼天",3,101,8,85,8010,30,43,44,45,191501,191502,191503,191504,191505,191506,191507,191508,191509,191510,10043,10044,10045,0,1,},
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
}

local __key_map = { 
    id = 1,
    next_id = 2,
    main_chapter = 3,
    name = 4,
    chapter_feature = 5,
    land_id = 6,
    res = 7,
    stage_map = 8,
    condition_level = 9,
    ctrl_id = 10,
    total_star = 11,
    star_chest_1 = 12,
    star_chest_2 = 13,
    star_chest_3 = 14,
    stage_1 = 15,
    stage_2 = 16,
    stage_3 = 17,
    stage_4 = 18,
    stage_5 = 19,
    stage_6 = 20,
    stage_7 = 21,
    stage_8 = 22,
    stage_9 = 23,
    stage_10 = 24,
    stage_chest_1 = 25,
    stage_chest_2 = 26,
    stage_chest_3 = 27,
    stage_chest_4 = 28,
    scroll_num = 29,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_elite_dungeon_chapter_info")

        return t._raw[__key_map[k]]
    end
}


function elite_dungeon_chapter_info.getLength()
    return #elite_dungeon_chapter_info._data
end



function elite_dungeon_chapter_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_elite_dungeon_chapter_info
function elite_dungeon_chapter_info.indexOf(index)
    if index == nil or not elite_dungeon_chapter_info._data[index] then
        return nil
    end
    return setmetatable({_raw = elite_dungeon_chapter_info._data[index]}, m)
end



---
--@return @class record_elite_dungeon_chapter_info
function elite_dungeon_chapter_info.get(id)
    
    return elite_dungeon_chapter_info.indexOf(__index_id[ id ])
     
end



function elite_dungeon_chapter_info.set(id, key, value)
    local record = elite_dungeon_chapter_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function elite_dungeon_chapter_info.get_index_data()
    return __index_id 
end

return  elite_dungeon_chapter_info 