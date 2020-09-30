---@classdef record_artifact_purify_info
local record_artifact_purify_info = {}


record_artifact_purify_info.id = 0--id
record_artifact_purify_info.hole_num = 0--孔位数量
record_artifact_purify_info.type = 0--洗炼消耗
record_artifact_purify_info.value = 0--消耗类型值
record_artifact_purify_info.cost = 0--消耗数量
record_artifact_purify_info.lock_cost = 0--锁定消耗数量
record_artifact_purify_info.lock_cost_increase = 0--锁定消耗增长
record_artifact_purify_info.attribute_group = 0--属性组

local artifact_purify_info = {
   _data = {   
    [1] = {1,6,3,232,5,5,0,1,},
    }
}

local __index_id = {   
    [1] = 1,
}

local __key_map = { 
    id = 1,
    hole_num = 2,
    type = 3,
    value = 4,
    cost = 5,
    lock_cost = 6,
    lock_cost_increase = 7,
    attribute_group = 8,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_artifact_purify_info")

        return t._raw[__key_map[k]]
    end
}


function artifact_purify_info.getLength()
    return #artifact_purify_info._data
end



function artifact_purify_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_artifact_purify_info
function artifact_purify_info.indexOf(index)
    if index == nil or not artifact_purify_info._data[index] then
        return nil
    end
    return setmetatable({_raw = artifact_purify_info._data[index]}, m)
end



---
--@return @class record_artifact_purify_info
function artifact_purify_info.get(id)
    
    return artifact_purify_info.indexOf(__index_id[ id ])
     
end



function artifact_purify_info.set(id, key, value)
    local record = artifact_purify_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function artifact_purify_info.get_index_data()
    return __index_id 
end

return  artifact_purify_info 