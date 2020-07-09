---@classdef record_storm_info
local record_storm_info = {}


record_storm_info.id = 0--ID
record_storm_info.name =  ""--关隘名称
record_storm_info.icon = 0--关隘图标
record_storm_info.city_type = 0--类型
record_storm_info.order = 0--顺序
record_storm_info.preset_id = 0--前置关隘
record_storm_info.map_id = 0--探索地图ID
record_storm_info.reward = 0--进度奖励
record_storm_info.sweep_level = 0--扫荡开启等级（关城专用）
record_storm_info.sweep = 0--扫荡开启（关城专用）
record_storm_info.monster_res =  ""--怪物方格障碍资源
record_storm_info.king_desc =  ""--霸主占城描述

local storm_info = {
   _data = {   
    [1] = {1,"巴郡关隘",1,1,1,0,1001,229001,0,0,"barrier_2","0",},  
    [2] = {2,"蜀郡关隘",2,1,2,1,1002,229002,0,0,"barrier_1","0",},  
    [3] = {3,"南中关隘",1,1,3,2,1003,229003,0,0,"barrier_4","0",},  
    [4] = {4,"弘农关隘",2,1,4,3,1004,229004,0,0,"barrier_5","0",},  
    [5] = {5,"扶风关隘",2,1,5,4,1005,229005,0,0,"barrier_2","0",},  
    [6] = {6,"京兆关隘",1,1,6,5,1006,229006,0,0,"barrier_4","0",},  
    [7] = {7,"天水关隘",2,1,7,6,1007,229007,0,0,"barrier_3","0",},  
    [8] = {8,"陇西关隘",1,1,8,7,1008,229008,0,0,"barrier_1","0",},  
    [9] = {9,"安定关隘",2,1,9,8,1009,229009,0,0,"barrier_5","0",},  
    [10] = {10,"河内关隘",1,1,10,9,1010,229010,0,0,"barrier_2","0",},  
    [11] = {11,"陈留关隘",2,1,11,10,1011,229011,0,0,"barrier_3","0",},  
    [12] = {12,"南阳关隘",1,1,12,11,1012,229012,0,0,"barrier_4","0",},  
    [13] = {13,"渔阳关隘",2,1,13,12,1013,229013,0,0,"barrier_1","0",},  
    [14] = {14,"上谷关隘",1,1,14,13,1014,229014,0,0,"barrier_2","0",},  
    [15] = {15,"范阳关隘",2,1,15,14,1015,229015,0,0,"barrier_3","0",},  
    [16] = {1001,"成都",101,3,1,3,0,0,0,0,"0","会战成都，此役破敌无数",},  
    [17] = {1002,"长安",102,3,2,7,0,0,0,0,"0","兵发长安，挟天子，令诸侯",},  
    [18] = {1003,"洛阳",103,3,3,12,0,0,0,0,"0","洛阳城大战，问鼎中原",},  
    [19] = {2001,"剑阁",11,2,1,3,2001,0,1,2002,"0","0",},  
    [20] = {2002,"潼关",12,2,2,7,2002,0,1,2003,"0","0",},  
    [21] = {2003,"虎牢关",11,2,3,12,2003,0,90,15,"0","0",},
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
    [1001] = 16,  
    [1002] = 17,  
    [1003] = 18,  
    [2001] = 19,  
    [2002] = 20,  
    [2003] = 21,
}

local __key_map = { 
    id = 1,
    name = 2,
    icon = 3,
    city_type = 4,
    order = 5,
    preset_id = 6,
    map_id = 7,
    reward = 8,
    sweep_level = 9,
    sweep = 10,
    monster_res = 11,
    king_desc = 12,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_storm_info")

        return t._raw[__key_map[k]]
    end
}


function storm_info.getLength()
    return #storm_info._data
end



function storm_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_storm_info
function storm_info.indexOf(index)
    if index == nil or not storm_info._data[index] then
        return nil
    end
    return setmetatable({_raw = storm_info._data[index]}, m)
end



---
--@return @class record_storm_info
function storm_info.get(id)
    
    return storm_info.indexOf(__index_id[ id ])
     
end



function storm_info.set(id, key, value)
    local record = storm_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function storm_info.get_index_data()
    return __index_id 
end

return  storm_info 