---@classdef record_demon_boss_task_info
local record_demon_boss_task_info = {}


record_demon_boss_task_info.id = 0--ID
record_demon_boss_task_info.name =  ""--道具名
record_demon_boss_task_info.require_type = 0--挑战类型
record_demon_boss_task_info.require_value = 0--要求数值
record_demon_boss_task_info.reward_type_1 = 0--奖励1类型
record_demon_boss_task_info.reward_value_1 = 0--奖励1类型值
record_demon_boss_task_info.reward_size_1 = 0--奖励1数量
record_demon_boss_task_info.reward_type_2 = 0--奖励2类型
record_demon_boss_task_info.reward_value_2 = 0--奖励2类型值
record_demon_boss_task_info.reward_size_2 = 0--奖励2数量
record_demon_boss_task_info.reward_type_3 = 0--奖励3类型
record_demon_boss_task_info.reward_value_3 = 0--奖励3类型值
record_demon_boss_task_info.reward_size_3 = 0--奖励3数量
record_demon_boss_task_info.reward_type_4 = 0--奖励4类型
record_demon_boss_task_info.reward_value_4 = 0--奖励4类型值
record_demon_boss_task_info.reward_size_4 = 0--奖励4数量

local demon_boss_task_info = {
   _data = {   
    [1] = {1001,"挑战魔将#num#次",1,1,3,204,10,0,0,0,0,0,0,0,0,0,},  
    [2] = {1002,"挑战魔将#num#次",1,3,3,204,15,0,0,0,0,0,0,0,0,0,},  
    [3] = {1003,"挑战魔将#num#次",1,5,999,0,100,3,204,20,0,0,0,0,0,0,},  
    [4] = {1004,"挑战魔将#num#次",1,8,3,204,20,0,0,0,0,0,0,0,0,0,},  
    [5] = {1005,"挑战魔将#num#次",1,10,999,0,200,3,204,25,0,0,0,0,0,0,},  
    [6] = {2001,"战区合力击败#num#级魔将",2,1,3,204,5,0,0,0,0,0,0,0,0,0,},  
    [7] = {2002,"战区合力击败#num#级魔将",2,30,3,204,5,0,0,0,0,0,0,0,0,0,},  
    [8] = {2003,"战区合力击败#num#级魔将",2,60,3,204,10,0,0,0,0,0,0,0,0,0,},  
    [9] = {2004,"战区合力击败#num#级魔将",2,90,999,0,100,3,204,10,0,0,0,0,0,0,},  
    [10] = {2005,"战区合力击败#num#级魔将",2,120,3,204,10,0,0,0,0,0,0,0,0,0,},  
    [11] = {2006,"战区合力击败#num#级魔将",2,150,3,204,10,0,0,0,0,0,0,0,0,0,},  
    [12] = {2007,"战区合力击败#num#级魔将",2,180,3,204,10,0,0,0,0,0,0,0,0,0,},  
    [13] = {2008,"战区合力击败#num#级魔将",2,210,999,0,150,3,204,10,0,0,0,0,0,0,},  
    [14] = {2009,"战区合力击败#num#级魔将",2,240,3,204,10,0,0,0,0,0,0,0,0,0,},  
    [15] = {2010,"战区合力击败#num#级魔将",2,270,3,204,10,0,0,0,0,0,0,0,0,0,},  
    [16] = {2011,"战区合力击败#num#级魔将",2,300,999,0,200,3,204,20,0,0,0,0,0,0,},
    }
}

local __index_id = {   
    [1001] = 1,  
    [1002] = 2,  
    [1003] = 3,  
    [1004] = 4,  
    [1005] = 5,  
    [2001] = 6,  
    [2002] = 7,  
    [2003] = 8,  
    [2004] = 9,  
    [2005] = 10,  
    [2006] = 11,  
    [2007] = 12,  
    [2008] = 13,  
    [2009] = 14,  
    [2010] = 15,  
    [2011] = 16,
}

local __key_map = { 
    id = 1,
    name = 2,
    require_type = 3,
    require_value = 4,
    reward_type_1 = 5,
    reward_value_1 = 6,
    reward_size_1 = 7,
    reward_type_2 = 8,
    reward_value_2 = 9,
    reward_size_2 = 10,
    reward_type_3 = 11,
    reward_value_3 = 12,
    reward_size_3 = 13,
    reward_type_4 = 14,
    reward_value_4 = 15,
    reward_size_4 = 16,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_demon_boss_task_info")

        return t._raw[__key_map[k]]
    end
}


function demon_boss_task_info.getLength()
    return #demon_boss_task_info._data
end



function demon_boss_task_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_demon_boss_task_info
function demon_boss_task_info.indexOf(index)
    if index == nil or not demon_boss_task_info._data[index] then
        return nil
    end
    return setmetatable({_raw = demon_boss_task_info._data[index]}, m)
end



---
--@return @class record_demon_boss_task_info
function demon_boss_task_info.get(id)
    
    return demon_boss_task_info.indexOf(__index_id[ id ])
     
end



function demon_boss_task_info.set(id, key, value)
    local record = demon_boss_task_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function demon_boss_task_info.get_index_data()
    return __index_id 
end

return  demon_boss_task_info 