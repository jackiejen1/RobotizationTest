---@classdef record_mystery_chapter_info
local record_mystery_chapter_info = {}


record_mystery_chapter_info.id = 0--id
record_mystery_chapter_info.name =  ""--秘境名称
record_mystery_chapter_info.next_id = 0--下一秘境
record_mystery_chapter_info.last_id = 0--上一秘境
record_mystery_chapter_info.open_level = 0--守将挑战等级
record_mystery_chapter_info.boss = 0--秘境boss
record_mystery_chapter_info.elite_monster = 0--秘境守将
record_mystery_chapter_info.elite_reward = 0--守将奖励
record_mystery_chapter_info.monster1 = 0--小怪组1
record_mystery_chapter_info.monster2 = 0--小怪组2
record_mystery_chapter_info.monster3 = 0--小怪组3
record_mystery_chapter_info.monster4 = 0--小怪组4
record_mystery_chapter_info.monster5 = 0--小怪组5
record_mystery_chapter_info.order = 0--章节顺序
record_mystery_chapter_info.task_npc = 0--任务NPC
record_mystery_chapter_info.pic_id = 0--地图配置
record_mystery_chapter_info.icon_id = 0--地图图标
record_mystery_chapter_info.pet_pic = 0--神兽剪影
record_mystery_chapter_info.boss_pic = 0--神兽立绘
record_mystery_chapter_info.point_x = 0--X坐标
record_mystery_chapter_info.point_y = 0--Y坐标
record_mystery_chapter_info.task_title =  ""--接取标题
record_mystery_chapter_info.task_desc =  ""--任务接取

local mystery_chapter_info = {
   _data = {   
    [1] = {1,"丛林秘境",2,0,60,0,1301,261001,110,120,130,0,0,1,1101,110001,16,0,0,101,101,"秘境风云","少年一行被困蓬莱仙境，偶遇一名鹤发童颜的长云仙人。他告知少年，只有找到秘境中的神兽之尊，才可腾云离开此地。少年在这秘境中的风云故事，就此展开。",},  
    [2] = {2,"旷野戈壁",3,1,62,0,1302,261002,210,220,230,0,0,2,1102,110002,14,0,0,102,102,"杀机重重","少年在仙岛秘境中一路前行，明枪暗箭如数而至。长云仙人解释道，这里每一个岛屿，经过厮杀争夺后，都由一人占领。想要继续前进，就要打败每一个岛上的守将。",},  
    [3] = {3,"异乡营地",4,2,65,0,1303,261003,310,320,330,0,0,3,1103,110003,17,0,0,103,103,"突围而出","少年一路拼杀，想要从仙岛边缘突围而出。长云仙人叹息道，仙岛秘境，没有尽头，只有找到神兽至尊，才能离开。少年不信，孤身而行。",},  
    [4] = {4,"仙岛码头",5,3,67,0,1304,261004,410,420,430,0,0,4,1104,110004,11,0,0,104,104,"仙岛彼岸","少年孤身来到了眼见的最远处，不想彼岸之外，还是彼岸。整个仙岛秘境，竟是连绵不断的岛屿。这时一个自称流霄的仙人出现，只是他的笑容中似乎不怀好意。",},  
    [5] = {5,"上仙府宅",6,4,70,1201,1305,261005,510,520,530,0,0,5,1105,110005,15,0,1010,-50,21,"机关纵横","少年来到了彼岸，发现这里的岛上竟然有着城市的气息。在岛上的不只有流落秘境的普通人，还有一些木制的机关傀儡，栩栩如生。流霄仙人随少年也来到了此处。",},  
    [6] = {6,"机关阡陌",7,5,72,0,1306,261006,610,620,630,0,0,6,1106,110006,12,0,0,101,101,"能人异士","随着在这片岛屿上的探索，少年遇到了越来越多的机关巧匠，他们驱使傀儡，生活在秘境之中。流霄仙人笑道，傀儡与人真的有那么多差别吗？",},  
    [7] = {7,"禁忌森林",8,6,74,0,1307,261007,710,720,730,0,0,7,1107,110007,16,0,0,102,102,"丛林探险","少年闯入了机关匠人口中的禁地。这片丛林中，猛兽栖息，恶人潜伏。少年遇到了一位痴迷符咒之术的仙人，仙人答应少年带他进入禁地，不过要帮他做三件事。",},  
    [8] = {8,"图腾遗迹",9,7,76,0,1308,261008,810,820,830,0,0,8,1108,110008,14,0,0,103,103,"神兽踪迹","少年在禁地的守将口中得到了神兽之尊的消息，他问仙人可知此事。仙人却说，他一心画符修长生，不问秘境之事。有什么事，都去问长云吧。原来这两位仙人竟是熟识。",},  
    [9] = {9,"残垣之城",10,8,78,0,1309,261009,910,920,930,0,0,9,1109,110009,13,0,0,104,104,"神秘遗迹","少年历经艰难来到禁地深处。这里断壁残垣林立，显然是一处遗迹，可三国之前，从未有过海上王国的记载。长云仙人此时现身说道，他来到仙岛时，遗迹便已经在了。",},  
    [10] = {10,"灵兽祭台",11,9,80,1202,1310,261010,1010,1020,1030,0,0,10,1110,110010,17,0,2010,-50,56,"前途未卜","少年在禁地遗迹得到了消息。此地很久之前确实供奉灵兽，但不知何时，莫名消失了。线索中断，脱困之路前途渺茫，长云仙人宽慰少年，愿意一路相助。",},  
    [11] = {11,"遗迹东部",12,10,82,0,1311,261011,1110,1120,1130,0,0,11,1111,110011,13,0,0,101,101,"石板之谜","少年来到遗迹东部，偶然发现一块半截石碑，上面文字晦涩难懂，他准备带这块石碑去拜访蓬莱土著。这时，痴迷符咒的道陵仙人出现，他看见石碑，脸色似乎有些不好。",},  
    [12] = {12,"古城中心",13,11,84,0,1312,261012,1210,1220,1230,0,0,12,1112,110012,17,0,0,102,102,"古史正文","少年一路前行，前往古城中心。在古城中心少年找到一位没有敌意的蓬莱人。他告诉少年，这些散落的石碑据说是蓬莱历史的记载。",},  
    [13] = {13,"森林边缘",14,12,86,0,1313,261013,1310,1320,1330,0,0,13,1113,110013,16,0,0,103,103,"童谣秘闻","少年返回禁忌森林，在这里他碰到了一位长相奇特的道人，他自称野狗，是紫霄道人的徒弟。野狗道人和少年说，禁忌森林里流传了一个童谣，似乎与石碑的秘密有关。",},  
    [14] = {14,"石碑之林",15,13,88,0,1314,261014,1410,1420,1430,0,0,14,1114,110014,14,0,0,104,104,"上古记载","少年在野狗道人的指引下，找到了传说中的石碑之林，成功破解了童谣的秘密，原来蓬莱仙岛上这些城池的遗迹属于一个古代的王国。少年觉得这会是自己离开这里的出路。",},  
    [15] = {15,"乱战之港",16,14,90,1203,1315,261015,1510,1520,1530,0,0,15,1115,110015,11,0,3010,113,73,"折戟沉沙","少年继续追寻古王国的踪迹，来到了一片乱战之港。这里俨然曾经发生过一场大战。少年找到失落在这里的兵器。他猛然想起，自己似乎在哪里见过这种兵器。",},  
    [16] = {16,"军营遗址",17,15,92,0,1316,261016,1610,1620,1630,0,0,16,1116,110016,17,0,0,101,101,"失落王国","少年记起，自己曾在一个军营遗迹的仙岛上与一个守将交锋，他使用的就是这种兵器。少年重返这座仙岛，想知道这位守将与古王国的关系。",},  
    [17] = {17,"失落高墙",18,16,94,0,1317,261017,1710,1720,1730,0,0,17,1117,110017,13,0,0,102,102,"护城铁卫","仙岛的守将只能保留远古时的记忆。这些记忆证明他们竟然是当年古王国的护城卫。可人类如何能存活这么久，他们又是怎么来到这一座一座仙岛上的，似乎疑云更重了。",},  
    [18] = {18,"境外野地",19,17,96,0,1318,261018,1810,1820,1830,0,0,18,1118,110018,14,0,0,103,103,"仙人考量","少年带着满腹的疑问，想找到自己遇到的第一个仙人长云，但只找到了紫霄仙人。紫霄笑着说道，仙岛守将与这仙岛土著一样有趣。少年追问，紫霄笑而不语。",},  
    [19] = {19,"傀儡之城",20,18,98,0,1319,261019,1910,1920,1930,0,0,19,1119,110019,12,0,0,104,104,"傀儡之城","少年一路追着紫霄仙人，来到了仙岛中繁华的城镇，这里依然是能人异士的居所。他们驱使傀儡来方便生活，只是这座傀儡之城，为何显得如此没有生机呢？",},  
    [20] = {20,"孤城楼宇",0,19,100,1204,1320,261020,2010,2020,2030,0,0,20,1120,110020,15,0,3020,-45,-10,"无心之人","在这孤宇楼阁之中，少年发现城主的身体竟然是木制的！不只城主，原来整座傀儡之城的人都是机关人！难道这蓬莱仙岛上的土著都是傀儡人吗？神兽尚未找到，谜云却越来越重。",},
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
    [20] = 20,
}

local __key_map = { 
    id = 1,
    name = 2,
    next_id = 3,
    last_id = 4,
    open_level = 5,
    boss = 6,
    elite_monster = 7,
    elite_reward = 8,
    monster1 = 9,
    monster2 = 10,
    monster3 = 11,
    monster4 = 12,
    monster5 = 13,
    order = 14,
    task_npc = 15,
    pic_id = 16,
    icon_id = 17,
    pet_pic = 18,
    boss_pic = 19,
    point_x = 20,
    point_y = 21,
    task_title = 22,
    task_desc = 23,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_mystery_chapter_info")

        return t._raw[__key_map[k]]
    end
}


function mystery_chapter_info.getLength()
    return #mystery_chapter_info._data
end



function mystery_chapter_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_mystery_chapter_info
function mystery_chapter_info.indexOf(index)
    if index == nil or not mystery_chapter_info._data[index] then
        return nil
    end
    return setmetatable({_raw = mystery_chapter_info._data[index]}, m)
end



---
--@return @class record_mystery_chapter_info
function mystery_chapter_info.get(id)
    
    return mystery_chapter_info.indexOf(__index_id[ id ])
     
end



function mystery_chapter_info.set(id, key, value)
    local record = mystery_chapter_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function mystery_chapter_info.get_index_data()
    return __index_id 
end

return  mystery_chapter_info 