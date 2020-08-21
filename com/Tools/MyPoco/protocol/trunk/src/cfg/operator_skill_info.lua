---@classdef record_operator_skill_info
local record_operator_skill_info = {}


record_operator_skill_info.id = 0--id
record_operator_skill_info.affect_type = 0--技能效果类
record_operator_skill_info.CD = 0--技能cd
record_operator_skill_info.cost_time = 0--施法时间
record_operator_skill_info.last_time = 0--持续时间
record_operator_skill_info.range_type = 0--技能范围类型
record_operator_skill_info.range_value1 = 0--技能范围值1
record_operator_skill_info.range_value2 = 0--技能范围值2
record_operator_skill_info.range_value3 = 0--技能范围值3
record_operator_skill_info.range_value4 = 0--技能范围值4
record_operator_skill_info.damage_high_limit = 0--伤害上限
record_operator_skill_info.damage_low_limit = 0--伤害下限
record_operator_skill_info.attack_action =  ""--技能动作
record_operator_skill_info.attack_hit =  ""--技能受击

local operator_skill_info = {
   _data = {   
    [1] = {10001,1,1000,0,0,0,0,0,0,0,150,25,"attack","attack_hit_1",},  
    [2] = {10002,2,30000,0,12000,0,0,0,0,0,0,0,"skill","attack_hit_1",},  
    [3] = {10003,1,1000,0,0,0,0,0,0,0,75,25,"attack","attack_hit_1",},  
    [4] = {10004,1,1000,0,0,0,0,0,0,0,75,25,"attack","attack_hit_1",},
    }
}

local __index_id = {   
    [10001] = 1,  
    [10002] = 2,  
    [10003] = 3,  
    [10004] = 4,
}

local __key_map = { 
    id = 1,
    affect_type = 2,
    CD = 3,
    cost_time = 4,
    last_time = 5,
    range_type = 6,
    range_value1 = 7,
    range_value2 = 8,
    range_value3 = 9,
    range_value4 = 10,
    damage_high_limit = 11,
    damage_low_limit = 12,
    attack_action = 13,
    attack_hit = 14,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_operator_skill_info")

        return t._raw[__key_map[k]]
    end
}


function operator_skill_info.getLength()
    return #operator_skill_info._data
end



function operator_skill_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_operator_skill_info
function operator_skill_info.indexOf(index)
    if index == nil or not operator_skill_info._data[index] then
        return nil
    end
    return setmetatable({_raw = operator_skill_info._data[index]}, m)
end



---
--@return @class record_operator_skill_info
function operator_skill_info.get(id)
    
    return operator_skill_info.indexOf(__index_id[ id ])
     
end



function operator_skill_info.set(id, key, value)
    local record = operator_skill_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function operator_skill_info.get_index_data()
    return __index_id 
end

return  operator_skill_info 