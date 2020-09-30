---@classdef record_debate_doctor_reward_info
local record_debate_doctor_reward_info = {}


record_debate_doctor_reward_info.id = 0--ID
record_debate_doctor_reward_info.doctor_num = 0--击败博士数量
record_debate_doctor_reward_info.doctor_reward = 0--累积数量奖励

local debate_doctor_reward_info = {
   _data = {   
    [1] = {1,10,4100001,},  
    [2] = {2,20,4100002,},  
    [3] = {3,35,4100003,},  
    [4] = {4,50,4100004,},
    }
}

local __index_id_doctor_num = {   
    ["1_10"] = 1,  
    ["2_20"] = 2,  
    ["3_35"] = 3,  
    ["4_50"] = 4,
}

local __key_map = { 
    id = 1,
    doctor_num = 2,
    doctor_reward = 3,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_debate_doctor_reward_info")

        return t._raw[__key_map[k]]
    end
}


function debate_doctor_reward_info.getLength()
    return #debate_doctor_reward_info._data
end



function debate_doctor_reward_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_debate_doctor_reward_info
function debate_doctor_reward_info.indexOf(index)
    if index == nil or not debate_doctor_reward_info._data[index] then
        return nil
    end
    return setmetatable({_raw = debate_doctor_reward_info._data[index]}, m)
end



---
--@return @class record_debate_doctor_reward_info
function debate_doctor_reward_info.get(id,doctor_num)
    
    local k = id .. '_' .. doctor_num
    return debate_doctor_reward_info.indexOf(__index_id_doctor_num[k])
     
end



function debate_doctor_reward_info.set(id,doctor_num, key, value)
    local record = debate_doctor_reward_info.get(id,doctor_num)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function debate_doctor_reward_info.get_index_data()
    return __index_id_doctor_num 
end

return  debate_doctor_reward_info 