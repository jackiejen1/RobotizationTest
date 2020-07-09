---@classdef record_young_shop_info
local record_young_shop_info = {}


record_young_shop_info.id = 0--id
record_young_shop_info.young_id = 0--所属活动ID
record_young_shop_info.name =  ""--货物名称
record_young_shop_info.shop_type = 0--商店类型
record_young_shop_info.discount = 0--折扣
record_young_shop_info.reset = 0--是否每日重置
record_young_shop_info.buy_num = 0--购买限制次数
record_young_shop_info.type = 0--货物类型
record_young_shop_info.value = 0--货物类型值
record_young_shop_info.size = 0--货物数量
record_young_shop_info.price_type_1 = 0--购买货币1类型
record_young_shop_info.price_value_1 = 0--购买货币1类型值
record_young_shop_info.price_size_1 = 0--购买货币1数量
record_young_shop_info.sort = 0--排序

local young_shop_info = {
   _data = {   
    [1] = {1001,1,"金将碎片箱(五)",1,100,0,24,3,2331,5,3,188,10,1,},  
    [2] = {1002,1,"九天应龙碎片",1,100,0,20,2,15404,5,3,188,10,2,},  
    [3] = {1003,1,"七星宝刀碎片",1,100,0,20,2,23040,5,3,188,10,3,},  
    [4] = {1004,1,"金将碎片(12选1)",1,100,0,12,3,2086,5,3,194,10,4,},  
    [5] = {1005,1,"金神兽碎片2选1箱",1,100,0,10,3,2309,5,3,194,10,5,},  
    [6] = {1006,1,"金神兵碎片3选1箱",1,100,0,20,3,2091,5,3,194,10,6,},  
    [7] = {1007,1,"3阶神兽金装随机箱",1,100,0,3,3,2302,1,3,194,200,7,},  
    [8] = {1008,1,"金装碎片选择箱",1,100,0,15,3,2005,5,3,194,10,8,},  
    [9] = {1009,1,"太极升金石",1,100,0,35,3,157,1,3,194,10,9,},  
    [10] = {1010,1,"升金符2选1箱",1,100,0,100,3,2310,1,3,194,7,10,},  
    [11] = {1011,1,"配饰强化石",1,100,0,100,3,173,10,3,194,10,11,},  
    [12] = {1101,1,"金将碎片(16选1)",2,100,0,12,3,2304,5,999,0,1000,1,},  
    [13] = {1102,1,"金神兽碎片3选1箱",2,100,0,10,3,2327,5,999,0,1000,2,},  
    [14] = {1103,1,"金神兵碎片4选1箱",2,100,0,20,3,2092,5,999,0,1000,3,},  
    [15] = {1104,1,"3阶神兽金装随机箱",2,100,0,1,3,2302,1,999,0,20000,4,},  
    [16] = {1105,1,"金装碎片选择箱",2,100,0,15,3,2005,5,999,0,1000,5,},  
    [17] = {1106,1,"太极升金石",2,80,0,40,3,157,1,999,0,800,6,},  
    [18] = {1107,1,"升金符2选1箱",2,50,0,20,3,2310,5,999,0,1750,7,},  
    [19] = {1108,1,"配饰强化石",2,50,0,20,3,173,40,999,0,2000,8,},
    }
}

local __index_id = {   
    [1001] = 1,  
    [1002] = 2,  
    [1003] = 3,  
    [1004] = 4,  
    [1005] = 5,  
    [1006] = 6,  
    [1007] = 7,  
    [1008] = 8,  
    [1009] = 9,  
    [1010] = 10,  
    [1011] = 11,  
    [1101] = 12,  
    [1102] = 13,  
    [1103] = 14,  
    [1104] = 15,  
    [1105] = 16,  
    [1106] = 17,  
    [1107] = 18,  
    [1108] = 19,
}

local __key_map = { 
    id = 1,
    young_id = 2,
    name = 3,
    shop_type = 4,
    discount = 5,
    reset = 6,
    buy_num = 7,
    type = 8,
    value = 9,
    size = 10,
    price_type_1 = 11,
    price_value_1 = 12,
    price_size_1 = 13,
    sort = 14,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_young_shop_info")

        return t._raw[__key_map[k]]
    end
}


function young_shop_info.getLength()
    return #young_shop_info._data
end



function young_shop_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_young_shop_info
function young_shop_info.indexOf(index)
    if index == nil or not young_shop_info._data[index] then
        return nil
    end
    return setmetatable({_raw = young_shop_info._data[index]}, m)
end



---
--@return @class record_young_shop_info
function young_shop_info.get(id)
    
    return young_shop_info.indexOf(__index_id[ id ])
     
end



function young_shop_info.set(id, key, value)
    local record = young_shop_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function young_shop_info.get_index_data()
    return __index_id 
end

return  young_shop_info 