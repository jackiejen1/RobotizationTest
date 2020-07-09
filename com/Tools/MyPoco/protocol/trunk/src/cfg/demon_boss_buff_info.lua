---@classdef record_demon_boss_buff_info
local record_demon_boss_buff_info = {}


record_demon_boss_buff_info.id = 0--id
record_demon_boss_buff_info.camp =  ""--阵营类型
record_demon_boss_buff_info.value = 0--阵营buff
record_demon_boss_buff_info.description =  ""--描述
record_demon_boss_buff_info.ratio = 0--伤害加成

local demon_boss_buff_info = {
   _data = {   
    [1] = {1,"魏国",4000,"魏国武将及主角5倍伤害",5,},  
    [2] = {2,"蜀国",4000,"蜀国武将及主角5倍伤害",5,},  
    [3] = {3,"吴国",4000,"吴国武将及主角5倍伤害",5,},  
    [4] = {4,"群雄",4000,"群雄武将及主角5倍伤害",5,},
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
    camp = 2,
    value = 3,
    description = 4,
    ratio = 5,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_demon_boss_buff_info")

        return t._raw[__key_map[k]]
    end
}


function demon_boss_buff_info.getLength()
    return #demon_boss_buff_info._data
end



function demon_boss_buff_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_demon_boss_buff_info
function demon_boss_buff_info.indexOf(index)
    if index == nil or not demon_boss_buff_info._data[index] then
        return nil
    end
    return setmetatable({_raw = demon_boss_buff_info._data[index]}, m)
end



---
--@return @class record_demon_boss_buff_info
function demon_boss_buff_info.get(id)
    
    return demon_boss_buff_info.indexOf(__index_id[ id ])
     
end



function demon_boss_buff_info.set(id, key, value)
    local record = demon_boss_buff_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function demon_boss_buff_info.get_index_data()
    return __index_id 
end

return  demon_boss_buff_info 