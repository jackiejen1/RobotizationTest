---@classdef record_arena_target_info
local record_arena_target_info = {}


record_arena_target_info.id = 0--id
record_arena_target_info.rank = 0--名次段
record_arena_target_info.num_a = 0--参数a
record_arena_target_info.num_b = 0--参数b

local arena_target_info = {
   _data = {   
    [1] = {1,1,0,1,},  
    [2] = {2,51,0,3,},  
    [3] = {3,101,0,5,},  
    [4] = {4,201,0,10,},  
    [5] = {5,401,0,15,},  
    [6] = {6,701,0,20,},  
    [7] = {7,1001,20,1,},
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
}

local __key_map = { 
    id = 1,
    rank = 2,
    num_a = 3,
    num_b = 4,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_arena_target_info")

        return t._raw[__key_map[k]]
    end
}


function arena_target_info.getLength()
    return #arena_target_info._data
end



function arena_target_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_arena_target_info
function arena_target_info.indexOf(index)
    if index == nil or not arena_target_info._data[index] then
        return nil
    end
    return setmetatable({_raw = arena_target_info._data[index]}, m)
end



---
--@return @class record_arena_target_info
function arena_target_info.get(id)
    
    return arena_target_info.indexOf(__index_id[ id ])
     
end



function arena_target_info.set(id, key, value)
    local record = arena_target_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function arena_target_info.get_index_data()
    return __index_id 
end

return  arena_target_info 