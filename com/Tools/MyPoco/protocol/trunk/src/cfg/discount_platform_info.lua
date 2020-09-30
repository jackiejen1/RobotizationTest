---@classdef record_discount_platform_info
local record_discount_platform_info = {}


record_discount_platform_info.id = 0--ID
record_discount_platform_info.opid = 0--OPid
record_discount_platform_info.platform =  ""--渠道名称
record_discount_platform_info.discount = 0--折扣力度
record_discount_platform_info.vip_min = 0--最小vip等级
record_discount_platform_info.vip_max = 0--最大vip等级
record_discount_platform_info.if_open = 0--是否开启

local discount_platform_info = {
   _data = {   
    [1] = {1,2106,"游族安卓",90,0,15,1,},  
    [2] = {2,2984,"游族-微信",90,0,15,1,},  
    [3] = {3,2989,"微信-小包",90,0,15,1,},  
    [4] = {4,2971,"少年名将录",80,0,15,1,},  
    [5] = {5,2964,"幻想三国志2020",80,0,15,1,},  
    [6] = {6,2970,"热血三国",80,0,15,1,},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [3] = 3,  
    [4] = 4,  
    [5] = 5,  
    [6] = 6,
}

local __key_map = { 
    id = 1,
    opid = 2,
    platform = 3,
    discount = 4,
    vip_min = 5,
    vip_max = 6,
    if_open = 7,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_discount_platform_info")

        return t._raw[__key_map[k]]
    end
}


function discount_platform_info.getLength()
    return #discount_platform_info._data
end



function discount_platform_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_discount_platform_info
function discount_platform_info.indexOf(index)
    if index == nil or not discount_platform_info._data[index] then
        return nil
    end
    return setmetatable({_raw = discount_platform_info._data[index]}, m)
end



---
--@return @class record_discount_platform_info
function discount_platform_info.get(id)
    
    return discount_platform_info.indexOf(__index_id[ id ])
     
end



function discount_platform_info.set(id, key, value)
    local record = discount_platform_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function discount_platform_info.get_index_data()
    return __index_id 
end

return  discount_platform_info 