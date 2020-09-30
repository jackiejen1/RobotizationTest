---@classdef record_skill_special_effect_info
local record_skill_special_effect_info = {}


record_skill_special_effect_info.id = 0--id
record_skill_special_effect_info.special_type = 0--适用类型
record_skill_special_effect_info.tween_pic =  ""--冒字
record_skill_special_effect_info.special_skill_type = 0--特殊技能效果类型
record_skill_special_effect_info.special_skill_value_1 = 0--特殊技能效果类型值1
record_skill_special_effect_info.special_skill_value_2 = 0--特殊技能效果类型值2

local skill_special_effect_info = {
   _data = {   
    [1] = {1,1,"0",1,100,0,},  
    [2] = {2,1,"0",2,1,0,},  
    [3] = {3,1,"0",1001,10,0,},  
    [4] = {4,1,"0",1002,10,0,},  
    [5] = {101,2,"0",1002,200,0,},  
    [6] = {102,2,"0",1002,350,0,},  
    [7] = {103,2,"0",1002,500,0,},  
    [8] = {201,2,"0",1002,100,0,},  
    [9] = {202,2,"0",1002,120,0,},  
    [10] = {203,2,"0",1002,150,0,},  
    [11] = {1001,1,"renjia",1001,50,0,},  
    [12] = {1002,1,"renjia",1001,80,0,},  
    [13] = {1003,1,"renjia",1001,100,0,},  
    [14] = {1004,1,"fanshi",1001,50,0,},  
    [15] = {1005,1,"fanshi",1001,80,0,},  
    [16] = {1006,1,"fanshi",1001,100,0,},  
    [17] = {1007,1,"liaorun",1002,50,0,},  
    [18] = {1008,1,"liaorun",1002,80,0,},  
    [19] = {1009,1,"liaorun",1002,100,0,},  
    [20] = {1010,1,"shuiyu",1002,50,0,},  
    [21] = {1011,1,"shuiyu",1002,80,0,},  
    [22] = {1012,1,"shuiyu",1002,100,0,},  
    [23] = {2001,1,"xuezhan",2,2001,0,},  
    [24] = {2002,1,"xuezhan",2,2002,0,},  
    [25] = {2003,1,"xuezhan",2,2003,0,},  
    [26] = {2004,1,"yazhi",2,3001,0,},  
    [27] = {2005,1,"yazhi",2,3002,0,},  
    [28] = {2006,1,"yazhi",2,3003,0,},  
    [29] = {2007,1,"bumieshenli",1,1000,0,},  
    [30] = {3001,2,"0",2,4001,0,},  
    [31] = {3002,2,"0",2,4002,0,},  
    [32] = {3003,2,"0",2,4003,0,},  
    [33] = {4001,2,"0",1003,500,200,},  
    [34] = {4002,2,"0",1003,750,300,},  
    [35] = {4003,2,"0",1003,1000,400,},  
    [36] = {4004,2,"0",1003,1500,600,},  
    [37] = {4005,2,"0",1003,2000,800,},  
    [38] = {4006,2,"0",1003,1250,500,},  
    [39] = {4007,2,"0",1003,1750,700,},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [3] = 3,  
    [4] = 4,  
    [101] = 5,  
    [102] = 6,  
    [103] = 7,  
    [201] = 8,  
    [202] = 9,  
    [203] = 10,  
    [1001] = 11,  
    [1002] = 12,  
    [1003] = 13,  
    [1004] = 14,  
    [1005] = 15,  
    [1006] = 16,  
    [1007] = 17,  
    [1008] = 18,  
    [1009] = 19,  
    [1010] = 20,  
    [1011] = 21,  
    [1012] = 22,  
    [2001] = 23,  
    [2002] = 24,  
    [2003] = 25,  
    [2004] = 26,  
    [2005] = 27,  
    [2006] = 28,  
    [2007] = 29,  
    [3001] = 30,  
    [3002] = 31,  
    [3003] = 32,  
    [4001] = 33,  
    [4002] = 34,  
    [4003] = 35,  
    [4004] = 36,  
    [4005] = 37,  
    [4006] = 38,  
    [4007] = 39,
}

local __key_map = { 
    id = 1,
    special_type = 2,
    tween_pic = 3,
    special_skill_type = 4,
    special_skill_value_1 = 5,
    special_skill_value_2 = 6,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_skill_special_effect_info")

        return t._raw[__key_map[k]]
    end
}


function skill_special_effect_info.getLength()
    return #skill_special_effect_info._data
end



function skill_special_effect_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_skill_special_effect_info
function skill_special_effect_info.indexOf(index)
    if index == nil or not skill_special_effect_info._data[index] then
        return nil
    end
    return setmetatable({_raw = skill_special_effect_info._data[index]}, m)
end



---
--@return @class record_skill_special_effect_info
function skill_special_effect_info.get(id)
    
    return skill_special_effect_info.indexOf(__index_id[ id ])
     
end



function skill_special_effect_info.set(id, key, value)
    local record = skill_special_effect_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function skill_special_effect_info.get_index_data()
    return __index_id 
end

return  skill_special_effect_info 