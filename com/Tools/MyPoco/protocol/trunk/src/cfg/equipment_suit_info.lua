---@classdef record_equipment_suit_info
local record_equipment_suit_info = {}


record_equipment_suit_info.id = 0--编号
record_equipment_suit_info.name =  ""--套装名称
record_equipment_suit_info.quality = 0--套装品质
record_equipment_suit_info.equipment_id_1 = 0--装备ID1
record_equipment_suit_info.equipment_id_2 = 0--装备ID2
record_equipment_suit_info.equipment_id_3 = 0--装备ID3
record_equipment_suit_info.equipment_id_4 = 0--装备ID4
record_equipment_suit_info.one_suit_type_1 = 0--1件套装属性类型1
record_equipment_suit_info.one_suit_value_1 = 0--1件套装属性类型值1
record_equipment_suit_info.one_suit_type_2 = 0--1件套装属性类型2
record_equipment_suit_info.one_suit_value_2 = 0--1件套装属性类型值2
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
record_equipment_suit_info.two_passive_skill = 0--2件套装被动技能
record_equipment_suit_info.three_passive_skill = 0--3件套装被动技能1
record_equipment_suit_info.four_passive_skill = 0--4件套装被动技能1

local equipment_suit_info = {
   _data = {   
    [1] = {100,"百炼套装",3,101,102,103,104,0,0,0,0,2,210,0,0,12,30,0,0,103,30,101,30,0,0,0,},  
    [2] = {200,"烈焰套装",4,201,202,203,204,0,0,0,0,2,472,0,0,12,40,0,0,103,40,101,40,0,0,0,},  
    [3] = {210,"寒光套装",4,211,212,213,214,0,0,0,0,1,9000,0,0,11,40,0,0,105,40,102,40,0,0,0,},  
    [4] = {300,"血战套装",5,301,302,303,304,0,0,0,0,1,12000,0,0,11,50,0,0,105,50,102,50,0,0,0,},  
    [5] = {310,"破军套装",5,311,312,313,314,0,0,0,0,2,630,0,0,12,50,0,0,103,50,101,50,0,0,0,},  
    [6] = {400,"朱雀套装",6,401,402,403,404,0,0,0,0,1,24000,0,0,11,80,0,0,105,80,102,80,0,0,0,},  
    [7] = {410,"霸王套装",6,411,412,413,414,0,0,0,0,2,1265,0,0,12,80,0,0,103,80,101,80,0,0,0,},  
    [8] = {420,"无双套装",7,421,422,423,424,0,0,0,0,12,80,1,2000000,103,80,5,50000,207,100,208,100,0,0,0,},  
    [9] = {5000,"紫金套装",8,5000,5010,5020,5030,15,100,0,0,1,5000000,12,100,5,125000,103,100,207,150,208,150,301009,0,301010,},
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
    [5000] = 9,
}

local __key_map = { 
    id = 1,
    name = 2,
    quality = 3,
    equipment_id_1 = 4,
    equipment_id_2 = 5,
    equipment_id_3 = 6,
    equipment_id_4 = 7,
    one_suit_type_1 = 8,
    one_suit_value_1 = 9,
    one_suit_type_2 = 10,
    one_suit_value_2 = 11,
    two_suit_type_1 = 12,
    two_suit_value_1 = 13,
    two_suit_type_2 = 14,
    two_suit_value_2 = 15,
    three_suit_type_1 = 16,
    three_suit_value_1 = 17,
    three_suit_type_2 = 18,
    three_suit_value_2 = 19,
    four_suit_type_1 = 20,
    four_suit_value_1 = 21,
    four_suit_type_2 = 22,
    four_suit_value_2 = 23,
    two_passive_skill = 24,
    three_passive_skill = 25,
    four_passive_skill = 26,
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