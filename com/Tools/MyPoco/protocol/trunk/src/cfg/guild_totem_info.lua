---@classdef record_guild_totem_info
local record_guild_totem_info = {}


record_guild_totem_info.id = 0--图腾ID
record_guild_totem_info.name =  ""--图腾名称
record_guild_totem_info.res_id = 0--资源
record_guild_totem_info.display_quality = 0--显示品质
record_guild_totem_info.quality = 0--阶段
record_guild_totem_info.advance_id = 0--升阶码
record_guild_totem_info.node_id_1 = 0--节点1id
record_guild_totem_info.node_id_2 = 0--节点2id
record_guild_totem_info.node_id_3 = 0--节点3id
record_guild_totem_info.node_id_4 = 0--节点4id
record_guild_totem_info.preset_guild_level = 0--升华需求军团等级
record_guild_totem_info.preset_node_level = 0--升华需求节点等级
record_guild_totem_info.next_quality_id = 0--升华后id
record_guild_totem_info.upgrade_cost_type = 0--升华消耗类型
record_guild_totem_info.upgrade_cost_value = 0--升华消耗类型值
record_guild_totem_info.upgrade_cost_size = 0--升华消耗数量
record_guild_totem_info.node_level = 0--节点等级上限
record_guild_totem_info.affect_type1 = 0--图腾属性类型1
record_guild_totem_info.affect_value1 = 0--图腾属性类型值1
record_guild_totem_info.affect_type2 = 0--图腾属性类型2
record_guild_totem_info.affect_value2 = 0--图腾属性类型值2
record_guild_totem_info.unlock_id = 0--前序图腾id
record_guild_totem_info.unlock_value = 0--前序图腾品质需求

local guild_totem_info = {
   _data = {   
    [1] = {10000,"奔狼图腾",10000,4,0,10000,1,2,3,4,0,0,10001,0,0,0,0,0,0,0,0,0,0,},  
    [2] = {10001,"奔狼图腾零阶",10000,4,1,10000,1,2,3,4,0,5,10002,3,231,1,5,0,0,0,0,0,0,},  
    [3] = {10002,"奔狼图腾一阶",10000,4,2,10000,1,2,3,4,0,10,10003,3,231,3,10,1,1441300,5,37930,0,0,},  
    [4] = {10003,"奔狼图腾二阶",10000,4,3,10000,1,2,3,4,0,15,10004,3,231,7,15,2,75860,1,1441300,0,0,},  
    [5] = {10004,"奔狼图腾三阶",10000,4,4,10000,1,2,3,4,3,20,10005,3,231,8,20,5,37930,2,75860,0,0,},  
    [6] = {10005,"奔狼图腾四阶",10000,4,5,10000,1,2,3,4,4,25,10006,3,231,12,25,1,1441300,5,37930,0,0,},  
    [7] = {10006,"奔狼图腾五阶",10000,4,6,10000,1,2,3,4,0,30,0,0,0,0,25,2,75860,1,1441300,0,0,},  
    [8] = {20000,"飞虎图腾",20000,5,0,20000,5,6,7,8,0,0,20001,0,0,0,0,0,0,0,0,10000,4,},  
    [9] = {20001,"飞虎图腾零阶",20000,5,1,20000,5,6,7,8,0,5,20002,3,231,3,5,0,0,0,0,10000,4,},  
    [10] = {20002,"飞虎图腾一阶",20000,5,2,20000,5,6,7,8,0,10,20003,3,231,7,10,11,40,13,40,10000,4,},  
    [11] = {20003,"飞虎图腾二阶",20000,5,3,20000,5,6,7,8,0,15,20004,3,231,15,15,12,40,11,40,10000,4,},  
    [12] = {20004,"飞虎图腾三阶",20000,5,4,20000,5,6,7,8,4,20,20005,3,231,20,20,13,40,14,40,10000,4,},  
    [13] = {20005,"飞虎图腾四阶",20000,5,5,20000,5,6,7,8,5,25,20006,3,231,30,25,14,40,12,40,10000,4,},  
    [14] = {20006,"飞虎图腾五阶",20000,5,6,20000,5,6,7,8,0,30,0,0,0,0,25,13,40,14,40,10000,4,},  
    [15] = {30000,"赤凤图腾",30000,6,0,30000,9,10,11,12,0,0,30001,0,0,0,0,0,0,0,0,20000,4,},  
    [16] = {30001,"赤凤图腾零阶",30000,6,1,30000,9,10,11,12,0,5,30002,3,231,5,5,0,0,0,0,20000,4,},  
    [17] = {30002,"赤凤图腾一阶",30000,6,2,30000,9,10,11,12,0,10,30003,3,231,10,10,207,20,208,20,20000,4,},  
    [18] = {30003,"赤凤图腾二阶",30000,6,3,30000,9,10,11,12,0,15,30004,3,231,18,15,207,20,208,20,20000,4,},  
    [19] = {30004,"赤凤图腾三阶",30000,6,4,30000,9,10,11,12,5,20,30005,3,231,26,20,207,20,208,20,20000,4,},  
    [20] = {30005,"赤凤图腾四阶",30000,6,5,30000,9,10,11,12,6,25,30006,3,231,39,25,207,20,208,20,20000,4,},  
    [21] = {30006,"赤凤图腾五阶",30000,6,6,30000,9,10,11,12,0,30,0,0,0,0,25,207,20,208,20,20000,4,},  
    [22] = {40000,"翔龙图腾",40000,7,0,40000,13,14,15,16,0,0,40001,0,0,0,0,0,0,0,0,30000,4,},  
    [23] = {40001,"翔龙图腾零阶",40000,7,1,40000,13,14,15,16,0,5,40002,3,231,10,5,0,0,0,0,30000,4,},  
    [24] = {40002,"翔龙图腾一阶",40000,7,2,40000,13,14,15,16,0,10,40003,3,231,18,10,205,20,206,20,30000,4,},  
    [25] = {40003,"翔龙图腾二阶",40000,7,3,40000,13,14,15,16,0,15,40004,3,231,28,15,205,20,206,20,30000,4,},  
    [26] = {40004,"翔龙图腾三阶",40000,7,4,40000,13,14,15,16,6,20,40005,3,231,44,20,205,20,206,20,30000,4,},  
    [27] = {40005,"翔龙图腾四阶",40000,7,5,40000,13,14,15,16,7,25,40006,3,231,66,25,205,20,206,20,30000,4,},  
    [28] = {40006,"翔龙图腾五阶",40000,7,6,40000,13,14,15,16,0,30,0,3,231,0,25,205,20,206,20,30000,4,},
    }
}

local __index_id = {   
    [10000] = 1,  
    [10001] = 2,  
    [10002] = 3,  
    [10003] = 4,  
    [10004] = 5,  
    [10005] = 6,  
    [10006] = 7,  
    [20000] = 8,  
    [20001] = 9,  
    [20002] = 10,  
    [20003] = 11,  
    [20004] = 12,  
    [20005] = 13,  
    [20006] = 14,  
    [30000] = 15,  
    [30001] = 16,  
    [30002] = 17,  
    [30003] = 18,  
    [30004] = 19,  
    [30005] = 20,  
    [30006] = 21,  
    [40000] = 22,  
    [40001] = 23,  
    [40002] = 24,  
    [40003] = 25,  
    [40004] = 26,  
    [40005] = 27,  
    [40006] = 28,
}

local __key_map = { 
    id = 1,
    name = 2,
    res_id = 3,
    display_quality = 4,
    quality = 5,
    advance_id = 6,
    node_id_1 = 7,
    node_id_2 = 8,
    node_id_3 = 9,
    node_id_4 = 10,
    preset_guild_level = 11,
    preset_node_level = 12,
    next_quality_id = 13,
    upgrade_cost_type = 14,
    upgrade_cost_value = 15,
    upgrade_cost_size = 16,
    node_level = 17,
    affect_type1 = 18,
    affect_value1 = 19,
    affect_type2 = 20,
    affect_value2 = 21,
    unlock_id = 22,
    unlock_value = 23,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_guild_totem_info")

        return t._raw[__key_map[k]]
    end
}


function guild_totem_info.getLength()
    return #guild_totem_info._data
end



function guild_totem_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_guild_totem_info
function guild_totem_info.indexOf(index)
    if index == nil or not guild_totem_info._data[index] then
        return nil
    end
    return setmetatable({_raw = guild_totem_info._data[index]}, m)
end



---
--@return @class record_guild_totem_info
function guild_totem_info.get(id)
    
    return guild_totem_info.indexOf(__index_id[ id ])
     
end



function guild_totem_info.set(id, key, value)
    local record = guild_totem_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function guild_totem_info.get_index_data()
    return __index_id 
end

return  guild_totem_info 