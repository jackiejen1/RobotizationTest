---@classdef record_spirit_speed_info
local record_spirit_speed_info = {}


record_spirit_speed_info.id = 0--id
record_spirit_speed_info.speed_show = 0--显示速度
record_spirit_speed_info.speed = 0--实际速度
record_spirit_speed_info.next_id = 0--下一个档位
record_spirit_speed_info.open_desc =  ""--开启描述
record_spirit_speed_info.unlock_type = 0--开启条件类型
record_spirit_speed_info.level = 0--开启等级
record_spirit_speed_info.vip_level = 0--开启VIP等级

local spirit_speed_info = {
   _data = {   
    [1] = {1,1,10,2,"默认初始速度",0,1,9999,},  
    [2] = {2,2,13,3,"等级达到8级开启3倍加速",0,8,9999,},  
    [3] = {3,3,15,4,"等级达到8级开启3倍加速",0,8,9999,},  
    [4] = {4,4,17,5,"等级达到18级开启6倍加速",0,18,9999,},  
    [5] = {5,5,19,6,"等级达到18级开启6倍加速",0,18,9999,},  
    [6] = {6,6,20,7,"等级达到18级开启6倍加速",0,18,9999,},  
    [7] = {7,7,23,8,"等级达到28级开启9倍加速",0,28,9999,},  
    [8] = {8,8,27,9,"等级达到28级开启9倍加速",0,28,9999,},  
    [9] = {9,9,30,0,"等级达到28级开启9倍加速",0,28,9999,},
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
}

local __key_map = { 
    id = 1,
    speed_show = 2,
    speed = 3,
    next_id = 4,
    open_desc = 5,
    unlock_type = 6,
    level = 7,
    vip_level = 8,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_spirit_speed_info")

        return t._raw[__key_map[k]]
    end
}


function spirit_speed_info.getLength()
    return #spirit_speed_info._data
end



function spirit_speed_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_spirit_speed_info
function spirit_speed_info.indexOf(index)
    if index == nil or not spirit_speed_info._data[index] then
        return nil
    end
    return setmetatable({_raw = spirit_speed_info._data[index]}, m)
end



---
--@return @class record_spirit_speed_info
function spirit_speed_info.get(id)
    
    return spirit_speed_info.indexOf(__index_id[ id ])
     
end



function spirit_speed_info.set(id, key, value)
    local record = spirit_speed_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function spirit_speed_info.get_index_data()
    return __index_id 
end

return  spirit_speed_info 