---@classdef record_skill_summon_info
local record_skill_summon_info = {}


record_skill_summon_info.id = 0--ID
record_skill_summon_info.advance_id = 0--进阶码
record_skill_summon_info.battle_res =  ""--战斗资源ID
record_skill_summon_info.name =  ""--名称
record_skill_summon_info.display_type = 0--摆放类型
record_skill_summon_info.effect_high =  ""--上层特效
record_skill_summon_info.effect_low =  ""--下层特效
record_skill_summon_info.passive_skill_id = 0--关联技能
record_skill_summon_info.act_max_num = 0--攻击次数上限
record_skill_summon_info.summon_max_num = 0--单方召唤兽召唤上限

local skill_summon_info = {
   _data = {   
    [1] = {1,1,"300540","木鸢",1,"0","0",206,1,3,},  
    [2] = {2,1,"300540","木鸢",1,"0","0",207,1,3,},  
    [3] = {3,1,"300540","木鸢",1,"0","0",208,1,3,},  
    [4] = {4,1,"300540","木鸢",1,"0","0",209,1,3,},  
    [5] = {5,1,"300540","木鸢",1,"0","0",210,1,3,},  
    [6] = {6,1,"300540","木鸢",1,"0","0",211,1,3,},  
    [7] = {7,1,"300540","木鸢",1,"0","0",212,1,3,},  
    [8] = {8,1,"300540","木鸢",1,"0","0",213,1,3,},  
    [9] = {9,2,"300180","木牛",2,"effect_700020_niuma_e","effect_700020_niuma_f",214,2,1,},  
    [10] = {10,2,"300180","木牛",2,"effect_700020_niuma_e","effect_700020_niuma_f",215,2,1,},  
    [11] = {11,2,"300180","木牛",2,"effect_700020_niuma_e","effect_700020_niuma_f",216,2,1,},  
    [12] = {12,2,"300180","木牛",2,"effect_700020_niuma_e","effect_700020_niuma_f",217,2,1,},  
    [13] = {13,2,"300180","木牛",2,"effect_700020_niuma_e","effect_700020_niuma_f",218,2,1,},  
    [14] = {14,2,"300180","木牛",2,"effect_700020_niuma_e","effect_700020_niuma_f",219,2,1,},  
    [15] = {15,2,"300180","木牛",2,"effect_700020_niuma_e","effect_700020_niuma_f",220,2,1,},  
    [16] = {16,2,"300180","木牛",2,"effect_700020_niuma_e","effect_700020_niuma_f",221,2,1,},  
    [17] = {17,3,"300200","流马",2,"effect_700020_niuma_e","effect_700020_niuma_f",222,2,1,},  
    [18] = {18,3,"300200","流马",2,"effect_700020_niuma_e","effect_700020_niuma_f",223,2,1,},  
    [19] = {19,3,"300200","流马",2,"effect_700020_niuma_e","effect_700020_niuma_f",224,2,1,},  
    [20] = {20,3,"300200","流马",2,"effect_700020_niuma_e","effect_700020_niuma_f",225,2,1,},  
    [21] = {21,3,"300200","流马",2,"effect_700020_niuma_e","effect_700020_niuma_f",226,2,1,},  
    [22] = {22,3,"300200","流马",2,"effect_700020_niuma_e","effect_700020_niuma_f",227,2,1,},  
    [23] = {23,3,"300200","流马",2,"effect_700020_niuma_e","effect_700020_niuma_f",228,2,1,},  
    [24] = {24,3,"300200","流马",2,"effect_700020_niuma_e","effect_700020_niuma_f",229,2,1,},
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
    advance_id = 2,
    battle_res = 3,
    name = 4,
    display_type = 5,
    effect_high = 6,
    effect_low = 7,
    passive_skill_id = 8,
    act_max_num = 9,
    summon_max_num = 10,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_skill_summon_info")

        return t._raw[__key_map[k]]
    end
}


function skill_summon_info.getLength()
    return #skill_summon_info._data
end



function skill_summon_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_skill_summon_info
function skill_summon_info.indexOf(index)
    if index == nil or not skill_summon_info._data[index] then
        return nil
    end
    return setmetatable({_raw = skill_summon_info._data[index]}, m)
end



---
--@return @class record_skill_summon_info
function skill_summon_info.get(id)
    
    return skill_summon_info.indexOf(__index_id[ id ])
     
end



function skill_summon_info.set(id, key, value)
    local record = skill_summon_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function skill_summon_info.get_index_data()
    return __index_id 
end

return  skill_summon_info 