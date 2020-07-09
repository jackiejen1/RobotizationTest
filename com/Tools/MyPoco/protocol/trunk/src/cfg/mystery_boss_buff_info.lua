---@classdef record_mystery_boss_buff_info
local record_mystery_boss_buff_info = {}


record_mystery_boss_buff_info.id = 0--ID
record_mystery_boss_buff_info.proportion = 0--减伤比例
record_mystery_boss_buff_info.description =  ""--描述

local mystery_boss_buff_info = {
   _data = {   
    [1] = {1,0,"0%减伤",},  
    [2] = {2,300,"30%减伤",},  
    [3] = {3,500,"50%减伤",},  
    [4] = {4,600,"60%减伤",},  
    [5] = {5,650,"65%减伤",},  
    [6] = {6,700,"70%减伤",},
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
    proportion = 2,
    description = 3,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_mystery_boss_buff_info")

        return t._raw[__key_map[k]]
    end
}


function mystery_boss_buff_info.getLength()
    return #mystery_boss_buff_info._data
end



function mystery_boss_buff_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_mystery_boss_buff_info
function mystery_boss_buff_info.indexOf(index)
    if index == nil or not mystery_boss_buff_info._data[index] then
        return nil
    end
    return setmetatable({_raw = mystery_boss_buff_info._data[index]}, m)
end



---
--@return @class record_mystery_boss_buff_info
function mystery_boss_buff_info.get(id)
    
    return mystery_boss_buff_info.indexOf(__index_id[ id ])
     
end



function mystery_boss_buff_info.set(id, key, value)
    local record = mystery_boss_buff_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function mystery_boss_buff_info.get_index_data()
    return __index_id 
end

return  mystery_boss_buff_info 