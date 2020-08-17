---@classdef record_richest_info
local record_richest_info = {}


record_richest_info.id = 0--活动ID
record_richest_info.quality_type = 0--抽卡类型
record_richest_info.name =  ""--名称
record_richest_info.board = 0--对应棋盘ID
record_richest_info.score = 0--一次的积分
record_richest_info.cost_gain_1 = 0--购买类型（1次）
record_richest_info.cost_gain_10 = 0--购买类型（10次）
record_richest_info.rank_num = 0--排名保底值
record_richest_info.shop = 0--关联商店组
record_richest_info.hot_id = 0--热点id
record_richest_info.hot_image =  ""--热点图
record_richest_info.hot_dsc =  ""--热点文字
record_richest_info.help_text = 0--帮助文本

local richest_info = {
   _data = {   
    [1] = {100001,1,"1期(金1-金2)",1,10,13,14,600,1801,0,"","",78,},  
    [2] = {100002,1,"2期(金1-金3)",1,10,13,14,600,1802,0,"","",78,},  
    [3] = {100003,1,"3期(金1-金4)",1,10,13,14,600,1803,0,"","",78,},  
    [4] = {100004,1,"4期(金1-金4)",1,10,13,14,600,1804,0,"","",78,},  
    [5] = {100005,1,"紫金1神兽(8.10)",3,10,13,14,600,1805,0,"","",105,},  
    [6] = {100005,2,"紫金1神兽(8.10)",4,10,23,24,600,1805,0,"","",105,},
    }
}

local __index_id_quality_type = {   
    ["100001_1"] = 1,  
    ["100002_1"] = 2,  
    ["100003_1"] = 3,  
    ["100004_1"] = 4,  
    ["100005_1"] = 5,  
    ["100005_2"] = 6,
}

local __key_map = { 
    id = 1,
    quality_type = 2,
    name = 3,
    board = 4,
    score = 5,
    cost_gain_1 = 6,
    cost_gain_10 = 7,
    rank_num = 8,
    shop = 9,
    hot_id = 10,
    hot_image = 11,
    hot_dsc = 12,
    help_text = 13,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_richest_info")

        return t._raw[__key_map[k]]
    end
}


function richest_info.getLength()
    return #richest_info._data
end



function richest_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_richest_info
function richest_info.indexOf(index)
    if index == nil or not richest_info._data[index] then
        return nil
    end
    return setmetatable({_raw = richest_info._data[index]}, m)
end



---
--@return @class record_richest_info
function richest_info.get(id,quality_type)
    
    local k = id .. '_' .. quality_type
    return richest_info.indexOf(__index_id_quality_type[k])
     
end



function richest_info.set(id,quality_type, key, value)
    local record = richest_info.get(id,quality_type)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function richest_info.get_index_data()
    return __index_id_quality_type 
end

return  richest_info 