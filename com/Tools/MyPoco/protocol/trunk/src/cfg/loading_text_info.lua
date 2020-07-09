---@classdef record_loading_text_info
local record_loading_text_info = {}


record_loading_text_info.id = 0--ID
record_loading_text_info.text =  ""--loading文本

local loading_text_info = {
   _data = {   
    [1] = {1,"合击可独立上阵，不受上阵武将影响",},  
    [2] = {2,"上阵同阵营武将好处多多，可以激活更多缘分和激活阵营光环",},  
    [3] = {3,"红色武将进阶天赋中有很多阵营天赋，上阵同阵营武将可飙升战力",},  
    [4] = {4,"高级招将50次后开启阵营招将，可招募到指定阵营红将",},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [3] = 3,  
    [4] = 4,
}

local __key_map = { 
    id = 1,
    text = 2,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_loading_text_info")

        return t._raw[__key_map[k]]
    end
}


function loading_text_info.getLength()
    return #loading_text_info._data
end



function loading_text_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_loading_text_info
function loading_text_info.indexOf(index)
    if index == nil or not loading_text_info._data[index] then
        return nil
    end
    return setmetatable({_raw = loading_text_info._data[index]}, m)
end



---
--@return @class record_loading_text_info
function loading_text_info.get(id)
    
    return loading_text_info.indexOf(__index_id[ id ])
     
end



function loading_text_info.set(id, key, value)
    local record = loading_text_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function loading_text_info.get_index_data()
    return __index_id 
end

return  loading_text_info 