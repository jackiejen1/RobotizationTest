---@classdef record_recruit_au_knight_reward_info
local record_recruit_au_knight_reward_info = {}


record_recruit_au_knight_reward_info.id = 0--编号
record_recruit_au_knight_reward_info.open = 0--活动id
record_recruit_au_knight_reward_info.num = 0--保底次数
record_recruit_au_knight_reward_info.reward_type_1 = 0--奖励类型1
record_recruit_au_knight_reward_info.reward_value_1 = 0--奖励类型值1
record_recruit_au_knight_reward_info.reward_size_1 = 0--奖励数量1

local recruit_au_knight_reward_info = {
   _data = {   
    [1] = {1,100001,100,2,700130,2,},  
    [2] = {2,100010,100,2,700130,2,},  
    [3] = {1000001,1000001,100,2,700130,20,},  
    [4] = {1000002,1000002,100,2,700130,20,},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [1000001] = 3,  
    [1000002] = 4,
}

local __key_map = { 
    id = 1,
    open = 2,
    num = 3,
    reward_type_1 = 4,
    reward_value_1 = 5,
    reward_size_1 = 6,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_recruit_au_knight_reward_info")

        return t._raw[__key_map[k]]
    end
}


function recruit_au_knight_reward_info.getLength()
    return #recruit_au_knight_reward_info._data
end



function recruit_au_knight_reward_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_recruit_au_knight_reward_info
function recruit_au_knight_reward_info.indexOf(index)
    if index == nil or not recruit_au_knight_reward_info._data[index] then
        return nil
    end
    return setmetatable({_raw = recruit_au_knight_reward_info._data[index]}, m)
end



---
--@return @class record_recruit_au_knight_reward_info
function recruit_au_knight_reward_info.get(id)
    
    return recruit_au_knight_reward_info.indexOf(__index_id[ id ])
     
end



function recruit_au_knight_reward_info.set(id, key, value)
    local record = recruit_au_knight_reward_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function recruit_au_knight_reward_info.get_index_data()
    return __index_id 
end

return  recruit_au_knight_reward_info 