---@classdef record_guild_icon_info
local record_guild_icon_info = {}


record_guild_icon_info.id = 0--id
record_guild_icon_info.name =  ""--名称
record_guild_icon_info.type = 0--类型
record_guild_icon_info.open_type = 0--开启类型
record_guild_icon_info.open_value = 0--开启类型值
record_guild_icon_info.res = 0--资源
record_guild_icon_info.description =  ""--描述

local guild_icon_info = {
   _data = {   
    [1] = {1,"魏武之剑",1,1,0,1,"大争乱世，魏武帝以利剑扫清六合，席卷八荒",},  
    [2] = {2,"江东之火",1,1,0,2,"英雄辈出的时代，江东之火不息，热血的意志不灭",},  
    [3] = {3,"蜀汉之龙",1,1,0,3,"承袭汉统，蜀汉英雄以龙为尊，龙啸天地间",},  
    [4] = {4,"群雄之魂",1,1,0,4,"三国乱世，群雄争霸，问鼎之人方是英雄",},  
    [5] = {5,"木质边框",2,1,0,1001,"木质的边框，处处显示着普通",},  
    [6] = {6,"蓝晶边框",2,1,3,1002,"以蓝晶所制的边框，透露出深邃的颜色,军团3级开启。",},  
    [7] = {7,"紫晶边框",2,1,5,1003,"以紫晶所制的边框，彰显出神秘的气质,军团5级开启。",},  
    [8] = {8,"黄金边框",2,1,7,1004,"以黄金所制的边框，拥有华丽的质感,军团7级开启。",},
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
}

local __key_map = { 
    id = 1,
    name = 2,
    type = 3,
    open_type = 4,
    open_value = 5,
    res = 6,
    description = 7,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_guild_icon_info")

        return t._raw[__key_map[k]]
    end
}


function guild_icon_info.getLength()
    return #guild_icon_info._data
end



function guild_icon_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_guild_icon_info
function guild_icon_info.indexOf(index)
    if index == nil or not guild_icon_info._data[index] then
        return nil
    end
    return setmetatable({_raw = guild_icon_info._data[index]}, m)
end



---
--@return @class record_guild_icon_info
function guild_icon_info.get(id)
    
    return guild_icon_info.indexOf(__index_id[ id ])
     
end



function guild_icon_info.set(id, key, value)
    local record = guild_icon_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function guild_icon_info.get_index_data()
    return __index_id 
end

return  guild_icon_info 