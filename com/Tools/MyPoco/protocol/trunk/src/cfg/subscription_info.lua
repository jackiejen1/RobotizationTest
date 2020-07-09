---@classdef record_subscription_info
local record_subscription_info = {}


record_subscription_info.id = 0--id
record_subscription_info.name =  ""--名称
record_subscription_info.product_id =  ""--商品编号
record_subscription_info.reward_type_1 = 0--奖励1类型
record_subscription_info.reward_value_1 = 0--奖励1类型值
record_subscription_info.reward_size_1 = 0--奖励1数量
record_subscription_info.reward_type_2 = 0--奖励2类型
record_subscription_info.reward_value_2 = 0--奖励2类型值
record_subscription_info.reward_size_2 = 0--奖励2数量
record_subscription_info.reward_type_3 = 0--奖励3类型
record_subscription_info.reward_value_3 = 0--奖励3类型值
record_subscription_info.reward_size_3 = 0--奖励3数量
record_subscription_info.privilege_id_1 = 0--特权1
record_subscription_info.privilege_id_2 = 0--特权2
record_subscription_info.privilege_id_3 = 0--特权3
record_subscription_info.privilege_id_4 = 0--特权4
record_subscription_info.privilege_id_5 = 0--特权5
record_subscription_info.privilege_id_6 = 0--特权6
record_subscription_info.privilege_id_7 = 0--特权7
record_subscription_info.privilege_id_8 = 0--特权8
record_subscription_info.privilege_id_9 = 0--特权9
record_subscription_info.privilege_id_10 = 0--特权10
record_subscription_info.txt =  ""--特权描述

local subscription_info = {
   _data = {   
    [1] = {1,"订阅","SS2_subscription1",3,1,10,3,20,5,3,30,5,1,2,3,4,5,6,7,0,0,0,"1.每日领取&<5>专属礼包&\n2.挑战主线副本&<5>白色普通小兵&关卡&<5>可跳过&\n3.无双试炼开启&<5>扫荡功能&\n4.日常副本武将经验产出&<4>+100%&\n5.日常副本银币副本产出&<4>+100%&\n6.日常副本合击精华产出&<4>+100%&\n7.日常副本宝物经验产出&<4>+100%&\n8.日常副本神兵锻造石产出&<4>+100%",},
    }
}

local __index_id = {   
    [1] = 1,
}

local __key_map = { 
    id = 1,
    name = 2,
    product_id = 3,
    reward_type_1 = 4,
    reward_value_1 = 5,
    reward_size_1 = 6,
    reward_type_2 = 7,
    reward_value_2 = 8,
    reward_size_2 = 9,
    reward_type_3 = 10,
    reward_value_3 = 11,
    reward_size_3 = 12,
    privilege_id_1 = 13,
    privilege_id_2 = 14,
    privilege_id_3 = 15,
    privilege_id_4 = 16,
    privilege_id_5 = 17,
    privilege_id_6 = 18,
    privilege_id_7 = 19,
    privilege_id_8 = 20,
    privilege_id_9 = 21,
    privilege_id_10 = 22,
    txt = 23,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_subscription_info")

        return t._raw[__key_map[k]]
    end
}


function subscription_info.getLength()
    return #subscription_info._data
end



function subscription_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_subscription_info
function subscription_info.indexOf(index)
    if index == nil or not subscription_info._data[index] then
        return nil
    end
    return setmetatable({_raw = subscription_info._data[index]}, m)
end



---
--@return @class record_subscription_info
function subscription_info.get(id)
    
    return subscription_info.indexOf(__index_id[ id ])
     
end



function subscription_info.set(id, key, value)
    local record = subscription_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function subscription_info.get_index_data()
    return __index_id 
end

return  subscription_info 