---@classdef record_order_world_info
local record_order_world_info = {}


record_order_world_info.id = 0--id
record_order_world_info.name =  ""--名称
record_order_world_info.shop_id = 0--对应的商店
record_order_world_info.rank_award_1 = 0--本服个人排行奖励
record_order_world_info.grade_1 = 0--本服排行保底积分
record_order_world_info.rank_award_3 = 0--跨服个人排行奖励
record_order_world_info.grade_2 = 0--跨服排行保底积分
record_order_world_info.guild_reward = 0--对应的公会等级奖励
record_order_world_info.activity_task = 0--对应的任务

local order_world_info = {
   _data = {   
    [1] = {10001,"号令天下一期",10004,13,500,14,2000,10001,10001,},
    }
}

local __index_id = {   
    [10001] = 1,
}

local __key_map = { 
    id = 1,
    name = 2,
    shop_id = 3,
    rank_award_1 = 4,
    grade_1 = 5,
    rank_award_3 = 6,
    grade_2 = 7,
    guild_reward = 8,
    activity_task = 9,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_order_world_info")

        return t._raw[__key_map[k]]
    end
}


function order_world_info.getLength()
    return #order_world_info._data
end



function order_world_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_order_world_info
function order_world_info.indexOf(index)
    if index == nil or not order_world_info._data[index] then
        return nil
    end
    return setmetatable({_raw = order_world_info._data[index]}, m)
end



---
--@return @class record_order_world_info
function order_world_info.get(id)
    
    return order_world_info.indexOf(__index_id[ id ])
     
end



function order_world_info.set(id, key, value)
    local record = order_world_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function order_world_info.get_index_data()
    return __index_id 
end

return  order_world_info 