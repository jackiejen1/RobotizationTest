---@classdef record_artifact_compose_info
local record_artifact_compose_info = {}


record_artifact_compose_info.id =  ""--id
record_artifact_compose_info.arrange = 0--排序
record_artifact_compose_info.name =  ""--组合名称
record_artifact_compose_info.artifact_1 = 0--神器1
record_artifact_compose_info.artifact_2 = 0--神器2
record_artifact_compose_info.artifact_3 = 0--神器3
record_artifact_compose_info.affect_type_1 = 0--加成属性1
record_artifact_compose_info.affect_value_1 = 0--加成类型值1
record_artifact_compose_info.affect_type_2 = 0--加成属性2
record_artifact_compose_info.affect_value_2 = 0--加成类型值2
record_artifact_compose_info.affect_type_3 = 0--加成属性3
record_artifact_compose_info.affect_value_3 = 0--加成类型值3
record_artifact_compose_info.affect_type_4 = 0--加成属性4
record_artifact_compose_info.affect_value_4 = 0--加成类型值4

local artifact_compose_info = {
   _data = {   
    [1] = {1,1,"定军燕落",1010,1020,0,2,1300,1,25000,0,0,0,0,},  
    [2] = {2,2,"霸王断魂",2010,2020,0,2,14000,1,270000,0,0,0,0,},  
    [3] = {3,3,"卧龙宝具",2040,2050,0,1,270000,5,7000,0,0,0,0,},  
    [4] = {4,4,"剑拭天下",2030,2060,0,2,14000,5,7000,0,0,0,0,},  
    [5] = {5,5,"弦断龙魂",3020,3060,0,2,35000,1,670000,11,100,0,0,},  
    [6] = {6,6,"怒目美人",3010,3050,0,5,18000,1,670000,15,100,0,0,},  
    [7] = {7,7,"青芒星耀",3030,3040,0,2,30000,5,20000,12,100,0,0,},  
    [8] = {8,8,"倚天+天宫",4010,4020,0,2,70000,5,40000,12,150,0,0,},
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
}

local __key_map = { 
    id = 1,
    arrange = 2,
    name = 3,
    artifact_1 = 4,
    artifact_2 = 5,
    artifact_3 = 6,
    affect_type_1 = 7,
    affect_value_1 = 8,
    affect_type_2 = 9,
    affect_value_2 = 10,
    affect_type_3 = 11,
    affect_value_3 = 12,
    affect_type_4 = 13,
    affect_value_4 = 14,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_artifact_compose_info")

        return t._raw[__key_map[k]]
    end
}


function artifact_compose_info.getLength()
    return #artifact_compose_info._data
end



function artifact_compose_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_artifact_compose_info
function artifact_compose_info.indexOf(index)
    if index == nil or not artifact_compose_info._data[index] then
        return nil
    end
    return setmetatable({_raw = artifact_compose_info._data[index]}, m)
end



---
--@return @class record_artifact_compose_info
function artifact_compose_info.get(id)
    
    return artifact_compose_info.indexOf(__index_id[ id ])
     
end



function artifact_compose_info.set(id, key, value)
    local record = artifact_compose_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function artifact_compose_info.get_index_data()
    return __index_id 
end

return  artifact_compose_info 