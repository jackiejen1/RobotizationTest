---@classdef record_dead_tower_map_info
local record_dead_tower_map_info = {}


record_dead_tower_map_info.id = 0--id
record_dead_tower_map_info.parcel = 0--地块
record_dead_tower_map_info.floor = 0--层数
record_dead_tower_map_info.map_id = 0--地图id
record_dead_tower_map_info.move_1 = 0--可前往地块1
record_dead_tower_map_info.move_2 = 0--可前往地块2
record_dead_tower_map_info.move_3 = 0--可前往地块3

local dead_tower_map_info = {
   _data = {   
    [1] = {1,1,1,1,3,4,0,},  
    [2] = {1,2,1,1,4,5,0,},  
    [3] = {1,3,2,1,6,0,0,},  
    [4] = {1,4,2,1,6,7,0,},  
    [5] = {1,5,2,1,7,0,0,},  
    [6] = {1,6,3,1,8,9,0,},  
    [7] = {1,7,3,1,9,10,0,},  
    [8] = {1,8,4,1,11,0,0,},  
    [9] = {1,9,4,1,11,12,0,},  
    [10] = {1,10,4,1,12,0,0,},  
    [11] = {1,11,5,1,13,0,0,},  
    [12] = {1,12,5,1,13,0,0,},  
    [13] = {1,13,6,1,14,15,0,},  
    [14] = {1,14,7,1,16,17,0,},  
    [15] = {1,15,7,1,17,18,0,},  
    [16] = {1,16,8,1,19,0,0,},  
    [17] = {1,17,8,1,19,20,0,},  
    [18] = {1,18,8,1,20,0,0,},  
    [19] = {1,19,9,1,21,22,0,},  
    [20] = {1,20,9,1,22,23,0,},  
    [21] = {1,21,10,1,24,0,0,},  
    [22] = {1,22,10,1,24,25,0,},  
    [23] = {1,23,10,1,25,0,0,},  
    [24] = {1,24,11,1,26,0,0,},  
    [25] = {1,25,11,1,26,0,0,},  
    [26] = {1,26,12,1,27,28,0,},  
    [27] = {1,27,13,1,29,30,0,},  
    [28] = {1,28,13,1,30,31,0,},  
    [29] = {1,29,14,1,32,0,0,},  
    [30] = {1,30,14,1,32,33,0,},  
    [31] = {1,31,14,1,33,0,0,},  
    [32] = {1,32,15,1,34,35,0,},  
    [33] = {1,33,15,1,35,36,0,},  
    [34] = {1,34,16,1,37,0,0,},  
    [35] = {1,35,16,1,37,38,0,},  
    [36] = {1,36,16,1,38,0,0,},  
    [37] = {1,37,17,1,39,0,0,},  
    [38] = {1,38,17,1,39,0,0,},  
    [39] = {1,39,18,1,0,0,0,},
    }
}

local __index_id_parcel = {   
    ["1_1"] = 1,  
    ["1_2"] = 2,  
    ["1_3"] = 3,  
    ["1_4"] = 4,  
    ["1_5"] = 5,  
    ["1_6"] = 6,  
    ["1_7"] = 7,  
    ["1_8"] = 8,  
    ["1_9"] = 9,  
    ["1_10"] = 10,  
    ["1_11"] = 11,  
    ["1_12"] = 12,  
    ["1_13"] = 13,  
    ["1_14"] = 14,  
    ["1_15"] = 15,  
    ["1_16"] = 16,  
    ["1_17"] = 17,  
    ["1_18"] = 18,  
    ["1_19"] = 19,  
    ["1_20"] = 20,  
    ["1_21"] = 21,  
    ["1_22"] = 22,  
    ["1_23"] = 23,  
    ["1_24"] = 24,  
    ["1_25"] = 25,  
    ["1_26"] = 26,  
    ["1_27"] = 27,  
    ["1_28"] = 28,  
    ["1_29"] = 29,  
    ["1_30"] = 30,  
    ["1_31"] = 31,  
    ["1_32"] = 32,  
    ["1_33"] = 33,  
    ["1_34"] = 34,  
    ["1_35"] = 35,  
    ["1_36"] = 36,  
    ["1_37"] = 37,  
    ["1_38"] = 38,  
    ["1_39"] = 39,
}

local __key_map = { 
    id = 1,
    parcel = 2,
    floor = 3,
    map_id = 4,
    move_1 = 5,
    move_2 = 6,
    move_3 = 7,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_dead_tower_map_info")

        return t._raw[__key_map[k]]
    end
}


function dead_tower_map_info.getLength()
    return #dead_tower_map_info._data
end



function dead_tower_map_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_dead_tower_map_info
function dead_tower_map_info.indexOf(index)
    if index == nil or not dead_tower_map_info._data[index] then
        return nil
    end
    return setmetatable({_raw = dead_tower_map_info._data[index]}, m)
end



---
--@return @class record_dead_tower_map_info
function dead_tower_map_info.get(id,parcel)
    
    local k = id .. '_' .. parcel
    return dead_tower_map_info.indexOf(__index_id_parcel[k])
     
end



function dead_tower_map_info.set(id,parcel, key, value)
    local record = dead_tower_map_info.get(id,parcel)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function dead_tower_map_info.get_index_data()
    return __index_id_parcel 
end

return  dead_tower_map_info 