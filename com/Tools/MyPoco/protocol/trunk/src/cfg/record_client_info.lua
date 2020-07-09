---@classdef record_record_client_info
local record_record_client_info = {}


record_record_client_info.id = 0--ID
record_record_client_info.name =  ""--名称

local record_client_info = {
   _data = {   
    [1] = {9999,"三国快报H5入口",},
    }
}

local __index_id = {   
    [9999] = 1,
}

local __key_map = { 
    id = 1,
    name = 2,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_record_client_info")

        return t._raw[__key_map[k]]
    end
}


function record_client_info.getLength()
    return #record_client_info._data
end



function record_client_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_record_client_info
function record_client_info.indexOf(index)
    if index == nil or not record_client_info._data[index] then
        return nil
    end
    return setmetatable({_raw = record_client_info._data[index]}, m)
end



---
--@return @class record_record_client_info
function record_client_info.get(id)
    
    return record_client_info.indexOf(__index_id[ id ])
     
end



function record_client_info.set(id, key, value)
    local record = record_client_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function record_client_info.get_index_data()
    return __index_id 
end

return  record_client_info 