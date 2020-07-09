---@classdef record_peakarena_unite_token_info
local record_peakarena_unite_token_info = {}


record_peakarena_unite_token_info.id = 0--ID
record_peakarena_unite_token_info.token_group_id = 0--激活合击库
record_peakarena_unite_token_info.token_skill_id = 0--合击兵符ID

local peakarena_unite_token_info = {
   _data = {   
    [1] = {1,1,50015,},  
    [2] = {2,1,50025,},  
    [3] = {3,1,50035,},  
    [4] = {4,2,50045,},  
    [5] = {5,2,50055,},  
    [6] = {6,2,50065,},  
    [7] = {7,2,50075,},  
    [8] = {8,3,50085,},  
    [9] = {9,3,50095,},  
    [10] = {10,3,50105,},  
    [11] = {11,4,50115,},  
    [12] = {12,4,50125,},  
    [13] = {13,4,50135,},  
    [14] = {14,4,50145,},  
    [15] = {15,5,50155,},  
    [16] = {16,5,50165,},  
    [17] = {17,5,50175,},  
    [18] = {18,5,50185,},  
    [19] = {19,6,50195,},  
    [20] = {20,6,50205,},  
    [21] = {21,6,50215,},  
    [22] = {22,6,50225,},
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
    [17] = 17,  
    [18] = 18,  
    [19] = 19,  
    [20] = 20,  
    [21] = 21,  
    [22] = 22,
}

local __key_map = { 
    id = 1,
    token_group_id = 2,
    token_skill_id = 3,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_peakarena_unite_token_info")

        return t._raw[__key_map[k]]
    end
}


function peakarena_unite_token_info.getLength()
    return #peakarena_unite_token_info._data
end



function peakarena_unite_token_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_peakarena_unite_token_info
function peakarena_unite_token_info.indexOf(index)
    if index == nil or not peakarena_unite_token_info._data[index] then
        return nil
    end
    return setmetatable({_raw = peakarena_unite_token_info._data[index]}, m)
end



---
--@return @class record_peakarena_unite_token_info
function peakarena_unite_token_info.get(id)
    
    return peakarena_unite_token_info.indexOf(__index_id[ id ])
     
end



function peakarena_unite_token_info.set(id, key, value)
    local record = peakarena_unite_token_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function peakarena_unite_token_info.get_index_data()
    return __index_id 
end

return  peakarena_unite_token_info 