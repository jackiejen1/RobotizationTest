---@classdef record_share_info
local record_share_info = {}


record_share_info.id = 0--ID
record_share_info.reset_type = 0--分享重置类型
record_share_info.reward_type1 = 0--奖励类型1
record_share_info.reward_value1 = 0--奖励类型值1
record_share_info.reward_size1 = 0--奖励数量1
record_share_info.reward_type2 = 0--奖励类型2
record_share_info.reward_value2 = 0--奖励类型值2
record_share_info.reward_size2 = 0--奖励数量2
record_share_info.reward_type3 = 0--奖励类型3
record_share_info.reward_value3 = 0--奖励类型值3
record_share_info.reward_size3 = 0--奖励数量3
record_share_info.share_res_id = 0--关联资源
record_share_info.if_mail = 0--是否关联邮件
record_share_info.mail_id = 0--关联邮件ID

local share_info = {
   _data = {   
    [1] = {1,2,999,0,200,0,0,0,0,0,0,1,0,0,},  
    [2] = {2,3,999,0,300,0,0,0,0,0,0,2,0,0,},  
    [3] = {3,3,999,0,300,0,0,0,0,0,0,3,0,0,},  
    [4] = {4,3,999,0,300,0,0,0,0,0,0,4,0,0,},  
    [5] = {5,3,999,0,300,0,0,0,0,0,0,5,0,0,},  
    [6] = {6,3,999,0,500,0,0,0,0,0,0,6,0,0,},  
    [7] = {7,3,999,0,500,0,0,0,0,0,0,7,0,0,},  
    [8] = {8,3,0,0,0,0,0,0,0,0,0,8,0,0,},  
    [9] = {9,3,0,0,0,0,0,0,0,0,0,9,0,0,},  
    [10] = {10,3,999,0,100,3,2003,6,3,1,2,0,1,24,},
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
}

local __key_map = { 
    id = 1,
    reset_type = 2,
    reward_type1 = 3,
    reward_value1 = 4,
    reward_size1 = 5,
    reward_type2 = 6,
    reward_value2 = 7,
    reward_size2 = 8,
    reward_type3 = 9,
    reward_value3 = 10,
    reward_size3 = 11,
    share_res_id = 12,
    if_mail = 13,
    mail_id = 14,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_share_info")

        return t._raw[__key_map[k]]
    end
}


function share_info.getLength()
    return #share_info._data
end



function share_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_share_info
function share_info.indexOf(index)
    if index == nil or not share_info._data[index] then
        return nil
    end
    return setmetatable({_raw = share_info._data[index]}, m)
end



---
--@return @class record_share_info
function share_info.get(id)
    
    return share_info.indexOf(__index_id[ id ])
     
end



function share_info.set(id, key, value)
    local record = share_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function share_info.get_index_data()
    return __index_id 
end

return  share_info 