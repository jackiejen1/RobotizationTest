---@classdef record_dead_tower_card_info
local record_dead_tower_card_info = {}


record_dead_tower_card_info.id = 0--id
record_dead_tower_card_info.name =  ""--名称
record_dead_tower_card_info.icon = 0--图标
record_dead_tower_card_info.pic = 0--资源
record_dead_tower_card_info.description =  ""--描述
record_dead_tower_card_info.passive_skill = 0--技能

local dead_tower_card_info = {
   _data = {   
    [1] = {1,"刀枪不入",300008,1,"降低100%来自神兵的伤害",410001,},  
    [2] = {2,"开局无敌",300011,2,"开局第一回合全体武将无敌",410002,},  
    [3] = {3,"悍勇无双",300008,3,"全体武将免疫眩晕和沉默",410003,},  
    [4] = {4,"鹰隼锐目",300003,4,"命中率增强50%",410004,},  
    [5] = {5,"无尽狂攻·一",300005,5,"最终伤害增加30%",410005,},  
    [6] = {6,"枯木回春",300006,6,"首回合结束时所有武将恢复50%生命值",410006,},  
    [7] = {7,"神兽免疫",300008,7,"降低100%来自神兽的伤害",410007,},  
    [8] = {8,"开局破盾",300010,1,"首个武将行动后清除敌方护盾",410008,},  
    [9] = {9,"无尽狂攻·五",300005,2,"最终伤害增加200%",410009,},  
    [10] = {10,"铜墙铁壁",300004,3,"最终减伤增加30%",410010,},  
    [11] = {11,"无尽狂攻·二",300007,4,"最终伤害增加30%",410011,},  
    [12] = {12,"无尽狂攻·三",300007,5,"最终伤害增加50%",410012,},  
    [13] = {13,"无尽狂攻·四",300007,6,"最终伤害增加70%",410013,},  
    [14] = {14,"守护遗言",300011,7,"第一个怪物死亡时全体武将进入无敌状态2回合",410014,},  
    [15] = {15,"万符封禁",300008,1,"降低100%来自兵符的伤害",410015,},  
    [16] = {16,"驱散遗言",300001,2,"每回合后清除所有怪物的增益状态",410016,},  
    [17] = {17,"耗怒翻倍·一",300001,3,"怪物技能消耗怒气增加2",410017,},  
    [18] = {18,"耗怒翻倍·二",300001,4,"怪物技能消耗怒气增加4",410018,},  
    [19] = {19,"最终驱散",300001,5,"玩家武将死亡时，清除怪物所有增益效果",410019,},  
    [20] = {20,"延迟驱散",300001,1,"第二回合开始时清除怪物所有增益效果",410020,},  
    [21] = {21,"狂暴之怒·一",300005,2,"怪物血量首次低于50%时增加100%的最终增伤",410021,},  
    [22] = {22,"狂暴之怒·二",300005,4,"怪物血量首次低于60%时增加100%的最终增伤",410022,},  
    [23] = {23,"灼烧免疫",300008,7,"免疫灼烧伤害",410023,},  
    [24] = {24,"万毒不侵",300008,1,"免疫中毒伤害",410024,},
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
    [21] = 21,  
    [22] = 22,  
    [23] = 23,  
    [24] = 24,
}

local __key_map = { 
    id = 1,
    name = 2,
    icon = 3,
    pic = 4,
    description = 5,
    passive_skill = 6,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_dead_tower_card_info")

        return t._raw[__key_map[k]]
    end
}


function dead_tower_card_info.getLength()
    return #dead_tower_card_info._data
end



function dead_tower_card_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_dead_tower_card_info
function dead_tower_card_info.indexOf(index)
    if index == nil or not dead_tower_card_info._data[index] then
        return nil
    end
    return setmetatable({_raw = dead_tower_card_info._data[index]}, m)
end



---
--@return @class record_dead_tower_card_info
function dead_tower_card_info.get(id)
    
    return dead_tower_card_info.indexOf(__index_id[ id ])
     
end



function dead_tower_card_info.set(id, key, value)
    local record = dead_tower_card_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function dead_tower_card_info.get_index_data()
    return __index_id 
end

return  dead_tower_card_info 