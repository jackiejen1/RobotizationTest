---@classdef record_gvg_buff_info
local record_gvg_buff_info = {}


record_gvg_buff_info.id = 0--id
record_gvg_buff_info.name =  ""--buff名称
record_gvg_buff_info.type = 0--buff类型
record_gvg_buff_info.value = 0--buff类型值
record_gvg_buff_info.time = 0--生效次数
record_gvg_buff_info.time_max = 0--获取次数上限
record_gvg_buff_info.effect_name =  ""--特效名称_1
record_gvg_buff_info.effect_name_foot =  ""--特效名称_脚下
record_gvg_buff_info.effect_name_body =  ""--特效名称_人

local gvg_buff_info = {
   _data = {   
    [1] = {1,"1",1,500,3,6,"1","effect_gvg_buff_golden_dw","effect_gvg_buff_golden_up",},  
    [2] = {2,"2",2,5,3,6,"2","effect_gvg_buff_red_dw","effect_gvg_buff_red_up",},  
    [3] = {3,"3",3,0,3,6,"3","effect_gvg_buff_green_dw","effect_gvg_buff_green_up",},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [3] = 3,
}

local __key_map = { 
    id = 1,
    name = 2,
    type = 3,
    value = 4,
    time = 5,
    time_max = 6,
    effect_name = 7,
    effect_name_foot = 8,
    effect_name_body = 9,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_gvg_buff_info")

        return t._raw[__key_map[k]]
    end
}


function gvg_buff_info.getLength()
    return #gvg_buff_info._data
end



function gvg_buff_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_gvg_buff_info
function gvg_buff_info.indexOf(index)
    if index == nil or not gvg_buff_info._data[index] then
        return nil
    end
    return setmetatable({_raw = gvg_buff_info._data[index]}, m)
end



---
--@return @class record_gvg_buff_info
function gvg_buff_info.get(id)
    
    return gvg_buff_info.indexOf(__index_id[ id ])
     
end



function gvg_buff_info.set(id, key, value)
    local record = gvg_buff_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function gvg_buff_info.get_index_data()
    return __index_id 
end

return  gvg_buff_info 