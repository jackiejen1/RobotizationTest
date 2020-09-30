---@classdef record_artifact_purify_attribute_info
local record_artifact_purify_attribute_info = {}


record_artifact_purify_attribute_info.id = 0--id
record_artifact_purify_attribute_info.attribute_type = 0--属性类型
record_artifact_purify_attribute_info.attribute_score_parameter =  ""--属性评分参数
record_artifact_purify_attribute_info.weight = 0--权重
record_artifact_purify_attribute_info.quality_1 = 0--品质1
record_artifact_purify_attribute_info.min_1 = 0--品质1最小值
record_artifact_purify_attribute_info.max_1 = 0--品质1最大值
record_artifact_purify_attribute_info.quality_score_parameter_1 = 0--评分参数1
record_artifact_purify_attribute_info.quality_2 = 0--品质2
record_artifact_purify_attribute_info.min_2 = 0--品质2最小值
record_artifact_purify_attribute_info.max_2 = 0--品质2最大值
record_artifact_purify_attribute_info.quality_score_parameter_2 = 0--评分参数2
record_artifact_purify_attribute_info.quality_3 = 0--品质3
record_artifact_purify_attribute_info.min_3 = 0--品质3最小值
record_artifact_purify_attribute_info.max_3 = 0--品质3最大值
record_artifact_purify_attribute_info.quality_score_parameter_3 = 0--评分参数3
record_artifact_purify_attribute_info.quality_4 = 0--品质4
record_artifact_purify_attribute_info.min_4 = 0--品质4最小值
record_artifact_purify_attribute_info.max_4 = 0--品质4最大值
record_artifact_purify_attribute_info.quality_score_parameter_4 = 0--评分参数4
record_artifact_purify_attribute_info.quality_5 = 0--品质5
record_artifact_purify_attribute_info.min_5 = 0--品质5最小值
record_artifact_purify_attribute_info.max_5 = 0--品质5最大值
record_artifact_purify_attribute_info.quality_score_parameter_5 = 0--评分参数5
record_artifact_purify_attribute_info.quality_6 = 0--品质6
record_artifact_purify_attribute_info.min_6 = 0--品质6最小值
record_artifact_purify_attribute_info.max_6 = 0--品质6最大值
record_artifact_purify_attribute_info.quality_score_parameter_6 = 0--评分参数6
record_artifact_purify_attribute_info.quality_7 = 0--品质7
record_artifact_purify_attribute_info.min_7 = 0--品质7最小值
record_artifact_purify_attribute_info.max_7 = 0--品质7最大值
record_artifact_purify_attribute_info.quality_score_parameter_7 = 0--评分参数7
record_artifact_purify_attribute_info.quality_8 = 0--品质8
record_artifact_purify_attribute_info.min_8 = 0--品质8最小值
record_artifact_purify_attribute_info.max_8 = 0--品质8最大值
record_artifact_purify_attribute_info.quality_score_parameter_8 = 0--评分参数8
record_artifact_purify_attribute_info.max_num = 0--属性最大值

local artifact_purify_attribute_info = {
   _data = {   
    [1] = {1,1,"0.0001",1700,3,235290,352940,1,5,625000,845590,1,6,1323530,1617650,1,7,2794100,3088240,2,8,4900000,5100000,2,0,0,0,0,0,0,0,0,0,0,0,0,5100000,},  
    [2] = {1,2,"0.0019",1700,3,12300,18500,1,5,32800,44500,1,6,69600,85100,1,7,147000,162500,2,8,257800,268400,2,0,0,0,0,0,0,0,0,0,0,0,0,268400,},  
    [3] = {1,5,"0.0038",1700,3,6100,9200,1,5,16400,22200,1,6,34800,42500,1,7,73500,81200,2,8,128900,134200,2,0,0,0,0,0,0,0,0,0,0,0,0,134200,},  
    [4] = {1,11,"7.12",330,3,9,15,1,5,26,36,1,6,55,68,1,7,115,130,2,8,200,215,2,0,0,0,0,0,0,0,0,0,0,0,0,215,},  
    [5] = {1,12,"7.12",330,3,9,15,1,5,26,36,1,6,55,68,1,7,115,130,2,8,200,215,2,0,0,0,0,0,0,0,0,0,0,0,0,215,},  
    [6] = {1,15,"7.12",330,3,9,15,1,5,26,36,1,6,55,68,1,7,115,130,2,8,200,215,2,0,0,0,0,0,0,0,0,0,0,0,0,215,},  
    [7] = {1,101,"7.12",150,3,9,15,1,5,26,36,1,6,55,68,1,7,115,130,2,8,200,215,2,0,0,0,0,0,0,0,0,0,0,0,0,215,},  
    [8] = {1,102,"7.12",150,3,9,15,1,5,26,36,1,6,55,68,1,7,115,130,2,8,200,215,2,0,0,0,0,0,0,0,0,0,0,0,0,215,},  
    [9] = {1,103,"7.12",150,3,9,15,1,5,26,36,1,6,55,68,1,7,115,130,2,8,200,215,2,0,0,0,0,0,0,0,0,0,0,0,0,215,},  
    [10] = {1,104,"7.12",150,3,9,15,1,5,26,36,1,6,55,68,1,7,115,130,2,8,200,215,2,0,0,0,0,0,0,0,0,0,0,0,0,215,},  
    [11] = {1,105,"7.12",150,3,9,15,1,5,26,36,1,6,55,68,1,7,115,130,2,8,200,215,2,0,0,0,0,0,0,0,0,0,0,0,0,215,},  
    [12] = {1,106,"7.12",150,3,9,15,1,5,26,36,1,6,55,68,1,7,115,130,2,8,200,215,2,0,0,0,0,0,0,0,0,0,0,0,0,215,},  
    [13] = {1,201,"7.12",150,3,9,15,1,5,26,36,1,6,55,68,1,7,115,130,2,8,200,215,2,0,0,0,0,0,0,0,0,0,0,0,0,215,},  
    [14] = {1,202,"7.12",150,3,9,15,1,5,26,36,1,6,55,68,1,7,115,130,2,8,200,215,2,0,0,0,0,0,0,0,0,0,0,0,0,215,},  
    [15] = {1,203,"7.12",150,3,9,15,1,5,26,36,1,6,55,68,1,7,115,130,2,8,200,215,2,0,0,0,0,0,0,0,0,0,0,0,0,215,},  
    [16] = {1,204,"7.12",150,3,9,15,1,5,26,36,1,6,55,68,1,7,115,130,2,8,200,215,2,0,0,0,0,0,0,0,0,0,0,0,0,215,},  
    [17] = {1,205,"7.12",120,3,9,15,1,5,26,36,1,6,55,68,1,7,115,130,2,8,200,215,2,0,0,0,0,0,0,0,0,0,0,0,0,215,},  
    [18] = {1,206,"7.12",120,3,9,15,1,5,26,36,1,6,55,68,1,7,115,130,2,8,200,215,2,0,0,0,0,0,0,0,0,0,0,0,0,215,},  
    [19] = {1,207,"7.12",120,3,9,15,1,5,26,36,1,6,55,68,1,7,115,130,2,8,200,215,2,0,0,0,0,0,0,0,0,0,0,0,0,215,},  
    [20] = {1,208,"7.12",120,3,9,15,1,5,26,36,1,6,55,68,1,7,115,130,2,8,200,215,2,0,0,0,0,0,0,0,0,0,0,0,0,215,},  
    [21] = {1,301,"7.12",250,3,9,15,1,5,26,36,1,6,55,68,1,7,115,130,2,8,200,215,2,0,0,0,0,0,0,0,0,0,0,0,0,215,},  
    [22] = {1,302,"7.12",250,3,9,15,1,5,26,36,1,6,55,68,1,7,115,130,2,8,200,215,2,0,0,0,0,0,0,0,0,0,0,0,0,215,},  
    [23] = {1,303,"7.12",250,3,9,15,1,5,26,36,1,6,55,68,1,7,115,130,2,8,200,215,2,0,0,0,0,0,0,0,0,0,0,0,0,215,},  
    [24] = {1,304,"7.12",250,3,9,15,1,5,26,36,1,6,55,68,1,7,115,130,2,8,200,215,2,0,0,0,0,0,0,0,0,0,0,0,0,215,},  
    [25] = {1,305,"7.12",250,3,9,15,1,5,26,36,1,6,55,68,1,7,115,130,2,8,200,215,2,0,0,0,0,0,0,0,0,0,0,0,0,215,},  
    [26] = {1,306,"7.12",250,3,9,15,1,5,26,36,1,6,55,68,1,7,115,130,2,8,200,215,2,0,0,0,0,0,0,0,0,0,0,0,0,215,},  
    [27] = {1,307,"7.12",250,3,9,15,1,5,26,36,1,6,55,68,1,7,115,130,2,8,200,215,2,0,0,0,0,0,0,0,0,0,0,0,0,215,},  
    [28] = {1,308,"7.12",250,3,9,15,1,5,26,36,1,6,55,68,1,7,115,130,2,8,200,215,2,0,0,0,0,0,0,0,0,0,0,0,0,215,},
    }
}

local __index_id_attribute_type = {   
    ["1_1"] = 1,  
    ["1_2"] = 2,  
    ["1_5"] = 3,  
    ["1_11"] = 4,  
    ["1_12"] = 5,  
    ["1_15"] = 6,  
    ["1_101"] = 7,  
    ["1_102"] = 8,  
    ["1_103"] = 9,  
    ["1_104"] = 10,  
    ["1_105"] = 11,  
    ["1_106"] = 12,  
    ["1_201"] = 13,  
    ["1_202"] = 14,  
    ["1_203"] = 15,  
    ["1_204"] = 16,  
    ["1_205"] = 17,  
    ["1_206"] = 18,  
    ["1_207"] = 19,  
    ["1_208"] = 20,  
    ["1_301"] = 21,  
    ["1_302"] = 22,  
    ["1_303"] = 23,  
    ["1_304"] = 24,  
    ["1_305"] = 25,  
    ["1_306"] = 26,  
    ["1_307"] = 27,  
    ["1_308"] = 28,
}

local __key_map = { 
    id = 1,
    attribute_type = 2,
    attribute_score_parameter = 3,
    weight = 4,
    quality_1 = 5,
    min_1 = 6,
    max_1 = 7,
    quality_score_parameter_1 = 8,
    quality_2 = 9,
    min_2 = 10,
    max_2 = 11,
    quality_score_parameter_2 = 12,
    quality_3 = 13,
    min_3 = 14,
    max_3 = 15,
    quality_score_parameter_3 = 16,
    quality_4 = 17,
    min_4 = 18,
    max_4 = 19,
    quality_score_parameter_4 = 20,
    quality_5 = 21,
    min_5 = 22,
    max_5 = 23,
    quality_score_parameter_5 = 24,
    quality_6 = 25,
    min_6 = 26,
    max_6 = 27,
    quality_score_parameter_6 = 28,
    quality_7 = 29,
    min_7 = 30,
    max_7 = 31,
    quality_score_parameter_7 = 32,
    quality_8 = 33,
    min_8 = 34,
    max_8 = 35,
    quality_score_parameter_8 = 36,
    max_num = 37,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_artifact_purify_attribute_info")

        return t._raw[__key_map[k]]
    end
}


function artifact_purify_attribute_info.getLength()
    return #artifact_purify_attribute_info._data
end



function artifact_purify_attribute_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_artifact_purify_attribute_info
function artifact_purify_attribute_info.indexOf(index)
    if index == nil or not artifact_purify_attribute_info._data[index] then
        return nil
    end
    return setmetatable({_raw = artifact_purify_attribute_info._data[index]}, m)
end



---
--@return @class record_artifact_purify_attribute_info
function artifact_purify_attribute_info.get(id,attribute_type)
    
    local k = id .. '_' .. attribute_type
    return artifact_purify_attribute_info.indexOf(__index_id_attribute_type[k])
     
end



function artifact_purify_attribute_info.set(id,attribute_type, key, value)
    local record = artifact_purify_attribute_info.get(id,attribute_type)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function artifact_purify_attribute_info.get_index_data()
    return __index_id_attribute_type 
end

return  artifact_purify_attribute_info 