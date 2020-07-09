---@classdef record_ksoul_honor_info
local record_ksoul_honor_info = {}


record_ksoul_honor_info.id = 0--ID
record_ksoul_honor_info.name =  ""--节点名称
record_ksoul_honor_info.front_node = 0--前置节点
record_ksoul_honor_info.type = 0--节点类型
record_ksoul_honor_info.honor_num = 0--目标荣誉值
record_ksoul_honor_info.affect_type_1 = 0--属性1
record_ksoul_honor_info.affect_value_1 = 0--属性值1
record_ksoul_honor_info.affect_type_2 = 0--属性2
record_ksoul_honor_info.affect_value_2 = 0--属性值2
record_ksoul_honor_info.affect_type_3 = 0--属性3
record_ksoul_honor_info.affect_value_3 = 0--属性值3
record_ksoul_honor_info.affect_type_4 = 0--属性4
record_ksoul_honor_info.affect_value_4 = 0--属性值4
record_ksoul_honor_info.affect_type_5 = 0--属性5
record_ksoul_honor_info.affect_value_5 = 0--属性值5
record_ksoul_honor_info.if_unlock_chapter =  ""--是否解锁图鉴
record_ksoul_honor_info.unlock_chapter_star =  ""--解锁图鉴升星

local ksoul_honor_info = {
   _data = {   
    [1] = {1,"地阴",0,1,400,1,94460,2,4740,3,2460,4,2460,0,0,"0","0",},  
    [2] = {2,"地藏",1,1,700,1,165310,2,8290,3,4300,4,4300,12,50,"0","0",},  
    [3] = {3,"地幽",2,2,1300,1,307010,2,15390,3,7990,4,7990,11,50,"解锁章节：万里扬名","0",},  
    [4] = {4,"地俊",3,1,2000,1,472320,2,23680,3,12290,4,12290,13,50,"0","0",},  
    [5] = {5,"地飞",4,1,2700,1,637630,2,31970,3,16590,4,16590,14,50,"0","0",},  
    [6] = {6,"地狂",5,2,3400,1,802950,2,40260,3,20890,4,20890,12,100,"解锁章节：天下名将","0",},  
    [7] = {7,"地灵",6,1,4100,1,968260,2,48550,3,25190,4,25190,11,100,"0","0",},  
    [8] = {8,"地奇",7,1,4800,1,1133570,2,56840,3,29500,4,29500,13,100,"0","0",},  
    [9] = {9,"地威",8,2,5500,1,1298880,2,65130,3,33800,4,33800,14,100,"解锁章节：人杰地灵","0",},  
    [10] = {10,"地煞",9,1,6200,1,1487810,2,74610,3,38710,4,38710,12,150,"0","0",},  
    [11] = {11,"天剑",10,3,6900,1,1676740,2,84080,3,43630,4,43630,11,150,"0","100级解锁升星：忠肝义胆",},  
    [12] = {12,"天立",11,1,7700,1,1865670,2,93550,3,48540,4,48540,13,150,"0","0",},  
    [13] = {13,"天伤",12,3,8500,1,2054600,2,103030,3,53460,4,53460,14,150,"0","100级解锁升星：万里扬名",},  
    [14] = {14,"天英",13,1,9300,1,2243520,2,112500,3,58380,4,58380,12,200,"0","0",},  
    [15] = {15,"天机",14,3,10100,1,2432450,2,121970,3,63290,4,63290,11,200,"0","100级解锁升星：天下名将",},  
    [16] = {16,"天罡",15,1,10900,1,2621380,2,131450,3,68210,4,68210,13,200,"0","0",},  
    [17] = {17,"天魁",16,3,11700,1,2810310,2,140920,3,73120,4,73120,14,200,"0","100级解锁升星：人杰地灵",},
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
    [16] = 16,  
    [17] = 17,
}

local __key_map = { 
    id = 1,
    name = 2,
    front_node = 3,
    type = 4,
    honor_num = 5,
    affect_type_1 = 6,
    affect_value_1 = 7,
    affect_type_2 = 8,
    affect_value_2 = 9,
    affect_type_3 = 10,
    affect_value_3 = 11,
    affect_type_4 = 12,
    affect_value_4 = 13,
    affect_type_5 = 14,
    affect_value_5 = 15,
    if_unlock_chapter = 16,
    unlock_chapter_star = 17,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_ksoul_honor_info")

        return t._raw[__key_map[k]]
    end
}


function ksoul_honor_info.getLength()
    return #ksoul_honor_info._data
end



function ksoul_honor_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_ksoul_honor_info
function ksoul_honor_info.indexOf(index)
    if index == nil or not ksoul_honor_info._data[index] then
        return nil
    end
    return setmetatable({_raw = ksoul_honor_info._data[index]}, m)
end



---
--@return @class record_ksoul_honor_info
function ksoul_honor_info.get(id)
    
    return ksoul_honor_info.indexOf(__index_id[ id ])
     
end



function ksoul_honor_info.set(id, key, value)
    local record = ksoul_honor_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function ksoul_honor_info.get_index_data()
    return __index_id 
end

return  ksoul_honor_info 