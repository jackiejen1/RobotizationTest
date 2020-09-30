---@classdef record_skill_mark_info
local record_skill_mark_info = {}


record_skill_mark_info.id = 0--ID
record_skill_mark_info.type = 0--判断类型
record_skill_mark_info.mark_type = 0--标记增减益类型
record_skill_mark_info.effect_high =  ""--上层特效
record_skill_mark_info.effect_low =  ""--下层特效
record_skill_mark_info.name =  ""--标记名称
record_skill_mark_info.increase_type = 0--单个标记属性增减
record_skill_mark_info.type_1 = 0--属性1类型
record_skill_mark_info.value_1 = 0--属性1类型值
record_skill_mark_info.type_2 = 0--属性2类型
record_skill_mark_info.value_2 = 0--属性2类型值
record_skill_mark_info.type_3 = 0--属性3类型
record_skill_mark_info.value_3 = 0--属性3类型值
record_skill_mark_info.max_num = 0--标记上限
record_skill_mark_info.skill_info_id = 0--达到上限时触发额外技能
record_skill_mark_info.mark_purging_num = 0--触发技能时清除标记数量
record_skill_mark_info.skill_trigger_limit = 0--额外技能触发上限
record_skill_mark_info.skill_trigger_merges = 0--额外技能触发是否合并

local skill_mark_info = {
   _data = {   
    [1] = {1,1,2,"effect_700010_yinji","0","曹节",2,1,150,2,150,3,150,3,7000111,0,0,1,},  
    [2] = {2,2,1,"effect_700040_qiu_shang","effect_700040_qiu_xia","吕玲绮",1,1,30,2,30,3,30,5,0,0,0,1,},  
    [3] = {3,1,2,"effect_700010_yinji","0","曹节",2,1,150,2,150,3,150,3,7000122,0,0,1,},  
    [4] = {4,1,2,"effect_700010_yinji","0","曹节",2,1,150,2,150,3,150,3,7000123,0,0,1,},  
    [5] = {5,3,3,"0","effect_700080_buff","袁绍",1,18,80,0,0,0,0,5,7000831,0,1,1,},  
    [6] = {6,3,3,"0","effect_700080_buff","袁绍",1,18,80,0,0,0,0,5,7000832,0,1,1,},  
    [7] = {7,3,3,"0","effect_700080_buff","袁绍",1,18,80,0,0,0,0,5,7000833,0,1,1,},  
    [8] = {8,4,3,"0","effect_artifact_4020_yinji","太公护符",1,7,100,19,100,0,0,3,0,0,0,1,},  
    [9] = {9,4,3,"0","effect_artifact_4020_yinji","太公护符",1,7,150,19,150,0,0,3,0,0,0,1,},  
    [10] = {10,5,1,"effect_battle_canghaizhiling_up","effect_battle_canghaizhiling_dw","沧海之灵",1,19,30,0,0,0,0,3,7001321,3,0,0,},  
    [11] = {11,5,1,"effect_battle_canghaizhiling_up","effect_battle_canghaizhiling_dw","沧海之灵",1,19,40,0,0,0,0,3,7001322,3,0,0,},  
    [12] = {12,5,1,"effect_battle_canghaizhiling_up","effect_battle_canghaizhiling_dw","沧海之灵",1,19,50,0,0,0,0,3,7001323,3,0,0,},  
    [13] = {13,6,1,"effect_battle_jiutianzhiling_up","effect_battle_jiutianzhiling_dw","九天之灵",1,18,30,0,0,0,0,3,7001324,3,0,0,},  
    [14] = {14,6,1,"effect_battle_jiutianzhiling_up","effect_battle_jiutianzhiling_dw","九天之灵",1,18,40,0,0,0,0,3,7001325,3,0,0,},  
    [15] = {15,6,1,"effect_battle_jiutianzhiling_up","effect_battle_jiutianzhiling_dw","九天之灵",1,18,50,0,0,0,0,3,7001326,3,0,0,},
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
    type = 2,
    mark_type = 3,
    effect_high = 4,
    effect_low = 5,
    name = 6,
    increase_type = 7,
    type_1 = 8,
    value_1 = 9,
    type_2 = 10,
    value_2 = 11,
    type_3 = 12,
    value_3 = 13,
    max_num = 14,
    skill_info_id = 15,
    mark_purging_num = 16,
    skill_trigger_limit = 17,
    skill_trigger_merges = 18,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_skill_mark_info")

        return t._raw[__key_map[k]]
    end
}


function skill_mark_info.getLength()
    return #skill_mark_info._data
end



function skill_mark_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_skill_mark_info
function skill_mark_info.indexOf(index)
    if index == nil or not skill_mark_info._data[index] then
        return nil
    end
    return setmetatable({_raw = skill_mark_info._data[index]}, m)
end



---
--@return @class record_skill_mark_info
function skill_mark_info.get(id)
    
    return skill_mark_info.indexOf(__index_id[ id ])
     
end



function skill_mark_info.set(id, key, value)
    local record = skill_mark_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function skill_mark_info.get_index_data()
    return __index_id 
end

return  skill_mark_info 