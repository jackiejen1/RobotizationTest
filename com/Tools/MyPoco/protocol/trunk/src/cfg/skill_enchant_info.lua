---@classdef record_skill_enchant_info
local record_skill_enchant_info = {}


record_skill_enchant_info.id = 0--id
record_skill_enchant_info.description =  ""--技能描述
record_skill_enchant_info.brief_description =  ""--技能简述
record_skill_enchant_info.skill_quality = 0--技能品质
record_skill_enchant_info.skill_range_1 = 0--技能作用1范围
record_skill_enchant_info.skill_affect_type_1 = 0--技能作用1类型
record_skill_enchant_info.skill_affect_prob_1 = 0--技能作用1概率
record_skill_enchant_info.formula_1 = 0--技能作用1引用公式
record_skill_enchant_info.formula_1_value_1 = 0--公式1代入值1
record_skill_enchant_info.formula_1_value_1_step = 0--公式1代入值1升级步长
record_skill_enchant_info.formula_1_value_2 = 0--公式1代入值2
record_skill_enchant_info.formula_1_value_2_step = 0--公式1代入值2升级步长
record_skill_enchant_info.skill_range_2 = 0--技能作用2范围
record_skill_enchant_info.skill_affect_type_2 = 0--技能作用2类型
record_skill_enchant_info.skill_affect_prob_2 = 0--技能作用2概率
record_skill_enchant_info.formula_2 = 0--技能作用2引用公式
record_skill_enchant_info.formula_2_value_1 = 0--公式2代入值1
record_skill_enchant_info.formula_2_value_1_step = 0--公式2代入值1升级步长
record_skill_enchant_info.formula_2_value_2 = 0--公式2代入值2
record_skill_enchant_info.formula_2_value_2_step = 0--公式2代入值2升级步长

local skill_enchant_info = {
   _data = {   
    [1] = {2001,"攻击时，自身生命百分比低于目标时，造成1.1倍伤害。","额外伤害",8,226,1,1000,15,100,0,0,0,228,2,1000,15,100,0,0,0,},  
    [2] = {2002,"攻击时，自身生命百分比低于目标时，造成1.25倍伤害。","额外伤害",8,226,1,1000,15,250,0,0,0,228,2,1000,15,250,0,0,0,},  
    [3] = {2003,"攻击时，自身生命百分比低于目标时，造成1.4倍伤害。","额外伤害",8,226,1,1000,15,400,0,0,0,228,2,1000,15,400,0,0,0,},  
    [4] = {3001,"攻击时，自身生命百分比高于目标时，造成1.1倍伤害。","额外伤害",8,227,1,1000,15,100,0,0,0,229,2,1000,15,100,0,0,0,},  
    [5] = {3002,"攻击时，自身生命百分比高于目标时，造成1.25倍伤害。","额外伤害",8,227,1,1000,15,250,0,0,0,229,2,1000,15,250,0,0,0,},  
    [6] = {3003,"攻击时，自身生命百分比高于目标时，造成1.4倍伤害。","额外伤害",8,227,1,1000,15,400,0,0,0,229,2,1000,15,400,0,0,0,},  
    [7] = {4001,"怒攻伤害提高50%（暂未使用）","额外伤害",8,201,1,1000,15,500,0,0,0,0,0,0,0,0,0,0,0,},  
    [8] = {4002,"怒攻伤害提高25%","额外伤害",8,201,1,1000,15,250,0,0,0,0,0,0,0,0,0,0,0,},  
    [9] = {4003,"怒攻伤害提高50%","额外伤害",8,201,1,1000,15,500,0,0,0,0,0,0,0,0,0,0,0,},
    }
}

local __index_id = {   
    [2001] = 1,  
    [2002] = 2,  
    [2003] = 3,  
    [3001] = 4,  
    [3002] = 5,  
    [3003] = 6,  
    [4001] = 7,  
    [4002] = 8,  
    [4003] = 9,
}

local __key_map = { 
    id = 1,
    description = 2,
    brief_description = 3,
    skill_quality = 4,
    skill_range_1 = 5,
    skill_affect_type_1 = 6,
    skill_affect_prob_1 = 7,
    formula_1 = 8,
    formula_1_value_1 = 9,
    formula_1_value_1_step = 10,
    formula_1_value_2 = 11,
    formula_1_value_2_step = 12,
    skill_range_2 = 13,
    skill_affect_type_2 = 14,
    skill_affect_prob_2 = 15,
    formula_2 = 16,
    formula_2_value_1 = 17,
    formula_2_value_1_step = 18,
    formula_2_value_2 = 19,
    formula_2_value_2_step = 20,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_skill_enchant_info")

        return t._raw[__key_map[k]]
    end
}


function skill_enchant_info.getLength()
    return #skill_enchant_info._data
end



function skill_enchant_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_skill_enchant_info
function skill_enchant_info.indexOf(index)
    if index == nil or not skill_enchant_info._data[index] then
        return nil
    end
    return setmetatable({_raw = skill_enchant_info._data[index]}, m)
end



---
--@return @class record_skill_enchant_info
function skill_enchant_info.get(id)
    
    return skill_enchant_info.indexOf(__index_id[ id ])
     
end



function skill_enchant_info.set(id, key, value)
    local record = skill_enchant_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function skill_enchant_info.get_index_data()
    return __index_id 
end

return  skill_enchant_info 