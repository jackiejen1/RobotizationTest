---@classdef record_cat_type_info
local record_cat_type_info = {}


record_cat_type_info.id = 0--ID
record_cat_type_info.weight = 0--权重
record_cat_type_info.time = 0--持续时间
record_cat_type_info.action_1 =  ""--动作1
record_cat_type_info.action_2 =  ""--动作2

local cat_type_info = {
   _data = {   
    [1] = {1,150,10,"ready","show",},  
    [2] = {2,150,10,"ready","show",},  
    [3] = {3,700,15,"ready1","run",},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [3] = 3,
}

local __key_map = { 
    id = 1,
    weight = 2,
    time = 3,
    action_1 = 4,
    action_2 = 5,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_cat_type_info")

        return t._raw[__key_map[k]]
    end
}


function cat_type_info.getLength()
    return #cat_type_info._data
end



function cat_type_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_cat_type_info
function cat_type_info.indexOf(index)
    if index == nil or not cat_type_info._data[index] then
        return nil
    end
    return setmetatable({_raw = cat_type_info._data[index]}, m)
end



---
--@return @class record_cat_type_info
function cat_type_info.get(id)
    
    return cat_type_info.indexOf(__index_id[ id ])
     
end



function cat_type_info.set(id, key, value)
    local record = cat_type_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function cat_type_info.get_index_data()
    return __index_id 
end

return  cat_type_info 