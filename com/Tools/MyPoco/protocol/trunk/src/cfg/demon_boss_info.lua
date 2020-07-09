---@classdef record_demon_boss_info
local record_demon_boss_info = {}


record_demon_boss_info.id = 0--id
record_demon_boss_info.boss_id = 0--BOSS
record_demon_boss_info.open_type = 0--开启类型
record_demon_boss_info.start_time = 0--开始时间
record_demon_boss_info.finish_time = 0--结束时间
record_demon_boss_info.monster_team = 0--怪物组
record_demon_boss_info.average_reward_drop = 0--普通挑战掉落
record_demon_boss_info.lucky_reward_drop = 0--幸运一击掉落
record_demon_boss_info.battle_rating = 0--战斗结束回合
record_demon_boss_info.action_type = 0--行为类型
record_demon_boss_info.skill_des =  ""--BOSS技能
record_demon_boss_info.open_time =  ""--BOSS开启时间
record_demon_boss_info.activity_time =  ""--活动开启时间

local demon_boss_info = {
   _data = {   
    [1] = {1,3011,1,129600,165600,3002,510002,510004,4102,1118,"每回合按阵位顺序秒杀一名武将","每周二12:00-22:00开启","每周二、周六12:00-22:00开启",},  
    [2] = {2,3005,1,475200,511200,3001,510001,510003,4101,1119,"四回合后秒杀全体","每周六12:00-22:00开启","每周二、周六12:00-22:00开启",},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,
}

local __key_map = { 
    id = 1,
    boss_id = 2,
    open_type = 3,
    start_time = 4,
    finish_time = 5,
    monster_team = 6,
    average_reward_drop = 7,
    lucky_reward_drop = 8,
    battle_rating = 9,
    action_type = 10,
    skill_des = 11,
    open_time = 12,
    activity_time = 13,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_demon_boss_info")

        return t._raw[__key_map[k]]
    end
}


function demon_boss_info.getLength()
    return #demon_boss_info._data
end



function demon_boss_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_demon_boss_info
function demon_boss_info.indexOf(index)
    if index == nil or not demon_boss_info._data[index] then
        return nil
    end
    return setmetatable({_raw = demon_boss_info._data[index]}, m)
end



---
--@return @class record_demon_boss_info
function demon_boss_info.get(id)
    
    return demon_boss_info.indexOf(__index_id[ id ])
     
end



function demon_boss_info.set(id, key, value)
    local record = demon_boss_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function demon_boss_info.get_index_data()
    return __index_id 
end

return  demon_boss_info 