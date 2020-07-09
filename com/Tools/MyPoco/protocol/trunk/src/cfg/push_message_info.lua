---@classdef record_push_message_info
local record_push_message_info = {}


record_push_message_info.id = 0--id
record_push_message_info.name =  ""--标题
record_push_message_info.function_id = 0--功能开启
record_push_message_info.message =  ""--推送消息内容

local push_message_info = {
   _data = {   
    [1] = {1,"体力已满",0,"将军，您的体力已满，快来上线征战四方吧！",},  
    [2] = {2,"领体力",0,"将军，我们为您烹制了美味大餐，享用美食可以为您补充体力哦！",},  
    [3] = {3,"城池争霸",10033,"将军，城池争霸即将结束，争当霸主，谁主沉浮？",},  
    [4] = {4,"激战时刻",20070,"将军，攻城略地已到激战时刻，快和军团一起横扫全服吧！",},
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
    name = 2,
    function_id = 3,
    message = 4,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_push_message_info")

        return t._raw[__key_map[k]]
    end
}


function push_message_info.getLength()
    return #push_message_info._data
end



function push_message_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_push_message_info
function push_message_info.indexOf(index)
    if index == nil or not push_message_info._data[index] then
        return nil
    end
    return setmetatable({_raw = push_message_info._data[index]}, m)
end



---
--@return @class record_push_message_info
function push_message_info.get(id)
    
    return push_message_info.indexOf(__index_id[ id ])
     
end



function push_message_info.set(id, key, value)
    local record = push_message_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function push_message_info.get_index_data()
    return __index_id 
end

return  push_message_info 