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
    [1] = {1,1,1,2,"默认初始速度",0,1,1,},  
    [2] = {2,2,1,3,"等级达到20级开启3倍加速",0,20,9999,},  
    [3] = {3,3,2,4,"等级达到20级开启3倍加速",0,20,9999,},  
    [4] = {4,4,2,5,"达到贵族6开启6倍加速",0,999,6,},  
    [5] = {5,5,2,6,"达到贵族6开启6倍加速",0,999,6,},  
    [6] = {6,6,2,7,"达到贵族6开启6倍加速",0,999,6,},  
    [7] = {7,7,2,8,"达到贵族9开启8倍加速",0,999,9,},  
    [8] = {8,8,3,0,"达到贵族9开启8倍加速",0,999,9,},
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