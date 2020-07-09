---@classdef record_equipment_extract_bubble
local record_equipment_extract_bubble = {}


record_equipment_extract_bubble.id = 0--id
record_equipment_extract_bubble.play_time = 0--播放时机
record_equipment_extract_bubble.play_roles = 0--播放角色
record_equipment_extract_bubble.play_pro = 0--播放权重
record_equipment_extract_bubble.text =  ""--气泡文本

local equipment_extract_bubble = {
   _data = {   
    [1] = {1,1,1,500,"无名小辈，谁敢上前？",},  
    [2] = {2,1,2,500,"不能让典韦抢走我们的斧子。",},  
    [3] = {3,2,1,500,"吃我一戟！",},  
    [4] = {4,2,1,500,"五步之内，谁能敌我！",},  
    [5] = {5,2,2,500,"小心他的手戟！",},  
    [6] = {6,2,2,500,"我的斧子！",},  
    [7] = {7,3,1,500,"古之恶来在此！",},  
    [8] = {8,3,2,500,"这就是典韦的力量吗？",},
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
    play_time = 2,
    play_roles = 3,
    play_pro = 4,
    text = 5,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_equipment_extract_bubble")

        return t._raw[__key_map[k]]
    end
}


function equipment_extract_bubble.getLength()
    return #equipment_extract_bubble._data
end



function equipment_extract_bubble.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_equipment_extract_bubble
function equipment_extract_bubble.indexOf(index)
    if index == nil or not equipment_extract_bubble._data[index] then
        return nil
    end
    return setmetatable({_raw = equipment_extract_bubble._data[index]}, m)
end



---
--@return @class record_equipment_extract_bubble
function equipment_extract_bubble.get(id)
    
    return equipment_extract_bubble.indexOf(__index_id[ id ])
     
end



function equipment_extract_bubble.set(id, key, value)
    local record = equipment_extract_bubble.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function equipment_extract_bubble.get_index_data()
    return __index_id 
end

return  equipment_extract_bubble 