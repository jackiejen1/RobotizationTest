---@classdef record_artifact_purify_special_info
local record_artifact_purify_special_info = {}


record_artifact_purify_special_info.id = 0--id
record_artifact_purify_special_info.type = 0--消耗类型
record_artifact_purify_special_info.value = 0--道具id
record_artifact_purify_special_info.size = 0--消耗
record_artifact_purify_special_info.des =  ""--描述
record_artifact_purify_special_info.quality_1 = 0--品质1
record_artifact_purify_special_info.quality_2 = 0--品质2
record_artifact_purify_special_info.quality_3 = 0--品质3
record_artifact_purify_special_info.quality_4 = 0--品质4
record_artifact_purify_special_info.quality_5 = 0--品质5
record_artifact_purify_special_info.quality_6 = 0--品质6
record_artifact_purify_special_info.quality_7 = 0--品质7
record_artifact_purify_special_info.quality_8 = 0--品质8

local artifact_purify_special_info = {
   _data = {   
    [1] = {1,3,233,3,"红色",1,2,3,4,5,6,7,8,},  
    [2] = {2,3,234,4,"金色",1,2,3,4,5,6,7,8,},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,
}

local __key_map = { 
    id = 1,
    type = 2,
    value = 3,
    size = 4,
    des = 5,
    quality_1 = 6,
    quality_2 = 7,
    quality_3 = 8,
    quality_4 = 9,
    quality_5 = 10,
    quality_6 = 11,
    quality_7 = 12,
    quality_8 = 13,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_artifact_purify_special_info")

        return t._raw[__key_map[k]]
    end
}


function artifact_purify_special_info.getLength()
    return #artifact_purify_special_info._data
end



function artifact_purify_special_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_artifact_purify_special_info
function artifact_purify_special_info.indexOf(index)
    if index == nil or not artifact_purify_special_info._data[index] then
        return nil
    end
    return setmetatable({_raw = artifact_purify_special_info._data[index]}, m)
end



---
--@return @class record_artifact_purify_special_info
function artifact_purify_special_info.get(id)
    
    return artifact_purify_special_info.indexOf(__index_id[ id ])
     
end



function artifact_purify_special_info.set(id, key, value)
    local record = artifact_purify_special_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function artifact_purify_special_info.get_index_data()
    return __index_id 
end

return  artifact_purify_special_info 