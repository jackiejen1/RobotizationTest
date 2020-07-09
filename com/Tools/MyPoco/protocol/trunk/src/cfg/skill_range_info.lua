---@classdef record_skill_range_info
local record_skill_range_info = {}


record_skill_range_info.id = 0--id
record_skill_range_info.name =  ""--名称
record_skill_range_info.type = 0--技能类型
record_skill_range_info.position_1 = 0--位置1
record_skill_range_info.position_2 = 0--位置2
record_skill_range_info.position_3 = 0--位置3
record_skill_range_info.position_4 = 0--位置4
record_skill_range_info.position_5 = 0--位置5
record_skill_range_info.position_6 = 0--位置6

local skill_range_info = {
   _data = {   
    [1] = {1,"单体",1,0,1,0,0,0,0,},  
    [2] = {2,"单体",1,0,0,0,1,0,0,},  
    [3] = {3,"随机",1,0,0,1,0,0,0,},  
    [4] = {4,"竖排",1,0,1,0,0,1,0,},  
    [5] = {5,"随机",1,0,0,1,1,0,0,},  
    [6] = {6,"竖排",1,0,0,1,0,0,1,},  
    [7] = {7,"前排",1,1,1,1,0,0,0,},  
    [8] = {8,"后排",1,0,0,0,1,1,1,},  
    [9] = {9,"随机",1,1,1,0,0,0,1,},  
    [10] = {10,"十字",1,1,1,1,0,1,0,},  
    [11] = {11,"随机",1,1,1,0,1,0,1,},  
    [12] = {12,"竖排",1,0,1,1,0,1,1,},  
    [13] = {13,"全体",1,1,1,1,1,1,1,},  
    [14] = {14,"单体",1,0,1,0,0,0,0,},  
    [15] = {15,"两人",1,0,1,0,0,1,0,},  
    [16] = {16,"单体",1,0,1,0,0,0,0,},  
    [17] = {17,"竖排",1,0,1,0,0,1,0,},  
    [18] = {18,"十字",1,1,1,1,0,1,0,},  
    [19] = {19,"单体",1,0,1,0,0,0,0,},  
    [20] = {20,"竖排",1,0,0,1,0,0,1,},  
    [21] = {21,"十字",1,1,1,1,0,1,0,},  
    [22] = {22,"四人",1,0,1,1,1,1,0,},  
    [23] = {23,"单体",1,0,1,0,0,0,0,},  
    [24] = {24,"竖排",1,0,1,0,0,1,0,},  
    [25] = {25,"十字",1,1,1,1,0,1,0,},  
    [26] = {26,"单体",1,0,1,0,0,0,0,},  
    [27] = {27,"竖排",1,0,1,0,0,1,0,},  
    [28] = {28,"十字",1,1,1,1,0,1,0,},  
    [29] = {29,"三人",1,0,1,1,1,0,0,},  
    [30] = {30,"高伤",1,1,1,0,0,0,1,},  
    [31] = {31,"眩晕",1,1,1,1,0,0,0,},  
    [32] = {101,"单体",2,0,2,0,0,0,0,},  
    [33] = {102,"竖排",2,2,0,0,2,0,0,},  
    [34] = {103,"横排",2,2,2,2,0,0,0,},  
    [35] = {104,"十字",2,2,2,2,0,2,0,},  
    [36] = {105,"单体",2,0,2,0,0,0,0,},  
    [37] = {106,"两人",2,0,2,0,2,0,0,},  
    [38] = {107,"前排",2,2,2,2,0,0,0,},  
    [39] = {108,"后排",2,0,0,0,2,2,2,},  
    [40] = {109,"全体",2,2,2,2,2,2,2,},  
    [41] = {110,"单体",2,0,2,0,0,0,0,},  
    [42] = {111,"两人",2,2,0,0,0,2,0,},  
    [43] = {112,"治疗",2,2,2,0,0,2,0,},
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
    [101] = 32,  
    [102] = 33,  
    [103] = 34,  
    [104] = 35,  
    [105] = 36,  
    [106] = 37,  
    [107] = 38,  
    [108] = 39,  
    [109] = 40,  
    [110] = 41,  
    [111] = 42,  
    [112] = 43,
}

local __key_map = { 
    id = 1,
    name = 2,
    type = 3,
    position_1 = 4,
    position_2 = 5,
    position_3 = 6,
    position_4 = 7,
    position_5 = 8,
    position_6 = 9,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_skill_range_info")

        return t._raw[__key_map[k]]
    end
}


function skill_range_info.getLength()
    return #skill_range_info._data
end



function skill_range_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_skill_range_info
function skill_range_info.indexOf(index)
    if index == nil or not skill_range_info._data[index] then
        return nil
    end
    return setmetatable({_raw = skill_range_info._data[index]}, m)
end



---
--@return @class record_skill_range_info
function skill_range_info.get(id)
    
    return skill_range_info.indexOf(__index_id[ id ])
     
end



function skill_range_info.set(id, key, value)
    local record = skill_range_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function skill_range_info.get_index_data()
    return __index_id 
end

return  skill_range_info 