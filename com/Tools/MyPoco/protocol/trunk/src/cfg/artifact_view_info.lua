---@classdef record_artifact_view_info
local record_artifact_view_info = {}


record_artifact_view_info.id = 0--编号
record_artifact_view_info.bookmark = 0--所属页签
record_artifact_view_info.type = 0--道具类型
record_artifact_view_info.value = 0--道具值

local artifact_view_info = {
   _data = {   
    [1] = {1,1,14,1010,},  
    [2] = {2,1,14,1020,},  
    [3] = {3,2,14,2010,},  
    [4] = {4,2,14,2020,},  
    [5] = {5,2,14,2030,},  
    [6] = {6,2,14,2040,},  
    [7] = {7,2,14,2050,},  
    [8] = {8,2,14,2060,},  
    [9] = {9,1,3,56,},
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
}

local __key_map = { 
    id = 1,
    bookmark = 2,
    type = 3,
    value = 4,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_artifact_view_info")

        return t._raw[__key_map[k]]
    end
}


function artifact_view_info.getLength()
    return #artifact_view_info._data
end



function artifact_view_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_artifact_view_info
function artifact_view_info.indexOf(index)
    if index == nil or not artifact_view_info._data[index] then
        return nil
    end
    return setmetatable({_raw = artifact_view_info._data[index]}, m)
end



---
--@return @class record_artifact_view_info
function artifact_view_info.get(id)
    
    return artifact_view_info.indexOf(__index_id[ id ])
     
end



function artifact_view_info.set(id, key, value)
    local record = artifact_view_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function artifact_view_info.get_index_data()
    return __index_id 
end

return  artifact_view_info 