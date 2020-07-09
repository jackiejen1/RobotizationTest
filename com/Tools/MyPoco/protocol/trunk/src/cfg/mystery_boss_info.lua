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
    [5] = {201,2,"百战·猞猁",2,2,201,5,2,150200,5,"104500000",12,60,5,320113,320124,},  
    [6] = {202,2,"百战·机关鸟",4,2,301,6,2,150210,10,"562000000",15,60,6,320213,320224,},  
    [7] = {203,2,"百战·机关牛",3,2,302,6,2,150220,15,"1702000000",18,60,7,320313,320324,},  
    [8] = {204,2,"百战·神木青鸾",5,2,401,7,2,150230,20,"3629500000",20,60,8,320413,320424,},  
    [9] = {301,3,"至尊·机关鸟",4,3,301,6,2,150300,5,"104500000",15,40,6,330116,0,},  
    [10] = {302,3,"至尊·机关牛",3,3,302,6,2,150310,10,"562000000",18,40,7,330216,0,},  
    [11] = {303,3,"至尊·神木青鸾",5,3,401,7,2,150320,15,"1702000000",20,40,8,330316,0,},  
    [12] = {304,3,"至尊·撼地灵犀",6,3,402,7,2,150330,20,"3629500000",25,40,9,330416,0,},
    }
}

local __index_id = {   
    [101] = 1,  
    [102] = 2,  
    [103] = 3,  
    [104] = 4,  
    [201] = 5,  
    [202] = 6,  
    [203] = 7,  
    [204] = 8,  
    [301] = 9,  
    [302] = 10,  
    [303] = 11,  
    [304] = 12,
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