---@classdef record_magic_compose_info
local record_magic_compose_info = {}


record_magic_compose_info.id = 0--id
record_magic_compose_info.name =  ""--图鉴名称
record_magic_compose_info.quality = 0--图鉴品质
record_magic_compose_info.magic_1 = 0--战法id1
record_magic_compose_info.magic_2 = 0--战法id2
record_magic_compose_info.attribute_type_1 = 0--属性类型1
record_magic_compose_info.attribute_value_1 = 0--属性值1
record_magic_compose_info.attribute_type_2 = 0--属性类型2
record_magic_compose_info.attribute_value_2 = 0--属性值2
record_magic_compose_info.attribute_type_3 = 0--属性类型3
record_magic_compose_info.attribute_value_3 = 0--属性值3
record_magic_compose_info.attribute_type_4 = 0--属性类型4
record_magic_compose_info.attribute_value_4 = 0--属性值4

local magic_compose_info = {
   _data = {   
    [1] = {1,"权掌生杀",6,6010,6020,3,5000,4,5000,0,0,0,0,},  
    [2] = {2,"剑光陆离",7,7010,7020,2,52000,3,26000,106,100,0,0,},  
    [3] = {3,"流波惊雾",7,7030,7040,1,1000000,4,26000,105,100,0,0,},  
    [4] = {4,"名动九天",8,8010,8020,2,87000,3,43000,103,150,104,150,},
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
    name = 2,
    quality = 3,
    magic_1 = 4,
    magic_2 = 5,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_magic_compose_info")

        return t._raw[__key_map[k]]
    end
}


function magic_compose_info.getLength()
    return #magic_compose_info._data
end



function magic_compose_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_magic_compose_info
function magic_compose_info.indexOf(index)
    if index == nil or not magic_compose_info._data[index] then
        return nil
    end
    return setmetatable({_raw = magic_compose_info._data[index]}, m)
end



---
--@return @class record_magic_compose_info
function magic_compose_info.get(id)
    
    return magic_compose_info.indexOf(__index_id[ id ])
     
end



function magic_compose_info.set(id, key, value)
    local record = magic_compose_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function magic_compose_info.get_index_data()
    return __index_id 
end

return  magic_compose_info 