---@classdef record_privilege_guide_info
local record_privilege_guide_info = {}


record_privilege_guide_info.id = 0--id
record_privilege_guide_info.type = 0--类型
record_privilege_guide_info.des =  ""--描述

local privilege_guide_info = {
   _data = {   
    [1] = {1,1,"订阅可享：武将经验产出增加100%",},  
    [2] = {2,1,"订阅可享：银币副本产出增加100%",},  
    [3] = {3,1,"订阅可享：合击精华产出增加100%",},  
    [4] = {4,1,"订阅可享：宝物经验产出增加100%",},  
    [5] = {5,1,"订阅可享：神兵锻造石产出增加100%",},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [3] = 3,  
    [4] = 4,  
    [5] = 5,
}

local __key_map = { 
    id = 1,
    type = 2,
    des = 3,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_privilege_guide_info")

        return t._raw[__key_map[k]]
    end
}


function privilege_guide_info.getLength()
    return #privilege_guide_info._data
end



function privilege_guide_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_privilege_guide_info
function privilege_guide_info.indexOf(index)
    if index == nil or not privilege_guide_info._data[index] then
        return nil
    end
    return setmetatable({_raw = privilege_guide_info._data[index]}, m)
end



---
--@return @class record_privilege_guide_info
function privilege_guide_info.get(id)
    
    return privilege_guide_info.indexOf(__index_id[ id ])
     
end



function privilege_guide_info.set(id, key, value)
    local record = privilege_guide_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function privilege_guide_info.get_index_data()
    return __index_id 
end

return  privilege_guide_info 