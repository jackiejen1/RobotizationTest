---@classdef record_wing_refine_change_info
local record_wing_refine_change_info = {}


record_wing_refine_change_info.id = 0--id
record_wing_refine_change_info.num = 0--子id
record_wing_refine_change_info.attribute_type = 0--属性类型
record_wing_refine_change_info.attribute_size_max = 0--属性值上限
record_wing_refine_change_info.attribute_refine_weight = 0--期望精炼比例
record_wing_refine_change_info.attribute_change_weight = 0--浮动精炼比例

local wing_refine_change_info = {
   _data = {   
    [1] = {1,1,1,1300000,100,50,},  
    [2] = {1,2,2,70000,100,50,},  
    [3] = {1,3,5,60000,100,50,},  
    [4] = {2,1,1,6400000,150,50,},  
    [5] = {2,2,2,340000,150,50,},  
    [6] = {2,3,5,310000,150,50,},  
    [7] = {2,4,209,200,150,50,},  
    [8] = {2,5,210,200,150,50,},  
    [9] = {3,1,1,17500000,200,50,},  
    [10] = {3,2,2,920000,200,50,},  
    [11] = {3,3,5,830000,200,50,},  
    [12] = {3,4,209,350,200,50,},  
    [13] = {3,5,210,350,200,50,},
    }
}

local __index_id_num = {   
    ["1_1"] = 1,  
    ["1_2"] = 2,  
    ["1_3"] = 3,  
    ["2_1"] = 4,  
    ["2_2"] = 5,  
    ["2_3"] = 6,  
    ["2_4"] = 7,  
    ["2_5"] = 8,  
    ["3_1"] = 9,  
    ["3_2"] = 10,  
    ["3_3"] = 11,  
    ["3_4"] = 12,  
    ["3_5"] = 13,
}

local __key_map = { 
    id = 1,
    num = 2,
    attribute_type = 3,
    attribute_size_max = 4,
    attribute_refine_weight = 5,
    attribute_change_weight = 6,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_wing_refine_change_info")

        return t._raw[__key_map[k]]
    end
}


function wing_refine_change_info.getLength()
    return #wing_refine_change_info._data
end



function wing_refine_change_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_wing_refine_change_info
function wing_refine_change_info.indexOf(index)
    if index == nil or not wing_refine_change_info._data[index] then
        return nil
    end
    return setmetatable({_raw = wing_refine_change_info._data[index]}, m)
end



---
--@return @class record_wing_refine_change_info
function wing_refine_change_info.get(id,num)
    
    local k = id .. '_' .. num
    return wing_refine_change_info.indexOf(__index_id_num[k])
     
end



function wing_refine_change_info.set(id,num, key, value)
    local record = wing_refine_change_info.get(id,num)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function wing_refine_change_info.get_index_data()
    return __index_id_num 
end

return  wing_refine_change_info 