---@classdef record_story_scene_info
local record_story_scene_info = {}


record_story_scene_info.id = 0--ID
record_story_scene_info.name =  ""--场景名称
record_story_scene_info.scene_type = 0--场景类型
record_story_scene_info.scene_value =  ""--场景类型值
record_story_scene_info.scene_value_2 = 0--场景类型值2

local story_scene_info = {
   _data = {   
    [1] = {1001,"首页",1,"parallax_bg/home/1/home.pcfg",0,},  
    [2] = {1002,"副本地图-军营",1,"parallax_bg/dungeon_stage/1/dungeon_stage.pcfg",0,},  
    [3] = {1003,"战斗-军营",1,"parallax_bg/battle/1/battle.pcfg",0,},  
    [4] = {1004,"名将传-军营驻地",1,"biomap/201/config.bcfg",2,},  
    [5] = {1005,"名将传-城内集市",1,"biomap/102/config.bcfg",1,},  
    [6] = {1006,"副本地图-水岸",1,"parallax_bg/dungeon_stage/2/dungeon_stage.pcfg",0,},  
    [7] = {1007,"副本地图-城池",1,"parallax_bg/dungeon_stage/3/dungeon_stage.pcfg",0,},  
    [8] = {1008,"副本地图-宫殿",1,"parallax_bg/dungeon_stage/4/dungeon_stage.pcfg",0,},  
    [9] = {1009,"副本地图-铁锁船舶",1,"parallax_bg/dungeon_stage/5/dungeon_stage.pcfg",0,},  
    [10] = {1010,"副本地图-雪地",1,"parallax_bg/dungeon_stage/6/dungeon_stage.pcfg",0,},  
    [11] = {1011,"战斗-城池",1,"parallax_bg/battle/3/battle.pcfg",0,},  
    [12] = {1012,"战斗-水岸",1,"parallax_bg/battle/2/battle.pcfg",0,},  
    [13] = {1013,"战斗-戈壁",1,"parallax_bg/battle/4/battle.pcfg",0,},  
    [14] = {1014,"战斗-雪地",1,"parallax_bg/battle/11/battle.pcfg",0,},  
    [15] = {1015,"战斗-宫殿",1,"parallax_bg/battle/6/battle.pcfg",0,},  
    [16] = {1016,"战斗-关隘",1,"parallax_bg/battle/7/battle.pcfg",0,},  
    [17] = {1017,"战斗-平原",1,"parallax_bg/battle/8/battle.pcfg",0,},  
    [18] = {1018,"战斗-树林",1,"parallax_bg/battle/9/battle.pcfg",0,},  
    [19] = {1019,"战斗-铁索船舶",1,"parallax_bg/battle/10/battle.pcfg",0,},  
    [20] = {1020,"战斗-戈壁魔化",1,"parallax_bg/battle/5/battle.pcfg",0,},  
    [21] = {1021,"名将传-豪宅花园",1,"biomap/303/config.bcfg",3,},  
    [22] = {1022,"名将传-战场河流",1,"biomap/404/config.bcfg",4,},  
    [23] = {1023,"名将传-山林木寨",1,"biomap/605/config.bcfg",6,},  
    [24] = {1024,"名将传-初始剧情背景",1,"parallax_bg/biography/1/biography.pcfg",0,},  
    [25] = {1025,"副本地图-平原",1,"parallax_bg/dungeon_stage/7/dungeon_stage.pcfg",0,},  
    [26] = {1026,"副本地图-戈壁",1,"parallax_bg/dungeon_stage/8/dungeon_stage.pcfg",0,},  
    [27] = {1027,"副本地图-关隘",1,"parallax_bg/dungeon_stage/9/dungeon_stage.pcfg",0,},  
    [28] = {1028,"副本地图-树林",1,"parallax_bg/dungeon_stage/10/dungeon_stage.pcfg",0,},  
    [29] = {1029,"名将传-刘备传",1,"biomap/2102/config.bcfg",1,},  
    [30] = {1030,"封地-桃园场景",1,"parallax_bg/city/1/city.pcfg",1,},  
    [31] = {1031,"名将传-水晶居",1,"parallax_bg/biography/1/biography.pcfg",0,},  
    [32] = {1032,"封地-城市场景",1,"parallax_bg/city/2/city.pcfg",1,},  
    [33] = {1033,"首页黑夜",1,"parallax_bg/home/2/home.pcfg",0,},  
    [34] = {1034,"征战白天",1,"parallax_bg/campaign/1/campaign.pcfg",0,},  
    [35] = {1035,"征战黑夜",1,"parallax_bg/campaign/2/campaign.pcfg",0,},  
    [36] = {1036,"军团boss本服场景",1,"parallax_bg/juntuanBOSS/1/juntuanBOSS.pcfg",0,},
    }
}

local __index_id = {   
    [1001] = 1,  
    [1002] = 2,  
    [1003] = 3,  
    [1004] = 4,  
    [1005] = 5,  
    [1006] = 6,  
    [1007] = 7,  
    [1008] = 8,  
    [1009] = 9,  
    [1010] = 10,  
    [1011] = 11,  
    [1012] = 12,  
    [1013] = 13,  
    [1014] = 14,  
    [1015] = 15,  
    [1016] = 16,  
    [1017] = 17,  
    [1018] = 18,  
    [1019] = 19,  
    [1020] = 20,  
    [1021] = 21,  
    [1022] = 22,  
    [1023] = 23,  
    [1024] = 24,  
    [1025] = 25,  
    [1026] = 26,  
    [1027] = 27,  
    [1028] = 28,  
    [1029] = 29,  
    [1030] = 30,  
    [1031] = 31,  
    [1032] = 32,  
    [1033] = 33,  
    [1034] = 34,  
    [1035] = 35,  
    [1036] = 36,
}

local __key_map = { 
    id = 1,
    name = 2,
    scene_type = 3,
    scene_value = 4,
    scene_value_2 = 5,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_story_scene_info")

        return t._raw[__key_map[k]]
    end
}


function story_scene_info.getLength()
    return #story_scene_info._data
end



function story_scene_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_story_scene_info
function story_scene_info.indexOf(index)
    if index == nil or not story_scene_info._data[index] then
        return nil
    end
    return setmetatable({_raw = story_scene_info._data[index]}, m)
end



---
--@return @class record_story_scene_info
function story_scene_info.get(id)
    
    return story_scene_info.indexOf(__index_id[ id ])
     
end



function story_scene_info.set(id, key, value)
    local record = story_scene_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function story_scene_info.get_index_data()
    return __index_id 
end

return  story_scene_info 