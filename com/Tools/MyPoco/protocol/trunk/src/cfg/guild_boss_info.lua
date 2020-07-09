---@classdef record_guild_boss_info
local record_guild_boss_info = {}


record_guild_boss_info.id = 0--ID
record_guild_boss_info.week_day = 0--星期
record_guild_boss_info.day = 0--开服时间
record_guild_boss_info.foreshow_time = 0--预告时间
record_guild_boss_info.start_time = 0--开启时间
record_guild_boss_info.end_time = 0--结束时间
record_guild_boss_info.boss_hp = 0--血量分段
record_guild_boss_info.type = 0--类型
record_guild_boss_info.show_model = 0--显示形象
record_guild_boss_info.name = 0--名称
record_guild_boss_info.monster_team = 0--怪物组
record_guild_boss_info.basic_gain = 0--基础分数
record_guild_boss_info.ratio_1 = 0--积分系数1
record_guild_boss_info.ratio_2 = 0--积分系数2
record_guild_boss_info.ratio_3 = 0--积分系数3
record_guild_boss_info.challenge_num = 0--挑战次数
record_guild_boss_info.challenge_gap = 0--挑战冷却
record_guild_boss_info.rob_num = 0--抢夺次数
record_guild_boss_info.rob_gap = 0--抢夺冷却
record_guild_boss_info.item_drop = 0--掉落奖励
record_guild_boss_info.rob_drop = 0--抢夺奖励
record_guild_boss_info.auction_id = 0--拍卖id

local guild_boss_info = {
   _data = {   
    [1] = {1,1,2,0,0,50400,35,1,510025,1000050,140000,50,10000,30,5000000000,3,10,3,3,240001,240002,2,},  
    [2] = {2,2,2,0,0,50400,20,1,500115,1000035,140100,50,10000,30,5000000000,3,10,3,3,240001,240002,2,},  
    [3] = {3,3,2,0,0,50400,15,1,510055,1000053,140200,50,10000,30,5000000000,3,10,3,3,240001,240002,2,},  
    [4] = {4,4,2,0,0,50400,45,1,510075,1000055,140300,50,10000,30,5000000000,3,10,3,3,240001,240002,2,},  
    [5] = {5,5,2,0,0,50400,55,1,510035,1000051,140400,50,10000,30,5000000000,3,10,3,3,240001,240002,2,},  
    [6] = {6,6,2,0,0,50400,30,1,510015,1000049,140500,50,10000,30,5000000000,3,10,3,3,240001,240002,2,},  
    [7] = {7,0,2,0,0,50400,20,1,510085,1000056,140600,50,10000,30,5000000000,3,10,3,3,240001,240002,2,},  
    [8] = {8,1,15,0,0,50400,35,1,510025,1000050,140000,50,10000,30,5000000000,3,10,3,3,240001,240002,2,},  
    [9] = {9,2,15,0,0,50400,20,1,500115,1000035,140100,50,10000,30,5000000000,3,10,3,3,240001,240002,2,},  
    [10] = {10,3,15,0,0,50400,15,2,510055,1000053,140200,50,10000,30,5000000000,3,10,3,3,240001,240002,3,},  
    [11] = {11,4,15,0,0,50400,45,1,510075,1000055,140300,50,10000,30,5000000000,3,10,3,3,240001,240002,2,},  
    [12] = {12,5,15,0,0,50400,55,1,510035,1000051,140400,50,10000,30,5000000000,3,10,3,3,240001,240002,2,},  
    [13] = {13,6,15,0,0,50400,30,1,510015,1000049,140500,50,10000,30,5000000000,3,10,3,3,240001,240002,2,},  
    [14] = {14,0,15,0,0,50400,20,1,510085,1000056,140600,50,10000,30,5000000000,3,10,3,3,240001,240002,2,},
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
}

local __key_map = { 
    id = 1,
    week_day = 2,
    day = 3,
    foreshow_time = 4,
    start_time = 5,
    end_time = 6,
    boss_hp = 7,
    type = 8,
    show_model = 9,
    name = 10,
    monster_team = 11,
    basic_gain = 12,
    ratio_1 = 13,
    ratio_2 = 14,
    ratio_3 = 15,
    challenge_num = 16,
    challenge_gap = 17,
    rob_num = 18,
    rob_gap = 19,
    item_drop = 20,
    rob_drop = 21,
    auction_id = 22,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_guild_boss_info")

        return t._raw[__key_map[k]]
    end
}


function guild_boss_info.getLength()
    return #guild_boss_info._data
end



function guild_boss_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_guild_boss_info
function guild_boss_info.indexOf(index)
    if index == nil or not guild_boss_info._data[index] then
        return nil
    end
    return setmetatable({_raw = guild_boss_info._data[index]}, m)
end



---
--@return @class record_guild_boss_info
function guild_boss_info.get(id)
    
    return guild_boss_info.indexOf(__index_id[ id ])
     
end



function guild_boss_info.set(id, key, value)
    local record = guild_boss_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function guild_boss_info.get_index_data()
    return __index_id 
end

return  guild_boss_info 