---@classdef record_group_battle_text
local record_group_battle_text = {}


record_group_battle_text.id = 0--ID
record_group_battle_text.type = 0--触发类型
record_group_battle_text.trigger_type = 0--触发值
record_group_battle_text.text =  ""--文本

local group_battle_text = {
   _data = {   
    [1] = {1,1,1,"击败1人",},  
    [2] = {2,1,2,"击败2人，势不可挡！",},  
    [3] = {3,1,3,"击败3人，勇冠三军！",},  
    [4] = {4,1,4,"击败4人，所向披靡！",},
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
    type = 2,
    trigger_type = 3,
    text = 4,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_group_battle_text")

        return t._raw[__key_map[k]]
    end
}


function group_battle_text.getLength()
    return #group_battle_text._data
end



function group_battle_text.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_group_battle_text
function group_battle_text.indexOf(index)
    if index == nil or not group_battle_text._data[index] then
        return nil
    end
    return setmetatable({_raw = group_battle_text._data[index]}, m)
end



---
--@return @class record_group_battle_text
function group_battle_text.get(id)
    
    return group_battle_text.indexOf(__index_id[ id ])
     
end



function group_battle_text.set(id, key, value)
    local record = group_battle_text.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function group_battle_text.get_index_data()
    return __index_id 
end

return  group_battle_text 