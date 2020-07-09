---@classdef record_guild_battle_match_info
local record_guild_battle_match_info = {}


record_guild_battle_match_info.id = 0--id
record_guild_battle_match_info.type = 0--类型
record_guild_battle_match_info.match_value = 0--匹配类型值
record_guild_battle_match_info.rank_type = 0--排名类型
record_guild_battle_match_info.match_min = 0--最小匹配排名
record_guild_battle_match_info.match_max = 0--最大匹配排名
record_guild_battle_match_info.fight_min = 0--匹配波动下限
record_guild_battle_match_info.fight_max = 0--匹配波动上限
record_guild_battle_match_info.robot_id = 0--机器人ID

local guild_battle_match_info = {
   _data = {   
    [1] = {1,1,1,2,1,1,50,50,40021,},  
    [2] = {2,1,2,2,2,5,50,50,40021,},  
    [3] = {3,1,3,2,6,10,50,50,40011,},  
    [4] = {4,1,4,2,11,20,50,50,40011,},  
    [5] = {5,1,10,3,1,10,50,50,40011,},  
    [6] = {6,1,10,3,11,20,50,50,40001,},  
    [7] = {7,1,16,3,21,40,50,50,40001,},  
    [8] = {8,1,10,4,0,0,50,50,40001,},  
    [9] = {201,2,1,1,61,70,50,50,40001,},  
    [10] = {202,2,1,1,71,80,50,50,40011,},  
    [11] = {203,2,1,1,81,90,50,50,40021,},  
    [12] = {204,2,2,1,181,190,50,50,40001,},  
    [13] = {205,2,2,1,191,200,50,50,40011,},  
    [14] = {206,2,2,1,201,210,50,50,40021,},  
    [15] = {207,2,3,2,41,50,50,50,40001,},  
    [16] = {208,2,3,2,51,60,50,50,40011,},  
    [17] = {209,2,3,2,61,70,50,50,40021,},  
    [18] = {210,2,4,3,10,10,50,50,40001,},  
    [19] = {211,2,4,3,10,10,50,50,40011,},  
    [20] = {212,2,4,3,10,10,50,50,40021,},  
    [21] = {213,2,5,3,15,15,50,50,40001,},  
    [22] = {214,2,5,3,15,15,50,50,40011,},  
    [23] = {215,2,5,3,15,15,50,50,40021,},  
    [24] = {216,2,6,3,25,25,50,50,40001,},  
    [25] = {217,2,6,3,25,25,50,50,40011,},  
    [26] = {218,2,6,3,25,25,50,50,40021,},  
    [27] = {219,2,7,3,40,40,50,50,40001,},  
    [28] = {220,2,7,3,40,40,50,50,40011,},  
    [29] = {221,2,7,3,40,40,50,50,40021,},  
    [30] = {222,2,8,4,0,0,0,0,40001,},  
    [31] = {223,2,8,4,0,0,0,0,40011,},  
    [32] = {224,2,8,4,0,0,0,0,40021,},
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
    [201] = 9,  
    [202] = 10,  
    [203] = 11,  
    [204] = 12,  
    [205] = 13,  
    [206] = 14,  
    [207] = 15,  
    [208] = 16,  
    [209] = 17,  
    [210] = 18,  
    [211] = 19,  
    [212] = 20,  
    [213] = 21,  
    [214] = 22,  
    [215] = 23,  
    [216] = 24,  
    [217] = 25,  
    [218] = 26,  
    [219] = 27,  
    [220] = 28,  
    [221] = 29,  
    [222] = 30,  
    [223] = 31,  
    [224] = 32,
}

local __key_map = { 
    id = 1,
    type = 2,
    match_value = 3,
    rank_type = 4,
    match_min = 5,
    match_max = 6,
    fight_min = 7,
    fight_max = 8,
    robot_id = 9,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_guild_battle_match_info")

        return t._raw[__key_map[k]]
    end
}


function guild_battle_match_info.getLength()
    return #guild_battle_match_info._data
end



function guild_battle_match_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_guild_battle_match_info
function guild_battle_match_info.indexOf(index)
    if index == nil or not guild_battle_match_info._data[index] then
        return nil
    end
    return setmetatable({_raw = guild_battle_match_info._data[index]}, m)
end



---
--@return @class record_guild_battle_match_info
function guild_battle_match_info.get(id)
    
    return guild_battle_match_info.indexOf(__index_id[ id ])
     
end



function guild_battle_match_info.set(id, key, value)
    local record = guild_battle_match_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function guild_battle_match_info.get_index_data()
    return __index_id 
end

return  guild_battle_match_info 