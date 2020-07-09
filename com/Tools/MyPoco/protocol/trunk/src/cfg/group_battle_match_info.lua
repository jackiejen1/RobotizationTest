---@classdef record_group_battle_match_info
local record_group_battle_match_info = {}


record_group_battle_match_info.id = 0--id
record_group_battle_match_info.type = 0--类型
record_group_battle_match_info.start_time = 0--初始时间
record_group_battle_match_info.end_time = 0--结束时间
record_group_battle_match_info.basic_limit = 0--初始范围
record_group_battle_match_info.raise_limit = 0--增加速率

local group_battle_match_info = {
   _data = {   
    [1] = {1,1,0,10,400,0,},  
    [2] = {101,2,0,5,50,0,},  
    [3] = {102,2,5,50,50,10,},  
    [4] = {103,2,50,99999,500,0,},
    }
}

local __index_id = {   
    [1] = 1,  
    [101] = 2,  
    [102] = 3,  
    [103] = 4,
}

local __key_map = { 
    id = 1,
    type = 2,
    start_time = 3,
    end_time = 4,
    basic_limit = 5,
    raise_limit = 6,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_group_battle_match_info")

        return t._raw[__key_map[k]]
    end
}


function group_battle_match_info.getLength()
    return #group_battle_match_info._data
end



function group_battle_match_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_group_battle_match_info
function group_battle_match_info.indexOf(index)
    if index == nil or not group_battle_match_info._data[index] then
        return nil
    end
    return setmetatable({_raw = group_battle_match_info._data[index]}, m)
end



---
--@return @class record_group_battle_match_info
function group_battle_match_info.get(id)
    
    return group_battle_match_info.indexOf(__index_id[ id ])
     
end



function group_battle_match_info.set(id, key, value)
    local record = group_battle_match_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function group_battle_match_info.get_index_data()
    return __index_id 
end

return  group_battle_match_info 