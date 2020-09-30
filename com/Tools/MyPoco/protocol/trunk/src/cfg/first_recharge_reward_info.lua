---@classdef record_first_recharge_reward_info
local record_first_recharge_reward_info = {}


record_first_recharge_reward_info.id = 0--id
record_first_recharge_reward_info.post_id = 0--后置阶段ID
record_first_recharge_reward_info.type = 0--充值类型
record_first_recharge_reward_info.num = 0--充值数额
record_first_recharge_reward_info.open = 0--是否开启
record_first_recharge_reward_info.show = 0--特殊展示
record_first_recharge_reward_info.recommend_des_1 =  ""--充值推荐1
record_first_recharge_reward_info.recommend_des_2 =  ""--充值推荐2
record_first_recharge_reward_info.price = 0--礼包价值
record_first_recharge_reward_info.reward_type_1 = 0--奖励类型1
record_first_recharge_reward_info.reward_value_1 = 0--奖励类型值1
record_first_recharge_reward_info.reward_size_1 = 0--奖励数量1
record_first_recharge_reward_info.reward_type_2 = 0--奖励类型2
record_first_recharge_reward_info.reward_value_2 = 0--奖励类型值2
record_first_recharge_reward_info.reward_size_2 = 0--奖励数量2
record_first_recharge_reward_info.reward_type_3 = 0--奖励类型3
record_first_recharge_reward_info.reward_value_3 = 0--奖励类型值3
record_first_recharge_reward_info.reward_size_3 = 0--奖励数量3
record_first_recharge_reward_info.reward_type_4 = 0--奖励类型4
record_first_recharge_reward_info.reward_value_4 = 0--奖励类型值4
record_first_recharge_reward_info.reward_size_4 = 0--奖励数量4
record_first_recharge_reward_info.reward_type_5 = 0--奖励类型5
record_first_recharge_reward_info.reward_value_5 = 0--奖励类型值5
record_first_recharge_reward_info.reward_size_5 = 0--奖励数量5
record_first_recharge_reward_info.reward_type_6 = 0--奖励类型6
record_first_recharge_reward_info.reward_value_6 = 0--奖励类型值6
record_first_recharge_reward_info.reward_size_6 = 0--奖励数量6
record_first_recharge_reward_info.reward_type_7 = 0--奖励类型7
record_first_recharge_reward_info.reward_value_7 = 0--奖励类型值7
record_first_recharge_reward_info.reward_size_7 = 0--奖励数量7

local first_recharge_reward_info = {
   _data = {   
    [1] = {1,2,1,1,1,1,"推荐&<99>普通月卡&","充值25元&<99>20倍&返利",10188,3,2059,1,7,311,1,7,312,1,7,313,1,7,314,1,1,3,188888,0,0,0,},  
    [2] = {2,3,3,88,1,1,"推荐&<99>高级月卡&","充值60元&<99>20倍&返利",16888,7,401,1,3,6,20,3,22,30,3,1,4,3,2,500,1,3,888888,0,0,0,},  
    [3] = {3,0,3,188,1,1,"推荐&<99>成长基金&","充值60元&<99>20倍&返利",22888,7,402,1,7,403,1,7,404,1,3,37,100,3,10,50,1,3,1888888,0,0,0,},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [3] = 3,
}

local __key_map = { 
    id = 1,
    post_id = 2,
    type = 3,
    num = 4,
    open = 5,
    show = 6,
    recommend_des_1 = 7,
    recommend_des_2 = 8,
    price = 9,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_first_recharge_reward_info")

        return t._raw[__key_map[k]]
    end
}


function first_recharge_reward_info.getLength()
    return #first_recharge_reward_info._data
end



function first_recharge_reward_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_first_recharge_reward_info
function first_recharge_reward_info.indexOf(index)
    if index == nil or not first_recharge_reward_info._data[index] then
        return nil
    end
    return setmetatable({_raw = first_recharge_reward_info._data[index]}, m)
end



---
--@return @class record_first_recharge_reward_info
function first_recharge_reward_info.get(id)
    
    return first_recharge_reward_info.indexOf(__index_id[ id ])
     
end



function first_recharge_reward_info.set(id, key, value)
    local record = first_recharge_reward_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function first_recharge_reward_info.get_index_data()
    return __index_id 
end

return  first_recharge_reward_info 