---@classdef record_warlord_activity_info
local record_warlord_activity_info = {}


record_warlord_activity_info.id = 0--id
record_warlord_activity_info.name =  ""--名称
record_warlord_activity_info.rare_reward_drop = 0--稀有掉落类型
record_warlord_activity_info.theme =  ""--主题

local warlord_activity_info = {
   _data = {   
    [1] = {10001,"乱世英杰活动第1期",520001,"乱世序幕",},
    }
}

local __index_id = {   
    [10001] = 1,
}

local __key_map = { 
    id = 1,
    name = 2,
    rare_reward_drop = 3,
    theme = 4,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_warlord_activity_info")

        return t._raw[__key_map[k]]
    end
}


function warlord_activity_info.getLength()
    return #warlord_activity_info._data
end



function warlord_activity_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_warlord_activity_info
function warlord_activity_info.indexOf(index)
    if index == nil or not warlord_activity_info._data[index] then
        return nil
    end
    return setmetatable({_raw = warlord_activity_info._data[index]}, m)
end



---
--@return @class record_warlord_activity_info
function warlord_activity_info.get(id)
    
    return warlord_activity_info.indexOf(__index_id[ id ])
     
end



function warlord_activity_info.set(id, key, value)
    local record = warlord_activity_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function warlord_activity_info.get_index_data()
    return __index_id 
end

return  warlord_activity_info 