---@classdef record_richest_info
local record_richest_info = {}


record_richest_info.id = 0--活动ID
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

local richest_info = {
   _data = {   
    [1] = {100001,"1期(金1-金2)",1,10,13,14,600,1801,0,"","",},  
    [2] = {100002,"2期(金1-金3)",1,10,13,14,600,1802,0,"","",},  
    [3] = {100003,"3期(金1-金4)",1,10,13,14,600,1803,0,"","",},  
    [4] = {100004,"4期(金1-金4)",1,10,13,14,600,1804,0,"","",},
    }
}

local __index_id = {   
    [100001] = 1,  
    [100002] = 2,  
    [100003] = 3,  
    [100004] = 4,
}

local __key_map = { 
    id = 1,
    name = 2,
    board = 3,
    score = 4,
    cost_gain_1 = 5,
    cost_gain_10 = 6,
    rank_num = 7,
    shop = 8,
    hot_id = 9,
    hot_image = 10,
    hot_dsc = 11,
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
function richest_info.get(id)
    
    return richest_info.indexOf(__index_id[ id ])
     
end



function richest_info.set(id, key, value)
    local record = richest_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function richest_info.get_index_data()
    return __index_id 
end

return  richest_info 