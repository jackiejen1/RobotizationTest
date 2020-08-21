---@classdef record_guild_totem_info
local record_guild_totem_info = {}


record_guild_totem_info.id = 0--图腾ID
record_guild_totem_info.name =  ""--图腾名称
record_guild_totem_info.res_id = 0--资源
record_guild_totem_info.quality = 0--品质
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
    [1] = {10000,"未解锁狼图腾",10000,0,10000,1,2,3,4,0,0,10001,0,0,0,0,0,0,0,0,0,0,},  
    [2] = {10001,"孤狼图腾",10000,1,10000,1,2,3,4,0,5,10002,3,231,1,5,0,0,0,0,0,0,},  
    [3] = {10002,"奔狼图腾",10001,2,10000,1,2,3,4,0,10,10003,3,231,4,10,1,1441300,5,37930,0,0,},  
    [4] = {10003,"飞火奔狼图腾",10002,3,10000,1,2,3,4,0,15,10004,3,231,9,15,2,75860,1,1441250,0,0,},  
    [5] = {10004,"奔狼噬焰图腾",10003,4,10000,1,2,3,4,3,20,10005,3,231,16,20,5,37930,2,75860,0,0,},  
    [6] = {10005,"贪狼啸月图腾",10004,5,10000,1,2,3,4,4,25,10006,3,231,30,25,1,1441300,5,37930,0,0,},  
    [7] = {10006,"狼吞万里图腾",10005,6,10000,1,2,3,4,5,30,0,0,0,0,25,2,75860,1,1441300,0,0,},  
    [8] = {20000,"未解锁虎图腾",20000,0,20000,5,6,7,8,0,0,20001,0,0,0,0,0,0,0,0,10000,4,},  
    [9] = {20001,"伏虎图腾",20000,1,20000,5,6,7,8,0,5,20002,3,231,6,5,0,0,0,0,10000,4,},  
    [10] = {20002,"飞虎图腾",20001,2,20000,5,6,7,8,0,10,20003,3,231,12,10,11,75,13,50,10000,4,},  
    [11] = {20003,"山林虎啸图腾",20002,3,20000,5,6,7,8,0,15,20004,3,231,22,15,12,75,12,75,10000,4,},  
    [12] = {20004,"飞虎震山图腾",20003,4,20000,5,6,7,8,3,20,20005,3,231,40,20,13,50,14,50,10000,4,},  
    [13] = {20005,"狂虎撼岳图腾",20004,5,20000,5,6,7,8,4,25,20006,3,231,60,25,14,50,11,75,10000,4,},  
    [14] = {20006,"虎威凌世图腾",20005,6,20000,5,6,7,8,5,30,0,0,0,0,25,13,50,14,50,10000,4,},  
    [15] = {30000,"未解锁鹰图腾",30000,0,30000,9,10,11,12,0,0,30001,0,0,0,0,0,0,0,0,20000,4,},  
    [16] = {30001,"雏鹰图腾",30000,1,30000,9,10,11,12,0,5,30002,3,231,14,5,0,0,0,0,20000,4,},  
    [17] = {30002,"苍鹰图腾",30001,2,30000,9,10,11,12,0,10,30003,3,231,26,10,207,40,208,40,20000,4,},  
    [18] = {30003,"风起鹰翔图腾",30002,3,30000,9,10,11,12,0,15,30004,3,231,40,15,207,40,208,40,20000,4,},  
    [19] = {30004,"苍鹰逐风图腾",30003,4,30000,9,10,11,12,3,20,30005,3,231,60,20,207,40,208,40,20000,4,},  
    [20] = {30005,"天鹰猎空图腾",30004,5,30000,9,10,11,12,4,25,30006,3,231,80,25,207,40,208,40,20000,4,},  
    [21] = {30006,"鹰破九天图腾",30005,6,30000,9,10,11,12,5,30,0,0,0,0,25,207,40,208,40,20000,4,},  
    [22] = {40000,"未解锁龙图腾",40000,0,40000,13,14,15,16,0,0,40001,0,0,0,0,0,0,0,0,30000,4,},  
    [23] = {40001,"潜龙图腾",40000,1,40000,13,14,15,16,0,5,40002,3,231,20,5,0,0,0,0,30000,4,},  
    [24] = {40002,"翔龙图腾",40001,2,40000,13,14,15,16,0,10,40003,3,231,36,10,205,40,206,40,30000,4,},  
    [25] = {40003,"天雷唤龙图腾",40002,3,40000,13,14,15,16,0,15,40004,3,231,56,15,205,40,206,40,30000,4,},  
    [26] = {40004,"翔龙出世图腾",40003,4,40000,13,14,15,16,3,20,40005,3,231,80,20,205,40,206,40,30000,4,},  
    [27] = {40005,"神龙炼雷图腾",40004,5,40000,13,14,15,16,4,25,40006,3,231,108,25,205,40,206,40,30000,4,},  
    [28] = {40006,"龙吟八荒图腾",40005,6,40000,13,14,15,16,5,30,0,3,231,0,25,205,40,206,40,30000,4,},
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
    quality = 4,
    advance_id = 5,
    node_id_1 = 6,
    node_id_2 = 7,
    node_id_3 = 8,
    node_id_4 = 9,
    preset_guild_level = 10,
    preset_node_level = 11,
    next_quality_id = 12,
    upgrade_cost_type = 13,
    upgrade_cost_value = 14,
    upgrade_cost_size = 15,
    node_level = 16,
    affect_type1 = 17,
    affect_value1 = 18,
    affect_type2 = 19,
    affect_value2 = 20,
    unlock_id = 21,
    unlock_value = 22,
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