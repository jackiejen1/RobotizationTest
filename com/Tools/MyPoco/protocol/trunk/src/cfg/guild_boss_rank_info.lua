---@classdef record_guild_boss_rank_info
local record_guild_boss_rank_info = {}


record_guild_boss_rank_info.id = 0--ID
record_guild_boss_rank_info.action_type = 0--活动类型
record_guild_boss_rank_info.type = 0--排行榜类型
record_guild_boss_rank_info.rank_up = 0--排名上限
record_guild_boss_rank_info.rank_down = 0--排名下限
record_guild_boss_rank_info.fixed_gain = 0--获取定值
record_guild_boss_rank_info.point_gain = 0--积分获取
record_guild_boss_rank_info.point_loss = 0--积分损失
record_guild_boss_rank_info.barrage =  ""--弹幕内容
record_guild_boss_rank_info.replay_time = 0--重播时间
record_guild_boss_rank_info.if_special = 0--特殊弹幕
record_guild_boss_rank_info.award_type_1 = 0--奖励类型1
record_guild_boss_rank_info.award_value_1 = 0--奖励类型值1
record_guild_boss_rank_info.award_size_1 = 0--奖励数量1
record_guild_boss_rank_info.award_type_2 = 0--奖励类型2
record_guild_boss_rank_info.award_value_2 = 0--奖励类型值2
record_guild_boss_rank_info.award_size_2 = 0--奖励数量2
record_guild_boss_rank_info.award_type_3 = 0--奖励类型3
record_guild_boss_rank_info.award_value_3 = 0--奖励类型值3
record_guild_boss_rank_info.award_size_3 = 0--奖励数量3
record_guild_boss_rank_info.award_type_4 = 0--奖励类型4
record_guild_boss_rank_info.award_value_4 = 0--奖励类型值4
record_guild_boss_rank_info.award_size_4 = 0--奖励数量4

local guild_boss_rank_info = {
   _data = {   
    [1] = {1,1,1,1,1,30,3000,1000,"#name#犹如天神下凡，致命一击，重创#boss#，造成#num#点巨额伤害！",180,1,1,11,5000,3,26,300,1,3,500000,0,0,0,},  
    [2] = {2,1,1,2,3,30,3000,1000,"#name#单枪匹马，一骑当先，#boss#溃不成军，损失#num#血量",150,0,1,11,4000,3,26,250,1,3,400000,0,0,0,},  
    [3] = {3,1,1,4,5,30,3000,1000,"#name#无人能挡，与神将大战三百回合，#boss#损失#num#血量",120,0,1,11,3000,3,26,200,1,3,300000,0,0,0,},  
    [4] = {4,1,1,6,10,30,3000,1000,"#name#施展本生绝学，#boss#连退数十步，损失#num#血量",100,0,1,11,2500,3,26,150,1,3,200000,0,0,0,},  
    [5] = {5,1,1,11,30,30,2000,800,"#name#破釜沉舟，舍身一击，#boss#竟受到轻伤，损失#num#血量",60,0,1,11,2000,3,26,120,1,3,150000,0,0,0,},  
    [6] = {6,1,1,31,50,30,1500,600,"#name#身手不凡，飞身一击，#boss#被打的后退一步，损失#num#血量",60,0,1,11,1500,3,26,100,1,3,120000,0,0,0,},  
    [7] = {7,1,1,51,100,30,1500,600,"#name#放出大招，斩掉#boss#一片衣角，损失#num#血量",60,0,1,11,1000,3,26,80,1,3,100000,0,0,0,},  
    [8] = {8,1,1,101,300,30,1000,400,"#name#奋力一击，#boss#感受到一丝刺痛，损失#num#血量",60,0,1,11,800,3,26,60,1,3,80000,0,0,0,},  
    [9] = {9,1,1,301,500,30,1000,400,"#name#偷袭得手，#boss#挠挠后脑勺，原来受到了擦伤，损失#num#血量",60,0,1,11,500,3,26,50,1,3,50000,0,0,0,},  
    [10] = {10,1,2,1,1,0,0,0,"0",0,0,1,11,3000,3,2,200,1,3,300000,0,0,0,},  
    [11] = {11,1,2,2,2,0,0,0,"0",0,0,1,11,2500,3,2,150,1,3,250000,0,0,0,},  
    [12] = {12,1,2,3,3,0,0,0,"0",0,0,1,11,2000,3,2,120,1,3,200000,0,0,0,},  
    [13] = {13,1,2,4,5,0,0,0,"0",0,0,1,11,1500,3,2,80,1,3,150000,0,0,0,},  
    [14] = {14,1,2,6,10,0,0,0,"0",0,0,1,11,1200,3,2,60,1,3,120000,0,0,0,},  
    [15] = {15,1,2,11,30,0,0,0,"0",0,0,1,11,1000,3,2,50,1,3,100000,0,0,0,},  
    [16] = {16,1,2,31,50,0,0,0,"0",0,0,1,11,800,3,2,30,1,3,50000,0,0,0,},  
    [17] = {17,2,1,1,1,30,3000,1000,"#name#犹如天神下凡，致命一击，重创#boss#，造成#num#点巨额伤害！",180,1,1,11,10000,3,26,1000,1,3,1200000,0,0,0,},  
    [18] = {18,2,1,2,3,30,3000,1000,"#name#单枪匹马，一骑当先，#boss#溃不成军，损失#num#血量",150,0,1,11,8000,3,26,800,1,3,1000000,0,0,0,},  
    [19] = {19,2,1,4,5,30,3000,1000,"#name#无人能挡，与神将大战三百回合，#boss#损失#num#血量",120,0,1,11,6000,3,26,600,1,3,800000,0,0,0,},  
    [20] = {20,2,1,6,10,30,3000,1000,"#name#施展本生绝学，#boss#连退数十步，损失#num#血量",100,0,1,11,5000,3,26,500,1,3,600000,0,0,0,},  
    [21] = {21,2,1,11,30,30,2000,800,"#name#破釜沉舟，舍身一击，#boss#竟受到轻伤，损失#num#血量",60,0,1,11,4000,3,26,400,1,3,400000,0,0,0,},  
    [22] = {22,2,1,31,50,30,1500,600,"#name#身手不凡，飞身一击，#boss#被打的后退一步，损失#num#血量",60,0,1,11,3000,3,26,300,1,3,350000,0,0,0,},  
    [23] = {23,2,1,51,100,30,1500,600,"#name#放出大招，斩掉#boss#一片衣角，损失#num#血量",60,0,1,11,2000,3,26,200,1,3,300000,0,0,0,},  
    [24] = {24,2,1,101,300,30,1000,400,"#name#奋力一击，#boss#感受到一丝刺痛，损失#num#血量",60,0,1,11,1500,3,26,100,1,3,250000,0,0,0,},  
    [25] = {25,2,1,301,500,30,1000,400,"#name#偷袭得手，#boss#挠挠后脑勺，原来受到了擦伤，损失#num#血量",60,0,1,11,1000,3,26,50,1,3,200000,0,0,0,},  
    [26] = {26,2,2,1,1,0,0,0,"0",0,0,1,11,6000,3,2,500,1,3,800000,0,0,0,},  
    [27] = {27,2,2,2,2,0,0,0,"0",0,0,1,11,5000,3,2,400,1,3,600000,0,0,0,},  
    [28] = {28,2,2,3,3,0,0,0,"0",0,0,1,11,4000,3,2,300,1,3,400000,0,0,0,},  
    [29] = {29,2,2,4,5,0,0,0,"0",0,0,1,11,3000,3,2,200,1,3,350000,0,0,0,},  
    [30] = {30,2,2,6,10,0,0,0,"0",0,0,1,11,2400,3,2,180,1,3,300000,0,0,0,},  
    [31] = {31,2,2,11,30,0,0,0,"0",0,0,1,11,2000,3,2,150,1,3,250000,0,0,0,},  
    [32] = {32,2,2,31,50,0,0,0,"0",0,0,1,11,1500,3,2,120,1,3,200000,0,0,0,},  
    [33] = {33,2,2,51,100,0,0,0,"0",0,0,1,11,1000,3,2,100,1,3,150000,0,0,0,},
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
    [21] = 21,  
    [22] = 22,  
    [23] = 23,  
    [24] = 24,  
    [25] = 25,  
    [26] = 26,  
    [27] = 27,  
    [28] = 28,  
    [29] = 29,  
    [30] = 30,  
    [31] = 31,  
    [32] = 32,  
    [33] = 33,
}

local __key_map = { 
    id = 1,
    action_type = 2,
    type = 3,
    rank_up = 4,
    rank_down = 5,
    fixed_gain = 6,
    point_gain = 7,
    point_loss = 8,
    barrage = 9,
    replay_time = 10,
    if_special = 11,
    award_type_1 = 12,
    award_value_1 = 13,
    award_size_1 = 14,
    award_type_2 = 15,
    award_value_2 = 16,
    award_size_2 = 17,
    award_type_3 = 18,
    award_value_3 = 19,
    award_size_3 = 20,
    award_type_4 = 21,
    award_value_4 = 22,
    award_size_4 = 23,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_guild_boss_rank_info")

        return t._raw[__key_map[k]]
    end
}


function guild_boss_rank_info.getLength()
    return #guild_boss_rank_info._data
end



function guild_boss_rank_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_guild_boss_rank_info
function guild_boss_rank_info.indexOf(index)
    if index == nil or not guild_boss_rank_info._data[index] then
        return nil
    end
    return setmetatable({_raw = guild_boss_rank_info._data[index]}, m)
end



---
--@return @class record_guild_boss_rank_info
function guild_boss_rank_info.get(id)
    
    return guild_boss_rank_info.indexOf(__index_id[ id ])
     
end



function guild_boss_rank_info.set(id, key, value)
    local record = guild_boss_rank_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function guild_boss_rank_info.get_index_data()
    return __index_id 
end

return  guild_boss_rank_info 