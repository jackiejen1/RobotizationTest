---@classdef record_gvg_buff_refresh_info
local record_gvg_buff_refresh_info = {}


record_gvg_buff_refresh_info.id = 0--id
record_gvg_buff_refresh_info.num = 0--子ID
record_gvg_buff_refresh_info.time_1 = 0--刷新时间
record_gvg_buff_refresh_info.time_2 = 0--持续时间
record_gvg_buff_refresh_info.buff_1 = 0--类型值
record_gvg_buff_refresh_info.weight_1 = 0--类型值
record_gvg_buff_refresh_info.buff_2 = 0--类型值
record_gvg_buff_refresh_info.weight_2 = 0--类型值
record_gvg_buff_refresh_info.buff_3 = 0--类型值
record_gvg_buff_refresh_info.weight_3 = 0--类型值
record_gvg_buff_refresh_info.buff_4 = 0--类型值
record_gvg_buff_refresh_info.weight_4 = 0--类型值
record_gvg_buff_refresh_info.buff_5 = 0--类型值
record_gvg_buff_refresh_info.weight_5 = 0--类型值

local gvg_buff_refresh_info = {
   _data = {   
    [1] = {1001,1,10,100,1,100,2,100,3,100,0,0,0,0,},  
    [2] = {1001,2,200,100,1,100,2,100,3,100,0,0,0,0,},  
    [3] = {1002,1,10,100,1,100,2,100,3,100,0,0,0,0,},  
    [4] = {1002,2,200,100,1,100,2,100,3,100,0,0,0,0,},  
    [5] = {2001,1,10,100,1,100,2,100,3,100,0,0,0,0,},  
    [6] = {2001,2,200,100,1,100,2,100,3,100,0,0,0,0,},  
    [7] = {2002,1,10,100,1,100,2,100,3,100,0,0,0,0,},  
    [8] = {2002,2,200,100,1,100,2,100,3,100,0,0,0,0,},
    }
}

local __index_id_num = {   
    ["1001_1"] = 1,  
    ["1001_2"] = 2,  
    ["1002_1"] = 3,  
    ["1002_2"] = 4,  
    ["2001_1"] = 5,  
    ["2001_2"] = 6,  
    ["2002_1"] = 7,  
    ["2002_2"] = 8,
}

local __key_map = { 
    id = 1,
    num = 2,
    time_1 = 3,
    time_2 = 4,
    buff_1 = 5,
    weight_1 = 6,
    buff_2 = 7,
    weight_2 = 8,
    buff_3 = 9,
    weight_3 = 10,
    buff_4 = 11,
    weight_4 = 12,
    buff_5 = 13,
    weight_5 = 14,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_gvg_buff_refresh_info")

        return t._raw[__key_map[k]]
    end
}


function gvg_buff_refresh_info.getLength()
    return #gvg_buff_refresh_info._data
end



function gvg_buff_refresh_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_gvg_buff_refresh_info
function gvg_buff_refresh_info.indexOf(index)
    if index == nil or not gvg_buff_refresh_info._data[index] then
        return nil
    end
    return setmetatable({_raw = gvg_buff_refresh_info._data[index]}, m)
end



---
--@return @class record_gvg_buff_refresh_info
function gvg_buff_refresh_info.get(id,num)
    
    local k = id .. '_' .. num
    return gvg_buff_refresh_info.indexOf(__index_id_num[k])
     
end



function gvg_buff_refresh_info.set(id,num, key, value)
    local record = gvg_buff_refresh_info.get(id,num)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function gvg_buff_refresh_info.get_index_data()
    return __index_id_num 
end

return  gvg_buff_refresh_info 