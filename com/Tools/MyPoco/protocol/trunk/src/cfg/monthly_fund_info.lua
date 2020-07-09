---@classdef record_monthly_fund_info
local record_monthly_fund_info = {}


record_monthly_fund_info.id = 0--活动id
record_monthly_fund_info.name =  ""--活动名称
record_monthly_fund_info.topic =  ""--活动主题
record_monthly_fund_info.topic_item = 0--主题图片
record_monthly_fund_info.pic = 0--背景图
record_monthly_fund_info.luxury_money = 0--豪华版金额
record_monthly_fund_info.reward_id_luxury = 0--豪华版奖励
record_monthly_fund_info.luxury_value = 0--豪华版价值
record_monthly_fund_info.premium_money = 0--至尊版金额
record_monthly_fund_info.reward_id_premium = 0--至尊版奖励
record_monthly_fund_info.premium_value = 0--至尊版价值
record_monthly_fund_info.reward_type_1 = 0--免费奖励类型1
record_monthly_fund_info.reward_value_1 = 0--免费奖励类型值1
record_monthly_fund_info.reward_size_1 = 0--免费奖励数量1

local monthly_fund_info = {
   _data = {   
    [1] = {100000,"月基金","金神兵大礼包",201,105,98,1,3888,328,2,6888,999,0,66,},
    }
}

local __index_id = {   
    [100000] = 1,
}

local __key_map = { 
    id = 1,
    name = 2,
    topic = 3,
    topic_item = 4,
    pic = 5,
    luxury_money = 6,
    reward_id_luxury = 7,
    luxury_value = 8,
    premium_money = 9,
    reward_id_premium = 10,
    premium_value = 11,
    reward_type_1 = 12,
    reward_value_1 = 13,
    reward_size_1 = 14,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_monthly_fund_info")

        return t._raw[__key_map[k]]
    end
}


function monthly_fund_info.getLength()
    return #monthly_fund_info._data
end



function monthly_fund_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_monthly_fund_info
function monthly_fund_info.indexOf(index)
    if index == nil or not monthly_fund_info._data[index] then
        return nil
    end
    return setmetatable({_raw = monthly_fund_info._data[index]}, m)
end



---
--@return @class record_monthly_fund_info
function monthly_fund_info.get(id)
    
    return monthly_fund_info.indexOf(__index_id[ id ])
     
end



function monthly_fund_info.set(id, key, value)
    local record = monthly_fund_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function monthly_fund_info.get_index_data()
    return __index_id 
end

return  monthly_fund_info 