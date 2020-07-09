---@classdef record_auction_rate_info
local record_auction_rate_info = {}


record_auction_rate_info.id = 0--ID
record_auction_rate_info.type = 0--分红类型
record_auction_rate_info.parameter_1 =  ""--排名参数1
record_auction_rate_info.parameter_2 =  ""--排名参数2
record_auction_rate_info.rate = 0--分红倍率

local auction_rate_info = {
   _data = {   
    [1] = {101,1,"99999","0",1000,},  
    [2] = {201,2,"99999","99999",1000,},  
    [3] = {301,3,"99999","99999",1000,},
    }
}

local __index_id = {   
    [101] = 1,  
    [201] = 2,  
    [301] = 3,
}

local __key_map = { 
    id = 1,
    type = 2,
    parameter_1 = 3,
    parameter_2 = 4,
    rate = 5,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_auction_rate_info")

        return t._raw[__key_map[k]]
    end
}


function auction_rate_info.getLength()
    return #auction_rate_info._data
end



function auction_rate_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_auction_rate_info
function auction_rate_info.indexOf(index)
    if index == nil or not auction_rate_info._data[index] then
        return nil
    end
    return setmetatable({_raw = auction_rate_info._data[index]}, m)
end



---
--@return @class record_auction_rate_info
function auction_rate_info.get(id)
    
    return auction_rate_info.indexOf(__index_id[ id ])
     
end



function auction_rate_info.set(id, key, value)
    local record = auction_rate_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function auction_rate_info.get_index_data()
    return __index_id 
end

return  auction_rate_info 