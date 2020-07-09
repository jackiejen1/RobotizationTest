---@classdef record_challenge_step_info
local record_challenge_step_info = {}


record_challenge_step_info.id = 0--id
record_challenge_step_info.type = 0--类型
record_challenge_step_info.rank = 0--名次段
record_challenge_step_info.num_a = 0--参数a
record_challenge_step_info.num_b = 0--参数b

local challenge_step_info = {
   _data = {   
    [1] = {1,1,1,0,1,},  
    [2] = {2,1,51,0,8,},  
    [3] = {3,1,101,0,12,},  
    [4] = {4,1,201,15,15,},  
    [5] = {5,1,401,30,20,},  
    [6] = {6,1,701,40,25,},  
    [7] = {7,1,2001,50,30,},  
    [8] = {8,1,9999,50,30,},
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
    rank = 3,
    num_a = 4,
    num_b = 5,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_challenge_step_info")

        return t._raw[__key_map[k]]
    end
}


function challenge_step_info.getLength()
    return #challenge_step_info._data
end



function challenge_step_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_challenge_step_info
function challenge_step_info.indexOf(index)
    if index == nil or not challenge_step_info._data[index] then
        return nil
    end
    return setmetatable({_raw = challenge_step_info._data[index]}, m)
end



---
--@return @class record_challenge_step_info
function challenge_step_info.get(id)
    
    return challenge_step_info.indexOf(__index_id[ id ])
     
end



function challenge_step_info.set(id, key, value)
    local record = challenge_step_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function challenge_step_info.get_index_data()
    return __index_id 
end

return  challenge_step_info 