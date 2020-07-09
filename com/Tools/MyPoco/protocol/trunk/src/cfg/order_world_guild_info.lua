---@classdef record_order_world_guild_info
local record_order_world_guild_info = {}


record_order_world_guild_info.id = 0--id
record_order_world_guild_info.level = 0--等级
record_order_world_guild_info.name =  ""--名称
record_order_world_guild_info.guild_name =  ""--名称
record_order_world_guild_info.score = 0--所需要的积分
record_order_world_guild_info.knight_base = 0--武将资源
record_order_world_guild_info.resource_1 = 0--小兵资源
record_order_world_guild_info.resource_2 = 0--方阵资源
record_order_world_guild_info.resource_city = 0--城池资源
record_order_world_guild_info.reward_type_1 = 0--奖励类型1
record_order_world_guild_info.reward_value_1 = 0--奖励值1
record_order_world_guild_info.reward_size_1 = 0--奖励数量1
record_order_world_guild_info.reward_type_2 = 0--奖励类型2
record_order_world_guild_info.reward_value_2 = 0--奖励值2
record_order_world_guild_info.reward_size_2 = 0--奖励数量2
record_order_world_guild_info.reward_type_3 = 0--奖励类型3
record_order_world_guild_info.reward_value_3 = 0--奖励值3
record_order_world_guild_info.reward_size_3 = 0--奖励数量3
record_order_world_guild_info.reward_type_4 = 0--奖励类型4
record_order_world_guild_info.reward_value_4 = 0--奖励值4
record_order_world_guild_info.reward_size_4 = 0--奖励数量4
record_order_world_guild_info.reward_type_5 = 0--奖励类型5
record_order_world_guild_info.reward_value_5 = 0--奖励值5
record_order_world_guild_info.reward_size_5 = 0--奖励数量5
record_order_world_guild_info.reward_type_6 = 0--奖励类型6
record_order_world_guild_info.reward_value_6 = 0--奖励值6
record_order_world_guild_info.reward_size_6 = 0--奖励数量6
record_order_world_guild_info.reward_type_7 = 0--奖励类型7
record_order_world_guild_info.reward_value_7 = 0--奖励值7
record_order_world_guild_info.reward_size_7 = 0--奖励数量7

local order_world_guild_info = {
   _data = {   
    [1] = {10001,1,"兵力等级:1级","【#name#】兵力等级:1级",1300,400030,101,201,101,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,},  
    [2] = {10001,2,"兵力等级:2级","【#name#】兵力等级:2级",2700,400030,101,201,101,0,0,0,999,0,200,3,107,5,3,106,10,0,0,0,0,0,0,0,0,0,},  
    [3] = {10001,3,"兵力等级:3级","【#name#】兵力等级:3级",4000,400030,101,201,101,3,108,5,999,0,250,3,107,5,3,106,15,0,0,0,0,0,0,0,0,0,},  
    [4] = {10001,4,"兵力等级:4级","【#name#】兵力等级:4级",5300,400030,101,201,101,0,0,0,999,0,300,3,107,5,3,106,20,0,0,0,0,0,0,0,0,0,},  
    [5] = {10001,5,"兵力等级:5级","【#name#】兵力等级:5级",7300,500020,102,202,102,9,112,1,999,0,400,3,107,10,3,106,25,0,0,0,0,0,0,0,0,0,},  
    [6] = {10001,6,"兵力等级:6级","【#name#】兵力等级:6级",10000,500020,102,202,102,0,0,0,999,0,500,3,107,10,3,106,30,0,0,0,0,0,0,0,0,0,},  
    [7] = {10001,7,"兵力等级:7级","【#name#】兵力等级:7级",12900,500020,102,202,102,3,108,10,999,0,600,3,107,10,3,106,35,0,0,0,0,0,0,0,0,0,},  
    [8] = {10001,8,"兵力等级:8级","【#name#】兵力等级:8级",16500,510020,103,203,103,0,0,0,999,0,700,3,107,15,3,106,40,0,0,0,0,0,0,0,0,0,},  
    [9] = {10001,9,"兵力等级:9级","【#name#】兵力等级:9级",20600,510020,103,203,103,3,103,1,999,0,800,3,107,15,3,106,45,0,0,0,0,0,0,0,0,0,},  
    [10] = {10001,10,"兵力等级:10级","【#name#】兵力等级:10级",25300,300280,104,204,103,0,0,0,999,0,900,3,107,20,3,106,50,0,0,0,0,0,0,0,0,0,},  
    [11] = {10001,11,"兵力等级:11级","【#name#】兵力等级:11级",0,300280,104,204,103,3,108,20,999,0,1000,3,107,20,3,106,60,0,0,0,0,0,0,0,0,0,},
    }
}

local __index_id_level = {   
    ["10001_1"] = 1,  
    ["10001_2"] = 2,  
    ["10001_3"] = 3,  
    ["10001_4"] = 4,  
    ["10001_5"] = 5,  
    ["10001_6"] = 6,  
    ["10001_7"] = 7,  
    ["10001_8"] = 8,  
    ["10001_9"] = 9,  
    ["10001_10"] = 10,  
    ["10001_11"] = 11,
}

local __key_map = { 
    id = 1,
    level = 2,
    name = 3,
    guild_name = 4,
    score = 5,
    knight_base = 6,
    resource_1 = 7,
    resource_2 = 8,
    resource_city = 9,
    reward_type_1 = 10,
    reward_value_1 = 11,
    reward_size_1 = 12,
    reward_type_2 = 13,
    reward_value_2 = 14,
    reward_size_2 = 15,
    reward_type_3 = 16,
    reward_value_3 = 17,
    reward_size_3 = 18,
    reward_type_4 = 19,
    reward_value_4 = 20,
    reward_size_4 = 21,
    reward_type_5 = 22,
    reward_value_5 = 23,
    reward_size_5 = 24,
    reward_type_6 = 25,
    reward_value_6 = 26,
    reward_size_6 = 27,
    reward_type_7 = 28,
    reward_value_7 = 29,
    reward_size_7 = 30,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_order_world_guild_info")

        return t._raw[__key_map[k]]
    end
}


function order_world_guild_info.getLength()
    return #order_world_guild_info._data
end



function order_world_guild_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_order_world_guild_info
function order_world_guild_info.indexOf(index)
    if index == nil or not order_world_guild_info._data[index] then
        return nil
    end
    return setmetatable({_raw = order_world_guild_info._data[index]}, m)
end



---
--@return @class record_order_world_guild_info
function order_world_guild_info.get(id,level)
    
    local k = id .. '_' .. level
    return order_world_guild_info.indexOf(__index_id_level[k])
     
end



function order_world_guild_info.set(id,level, key, value)
    local record = order_world_guild_info.get(id,level)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function order_world_guild_info.get_index_data()
    return __index_id_level 
end

return  order_world_guild_info 