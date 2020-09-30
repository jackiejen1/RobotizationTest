---@classdef record_flamecity_buff_info
local record_flamecity_buff_info = {}


record_flamecity_buff_info.id = 0--id
record_flamecity_buff_info.map_id = 0--地图id
record_flamecity_buff_info.type = 0--buff类型
record_flamecity_buff_info.value = 0--buff类型值
record_flamecity_buff_info.size = 0--buff效果

local flamecity_buff_info = {
   _data = {   
    [1] = {1001,103,2,0,500001,},  
    [2] = {1002,103,1,105,100,},  
    [3] = {1003,105,1,32,150,},  
    [4] = {1004,106,1,31,200,},  
    [5] = {1005,107,2,0,500002,},  
    [6] = {1006,108,1,3,200,},
    }
}

local __index_id = {   
    [1001] = 1,  
    [1002] = 2,  
    [1003] = 3,  
    [1004] = 4,  
    [1005] = 5,  
    [1006] = 6,
}

local __key_map = { 
    id = 1,
    map_id = 2,
    type = 3,
    value = 4,
    size = 5,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_flamecity_buff_info")

        return t._raw[__key_map[k]]
    end
}


function flamecity_buff_info.getLength()
    return #flamecity_buff_info._data
end



function flamecity_buff_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_flamecity_buff_info
function flamecity_buff_info.indexOf(index)
    if index == nil or not flamecity_buff_info._data[index] then
        return nil
    end
    return setmetatable({_raw = flamecity_buff_info._data[index]}, m)
end



---
--@return @class record_flamecity_buff_info
function flamecity_buff_info.get(id)
    
    return flamecity_buff_info.indexOf(__index_id[ id ])
     
end



function flamecity_buff_info.set(id, key, value)
    local record = flamecity_buff_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function flamecity_buff_info.get_index_data()
    return __index_id 
end

return  flamecity_buff_info 