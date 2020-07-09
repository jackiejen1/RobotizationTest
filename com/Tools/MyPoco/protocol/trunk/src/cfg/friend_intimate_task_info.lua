---@classdef record_friend_intimate_task_info
local record_friend_intimate_task_info = {}


record_friend_intimate_task_info.id = 0--ID
record_friend_intimate_task_info.name =  ""--任务名称
record_friend_intimate_task_info.task_type = 0--任务类型
record_friend_intimate_task_info.task_value = 0--任务类型值
record_friend_intimate_task_info.daily_num = 0--每日任务上限
record_friend_intimate_task_info.reward_intimate = 0--单次任务获得亲密度
record_friend_intimate_task_info.function_id = 0--关联功能id
record_friend_intimate_task_info.route_id = 0--跳转ID

local friend_intimate_task_info = {
   _data = {   
    [1] = {1,"【好友系统】赠送1次礼物",1010,1,1,1,20007,30,},  
    [2] = {2,"【封地巡逻】帮助好友平定动乱1次",1003,1,10,1,10023,18,},  
    [3] = {3,"【战役】与好友共同组队，并挑战胜利",1011,1,8,3,10001,12,},
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
    task_type = 3,
    task_value = 4,
    daily_num = 5,
    reward_intimate = 6,
    function_id = 7,
    route_id = 8,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_friend_intimate_task_info")

        return t._raw[__key_map[k]]
    end
}


function friend_intimate_task_info.getLength()
    return #friend_intimate_task_info._data
end



function friend_intimate_task_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_friend_intimate_task_info
function friend_intimate_task_info.indexOf(index)
    if index == nil or not friend_intimate_task_info._data[index] then
        return nil
    end
    return setmetatable({_raw = friend_intimate_task_info._data[index]}, m)
end



---
--@return @class record_friend_intimate_task_info
function friend_intimate_task_info.get(id)
    
    return friend_intimate_task_info.indexOf(__index_id[ id ])
     
end



function friend_intimate_task_info.set(id, key, value)
    local record = friend_intimate_task_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function friend_intimate_task_info.get_index_data()
    return __index_id 
end

return  friend_intimate_task_info 