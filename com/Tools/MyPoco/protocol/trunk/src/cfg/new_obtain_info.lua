---@classdef record_new_obtain_info
local record_new_obtain_info = {}


record_new_obtain_info.id = 0--ID
record_new_obtain_info.type = 0--类型
record_new_obtain_info.subtype = 0--子类型
record_new_obtain_info.open_level = 0--新获得机制开启等级
record_new_obtain_info.close_level = 0--新获得机制关闭等级

local new_obtain_info = {
   _data = {   
    [1] = {1,4,0,1,20,},  
    [2] = {2,5,0,1,30,},  
    [3] = {3,7,0,1,40,},  
    [4] = {4,8,0,1,50,},  
    [5] = {5,11,0,1,60,},  
    [6] = {6,14,0,1,70,},  
    [7] = {7,13,0,1,100,},  
    [8] = {8,2,20,1,200,},
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
    type = 2,
    subtype = 3,
    open_level = 4,
    close_level = 5,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_new_obtain_info")

        return t._raw[__key_map[k]]
    end
}


function new_obtain_info.getLength()
    return #new_obtain_info._data
end



function new_obtain_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_new_obtain_info
function new_obtain_info.indexOf(index)
    if index == nil or not new_obtain_info._data[index] then
        return nil
    end
    return setmetatable({_raw = new_obtain_info._data[index]}, m)
end



---
--@return @class record_new_obtain_info
function new_obtain_info.get(id)
    
    return new_obtain_info.indexOf(__index_id[ id ])
     
end



function new_obtain_info.set(id, key, value)
    local record = new_obtain_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function new_obtain_info.get_index_data()
    return __index_id 
end

return  new_obtain_info 