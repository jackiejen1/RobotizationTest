---@classdef record_wing_refine_show
local record_wing_refine_show = {}


record_wing_refine_show.id = 0--加成属性1
record_wing_refine_show.initial_quality = 0--初始品质
record_wing_refine_show.quality_1 = 0--品质1
record_wing_refine_show.quality_1_num = 0--品质1所需属性值
record_wing_refine_show.quality_2 = 0--品质2
record_wing_refine_show.quality_2_num = 0--品质2所需属性值
record_wing_refine_show.quality_3 = 0--品质3
record_wing_refine_show.quality_3_num = 0--品质3所需属性值
record_wing_refine_show.quality_4 = 0--品质4
record_wing_refine_show.quality_4_num = 0--品质4所需属性值

local wing_refine_show = {
   _data = {   
    [1] = {1,3,4,756000,5,2520000,6,6300000,7,12600000,},  
    [2] = {2,3,4,39900,5,133000,6,332500,7,665000,},  
    [3] = {5,3,4,36000,5,120000,6,300000,7,600000,},  
    [4] = {209,3,4,20,5,55,6,140,7,275,},  
    [5] = {210,3,4,20,5,55,6,140,7,275,},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [5] = 3,  
    [209] = 4,  
    [210] = 5,
}

local __key_map = { 
    id = 1,
    initial_quality = 2,
    quality_1 = 3,
    quality_1_num = 4,
    quality_2 = 5,
    quality_2_num = 6,
    quality_3 = 7,
    quality_3_num = 8,
    quality_4 = 9,
    quality_4_num = 10,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_wing_refine_show")

        return t._raw[__key_map[k]]
    end
}


function wing_refine_show.getLength()
    return #wing_refine_show._data
end



function wing_refine_show.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_wing_refine_show
function wing_refine_show.indexOf(index)
    if index == nil or not wing_refine_show._data[index] then
        return nil
    end
    return setmetatable({_raw = wing_refine_show._data[index]}, m)
end



---
--@return @class record_wing_refine_show
function wing_refine_show.get(id)
    
    return wing_refine_show.indexOf(__index_id[ id ])
     
end



function wing_refine_show.set(id, key, value)
    local record = wing_refine_show.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function wing_refine_show.get_index_data()
    return __index_id 
end

return  wing_refine_show 