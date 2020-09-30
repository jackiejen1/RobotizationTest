---@classdef record_loading_info
local record_loading_info = {}


record_loading_info.id = 0--ID
record_loading_info.type = 0--类型
record_loading_info.knight_id = 0--武将ID
record_loading_info.bg_id = 0--背景图id
record_loading_info.game_type = 0--显示包体

local loading_info = {
   _data = {   
    [1] = {1,1,700050,1,2,},  
    [2] = {2,1,700060,2,2,},  
    [3] = {3,1,700070,3,2,},  
    [4] = {4,1,700080,4,2,},  
    [5] = {5,1,700010,1,2,},  
    [6] = {6,1,700020,2,2,},  
    [7] = {7,1,700030,3,2,},  
    [8] = {8,1,700040,4,2,},  
    [9] = {9,2,0,5,1,},  
    [10] = {10,2,0,6,1,},
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
}

local __key_map = { 
    id = 1,
    type = 2,
    knight_id = 3,
    bg_id = 4,
    game_type = 5,
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