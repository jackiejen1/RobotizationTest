---@classdef record_play_num_info
local record_play_num_info = {}


record_play_num_info.id = 0--id
record_play_num_info.direction =  ""--描述
record_play_num_info.num_get_type = 0--次数获取行为
record_play_num_info.reset = 0--初始次数
record_play_num_info.reset_type = 0--次数重置类型
record_play_num_info.buy_vip_num = 0--vip购买限制次数
record_play_num_info.price_type = 0--购买货币类型
record_play_num_info.price_value = 0--购买货币类型值
record_play_num_info.price_add_id = 0--成长价格关联

local play_num_info = {
   _data = {   
    [1] = {1,"竞技次数",1,20,2,1,999,0,10,},  
    [2] = {2,"无双次数",2,1,2,16,999,0,11,},  
    [3] = {4,"列传次数",1,10,2,3,999,0,3,},  
    [4] = {5,"战役次数",1,3,2,5,999,0,5,},  
    [5] = {6,"武将经验副本次数",1,2,2,8,999,0,7,},  
    [6] = {7,"银币副本次数",1,2,2,8,999,0,7,},  
    [7] = {8,"合击精华副本次数",1,2,2,8,999,0,7,},  
    [8] = {9,"宝物经验副本次数",1,2,2,8,999,0,7,},  
    [9] = {10,"封地巡逻平定次数",1,10,2,7,0,0,7,},  
    [10] = {11,"神秘商店手刷价格变化",2,0,2,9,0,0,0,},  
    [11] = {12,"限时优惠商店手刷价格变化",2,0,2,10,0,0,0,},  
    [12] = {13,"城池挑战次数",1,10,3,32,999,0,30,},  
    [13] = {14,"剑阁挑战次数",1,12,1,33,999,0,34,},  
    [14] = {15,"潼关挑战次数",1,12,1,33,999,0,34,},  
    [15] = {16,"虎牢关挑战次数",1,12,1,33,999,0,34,},  
    [16] = {34,"技能重置次数",1,0,3,34,999,0,35,},  
    [17] = {35,"神器商店手刷价格变化",2,0,2,36,0,0,0,},  
    [18] = {36,"神器副本次数",1,2,2,8,999,0,7,},  
    [19] = {37,"神兽商店手刷价格变化",2,0,2,37,0,0,0,},  
    [20] = {39,"探宝值",1,10,2,0,0,0,0,},  
    [21] = {40,"决战定军山玩法奖励次数",1,3,2,38,999,0,41,},  
    [22] = {41,"兵临城下日常奖励次数",1,3,2,0,0,0,0,},  
    [23] = {42,"兵临城下战车奖励次数",1,3,2,0,0,0,0,},  
    [24] = {43,"精英副本每日挑战次数",1,5,2,0,0,0,0,},  
    [25] = {44,"乱世英杰每日奖励次数",1,3,2,0,0,0,0,},  
    [26] = {45,"乱世英杰额外挑战次数",1,5,2,0,0,0,0,},  
    [27] = {46,"时空外传活动每日挑战次数",1,3,2,0,0,0,0,},  
    [28] = {47,"学宫论战每日挑战次数",1,10,2,0,0,0,0,},  
    [29] = {48,"学宫论战每日刷新次数",1,3,2,41,999,0,46,},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [4] = 3,  
    [5] = 4,  
    [6] = 5,  
    [7] = 6,  
    [8] = 7,  
    [9] = 8,  
    [10] = 9,  
    [11] = 10,  
    [12] = 11,  
    [13] = 12,  
    [14] = 13,  
    [15] = 14,  
    [16] = 15,  
    [34] = 16,  
    [35] = 17,  
    [36] = 18,  
    [37] = 19,  
    [39] = 20,  
    [40] = 21,  
    [41] = 22,  
    [42] = 23,  
    [43] = 24,  
    [44] = 25,  
    [45] = 26,  
    [46] = 27,  
    [47] = 28,  
    [48] = 29,
}

local __key_map = { 
    id = 1,
    direction = 2,
    num_get_type = 3,
    reset = 4,
    reset_type = 5,
    buy_vip_num = 6,
    price_type = 7,
    price_value = 8,
    price_add_id = 9,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_play_num_info")

        return t._raw[__key_map[k]]
    end
}


function play_num_info.getLength()
    return #play_num_info._data
end



function play_num_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_play_num_info
function play_num_info.indexOf(index)
    if index == nil or not play_num_info._data[index] then
        return nil
    end
    return setmetatable({_raw = play_num_info._data[index]}, m)
end



---
--@return @class record_play_num_info
function play_num_info.get(id)
    
    return play_num_info.indexOf(__index_id[ id ])
     
end



function play_num_info.set(id, key, value)
    local record = play_num_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function play_num_info.get_index_data()
    return __index_id 
end

return  play_num_info 