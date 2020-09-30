---@classdef record_operator_info
local record_operator_info = {}


record_operator_info.id = 0--id
record_operator_info.type = 0--类型
record_operator_info.knight = 0--形象
record_operator_info.common_skill_id = 0--普攻
record_operator_info.skill1_id = 0--技能1
record_operator_info.skill2_id = 0--技能2
record_operator_info.skill3_id = 0--技能3
record_operator_info.skill4_id = 0--技能4

local operator_info = {
   _data = {   
    [1] = {1,1,0,10001,10002,0,0,0,},  
    [2] = {2,1,0,10003,10002,0,0,0,},  
    [3] = {3,1,0,10004,10002,0,0,0,},  
    [4] = {4,2,700130,10003,10002,0,0,0,},  
    [5] = {5,2,700130,10003,10002,0,0,0,},  
    [6] = {6,2,700130,10003,10002,0,0,0,},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [3] = 3,  
    [4] = 4,  
    [5] = 5,  
    [6] = 6,
}

local __key_map = { 
    id = 1,
    type = 2,
    knight = 3,
    common_skill_id = 4,
    skill1_id = 5,
    skill2_id = 6,
    skill3_id = 7,
    skill4_id = 8,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_operator_info")

        return t._raw[__key_map[k]]
    end
}


function operator_info.getLength()
    return #operator_info._data
end



function operator_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_operator_info
function operator_info.indexOf(index)
    if index == nil or not operator_info._data[index] then
        return nil
    end
    return setmetatable({_raw = operator_info._data[index]}, m)
end



---
--@return @class record_operator_info
function operator_info.get(id)
    
    return operator_info.indexOf(__index_id[ id ])
     
end



function operator_info.set(id, key, value)
    local record = operator_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function operator_info.get_index_data()
    return __index_id 
end

return  operator_info 