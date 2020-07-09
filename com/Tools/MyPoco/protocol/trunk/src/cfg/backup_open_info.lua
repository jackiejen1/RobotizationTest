---@classdef record_backup_open_info
local record_backup_open_info = {}


record_backup_open_info.id = 0--ID
record_backup_open_info.unlock_type = 0--开启条件类型
record_backup_open_info.unlock_value = 0--开启类型值
record_backup_open_info.lock_des =  ""--未开启描述
record_backup_open_info.show_unlock_type = 0--显示条件类型
record_backup_open_info.show_unlock_value = 0--显示类型值

local backup_open_info = {
   _data = {   
    [1] = {1,1,1,"上阵1个金将开启",2,1,},  
    [2] = {2,1,2,"上阵2个金将开启",2,1,},  
    [3] = {3,1,3,"上阵3个金将开启",2,1,},  
    [4] = {4,1,4,"上阵4个金将开启",2,1,},  
    [5] = {5,1,5,"上阵5个金将开启",2,1,},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [3] = 3,  
    [4] = 4,  
    [5] = 5,
}

local __key_map = { 
    id = 1,
    unlock_type = 2,
    unlock_value = 3,
    lock_des = 4,
    show_unlock_type = 5,
    show_unlock_value = 6,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_backup_open_info")

        return t._raw[__key_map[k]]
    end
}


function backup_open_info.getLength()
    return #backup_open_info._data
end



function backup_open_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_backup_open_info
function backup_open_info.indexOf(index)
    if index == nil or not backup_open_info._data[index] then
        return nil
    end
    return setmetatable({_raw = backup_open_info._data[index]}, m)
end



---
--@return @class record_backup_open_info
function backup_open_info.get(id)
    
    return backup_open_info.indexOf(__index_id[ id ])
     
end



function backup_open_info.set(id, key, value)
    local record = backup_open_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function backup_open_info.get_index_data()
    return __index_id 
end

return  backup_open_info 