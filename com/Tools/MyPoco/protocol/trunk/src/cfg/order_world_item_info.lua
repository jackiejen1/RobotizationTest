---@classdef record_order_world_item_info
local record_order_world_item_info = {}


record_order_world_item_info.id = 0--id
record_order_world_item_info.per_num = 0--增加的个人积分
record_order_world_item_info.guild_num = 0--增加的军团积分
record_order_world_item_info.reward_type = 0--增加道具类型
record_order_world_item_info.reward_value = 0--增加道具值
record_order_world_item_info.reward_size = 0--增加道具数量

local order_world_item_info = {
   _data = {   
    [1] = {97,1,1,3,106,1,},  
    [2] = {98,2,2,3,107,1,},  
    [3] = {99,3,3,3,108,1,},  
    [4] = {127,1,1,3,106,1,},  
    [5] = {128,2,2,3,107,1,},  
    [6] = {129,3,3,3,108,1,},
    }
}

local __index_id = {   
    [97] = 1,  
    [98] = 2,  
    [99] = 3,  
    [127] = 4,  
    [128] = 5,  
    [129] = 6,
}

local __key_map = { 
    id = 1,
    per_num = 2,
    guild_num = 3,
    reward_type = 4,
    reward_value = 5,
    reward_size = 6,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_order_world_item_info")

        return t._raw[__key_map[k]]
    end
}


function order_world_item_info.getLength()
    return #order_world_item_info._data
end



function order_world_item_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_order_world_item_info
function order_world_item_info.indexOf(index)
    if index == nil or not order_world_item_info._data[index] then
        return nil
    end
    return setmetatable({_raw = order_world_item_info._data[index]}, m)
end



---
--@return @class record_order_world_item_info
function order_world_item_info.get(id)
    
    return order_world_item_info.indexOf(__index_id[ id ])
     
end



function order_world_item_info.set(id, key, value)
    local record = order_world_item_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function order_world_item_info.get_index_data()
    return __index_id 
end

return  order_world_item_info 