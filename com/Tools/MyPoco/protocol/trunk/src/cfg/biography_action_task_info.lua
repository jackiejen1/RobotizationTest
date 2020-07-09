---@classdef record_biography_action_task_info
local record_biography_action_task_info = {}


record_biography_action_task_info.id = 0--id
record_biography_action_task_info.type = 0--玩法类型
record_biography_action_task_info.value_1 = 0--参数1
record_biography_action_task_info.value_2 = 0--参数2

local biography_action_task_info = {
   _data = {   
    [1] = {442,31,10840,0,},  
    [2] = {17301,33,9,0,},  
    [3] = {16301,1056,1,0,},  
    [4] = {12301,35,1002,0,},
    }
}

local __index_id = {   
    [442] = 1,  
    [12301] = 4,  
    [16301] = 3,  
    [17301] = 2,
}

local __key_map = { 
    id = 1,
    type = 2,
    value_1 = 3,
    value_2 = 4,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_biography_action_task_info")

        return t._raw[__key_map[k]]
    end
}


function biography_action_task_info.getLength()
    return #biography_action_task_info._data
end



function biography_action_task_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_biography_action_task_info
function biography_action_task_info.indexOf(index)
    if index == nil or not biography_action_task_info._data[index] then
        return nil
    end
    return setmetatable({_raw = biography_action_task_info._data[index]}, m)
end



---
--@return @class record_biography_action_task_info
function biography_action_task_info.get(id)
    
    return biography_action_task_info.indexOf(__index_id[ id ])
     
end



function biography_action_task_info.set(id, key, value)
    local record = biography_action_task_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function biography_action_task_info.get_index_data()
    return __index_id 
end

return  biography_action_task_info 