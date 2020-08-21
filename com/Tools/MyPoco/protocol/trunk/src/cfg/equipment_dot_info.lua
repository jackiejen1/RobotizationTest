---@classdef record_equipment_dot_info
local record_equipment_dot_info = {}


record_equipment_dot_info.id =  ""--点化ID
record_equipment_dot_info.stage =  ""--点化阶数
record_equipment_dot_info.next_stage_id =  ""--下一阶数
record_equipment_dot_info.name =  ""--阶段名称
record_equipment_dot_info.res =  ""--关联资源
record_equipment_dot_info.res_2 =  ""--关联资源_2
record_equipment_dot_info.cost_type = 0--点化消耗材料类型
record_equipment_dot_info.cost_value = 0--点化消耗材料类型值
record_equipment_dot_info.cost_size = 0--点化消耗材料数量
record_equipment_dot_info.affect_type_1 = 0--节点1属性类型
record_equipment_dot_info.affect_value_1 = 0--节点1属性类型值
record_equipment_dot_info.affect_type_2 = 0--节点2属性类型
record_equipment_dot_info.affect_value_2 = 0--节点2属性类型值
record_equipment_dot_info.affect_type_3 = 0--节点3属性类型
record_equipment_dot_info.affect_value_3 = 0--节点3属性类型值
record_equipment_dot_info.affect_type_4 = 0--节点4属性类型
record_equipment_dot_info.affect_value_4 = 0--节点4属性类型值
record_equipment_dot_info.affect_type_5 = 0--节点5属性类型
record_equipment_dot_info.affect_value_5 = 0--节点5属性类型值
record_equipment_dot_info.affect_type_6 = 0--节点6属性类型
record_equipment_dot_info.affect_value_6 = 0--节点6属性类型值
record_equipment_dot_info.affect_type_7 = 0--节点7属性类型
record_equipment_dot_info.affect_value_7 = 0--节点7属性类型值
record_equipment_dot_info.affect_type_8 = 0--节点8属性类型
record_equipment_dot_info.affect_value_8 = 0--节点8属性类型值
record_equipment_dot_info.affect_type_9 = 0--节点9属性类型
record_equipment_dot_info.affect_value_9 = 0--节点9属性类型值
record_equipment_dot_info.affect_type_10 = 0--节点10属性类型
record_equipment_dot_info.affect_value_10 = 0--节点10属性类型值
record_equipment_dot_info.talent_id = 0--点化天赋

local equipment_dot_info = {
   _data = {   
    [1] = {101,1,2,"风魂",1,101,3,222,12,2,15800,2,15800,2,15800,1,300700,3,7900,4,7900,0,0,0,0,0,0,0,0,601001,},  
    [2] = {101,2,3,"林魂",2,102,3,223,12,2,22900,2,22900,2,22900,2,22900,1,434900,1,434900,3,11400,4,11400,0,0,0,0,601002,},  
    [3] = {101,3,4,"火魂",3,103,3,224,12,2,42400,2,42400,2,42400,2,42400,1,805400,1,805400,3,21200,4,21200,0,0,0,0,601003,},  
    [4] = {101,4,5,"山魂",4,104,3,225,12,2,76300,2,76300,2,76300,2,76300,1,1449700,1,1449700,3,38200,4,38200,0,0,0,0,601004,},  
    [5] = {101,5,0,"月魂",5,105,3,225,16,2,93300,2,93300,2,93300,2,93300,1,1771900,1,1771900,3,46600,4,46600,0,0,0,0,601005,},  
    [6] = {102,1,2,"风魂",1,101,3,222,12,1,300700,1,300700,1,300700,2,15800,3,7900,4,7900,0,0,0,0,0,0,0,0,601006,},  
    [7] = {102,2,3,"林魂",2,102,3,223,12,1,434900,1,434900,1,434900,1,434900,2,22900,2,22900,3,11400,4,11400,0,0,0,0,601007,},  
    [8] = {102,3,4,"火魂",3,103,3,224,12,1,805400,1,805400,1,805400,1,805400,2,42400,2,42400,3,21200,4,21200,0,0,0,0,601008,},  
    [9] = {102,4,5,"山魂",4,104,3,225,12,1,1449700,1,1449700,1,1449700,1,1449700,2,76300,2,76300,3,38200,4,38200,0,0,0,0,601009,},  
    [10] = {102,5,0,"月魂",5,105,3,225,16,1,1771900,1,1771900,1,1771900,1,1771900,2,93300,2,93300,3,46600,4,46600,0,0,0,0,601010,},  
    [11] = {103,1,2,"风魂",1,101,3,222,12,3,7900,3,7900,3,7900,1,300700,2,15800,4,7900,0,0,0,0,0,0,0,0,601011,},  
    [12] = {103,2,3,"林魂",2,102,3,223,12,3,11400,3,11400,3,11400,3,11400,4,11400,4,11400,1,434900,2,22900,0,0,0,0,601012,},  
    [13] = {103,3,4,"火魂",3,103,3,224,12,3,21200,3,21200,3,21200,3,21200,4,21200,4,21200,1,805400,2,42400,0,0,0,0,601013,},  
    [14] = {103,4,5,"山魂",4,104,3,225,12,3,38200,3,38200,3,38200,3,38200,4,38200,4,38200,1,1449700,2,76300,0,0,0,0,601014,},  
    [15] = {103,5,0,"月魂",5,105,3,225,16,3,46600,3,46600,3,46600,3,46600,4,46600,4,46600,1,1771900,2,93300,0,0,0,0,601015,},  
    [16] = {104,1,2,"风魂",1,101,3,222,12,4,7900,4,7900,4,7900,1,300700,2,15800,3,7900,0,0,0,0,0,0,0,0,601016,},  
    [17] = {104,2,3,"林魂",2,102,3,223,12,4,11400,4,11400,4,11400,4,11400,3,11400,3,11400,1,434900,2,22900,0,0,0,0,601017,},  
    [18] = {104,3,4,"火魂",3,103,3,224,12,4,21200,4,21200,4,21200,4,21200,3,21200,3,21200,1,805400,2,42400,0,0,0,0,601018,},  
    [19] = {104,4,5,"山魂",4,104,3,225,12,4,38200,4,38200,4,38200,4,38200,3,38200,3,38200,1,1449700,2,76300,0,0,0,0,601019,},  
    [20] = {104,5,0,"月魂",5,105,3,225,16,4,46600,4,46600,4,46600,4,46600,3,46600,3,46600,1,1771900,2,93300,0,0,0,0,601020,},  
    [21] = {1,1,2,"风魂",1,101,3,222,12,2,11900,2,11900,2,11900,1,225500,3,5900,4,5900,0,0,0,0,0,0,0,0,601021,},  
    [22] = {1,2,3,"林魂",2,102,3,223,12,2,17200,2,17200,2,17200,2,17200,1,326200,1,326200,3,8600,4,8600,0,0,0,0,601022,},  
    [23] = {1,3,4,"火魂",3,103,3,224,12,2,31800,2,31800,2,31800,2,31800,1,604100,1,604100,3,15900,4,15900,0,0,0,0,601023,},  
    [24] = {1,4,5,"山魂",4,104,3,225,12,2,57200,2,57200,2,57200,2,57200,1,1087300,1,1087300,3,28600,4,28600,0,0,0,0,601024,},  
    [25] = {1,5,0,"月魂",5,105,3,225,16,2,69900,2,69900,2,69900,2,69900,1,1328900,1,1328900,3,35000,4,35000,0,0,0,0,601025,},  
    [26] = {2,1,2,"风魂",1,101,3,222,12,1,225500,1,225500,1,225500,2,11900,3,5900,4,5900,0,0,0,0,0,0,0,0,601026,},  
    [27] = {2,2,3,"林魂",2,102,3,223,12,1,326200,1,326200,1,326200,1,326200,2,17200,2,17200,3,8600,4,8600,0,0,0,0,601027,},  
    [28] = {2,3,4,"火魂",3,103,3,224,12,1,604100,1,604100,1,604100,1,604100,2,31800,2,31800,3,15900,4,15900,0,0,0,0,601028,},  
    [29] = {2,4,5,"山魂",4,104,3,225,12,1,1087300,1,1087300,1,1087300,1,1087300,2,57200,2,57200,3,28600,4,28600,0,0,0,0,601029,},  
    [30] = {2,5,0,"月魂",5,105,3,225,16,1,1328900,1,1328900,1,1328900,1,1328900,2,69900,2,69900,3,35000,4,35000,0,0,0,0,601030,},  
    [31] = {3,1,2,"风魂",1,101,3,222,12,3,5900,3,5900,3,5900,1,225500,2,11900,4,5900,0,0,0,0,0,0,0,0,601031,},  
    [32] = {3,2,3,"林魂",2,102,3,223,12,3,8600,3,8600,3,8600,3,8600,4,8600,4,8600,1,326200,2,17200,0,0,0,0,601032,},  
    [33] = {3,3,4,"火魂",3,103,3,224,12,3,15900,3,15900,3,15900,3,15900,4,15900,4,15900,1,604100,2,31800,0,0,0,0,601033,},  
    [34] = {3,4,5,"山魂",4,104,3,225,12,3,28600,3,28600,3,28600,3,28600,4,28600,4,28600,1,1087300,2,57200,0,0,0,0,601034,},  
    [35] = {3,5,0,"月魂",5,105,3,225,16,3,35000,3,35000,3,35000,3,35000,4,35000,4,35000,1,1328900,2,69900,0,0,0,0,601035,},  
    [36] = {4,1,2,"风魂",1,101,3,222,12,4,5900,4,5900,4,5900,1,225500,2,11900,3,5900,0,0,0,0,0,0,0,0,601036,},  
    [37] = {4,2,3,"林魂",2,102,3,223,12,4,8600,4,8600,4,8600,4,8600,3,8600,3,8600,1,326200,2,17200,0,0,0,0,601037,},  
    [38] = {4,3,4,"火魂",3,103,3,224,12,4,15900,4,15900,4,15900,4,15900,3,15900,3,15900,1,604100,2,31800,0,0,0,0,601038,},  
    [39] = {4,4,5,"山魂",4,104,3,225,12,4,28600,4,28600,4,28600,4,28600,3,28600,3,28600,1,1087300,2,57200,0,0,0,0,601039,},  
    [40] = {4,5,0,"月魂",5,105,3,225,16,4,35000,4,35000,4,35000,4,35000,3,35000,3,35000,1,1328900,2,69900,0,0,0,0,601040,},
    }
}

local __index_id_stage = {   
    ["101_1"] = 1,  
    ["101_2"] = 2,  
    ["101_3"] = 3,  
    ["101_4"] = 4,  
    ["101_5"] = 5,  
    ["102_1"] = 6,  
    ["102_2"] = 7,  
    ["102_3"] = 8,  
    ["102_4"] = 9,  
    ["102_5"] = 10,  
    ["103_1"] = 11,  
    ["103_2"] = 12,  
    ["103_3"] = 13,  
    ["103_4"] = 14,  
    ["103_5"] = 15,  
    ["104_1"] = 16,  
    ["104_2"] = 17,  
    ["104_3"] = 18,  
    ["104_4"] = 19,  
    ["104_5"] = 20,  
    ["1_1"] = 21,  
    ["1_2"] = 22,  
    ["1_3"] = 23,  
    ["1_4"] = 24,  
    ["1_5"] = 25,  
    ["2_1"] = 26,  
    ["2_2"] = 27,  
    ["2_3"] = 28,  
    ["2_4"] = 29,  
    ["2_5"] = 30,  
    ["3_1"] = 31,  
    ["3_2"] = 32,  
    ["3_3"] = 33,  
    ["3_4"] = 34,  
    ["3_5"] = 35,  
    ["4_1"] = 36,  
    ["4_2"] = 37,  
    ["4_3"] = 38,  
    ["4_4"] = 39,  
    ["4_5"] = 40,
}

local __key_map = { 
    id = 1,
    stage = 2,
    next_stage_id = 3,
    name = 4,
    res = 5,
    res_2 = 6,
    cost_type = 7,
    cost_value = 8,
    cost_size = 9,
    affect_type_1 = 10,
    affect_value_1 = 11,
    affect_type_2 = 12,
    affect_value_2 = 13,
    affect_type_3 = 14,
    affect_value_3 = 15,
    affect_type_4 = 16,
    affect_value_4 = 17,
    affect_type_5 = 18,
    affect_value_5 = 19,
    affect_type_6 = 20,
    affect_value_6 = 21,
    affect_type_7 = 22,
    affect_value_7 = 23,
    affect_type_8 = 24,
    affect_value_8 = 25,
    affect_type_9 = 26,
    affect_value_9 = 27,
    affect_type_10 = 28,
    affect_value_10 = 29,
    talent_id = 30,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_equipment_dot_info")

        return t._raw[__key_map[k]]
    end
}


function equipment_dot_info.getLength()
    return #equipment_dot_info._data
end



function equipment_dot_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_equipment_dot_info
function equipment_dot_info.indexOf(index)
    if index == nil or not equipment_dot_info._data[index] then
        return nil
    end
    return setmetatable({_raw = equipment_dot_info._data[index]}, m)
end



---
--@return @class record_equipment_dot_info
function equipment_dot_info.get(id,stage)
    
    local k = id .. '_' .. stage
    return equipment_dot_info.indexOf(__index_id_stage[k])
     
end



function equipment_dot_info.set(id,stage, key, value)
    local record = equipment_dot_info.get(id,stage)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function equipment_dot_info.get_index_data()
    return __index_id_stage 
end

return  equipment_dot_info 