---@classdef record_phonebind_award_info
local record_phonebind_award_info = {}


record_phonebind_award_info.id = 0--ID
record_phonebind_award_info.award_type_1 = 0--奖励类型1
record_phonebind_award_info.award_value_1 = 0--奖励类型值1
record_phonebind_award_info.award_size_1 = 0--奖励数量1
record_phonebind_award_info.award_type_2 = 0--奖励类型2
record_phonebind_award_info.award_value_2 = 0--奖励类型值2
record_phonebind_award_info.award_size_2 = 0--奖励数量2
record_phonebind_award_info.award_type_3 = 0--奖励类型3
record_phonebind_award_info.award_value_3 = 0--奖励类型值3
record_phonebind_award_info.award_size_3 = 0--奖励数量3

local phonebind_award_info = {
   _data = {   
    [1] = {1,999,0,300,3,21,10,1,3,200000,},  
    [2] = {2,999,0,100,3,35,300,1,3,100000,},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,
}

local __key_map = { 
    id = 1,
    award_type_1 = 2,
    award_value_1 = 3,
    award_size_1 = 4,
    award_type_2 = 5,
    award_value_2 = 6,
    award_size_2 = 7,
    award_type_3 = 8,
    award_value_3 = 9,
    award_size_3 = 10,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_phonebind_award_info")

        return t._raw[__key_map[k]]
    end
}


function phonebind_award_info.getLength()
    return #phonebind_award_info._data
end



function phonebind_award_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_phonebind_award_info
function phonebind_award_info.indexOf(index)
    if index == nil or not phonebind_award_info._data[index] then
        return nil
    end
    return setmetatable({_raw = phonebind_award_info._data[index]}, m)
end



---
--@return @class record_phonebind_award_info
function phonebind_award_info.get(id)
    
    return phonebind_award_info.indexOf(__index_id[ id ])
     
end



function phonebind_award_info.set(id, key, value)
    local record = phonebind_award_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function phonebind_award_info.get_index_data()
    return __index_id 
end

return  phonebind_award_info 