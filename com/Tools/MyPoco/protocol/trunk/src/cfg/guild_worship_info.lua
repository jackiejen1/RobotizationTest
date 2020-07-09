---@classdef record_guild_worship_info
local record_guild_worship_info = {}


record_guild_worship_info.id = 0--ID
record_guild_worship_info.name =  ""--名称
record_guild_worship_info.cost_type = 0--购买消耗类型
record_guild_worship_info.cost_value = 0--购买消耗类型值
record_guild_worship_info.cost_size = 0--购买消耗数量
record_guild_worship_info.worship_value = 0--祭天进度
record_guild_worship_info.guild_integral = 0--军团贡献
record_guild_worship_info.guild_exp = 0--军团经验
record_guild_worship_info.crit_chance = 0--暴击概率
record_guild_worship_info.crit_multiplier  = 0--暴击倍数

local guild_worship_info = {
   _data = {   
    [1] = {1,"酒澧祭之",1,3,10000,1,100,20,200,500,},  
    [2] = {2,"黄琮礼地",999,0,50,3,600,80,200,500,},  
    [3] = {3,"苍璧礼天",999,0,298,6,4000,400,200,500,},
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
    cost_type = 3,
    cost_value = 4,
    cost_size = 5,
    worship_value = 6,
    guild_integral = 7,
    guild_exp = 8,
    crit_chance = 9,
    crit_multiplier  = 10,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_guild_worship_info")

        return t._raw[__key_map[k]]
    end
}


function guild_worship_info.getLength()
    return #guild_worship_info._data
end



function guild_worship_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_guild_worship_info
function guild_worship_info.indexOf(index)
    if index == nil or not guild_worship_info._data[index] then
        return nil
    end
    return setmetatable({_raw = guild_worship_info._data[index]}, m)
end



---
--@return @class record_guild_worship_info
function guild_worship_info.get(id)
    
    return guild_worship_info.indexOf(__index_id[ id ])
     
end



function guild_worship_info.set(id, key, value)
    local record = guild_worship_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function guild_worship_info.get_index_data()
    return __index_id 
end

return  guild_worship_info 