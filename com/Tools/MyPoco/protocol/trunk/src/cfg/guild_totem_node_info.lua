---@classdef record_guild_totem_node_info
local record_guild_totem_node_info = {}


record_guild_totem_node_info.id = 0--节点ID
record_guild_totem_node_info.name =  ""--节点名称
record_guild_totem_node_info.res_id = 0--资源
record_guild_totem_node_info.upgrade_group = 0--升级模版
record_guild_totem_node_info.affect_type = 0--节点属性类型
record_guild_totem_node_info.affect_value = 0--节点属性类型值

local guild_totem_node_info = {
   _data = {   
    [1] = {1,"风神祝祭",1000,1,1,24000,},  
    [2] = {2,"火神祝祭",2000,1,2,1260,},  
    [3] = {3,"水神祝祭",3000,1,3,630,},  
    [4] = {4,"土神祝祭",4000,1,4,630,},  
    [5] = {5,"风神祝祭",1000,2,11,6,},  
    [6] = {6,"火神祝祭",2000,2,12,6,},  
    [7] = {7,"水神祝祭",3000,2,13,6,},  
    [8] = {8,"土神祝祭",4000,2,14,6,},  
    [9] = {9,"风神祝祭",1000,3,105,8,},  
    [10] = {10,"火神祝祭",2000,3,106,8,},  
    [11] = {11,"水神祝祭",3000,3,201,8,},  
    [12] = {12,"土神祝祭",4000,3,202,8,},  
    [13] = {13,"风神祝祭",1000,4,103,8,},  
    [14] = {14,"火神祝祭",2000,4,104,8,},  
    [15] = {15,"水神祝祭",3000,4,203,8,},  
    [16] = {16,"土神祝祭",4000,4,204,8,},
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
    [11] = 11,  
    [12] = 12,  
    [13] = 13,  
    [14] = 14,  
    [15] = 15,  
    [16] = 16,
}

local __key_map = { 
    id = 1,
    name = 2,
    res_id = 3,
    upgrade_group = 4,
    affect_type = 5,
    affect_value = 6,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_guild_totem_node_info")

        return t._raw[__key_map[k]]
    end
}


function guild_totem_node_info.getLength()
    return #guild_totem_node_info._data
end



function guild_totem_node_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_guild_totem_node_info
function guild_totem_node_info.indexOf(index)
    if index == nil or not guild_totem_node_info._data[index] then
        return nil
    end
    return setmetatable({_raw = guild_totem_node_info._data[index]}, m)
end



---
--@return @class record_guild_totem_node_info
function guild_totem_node_info.get(id)
    
    return guild_totem_node_info.indexOf(__index_id[ id ])
     
end



function guild_totem_node_info.set(id, key, value)
    local record = guild_totem_node_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function guild_totem_node_info.get_index_data()
    return __index_id 
end

return  guild_totem_node_info 