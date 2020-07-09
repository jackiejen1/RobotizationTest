---@classdef record_mail_touch_info
local record_mail_touch_info = {}


record_mail_touch_info.id = 0--ID
record_mail_touch_info.touch_id = 0--触发条件类型
record_mail_touch_info.touch_value = 0--触发类型值
record_mail_touch_info.mail_id = 0--邮件ID
record_mail_touch_info.reward_type_1 = 0--奖励1类型
record_mail_touch_info.reward_value_1 = 0--奖励1类型值
record_mail_touch_info.reward_size_1 = 0--奖励1数量
record_mail_touch_info.reward_type_2 = 0--奖励2类型
record_mail_touch_info.reward_value_2 = 0--奖励2类型值
record_mail_touch_info.reward_size_2 = 0--奖励2数量
record_mail_touch_info.reward_type_3 = 0--奖励3类型
record_mail_touch_info.reward_value_3 = 0--奖励3类型值
record_mail_touch_info.reward_size_3 = 0--奖励3数量
record_mail_touch_info.reward_type_4 = 0--奖励4类型
record_mail_touch_info.reward_value_4 = 0--奖励4类型值
record_mail_touch_info.reward_size_4 = 0--奖励4数量

local mail_touch_info = {
   _data = {   
    [1] = {1,0,0,1019,9,102,1,999,0,200,3,6,1,1,3,188888,},  
    [2] = {2,0,0,1025,3,6,1,999,0,188,1,3,188888,0,0,0,},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,
}

local __key_map = { 
    id = 1,
    touch_id = 2,
    touch_value = 3,
    mail_id = 4,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_mail_touch_info")

        return t._raw[__key_map[k]]
    end
}


function mail_touch_info.getLength()
    return #mail_touch_info._data
end



function mail_touch_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_mail_touch_info
function mail_touch_info.indexOf(index)
    if index == nil or not mail_touch_info._data[index] then
        return nil
    end
    return setmetatable({_raw = mail_touch_info._data[index]}, m)
end



---
--@return @class record_mail_touch_info
function mail_touch_info.get(id)
    
    return mail_touch_info.indexOf(__index_id[ id ])
     
end



function mail_touch_info.set(id, key, value)
    local record = mail_touch_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function mail_touch_info.get_index_data()
    return __index_id 
end

return  mail_touch_info 