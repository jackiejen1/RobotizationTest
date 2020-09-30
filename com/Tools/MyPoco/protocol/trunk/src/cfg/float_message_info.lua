---@classdef record_float_message_info
local record_float_message_info = {}


record_float_message_info.id = 0--编号
record_float_message_info.icon =  ""--提示图标
record_float_message_info.show_name =  ""--名字
record_float_message_info.route_type = 0--跳转类型
record_float_message_info.float_type = 0--提示类型
record_float_message_info.float_value1 = 0--提示类型值1
record_float_message_info.float_value2 = 0--提示类型值2
record_float_message_info.time = 0--消失时间

local float_message_info = {
   _data = {   
    [1] = {1001,"icon/function/icon_zhanyi.png","战役双倍",105,1,1,1,120,},  
    [2] = {1002,"icon/function/icon_zhanyi.png","战役双倍",105,1,1,2,120,},  
    [3] = {1003,"icon/function/icon_taofajushou.png","讨伐巨兽",111,1,3,1,120,},  
    [4] = {1004,"icon/function/icon_taofajushou.png","讨伐巨兽",111,1,3,2,120,},  
    [5] = {2001,"icon/function/icon_hongbao.png","红包",2004,2,0,0,120,},  
    [6] = {3002,"icon/function/icon_yaoqinghan.png","神将传",106,2,0,0,60,},  
    [7] = {4001,"icon/function/icon_youjian.png","邮件",172,1,0,0,9999,},  
    [8] = {4002,"icon/function/icon_fengdi.png","封地巡逻",107,1,0,0,9999,},  
    [9] = {4003,"icon/function/icon_shenshoutiaozhan.png","讨伐神兽",202,1,0,0,9999,},  
    [10] = {5001,"icon/function/icon_juezhandingjunshan.png","决战定军山",2026,2,0,0,60,},  
    [11] = {5002,"icon/function/icon_juezhandingjunshan.png","决战定军山",2025,1,10,1,120,},  
    [12] = {5003,"icon/function/icon_juezhandingjunshan.png","决战定军山",2025,1,10,2,120,},  
    [13] = {6001,"icon/function/icon_juntuan.png","军团战",2041,1,0,0,120,},
    }
}

local __index_id = {   
    [1001] = 1,  
    [1002] = 2,  
    [1003] = 3,  
    [1004] = 4,  
    [2001] = 5,  
    [3002] = 6,  
    [4001] = 7,  
    [4002] = 8,  
    [4003] = 9,  
    [5001] = 10,  
    [5002] = 11,  
    [5003] = 12,  
    [6001] = 13,
}

local __key_map = { 
    id = 1,
    icon = 2,
    show_name = 3,
    route_type = 4,
    float_type = 5,
    float_value1 = 6,
    float_value2 = 7,
    time = 8,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_float_message_info")

        return t._raw[__key_map[k]]
    end
}


function float_message_info.getLength()
    return #float_message_info._data
end



function float_message_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_float_message_info
function float_message_info.indexOf(index)
    if index == nil or not float_message_info._data[index] then
        return nil
    end
    return setmetatable({_raw = float_message_info._data[index]}, m)
end



---
--@return @class record_float_message_info
function float_message_info.get(id)
    
    return float_message_info.indexOf(__index_id[ id ])
     
end



function float_message_info.set(id, key, value)
    local record = float_message_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function float_message_info.get_index_data()
    return __index_id 
end

return  float_message_info 