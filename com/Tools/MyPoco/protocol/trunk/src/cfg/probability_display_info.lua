---@classdef record_probability_display_info
local record_probability_display_info = {}


record_probability_display_info.id = 0--id
record_probability_display_info.quality = 0--品质
record_probability_display_info.name =  ""--显示名称
record_probability_display_info.type = 0--归属类型
record_probability_display_info.probability = 0--概率

local probability_display_info = {
   _data = {   
    [1] = {1,1,"极低概率",1,0,},  
    [2] = {2,2,"低概率",1,100,},  
    [3] = {3,3,"较高概率",1,300,},  
    [4] = {4,4,"高概率",1,500,},  
    [5] = {5,5,"极高概率",1,800,},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [3] = 3,  
    [4] = 4,  
    [5] = 5,
}

local __key_map = { 
    id = 1,
    quality = 2,
    name = 3,
    type = 4,
    probability = 5,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_probability_display_info")

        return t._raw[__key_map[k]]
    end
}


function probability_display_info.getLength()
    return #probability_display_info._data
end



function probability_display_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_probability_display_info
function probability_display_info.indexOf(index)
    if index == nil or not probability_display_info._data[index] then
        return nil
    end
    return setmetatable({_raw = probability_display_info._data[index]}, m)
end



---
--@return @class record_probability_display_info
function probability_display_info.get(id)
    
    return probability_display_info.indexOf(__index_id[ id ])
     
end



function probability_display_info.set(id, key, value)
    local record = probability_display_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function probability_display_info.get_index_data()
    return __index_id 
end

return  probability_display_info 