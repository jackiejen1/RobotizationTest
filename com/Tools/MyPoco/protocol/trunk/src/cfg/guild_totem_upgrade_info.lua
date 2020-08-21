---@classdef record_guild_totem_upgrade_info
local record_guild_totem_upgrade_info = {}


record_guild_totem_upgrade_info.id = 0--升级组ID
record_guild_totem_upgrade_info.level = 0--等级
record_guild_totem_upgrade_info.cost_type1 = 0--升级消耗类型1
record_guild_totem_upgrade_info.cost_value1 = 0--升级消耗类型值1
record_guild_totem_upgrade_info.cost_size1 = 0--升级消耗数量1
record_guild_totem_upgrade_info.cost_type2 = 0--升级消耗类型2
record_guild_totem_upgrade_info.cost_value2 = 0--升级消耗类型值2
record_guild_totem_upgrade_info.cost_size2 = 0--升级消耗数量2

local guild_totem_upgrade_info = {
   _data = {   
    [1] = {1,0,1,11,4100,0,0,0,},  
    [2] = {1,1,1,11,4900,0,0,0,},  
    [3] = {1,2,1,11,5800,0,0,0,},  
    [4] = {1,3,1,11,6600,0,0,0,},  
    [5] = {1,4,1,11,7400,0,0,0,},  
    [6] = {1,5,1,11,9900,0,0,0,},  
    [7] = {1,6,1,11,10900,0,0,0,},  
    [8] = {1,7,1,11,11900,0,0,0,},  
    [9] = {1,8,1,11,12900,0,0,0,},  
    [10] = {1,9,1,11,13800,0,0,0,},  
    [11] = {1,10,1,11,17800,0,0,0,},  
    [12] = {1,11,1,11,19000,0,0,0,},  
    [13] = {1,12,1,11,20200,0,0,0,},  
    [14] = {1,13,1,11,21400,0,0,0,},  
    [15] = {1,14,1,11,22500,0,0,0,},  
    [16] = {1,15,1,11,51300,0,0,0,},  
    [17] = {1,16,1,11,54100,0,0,0,},  
    [18] = {1,17,1,11,56900,0,0,0,},  
    [19] = {1,18,1,11,59800,0,0,0,},  
    [20] = {1,19,1,11,62600,0,0,0,},  
    [21] = {1,20,1,11,78600,0,0,0,},  
    [22] = {1,21,1,11,82000,0,0,0,},  
    [23] = {1,22,1,11,85400,0,0,0,},  
    [24] = {1,23,1,11,88800,0,0,0,},  
    [25] = {1,24,1,11,92300,0,0,0,},  
    [26] = {1,25,1,11,0,0,0,0,},  
    [27] = {2,0,1,11,12400,0,0,0,},  
    [28] = {2,1,1,11,14800,0,0,0,},  
    [29] = {2,2,1,11,17300,0,0,0,},  
    [30] = {2,3,1,11,19800,0,0,0,},  
    [31] = {2,4,1,11,22200,0,0,0,},  
    [32] = {2,5,1,11,29700,0,0,0,},  
    [33] = {2,6,1,11,32600,0,0,0,},  
    [34] = {2,7,1,11,35600,0,0,0,},  
    [35] = {2,8,1,11,38600,0,0,0,},  
    [36] = {2,9,1,11,41500,0,0,0,},  
    [37] = {2,10,1,11,53400,0,0,0,},  
    [38] = {2,11,1,11,56900,0,0,0,},  
    [39] = {2,12,1,11,60500,0,0,0,},  
    [40] = {2,13,1,11,64100,0,0,0,},  
    [41] = {2,14,1,11,67600,0,0,0,},  
    [42] = {2,15,1,11,99100,0,0,0,},  
    [43] = {2,16,1,11,104200,0,0,0,},  
    [44] = {2,17,1,11,109300,0,0,0,},  
    [45] = {2,18,1,11,114500,0,0,0,},  
    [46] = {2,19,1,11,119600,0,0,0,},  
    [47] = {2,20,1,11,149700,0,0,0,},  
    [48] = {2,21,1,11,155800,0,0,0,},  
    [49] = {2,22,1,11,162000,0,0,0,},  
    [50] = {2,23,1,11,168100,0,0,0,},  
    [51] = {2,24,1,11,174300,0,0,0,},  
    [52] = {2,25,1,11,0,0,0,0,},  
    [53] = {3,0,1,11,24700,0,0,0,},  
    [54] = {3,1,1,11,29700,0,0,0,},  
    [55] = {3,2,1,11,34600,0,0,0,},  
    [56] = {3,3,1,11,39500,0,0,0,},  
    [57] = {3,4,1,11,44500,0,0,0,},  
    [58] = {3,5,1,11,59300,0,0,0,},  
    [59] = {3,6,1,11,65300,0,0,0,},  
    [60] = {3,7,1,11,71200,0,0,0,},  
    [61] = {3,8,1,11,77100,0,0,0,},  
    [62] = {3,9,1,11,83000,0,0,0,},  
    [63] = {3,10,1,11,106800,0,0,0,},  
    [64] = {3,11,1,11,113900,0,0,0,},  
    [65] = {3,12,1,11,121000,0,0,0,},  
    [66] = {3,13,1,11,128100,0,0,0,},  
    [67] = {3,14,1,11,135200,0,0,0,},  
    [68] = {3,15,1,11,152900,0,0,0,},  
    [69] = {3,16,1,11,157000,0,0,0,},  
    [70] = {3,17,1,11,161100,0,0,0,},  
    [71] = {3,18,1,11,165300,0,0,0,},  
    [72] = {3,19,1,11,169400,0,0,0,},  
    [73] = {3,20,1,11,190400,0,0,0,},  
    [74] = {3,21,1,11,194500,0,0,0,},  
    [75] = {3,22,1,11,198700,0,0,0,},  
    [76] = {3,23,1,11,202800,0,0,0,},  
    [77] = {3,24,1,11,206900,0,0,0,},  
    [78] = {3,25,1,11,0,0,0,0,},  
    [79] = {4,0,1,11,33000,0,0,0,},  
    [80] = {4,1,1,11,39500,0,0,0,},  
    [81] = {4,2,1,11,46100,0,0,0,},  
    [82] = {4,3,1,11,52700,0,0,0,},  
    [83] = {4,4,1,11,59300,0,0,0,},  
    [84] = {4,5,1,11,79100,0,0,0,},  
    [85] = {4,6,1,11,87000,0,0,0,},  
    [86] = {4,7,1,11,94900,0,0,0,},  
    [87] = {4,8,1,11,102800,0,0,0,},  
    [88] = {4,9,1,11,110700,0,0,0,},  
    [89] = {4,10,1,11,142400,0,0,0,},  
    [90] = {4,11,1,11,151900,0,0,0,},  
    [91] = {4,12,1,11,161400,0,0,0,},  
    [92] = {4,13,1,11,170800,0,0,0,},  
    [93] = {4,14,1,11,180300,0,0,0,},  
    [94] = {4,15,1,11,203300,0,0,0,},  
    [95] = {4,16,1,11,208300,0,0,0,},  
    [96] = {4,17,1,11,213200,0,0,0,},  
    [97] = {4,18,1,11,218100,0,0,0,},  
    [98] = {4,19,1,11,223100,0,0,0,},  
    [99] = {4,20,1,11,250300,0,0,0,},  
    [100] = {4,21,1,11,255300,0,0,0,},  
    [101] = {4,22,1,11,260200,0,0,0,},  
    [102] = {4,23,1,11,265200,0,0,0,},  
    [103] = {4,24,1,11,270100,0,0,0,},  
    [104] = {4,25,1,11,0,0,0,0,},
    }
}

local __index_id_level = {   
    ["1_0"] = 1,  
    ["1_1"] = 2,  
    ["1_2"] = 3,  
    ["1_3"] = 4,  
    ["1_4"] = 5,  
    ["1_5"] = 6,  
    ["1_6"] = 7,  
    ["1_7"] = 8,  
    ["1_8"] = 9,  
    ["1_9"] = 10,  
    ["1_10"] = 11,  
    ["1_11"] = 12,  
    ["1_12"] = 13,  
    ["1_13"] = 14,  
    ["1_14"] = 15,  
    ["1_15"] = 16,  
    ["1_16"] = 17,  
    ["1_17"] = 18,  
    ["1_18"] = 19,  
    ["1_19"] = 20,  
    ["1_20"] = 21,  
    ["1_21"] = 22,  
    ["1_22"] = 23,  
    ["1_23"] = 24,  
    ["1_24"] = 25,  
    ["1_25"] = 26,  
    ["2_0"] = 27,  
    ["2_1"] = 28,  
    ["2_2"] = 29,  
    ["2_3"] = 30,  
    ["2_4"] = 31,  
    ["2_5"] = 32,  
    ["2_6"] = 33,  
    ["2_7"] = 34,  
    ["2_8"] = 35,  
    ["2_9"] = 36,  
    ["2_10"] = 37,  
    ["2_11"] = 38,  
    ["2_12"] = 39,  
    ["2_13"] = 40,  
    ["2_14"] = 41,  
    ["2_15"] = 42,  
    ["2_16"] = 43,  
    ["2_17"] = 44,  
    ["2_18"] = 45,  
    ["2_19"] = 46,  
    ["2_20"] = 47,  
    ["2_21"] = 48,  
    ["2_22"] = 49,  
    ["2_23"] = 50,  
    ["2_24"] = 51,  
    ["2_25"] = 52,  
    ["3_0"] = 53,  
    ["3_1"] = 54,  
    ["3_2"] = 55,  
    ["3_3"] = 56,  
    ["3_4"] = 57,  
    ["3_5"] = 58,  
    ["3_6"] = 59,  
    ["3_7"] = 60,  
    ["3_8"] = 61,  
    ["3_9"] = 62,  
    ["3_10"] = 63,  
    ["3_11"] = 64,  
    ["3_12"] = 65,  
    ["3_13"] = 66,  
    ["3_14"] = 67,  
    ["3_15"] = 68,  
    ["3_16"] = 69,  
    ["3_17"] = 70,  
    ["3_18"] = 71,  
    ["3_19"] = 72,  
    ["3_20"] = 73,  
    ["3_21"] = 74,  
    ["3_22"] = 75,  
    ["3_23"] = 76,  
    ["3_24"] = 77,  
    ["3_25"] = 78,  
    ["4_0"] = 79,  
    ["4_1"] = 80,  
    ["4_2"] = 81,  
    ["4_3"] = 82,  
    ["4_4"] = 83,  
    ["4_5"] = 84,  
    ["4_6"] = 85,  
    ["4_7"] = 86,  
    ["4_8"] = 87,  
    ["4_9"] = 88,  
    ["4_10"] = 89,  
    ["4_11"] = 90,  
    ["4_12"] = 91,  
    ["4_13"] = 92,  
    ["4_14"] = 93,  
    ["4_15"] = 94,  
    ["4_16"] = 95,  
    ["4_17"] = 96,  
    ["4_18"] = 97,  
    ["4_19"] = 98,  
    ["4_20"] = 99,  
    ["4_21"] = 100,  
    ["4_22"] = 101,  
    ["4_23"] = 102,  
    ["4_24"] = 103,  
    ["4_25"] = 104,
}

local __key_map = { 
    id = 1,
    level = 2,
    cost_type1 = 3,
    cost_value1 = 4,
    cost_size1 = 5,
    cost_type2 = 6,
    cost_value2 = 7,
    cost_size2 = 8,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_guild_totem_upgrade_info")

        return t._raw[__key_map[k]]
    end
}


function guild_totem_upgrade_info.getLength()
    return #guild_totem_upgrade_info._data
end



function guild_totem_upgrade_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_guild_totem_upgrade_info
function guild_totem_upgrade_info.indexOf(index)
    if index == nil or not guild_totem_upgrade_info._data[index] then
        return nil
    end
    return setmetatable({_raw = guild_totem_upgrade_info._data[index]}, m)
end



---
--@return @class record_guild_totem_upgrade_info
function guild_totem_upgrade_info.get(id,level)
    
    local k = id .. '_' .. level
    return guild_totem_upgrade_info.indexOf(__index_id_level[k])
     
end



function guild_totem_upgrade_info.set(id,level, key, value)
    local record = guild_totem_upgrade_info.get(id,level)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function guild_totem_upgrade_info.get_index_data()
    return __index_id_level 
end

return  guild_totem_upgrade_info 