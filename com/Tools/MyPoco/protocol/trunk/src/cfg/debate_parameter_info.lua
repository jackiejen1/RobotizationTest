---@classdef record_debate_parameter_info
local record_debate_parameter_info = {}


record_debate_parameter_info.id = 0--ID
record_debate_parameter_info.parameter = 0--参数值
record_debate_parameter_info.help_text_1 =  ""--说明1
record_debate_parameter_info.help_text_2 =  ""--说明2

local debate_parameter_info = {
   _data = {   
    [1] = {1,800,"刷新弱化系数","parameter_k",},  
    [2] = {2,200,"刷新强化系数","parameter_m",},  
    [3] = {3,300,"第1场回复比例","recover_game_1",},  
    [4] = {4,200,"第2场回复比例","recover_game_2",},  
    [5] = {5,0,"武将生命系数","knight_life",},  
    [6] = {6,1200,"武将伤害系数_魏","knight_damage_wei",},  
    [7] = {7,800,"武将伤害系数_蜀","knight_damage_shu",},  
    [8] = {8,1350,"武将伤害系数_吴","knight_damage_wu",},  
    [9] = {9,1050,"武将伤害系数_群","knight_damage_qun",},  
    [10] = {10,16,"积分公式参数a","parameter_a",},  
    [11] = {11,25,"积分公式参数b","parameter_b",},  
    [12] = {12,1000,"武将伤害系数_主角","knight_damage_zhu",},  
    [13] = {13,1000,"武将伤害系数_时空","knight_damage_spacetime",},  
    [14] = {14,10,"使用特殊匹配规则的玩家最低排名","top_num",},  
    [15] = {15,30,"积分公式参数c","parameter_c",},
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
}

local __key_map = { 
    id = 1,
    parameter = 2,
    help_text_1 = 3,
    help_text_2 = 4,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_debate_parameter_info")

        return t._raw[__key_map[k]]
    end
}


function debate_parameter_info.getLength()
    return #debate_parameter_info._data
end



function debate_parameter_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_debate_parameter_info
function debate_parameter_info.indexOf(index)
    if index == nil or not debate_parameter_info._data[index] then
        return nil
    end
    return setmetatable({_raw = debate_parameter_info._data[index]}, m)
end



---
--@return @class record_debate_parameter_info
function debate_parameter_info.get(id)
    
    return debate_parameter_info.indexOf(__index_id[ id ])
     
end



function debate_parameter_info.set(id, key, value)
    local record = debate_parameter_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function debate_parameter_info.get_index_data()
    return __index_id 
end

return  debate_parameter_info 