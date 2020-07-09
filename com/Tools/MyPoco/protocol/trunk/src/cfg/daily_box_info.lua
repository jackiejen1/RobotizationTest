---@classdef record_daily_box_info
local record_daily_box_info = {}


record_daily_box_info.id = 0--ID
record_daily_box_info.min_level = 0--最低等级
record_daily_box_info.max_level = 0--最高等级
record_daily_box_info.price = 0--礼包价格
record_daily_box_info.buy_time = 0--购买次数
record_daily_box_info.box_gread = 0--所属挡位
record_daily_box_info.show_price = 0--原价
record_daily_box_info.box_name =  ""--礼包名称
record_daily_box_info.reward_type1 = 0--物品类型1
record_daily_box_info.reward_value1 = 0--物品类型值1
record_daily_box_info.reward_num1 = 0--物品数量1
record_daily_box_info.reward_type2 = 0--物品类型2
record_daily_box_info.reward_value2 = 0--物品类型值2
record_daily_box_info.reward_num2 = 0--物品数量2
record_daily_box_info.reward_type3 = 0--物品类型3
record_daily_box_info.reward_value3 = 0--物品类型值3
record_daily_box_info.reward_num3 = 0--物品数量3
record_daily_box_info.reward_type4 = 0--物品类型4
record_daily_box_info.reward_value4 = 0--物品类型值4
record_daily_box_info.reward_num4 = 0--物品数量4

local daily_box_info = {
   _data = {   
    [1] = {1,1,42,1,1,1,35,"1元礼包",3,37,15,999,0,100,3,1,1,3,2,100,},  
    [2] = {2,1,42,3,1,3,70,"3元礼包",3,22,5,999,0,150,3,2004,1,3,1,1,},  
    [3] = {3,1,42,6,1,6,120,"6元礼包",3,22,10,999,0,200,3,11,100,3,1,3,},  
    [4] = {4,43,52,1,1,1,35,"1元礼包",3,37,15,999,0,100,8,13030,2,3,1,1,},  
    [5] = {5,43,52,3,1,3,70,"3元礼包",3,22,5,999,0,150,3,2009,1,3,1,1,},  
    [6] = {6,43,52,6,1,6,120,"6元礼包",3,22,10,999,0,200,3,32,10,3,1,3,},  
    [7] = {7,53,999,1,1,1,65,"1元礼包",3,51,2,999,0,100,3,37,15,3,1,1,},  
    [8] = {8,53,999,3,1,3,100,"3元礼包",3,2069,5,999,0,150,3,22,5,3,1,2,},  
    [9] = {9,53,999,6,1,6,180,"6元礼包",3,2069,10,999,0,200,3,22,10,3,1,2,},  
    [10] = {10,53,999,1,1,1,65,"1元礼包",3,51,2,999,0,100,3,37,15,3,1,1,},  
    [11] = {11,53,999,3,1,3,100,"3元礼包",3,2069,5,999,0,150,3,22,5,3,1,2,},  
    [12] = {12,53,999,6,1,6,180,"6元礼包",3,2069,10,999,0,200,3,22,10,3,1,2,},  
    [13] = {13,53,999,1,1,1,65,"1元礼包",3,51,2,999,0,100,3,37,15,3,1,1,},  
    [14] = {14,53,999,3,1,3,100,"3元礼包",3,2069,5,999,0,150,3,22,5,3,1,2,},  
    [15] = {15,53,999,6,1,6,180,"6元礼包",3,2069,10,999,0,200,3,22,10,3,1,2,},  
    [16] = {201,1,52,1,1,1,60,"1元礼包",3,2036,5,999,0,50,3,2,100,3,1,1,},  
    [17] = {202,1,52,3,1,3,120,"3元礼包",3,22,10,999,0,100,3,15,50,3,1,1,},  
    [18] = {203,1,52,6,1,6,180,"6元礼包",3,2054,15,999,0,150,3,11,100,3,1,3,},  
    [19] = {204,53,69,1,1,1,60,"1元礼包",3,2036,10,999,0,50,3,22,5,3,1,1,},  
    [20] = {205,53,69,3,1,3,120,"3元礼包",3,2005,5,999,0,100,3,15,50,3,1,1,},  
    [21] = {206,53,69,6,1,6,180,"6元礼包",3,2083,5,999,0,150,3,56,200,3,1,3,},  
    [22] = {207,70,99,1,1,1,68,"1元礼包",3,2005,5,999,0,50,3,15,50,3,1,1,},  
    [23] = {208,70,99,3,1,3,198,"3元礼包",3,2091,5,999,0,100,3,56,150,3,1,2,},  
    [24] = {209,70,99,6,1,6,238,"6元礼包",3,2309,5,999,0,150,3,133,20,3,1,3,},  
    [25] = {210,100,999,1,1,1,68,"1元礼包",3,2005,5,999,0,50,3,15,50,3,1,1,},  
    [26] = {211,100,999,3,1,3,198,"3元礼包",3,2092,5,999,0,100,3,56,150,3,1,2,},  
    [27] = {212,100,999,6,1,6,238,"6元礼包",3,2327,5,999,0,150,3,133,20,3,1,3,},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [3] = 3,  
    [4] = 4,  
    [5] = 5,  
    [6] = 6,  
    [7] = 7,  
    [8] = 8,  
    [9] = 9,  
    [10] = 10,  
    [11] = 11,  
    [12] = 12,  
    [13] = 13,  
    [14] = 14,  
    [15] = 15,  
    [201] = 16,  
    [202] = 17,  
    [203] = 18,  
    [204] = 19,  
    [205] = 20,  
    [206] = 21,  
    [207] = 22,  
    [208] = 23,  
    [209] = 24,  
    [210] = 25,  
    [211] = 26,  
    [212] = 27,
}

local __key_map = { 
    id = 1,
    min_level = 2,
    max_level = 3,
    price = 4,
    buy_time = 5,
    box_gread = 6,
    show_price = 7,
    box_name = 8,
    reward_type1 = 9,
    reward_value1 = 10,
    reward_num1 = 11,
    reward_type2 = 12,
    reward_value2 = 13,
    reward_num2 = 14,
    reward_type3 = 15,
    reward_value3 = 16,
    reward_num3 = 17,
    reward_type4 = 18,
    reward_value4 = 19,
    reward_num4 = 20,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_daily_box_info")

        return t._raw[__key_map[k]]
    end
}


function daily_box_info.getLength()
    return #daily_box_info._data
end



function daily_box_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_daily_box_info
function daily_box_info.indexOf(index)
    if index == nil or not daily_box_info._data[index] then
        return nil
    end
    return setmetatable({_raw = daily_box_info._data[index]}, m)
end



---
--@return @class record_daily_box_info
function daily_box_info.get(id)
    
    return daily_box_info.indexOf(__index_id[ id ])
     
end



function daily_box_info.set(id, key, value)
    local record = daily_box_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function daily_box_info.get_index_data()
    return __index_id 
end

return  daily_box_info 