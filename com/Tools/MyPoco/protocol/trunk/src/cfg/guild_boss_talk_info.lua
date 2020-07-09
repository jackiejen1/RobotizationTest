---@classdef record_guild_boss_talk_info
local record_guild_boss_talk_info = {}


record_guild_boss_talk_info.id = 0--ID
record_guild_boss_talk_info.talk =  ""--气泡内容
record_guild_boss_talk_info.last_time = 0--持续时间

local guild_boss_talk_info = {
   _data = {   
    [1] = {1,"打完得奖励啊！",3,},  
    [2] = {2,"要不等最后一击？",3,},  
    [3] = {3,"这活动有点意思。",3,},  
    [4] = {4,"我打它怎么不掉血啊。",3,},  
    [5] = {5,"这家伙血好厚！",3,},  
    [6] = {6,"大家上啊！",3,},  
    [7] = {7,"好强！",3,},  
    [8] = {8,"见面就被秒了。",3,},  
    [9] = {9,"一起上！",3,},  
    [10] = {10,"打不动啊。",3,},
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
    talk = 2,
    last_time = 3,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_guild_boss_talk_info")

        return t._raw[__key_map[k]]
    end
}


function guild_boss_talk_info.getLength()
    return #guild_boss_talk_info._data
end



function guild_boss_talk_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_guild_boss_talk_info
function guild_boss_talk_info.indexOf(index)
    if index == nil or not guild_boss_talk_info._data[index] then
        return nil
    end
    return setmetatable({_raw = guild_boss_talk_info._data[index]}, m)
end



---
--@return @class record_guild_boss_talk_info
function guild_boss_talk_info.get(id)
    
    return guild_boss_talk_info.indexOf(__index_id[ id ])
     
end



function guild_boss_talk_info.set(id, key, value)
    local record = guild_boss_talk_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function guild_boss_talk_info.get_index_data()
    return __index_id 
end

return  guild_boss_talk_info 