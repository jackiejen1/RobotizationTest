---@classdef record_invite_shop_info
local record_invite_shop_info = {}


record_invite_shop_info.id = 0--id
record_invite_shop_info.holiday_id = 0--所属欢庆ID
record_invite_shop_info.reset = 0--是否每日重置
record_invite_shop_info.drop_id = 0--奖励
record_invite_shop_info.price_type_1 = 0--购买货币1类型
record_invite_shop_info.price_value_1 = 0--购买货币1类型值
record_invite_shop_info.price_size_1 = 0--购买货币1数量
record_invite_shop_info.buy_num = 0--购买次数

local invite_shop_info = {
   _data = {   
    [1] = {1,101,0,802,1,39,2888,1,},  
    [2] = {2,201,0,802,1,39,2888,1,},  
    [3] = {3,301,0,802,1,39,2888,1,},  
    [4] = {4,401,0,802,1,39,2888,1,},  
    [5] = {5,501,0,802,1,39,2888,1,},
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
    holiday_id = 2,
    reset = 3,
    drop_id = 4,
    price_type_1 = 5,
    price_value_1 = 6,
    price_size_1 = 7,
    buy_num = 8,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_invite_shop_info")

        return t._raw[__key_map[k]]
    end
}


function invite_shop_info.getLength()
    return #invite_shop_info._data
end



function invite_shop_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_invite_shop_info
function invite_shop_info.indexOf(index)
    if index == nil or not invite_shop_info._data[index] then
        return nil
    end
    return setmetatable({_raw = invite_shop_info._data[index]}, m)
end



---
--@return @class record_invite_shop_info
function invite_shop_info.get(id)
    
    return invite_shop_info.indexOf(__index_id[ id ])
     
end



function invite_shop_info.set(id, key, value)
    local record = invite_shop_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function invite_shop_info.get_index_data()
    return __index_id 
end

return  invite_shop_info 