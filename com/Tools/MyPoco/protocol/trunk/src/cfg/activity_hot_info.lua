---@classdef record_activity_hot_info
local record_activity_hot_info = {}


record_activity_hot_info.id = 0--编号
record_activity_hot_info.hot_id = 0--热点id
record_activity_hot_info.type = 0--道具类型
record_activity_hot_info.value = 0--道具值

local activity_hot_info = {
   _data = {   
    [1] = {1,1001,3,2330,},
    }
}

local __index_id = {   
    [1] = 1,
}

local __key_map = { 
    id = 1,
    hot_id = 2,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_activity_hot_info")

        return t._raw[__key_map[k]]
    end
}


function activity_hot_info.getLength()
    return #activity_hot_info._data
end



function activity_hot_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_activity_hot_info
function activity_hot_info.indexOf(index)
    if index == nil or not activity_hot_info._data[index] then
        return nil
    end
    return setmetatable({_raw = activity_hot_info._data[index]}, m)
end



---
--@return @class record_activity_hot_info
function activity_hot_info.get(id)
    
    return activity_hot_info.indexOf(__index_id[ id ])
     
end



function activity_hot_info.set(id, key, value)
    local record = activity_hot_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function activity_hot_info.get_index_data()
    return __index_id 
end

return  activity_hot_info 