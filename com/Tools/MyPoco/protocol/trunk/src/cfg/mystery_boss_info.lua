---@classdef record_mystery_boss_info
local record_mystery_boss_info = {}


record_mystery_boss_info.id = 0--ID
record_mystery_boss_info.type = 0--类型
record_mystery_boss_info.name =  ""--名称
record_mystery_boss_info.pic = 0--图标
record_mystery_boss_info.map = 0--地图
record_mystery_boss_info.model = 0--boss模型
record_mystery_boss_info.quality = 0--品质
record_mystery_boss_info.time_type = 0--时间类型
record_mystery_boss_info.monster_id = 0--怪物
record_mystery_boss_info.unlock_id = 0--解锁条件
record_mystery_boss_info.recommend =  ""--推荐战力
record_mystery_boss_info.hp_num = 0--血条数量
record_mystery_boss_info.damage_limit = 0--伤害上限
record_mystery_boss_info.time_group = 0--复活时间
record_mystery_boss_info.special_award = 0--特殊奖励
record_mystery_boss_info.normal_award = 0--普通奖励

local mystery_boss_info = {
   _data = {   
    [1] = {101,1,"巨猿",1,1,101,4,1,150100,5,"104500000",10,100,1,310111,310120,},  
    [2] = {102,1,"猞猁",2,1,201,5,1,150110,10,"562000000",12,100,2,310211,310220,},  
    [3] = {103,1,"机关鸟",4,1,301,6,1,150120,15,"1702000000",15,100,3,310311,310320,},  
    [4] = {104,1,"机关牛",3,1,302,6,1,150130,20,"3629500000",18,100,4,310411,310420,},  
    [5] = {105,1,"神木青鸾",5,1,401,7,1,150140,25,"12016690000",20,100,4,310511,310520,},  
    [6] = {106,1,"撼地灵犀",6,1,402,7,1,150150,30,"33154420000",25,100,4,310611,310620,},  
    [7] = {201,2,"百战·猞猁",2,2,201,5,2,150200,5,"104500000",12,60,5,320113,320124,},  
    [8] = {202,2,"百战·机关鸟",4,2,301,6,2,150210,10,"562000000",15,60,6,320213,320224,},  
    [9] = {203,2,"百战·机关牛",3,2,302,6,2,150220,15,"1702000000",18,60,7,320313,320324,},  
    [10] = {204,2,"百战·神木青鸾",5,2,401,7,2,150230,20,"3629500000",20,60,8,320413,320424,},  
    [11] = {205,2,"百战·撼地灵犀",6,2,402,7,2,150240,25,"12016690000",25,60,8,320513,320524,},  
    [12] = {206,2,"百战·狱火穷奇",7,2,403,7,2,150250,30,"33154420000",30,60,8,320613,320624,},  
    [13] = {301,3,"至尊·机关鸟",4,3,301,6,2,150300,5,"104500000",15,40,6,330116,0,},  
    [14] = {302,3,"至尊·机关牛",3,3,302,6,2,150310,10,"562000000",18,40,7,330216,0,},  
    [15] = {303,3,"至尊·神木青鸾",5,3,401,7,2,150320,15,"1702000000",20,40,8,330316,0,},  
    [16] = {304,3,"至尊·撼地灵犀",6,3,402,7,2,150330,20,"3629500000",25,40,9,330416,0,},  
    [17] = {305,3,"至尊·九天应龙",8,3,404,7,2,150340,25,"12016690000",30,40,9,330516,0,},  
    [18] = {306,3,"至尊·碧水麒麟",9,3,406,8,2,150350,30,"33154420000",35,40,9,330616,0,},
    }
}

local __index_id = {   
    [101] = 1,  
    [102] = 2,  
    [103] = 3,  
    [104] = 4,  
    [105] = 5,  
    [106] = 6,  
    [201] = 7,  
    [202] = 8,  
    [203] = 9,  
    [204] = 10,  
    [205] = 11,  
    [206] = 12,  
    [301] = 13,  
    [302] = 14,  
    [303] = 15,  
    [304] = 16,  
    [305] = 17,  
    [306] = 18,
}

local __key_map = { 
    id = 1,
    type = 2,
    name = 3,
    pic = 4,
    map = 5,
    model = 6,
    quality = 7,
    time_type = 8,
    monster_id = 9,
    unlock_id = 10,
    recommend = 11,
    hp_num = 12,
    damage_limit = 13,
    time_group = 14,
    special_award = 15,
    normal_award = 16,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_mystery_boss_info")

        return t._raw[__key_map[k]]
    end
}


function mystery_boss_info.getLength()
    return #mystery_boss_info._data
end



function mystery_boss_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_mystery_boss_info
function mystery_boss_info.indexOf(index)
    if index == nil or not mystery_boss_info._data[index] then
        return nil
    end
    return setmetatable({_raw = mystery_boss_info._data[index]}, m)
end



---
--@return @class record_mystery_boss_info
function mystery_boss_info.get(id)
    
    return mystery_boss_info.indexOf(__index_id[ id ])
     
end



function mystery_boss_info.set(id, key, value)
    local record = mystery_boss_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function mystery_boss_info.get_index_data()
    return __index_id 
end

return  mystery_boss_info 