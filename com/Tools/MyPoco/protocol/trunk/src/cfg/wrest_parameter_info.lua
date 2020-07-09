---@classdef record_wrest_parameter_info
local record_wrest_parameter_info = {}


record_wrest_parameter_info.id =  ""--ID
record_wrest_parameter_info.parameter = 0--参数

local wrest_parameter_info = {
   _data = {   
    [1] = {"max_cost_grass",50,},  
    [2] = {"max_zone_number",1800,},  
    [3] = {"min_zone_number",2700,},  
    [4] = {"one_move_cost",10,},  
    [5] = {"max_move_cost",50,},  
    [6] = {"one_attack_cost1",2,},  
    [7] = {"one_attack_cost2",2,},  
    [8] = {"attack_ally_cost",1,},  
    [9] = {"news_number",50,},  
    [10] = {"jewel_number",5000,},  
    [11] = {"max_challenge_rank",1,},
    }
}

local __index_id = {   
    ["max_cost_grass"] = 1,  
    ["max_zone_number"] = 2,  
    ["min_zone_number"] = 3,  
    ["one_move_cost"] = 4,  
    ["max_move_cost"] = 5,  
    ["one_attack_cost1"] = 6,  
    ["one_attack_cost2"] = 7,  
    ["attack_ally_cost"] = 8,  
    ["news_number"] = 9,  
    ["jewel_number"] = 10,  
    ["max_challenge_rank"] = 11,
}

local __key_map = { 
    id = 1,
    parameter = 2,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_wrest_parameter_info")

        return t._raw[__key_map[k]]
    end
}


function wrest_parameter_info.getLength()
    return #wrest_parameter_info._data
end



function wrest_parameter_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_wrest_parameter_info
function wrest_parameter_info.indexOf(index)
    if index == nil or not wrest_parameter_info._data[index] then
        return nil
    end
    return setmetatable({_raw = wrest_parameter_info._data[index]}, m)
end



---
--@return @class record_wrest_parameter_info
function wrest_parameter_info.get(id)
    
    return wrest_parameter_info.indexOf(__index_id[ id ])
     
end



function wrest_parameter_info.set(id, key, value)
    local record = wrest_parameter_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function wrest_parameter_info.get_index_data()
    return __index_id 
end

return  wrest_parameter_info 