---@classdef record_spacetime_dungeon_reward_info
local record_spacetime_dungeon_reward_info = {}


record_spacetime_dungeon_reward_info.id = 0--ID
record_spacetime_dungeon_reward_info.team = 0--奖励组
record_spacetime_dungeon_reward_info.reward_type = 0--奖励类型
record_spacetime_dungeon_reward_info.reward_value = 0--奖励掉落

local spacetime_dungeon_reward_info = {
   _data = {   
    [1] = {1,1,2,400001,},  
    [2] = {2,1,2,400002,},  
    [3] = {3,1,2,400003,},  
    [4] = {4,1,1,400004,},  
    [5] = {5,2,2,400005,},  
    [6] = {6,2,2,400006,},  
    [7] = {7,2,2,400007,},  
    [8] = {8,2,1,400008,},  
    [9] = {9,3,2,400009,},  
    [10] = {10,3,2,400010,},  
    [11] = {11,3,2,400011,},  
    [12] = {12,3,2,400012,},  
    [13] = {13,3,2,400013,},  
    [14] = {14,3,1,400014,},  
    [15] = {15,4,2,400015,},  
    [16] = {16,4,2,400016,},  
    [17] = {17,4,2,400017,},  
    [18] = {18,4,2,400018,},  
    [19] = {19,4,2,400019,},  
    [20] = {20,4,1,400020,},  
    [21] = {10101,10001,2,450001,},  
    [22] = {10102,10001,2,450002,},  
    [23] = {10103,10001,2,450003,},  
    [24] = {10104,10001,2,450004,},  
    [25] = {10105,10001,2,450005,},  
    [26] = {10106,10001,2,450006,},  
    [27] = {10107,10001,2,450007,},  
    [28] = {10108,10001,2,450008,},  
    [29] = {10109,10001,2,450009,},  
    [30] = {10110,10001,2,450010,},  
    [31] = {10111,10001,1,450011,},  
    [32] = {10201,10002,2,450012,},  
    [33] = {10202,10002,2,450013,},  
    [34] = {10203,10002,2,450014,},  
    [35] = {10204,10002,2,450015,},  
    [36] = {10205,10002,2,450016,},  
    [37] = {10206,10002,2,450017,},  
    [38] = {10207,10002,2,450018,},  
    [39] = {10208,10002,2,450019,},  
    [40] = {10209,10002,2,450020,},  
    [41] = {10210,10002,1,450021,},  
    [42] = {10301,10003,2,450022,},  
    [43] = {10302,10003,2,450023,},  
    [44] = {10303,10003,2,450024,},  
    [45] = {10304,10003,2,450025,},  
    [46] = {10305,10003,2,450026,},  
    [47] = {10306,10003,2,450027,},  
    [48] = {10307,10003,2,450028,},  
    [49] = {10308,10003,1,450029,},  
    [50] = {10401,10004,2,450030,},  
    [51] = {10402,10004,2,450031,},  
    [52] = {10403,10004,2,450032,},  
    [53] = {10404,10004,2,450033,},  
    [54] = {10405,10004,2,450034,},  
    [55] = {10406,10004,2,450035,},  
    [56] = {10407,10004,2,450036,},  
    [57] = {10408,10004,2,450037,},  
    [58] = {10409,10004,2,450038,},  
    [59] = {10410,10004,2,450039,},  
    [60] = {10411,10004,2,450040,},  
    [61] = {10412,10004,1,450041,},
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
    [10101] = 21,  
    [10102] = 22,  
    [10103] = 23,  
    [10104] = 24,  
    [10105] = 25,  
    [10106] = 26,  
    [10107] = 27,  
    [10108] = 28,  
    [10109] = 29,  
    [10110] = 30,  
    [10111] = 31,  
    [10201] = 32,  
    [10202] = 33,  
    [10203] = 34,  
    [10204] = 35,  
    [10205] = 36,  
    [10206] = 37,  
    [10207] = 38,  
    [10208] = 39,  
    [10209] = 40,  
    [10210] = 41,  
    [10301] = 42,  
    [10302] = 43,  
    [10303] = 44,  
    [10304] = 45,  
    [10305] = 46,  
    [10306] = 47,  
    [10307] = 48,  
    [10308] = 49,  
    [10401] = 50,  
    [10402] = 51,  
    [10403] = 52,  
    [10404] = 53,  
    [10405] = 54,  
    [10406] = 55,  
    [10407] = 56,  
    [10408] = 57,  
    [10409] = 58,  
    [10410] = 59,  
    [10411] = 60,  
    [10412] = 61,
}

local __key_map = { 
    id = 1,
    team = 2,
    reward_type = 3,
    reward_value = 4,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_spacetime_dungeon_reward_info")

        return t._raw[__key_map[k]]
    end
}


function spacetime_dungeon_reward_info.getLength()
    return #spacetime_dungeon_reward_info._data
end



function spacetime_dungeon_reward_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_spacetime_dungeon_reward_info
function spacetime_dungeon_reward_info.indexOf(index)
    if index == nil or not spacetime_dungeon_reward_info._data[index] then
        return nil
    end
    return setmetatable({_raw = spacetime_dungeon_reward_info._data[index]}, m)
end



---
--@return @class record_spacetime_dungeon_reward_info
function spacetime_dungeon_reward_info.get(id)
    
    return spacetime_dungeon_reward_info.indexOf(__index_id[ id ])
     
end



function spacetime_dungeon_reward_info.set(id, key, value)
    local record = spacetime_dungeon_reward_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function spacetime_dungeon_reward_info.get_index_data()
    return __index_id 
end

return  spacetime_dungeon_reward_info 