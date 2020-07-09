---@classdef record_guild_info
local record_guild_info = {}


record_guild_info.id = 0--id
record_guild_info.level = 0--军团等级
record_guild_info.exp = 0--升到下级所需经验
record_guild_info.number = 0--成员数上限
record_guild_info.gift_send = 0--赠礼奖励
record_guild_info.gift_send_num = 0--每日赠礼次数
record_guild_info.gift_recieve = 0--收礼奖励
record_guild_info.gift_recieve_num = 0--每日收礼次数
record_guild_info.worship_value_1 = 0--祭天进度1
record_guild_info.award_1 = 0--进度1奖励
record_guild_info.worship_value_2 = 0--祭天进度2
record_guild_info.award_2 = 0--进度2奖励
record_guild_info.worship_value_3 = 0--祭天进度3
record_guild_info.award_3 = 0--进度3奖励
record_guild_info.worship_value_4 = 0--祭天进度4
record_guild_info.award_4 = 0--进度4奖励

local guild_info = {
   _data = {   
    [1] = {1,1,6000,30,210004,3,210005,15,50,210101,100,210102,170,210103,240,210104,},  
    [2] = {2,2,13000,32,210004,3,210005,15,50,210105,110,210106,180,210107,250,210108,},  
    [3] = {3,3,35000,34,210004,3,210005,15,60,210109,120,210110,190,210111,270,210112,},  
    [4] = {4,4,54000,36,210004,3,210005,15,60,210113,120,210114,210,210115,290,210116,},  
    [5] = {5,5,166000,38,210004,3,210005,15,60,210117,130,210118,220,210119,300,210120,},  
    [6] = {6,6,447000,40,210004,3,210005,15,70,210121,140,210122,230,210123,320,210124,},  
    [7] = {7,7,665000,42,210004,3,210005,15,70,210125,150,210126,240,210127,340,210128,},  
    [8] = {8,8,1015000,44,210004,3,210005,15,70,210129,150,210130,250,210131,350,210132,},  
    [9] = {9,9,2143000,46,210004,3,210005,15,80,210133,160,210134,260,210135,370,210136,},  
    [10] = {10,10,0,48,210004,3,210005,15,80,210137,170,210138,280,210139,380,210140,},
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
}

local __key_map = { 
    id = 1,
    level = 2,
    exp = 3,
    number = 4,
    gift_send = 5,
    gift_send_num = 6,
    gift_recieve = 7,
    gift_recieve_num = 8,
    worship_value_1 = 9,
    award_1 = 10,
    worship_value_2 = 11,
    award_2 = 12,
    worship_value_3 = 13,
    award_3 = 14,
    worship_value_4 = 15,
    award_4 = 16,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_guild_info")

        return t._raw[__key_map[k]]
    end
}


function guild_info.getLength()
    return #guild_info._data
end



function guild_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_guild_info
function guild_info.indexOf(index)
    if index == nil or not guild_info._data[index] then
        return nil
    end
    return setmetatable({_raw = guild_info._data[index]}, m)
end



---
--@return @class record_guild_info
function guild_info.get(id)
    
    return guild_info.indexOf(__index_id[ id ])
     
end



function guild_info.set(id, key, value)
    local record = guild_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function guild_info.get_index_data()
    return __index_id 
end

return  guild_info 