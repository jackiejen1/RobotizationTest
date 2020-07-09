---@classdef record_camp_halo_info
local record_camp_halo_info = {}


record_camp_halo_info.id = 0--ID
record_camp_halo_info.unlock_type = 0--开启条件类型
record_camp_halo_info.unlock_value = 0--开启条件类型值
record_camp_halo_info.talent_skill_id = 0--光环天赋

local camp_halo_info = {
   _data = {   
    [1] = {1,1,1,120001,},  
    [2] = {2,1,2,120002,},  
    [3] = {3,1,3,120003,},  
    [4] = {4,1,4,120004,},  
    [5] = {5,1,5,120005,},
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
    talent_skill_id = 4,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_camp_halo_info")

        return t._raw[__key_map[k]]
    end
}


function camp_halo_info.getLength()
    return #camp_halo_info._data
end



function camp_halo_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_camp_halo_info
function camp_halo_info.indexOf(index)
    if index == nil or not camp_halo_info._data[index] then
        return nil
    end
    return setmetatable({_raw = camp_halo_info._data[index]}, m)
end



---
--@return @class record_camp_halo_info
function camp_halo_info.get(id)
    
    return camp_halo_info.indexOf(__index_id[ id ])
     
end



function camp_halo_info.set(id, key, value)
    local record = camp_halo_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function camp_halo_info.get_index_data()
    return __index_id 
end

return  camp_halo_info 