---@classdef record_warlord_skill_rule
local record_warlord_skill_rule = {}


record_warlord_skill_rule.id = 0--id
record_warlord_skill_rule.type = 0--规则类型
record_warlord_skill_rule.combo1_id = 0--组合1id
record_warlord_skill_rule.combo1_weight = 0--组合1权重
record_warlord_skill_rule.combo2_id = 0--组合2id
record_warlord_skill_rule.combo2_weight = 0--组合2权重
record_warlord_skill_rule.combo3_id = 0--组合3id
record_warlord_skill_rule.combo3_weight = 0--组合3权重
record_warlord_skill_rule.combo4_id = 0--组合4id
record_warlord_skill_rule.combo4_weight = 0--组合4权重
record_warlord_skill_rule.combo5_id = 0--组合5id
record_warlord_skill_rule.combo5_weight = 0--组合5权重
record_warlord_skill_rule.combo6_id = 0--组合6id
record_warlord_skill_rule.combo6_weight = 0--组合6权重

local warlord_skill_rule = {
   _data = {   
    [1] = {1,1,101,0,102,0,0,0,0,0,0,0,0,0,},  
    [2] = {2,1,103,0,106,0,107,0,0,0,0,0,0,0,},  
    [3] = {3,1,104,0,0,0,0,0,0,0,0,0,0,0,},  
    [4] = {4,1,105,0,0,0,0,0,0,0,0,0,0,0,},  
    [5] = {5,1,108,0,111,0,112,0,0,0,0,0,0,0,},  
    [6] = {6,1,109,0,0,0,0,0,0,0,0,0,0,0,},  
    [7] = {7,1,110,0,0,0,0,0,0,0,0,0,0,0,},  
    [8] = {8,2,113,500,114,500,0,0,0,0,0,0,0,0,},  
    [9] = {9,1,115,0,116,0,0,0,0,0,0,0,0,0,},  
    [10] = {10,2,124,400,125,400,126,200,0,0,0,0,0,0,},  
    [11] = {11,1,117,0,118,0,0,0,0,0,0,0,0,0,},  
    [12] = {12,2,119,250,120,250,121,250,122,250,0,0,0,0,},  
    [13] = {13,1,123,0,0,0,0,0,0,0,0,0,0,0,},  
    [14] = {14,1,130,0,127,0,128,0,129,0,0,0,0,0,},  
    [15] = {15,1,131,0,0,0,0,0,0,0,0,0,0,0,},  
    [16] = {16,1,132,0,0,0,0,0,0,0,0,0,0,0,},  
    [17] = {17,1,133,0,0,0,0,0,0,0,0,0,0,0,},  
    [18] = {18,1,135,0,0,0,0,0,0,0,0,0,0,0,},  
    [19] = {19,1,134,0,127,0,128,0,129,0,0,0,0,0,},  
    [20] = {20,1,136,0,0,0,0,0,0,0,0,0,0,0,},  
    [21] = {21,1,137,0,0,0,0,0,0,0,0,0,0,0,},
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
}

local __key_map = { 
    id = 1,
    type = 2,
    combo1_id = 3,
    combo1_weight = 4,
    combo2_id = 5,
    combo2_weight = 6,
    combo3_id = 7,
    combo3_weight = 8,
    combo4_id = 9,
    combo4_weight = 10,
    combo5_id = 11,
    combo5_weight = 12,
    combo6_id = 13,
    combo6_weight = 14,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_warlord_skill_rule")

        return t._raw[__key_map[k]]
    end
}


function warlord_skill_rule.getLength()
    return #warlord_skill_rule._data
end



function warlord_skill_rule.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_warlord_skill_rule
function warlord_skill_rule.indexOf(index)
    if index == nil or not warlord_skill_rule._data[index] then
        return nil
    end
    return setmetatable({_raw = warlord_skill_rule._data[index]}, m)
end



---
--@return @class record_warlord_skill_rule
function warlord_skill_rule.get(id)
    
    return warlord_skill_rule.indexOf(__index_id[ id ])
     
end



function warlord_skill_rule.set(id, key, value)
    local record = warlord_skill_rule.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function warlord_skill_rule.get_index_data()
    return __index_id 
end

return  warlord_skill_rule 