---@classdef record_boss_hp_info
local record_boss_hp_info = {}


record_boss_hp_info.id = 0--ID
record_boss_hp_info.team_id = 0--BOSS位置
record_boss_hp_info.name_1 =  ""--变身前名称
record_boss_hp_info.name_2 =  ""--变身后名称
record_boss_hp_info.text_1 =  ""--变身前文字内容
record_boss_hp_info.text_2 =  ""--变身后文字内容

local boss_hp_info = {
   _data = {   
    [1] = {1,2,"龙炮","龙炮（变身）","血量低于50%时变身为龙炮（变身）","0",},  
    [2] = {2,2,"魔化吕布","魔化吕布","0","0",},  
    [3] = {3,5,"董卓","魔化董卓","0","0",},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [3] = 3,
}

local __key_map = { 
    id = 1,
    team_id = 2,
    name_1 = 3,
    name_2 = 4,
    text_1 = 5,
    text_2 = 6,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_boss_hp_info")

        return t._raw[__key_map[k]]
    end
}


function boss_hp_info.getLength()
    return #boss_hp_info._data
end



function boss_hp_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_boss_hp_info
function boss_hp_info.indexOf(index)
    if index == nil or not boss_hp_info._data[index] then
        return nil
    end
    return setmetatable({_raw = boss_hp_info._data[index]}, m)
end



---
--@return @class record_boss_hp_info
function boss_hp_info.get(id)
    
    return boss_hp_info.indexOf(__index_id[ id ])
     
end



function boss_hp_info.set(id, key, value)
    local record = boss_hp_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function boss_hp_info.get_index_data()
    return __index_id 
end

return  boss_hp_info 