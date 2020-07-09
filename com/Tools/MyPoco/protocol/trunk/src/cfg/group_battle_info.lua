---@classdef record_group_battle_info
local record_group_battle_info = {}


record_group_battle_info.id = 0--ID
record_group_battle_info.week_day = 0--星期
record_group_battle_info.map_id = 0--关联地图

local group_battle_info = {
   _data = {   
    [1] = {1,1,1,},  
    [2] = {1,2,2,},  
    [3] = {1,3,1,},  
    [4] = {1,4,2,},  
    [5] = {1,5,1,},  
    [6] = {1,6,2,},  
    [7] = {1,0,1,},  
    [8] = {2,1,2,},  
    [9] = {2,2,1,},  
    [10] = {2,3,2,},  
    [11] = {2,4,1,},  
    [12] = {2,5,2,},  
    [13] = {2,6,1,},  
    [14] = {2,0,2,},
    }
}

local __index_id_week_day = {   
    ["1_1"] = 1,  
    ["1_2"] = 2,  
    ["1_3"] = 3,  
    ["1_4"] = 4,  
    ["1_5"] = 5,  
    ["1_6"] = 6,  
    ["1_0"] = 7,  
    ["2_1"] = 8,  
    ["2_2"] = 9,  
    ["2_3"] = 10,  
    ["2_4"] = 11,  
    ["2_5"] = 12,  
    ["2_6"] = 13,  
    ["2_0"] = 14,
}

local __key_map = { 
    id = 1,
    week_day = 2,
    map_id = 3,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_group_battle_info")

        return t._raw[__key_map[k]]
    end
}


function group_battle_info.getLength()
    return #group_battle_info._data
end



function group_battle_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_group_battle_info
function group_battle_info.indexOf(index)
    if index == nil or not group_battle_info._data[index] then
        return nil
    end
    return setmetatable({_raw = group_battle_info._data[index]}, m)
end



---
--@return @class record_group_battle_info
function group_battle_info.get(id,week_day)
    
    local k = id .. '_' .. week_day
    return group_battle_info.indexOf(__index_id_week_day[k])
     
end



function group_battle_info.set(id,week_day, key, value)
    local record = group_battle_info.get(id,week_day)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function group_battle_info.get_index_data()
    return __index_id_week_day 
end

return  group_battle_info 