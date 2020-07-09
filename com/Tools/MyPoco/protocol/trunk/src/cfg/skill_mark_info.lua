---@classdef record_skill_mark_info
local record_skill_mark_info = {}


record_skill_mark_info.id = 0--ID
record_skill_mark_info.mark_type = 0--标记类型
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

local skill_mark_info = {
   _data = {   
    [1] = {1,2,"effect_700010_yinji","0","曹节",2,1,150,2,150,3,150,3,7000111,},  
    [2] = {2,1,"effect_700040_qiu_shang","effect_700040_qiu_xia","吕玲绮",1,1,30,2,30,3,30,5,0,},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,
}

local __key_map = { 
    id = 1,
    mark_type = 2,
    effect_high = 3,
    effect_low = 4,
    name = 5,
    increase_type = 6,
    type_1 = 7,
    value_1 = 8,
    type_2 = 9,
    value_2 = 10,
    type_3 = 11,
    value_3 = 12,
    max_num = 13,
    skill_info_id = 14,
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