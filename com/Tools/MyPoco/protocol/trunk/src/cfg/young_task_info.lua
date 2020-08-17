---@classdef record_young_task_info
local record_young_task_info = {}


record_young_task_info.id = 0--编号
record_young_task_info.young_id = 0--所属活动ID
record_young_task_info.desc =  ""--任务描述
record_young_task_info.name =  ""--任务名称
record_young_task_info.discount = 0--折扣
record_young_task_info.pic =  ""--充值图片
record_young_task_info.target_show = 0--任务进度
record_young_task_info.type = 0--任务类型
record_young_task_info.reset = 0--是否每日重置
record_young_task_info.target = 0--任务目标
record_young_task_info.target_value = 0--任务目标数值
record_young_task_info.reward_type_1 = 0--奖励类型1
record_young_task_info.reward_value_1 = 0--奖励类型值1
record_young_task_info.reward_size_1 = 0--奖励数量1
record_young_task_info.reward_type_2 = 0--奖励类型2
record_young_task_info.reward_value_2 = 0--奖励类型值2
record_young_task_info.reward_size_2 = 0--奖励数量2
record_young_task_info.reward_type_3 = 0--奖励类型3
record_young_task_info.reward_value_3 = 0--奖励类型值3
record_young_task_info.reward_size_3 = 0--奖励数量3
record_young_task_info.reward_type_4 = 0--奖励类型4
record_young_task_info.reward_value_4 = 0--奖励类型值4
record_young_task_info.reward_size_4 = 0--奖励数量4
record_young_task_info.reward_type_5 = 0--奖励类型5
record_young_task_info.reward_value_5 = 0--奖励类型值5
record_young_task_info.reward_size_5 = 0--奖励数量5
record_young_task_info.sort = 0--排序
record_young_task_info.route_id = 0--跳转路径

local young_task_info = {
   _data = {   
    [1] = {1001,1,"100%通关镇魂—灵槐异动","灵槐异动",100,"0",1,2,0,112,1001,999,0,1166,3,194,16,1,37,66,1,3,1616616,0,0,0,1,232,},  
    [2] = {1002,1,"100%通关镇魂—三国乱变","三国乱变",100,"0",1,2,0,112,1002,999,0,1166,3,194,16,1,37,66,1,3,1616616,0,0,0,2,232,},  
    [3] = {1003,1,"100%通关镇魂—清风化煞","清风化煞",100,"0",1,2,0,112,1003,999,0,1166,3,194,16,1,37,66,1,3,1616616,0,0,0,3,232,},  
    [4] = {1004,1,"100%通关镇魂—回天转日","回天转日",100,"0",1,2,0,112,1004,999,0,1166,3,194,16,1,37,66,1,3,1616616,0,0,0,4,232,},  
    [5] = {1101,1,"少年之力10","少年之力10",30,"icon_shaonianzhili_1",0,1,0,30,2,3,188,10,0,0,0,0,0,0,0,0,0,0,0,0,1,0,},  
    [6] = {1102,1,"少年之力30","少年之力30",30,"icon_shaonianzhili_2",0,1,0,98,2,3,188,30,0,0,0,0,0,0,0,0,0,0,0,0,2,0,},  
    [7] = {1103,1,"少年之力60","少年之力60",30,"icon_shaonianzhili_3",0,1,0,198,1,3,188,60,0,0,0,0,0,0,0,0,0,0,0,0,3,0,},  
    [8] = {1104,1,"少年之力100","少年之力100",30,"icon_shaonianzhili_4",0,1,0,328,1,3,188,100,0,0,0,0,0,0,0,0,0,0,0,0,4,0,},  
    [9] = {1105,1,"少年之力200","少年之力200",30,"icon_shaonianzhili_5",0,1,0,648,2,3,188,200,0,0,0,0,0,0,0,0,0,0,0,0,5,0,},  
    [10] = {2001,2,"100%通关副本—诸侯并起","诸侯并起",100,"0",1,2,0,112,1005,999,0,1188,3,217,15,1,37,58,1,3,1588888,0,0,0,1,232,},  
    [11] = {2002,2,"100%通关副本—入主冀州","入主冀州",100,"0",1,2,0,112,1006,999,0,1188,3,217,15,1,37,58,1,3,1588888,0,0,0,2,232,},  
    [12] = {2003,2,"100%通关副本—苍岩会战","苍岩会战",100,"0",1,2,0,112,1007,999,0,1188,3,217,15,1,37,58,1,3,1588888,0,0,0,3,232,},  
    [13] = {2004,2,"100%通关副本—奇袭易京","奇袭易京",100,"0",1,2,0,112,1008,999,0,1188,3,217,15,1,37,58,1,3,1588888,0,0,0,4,232,},  
    [14] = {2101,2,"盛夏红莲15","盛夏红莲15",20,"icon_shengxiahl_1",0,1,0,30,2,3,216,15,0,0,0,0,0,0,0,0,0,0,0,0,1,0,},  
    [15] = {2102,2,"盛夏红莲40","盛夏红莲40",30,"icon_shengxiahl_2",0,1,0,98,2,3,216,40,0,0,0,0,0,0,0,0,0,0,0,0,2,0,},  
    [16] = {2103,2,"盛夏红莲80","盛夏红莲80",30,"icon_shengxiahl_3",0,1,0,198,2,3,216,80,0,0,0,0,0,0,0,0,0,0,0,0,3,0,},  
    [17] = {2104,2,"盛夏红莲120","盛夏红莲120",30,"icon_shengxiahl_4",0,1,0,328,1,3,216,120,0,0,0,0,0,0,0,0,0,0,0,0,4,0,},  
    [18] = {2105,2,"盛夏红莲240","盛夏红莲240",30,"icon_shengxiahl_5",0,1,0,648,1,3,216,240,0,0,0,0,0,0,0,0,0,0,0,0,5,0,},
    }
}

local __index_id = {   
    [1001] = 1,  
    [1002] = 2,  
    [1003] = 3,  
    [1004] = 4,  
    [1101] = 5,  
    [1102] = 6,  
    [1103] = 7,  
    [1104] = 8,  
    [1105] = 9,  
    [2001] = 10,  
    [2002] = 11,  
    [2003] = 12,  
    [2004] = 13,  
    [2101] = 14,  
    [2102] = 15,  
    [2103] = 16,  
    [2104] = 17,  
    [2105] = 18,
}

local __key_map = { 
    id = 1,
    young_id = 2,
    desc = 3,
    name = 4,
    discount = 5,
    pic = 6,
    target_show = 7,
    type = 8,
    reset = 9,
    target = 10,
    target_value = 11,
    reward_type_1 = 12,
    reward_value_1 = 13,
    reward_size_1 = 14,
    reward_type_2 = 15,
    reward_value_2 = 16,
    reward_size_2 = 17,
    reward_type_3 = 18,
    reward_value_3 = 19,
    reward_size_3 = 20,
    reward_type_4 = 21,
    reward_value_4 = 22,
    reward_size_4 = 23,
    reward_type_5 = 24,
    reward_value_5 = 25,
    reward_size_5 = 26,
    sort = 27,
    route_id = 28,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_young_task_info")

        return t._raw[__key_map[k]]
    end
}


function young_task_info.getLength()
    return #young_task_info._data
end



function young_task_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_young_task_info
function young_task_info.indexOf(index)
    if index == nil or not young_task_info._data[index] then
        return nil
    end
    return setmetatable({_raw = young_task_info._data[index]}, m)
end



---
--@return @class record_young_task_info
function young_task_info.get(id)
    
    return young_task_info.indexOf(__index_id[ id ])
     
end



function young_task_info.set(id, key, value)
    local record = young_task_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function young_task_info.get_index_data()
    return __index_id 
end

return  young_task_info 