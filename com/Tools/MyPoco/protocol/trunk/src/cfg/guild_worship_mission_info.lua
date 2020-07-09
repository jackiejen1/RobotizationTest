---@classdef record_guild_worship_mission_info
local record_guild_worship_mission_info = {}


record_guild_worship_mission_info.id = 0--id
record_guild_worship_mission_info.level = 0--军团等级
record_guild_worship_mission_info.type = 0--类型
record_guild_worship_mission_info.name =  ""--名称
record_guild_worship_mission_info.mission_type = 0--任务类型
record_guild_worship_mission_info.mission_value = 0--任务类型值
record_guild_worship_mission_info.des =  ""--任务描述
record_guild_worship_mission_info.weight = 0--刷新权重
record_guild_worship_mission_info.worship_value = 0--祭天进度
record_guild_worship_mission_info.guild_exp = 0--军团经验
record_guild_worship_mission_info.award = 0--奖励
record_guild_worship_mission_info.route = 0--跳转

local guild_worship_mission_info = {
   _data = {   
    [1] = {1,1,1,"贡献任务",0,0,"消耗元宝贡献，增加军团经验",1000,1,20,210001,61,},  
    [2] = {2,1,2,"赠礼任务",1077,3,"为军团成员赠送礼物3次",1000,3,30,210002,61,},  
    [3] = {3,1,3,"铸像任务",1079,3,"消耗3个军团铸像石",1000,5,50,210003,61,},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [3] = 3,
}

local __key_map = { 
    id = 1,
    level = 2,
    type = 3,
    name = 4,
    mission_type = 5,
    mission_value = 6,
    des = 7,
    weight = 8,
    worship_value = 9,
    guild_exp = 10,
    award = 11,
    route = 12,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_guild_worship_mission_info")

        return t._raw[__key_map[k]]
    end
}


function guild_worship_mission_info.getLength()
    return #guild_worship_mission_info._data
end



function guild_worship_mission_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_guild_worship_mission_info
function guild_worship_mission_info.indexOf(index)
    if index == nil or not guild_worship_mission_info._data[index] then
        return nil
    end
    return setmetatable({_raw = guild_worship_mission_info._data[index]}, m)
end



---
--@return @class record_guild_worship_mission_info
function guild_worship_mission_info.get(id)
    
    return guild_worship_mission_info.indexOf(__index_id[ id ])
     
end



function guild_worship_mission_info.set(id, key, value)
    local record = guild_worship_mission_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function guild_worship_mission_info.get_index_data()
    return __index_id 
end

return  guild_worship_mission_info 