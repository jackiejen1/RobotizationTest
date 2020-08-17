---@classdef record_guild_right_info
local record_guild_right_info = {}


record_guild_right_info.id = 0--id
record_guild_right_info.name =  ""--军团官职名称
record_guild_right_info.grade = 0--官职排序
record_guild_right_info.num = 0--官职人数
record_guild_right_info.appoint = 0--是否有任命和罢免权限
record_guild_right_info.apply_approve = 0--是否有审核权限
record_guild_right_info.apply_set = 0--是否有设置申请权限
record_guild_right_info.change = 0--是否有修改权限
record_guild_right_info.kick = 0--是否有踢出下级成员权限
record_guild_right_info.impeach = 0--是否有弹劾军团长权限
record_guild_right_info.attorn = 0--是否有转让军团长权限
record_guild_right_info.dissolve = 0--是否有解散军团的权限
record_guild_right_info.mass = 0--是否有权限集结
record_guild_right_info.target_set = 0--是否有权限设定进攻目标
record_guild_right_info.icon =  ""--官职icon
record_guild_right_info.description =  ""--详细描述

local guild_right_info = {
   _data = {   
    [1] = {1,"军团长",1,1,1,1,1,1,1,0,1,1,1,1,"0","军团的领袖和主心骨",},  
    [2] = {2,"副军团长",2,1,1,1,1,1,1,3,0,0,1,1,"0","军团长的左右手",},  
    [3] = {3,"军团精英",10,5,0,0,0,0,0,5,0,0,0,0,"0","军团中的骨干成员",},  
    [4] = {4,"军团成员",20,50,0,0,0,0,0,7,0,0,0,0,"0","普通的军团成员",},
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
    grade = 3,
    num = 4,
    appoint = 5,
    apply_approve = 6,
    apply_set = 7,
    change = 8,
    kick = 9,
    impeach = 10,
    attorn = 11,
    dissolve = 12,
    mass = 13,
    target_set = 14,
    icon = 15,
    description = 16,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_guild_right_info")

        return t._raw[__key_map[k]]
    end
}


function guild_right_info.getLength()
    return #guild_right_info._data
end



function guild_right_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_guild_right_info
function guild_right_info.indexOf(index)
    if index == nil or not guild_right_info._data[index] then
        return nil
    end
    return setmetatable({_raw = guild_right_info._data[index]}, m)
end



---
--@return @class record_guild_right_info
function guild_right_info.get(id)
    
    return guild_right_info.indexOf(__index_id[ id ])
     
end



function guild_right_info.set(id, key, value)
    local record = guild_right_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function guild_right_info.get_index_data()
    return __index_id 
end

return  guild_right_info 