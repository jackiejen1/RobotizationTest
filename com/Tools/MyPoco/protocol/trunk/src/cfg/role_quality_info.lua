---@classdef record_role_quality_info
local record_role_quality_info = {}


record_role_quality_info.id = 0--id
record_role_quality_info.name =  ""--品质名称
record_role_quality_info.quality = 0--品质
record_role_quality_info.rare = 0--稀有
record_role_quality_info.next_id = 0--下一品质ID
record_role_quality_info.is_up = 0--是否可以继续升品质

local role_quality_info = {
   _data = {   
    [1] = {1,"绿色",2,0,2,1,},  
    [2] = {2,"蓝色",3,0,3,1,},  
    [3] = {3,"紫色",4,0,4,1,},  
    [4] = {4,"橙色",5,0,5,1,},  
    [5] = {5,"红色",6,0,6,1,},  
    [6] = {6,"金色",7,0,0,0,},
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
    name = 2,
    quality = 3,
    rare = 4,
    next_id = 5,
    is_up = 6,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_role_quality_info")

        return t._raw[__key_map[k]]
    end
}


function role_quality_info.getLength()
    return #role_quality_info._data
end



function role_quality_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_role_quality_info
function role_quality_info.indexOf(index)
    if index == nil or not role_quality_info._data[index] then
        return nil
    end
    return setmetatable({_raw = role_quality_info._data[index]}, m)
end



---
--@return @class record_role_quality_info
function role_quality_info.get(id)
    
    return role_quality_info.indexOf(__index_id[ id ])
     
end



function role_quality_info.set(id, key, value)
    local record = role_quality_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function role_quality_info.get_index_data()
    return __index_id 
end

return  role_quality_info 