---@classdef record_daily_dungeon_reward_preview
local record_daily_dungeon_reward_preview = {}


record_daily_dungeon_reward_preview.id = 0--编号
record_daily_dungeon_reward_preview.base_type_1 = 0--基础奖励类型1
record_daily_dungeon_reward_preview.base_type_value_1 = 0--基础奖励类型值1
record_daily_dungeon_reward_preview.base_num_1 = 0--基础奖励数量1
record_daily_dungeon_reward_preview.extra_type = 0--条件奖励类型
record_daily_dungeon_reward_preview.extra_type_value = 0--条件奖励类型值
record_daily_dungeon_reward_preview.extra_num = 0--条件奖励数量
record_daily_dungeon_reward_preview.extra_reward = 0--条件奖励结算
record_daily_dungeon_reward_preview.k = 0--条件奖励系数

local daily_dungeon_reward_preview = {
   _data = {   
    [1] = {101,3,8,15,3,8,15,1,100,},  
    [2] = {102,3,9,15,3,9,15,1,100,},  
    [3] = {103,3,9,20,3,9,20,1,100,},  
    [4] = {104,3,10,15,3,10,15,1,100,},  
    [5] = {105,3,10,20,3,10,20,1,100,},  
    [6] = {106,3,10,25,3,10,25,1,100,},  
    [7] = {201,1,3,110000,1,3,90000,2,3,},  
    [8] = {202,1,3,190000,1,3,210000,2,3,},  
    [9] = {203,1,3,250000,1,3,300000,2,3,},  
    [10] = {204,1,3,340000,1,3,360000,2,3,},  
    [11] = {205,1,3,400000,1,3,450000,2,3,},  
    [12] = {206,1,3,490000,1,3,510000,2,3,},  
    [13] = {301,3,35,60,3,35,240,2,3,},  
    [14] = {302,3,35,150,3,35,450,2,3,},  
    [15] = {303,3,35,210,3,35,540,2,3,},  
    [16] = {304,3,35,300,3,35,600,2,3,},  
    [17] = {305,3,35,350,3,35,750,2,3,},  
    [18] = {306,3,35,430,3,35,870,2,3,},  
    [19] = {401,8,13010,2,8,13010,8,3,4,},  
    [20] = {402,8,13010,4,8,13010,12,3,4,},  
    [21] = {403,8,13020,2,8,13020,8,3,4,},  
    [22] = {404,8,13020,4,8,13020,12,3,4,},  
    [23] = {405,8,13030,2,8,13030,8,3,4,},  
    [24] = {406,8,13030,4,8,13030,8,3,4,},  
    [25] = {501,3,56,18,3,56,12,1,100,},  
    [26] = {502,3,56,30,3,56,20,1,100,},  
    [27] = {503,3,56,48,3,56,32,1,100,},  
    [28] = {504,3,56,66,3,56,44,1,100,},  
    [29] = {505,3,56,78,3,56,52,1,100,},  
    [30] = {506,3,56,96,3,56,64,1,100,},
    }
}

local __index_id = {   
    [101] = 1,  
    [102] = 2,  
    [103] = 3,  
    [104] = 4,  
    [105] = 5,  
    [106] = 6,  
    [201] = 7,  
    [202] = 8,  
    [203] = 9,  
    [204] = 10,  
    [205] = 11,  
    [206] = 12,  
    [301] = 13,  
    [302] = 14,  
    [303] = 15,  
    [304] = 16,  
    [305] = 17,  
    [306] = 18,  
    [401] = 19,  
    [402] = 20,  
    [403] = 21,  
    [404] = 22,  
    [405] = 23,  
    [406] = 24,  
    [501] = 25,  
    [502] = 26,  
    [503] = 27,  
    [504] = 28,  
    [505] = 29,  
    [506] = 30,
}

local __key_map = { 
    id = 1,
    base_type_1 = 2,
    base_type_value_1 = 3,
    base_num_1 = 4,
    extra_type = 5,
    extra_type_value = 6,
    extra_num = 7,
    extra_reward = 8,
    k = 9,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_daily_dungeon_reward_preview")

        return t._raw[__key_map[k]]
    end
}


function daily_dungeon_reward_preview.getLength()
    return #daily_dungeon_reward_preview._data
end



function daily_dungeon_reward_preview.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_daily_dungeon_reward_preview
function daily_dungeon_reward_preview.indexOf(index)
    if index == nil or not daily_dungeon_reward_preview._data[index] then
        return nil
    end
    return setmetatable({_raw = daily_dungeon_reward_preview._data[index]}, m)
end



---
--@return @class record_daily_dungeon_reward_preview
function daily_dungeon_reward_preview.get(id)
    
    return daily_dungeon_reward_preview.indexOf(__index_id[ id ])
     
end



function daily_dungeon_reward_preview.set(id, key, value)
    local record = daily_dungeon_reward_preview.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function daily_dungeon_reward_preview.get_index_data()
    return __index_id 
end

return  daily_dungeon_reward_preview 