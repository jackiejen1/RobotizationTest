---@classdef record_shop_precious_info
local record_shop_precious_info = {}


record_shop_precious_info.id = 0--id
record_shop_precious_info.name =  ""--商品名称
record_shop_precious_info.order = 0--显示顺序
record_shop_precious_info.show_level = 0--商品显示等级
record_shop_precious_info.buy_level = 0--商品购买等级
record_shop_precious_info.money = 0--商品价格
record_shop_precious_info.item_type = 0--商品类型
record_shop_precious_info.item_value = 0--商品类型值
record_shop_precious_info.item_size = 0--商品数量
record_shop_precious_info.item_des =  ""--描述

local shop_precious_info = {
   _data = {   
    [1] = {1,"跨服号角（小）",1,40,40,30,3,82,1,"跨服号角*1",},  
    [2] = {2,"跨服号角（中）",2,40,40,198,3,82,8,"跨服号角*8",},  
    [3] = {3,"跨服号角（大）",3,40,40,648,3,82,28,"跨服号角*28",},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [3] = 3,
}

local __key_map = { 
    id = 1,
    name = 2,
    order = 3,
    show_level = 4,
    buy_level = 5,
    money = 6,
    item_type = 7,
    item_value = 8,
    item_size = 9,
    item_des = 10,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_shop_precious_info")

        return t._raw[__key_map[k]]
    end
}


function shop_precious_info.getLength()
    return #shop_precious_info._data
end



function shop_precious_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_shop_precious_info
function shop_precious_info.indexOf(index)
    if index == nil or not shop_precious_info._data[index] then
        return nil
    end
    return setmetatable({_raw = shop_precious_info._data[index]}, m)
end



---
--@return @class record_shop_precious_info
function shop_precious_info.get(id)
    
    return shop_precious_info.indexOf(__index_id[ id ])
     
end



function shop_precious_info.set(id, key, value)
    local record = shop_precious_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function shop_precious_info.get_index_data()
    return __index_id 
end

return  shop_precious_info 