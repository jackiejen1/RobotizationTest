---@classdef record_storm_city_robot_info
local record_storm_city_robot_info = {}


record_storm_city_robot_info.id = 0--id
record_storm_city_robot_info.city_id = 0--城池类型
record_storm_city_robot_info.rank = 0--排名段（向下）
record_storm_city_robot_info.robot_id = 0--机器人ID

local storm_city_robot_info = {
   _data = {   
    [1] = {101,1001,1,30009,},  
    [2] = {102,1001,2,30008,},  
    [3] = {103,1001,4,30007,},  
    [4] = {104,1001,6,30006,},  
    [5] = {105,1001,11,30005,},  
    [6] = {106,1001,31,30004,},  
    [7] = {107,1001,101,30003,},  
    [8] = {108,1001,301,30002,},  
    [9] = {109,1001,801,30001,},  
    [10] = {201,1002,1,31009,},  
    [11] = {202,1002,2,31008,},  
    [12] = {203,1002,4,31007,},  
    [13] = {204,1002,6,31006,},  
    [14] = {205,1002,11,31005,},  
    [15] = {206,1002,31,31004,},  
    [16] = {207,1002,101,31003,},  
    [17] = {208,1002,301,31002,},  
    [18] = {209,1002,801,31001,},  
    [19] = {301,1003,1,32009,},  
    [20] = {302,1003,2,32008,},  
    [21] = {303,1003,4,32007,},  
    [22] = {304,1003,6,32006,},  
    [23] = {305,1003,11,32005,},  
    [24] = {306,1003,31,32004,},  
    [25] = {307,1003,101,32003,},  
    [26] = {308,1003,301,32002,},  
    [27] = {309,1003,801,32001,},
    }
}

local __index_id = {   
    [101] = 1,  
    [102] = 2,  
    [103] = 3,  
    [104] = 4,  
    [105] = 5,  
    [106] = 6,  
    [107] = 7,  
    [108] = 8,  
    [109] = 9,  
    [201] = 10,  
    [202] = 11,  
    [203] = 12,  
    [204] = 13,  
    [205] = 14,  
    [206] = 15,  
    [207] = 16,  
    [208] = 17,  
    [209] = 18,  
    [301] = 19,  
    [302] = 20,  
    [303] = 21,  
    [304] = 22,  
    [305] = 23,  
    [306] = 24,  
    [307] = 25,  
    [308] = 26,  
    [309] = 27,
}

local __key_map = { 
    id = 1,
    city_id = 2,
    rank = 3,
    robot_id = 4,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_storm_city_robot_info")

        return t._raw[__key_map[k]]
    end
}


function storm_city_robot_info.getLength()
    return #storm_city_robot_info._data
end



function storm_city_robot_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_storm_city_robot_info
function storm_city_robot_info.indexOf(index)
    if index == nil or not storm_city_robot_info._data[index] then
        return nil
    end
    return setmetatable({_raw = storm_city_robot_info._data[index]}, m)
end



---
--@return @class record_storm_city_robot_info
function storm_city_robot_info.get(id)
    
    return storm_city_robot_info.indexOf(__index_id[ id ])
     
end



function storm_city_robot_info.set(id, key, value)
    local record = storm_city_robot_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function storm_city_robot_info.get_index_data()
    return __index_id 
end

return  storm_city_robot_info 