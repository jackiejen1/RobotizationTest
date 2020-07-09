---@classdef record_artifact_draw_info
local record_artifact_draw_info = {}


record_artifact_draw_info.id = 0--ID
record_artifact_draw_info.weight = 0--权重
record_artifact_draw_info.item_type_1 = 0--物品类型1
record_artifact_draw_info.item_value_1 = 0--物品类型值1
record_artifact_draw_info.item_size_1 = 0--物品数量1
record_artifact_draw_info.weight_type_1 = 0--权重类型1
record_artifact_draw_info.item_weight_1 = 0--权重1
record_artifact_draw_info.item_type_2 = 0--物品类型2
record_artifact_draw_info.item_value_2 = 0--物品类型值2
record_artifact_draw_info.item_size_2 = 0--物品数量2
record_artifact_draw_info.weight_type_2 = 0--权重类型2
record_artifact_draw_info.item_weight_2 = 0--权重2
record_artifact_draw_info.item_type_3 = 0--物品类型3
record_artifact_draw_info.item_value_3 = 0--物品类型值3
record_artifact_draw_info.item_size_3 = 0--物品数量3
record_artifact_draw_info.weight_type_3 = 0--权重类型3
record_artifact_draw_info.item_weight_3 = 0--权重3
record_artifact_draw_info.item_type_4 = 0--物品类型4
record_artifact_draw_info.item_value_4 = 0--物品类型值4
record_artifact_draw_info.item_size_4 = 0--物品数量4
record_artifact_draw_info.weight_type_4 = 0--权重类型4
record_artifact_draw_info.item_weight_4 = 0--权重4
record_artifact_draw_info.item_type_5 = 0--物品类型5
record_artifact_draw_info.item_value_5 = 0--物品类型值5
record_artifact_draw_info.item_size_5 = 0--物品数量5
record_artifact_draw_info.weight_type_5 = 0--权重类型5
record_artifact_draw_info.item_weight_5 = 0--权重5
record_artifact_draw_info.item_type_6 = 0--物品类型6
record_artifact_draw_info.item_value_6 = 0--物品类型值6
record_artifact_draw_info.item_size_6 = 0--物品数量6
record_artifact_draw_info.weight_type_6 = 0--权重类型6
record_artifact_draw_info.item_weight_6 = 0--权重6
record_artifact_draw_info.item_type_7 = 0--物品类型7
record_artifact_draw_info.item_value_7 = 0--物品类型值7
record_artifact_draw_info.item_size_7 = 0--物品数量7
record_artifact_draw_info.weight_type_7 = 0--权重类型7
record_artifact_draw_info.item_weight_7 = 0--权重7
record_artifact_draw_info.item_type_8 = 0--物品类型8
record_artifact_draw_info.item_value_8 = 0--物品类型值8
record_artifact_draw_info.item_size_8 = 0--物品数量8
record_artifact_draw_info.weight_type_8 = 0--权重类型8
record_artifact_draw_info.item_weight_8 = 0--权重8

local artifact_draw_info = {
   _data = {   
    [1] = {1,1000,14,2010,1,2,15,3,56,50,2,100,2,22010,10,2,65,2,21010,3,2,200,2,22010,3,2,200,2,21020,5,2,200,2,22010,1,2,150,3,56,5,2,500,},  
    [2] = {2,1000,14,2020,1,2,15,3,56,50,2,100,2,22020,10,2,65,2,21010,3,2,200,2,22020,3,2,200,2,21020,5,2,200,2,22020,1,2,150,3,56,5,2,500,},  
    [3] = {3,1000,14,2030,1,2,15,3,56,50,2,100,2,22030,10,2,65,2,21010,3,2,200,2,22030,3,2,200,2,21020,5,2,200,2,22030,1,2,150,3,56,5,2,500,},  
    [4] = {4,1000,14,2040,1,2,15,3,56,50,2,100,2,22040,10,2,65,2,21010,3,2,200,2,22040,3,2,200,2,21020,5,2,200,2,22040,1,2,150,3,56,5,2,500,},  
    [5] = {5,1000,14,2050,1,2,15,3,56,50,2,100,2,22050,10,2,65,2,21010,3,2,200,2,22050,3,2,200,2,21020,5,2,200,2,22050,1,2,150,3,56,5,2,500,},  
    [6] = {6,1000,14,2060,1,2,15,3,56,50,2,100,2,22060,10,2,65,2,21010,3,2,200,2,22060,3,2,200,2,21020,5,2,200,2,22060,1,2,150,3,56,5,2,500,},  
    [7] = {999,0,14,1020,1,2,0,3,56,100,2,100,2,22060,10,2,150,2,21010,5,2,250,14,2060,1,2,20,2,22060,2,2,1000,2,22060,1,2,1000,3,56,5,2,500,},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [3] = 3,  
    [4] = 4,  
    [5] = 5,  
    [6] = 6,  
    [999] = 7,
}

local __key_map = { 
    id = 1,
    weight = 2,
    item_type_1 = 3,
    item_value_1 = 4,
    item_size_1 = 5,
    weight_type_1 = 6,
    item_weight_1 = 7,
    item_type_2 = 8,
    item_value_2 = 9,
    item_size_2 = 10,
    weight_type_2 = 11,
    item_weight_2 = 12,
    item_type_3 = 13,
    item_value_3 = 14,
    item_size_3 = 15,
    weight_type_3 = 16,
    item_weight_3 = 17,
    item_type_4 = 18,
    item_value_4 = 19,
    item_size_4 = 20,
    weight_type_4 = 21,
    item_weight_4 = 22,
    item_type_5 = 23,
    item_value_5 = 24,
    item_size_5 = 25,
    weight_type_5 = 26,
    item_weight_5 = 27,
    item_type_6 = 28,
    item_value_6 = 29,
    item_size_6 = 30,
    weight_type_6 = 31,
    item_weight_6 = 32,
    item_type_7 = 33,
    item_value_7 = 34,
    item_size_7 = 35,
    weight_type_7 = 36,
    item_weight_7 = 37,
    item_type_8 = 38,
    item_value_8 = 39,
    item_size_8 = 40,
    weight_type_8 = 41,
    item_weight_8 = 42,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_artifact_draw_info")

        return t._raw[__key_map[k]]
    end
}


function artifact_draw_info.getLength()
    return #artifact_draw_info._data
end



function artifact_draw_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_artifact_draw_info
function artifact_draw_info.indexOf(index)
    if index == nil or not artifact_draw_info._data[index] then
        return nil
    end
    return setmetatable({_raw = artifact_draw_info._data[index]}, m)
end



---
--@return @class record_artifact_draw_info
function artifact_draw_info.get(id)
    
    return artifact_draw_info.indexOf(__index_id[ id ])
     
end



function artifact_draw_info.set(id, key, value)
    local record = artifact_draw_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function artifact_draw_info.get_index_data()
    return __index_id 
end

return  artifact_draw_info 