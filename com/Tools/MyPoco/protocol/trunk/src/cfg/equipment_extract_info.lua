---@classdef record_equipment_extract_info
local record_equipment_extract_info = {}


record_equipment_extract_info.id = 0--id
record_equipment_extract_info.name =  ""--名称
record_equipment_extract_info.recruit_knight_1 = 0--正常卡池
record_equipment_extract_info.recruit_knight_bottom = 0--保底卡池
record_equipment_extract_info.cost_gain_1 = 0--单抽消耗id
record_equipment_extract_info.cost_gain_10 = 0--十连消耗id
record_equipment_extract_info.shop_group = 0--商店组
record_equipment_extract_info.lucky_draw = 0--幸运抽奖
record_equipment_extract_info.hot_id = 0--热点id
record_equipment_extract_info.hot_image =  ""--热点图
record_equipment_extract_info.hot_dsc =  ""--热点文字
record_equipment_extract_info.help_text = 0--帮助文本

local equipment_extract_info = {
   _data = {   
    [1] = {100001,"限时金装第1期",31,32,9,10,901,0,0,"","",52,},  
    [2] = {100002,"限时金装(开服版本)",31,32,9,10,902,0,0,"","",52,},  
    [3] = {100003,"限时金装(装备、神兵、神兽装备 )",1001,1002,9,10,903,0,0,"","",52,},  
    [4] = {100004,"第4期 神兵4、装备、神兽",1001,1002,9,10,904,0,0,"","",52,},  
    [5] = {100005,"第5期 神兵1-5",1003,1004,9,10,905,0,0,"","",52,},  
    [6] = {100006,"金装(2.2.0)",1003,1004,9,10,906,0,0,"","",52,},  
    [7] = {100007,"紫金装加翻牌",4001,4002,9,10,907,90006,0,"","",100,},
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
}

local __key_map = { 
    id = 1,
    name = 2,
    recruit_knight_1 = 3,
    recruit_knight_bottom = 4,
    cost_gain_1 = 5,
    cost_gain_10 = 6,
    shop_group = 7,
    lucky_draw = 8,
    hot_id = 9,
    hot_image = 10,
    hot_dsc = 11,
    help_text = 12,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_equipment_extract_info")

        return t._raw[__key_map[k]]
    end
}


function equipment_extract_info.getLength()
    return #equipment_extract_info._data
end



function equipment_extract_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_equipment_extract_info
function equipment_extract_info.indexOf(index)
    if index == nil or not equipment_extract_info._data[index] then
        return nil
    end
    return setmetatable({_raw = equipment_extract_info._data[index]}, m)
end



---
--@return @class record_equipment_extract_info
function equipment_extract_info.get(id)
    
    return equipment_extract_info.indexOf(__index_id[ id ])
     
end



function equipment_extract_info.set(id, key, value)
    local record = equipment_extract_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function equipment_extract_info.get_index_data()
    return __index_id 
end

return  equipment_extract_info 