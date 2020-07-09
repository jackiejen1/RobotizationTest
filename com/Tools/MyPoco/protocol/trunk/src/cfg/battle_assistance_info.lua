---@classdef record_battle_assistance_info
local record_battle_assistance_info = {}


record_battle_assistance_info.id = 0--ID
record_battle_assistance_info.male_own_team_id = 0--己方怪物组（男）
record_battle_assistance_info.female_own_team_id = 0--己方怪物组（女）
record_battle_assistance_info.enemy_team_id = 0--敌方怪物组
record_battle_assistance_info.wave = 0--触发NPC波数
record_battle_assistance_info.pre_trigger_story = 0--触发NPC前剧情
record_battle_assistance_info.after_trigger_story = 0--触发NPC后剧情
record_battle_assistance_info.if_attack_immediately = 0--NPC是否立即出手
record_battle_assistance_info.trigger_type = 0--触发NPC时机
record_battle_assistance_info.trigger_type_value = 0--触发NPC时机值
record_battle_assistance_info.trigger_value = 0--触发NPC时机值1
record_battle_assistance_info.npc_type = 0--触发NPC类型
record_battle_assistance_info.npc_position_1 = 0--触发NPC阵位1
record_battle_assistance_info.npc_position_2 = 0--触发NPC阵位2
record_battle_assistance_info.npc_position_3 = 0--触发NPC阵位3
record_battle_assistance_info.npc_show_type = 0--NPC出现类型
record_battle_assistance_info.npc_show_effect = 0--NPC出现特效
record_battle_assistance_info.npc_show_txt =  ""--NPC气泡文字(待删除）
record_battle_assistance_info.npc_show_txt_1 =  ""--NPC1气泡文字
record_battle_assistance_info.npc_show_txt_2 =  ""--NPC2气泡文字
record_battle_assistance_info.npc_show_txt_3 =  ""--NPC3气泡文字

local battle_assistance_info = {
   _data = {   
    [1] = {1,110110,110120,110130,1,0,163,1,100009,2,2,1,4,5,6,1,0,"少年，我来助你！","0","少年，我来助你！","0",},  
    [2] = {2,110140,110150,110160,0,0,0,0,0,0,0,0,0,0,0,0,0,"0","0","0","0",},  
    [3] = {3,110170,110180,110190,0,0,0,0,0,0,0,0,0,0,0,0,0,"0","0","0","0",},  
    [4] = {4,110210,110220,110230,1,0,757,1,100009,2,2,1,4,6,0,1,0,"0","0","0","0",},
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
    male_own_team_id = 2,
    female_own_team_id = 3,
    enemy_team_id = 4,
    wave = 5,
    pre_trigger_story = 6,
    after_trigger_story = 7,
    if_attack_immediately = 8,
    trigger_type = 9,
    trigger_type_value = 10,
    trigger_value = 11,
    npc_type = 12,
    npc_position_1 = 13,
    npc_position_2 = 14,
    npc_position_3 = 15,
    npc_show_type = 16,
    npc_show_effect = 17,
    npc_show_txt = 18,
    npc_show_txt_1 = 19,
    npc_show_txt_2 = 20,
    npc_show_txt_3 = 21,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_battle_assistance_info")

        return t._raw[__key_map[k]]
    end
}


function battle_assistance_info.getLength()
    return #battle_assistance_info._data
end



function battle_assistance_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_battle_assistance_info
function battle_assistance_info.indexOf(index)
    if index == nil or not battle_assistance_info._data[index] then
        return nil
    end
    return setmetatable({_raw = battle_assistance_info._data[index]}, m)
end



---
--@return @class record_battle_assistance_info
function battle_assistance_info.get(id)
    
    return battle_assistance_info.indexOf(__index_id[ id ])
     
end



function battle_assistance_info.set(id, key, value)
    local record = battle_assistance_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function battle_assistance_info.get_index_data()
    return __index_id 
end

return  battle_assistance_info 