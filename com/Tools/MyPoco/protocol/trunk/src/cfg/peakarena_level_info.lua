---@classdef record_peakarena_level_info
local record_peakarena_level_info = {}


record_peakarena_level_info.id = 0--段位ID
record_peakarena_level_info.name =  ""--段位名称
record_peakarena_level_info.level = 0--等级
record_peakarena_level_info.star = 0--星数
record_peakarena_level_info.pic = 0--段位徽章
record_peakarena_level_info.pic2 = 0--段位名称底框
record_peakarena_level_info.integral = 0--积分要求
record_peakarena_level_info.rank_singlesrvr = 0--单服排名要求
record_peakarena_level_info.rank_onearea = 0--战区排名要求
record_peakarena_level_info.rank_allarea = 0--全服排名要求
record_peakarena_level_info.win_min_integral = 0--胜利获得最少积分
record_peakarena_level_info.win_max_integral = 0--胜利获得最大积分
record_peakarena_level_info.failure_min_sign = 0--失败获得最少积分符号位
record_peakarena_level_info.failure_min_integral = 0--失败获得最少积分
record_peakarena_level_info.failure_max_integral = 0--失败获得最大积分
record_peakarena_level_info.next_integral = 0--下赛季重置到的积分
record_peakarena_level_info.level_protection = 0--段位保护
record_peakarena_level_info.player_show_id = 0--匹配对手组
record_peakarena_level_info.enable_unite_token = 0--激活合击组
record_peakarena_level_info.strength_id = 0--段位属性加成
record_peakarena_level_info.reward_type_1 = 0--突破奖励类型1
record_peakarena_level_info.reward_value_1 = 0--突破奖励值1
record_peakarena_level_info.reward_size_1 = 0--突破奖励数量1
record_peakarena_level_info.reward_type_2 = 0--突破奖励类型2
record_peakarena_level_info.reward_value_2 = 0--突破奖励类型值2
record_peakarena_level_info.reward_size_2 = 0--突破奖励数量2
record_peakarena_level_info.reward_type_3 = 0--突破奖励类型3
record_peakarena_level_info.reward_value_3 = 0--突破奖励类型值3
record_peakarena_level_info.reward_size_3 = 0--突破奖励数量3

local peakarena_level_info = {
   _data = {   
    [1] = {1,"青铜一星",1,1,1,1,0,0,0,0,50,170,0,0,30,0,2000,1,0,190001,0,0,0,0,0,0,0,0,0,},  
    [2] = {2,"青铜二星",2,2,1,1,110,0,0,0,40,180,0,0,30,0,2000,1,0,190002,0,0,0,0,0,0,0,0,0,},  
    [3] = {3,"青铜三星",3,3,1,1,330,0,0,0,30,190,0,0,30,0,2000,1,0,190003,0,0,0,0,0,0,0,0,0,},  
    [4] = {4,"青铜四星",4,4,1,1,660,0,0,0,20,200,1,15,15,0,2000,1,0,190004,0,0,0,0,0,0,0,0,0,},  
    [5] = {5,"白银一星",5,1,2,2,1000,0,0,0,15,249,1,15,15,600,2000,1,1,190005,999,0,200,0,0,0,0,0,0,},  
    [6] = {6,"白银二星",6,2,2,2,1500,0,0,0,15,249,1,30,0,600,2000,1,0,190006,0,0,0,0,0,0,0,0,0,},  
    [7] = {7,"白银三星",7,3,2,2,2100,0,0,0,15,249,1,60,0,600,2000,1,0,190007,0,0,0,0,0,0,0,0,0,},  
    [8] = {8,"白银四星",8,4,2,2,2600,0,0,0,15,249,1,100,0,600,2000,1,0,190008,0,0,0,0,0,0,0,0,0,},  
    [9] = {9,"黄金一星",9,1,3,3,3400,0,0,0,10,298,1,150,0,1000,0,2,2,190009,999,0,300,0,0,0,0,0,0,},  
    [10] = {10,"黄金二星",10,2,3,3,4100,0,0,0,10,298,1,200,0,1000,0,2,0,190010,0,0,0,0,0,0,0,0,0,},  
    [11] = {11,"黄金三星",11,3,3,3,4900,0,0,0,10,298,1,240,0,1000,0,2,0,190011,0,0,0,0,0,0,0,0,0,},  
    [12] = {12,"黄金四星",12,4,3,3,5800,0,0,0,10,298,1,278,0,1000,0,2,0,190012,0,0,0,0,0,0,0,0,0,},  
    [13] = {13,"铂金一星",13,1,4,4,6900,0,0,0,10,342,1,352,0,1500,0,2,3,190013,999,0,500,0,0,0,0,0,0,},  
    [14] = {14,"铂金二星",14,2,4,4,7900,0,0,0,10,342,1,388,0,1500,0,2,0,190014,0,0,0,0,0,0,0,0,0,},  
    [15] = {15,"铂金三星",15,3,4,4,9000,0,0,0,10,342,1,405,0,1500,0,2,0,190015,0,0,0,0,0,0,0,0,0,},  
    [16] = {16,"铂金四星",16,4,4,4,10000,0,0,0,10,342,1,423,0,1500,0,2,0,190016,0,0,0,0,0,0,0,0,0,},  
    [17] = {17,"钻石一星",17,1,5,5,11400,0,0,0,5,391,1,515,0,2000,0,3,4,190017,999,0,600,0,0,0,0,0,0,},  
    [18] = {18,"钻石二星",18,2,5,5,12800,0,0,0,5,391,1,535,0,2000,0,3,0,190018,0,0,0,0,0,0,0,0,0,},  
    [19] = {19,"钻石三星",19,3,5,5,14200,0,0,0,5,391,1,545,0,2000,0,3,0,190019,0,0,0,0,0,0,0,0,0,},  
    [20] = {20,"钻石四星",20,4,5,5,15600,0,0,0,5,391,1,553,0,2000,0,3,0,190020,0,0,0,0,0,0,0,0,0,},  
    [21] = {21,"星耀一星",21,1,6,6,16400,0,0,500,0,418,1,592,0,3000,0,3,5,190021,999,0,800,0,0,0,0,0,0,},  
    [22] = {22,"星耀二星",22,2,6,6,17300,0,0,200,0,418,1,600,0,3000,0,3,0,190022,0,0,0,0,0,0,0,0,0,},  
    [23] = {23,"星耀三星",23,3,6,6,17900,0,0,100,0,418,1,609,0,3000,0,3,0,190023,0,0,0,0,0,0,0,0,0,},  
    [24] = {24,"星耀四星",24,4,6,6,18500,0,0,50,0,418,1,617,0,3000,0,3,0,190024,0,0,0,0,0,0,0,0,0,},  
    [25] = {25,"王者一星",25,1,7,7,19100,0,0,20,0,418,1,624,0,3500,0,3,6,190025,999,0,1200,0,0,0,0,0,0,},  
    [26] = {26,"王者二星",26,2,7,7,19800,0,0,10,0,418,1,632,0,3500,0,3,0,190026,0,0,0,0,0,0,0,0,0,},  
    [27] = {27,"王者三星",27,3,7,7,20400,0,0,5,0,440,1,672,0,3500,0,3,0,190027,0,0,0,0,0,0,0,0,0,},  
    [28] = {28,"王者四星",28,4,7,7,21100,0,0,1,0,440,1,679,0,3500,0,3,0,190028,0,0,0,0,0,0,0,0,0,},
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
}

local __key_map = { 
    id = 1,
    name = 2,
    level = 3,
    star = 4,
    pic = 5,
    pic2 = 6,
    integral = 7,
    rank_singlesrvr = 8,
    rank_onearea = 9,
    rank_allarea = 10,
    win_min_integral = 11,
    win_max_integral = 12,
    failure_min_sign = 13,
    failure_min_integral = 14,
    failure_max_integral = 15,
    next_integral = 16,
    level_protection = 17,
    player_show_id = 18,
    enable_unite_token = 19,
    strength_id = 20,
    reward_type_1 = 21,
    reward_value_1 = 22,
    reward_size_1 = 23,
    reward_type_2 = 24,
    reward_value_2 = 25,
    reward_size_2 = 26,
    reward_type_3 = 27,
    reward_value_3 = 28,
    reward_size_3 = 29,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_peakarena_level_info")

        return t._raw[__key_map[k]]
    end
}


function peakarena_level_info.getLength()
    return #peakarena_level_info._data
end



function peakarena_level_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_peakarena_level_info
function peakarena_level_info.indexOf(index)
    if index == nil or not peakarena_level_info._data[index] then
        return nil
    end
    return setmetatable({_raw = peakarena_level_info._data[index]}, m)
end



---
--@return @class record_peakarena_level_info
function peakarena_level_info.get(id)
    
    return peakarena_level_info.indexOf(__index_id[ id ])
     
end



function peakarena_level_info.set(id, key, value)
    local record = peakarena_level_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function peakarena_level_info.get_index_data()
    return __index_id 
end

return  peakarena_level_info 