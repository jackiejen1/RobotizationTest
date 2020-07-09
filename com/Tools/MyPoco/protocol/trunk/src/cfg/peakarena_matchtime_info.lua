---@classdef record_peakarena_matchtime_info
local record_peakarena_matchtime_info = {}


record_peakarena_matchtime_info.id = 0--ID
record_peakarena_matchtime_info.level_difference = 0--匹配段位差
record_peakarena_matchtime_info.match_time = 0--前端匹配时长

local peakarena_matchtime_info = {
   _data = {   
    [1] = {1,0,3,},  
    [2] = {2,1,4,},  
    [3] = {3,2,6,},  
    [4] = {4,4,8,},  
    [5] = {5,30,10,},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [3] = 3,  
    [4] = 4,  
    [5] = 5,
}

local __key_map = { 
    id = 1,
    level_difference = 2,
    match_time = 3,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_peakarena_matchtime_info")

        return t._raw[__key_map[k]]
    end
}


function peakarena_matchtime_info.getLength()
    return #peakarena_matchtime_info._data
end



function peakarena_matchtime_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_peakarena_matchtime_info
function peakarena_matchtime_info.indexOf(index)
    if index == nil or not peakarena_matchtime_info._data[index] then
        return nil
    end
    return setmetatable({_raw = peakarena_matchtime_info._data[index]}, m)
end



---
--@return @class record_peakarena_matchtime_info
function peakarena_matchtime_info.get(id)
    
    return peakarena_matchtime_info.indexOf(__index_id[ id ])
     
end



function peakarena_matchtime_info.set(id, key, value)
    local record = peakarena_matchtime_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function peakarena_matchtime_info.get_index_data()
    return __index_id 
end

return  peakarena_matchtime_info 