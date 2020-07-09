---@classdef record_chat_invite_info
local record_chat_invite_info = {}


record_chat_invite_info.id = 0--ID
record_chat_invite_info.function_id = 0--关联功能
record_chat_invite_info.channel = 0--频道
record_chat_invite_info.content_1 =  ""--文本内容
record_chat_invite_info.content_2 =  ""--链接文本

local chat_invite_info = {
   _data = {   
    [1] = {1,10025,1,"欢迎加入[color=#df3f14]#name#[/color]军团，和我们一道，征战三国！","申请加入",},  
    [2] = {2,10001,1,"神将列传-[color=#a77f54]#battle_name#[/color]战役开组啦，快来一起战斗吧！","申请加入",},  
    [3] = {3,10001,3,"神将列传-[color=#a77f55]#battle_name#[/color]战役开组啦，快来一起战斗吧！","申请加入",},  
    [4] = {4,10037,1,"[color=#df3f14]决战定军山[/color]开组啦，快来一起战斗吧！","申请加入",},  
    [5] = {5,10037,3,"[color=#df3f14]决战定军山[/color]开组啦，快来一起战斗吧！","申请加入",},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [3] = 3,  
    [4] = 4,  
    [5] = 5,
}

local __key_map = { 
    id = 1,
    function_id = 2,
    channel = 3,
    content_1 = 4,
    content_2 = 5,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_chat_invite_info")

        return t._raw[__key_map[k]]
    end
}


function chat_invite_info.getLength()
    return #chat_invite_info._data
end



function chat_invite_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_chat_invite_info
function chat_invite_info.indexOf(index)
    if index == nil or not chat_invite_info._data[index] then
        return nil
    end
    return setmetatable({_raw = chat_invite_info._data[index]}, m)
end



---
--@return @class record_chat_invite_info
function chat_invite_info.get(id)
    
    return chat_invite_info.indexOf(__index_id[ id ])
     
end



function chat_invite_info.set(id, key, value)
    local record = chat_invite_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function chat_invite_info.get_index_data()
    return __index_id 
end

return  chat_invite_info 