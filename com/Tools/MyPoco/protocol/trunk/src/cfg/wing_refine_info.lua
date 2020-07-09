---@classdef record_wing_refine_info
local record_wing_refine_info = {}


record_wing_refine_info.id = 0--精炼id
record_wing_refine_info.class = 0--支持最低阶数
record_wing_refine_info.cost_type = 0--精炼消耗类型
record_wing_refine_info.cost_value = 0--精炼消耗类型值
record_wing_refine_info.cost_size = 0--精炼消耗数量
record_wing_refine_info.change_id = 0--关联精炼属性库
record_wing_refine_info.level_min = 0--最低等级

local wing_refine_info = {
   _data = {   
    [1] = {1,2,3,103,1,1,1,},  
    [2] = {2,4,3,104,1,2,1,},  
    [3] = {3,10,3,105,1,3,1,},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [3] = 3,
}

local __key_map = { 
    id = 1,
    class = 2,
    cost_type = 3,
    cost_value = 4,
    cost_size = 5,
    change_id = 6,
    level_min = 7,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_wing_refine_info")

        return t._raw[__key_map[k]]
    end
}


function wing_refine_info.getLength()
    return #wing_refine_info._data
end



function wing_refine_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_wing_refine_info
function wing_refine_info.indexOf(index)
    if index == nil or not wing_refine_info._data[index] then
        return nil
    end
    return setmetatable({_raw = wing_refine_info._data[index]}, m)
end



---
--@return @class record_wing_refine_info
function wing_refine_info.get(id)
    
    return wing_refine_info.indexOf(__index_id[ id ])
     
end



function wing_refine_info.set(id, key, value)
    local record = wing_refine_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function wing_refine_info.get_index_data()
    return __index_id 
end

return  wing_refine_info 