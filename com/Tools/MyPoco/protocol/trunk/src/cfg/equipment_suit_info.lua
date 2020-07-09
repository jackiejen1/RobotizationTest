---@classdef record_equipment_suit_info
local record_equipment_suit_info = {}


record_equipment_suit_info.id = 0--编号
record_equipment_suit_info.name =  ""--套装名称
record_equipment_suit_info.equipment_id_1 = 0--装备ID1
record_equipment_suit_info.equipment_id_2 = 0--装备ID2
record_equipment_suit_info.equipment_id_3 = 0--装备ID3
record_equipment_suit_info.equipment_id_4 = 0--装备ID4
record_equipment_suit_info.two_suit_type_1 = 0--2件套装属性类型1
record_equipment_suit_info.two_suit_value_1 = 0--2件套装属性类型值1
record_equipment_suit_info.two_suit_type_2 = 0--2件套装属性类型2
record_equipment_suit_info.two_suit_value_2 = 0--2件套装属性类型值2
record_equipment_suit_info.three_suit_type_1 = 0--3件套装属性类型1
record_equipment_suit_info.three_suit_value_1 = 0--3件套装属性类型值1
record_equipment_suit_info.three_suit_type_2 = 0--3件套装属性类型2
record_equipment_suit_info.three_suit_value_2 = 0--3件套装属性类型值2
record_equipment_suit_info.four_suit_type_1 = 0--4件套装属性类型1
record_equipment_suit_info.four_suit_value_1 = 0--4件套装属性类型值1
record_equipment_suit_info.four_suit_type_2 = 0--4件套装属性类型2
record_equipment_suit_info.four_suit_value_2 = 0--4件套装属性类型值2

local equipment_suit_info = {
   _data = {   
    [1] = {100,"百炼套装",101,102,103,104,2,210,0,0,12,30,0,0,103,30,101,30,},  
    [2] = {200,"烈焰套装",201,202,203,204,2,472,0,0,12,40,0,0,103,40,101,40,},  
    [3] = {210,"寒光套装",211,212,213,214,1,9000,0,0,11,40,0,0,105,40,102,40,},  
    [4] = {300,"血战套装",301,302,303,304,1,12000,0,0,11,50,0,0,105,50,102,50,},  
    [5] = {310,"破军套装",311,312,313,314,2,630,0,0,12,50,0,0,103,50,101,50,},  
    [6] = {400,"朱雀套装",401,402,403,404,1,24000,0,0,11,80,0,0,105,80,102,80,},  
    [7] = {410,"霸王套装",411,412,413,414,2,1265,0,0,12,80,0,0,103,80,101,80,},  
    [8] = {420,"无双套装",421,422,423,424,12,80,1,2000000,103,80,5,50000,207,100,208,100,},
    }
}

local __index_id = {   
    [100] = 1,  
    [200] = 2,  
    [210] = 3,  
    [300] = 4,  
    [310] = 5,  
    [400] = 6,  
    [410] = 7,  
    [420] = 8,
}

local __key_map = { 
    id = 1,
    name = 2,
    equipment_id_1 = 3,
    equipment_id_2 = 4,
    equipment_id_3 = 5,
    equipment_id_4 = 6,
    two_suit_type_1 = 7,
    two_suit_value_1 = 8,
    two_suit_type_2 = 9,
    two_suit_value_2 = 10,
    three_suit_type_1 = 11,
    three_suit_value_1 = 12,
    three_suit_type_2 = 13,
    three_suit_value_2 = 14,
    four_suit_type_1 = 15,
    four_suit_value_1 = 16,
    four_suit_type_2 = 17,
    four_suit_value_2 = 18,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_equipment_suit_info")

        return t._raw[__key_map[k]]
    end
}


function equipment_suit_info.getLength()
    return #equipment_suit_info._data
end



function equipment_suit_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_equipment_suit_info
function equipment_suit_info.indexOf(index)
    if index == nil or not equipment_suit_info._data[index] then
        return nil
    end
    return setmetatable({_raw = equipment_suit_info._data[index]}, m)
end



---
--@return @class record_equipment_suit_info
function equipment_suit_info.get(id)
    
    return equipment_suit_info.indexOf(__index_id[ id ])
     
end



function equipment_suit_info.set(id, key, value)
    local record = equipment_suit_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function equipment_suit_info.get_index_data()
    return __index_id 
end

return  equipment_suit_info 