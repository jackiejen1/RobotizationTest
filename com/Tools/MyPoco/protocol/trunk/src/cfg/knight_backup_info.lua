---@classdef record_knight_backup_info
local record_knight_backup_info = {}


record_knight_backup_info.id = 0--ID
record_knight_backup_info.quality = 0--品质
record_knight_backup_info.star = 0--星级
record_knight_backup_info.basic_type_1 = 0--基础属性类型1
record_knight_backup_info.basic_value_1 = 0--基础属性类型值1
record_knight_backup_info.basic_growth_1 = 0--属性1成长值
record_knight_backup_info.basic_type_2 = 0--基础属性类型2
record_knight_backup_info.basic_value_2 = 0--基础属性类型值2
record_knight_backup_info.basic_growth_2 = 0--属性2成长值
record_knight_backup_info.basic_type_3 = 0--基础属性类型3
record_knight_backup_info.basic_value_3 = 0--基础属性类型值3
record_knight_backup_info.basic_growth_3 = 0--属性3成长值
record_knight_backup_info.basic_type_4 = 0--基础属性类型4
record_knight_backup_info.basic_value_4 = 0--基础属性类型值4
record_knight_backup_info.basic_growth_4 = 0--属性4成长值

local knight_backup_info = {
   _data = {   
    [1] = {1,7,0,1,172800,2300,2,8600,110,5,4300,50,0,0,0,},  
    [2] = {2,7,1,1,198700,2640,2,9900,130,5,4900,60,0,0,0,},  
    [3] = {3,7,2,1,233200,3110,2,11600,150,5,5800,70,0,0,0,},  
    [4] = {4,7,3,1,276400,3680,2,13800,180,5,6900,90,0,0,0,},  
    [5] = {5,7,4,1,336900,4490,2,16800,220,5,8400,110,0,0,0,},  
    [6] = {6,7,5,1,423300,5640,2,21100,280,5,10500,140,0,0,0,},  
    [7] = {7,7,6,1,535600,7140,2,26700,350,5,13300,170,0,0,0,},  
    [8] = {8,7,7,1,691200,9210,2,34500,460,5,17200,230,0,0,0,},  
    [9] = {9,6,0,1,9100,120,2,400,6,5,200,3,0,0,0,},  
    [10] = {10,6,1,1,18200,240,2,900,12,5,400,6,0,0,0,},  
    [11] = {11,6,2,1,36400,480,2,1900,25,5,900,12,0,0,0,},  
    [12] = {12,6,3,1,72900,970,2,3800,51,5,1900,25,0,0,0,},  
    [13] = {13,6,4,1,136800,1820,2,7200,96,5,3600,48,0,0,0,},  
    [14] = {14,6,5,1,228000,3040,2,12000,160,5,6000,80,0,0,0,},  
    [15] = {15,6,6,1,328300,4370,2,17200,230,5,8600,115,0,0,0,},  
    [16] = {16,6,7,1,456000,6080,2,24000,320,5,12000,160,0,0,0,},  
    [17] = {17,5,0,1,3000,40,2,240,3,5,120,1,0,0,0,},  
    [18] = {18,5,1,1,3600,48,2,280,3,5,130,1,0,0,0,},  
    [19] = {19,5,2,1,4200,56,2,330,4,5,160,2,0,0,0,},  
    [20] = {20,5,3,1,4800,64,2,370,5,5,180,2,0,0,0,},  
    [21] = {21,5,4,1,5400,72,2,420,5,5,210,2,0,0,0,},  
    [22] = {22,5,5,1,6000,80,2,480,6,5,240,3,0,0,0,},  
    [23] = {23,5,6,1,6600,88,2,520,7,5,250,3,0,0,0,},  
    [24] = {24,5,7,1,7200,96,2,570,7,5,280,3,0,0,0,},  
    [25] = {25,4,0,1,1500,20,2,150,2,5,70,1,0,0,0,},  
    [26] = {26,4,1,1,1800,24,2,180,2,5,90,1,0,0,0,},  
    [27] = {27,4,2,1,2100,28,2,210,2,5,100,1,0,0,0,},  
    [28] = {28,4,3,1,2400,32,2,240,3,5,120,1,0,0,0,},  
    [29] = {29,4,4,1,2700,36,2,270,3,5,130,1,0,0,0,},  
    [30] = {30,4,5,1,3000,40,2,300,4,5,150,2,0,0,0,},  
    [31] = {31,4,6,1,3300,44,2,330,4,5,160,2,0,0,0,},  
    [32] = {32,4,7,1,3600,48,2,360,4,5,180,2,0,0,0,},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [3] = 3,  
    [4] = 4,  
    [5] = 5,  
    [6] = 6,  
    [7] = 7,  
    [8] = 8,  
    [9] = 9,  
    [10] = 10,  
    [11] = 11,  
    [12] = 12,  
    [13] = 13,  
    [14] = 14,  
    [15] = 15,  
    [16] = 16,  
    [17] = 17,  
    [18] = 18,  
    [19] = 19,  
    [20] = 20,  
    [21] = 21,  
    [22] = 22,  
    [23] = 23,  
    [24] = 24,  
    [25] = 25,  
    [26] = 26,  
    [27] = 27,  
    [28] = 28,  
    [29] = 29,  
    [30] = 30,  
    [31] = 31,  
    [32] = 32,
}

local __key_map = { 
    id = 1,
    quality = 2,
    star = 3,
    basic_type_1 = 4,
    basic_value_1 = 5,
    basic_growth_1 = 6,
    basic_type_2 = 7,
    basic_value_2 = 8,
    basic_growth_2 = 9,
    basic_type_3 = 10,
    basic_value_3 = 11,
    basic_growth_3 = 12,
    basic_type_4 = 13,
    basic_value_4 = 14,
    basic_growth_4 = 15,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_knight_backup_info")

        return t._raw[__key_map[k]]
    end
}


function knight_backup_info.getLength()
    return #knight_backup_info._data
end



function knight_backup_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_knight_backup_info
function knight_backup_info.indexOf(index)
    if index == nil or not knight_backup_info._data[index] then
        return nil
    end
    return setmetatable({_raw = knight_backup_info._data[index]}, m)
end



---
--@return @class record_knight_backup_info
function knight_backup_info.get(id)
    
    return knight_backup_info.indexOf(__index_id[ id ])
     
end



function knight_backup_info.set(id, key, value)
    local record = knight_backup_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function knight_backup_info.get_index_data()
    return __index_id 
end

return  knight_backup_info 