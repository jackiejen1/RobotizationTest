---@classdef record_flamecity_award_info
local record_flamecity_award_info = {}


record_flamecity_award_info.id = 0--ID
record_flamecity_award_info.award_type = 0--奖池类型
record_flamecity_award_info.type = 0--奖励类型
record_flamecity_award_info.value = 0--奖励类型值
record_flamecity_award_info.size = 0--奖励数量
record_flamecity_award_info.num = 0--份数
record_flamecity_award_info.rare = 0--是否是珍稀物品

local flamecity_award_info = {
   _data = {   
    [1] = {1,101,3,2,250,1,1,},  
    [2] = {2,101,3,2,125,2,0,},  
    [3] = {3,101,3,2,75,4,0,},  
    [4] = {4,101,3,2,38,10,0,},  
    [5] = {5,101,3,2,25,30,0,},  
    [6] = {6,102,3,2,250,1,1,},  
    [7] = {7,102,3,2,125,2,0,},  
    [8] = {8,102,3,2,75,4,0,},  
    [9] = {9,102,3,2,38,10,0,},  
    [10] = {10,102,3,2,25,30,0,},
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
}

local __key_map = { 
    id = 1,
    award_type = 2,
    type = 3,
    value = 4,
    size = 5,
    num = 6,
    rare = 7,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_flamecity_award_info")

        return t._raw[__key_map[k]]
    end
}


function flamecity_award_info.getLength()
    return #flamecity_award_info._data
end



function flamecity_award_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_flamecity_award_info
function flamecity_award_info.indexOf(index)
    if index == nil or not flamecity_award_info._data[index] then
        return nil
    end
    return setmetatable({_raw = flamecity_award_info._data[index]}, m)
end



---
--@return @class record_flamecity_award_info
function flamecity_award_info.get(id)
    
    return flamecity_award_info.indexOf(__index_id[ id ])
     
end



function flamecity_award_info.set(id, key, value)
    local record = flamecity_award_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function flamecity_award_info.get_index_data()
    return __index_id 
end

return  flamecity_award_info 