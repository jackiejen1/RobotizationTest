---@classdef record_wrest_achievement_info
local record_wrest_achievement_info = {}


record_wrest_achievement_info.id = 0--编号
record_wrest_achievement_info.num = 0--成就达成值
record_wrest_achievement_info.next_id = 0--下个成就ID
record_wrest_achievement_info.drop_id = 0--宝箱奖励

local wrest_achievement_info = {
   _data = {   
    [1] = {1,2,2,500011,},  
    [2] = {2,4,3,500012,},  
    [3] = {3,6,4,500013,},  
    [4] = {4,10,0,500014,},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [3] = 3,  
    [4] = 4,
}

local __key_map = { 
    id = 1,
    num = 2,
    next_id = 3,
    drop_id = 4,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_wrest_achievement_info")

        return t._raw[__key_map[k]]
    end
}


function wrest_achievement_info.getLength()
    return #wrest_achievement_info._data
end



function wrest_achievement_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_wrest_achievement_info
function wrest_achievement_info.indexOf(index)
    if index == nil or not wrest_achievement_info._data[index] then
        return nil
    end
    return setmetatable({_raw = wrest_achievement_info._data[index]}, m)
end



---
--@return @class record_wrest_achievement_info
function wrest_achievement_info.get(id)
    
    return wrest_achievement_info.indexOf(__index_id[ id ])
     
end



function wrest_achievement_info.set(id, key, value)
    local record = wrest_achievement_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function wrest_achievement_info.get_index_data()
    return __index_id 
end

return  wrest_achievement_info 