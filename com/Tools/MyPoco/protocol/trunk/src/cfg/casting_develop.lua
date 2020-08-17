---@classdef record_casting_develop
local record_casting_develop = {}


record_casting_develop.id = 0--铸灵id
record_casting_develop.sub_id = 0--铸灵子id
record_casting_develop.cost_type = 0--消耗道具类型
record_casting_develop.cost_value = 0--消耗道具id
record_casting_develop.casting_experience = 0--提供的经验

local casting_develop = {
   _data = {   
    [1] = {10011,1,2,401,8,},  
    [2] = {10011,2,2,411,8,},  
    [3] = {10012,3,2,401,8,},  
    [4] = {10012,4,2,411,8,},  
    [5] = {10013,5,2,401,8,},  
    [6] = {10013,6,2,411,8,},  
    [7] = {10013,7,2,421,20,},  
    [8] = {10014,8,2,421,20,},  
    [9] = {10015,9,2,421,20,},  
    [10] = {10021,10,2,402,8,},  
    [11] = {10021,11,2,412,8,},  
    [12] = {10022,12,2,402,8,},  
    [13] = {10022,13,2,412,8,},  
    [14] = {10023,14,2,402,8,},  
    [15] = {10023,15,2,412,8,},  
    [16] = {10023,16,2,422,20,},  
    [17] = {10024,17,2,422,20,},  
    [18] = {10025,18,2,422,20,},  
    [19] = {10031,19,2,403,8,},  
    [20] = {10031,20,2,413,8,},  
    [21] = {10032,21,2,403,8,},  
    [22] = {10032,22,2,413,8,},  
    [23] = {10033,23,2,403,8,},  
    [24] = {10033,24,2,413,8,},  
    [25] = {10033,25,2,423,20,},  
    [26] = {10034,26,2,423,20,},  
    [27] = {10035,27,2,423,20,},  
    [28] = {10041,28,2,404,8,},  
    [29] = {10041,29,2,414,8,},  
    [30] = {10042,30,2,404,8,},  
    [31] = {10042,31,2,414,8,},  
    [32] = {10043,32,2,404,8,},  
    [33] = {10043,33,2,414,8,},  
    [34] = {10043,34,2,424,20,},  
    [35] = {10044,35,2,424,20,},  
    [36] = {10045,36,2,424,20,},  
    [37] = {20011,37,2,22010,10,},  
    [38] = {20011,38,2,22020,10,},  
    [39] = {20011,39,2,22030,10,},  
    [40] = {20011,40,2,22040,10,},  
    [41] = {20011,41,2,22050,10,},  
    [42] = {20011,42,2,22060,10,},  
    [43] = {20021,43,2,23010,20,},  
    [44] = {20021,44,2,23020,20,},  
    [45] = {20021,45,2,23030,20,},  
    [46] = {20021,46,2,23040,20,},  
    [47] = {20021,47,2,23050,20,},  
    [48] = {20021,48,2,23060,20,},
    }
}

local __index_id_sub_id = {   
    ["10011_1"] = 1,  
    ["10011_2"] = 2,  
    ["10012_3"] = 3,  
    ["10012_4"] = 4,  
    ["10013_5"] = 5,  
    ["10013_6"] = 6,  
    ["10013_7"] = 7,  
    ["10014_8"] = 8,  
    ["10015_9"] = 9,  
    ["10021_10"] = 10,  
    ["10021_11"] = 11,  
    ["10022_12"] = 12,  
    ["10022_13"] = 13,  
    ["10023_14"] = 14,  
    ["10023_15"] = 15,  
    ["10023_16"] = 16,  
    ["10024_17"] = 17,  
    ["10025_18"] = 18,  
    ["10031_19"] = 19,  
    ["10031_20"] = 20,  
    ["10032_21"] = 21,  
    ["10032_22"] = 22,  
    ["10033_23"] = 23,  
    ["10033_24"] = 24,  
    ["10033_25"] = 25,  
    ["10034_26"] = 26,  
    ["10035_27"] = 27,  
    ["10041_28"] = 28,  
    ["10041_29"] = 29,  
    ["10042_30"] = 30,  
    ["10042_31"] = 31,  
    ["10043_32"] = 32,  
    ["10043_33"] = 33,  
    ["10043_34"] = 34,  
    ["10044_35"] = 35,  
    ["10045_36"] = 36,  
    ["20011_37"] = 37,  
    ["20011_38"] = 38,  
    ["20011_39"] = 39,  
    ["20011_40"] = 40,  
    ["20011_41"] = 41,  
    ["20011_42"] = 42,  
    ["20021_43"] = 43,  
    ["20021_44"] = 44,  
    ["20021_45"] = 45,  
    ["20021_46"] = 46,  
    ["20021_47"] = 47,  
    ["20021_48"] = 48,
}

local __key_map = { 
    id = 1,
    sub_id = 2,
    cost_type = 3,
    cost_value = 4,
    casting_experience = 5,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_casting_develop")

        return t._raw[__key_map[k]]
    end
}


function casting_develop.getLength()
    return #casting_develop._data
end



function casting_develop.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_casting_develop
function casting_develop.indexOf(index)
    if index == nil or not casting_develop._data[index] then
        return nil
    end
    return setmetatable({_raw = casting_develop._data[index]}, m)
end



---
--@return @class record_casting_develop
function casting_develop.get(id,sub_id)
    
    local k = id .. '_' .. sub_id
    return casting_develop.indexOf(__index_id_sub_id[k])
     
end



function casting_develop.set(id,sub_id, key, value)
    local record = casting_develop.get(id,sub_id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function casting_develop.get_index_data()
    return __index_id_sub_id 
end

return  casting_develop 