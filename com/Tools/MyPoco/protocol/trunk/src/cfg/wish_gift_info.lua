---@classdef record_wish_gift_info
local record_wish_gift_info = {}


record_wish_gift_info.id = 0--ID
record_wish_gift_info.server_time = 0--开服天数
record_wish_gift_info.level_down = 0--等级下限
record_wish_gift_info.level_up = 0--等级上限
record_wish_gift_info.time_type = 0--刷新类型
record_wish_gift_info.price = 0--礼包价格
record_wish_gift_info.buy_time = 0--购买次数
record_wish_gift_info.award_1_type = 0--奖励1类型
record_wish_gift_info.award_1_value = 0--奖励1类型值
record_wish_gift_info.award_1_size = 0--奖励1数量
record_wish_gift_info.award_2_type = 0--奖励2类型
record_wish_gift_info.award_2_value = 0--奖励2类型值
record_wish_gift_info.award_2_size = 0--奖励2数量
record_wish_gift_info.award_3_type = 0--奖励3类型
record_wish_gift_info.award_3_value = 0--奖励3类型值
record_wish_gift_info.award_3_size = 0--奖励3数量

local wish_gift_info = {
   _data = {   
    [1] = {1,2,1,999,1,30,1,1,37,60,999,0,88,0,0,0,},  
    [2] = {2,2,1,999,1,60,1,1,37,120,999,0,188,0,0,0,},  
    [3] = {3,2,1,999,2,98,2,1,37,200,999,0,588,3,1,15,},  
    [4] = {4,2,1,999,2,198,2,1,37,400,999,0,1088,3,1,30,},  
    [5] = {5,2,1,999,2,328,1,1,37,800,999,0,3088,3,1,50,},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [3] = 3,  
    [4] = 4,  
    [5] = 5,
}

local __key_map = { 
    id = 1,
    server_time = 2,
    level_down = 3,
    level_up = 4,
    time_type = 5,
    price = 6,
    buy_time = 7,
    award_1_type = 8,
    award_1_value = 9,
    award_1_size = 10,
    award_2_type = 11,
    award_2_value = 12,
    award_2_size = 13,
    award_3_type = 14,
    award_3_value = 15,
    award_3_size = 16,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_wish_gift_info")

        return t._raw[__key_map[k]]
    end
}


function wish_gift_info.getLength()
    return #wish_gift_info._data
end



function wish_gift_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_wish_gift_info
function wish_gift_info.indexOf(index)
    if index == nil or not wish_gift_info._data[index] then
        return nil
    end
    return setmetatable({_raw = wish_gift_info._data[index]}, m)
end



---
--@return @class record_wish_gift_info
function wish_gift_info.get(id)
    
    return wish_gift_info.indexOf(__index_id[ id ])
     
end



function wish_gift_info.set(id, key, value)
    local record = wish_gift_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function wish_gift_info.get_index_data()
    return __index_id 
end

return  wish_gift_info 