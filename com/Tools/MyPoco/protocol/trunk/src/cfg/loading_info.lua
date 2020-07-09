---@classdef record_loading_info
local record_loading_info = {}


record_loading_info.id = 0--ID
record_loading_info.knight_id = 0--武将ID
record_loading_info.bg_id = 0--背景图id

local loading_info = {
   _data = {   
    [1] = {1,600010,1,},  
    [2] = {2,600040,2,},  
    [3] = {3,600060,3,},  
    [4] = {4,600070,4,},  
    [5] = {5,700010,1,},  
    [6] = {6,700020,2,},  
    [7] = {7,700030,3,},  
    [8] = {8,700040,4,},
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
}

local __key_map = { 
    id = 1,
    knight_id = 2,
    bg_id = 3,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_loading_info")

        return t._raw[__key_map[k]]
    end
}


function loading_info.getLength()
    return #loading_info._data
end



function loading_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_loading_info
function loading_info.indexOf(index)
    if index == nil or not loading_info._data[index] then
        return nil
    end
    return setmetatable({_raw = loading_info._data[index]}, m)
end



---
--@return @class record_loading_info
function loading_info.get(id)
    
    return loading_info.indexOf(__index_id[ id ])
     
end



function loading_info.set(id, key, value)
    local record = loading_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function loading_info.get_index_data()
    return __index_id 
end

return  loading_info 