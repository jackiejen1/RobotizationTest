---@classdef record_order_shop_info
local record_order_shop_info = {}


record_order_shop_info.id = 0--id
record_order_shop_info.goods_id = 0--货物ID
record_order_shop_info.name =  ""--货物名称
record_order_shop_info.shop_type = 0--商店页签
record_order_shop_info.shop_name = 0--页签名称
record_order_shop_info.discount = 0--折扣
record_order_shop_info.open_time = 0--开始时间
record_order_shop_info.end_time = 0--结束时间
record_order_shop_info.reset = 0--是否每日重置
record_order_shop_info.type = 0--货物类型
record_order_shop_info.value = 0--货物类型值
record_order_shop_info.size = 0--货物数量
record_order_shop_info.price_type_1 = 0--购买货币1类型
record_order_shop_info.price_value_1 = 0--购买货币1类型值
record_order_shop_info.price_size_1 = 0--购买货币1数量
record_order_shop_info.price_type_2 = 0--购买货币2类型
record_order_shop_info.price_value_2 = 0--购买货币2类型值
record_order_shop_info.price_size_2 = 0--购买货币2数量
record_order_shop_info.buy_num = 0--购买限制次数
record_order_shop_info.sort = 0--排序

local order_shop_info = {
   _data = {   
    [1] = {1,1001,"苍叶绿绮琴碎片",1,NaN,0,1,4,0,2,23060,5,3,92,10,0,0,0,223,1,},  
    [2] = {1,1002,"金将碎片箱(一)",1,NaN,0,1,4,0,3,2038,5,3,92,10,0,0,0,62,2,},  
    [3] = {1,1003,"猛将",1,NaN,0,1,4,0,11,600,1,3,92,500,0,0,0,1,3,},  
    [4] = {1,1004,"新年气象",1,NaN,0,1,4,0,9,57,1,3,92,15,0,0,0,1,4,},  
    [5] = {1,1005,"爆竹",2,NaN,0,1,4,0,3,91,1,3,92,1,0,0,0,99999999,5,},  
    [6] = {1,1006,"烟花",2,NaN,0,1,4,0,3,90,2,3,91,1,0,0,0,99999999,6,},  
    [7] = {1,1007,"红色神兵碎片选择箱",2,NaN,0,1,4,0,3,2069,5,3,91,5,0,0,0,8,7,},  
    [8] = {1,1008,"全红将碎片箱",2,NaN,0,1,4,0,3,2062,4,3,91,2,0,0,0,10,8,},  
    [9] = {1,1009,"红宝碎片选择箱",2,NaN,0,1,4,0,3,2010,1,3,91,5,0,0,0,2,9,},  
    [10] = {1,1010,"红装碎片选择箱",2,NaN,0,1,4,0,3,2054,5,3,91,4,0,0,0,15,10,},  
    [11] = {1,1011,"经验虎符",2,NaN,0,1,4,0,8,13030,1,3,91,1,0,0,0,150,11,},  
    [12] = {1,1012,"红宝碎片选择箱",2,NaN,0,1,4,0,3,2010,1,3,90,10,0,0,0,2,12,},  
    [13] = {1,1013,"银币",2,NaN,0,1,4,0,1,3,50000,3,90,1,0,0,0,300,13,},  
    [14] = {1,1014,"培养丹",2,NaN,0,1,4,0,3,2,50,3,90,5,0,0,0,20,14,},  
    [15] = {1,1015,"顶级精炼石",2,NaN,0,1,4,0,3,15,10,3,90,4,0,0,0,100,15,},  
    [16] = {1,1016,"宝物精炼石",2,NaN,0,1,4,0,3,17,50,3,90,5,0,0,0,10,16,},  
    [17] = {1,1017,"神兵铸造石",2,NaN,0,1,4,0,3,56,50,3,90,5,0,0,0,30,17,},  
    [18] = {1,1018,"苍叶绿绮琴碎片",3,NaN,0,1,4,0,2,23060,5,999,0,1000,0,0,0,7,18,},  
    [19] = {1,1019,"全红将碎片箱",3,NaN,80,1,4,0,3,2062,10,999,0,400,0,0,0,8,19,},  
    [20] = {1,1020,"红装碎片选择箱",3,NaN,80,1,4,0,3,2054,15,999,0,960,0,0,0,5,20,},  
    [21] = {1,1021,"红宝碎片选择箱",3,NaN,80,1,4,0,3,2010,1,999,0,400,0,0,0,4,21,},  
    [22] = {1,1022,"红色神兵碎片选择箱",3,NaN,80,1,4,0,3,2069,10,999,0,800,0,0,0,8,22,},  
    [23] = {1,1023,"兵符铸造石",3,NaN,80,1,4,0,3,32,10,999,0,400,0,0,0,30,23,},  
    [24] = {1,1024,"顶级精炼石",3,NaN,50,1,4,0,3,15,80,999,0,800,0,0,0,2,24,},  
    [25] = {1,1025,"银币",3,NaN,50,1,4,0,1,3,1500000,999,0,750,0,0,0,2,25,},  
    [26] = {1,1026,"培养丹",3,NaN,50,1,4,0,3,2,300,999,0,750,0,0,0,2,26,},  
    [27] = {1,1027,"顶级精炼石",3,NaN,80,1,4,0,3,15,20,999,0,320,0,0,0,100,27,},  
    [28] = {1,1028,"神兵铸造石",3,NaN,80,1,4,0,3,56,100,999,0,400,0,0,0,10,28,},  
    [29] = {1,1029,"银币",3,NaN,80,1,4,0,1,3,200000,999,0,160,0,0,0,50,29,},
    }
}

local __index_id_goods_id = {   
    ["1_1001"] = 1,  
    ["1_1002"] = 2,  
    ["1_1003"] = 3,  
    ["1_1004"] = 4,  
    ["1_1005"] = 5,  
    ["1_1006"] = 6,  
    ["1_1007"] = 7,  
    ["1_1008"] = 8,  
    ["1_1009"] = 9,  
    ["1_1010"] = 10,  
    ["1_1011"] = 11,  
    ["1_1012"] = 12,  
    ["1_1013"] = 13,  
    ["1_1014"] = 14,  
    ["1_1015"] = 15,  
    ["1_1016"] = 16,  
    ["1_1017"] = 17,  
    ["1_1018"] = 18,  
    ["1_1019"] = 19,  
    ["1_1020"] = 20,  
    ["1_1021"] = 21,  
    ["1_1022"] = 22,  
    ["1_1023"] = 23,  
    ["1_1024"] = 24,  
    ["1_1025"] = 25,  
    ["1_1026"] = 26,  
    ["1_1027"] = 27,  
    ["1_1028"] = 28,  
    ["1_1029"] = 29,
}

local __key_map = { 
    id = 1,
    goods_id = 2,
    name = 3,
    shop_type = 4,
    shop_name = 5,
    discount = 6,
    open_time = 7,
    end_time = 8,
    reset = 9,
    type = 10,
    value = 11,
    size = 12,
    price_type_1 = 13,
    price_value_1 = 14,
    price_size_1 = 15,
    price_type_2 = 16,
    price_value_2 = 17,
    price_size_2 = 18,
    buy_num = 19,
    sort = 20,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_order_shop_info")

        return t._raw[__key_map[k]]
    end
}


function order_shop_info.getLength()
    return #order_shop_info._data
end



function order_shop_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_order_shop_info
function order_shop_info.indexOf(index)
    if index == nil or not order_shop_info._data[index] then
        return nil
    end
    return setmetatable({_raw = order_shop_info._data[index]}, m)
end



---
--@return @class record_order_shop_info
function order_shop_info.get(id,goods_id)
    
    local k = id .. '_' .. goods_id
    return order_shop_info.indexOf(__index_id_goods_id[k])
     
end



function order_shop_info.set(id,goods_id, key, value)
    local record = order_shop_info.get(id,goods_id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function order_shop_info.get_index_data()
    return __index_id_goods_id 
end

return  order_shop_info 