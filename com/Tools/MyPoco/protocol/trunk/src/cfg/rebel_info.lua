---@classdef record_rebel_info
local record_rebel_info = {}


record_rebel_info.id = 0--id
record_rebel_info.name =  ""--叛军名称
record_rebel_info.type = 0--类型
record_rebel_info.tip_name =  ""--详情名称
record_rebel_info.res = 0--叛军形象
record_rebel_info.quality = 0--叛军品质
record_rebel_info.des =  ""--巨兽描述
record_rebel_info.feature_type = 0--战斗特性类型
record_rebel_info.feature_value = 0--战斗特性类型值
record_rebel_info.monster_team_id = 0--怪物组id
record_rebel_info.last_time = 0--存在时间
record_rebel_info.trigger_reward_type = 0--触发奖励类型
record_rebel_info.trigger_reward_value = 0--触发奖励类型值
record_rebel_info.trigger_reward_size = 0--触发奖励数量
record_rebel_info.kill_reward_type = 0--击杀奖励类型
record_rebel_info.kill_reward_value = 0--击杀奖励类型值
record_rebel_info.kill_reward_size = 0--击杀奖励数量
record_rebel_info.reborn_time = 0--复活倒计时
record_rebel_info.available_time = 0--开启时间类型

local rebel_info = {
   _data = {   
    [1] = {1,"巨兽-龙炮",3,"龙炮",300210,7,"合击伤害+500%",1,500,2001,3600,1,13,3000,1,13,300,0,0,},  
    [2] = {2,"巨兽-战象",1,"战象",300250,6,"武将伤害+500%",2,500,2002,0,0,0,0,1,13,200,1,1,},  
    [3] = {3,"巨兽-熊车",2,"熊车",300230,6,"合击伤害+500%",1,500,2003,0,0,0,0,1,13,200,1,2,},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [3] = 3,
}

local __key_map = { 
    id = 1,
    name = 2,
    type = 3,
    tip_name = 4,
    res = 5,
    quality = 6,
    des = 7,
    feature_type = 8,
    feature_value = 9,
    monster_team_id = 10,
    last_time = 11,
    trigger_reward_type = 12,
    trigger_reward_value = 13,
    trigger_reward_size = 14,
    kill_reward_type = 15,
    kill_reward_value = 16,
    kill_reward_size = 17,
    reborn_time = 18,
    available_time = 19,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_rebel_info")

        return t._raw[__key_map[k]]
    end
}


function rebel_info.getLength()
    return #rebel_info._data
end



function rebel_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_rebel_info
function rebel_info.indexOf(index)
    if index == nil or not rebel_info._data[index] then
        return nil
    end
    return setmetatable({_raw = rebel_info._data[index]}, m)
end



---
--@return @class record_rebel_info
function rebel_info.get(id)
    
    return rebel_info.indexOf(__index_id[ id ])
     
end



function rebel_info.set(id, key, value)
    local record = rebel_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function rebel_info.get_index_data()
    return __index_id 
end

return  rebel_info 