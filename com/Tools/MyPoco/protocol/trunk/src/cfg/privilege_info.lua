---@classdef record_privilege_info
local record_privilege_info = {}


record_privilege_info.id = 0--特权ID
record_privilege_info.name =  ""--特权名称
record_privilege_info.type = 0--功能类型
record_privilege_info.value = 0--类型值

local privilege_info = {
   _data = {   
    [1] = {1,"主线副本普通关卡首次挑战可跳过战斗",1,0,},  
    [2] = {2,"日常副本武将经验产出增加100%",2,1000,},  
    [3] = {3,"日常副本银币副本产出增加100%",3,1000,},  
    [4] = {4,"日常副本合击精华产出增加100%",4,1000,},  
    [5] = {5,"日常副本宝物经验产出增加100%",5,1000,},  
    [6] = {6,"无双试炼开启扫荡功能",6,0,},  
    [7] = {7,"日常副本神兵锻造石产出增加100%",7,1000,},
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
}

local __key_map = { 
    id = 1,
    name = 2,
    type = 3,
    value = 4,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_privilege_info")

        return t._raw[__key_map[k]]
    end
}


function privilege_info.getLength()
    return #privilege_info._data
end



function privilege_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_privilege_info
function privilege_info.indexOf(index)
    if index == nil or not privilege_info._data[index] then
        return nil
    end
    return setmetatable({_raw = privilege_info._data[index]}, m)
end



---
--@return @class record_privilege_info
function privilege_info.get(id)
    
    return privilege_info.indexOf(__index_id[ id ])
     
end



function privilege_info.set(id, key, value)
    local record = privilege_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function privilege_info.get_index_data()
    return __index_id 
end

return  privilege_info 