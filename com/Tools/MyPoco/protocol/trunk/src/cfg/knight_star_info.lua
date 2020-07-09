---@classdef record_knight_star_info
local record_knight_star_info = {}


record_knight_star_info.id = 0--将星ID
record_knight_star_info.level = 0--将星等级
record_knight_star_info.open_level = 0--开启等级
record_knight_star_info.name =  ""--将星名称
record_knight_star_info.res = 0--资源
record_knight_star_info.effect =  ""--特效
record_knight_star_info.res_color =  ""--资源颜色
record_knight_star_info.quality = 0--品质
record_knight_star_info.tab_name =  ""--页签名
record_knight_star_info.tab_group = 0--所属页签
record_knight_star_info.awake_stage = 0--觉醒等级
record_knight_star_info.initial_hp = 0--生命
record_knight_star_info.attack = 0--攻击力
record_knight_star_info.phy_defence = 0--物防
record_knight_star_info.mag_defence = 0--魔防
record_knight_star_info.train_id = 0--培养id
record_knight_star_info.affect_type_1 = 0--加成属性1
record_knight_star_info.affect_value_1 = 0--加成类型值1
record_knight_star_info.affect_type_2 = 0--加成属性2
record_knight_star_info.affect_value_2 = 0--加成类型值2
record_knight_star_info.affect_type_3 = 0--加成属性3
record_knight_star_info.affect_value_3 = 0--加成类型值3
record_knight_star_info.affect_type_4 = 0--加成属性4
record_knight_star_info.affect_value_4 = 0--加成类型值4

local knight_star_info = {
   _data = {   
    [1] = {1,1,5,"破军",1,"green","2d6f16",1,"少微将星",1,0,5000,250,150,150,1,12,50,11,50,0,0,0,0,},  
    [2] = {1,2,15,"七杀",2,"blue","1983d4",1,"少微将星",1,0,10000,500,250,250,2,12,50,15,50,0,0,0,0,},  
    [3] = {1,3,30,"廉贞",3,"waterblue","07b7c7",1,"少微将星",1,0,20000,1000,500,500,3,16,60,0,0,0,0,0,0,},  
    [4] = {1,4,45,"紫薇",4,"purple","6311aa",1,"少微将星",1,0,35000,1800,900,900,4,16,70,0,0,0,0,0,0,},  
    [5] = {1,5,60,"天府",5,"orange","c04923",1,"少微将星",1,0,50000,2600,1300,1300,5,16,80,0,0,0,0,0,0,},  
    [6] = {1,6,75,"贪狼",6,"red","d13718",1,"少微将星",1,0,75000,4000,2000,2000,6,16,90,0,0,0,0,0,0,},  
    [7] = {1,7,90,"武曲",7,"yellow","ce8026",1,"少微将星",1,0,105000,5500,2700,2700,7,16,100,0,0,0,0,0,0,},  
    [8] = {1,8,105,"天相",8,"yellow","dc9e28",1,"少微将星",1,0,210000,11000,5400,5400,8,16,100,0,0,0,0,0,0,},  
    [9] = {1,9,121,"文昌",1,"green","2d6f16",1,"太微将星",2,1,840000,44000,21600,21600,9,16,50,0,0,0,0,0,0,},  
    [10] = {1,10,130,"禄存",2,"blue","1983d4",1,"太微将星",2,1,1344000,70400,34560,34560,10,16,60,0,0,0,0,0,0,},  
    [11] = {1,11,140,"天机",3,"waterblue","07b7c7",1,"太微将星",2,1,2100000,110000,54000,54000,11,16,70,0,0,0,0,0,0,},  
    [12] = {1,12,150,"地劫",4,"purple","6311aa",1,"太微将星",2,1,2940000,154000,75600,75600,12,16,80,0,0,0,0,0,0,},  
    [13] = {1,13,165,"巨门",5,"orange","c04923",1,"太微将星",2,1,50000,2600,1300,1300,13,16,80,0,0,0,0,0,0,},  
    [14] = {1,14,165,"天魁",6,"red","d13718",1,"太微将星",2,1,75000,4000,2000,2000,14,16,90,0,0,0,0,0,0,},  
    [15] = {1,15,165,"太阳",7,"yellow","ce8026",1,"太微将星",2,1,105000,5500,2700,2700,15,16,100,0,0,0,0,0,0,},  
    [16] = {1,16,165,"太阴",8,"yellow","dc9e28",1,"太微将星",2,1,210000,11000,5400,5400,16,16,100,0,0,0,0,0,0,},
    }
}

local __index_id_level = {   
    ["1_1"] = 1,  
    ["1_2"] = 2,  
    ["1_3"] = 3,  
    ["1_4"] = 4,  
    ["1_5"] = 5,  
    ["1_6"] = 6,  
    ["1_7"] = 7,  
    ["1_8"] = 8,  
    ["1_9"] = 9,  
    ["1_10"] = 10,  
    ["1_11"] = 11,  
    ["1_12"] = 12,  
    ["1_13"] = 13,  
    ["1_14"] = 14,  
    ["1_15"] = 15,  
    ["1_16"] = 16,
}

local __key_map = { 
    id = 1,
    level = 2,
    open_level = 3,
    name = 4,
    res = 5,
    effect = 6,
    res_color = 7,
    quality = 8,
    tab_name = 9,
    tab_group = 10,
    awake_stage = 11,
    initial_hp = 12,
    attack = 13,
    phy_defence = 14,
    mag_defence = 15,
    train_id = 16,
    affect_type_1 = 17,
    affect_value_1 = 18,
    affect_type_2 = 19,
    affect_value_2 = 20,
    affect_type_3 = 21,
    affect_value_3 = 22,
    affect_type_4 = 23,
    affect_value_4 = 24,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_knight_star_info")

        return t._raw[__key_map[k]]
    end
}


function knight_star_info.getLength()
    return #knight_star_info._data
end



function knight_star_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_knight_star_info
function knight_star_info.indexOf(index)
    if index == nil or not knight_star_info._data[index] then
        return nil
    end
    return setmetatable({_raw = knight_star_info._data[index]}, m)
end



---
--@return @class record_knight_star_info
function knight_star_info.get(id,level)
    
    local k = id .. '_' .. level
    return knight_star_info.indexOf(__index_id_level[k])
     
end



function knight_star_info.set(id,level, key, value)
    local record = knight_star_info.get(id,level)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function knight_star_info.get_index_data()
    return __index_id_level 
end

return  knight_star_info 