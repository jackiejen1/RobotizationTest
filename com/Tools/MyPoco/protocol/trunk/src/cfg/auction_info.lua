---@classdef record_auction_info
local record_auction_info = {}


record_auction_info.id = 0--ID
record_auction_info.name =  ""--玩法名称
record_auction_info.type =  ""--玩法类型
record_auction_info.range = 0--拍卖范围
record_auction_info.item_pool = 0--拍卖货物池
record_auction_info.join_num_min = 0--参与人数下限
record_auction_info.join_num_max = 0--参与人数上限
record_auction_info.prepare_time = 0--准备时间（秒）
record_auction_info.last_time = 0--持续时间（秒）
record_auction_info.min_auction_time = 0--最小竞拍时间（秒）
record_auction_info.bonus_parameter = 0--分红百分比参数
record_auction_info.bonus_rate = 0--分红倍率
record_auction_info.bonus_min = 0--分红下限
record_auction_info.bonus_max = 0--分红上限
record_auction_info.pass_last_time = 0--流拍持续时间（秒）
record_auction_info.txt = 0--分红详情
record_auction_info.function_id = 0--关联功能

local auction_info = {
   _data = {   
    [1] = {1,"城池争霸","1",3,1,0,5000,180,50220,30,700,1,200,2000,7020,49,10033,},  
    [2] = {2,"本服神将","2",1,2,0,50,180,21420,30,500,2,50,1000,7020,50,10034,},  
    [3] = {3,"战区神将","3",1,3,0,50,180,21420,30,700,3,100,1500,7020,51,10034,},
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
    type = 3,
    range = 4,
    item_pool = 5,
    join_num_min = 6,
    join_num_max = 7,
    prepare_time = 8,
    last_time = 9,
    min_auction_time = 10,
    bonus_parameter = 11,
    bonus_rate = 12,
    bonus_min = 13,
    bonus_max = 14,
    pass_last_time = 15,
    txt = 16,
    function_id = 17,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_auction_info")

        return t._raw[__key_map[k]]
    end
}


function auction_info.getLength()
    return #auction_info._data
end



function auction_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_auction_info
function auction_info.indexOf(index)
    if index == nil or not auction_info._data[index] then
        return nil
    end
    return setmetatable({_raw = auction_info._data[index]}, m)
end



---
--@return @class record_auction_info
function auction_info.get(id)
    
    return auction_info.indexOf(__index_id[ id ])
     
end



function auction_info.set(id, key, value)
    local record = auction_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function auction_info.get_index_data()
    return __index_id 
end

return  auction_info 