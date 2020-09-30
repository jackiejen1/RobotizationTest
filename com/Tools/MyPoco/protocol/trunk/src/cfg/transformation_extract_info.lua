---@classdef record_transformation_extract_info
local record_transformation_extract_info = {}


record_transformation_extract_info.id = 0--id
record_transformation_extract_info.trans_id = 0--id
record_transformation_extract_info.name =  ""--名称
record_transformation_extract_info.recruit_knight_1 = 0--正常卡池
record_transformation_extract_info.recruit_knight_bottom = 0--保底卡池
record_transformation_extract_info.cost_gain_1 = 0--单抽消耗id
record_transformation_extract_info.cost_gain_10 = 0--十连消耗id
record_transformation_extract_info.shop_group = 0--商店组
record_transformation_extract_info.lucky_draw = 0--幸运抽奖
record_transformation_extract_info.hot_id = 0--热点id
record_transformation_extract_info.hot_image =  ""--热点图
record_transformation_extract_info.hot_dsc =  ""--热点文字

local transformation_extract_info = {
   _data = {   
    [1] = {100001,100001,"化身抽取第1期",45,46,11,12,1101,0,0,"","",},  
    [2] = {100002,100002,"化身抽取(开服用)",45,46,11,12,1101,0,0,"","",},  
    [3] = {100003,100003,"化身抽取(变装)",45,46,11,12,1102,0,0,"","",},  
    [4] = {100004,100004,"化身1-5，变装",1005,1006,11,12,1103,0,0,"","",},  
    [5] = {100005,100005,"化身1-4，金装(新服2.2.0)",1005,1006,11,12,1104,0,0,"","",},  
    [6] = {100006,100006,"化身1-5，金装(2.2.5)",1005,1006,11,12,1105,0,0,"","",},  
    [7] = {100007,100007,"化身1-5(2.3.0)",1005,1006,11,12,1106,0,0,"","",},  
    [8] = {100008,100008,"化身1-5(紫金)",1005,1006,11,12,1107,0,0,"","",},  
    [9] = {100009,100009,"紫金2化身和变装",1005,1006,11,12,1108,0,0,"","",},  
    [10] = {100010,100010,"紫金2化身(2.6.0开服)",1005,1006,11,12,1108,0,0,"","",},  
    [11] = {100011,100011,"姜子牙+紫金2(10.7)",1005,1006,11,12,1109,0,0,"","",},
    }
}

local __index_id = {   
    [100001] = 1,  
    [100002] = 2,  
    [100003] = 3,  
    [100004] = 4,  
    [100005] = 5,  
    [100006] = 6,  
    [100007] = 7,  
    [100008] = 8,  
    [100009] = 9,  
    [100010] = 10,  
    [100011] = 11,
}

local __key_map = { 
    id = 1,
    trans_id = 2,
    name = 3,
    recruit_knight_1 = 4,
    recruit_knight_bottom = 5,
    cost_gain_1 = 6,
    cost_gain_10 = 7,
    shop_group = 8,
    lucky_draw = 9,
    hot_id = 10,
    hot_image = 11,
    hot_dsc = 12,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_transformation_extract_info")

        return t._raw[__key_map[k]]
    end
}


function transformation_extract_info.getLength()
    return #transformation_extract_info._data
end



function transformation_extract_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_transformation_extract_info
function transformation_extract_info.indexOf(index)
    if index == nil or not transformation_extract_info._data[index] then
        return nil
    end
    return setmetatable({_raw = transformation_extract_info._data[index]}, m)
end



---
--@return @class record_transformation_extract_info
function transformation_extract_info.get(id)
    
    return transformation_extract_info.indexOf(__index_id[ id ])
     
end



function transformation_extract_info.set(id, key, value)
    local record = transformation_extract_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function transformation_extract_info.get_index_data()
    return __index_id 
end

return  transformation_extract_info 