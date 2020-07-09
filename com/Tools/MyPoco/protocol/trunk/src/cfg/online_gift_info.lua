---@classdef record_online_gift_info
local record_online_gift_info = {}


record_online_gift_info.id = 0--ID
record_online_gift_info.order = 0--领取顺序
record_online_gift_info.time = 0--领取时间
record_online_gift_info.type = 0--物品类型
record_online_gift_info.value = 0--物品类型值
record_online_gift_info.num = 0--物品数量

local online_gift_info = {
   _data = {   
    [1] = {1,1,180,999,0,100,},  
    [2] = {2,2,480,999,0,150,},  
    [3] = {3,3,900,999,0,200,},  
    [4] = {4,4,1500,3,2,300,},  
    [5] = {5,5,2400,999,0,250,},  
    [6] = {6,6,3600,3,6,2,},  
    [7] = {7,7,5100,3,37,50,},  
    [8] = {8,8,6900,3,6,3,},  
    [9] = {9,9,9000,999,0,300,},  
    [10] = {10,10,12000,3,6,5,},
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
}

local __key_map = { 
    id = 1,
    order = 2,
    time = 3,
    type = 4,
    value = 5,
    num = 6,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_online_gift_info")

        return t._raw[__key_map[k]]
    end
}


function online_gift_info.getLength()
    return #online_gift_info._data
end



function online_gift_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_online_gift_info
function online_gift_info.indexOf(index)
    if index == nil or not online_gift_info._data[index] then
        return nil
    end
    return setmetatable({_raw = online_gift_info._data[index]}, m)
end



---
--@return @class record_online_gift_info
function online_gift_info.get(id)
    
    return online_gift_info.indexOf(__index_id[ id ])
     
end



function online_gift_info.set(id, key, value)
    local record = online_gift_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function online_gift_info.get_index_data()
    return __index_id 
end

return  online_gift_info 