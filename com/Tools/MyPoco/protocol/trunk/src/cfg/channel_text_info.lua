---@classdef record_channel_text_info
local record_channel_text_info = {}


record_channel_text_info.id = 0--ID
record_channel_text_info.channel_name =  ""--频道名称

local channel_text_info = {
   _data = {   
    [1] = {1,"世界频道",},  
    [2] = {2,"系统频道",},  
    [3] = {3,"军团频道",},  
    [4] = {4,"队伍频道",},  
    [5] = {5,"私聊频道",},  
    [6] = {7,"所有频道",},  
    [7] = {8,"军团留言板",},  
    [8] = {9,"军团宣言",},  
    [9] = {10,"军团公告",},  
    [10] = {11,"跨服号角",},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [3] = 3,  
    [4] = 4,  
    [5] = 5,  
    [7] = 6,  
    [8] = 7,  
    [9] = 8,  
    [10] = 9,  
    [11] = 10,
}

local __key_map = { 
    id = 1,
    channel_name = 2,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_channel_text_info")

        return t._raw[__key_map[k]]
    end
}


function channel_text_info.getLength()
    return #channel_text_info._data
end



function channel_text_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_channel_text_info
function channel_text_info.indexOf(index)
    if index == nil or not channel_text_info._data[index] then
        return nil
    end
    return setmetatable({_raw = channel_text_info._data[index]}, m)
end



---
--@return @class record_channel_text_info
function channel_text_info.get(id)
    
    return channel_text_info.indexOf(__index_id[ id ])
     
end



function channel_text_info.set(id, key, value)
    local record = channel_text_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function channel_text_info.get_index_data()
    return __index_id 
end

return  channel_text_info 