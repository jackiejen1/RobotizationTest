---@classdef record_wrest_task_info
local record_wrest_task_info = {}


record_wrest_task_info.id = 0--id
record_wrest_task_info.name =  ""--目标条件名称
record_wrest_task_info.task_des =  ""--大势描述
record_wrest_task_info.time = 0--持续时间

local wrest_task_info = {
   _data = {   
    [1] = {1,"烽烟四起","天下将倾，烽烟四起，诸侯纷纷起兵。",288000,},  
    [2] = {2,"盟主争夺","十八路诸侯汇聚一堂，争夺盟主之位。",295200,},  
    [3] = {3,"鏖战洛阳","诸侯联盟冲关夺隘、鏖战洛阳。",547200,},  
    [4] = {4,"雄踞天下","胜负已分，胜者雄踞天下，睥睨四方。",554400,},
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
    task_des = 3,
    time = 4,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_wrest_task_info")

        return t._raw[__key_map[k]]
    end
}


function wrest_task_info.getLength()
    return #wrest_task_info._data
end



function wrest_task_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_wrest_task_info
function wrest_task_info.indexOf(index)
    if index == nil or not wrest_task_info._data[index] then
        return nil
    end
    return setmetatable({_raw = wrest_task_info._data[index]}, m)
end



---
--@return @class record_wrest_task_info
function wrest_task_info.get(id)
    
    return wrest_task_info.indexOf(__index_id[ id ])
     
end



function wrest_task_info.set(id, key, value)
    local record = wrest_task_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function wrest_task_info.get_index_data()
    return __index_id 
end

return  wrest_task_info 