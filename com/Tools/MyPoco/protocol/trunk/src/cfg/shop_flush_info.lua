---@classdef record_shop_flush_info
local record_shop_flush_info = {}


record_shop_flush_info.id = 0--商店ID
record_shop_flush_info.name =  ""--商店名称
record_shop_flush_info.function_id = 0--开启关联
record_shop_flush_info.goods_type = 0--货物绑定类型
record_shop_flush_info.progress_type = 0--进度计算类型
record_shop_flush_info.progress_reset_type = 0--进度重置类型
record_shop_flush_info.progress_reset_id = 0--进度重置时间关联
record_shop_flush_info.ordinary_index_num = 0--普通货架格子数
record_shop_flush_info.special_index_num = 0--特殊货架格子数
record_shop_flush_info.specia_index_type = 0--特殊货架解锁类型
record_shop_flush_info.specia_index_value = 0--特殊货架解锁类型值
record_shop_flush_info.auto_flush_time_id = 0--自动刷新时间关联
record_shop_flush_info.manual_flush_type = 0--手刷总次数重置时间
record_shop_flush_info.manual_flush_num_max = 0--手刷总次数限制
record_shop_flush_info.manual_flush_num_id = 0--付费手刷关联
record_shop_flush_info.manual_free_num_id = 0--免费手刷次数关联
record_shop_flush_info.flush_cost_type_1 = 0--手刷消耗1类型
record_shop_flush_info.flush_cost_value_1 = 0--手刷消耗1类型值
record_shop_flush_info.flush_cost_size_1 = 0--手刷消耗1数量
record_shop_flush_info.flush_cost_type_2 = 0--手刷消耗2类型
record_shop_flush_info.flush_cost_value_2 = 0--手刷消耗2类型值
record_shop_flush_info.flush_cost_size_2 = 0--手刷消耗2数量
record_shop_flush_info.flush_cost_type_3 = 0--手刷消耗3类型
record_shop_flush_info.flush_cost_value_3 = 0--手刷消耗3类型值
record_shop_flush_info.flush_cost_size_3 = 0--手刷消耗3数量

local shop_flush_info = {
   _data = {   
    [1] = {1,"神秘商店",20012,1,0,0,0,6,0,0,0,0,2,11,11,18,3,30,1,999,0,20,999,0,20,},  
    [2] = {2,"限时优惠商店",20013,1,1,2,202,6,1,1,30,202,2,12,12,0,0,0,0,0,0,0,0,0,0,},  
    [3] = {3,"神器商店",1904,1,0,0,0,6,0,0,0,0,2,36,35,30,999,0,20,0,0,0,0,0,0,},  
    [4] = {4,"神兽商店",2102,1,0,0,0,6,0,0,0,0,2,37,37,43,999,0,50,0,0,0,0,0,0,},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [3] = 3,  
    [4] = 4,
}

local __key_map = { 
    id = 1,
    name = 2,
    function_id = 3,
    goods_type = 4,
    progress_type = 5,
    progress_reset_type = 6,
    progress_reset_id = 7,
    ordinary_index_num = 8,
    special_index_num = 9,
    specia_index_type = 10,
    specia_index_value = 11,
    auto_flush_time_id = 12,
    manual_flush_type = 13,
    manual_flush_num_max = 14,
    manual_flush_num_id = 15,
    manual_free_num_id = 16,
    flush_cost_type_1 = 17,
    flush_cost_value_1 = 18,
    flush_cost_size_1 = 19,
    flush_cost_type_2 = 20,
    flush_cost_value_2 = 21,
    flush_cost_size_2 = 22,
    flush_cost_type_3 = 23,
    flush_cost_value_3 = 24,
    flush_cost_size_3 = 25,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_shop_flush_info")

        return t._raw[__key_map[k]]
    end
}


function shop_flush_info.getLength()
    return #shop_flush_info._data
end



function shop_flush_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_shop_flush_info
function shop_flush_info.indexOf(index)
    if index == nil or not shop_flush_info._data[index] then
        return nil
    end
    return setmetatable({_raw = shop_flush_info._data[index]}, m)
end



---
--@return @class record_shop_flush_info
function shop_flush_info.get(id)
    
    return shop_flush_info.indexOf(__index_id[ id ])
     
end



function shop_flush_info.set(id, key, value)
    local record = shop_flush_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function shop_flush_info.get_index_data()
    return __index_id 
end

return  shop_flush_info 