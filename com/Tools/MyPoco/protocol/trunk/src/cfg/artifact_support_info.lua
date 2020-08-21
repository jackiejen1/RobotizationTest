---@classdef record_artifact_support_info
local record_artifact_support_info = {}


record_artifact_support_info.id = 0--ID
record_artifact_support_info.quality = 0--品质
record_artifact_support_info.rare = 0--稀有
record_artifact_support_info.star = 0--星级
record_artifact_support_info.lv_limit = 0--协战神兵等级上限
record_artifact_support_info.affect_target_1 = 0--作用目标
record_artifact_support_info.basic_type_1 = 0--基础属性类型1
record_artifact_support_info.basic_value_1 = 0--基础属性类型值1
record_artifact_support_info.basic_growth_1 = 0--属性1成长值
record_artifact_support_info.affect_target_2 = 0--作用目标
record_artifact_support_info.basic_type_2 = 0--基础属性类型2
record_artifact_support_info.basic_value_2 = 0--基础属性类型值2
record_artifact_support_info.basic_growth_2 = 0--属性2成长值
record_artifact_support_info.affect_target_3 = 0--作用目标
record_artifact_support_info.basic_type_3 = 0--基础属性类型3
record_artifact_support_info.basic_value_3 = 0--基础属性类型值3
record_artifact_support_info.basic_growth_3 = 0--属性3成长值
record_artifact_support_info.affect_target_4 = 0--作用目标
record_artifact_support_info.basic_type_4 = 0--基础属性类型4
record_artifact_support_info.basic_value_4 = 0--基础属性类型值4
record_artifact_support_info.basic_growth_4 = 0--属性4成长值
record_artifact_support_info.affect_target_5 = 0--作用目标
record_artifact_support_info.basic_type_5 = 0--基础属性类型5
record_artifact_support_info.basic_value_5 = 0--基础属性类型值5
record_artifact_support_info.basic_growth_5 = 0--属性5成长值
record_artifact_support_info.affect_target_6 = 0--作用目标
record_artifact_support_info.basic_type_6 = 0--基础属性类型6
record_artifact_support_info.basic_value_6 = 0--基础属性类型值6
record_artifact_support_info.basic_growth_6 = 0--属性6成长值
record_artifact_support_info.affect_target_7 = 0--作用目标
record_artifact_support_info.basic_type_7 = 0--基础属性类型7
record_artifact_support_info.basic_value_7 = 0--基础属性类型值7
record_artifact_support_info.basic_growth_7 = 0--属性7成长值
record_artifact_support_info.affect_target_8 = 0--作用目标
record_artifact_support_info.basic_type_8 = 0--基础属性类型8
record_artifact_support_info.basic_value_8 = 0--基础属性类型值8
record_artifact_support_info.basic_growth_8 = 0--属性8成长值

local artifact_support_info = {
   _data = { 
    }
}

local __index_id = { 
}

local __key_map = { 
    id = 1,
    quality = 2,
    rare = 3,
    star = 4,
    lv_limit = 5,
    affect_target_1 = 6,
    basic_type_1 = 7,
    basic_value_1 = 8,
    basic_growth_1 = 9,
    affect_target_2 = 10,
    basic_type_2 = 11,
    basic_value_2 = 12,
    basic_growth_2 = 13,
    affect_target_3 = 14,
    basic_type_3 = 15,
    basic_value_3 = 16,
    basic_growth_3 = 17,
    affect_target_4 = 18,
    basic_type_4 = 19,
    basic_value_4 = 20,
    basic_growth_4 = 21,
    affect_target_5 = 22,
    basic_type_5 = 23,
    basic_value_5 = 24,
    basic_growth_5 = 25,
    affect_target_6 = 26,
    basic_type_6 = 27,
    basic_value_6 = 28,
    basic_growth_6 = 29,
    affect_target_7 = 30,
    basic_type_7 = 31,
    basic_value_7 = 32,
    basic_growth_7 = 33,
    affect_target_8 = 34,
    basic_type_8 = 35,
    basic_value_8 = 36,
    basic_growth_8 = 37,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_artifact_support_info")

        return t._raw[__key_map[k]]
    end
}


function artifact_support_info.getLength()
    return #artifact_support_info._data
end



function artifact_support_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_artifact_support_info
function artifact_support_info.indexOf(index)
    if index == nil or not artifact_support_info._data[index] then
        return nil
    end
    return setmetatable({_raw = artifact_support_info._data[index]}, m)
end



---
--@return @class record_artifact_support_info
function artifact_support_info.get(id)
    
    return artifact_support_info.indexOf(__index_id[ id ])
     
end



function artifact_support_info.set(id, key, value)
    local record = artifact_support_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function artifact_support_info.get_index_data()
    return __index_id 
end

return  artifact_support_info 