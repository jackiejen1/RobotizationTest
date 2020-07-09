---@classdef record_wrest_integral_info
local record_wrest_integral_info = {}


record_wrest_integral_info.group = 0--积分组
record_wrest_integral_info.id = 0--id
record_wrest_integral_info.min_rank = 0--最小排名
record_wrest_integral_info.max_rank = 0--最大排名
record_wrest_integral_info.integral = 0--位置积分
record_wrest_integral_info.challenge_rank = 0--挑战排名上限，单位名

local wrest_integral_info = {
   _data = {   
    [1] = {1,1,1,1,2500,1,},  
    [2] = {1,2,2,2,2000,1,},  
    [3] = {1,3,3,3,1500,1,},  
    [4] = {1,4,4,4,1000,1,},  
    [5] = {1,5,5,5,600,1,},  
    [6] = {1,6,6,10,500,1,},  
    [7] = {1,7,11,20,400,1,},  
    [8] = {1,8,21,30,300,1,},  
    [9] = {2,1,1,1,2500,1,},  
    [10] = {2,2,2,2,2000,1,},  
    [11] = {2,3,3,3,1500,1,},  
    [12] = {2,4,4,4,1000,1,},  
    [13] = {2,5,5,5,600,1,},  
    [14] = {2,6,6,10,500,1,},  
    [15] = {2,7,11,20,400,1,},  
    [16] = {2,8,21,40,400,1,},  
    [17] = {2,9,41,50,300,1,},
    }
}

local __index_group_id = {   
    ["1_1"] = 1,  
    ["1_2"] = 2,  
    ["1_3"] = 3,  
    ["1_4"] = 4,  
    ["1_5"] = 5,  
    ["1_6"] = 6,  
    ["1_7"] = 7,  
    ["1_8"] = 8,  
    ["2_1"] = 9,  
    ["2_2"] = 10,  
    ["2_3"] = 11,  
    ["2_4"] = 12,  
    ["2_5"] = 13,  
    ["2_6"] = 14,  
    ["2_7"] = 15,  
    ["2_8"] = 16,  
    ["2_9"] = 17,
}

local __key_map = { 
    group = 1,
    id = 2,
    min_rank = 3,
    max_rank = 4,
    integral = 5,
    challenge_rank = 6,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_wrest_integral_info")

        return t._raw[__key_map[k]]
    end
}


function wrest_integral_info.getLength()
    return #wrest_integral_info._data
end



function wrest_integral_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_wrest_integral_info
function wrest_integral_info.indexOf(index)
    if index == nil or not wrest_integral_info._data[index] then
        return nil
    end
    return setmetatable({_raw = wrest_integral_info._data[index]}, m)
end



---
--@return @class record_wrest_integral_info
function wrest_integral_info.get(group,id)
    
    local k = group .. '_' .. id
    return wrest_integral_info.indexOf(__index_group_id[k])
     
end



function wrest_integral_info.set(group,id, key, value)
    local record = wrest_integral_info.get(group,id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function wrest_integral_info.get_index_data()
    return __index_group_id 
end

return  wrest_integral_info 