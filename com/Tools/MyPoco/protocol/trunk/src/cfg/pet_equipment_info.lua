---@classdef record_pet_equipment_info
local record_pet_equipment_info = {}


record_pet_equipment_info.id = 0--装备ID
record_pet_equipment_info.name =  ""--装备名称
record_pet_equipment_info.type = 0--装备类型
record_pet_equipment_info.quality = 0--品质
record_pet_equipment_info.class = 0--阶数
record_pet_equipment_info.put = 0--是否投放
record_pet_equipment_info.res_id = 0--资源ID
record_pet_equipment_info.basic_score = 0--基础属性评分
record_pet_equipment_info.basic_type_1 = 0--基础属性类型1
record_pet_equipment_info.basic_value_1 = 0--基础属性类型值1
record_pet_equipment_info.basic_growth_1 = 0--属性1成长值
record_pet_equipment_info.basic_type_2 = 0--基础属性类型2
record_pet_equipment_info.basic_value_2 = 0--基础属性类型值2
record_pet_equipment_info.basic_growth_2 = 0--属性2成长值
record_pet_equipment_info.attribute_id = 0--传奇属性库
record_pet_equipment_info.attribute_num = 0--传奇属性数量
record_pet_equipment_info.level_max = 0--强化等级上限
record_pet_equipment_info.exp = 0--提供经验
record_pet_equipment_info.strength_parameter_1 = 0--强化需求经验成长系数1
record_pet_equipment_info.strength_parameter_2 = 0--强化需求经验成长系数2

local pet_equipment_info = {
   _data = {   
    [1] = {101,"紫冥骨爪",1,4,1,1,101,100,2,2600,130,1,50000,2500,0,0,80,1000,50,0,},  
    [2] = {102,"紫冥骨角",2,4,1,1,102,100,1,50000,2500,3,1300,65,0,0,80,1000,50,0,},  
    [3] = {103,"紫冥骨环",3,4,1,1,103,100,1,50000,2500,4,1300,65,0,0,80,1000,50,0,},  
    [4] = {111,"橙光骨爪",1,5,1,1,111,200,2,5300,265,1,100000,5000,1,1,80,2000,50,0,},  
    [5] = {112,"橙光骨角",2,5,1,1,112,200,1,100000,5000,3,2600,130,1,1,80,2000,50,0,},  
    [6] = {113,"橙光骨环",3,5,1,1,113,200,1,100000,5000,4,2600,130,1,1,80,2000,50,0,},  
    [7] = {121,"红炎骨爪",1,6,1,1,121,400,2,10500,525,1,200000,10000,2,2,80,4000,50,0,},  
    [8] = {122,"红炎骨角",2,6,1,1,122,400,1,200000,10000,3,5300,265,2,2,80,4000,50,0,},  
    [9] = {123,"红炎骨环",3,6,1,1,123,400,1,200000,10000,4,5300,265,2,2,80,4000,50,0,},  
    [10] = {131,"金玄骨爪",1,7,1,1,131,800,2,21100,1055,1,400000,20000,3,3,80,8000,50,0,},  
    [11] = {132,"金玄骨角",2,7,1,1,132,800,1,400000,20000,3,10500,525,3,3,80,8000,50,0,},  
    [12] = {133,"金玄骨环",3,7,1,1,133,800,1,400000,20000,4,10500,525,3,3,80,8000,50,0,},  
    [13] = {201,"紫冥锐爪",1,4,2,1,201,200,2,5300,265,1,100000,5000,0,0,100,2000,50,0,},  
    [14] = {202,"紫冥锐角",2,4,2,1,202,200,1,100000,5000,3,2600,130,0,0,100,2000,50,0,},  
    [15] = {203,"紫冥锐环",3,4,2,1,203,200,1,100000,5000,4,2600,130,0,0,100,2000,50,0,},  
    [16] = {211,"橙光锐爪",1,5,2,1,211,400,2,10500,525,1,200000,10000,4,1,100,4000,50,0,},  
    [17] = {212,"橙光锐角",2,5,2,1,212,400,1,200000,10000,3,5300,265,4,1,100,4000,50,0,},  
    [18] = {213,"橙光锐环",3,5,2,1,213,400,1,200000,10000,4,5300,265,4,1,100,4000,50,0,},  
    [19] = {221,"红炎锐爪",1,6,2,1,221,800,2,21100,1055,1,400000,20000,5,2,100,8000,50,0,},  
    [20] = {222,"红炎锐角",2,6,2,1,222,800,1,400000,20000,3,10500,525,5,2,100,8000,50,0,},  
    [21] = {223,"红炎锐环",3,6,2,1,223,800,1,400000,20000,4,10500,525,5,2,100,8000,50,0,},  
    [22] = {231,"金玄锐爪",1,7,2,1,231,1600,2,42100,2105,1,800000,40000,6,3,100,16000,50,0,},  
    [23] = {232,"金玄锐角",2,7,2,1,232,1600,1,800000,40000,3,21100,1055,6,3,100,16000,50,0,},  
    [24] = {233,"金玄锐环",3,7,2,1,233,1600,1,800000,40000,4,21100,1055,6,3,100,16000,50,0,},  
    [25] = {301,"紫冥灵爪",1,4,3,1,301,400,2,10500,525,1,200000,10000,0,0,120,4000,50,0,},  
    [26] = {302,"紫冥灵角",2,4,3,1,302,400,1,200000,10000,3,5300,265,0,0,120,4000,50,0,},  
    [27] = {303,"紫冥灵环",3,4,3,1,303,400,1,200000,10000,4,5300,265,0,0,120,4000,50,0,},  
    [28] = {311,"橙光灵爪",1,5,3,1,311,800,2,21100,1055,1,400000,20000,7,1,120,8000,50,0,},  
    [29] = {312,"橙光灵角",2,5,3,1,312,800,1,400000,20000,3,10500,525,7,1,120,8000,50,0,},  
    [30] = {313,"橙光灵环",3,5,3,1,313,800,1,400000,20000,4,10500,525,7,1,120,8000,50,0,},  
    [31] = {321,"红炎灵爪",1,6,3,1,321,1600,2,42100,2105,1,800000,40000,8,2,120,16000,50,0,},  
    [32] = {322,"红炎灵角",2,6,3,1,322,1600,1,800000,40000,3,21100,1055,8,2,120,16000,50,0,},  
    [33] = {323,"红炎灵环",3,6,3,1,323,1600,1,800000,40000,4,21100,1055,8,2,120,16000,50,0,},  
    [34] = {331,"金玄灵爪",1,7,3,1,331,3200,2,84200,4210,1,1600000,80000,9,3,120,32000,50,0,},  
    [35] = {332,"金玄灵角",2,7,3,1,332,3200,1,1600000,80000,3,42100,2105,9,3,120,32000,50,0,},  
    [36] = {333,"金玄灵环",3,7,3,1,333,3200,1,1600000,80000,4,42100,2105,9,3,120,32000,50,0,},  
    [37] = {9001,"神兽骨石",4,4,1,1,9001,50,0,0,0,0,0,0,0,0,100,5000,50,0,},  
    [38] = {9002,"神兽原石",4,5,2,1,9002,60,0,0,0,0,0,0,0,0,100,10000,50,0,},  
    [39] = {9003,"神兽灵石",4,6,3,1,9003,80,0,0,0,0,0,0,0,0,100,20000,50,0,},  
    [40] = {9004,"神兽仙石",4,7,4,1,9004,100,0,0,0,0,0,0,0,0,100,50000,50,0,},
    }
}

local __index_id = {   
    [101] = 1,  
    [102] = 2,  
    [103] = 3,  
    [111] = 4,  
    [112] = 5,  
    [113] = 6,  
    [121] = 7,  
    [122] = 8,  
    [123] = 9,  
    [131] = 10,  
    [132] = 11,  
    [133] = 12,  
    [201] = 13,  
    [202] = 14,  
    [203] = 15,  
    [211] = 16,  
    [212] = 17,  
    [213] = 18,  
    [221] = 19,  
    [222] = 20,  
    [223] = 21,  
    [231] = 22,  
    [232] = 23,  
    [233] = 24,  
    [301] = 25,  
    [302] = 26,  
    [303] = 27,  
    [311] = 28,  
    [312] = 29,  
    [313] = 30,  
    [321] = 31,  
    [322] = 32,  
    [323] = 33,  
    [331] = 34,  
    [332] = 35,  
    [333] = 36,  
    [9001] = 37,  
    [9002] = 38,  
    [9003] = 39,  
    [9004] = 40,
}

local __key_map = { 
    id = 1,
    name = 2,
    type = 3,
    quality = 4,
    class = 5,
    put = 6,
    res_id = 7,
    basic_score = 8,
    basic_type_1 = 9,
    basic_value_1 = 10,
    basic_growth_1 = 11,
    basic_type_2 = 12,
    basic_value_2 = 13,
    basic_growth_2 = 14,
    attribute_id = 15,
    attribute_num = 16,
    level_max = 17,
    exp = 18,
    strength_parameter_1 = 19,
    strength_parameter_2 = 20,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_pet_equipment_info")

        return t._raw[__key_map[k]]
    end
}


function pet_equipment_info.getLength()
    return #pet_equipment_info._data
end



function pet_equipment_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_pet_equipment_info
function pet_equipment_info.indexOf(index)
    if index == nil or not pet_equipment_info._data[index] then
        return nil
    end
    return setmetatable({_raw = pet_equipment_info._data[index]}, m)
end



---
--@return @class record_pet_equipment_info
function pet_equipment_info.get(id)
    
    return pet_equipment_info.indexOf(__index_id[ id ])
     
end



function pet_equipment_info.set(id, key, value)
    local record = pet_equipment_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function pet_equipment_info.get_index_data()
    return __index_id 
end

return  pet_equipment_info 