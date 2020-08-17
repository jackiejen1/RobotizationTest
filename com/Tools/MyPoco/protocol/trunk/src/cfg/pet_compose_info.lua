---@classdef record_pet_compose_info
local record_pet_compose_info = {}


record_pet_compose_info.id = 0--id
record_pet_compose_info.name =  ""--图鉴组合名称
record_pet_compose_info.quality = 0--品质
record_pet_compose_info.pet_1 = 0--神兽id1
record_pet_compose_info.pet_2 = 0--神兽id2
record_pet_compose_info.attribute_type_1 = 0--属性类型1
record_pet_compose_info.attribute_value_1 = 0--属性值1
record_pet_compose_info.attribute_type_2 = 0--属性类型2
record_pet_compose_info.attribute_value_2 = 0--属性值2
record_pet_compose_info.attribute_type_3 = 0--属性类型3
record_pet_compose_info.attribute_value_3 = 0--属性值3
record_pet_compose_info.attribute_type_4 = 0--属性类型4
record_pet_compose_info.attribute_value_4 = 0--属性值4

local pet_compose_info = {
   _data = {   
    [1] = {1,"仙岛异兽",5,101,201,1,100000,5,2600,0,0,0,0,},  
    [2] = {2,"机关栩栩",6,301,302,2,21100,1,400000,0,0,0,0,},  
    [3] = {3,"神木厚土",7,401,402,2,52600,5,26300,11,100,0,0,},  
    [4] = {4,"碧落狱府",7,403,404,2,52600,1,1000000,15,100,0,0,},  
    [5] = {5,"水生雷动",8,405,406,2,79000,1,1500000,12,150,0,0,},
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
    name = 2,
    quality = 3,
    pet_1 = 4,
    pet_2 = 5,
    attribute_type_1 = 6,
    attribute_value_1 = 7,
    attribute_type_2 = 8,
    attribute_value_2 = 9,
    attribute_type_3 = 10,
    attribute_value_3 = 11,
    attribute_type_4 = 12,
    attribute_value_4 = 13,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_pet_compose_info")

        return t._raw[__key_map[k]]
    end
}


function pet_compose_info.getLength()
    return #pet_compose_info._data
end



function pet_compose_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_pet_compose_info
function pet_compose_info.indexOf(index)
    if index == nil or not pet_compose_info._data[index] then
        return nil
    end
    return setmetatable({_raw = pet_compose_info._data[index]}, m)
end



---
--@return @class record_pet_compose_info
function pet_compose_info.get(id)
    
    return pet_compose_info.indexOf(__index_id[ id ])
     
end



function pet_compose_info.set(id, key, value)
    local record = pet_compose_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function pet_compose_info.get_index_data()
    return __index_id 
end

return  pet_compose_info 