---@classdef record_friend_intimate_info
local record_friend_intimate_info = {}


record_friend_intimate_info.id = 0--ID
record_friend_intimate_info.level = 0--等级
record_friend_intimate_info.level_intimate = 0--本级累积亲密度
record_friend_intimate_info.daily_intimate = 0--每日亲密度上限
record_friend_intimate_info.gift_name =  ""--礼物名称
record_friend_intimate_info.gift_drop = 0--礼物

local friend_intimate_info = {
   _data = {   
    [1] = {1,0,0,50,"普通礼物",170001,},  
    [2] = {2,1,25,50,"1级礼物",170002,},  
    [3] = {3,2,75,50,"2级礼物",170003,},  
    [4] = {4,3,225,50,"3级礼物",170004,},  
    [5] = {5,4,575,50,"4级礼物",170005,},  
    [6] = {6,5,1075,50,"5级礼物",170006,},  
    [7] = {7,6,1825,50,"6级礼物",170007,},  
    [8] = {8,7,2825,50,"7级礼物",170008,},  
    [9] = {9,8,4075,50,"8级礼物",170009,},  
    [10] = {10,9,5575,50,"9级礼物",170010,},  
    [11] = {11,10,7325,50,"10级礼物",170011,},
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
    [9] = 9,  
    [10] = 10,  
    [11] = 11,
}

local __key_map = { 
    id = 1,
    level = 2,
    level_intimate = 3,
    daily_intimate = 4,
    gift_name = 5,
    gift_drop = 6,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_friend_intimate_info")

        return t._raw[__key_map[k]]
    end
}


function friend_intimate_info.getLength()
    return #friend_intimate_info._data
end



function friend_intimate_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_friend_intimate_info
function friend_intimate_info.indexOf(index)
    if index == nil or not friend_intimate_info._data[index] then
        return nil
    end
    return setmetatable({_raw = friend_intimate_info._data[index]}, m)
end



---
--@return @class record_friend_intimate_info
function friend_intimate_info.get(id)
    
    return friend_intimate_info.indexOf(__index_id[ id ])
     
end



function friend_intimate_info.set(id, key, value)
    local record = friend_intimate_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function friend_intimate_info.get_index_data()
    return __index_id 
end

return  friend_intimate_info 