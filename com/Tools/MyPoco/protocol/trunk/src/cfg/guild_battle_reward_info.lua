---@classdef record_guild_battle_reward_info
local record_guild_battle_reward_info = {}


record_guild_battle_reward_info.id = 0--ID
record_guild_battle_reward_info.battle_type = 0--类型
record_guild_battle_reward_info.target_score = 0--目标积分
record_guild_battle_reward_info.reward_type_1 = 0--奖励类型1
record_guild_battle_reward_info.reward_value_1 = 0--奖励类型值1
record_guild_battle_reward_info.reward_size_1 = 0--奖励数量1
record_guild_battle_reward_info.reward_type_2 = 0--奖励类型2
record_guild_battle_reward_info.reward_value_2 = 0--奖励类型值2
record_guild_battle_reward_info.reward_size_2 = 0--奖励数量2

local guild_battle_reward_info = {
   _data = {   
    [1] = {1,1,1500,3,186,2,0,0,0,},  
    [2] = {2,1,3800,3,187,1,3,186,2,},  
    [3] = {3,1,6500,3,187,1,3,186,2,},  
    [4] = {4,1,9000,3,187,2,3,186,2,},  
    [5] = {101,2,1400,3,187,1,3,186,5,},  
    [6] = {102,2,3600,3,187,2,3,186,5,},  
    [7] = {103,2,5000,3,187,2,3,186,6,},  
    [8] = {104,2,9000,3,2365,1,3,187,3,},
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
    [104] = 8,
}

local __key_map = { 
    id = 1,
    battle_type = 2,
    target_score = 3,
    reward_type_1 = 4,
    reward_value_1 = 5,
    reward_size_1 = 6,
    reward_type_2 = 7,
    reward_value_2 = 8,
    reward_size_2 = 9,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_guild_battle_reward_info")

        return t._raw[__key_map[k]]
    end
}


function guild_battle_reward_info.getLength()
    return #guild_battle_reward_info._data
end



function guild_battle_reward_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_guild_battle_reward_info
function guild_battle_reward_info.indexOf(index)
    if index == nil or not guild_battle_reward_info._data[index] then
        return nil
    end
    return setmetatable({_raw = guild_battle_reward_info._data[index]}, m)
end



---
--@return @class record_guild_battle_reward_info
function guild_battle_reward_info.get(id)
    
    return guild_battle_reward_info.indexOf(__index_id[ id ])
     
end



function guild_battle_reward_info.set(id, key, value)
    local record = guild_battle_reward_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function guild_battle_reward_info.get_index_data()
    return __index_id 
end

return  guild_battle_reward_info 